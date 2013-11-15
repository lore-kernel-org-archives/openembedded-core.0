Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id A69996D2C5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 21:36:38 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id d41so621265eek.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 13:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4JcbXHd6IEamamufQUObcT5dqWjE+aarMu2qdtvP+I0=;
	b=lnz98Lk+/tMscsvPBUZWUwwXJJVCHbXz93kq0SzHSOOpVZdM8OQ1xAIHPUdFRajepr
	A04IaIxX4erZey3/lnIOBW3E94P1Vh3cnV89Jb64FXTBEdtLzTshhVNsoX/p2/rZRxKe
	GEMxBsi3jQ6s3hFowdLrGycbBKwiKbHEVzS0n3MKo7DfDrYWhYBw8kEooQGlR0FIV+wY
	CVrkNCfT/NcmYADQRiLQS73hErOu2d24gjTYWqvx2vqd4Bj6w4Sb/diiSwXeD/qGSXBX
	jm7aTaJAsrkpgzT31LlfasyJSSPYIIT7Cu3qD85F29DwueY884Y5yPXpfb5RKZQkH2p+
	5oIw==
X-Received: by 10.14.103.133 with SMTP id f5mr5160806eeg.48.1384551400189;
	Fri, 15 Nov 2013 13:36:40 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id a6sm10098367eei.10.2013.11.15.13.36.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Nov 2013 13:36:39 -0800 (PST)
Date: Fri, 15 Nov 2013 22:37:05 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20131115213705.GE31430@jama>
References: <20131112103426.B32915026B@opal>
MIME-Version: 1.0
In-Reply-To: <20131112103426.B32915026B@opal>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [oe-commits] Ross Burton : glib-2.0: move more logic to the .inc
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
X-List-Received-Date: Fri, 15 Nov 2013 21:36:39 -0000
X-Groupsio-MsgNum: 47147
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KJY2Ze80yH5MUxol"
Content-Disposition: inline

--KJY2Ze80yH5MUxol
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2013 at 10:34:26AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 55b950500fd9d944042e3c2b0872685f0a60e8eb
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D55b950500fd9d944042e3c2b0872685f0a60e8eb
>=20
> Author: Ross Burton <ross.burton@intel.com>
> Date:   Fri Nov  8 16:06:38 2013 +0000
>=20
> glib-2.0: move more logic to the .inc
>=20
> The .bb was getting larger with configuration being arbitarily split betw=
een .bb
> and .inc.  To help adding a glib_git recipe, strip the .bb down to SRC_UR=
I.
>=20
> Also don't remove $libdir/gio as it should be owned by glib.

IIRC we had fix for this QA warning before and now I see it again:

WARNING: QA Issue: glib-2.0-dbg: found library in wrong location:
/usr/share/gdb/auto-load/usr/lib64/libgobject-2.0.so.0.3800.1-gdb.py
glib-2.0-dbg: found library in wrong location:
/usr/share/gdb/auto-load/usr/lib64/libglib-2.0.so.0.3800.1-gdb.py

Is it possible that something was left out? I don't know since when I
have this warning, so it could be since last glib-2.0 upgrade as well.


--KJY2Ze80yH5MUxol
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEUEARECAAYFAlKGlAEACgkQN1Ujt2V2gBzvuQCYyDS6lwxs9DzVH1XtF8vBOCCP
7ACeM+3u/DQ+BoA+wNNTcxVIPZNz6TE=
=K3vW
-----END PGP SIGNATURE-----

--KJY2Ze80yH5MUxol--
