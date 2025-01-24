Return-Path: <aleksey.smirnov@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC6AC02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 15:43:04 +0000 (UTC)
Received: from mta-03.yadro.com (mta-03.yadro.com [89.207.88.253])
 by mx.groups.io with SMTP id smtpd.web11.15149.1737733377362819999
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 07:42:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yadro.com header.s=mta-04 header.b=HM5Ks0Wo;
 dkim=pass header.i=@yadro.com header.s=mta-03 header.b=QMPitmtF;
 spf=pass (domain: yadro.com, ip: 89.207.88.253, mailfrom: aleksey.smirnov@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-03.yadro.com 0BEA7E0007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1737733373; bh=VcjZ4keHNIqzKf5CDBaFNUImapL4tKbmU8Jzgjx89po=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=HM5Ks0Wo8p9QSlBHrj9eC7ibW7x+VsYiN1GNhOGQtO21eGal407ZeuHuaeTd7hJp0
	 15FVlyureRrP5qrJTsY0IBPZ/LIz0MfQGV4FyZnQ/I26FqJrV4/YU6O4AVn44Wc60P
	 nxWpxHb2ReY0BCGYTAcvvixVCSCX61l4K0umpZMWEjM5yk7j5f8PJtcxyXh1WySpt2
	 +awdk9fJ9I9TMgmWe8xlikOu1qxjozBUpsDG3edznjqEWtIdZE1qEF8K17Ioc+8tSv
	 s1/V1e2SilS594EMGcNnx9RQC8+nsoV6VUnZEkUewk1aMzMg5xaDN2+BkmKM2FoHFv
	 vRPXgXm9T/n/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1737733373; bh=VcjZ4keHNIqzKf5CDBaFNUImapL4tKbmU8Jzgjx89po=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=QMPitmtFUrl049jWuFMgEhnBOBOI16f2u3qmcrbkD6tAGmfY3AlMZXn3Q+0kx3Pwn
	 TKfjIvkljM6+IPlPTgIL15ikgSXOTWL/V/fQPDPxe2qbiKtyBmW+3MT906BYrkp+gp
	 +QIivXy73dkiwQD64JJTqKlQ+s2DGrqWeiHUp+/SX4XxAD2fHOpsQb82mZfwPuNd4K
	 Bb9c15I04Y5fEpPEgGFtO6NR15WDgdWfXEPoYuSwV4MVVEiYWD1WBNAmseaSuqF3TX
	 O/4asV9GxOfygo+AIn2xOWKFfGDcWLNZHBIymA/LoGP8EVIHSBuFMR2w421DpuBg46
	 eo2i+5IfsQrxw==
From: Aleksey Smirnov <aleksey.smirnov@yadro.com>
To: Aleksey Smirnov <aleksey.smirnov@yadro.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] grub-efi: add extra parameters to grub-mkimage
Thread-Topic: [OE-core] [PATCH] grub-efi: add extra parameters to grub-mkimage
Thread-Index: AQHbMF8HX7qBoLvsnESASx2WaSIIn7MmjG2A
Date: Fri, 24 Jan 2025 15:42:52 +0000
Message-ID: <335af60b9fa848f2b12f0f141fa36d17@yadro.com>
References: <18056A11B182568B.24513@lists.openembedded.org>
In-Reply-To: <18056A11B182568B.24513@lists.openembedded.org>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 15:43:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210225

Hi, any updates?

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Aleksey Smirnov
Sent: Wednesday, November 6, 2024 6:17 PM
To: openembedded-core@lists.openembedded.org
Cc: Aleksey Smirnov <aleksey.smirnov@yadro.com>
Subject: [OE-core] [PATCH] grub-efi: add extra parameters to grub-mkimage

Sometimes it is reasonable to add extra params to grub-mkimage, for example=
: "--disable-shim-lock --pubkey <pubkey>". For that purposes variable GRUB_=
MKIMAGE_EXTRA is implemented.

Signed-off-by: Aleksey Smirnov <aleksey.smirnov@yadro.com>
---
 meta/recipes-bsp/grub/grub-efi_2.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.12.bb b/meta/recipes-bsp/grub=
/grub-efi_2.12.bb
index 7df77deca3..4a73ec5034 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.12.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.12.bb
@@ -58,7 +58,7 @@ do_mkimage() {
=20
 	# Search for the grub.cfg on the local boot media by using the
 	# built in cfg file provided via this recipe
-	grub-mkimage -v -c ${UNPACKDIR}/cfg -p ${EFIDIR} -d ./grub-core/ \
+	grub-mkimage -v -c ${UNPACKDIR}/cfg -p ${EFIDIR} -d ./grub-core/=20
+${GRUB_MKIMAGE_EXTRA} \
 	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE_PREFIX}${GRUB_IMAG=
E} \
 	               ${GRUB_MKIMAGE_MODULES}  }
--
2.30.2


