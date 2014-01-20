Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 203566CBB4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 16:57:27 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d17so3552921eek.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 08:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0tfFsh2NBhDSUxvt0rsxnvKnIDFOhRUYwenurRB6Hak=;
	b=sKSCUWjRp/lUYQ1HOMCixCg/9wG8/sLX696Ild3A3g1nyVZTnQW74lnxwxgsOQRvYO
	jkht1WaO7sKPeHL7ZqIdWT8bOLvCKeKOc5CjGCO7tL5C3GMiFnoajT6CRuYtF4uIlcF2
	ugSwF6LACi7CrDHNN0elZlcQd0KIuynG3yGRawBrW2YHThY1Zc2AnLCS2enGRdN6Q23+
	3iJquqaYXd9U6W9og53GwnKbuEjOi4S8VhQ01AW6KgSy/IwPWEWWzeC8DdLruYB64OlF
	XW6TrqamvVtwuA7v4cksB/xpfmWcWxspawUyjCZPYnoouQyRcCtKIbT/bgXXE6g9aOfU
	21nQ==
X-Received: by 10.14.206.198 with SMTP id l46mr8900278eeo.35.1390237048705;
	Mon, 20 Jan 2014 08:57:28 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id x2sm5034915eeo.8.2014.01.20.08.57.26
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jan 2014 08:57:27 -0800 (PST)
Date: Mon, 20 Jan 2014 17:57:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20140120165727.GI5565@jama>
References: <1390236004-18570-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0LZ2HFJ1QAyRYW9XXOrkttW5UOenkuFK29Z_R9si4sJCRA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ2HFJ1QAyRYW9XXOrkttW5UOenkuFK29Z_R9si4sJCRA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] kdbus: add git version
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
X-List-Received-Date: Mon, 20 Jan 2014 16:57:29 -0000
X-Groupsio-MsgNum: 49230
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fKov5AqTsvseSZ0Z"
Content-Disposition: inline

--fKov5AqTsvseSZ0Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2014 at 04:49:29PM +0000, Burton, Ross wrote:
> On 20 January 2014 16:40, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > This builds the kernel portion of the kdbus implementation. Userspace s=
upport needs systemd git and/or a special glib-2.0 branch.
>=20
> As awesome as kdbus could be it's very much fresh code, can this live
> outside of oe-core for now?

FWIW: it will be welcome with new systemd version in meta-openembedded/meta=
-systemd

Only disadvantage of it will be that current DEFAULT_PREFERENCE behavior
doesn't allow to demote this "experimental" version. So people using
meta-systemd will always get this one unless they set PREFERRED_VERSION
to version in oe-core.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2964

> Great to see it though, presumably you'll be making recipes for
> systemd/glib?  For what it's worth you might find
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dross/g=
tk3git&id=3Dfc7c87f1f038f7b816318e2102ecb1c67ec50065
> useful for the glib part after changing SRCREV (been meaning to send
> that in for ages).
>=20
> Ross
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fKov5AqTsvseSZ0Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLdVXcACgkQN1Ujt2V2gBwTvQCfeQnFTxq2zuxwX9674FZ92B8G
CX0An1a3/bc0vPvNy+3DWY9NpC2Ll33a
=PteA
-----END PGP SIGNATURE-----

--fKov5AqTsvseSZ0Z--
