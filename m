Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2993A60588
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 12:09:56 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b14so2529970wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 04:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2lchBAJT+jzoHU9atPXfUag9pxXlg6GoDaezdUL9xaE=;
	b=FBZT90e2W5nhkm3tBqlRzj0uuh6+KZQUKTLiuDjYNlJW/YcdwPXGQDvajnLekLtiq7
	g1VWHgqG/yIoIs2bqb/a5XCG4qNclrrVyKe+bL87nhqG1T9qoLDJF5oe+xIreOCKNX0h
	xW9RNumkSdJrto4n8hb1HgP6SVoP3eLOU1jiD3gR8dli/Fa/iwdmiGwFXNxHQ8Dm76lu
	VAFbTexQ+E0lQX+OvRpglmJDcGELPBQC36RsjmjesDjF6KBQW0hcCwWuYeb1Hq/2+QAv
	ZjlAwzIzq4PEvRmc9AagtdbftkqW1ec/NjZ8h4ILmxAplMSm0ezLXgzsGUcQvYKXAO4i
	WfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=2lchBAJT+jzoHU9atPXfUag9pxXlg6GoDaezdUL9xaE=;
	b=dB6CX474Nuo1LmMiARgMxGYw1CxumaGL4gNejGogmJcvtrctPNt+LQ0gQp4EVjd5BI
	56AYZcFn6HFAf5lP1/obUfS2nJhkkKn/KwW2pD2gMsgRHwZ/3Rv0VeYiX/aMRbPvANow
	sZR0b4Qes2eva8D44upmYuBUgwuDwRTn0BGTNMFWZZSEOv9DXn8xWm3QHxorqYgNrN49
	t+FLVC45GsSMzgPmHpWG+evwxSObIor9Vr7qgnHqsTfKDRp/oT50Ga8UOAPIAkMQ6D+B
	U73wfklerWzQXYnHL9rZuSNuJtpbMD3PFnJW9NSEbj/cNvkLcrU8qSqYIPl8BqIc7RNZ
	PoMA==
X-Gm-Message-State: AG10YOQS2ntCttp1VwyIPStHuYctC8L38KbqrrapS9KC7eHJmJ1J8+GgJYE0LcLnhSBRWw==
X-Received: by 10.28.19.76 with SMTP id 73mr3159164wmt.24.1452859797322;
	Fri, 15 Jan 2016 04:09:57 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	s129sm2267011wmf.18.2016.01.15.04.09.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jan 2016 04:09:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 15 Jan 2016 13:10:53 +0100
To: Joshua Lock <joshuagloe@gmail.com>
Message-ID: <20160115121053.GB2607@jama>
References: <cover.1450877679.git.joshua.lock@collabora.co.uk>
MIME-Version: 1.0
In-Reply-To: <cover.1450877679.git.joshua.lock@collabora.co.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/9] Proposed changes for fido
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
X-List-Received-Date: Fri, 15 Jan 2016 12:09:57 -0000
X-Groupsio-MsgNum: 76145
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i0/AhcQY5QxfSsSZ"
Content-Disposition: inline

--i0/AhcQY5QxfSsSZ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 23, 2015 at 01:40:36PM +0000, Joshua Lock wrote:
> From: Joshua Lock <joshua.lock@collabora.co.uk>
>=20
> Please consider the following fixes, available in the joshuagl/fido-next
> branch of openembedded-core-contrib, for the fido branch.

When is this going to be merged?

> Regards,
>=20
> Joshua
>=20
> The following changes since commit 9f339f516ab03d598fae0e536b3a420ea4d8ee=
1a:
>=20
>   bash: Disable custom memory allocator (2015-11-20 15:46:27 +0000)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib joshuagl/fido-next
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Djoshuagl/fido-next
>=20
> Armin Kuster (1):
>   libxml2: fix CVE-2015-7942 and CVE-2015-8035
>=20
> Bhuvanchandra DV (1):
>   linux-firmware: rtl8192cx: Add latest available firmware
>=20
> Martin Jansa (2):
>   linux-dtb.inc: drop unused DTB_NAME variable from do_install
>   feature-arm-thumb.inc: Fix ARMPKGSFX_THUMB value
>=20
> Mike Crowe (1):
>   allarch: Force TARGET_*FLAGS variable values
>=20
> Richard Purdie (2):
>   layer.conf: Add several allarch dependency exclusions
>   layer.conf: Add missing dependency for allarch package
>     initramfs-framework
>=20
> Sona Sarmadi (1):
>   bind: CVE-2015-8000
>=20
> Stefan M=FCller-Klieser (1):
>   gcc-4.9: backport from gcc trunk r212178
>=20
>  meta/classes/allarch.bbclass                       |   4 +
>  meta/conf/layer.conf                               |  11 ++
>  .../conf/machine/include/arm/feature-arm-thumb.inc |   2 +-
>  .../bind/bind/CVE-2015-8000.patch                  | 194 +++++++++++++++=
++++++
>  meta/recipes-connectivity/bind/bind_9.9.5.bb       |   1 +
>  meta/recipes-core/libxml/libxml2.inc               |   2 +
>  .../libxml/libxml2/CVE-2015-7942.patch             |  55 ++++++
>  .../libxml/libxml2/CVE-2015-8035.patch             |  41 +++++
>  meta/recipes-devtools/gcc/gcc-4.9.inc              |   1 +
>  ...racking.c-backport-from-gcc-trunk-r212178.patch |  39 +++++
>  .../linux-firmware/linux-firmware_git.bb           |   4 +-
>  meta/recipes-kernel/linux/linux-dtb.inc            |   1 -
>  12 files changed, 351 insertions(+), 4 deletions(-)
>  create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-8000.pat=
ch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8035.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0062-gcc-var-tracki=
ng.c-backport-from-gcc-trunk-r212178.patch
>=20
> --
> 2.5.0
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--i0/AhcQY5QxfSsSZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaY4cwACgkQN1Ujt2V2gBy8EgCeLEz4dQNCCv7Ef+9IoPKue8+i
4xsAnjEktQC2SZ7BmajBCYzOCn/3cHsr
=au0U
-----END PGP SIGNATURE-----

--i0/AhcQY5QxfSsSZ--
