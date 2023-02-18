Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C4FC61DA4
	for <webhook@archiver.kernel.org>; Sat, 18 Feb 2023 10:03:40 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.9173.1676714612395106496
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Feb 2023 02:03:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bY+5Tq4e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id bg7-20020a05600c3c8700b003dc57ea0dfeso339776wmb.0
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Feb 2023 02:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6LSupgq3DQp0T2CdxG/AgXlVDh/yR4pMnOsoROpHCxw=;
        b=bY+5Tq4eoHIeCWPhxSUzpJm/Qc58ExufAhcOneUd2fAK01TUAmhrKZ+d8X66/oxZUk
         jLZoRUVMULfh43HzXQAjRqaPIQTH8iZTqVwYJvV/ay0n7DHakboTQ26PQUmUDmCknje0
         PDOvLBAqBPKbbx/jQqPWZXMVhO2jAIt+zTFgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6LSupgq3DQp0T2CdxG/AgXlVDh/yR4pMnOsoROpHCxw=;
        b=groPWd9pPdT9tMaVmiQ2HIdDTHW6m3zoLeVIWCv1WDF3wweraFRPENrIbmJE9g27Lt
         9f4jOp/5PhXAFwbnb+sKZGqn79u9WB0i3oqKoqkCvBq8jbTUWp/iBSj6MJuiFVllH7SO
         FVfd58WZ1f2lAsomVv7n1dFjmBiXkcnEc0rAhjwOZjA8RPdjDREKjlZ/1HLEOrB795nH
         z9jIGiFT34sw4OQVAH8XWkkzSOj9CN11KHkpLyP9QxkRwrWi7RIx8h7MfJulYYP8Eb5v
         wnHN3xDH2OSPmUpp7Z4rc7iSRfjvJEmvAuFQM9hX+3RoTDunuTsnbsN4ZeaKtnGV4S7C
         09ng==
X-Gm-Message-State: AO0yUKUj3fX7ZB2DvwwUsT3CCs4WqB3jNW6VPCNervAo6ah2dIPKqVUg
	vrEovjSelsEZ7vg0G6TCK9L6wQ==
X-Google-Smtp-Source: AK7set/nHQgPBk63I0RA/Potzss5Vg3+4Hw9XJj8mSWnj53723M6DXxb0B6D8pMQsMlCC5AXwzCurg==
X-Received: by 2002:a05:600c:4393:b0:3e2:8f1:7684 with SMTP id e19-20020a05600c439300b003e208f17684mr7625588wmn.33.1676714610644;
        Sat, 18 Feb 2023 02:03:30 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3a5f:cbf5:6ff0:a5e0? ([2001:8b0:aba:5f3c:3a5f:cbf5:6ff0:a5e0])
        by smtp.gmail.com with ESMTPSA id hn30-20020a05600ca39e00b003db03725e86sm7756078wmb.8.2023.02.18.02.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Feb 2023 02:03:30 -0800 (PST)
Message-ID: <e7d4132ccc266907cbabdce95a0ecf7ab8039109.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH 1/2] Revert "tar: Fix CVE-2022-48303"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joe Slater <joe.slater@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, rodolfo.zumbado@windriver.com
Date: Sat, 18 Feb 2023 10:03:29 +0000
In-Reply-To: <20230217230123.579622-1-joe.slater@windriver.com>
References: <20230217230123.579622-1-joe.slater@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Feb 2023 10:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177317

On Fri, 2023-02-17 at 15:01 -0800, Joe Slater wrote:
> This reverts commit 4573a584397f197fbc9170abec3c590ea36667f7.
>=20
> A fix is available from gnu.
>=20
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../tar/files/CVE-2022-48303.patch            | 36 -------------------
>  meta/recipes-extended/tar/tar_1.34.bb         |  4 +--
>  2 files changed, 1 insertion(+), 39 deletions(-)
>  delete mode 100644 meta/recipes-extended/tar/files/CVE-2022-48303.patch
>=20
> diff --git a/meta/recipes-extended/tar/files/CVE-2022-48303.patch b/meta/=
recipes-extended/tar/files/CVE-2022-48303.patch
> deleted file mode 100644
> index a8e9f4ac7d..0000000000
> --- a/meta/recipes-extended/tar/files/CVE-2022-48303.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 1d530107a24d71e798727d7f0afa0833473d1074 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Matej=3D20Mu=3DC5=3DBEila?=3D <mmuzila@gmail.com>
> -Date: Wed, 11 Jan 2023 08:55:58 +0100
> -Subject: [PATCH] Fix savannah bug #62387
> -
> -* src/list.c (from_header): Check for the end of field after leading byt=
e
> -  (0x80 or 0xff) of base-256 encoded header value
> -
> -Upstream-Status: Backport
> -[https://savannah.gnu.org/patch/download.php?file_id=3D54212]
> -CVE: CVE-2022-48303
> -Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> ----
> - src/list.c | 6 ++++++
> - 1 file changed, 6 insertions(+)
> -
> -diff --git a/src/list.c b/src/list.c
> -index 9fafc425..bf41b581 100644
> ---- a/src/list.c
> -+++ b/src/list.c
> -@@ -895,6 +895,12 @@ from_header (char const *where0, size_t digs, char =
const *type,
> - 			   << (CHAR_BIT * sizeof (uintmax_t)
> - 			       - LG_256 - (LG_256 - 2)));
> -       value =3D (*where++ & ((1 << (LG_256 - 2)) - 1)) - signbit;
> -+      if (where =3D=3D lim)
> -+        {
> -+          if (type && !silent)
> -+            ERROR ((0, 0, _("Archive base-256 value is invalid")));
> -+          return -1;
> -+        }
> -       for (;;)
> - 	{
> - 	  value =3D (value << LG_256) + (unsigned char) *where++;
> ---=20
> -2.38.1
> -
> diff --git a/meta/recipes-extended/tar/tar_1.34.bb b/meta/recipes-extende=
d/tar/tar_1.34.bb
> index 22c04ba70a..7307cd57a2 100644
> --- a/meta/recipes-extended/tar/tar_1.34.bb
> +++ b/meta/recipes-extended/tar/tar_1.34.bb
> @@ -6,9 +6,7 @@ SECTION =3D "base"
>  LICENSE =3D "GPL-3.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> =20
> -SRC_URI =3D "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
> -           file://CVE-2022-48303.patch \
> -           "
> +SRC_URI =3D "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2"
> =20
>  SRC_URI[sha256sum] =3D "b44cc67f8a1f6b0250b7c860e952b37e8ed932a90bd9b186=
2a511079255646ff"
> =20

I appreciate why you've done this as a revert however I think it will
send out the wrong message when you view it in the changelog. I'd much
prefer we just have a single patch which updates the patch to the new
version.

I've squeshed these two commits together and tweaked the commit message
in this case for testing.

Cheers,

Richard

