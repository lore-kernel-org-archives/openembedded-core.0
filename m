Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 176D260111
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 16:51:43 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so206948444wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 08:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VnP0iOmnBC4ZhJftQkif/MLDlM7+xLGLx5VwjmjDk4M=;
	b=i+AfEGaXVez9aR3TNi+nrq1LhRHEOkFM+dngBAOU+Wr2o4xye/l4PvcKL7TPsTRVRK
	AGEpr2FxtvPsXhHwGVI1Dt70p1T5q5+8ITQ+55VJyptpGmjsApRlTCrjDQ8abgxJfbY9
	Ug+M7Qtbh+J44XVhCyZzZ09+9WxyA8SL07GXJW3Ysk/f/KA4LoYstknEYH1Cj6uqoPIc
	Oo8xpAxslc4BBFcRtb5o+UGvdmRhsIsY+cDTfg/z3LItzvZEpLOKZSS4yMgGca+bf+0o
	tiIiTxIzZ54Ji2K0W672Hf0/yxmfD4iChijzQ1sm6l8VFGJO4KcgxW88sEHKP7ltppnM
	Bk/w==
X-Received: by 10.194.185.234 with SMTP id ff10mr3067527wjc.170.1447865504302; 
	Wed, 18 Nov 2015 08:51:44 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	wh10sm3676157wjb.45.2015.11.18.08.51.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Nov 2015 08:51:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 18 Nov 2015 17:51:58 +0100
To: Phil Blundell <pb@pbcl.net>
Message-ID: <20151118165158.GE2213@jama>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
	<e58d22785b2a1d629653c2f6ba32e26e4eb8ffa6.1447757562.git.Martin.Jansa@gmail.com>
	<1447864714.1472.54.camel@pbcl.net>
MIME-Version: 1.0
In-Reply-To: <1447864714.1472.54.camel@pbcl.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 11/16] arch-armv7ve: add tune include for armv7ve and use it from cortexa7 and cortexa15
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Nov 2015 16:51:44 -0000
X-Groupsio-MsgNum: 73642
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RpqchZ26BWispMcB"
Content-Disposition: inline

--RpqchZ26BWispMcB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2015 at 04:38:34PM +0000, Phil Blundell wrote:
> On Tue, 2015-11-17 at 11:58 +0100, Martin Jansa wrote:
> > * be aware that this -march value is available only in gcc-4.9 and
> >   newer:
> >   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D57907
> >=20
>=20
> Can you clarify why this is an improvement?  The previous patch already
> changed cortex-a15.inc to use -mcpu=3Dcortexa15, which effectively
> implies -march=3Darmv7ve already (and works on all gcc versions) so I'm
> not entirely sure what this second patch really buys you.

Because -mcpu=3Dcortexa15 and -march=3Darmv7a conflict each other, so we
either have to stop putting -march in default CCARGS or at least set
compatible one like this patch does.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RpqchZ26BWispMcB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZMrKsACgkQN1Ujt2V2gBy3LgCfes8MB7Pk1BZq+r724cU1iUZe
LQIAnRZOYv0mf3Y/PqJniXq8AlsWsduD
=QyB9
-----END PGP SIGNATURE-----

--RpqchZ26BWispMcB--
