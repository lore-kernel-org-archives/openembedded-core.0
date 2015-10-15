Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0E222770CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 11:07:56 +0000 (UTC)
Received: by wijq8 with SMTP id q8so124040490wij.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 04:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8e5L/kBFM8yPx73RloNMI1mXh89G10Ux+j0PfRT4lrM=;
	b=KMkjasUGyfKLXX01EZc8EWscIweQq+hM9CyShfARu92DknoDsgAwvYmmZAxGCoCHr2
	QFogoVRiziKaVICDS33e+Z4SxXCvWnUqIPJKqd0oOkgWtjRHwi8vK+BIlGlh/B5Qr9XV
	3IPh0Y9WMjKAGo0MQqZHLbJuZOeTVouzaPz8jOlW62lsW0McgywuhsCGKzZCe2t30vAv
	xKwCNHx9dvCSCMgGb3Lbvy1u9odjMzqa2wiUfabu1OMZ7e3SW52yRN3z9JXlF5OCSEsI
	vHotjNDuthAuW8zElGOR4/34cS6kV1l9zMBDO1sevL27pZZGAsBtlUPGhINFHyoLRfY6
	zXjQ==
X-Received: by 10.194.22.231 with SMTP id h7mr9972914wjf.59.1444907276086;
	Thu, 15 Oct 2015 04:07:56 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id e6sm23161494wiy.3.2015.10.15.04.07.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Oct 2015 04:07:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 15 Oct 2015 13:08:17 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20151015110817.GA2588@jama>
References: <1405530244-16849-1-git-send-email-Martin.Jansa@gmail.com>
	<1444821692-31980-1-git-send-email-Martin.Jansa@gmail.com>
	<E583B37D-93A8-4D9E-83BC-B158FE9B5B00@gmail.com>
MIME-Version: 1.0
In-Reply-To: <E583B37D-93A8-4D9E-83BC-B158FE9B5B00@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] icu: force arm mode
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
X-List-Received-Date: Thu, 15 Oct 2015 11:07:59 -0000
X-Groupsio-MsgNum: 72218
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline

--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2015 at 11:40:35PM -0700, Khem Raj wrote:
>=20
> > On Oct 14, 2015, at 4:21 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> >=20
> > +# http://errors.yoctoproject.org/Errors/Details/20486/
> > +ARM_INSTRUCTION_SET_armv4 =3D "arm"
> > +ARM_INSTRUCTION_SET_armv5 =3D "arm"
> > +
>=20
> would it make sense to have it for armv4t and armv5t only
> since thumb may not be possible on sub arches without 't'

I don't think there is override like that and setting it for arches
without 't' does no harm as it's set for them anyway.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYfiSAACgkQN1Ujt2V2gBxTYQCfW0jjmgANQhP9mk4ykWz87uyu
+ewAn25v2LwhM+oOQ2rLZVsTudcpnVmt
=H7Lr
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
