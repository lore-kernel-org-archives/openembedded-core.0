Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39021.1795601001707472856
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 02:03:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ua+E2T2J;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BF9F3C2BB3D
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 10:03:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EFCD360480
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 10:03:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 389D711E69D75;
	Wed, 25 Nov 2026 11:03:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795600999; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=c8iJ/rQcPqTGcdGhImIb1YLQzOIec0h7ZvAIhqgjiPI=;
	b=ua+E2T2JsdBgSQpk/7YnkkdvPoCWudOwI6cQeS+cx+XL8t0E4cq7eFV3YXApV/+F/zVLoW
	4wK+MHxKdJR5ClEjVOCuefRaTr9+ZdBiYrO0OVlTYZieYA0SDjdzxAk2DoA/wqIWf3czQv
	X0puJXc+pDwpMhJVSwPNLyo4Zapr9NWsy/Bs/IYXOXDPnOq9M3gyn3a8BsUPZg5Hxloked
	8D7FILC+77HwpgLXLr2eDH64otudkZ9gw1SckiNq/AyN3+kIscnVx5bxZ4/7Hy9/nsblON
	BvknG8iGr3mtvD5N9Ou4GowLAW237oHmdmxs+1lMsCfeWTgwko0wGccvTxfDDg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 25 Nov 2026 11:03:06 +0100
Subject: [PATCH 2/2] zstd: add nobench, nocompress, nodecompress, nodict to
 PACKAGECONFIG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-zstd-1-6-0-v1-2-95f50c6b9de6@bootlin.com>
References: <20261125-zstd-1-6-0-v1-0-95f50c6b9de6@bootlin.com>
In-Reply-To: <20261125-zstd-1-6-0-v1-0-95f50c6b9de6@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=FW7jzrxbaBkPZTMJg+Ds9LpQ9ajptjWEjm4n2eWkm68=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBrBrJadeVb8UpwkgM2vMgfYkceu0RJmbOLc3hMD
 aEmRjAjzJyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCawayWgAKCRDRgEFAKaOo
 NrU3D/9P6MPmZ4SkXuecSzBA0tthLdG8YTASU/VyTGt0J0JsgGZ1yxIW6PSo8/pEExCvlTrYeUF
 tPUwrPsZxdk/9wrS7q5sdDDykTAUsL/XvBPV+2EPWvNTmDCpB9fpKMcx25wXi/g38+sDQFwlrQP
 jco7zXZfcTGTosjsg5L3c+NvwJ6jAbkF5kbHxMNjSN0BHyyR2NxUEkQ1nlXH4EImhod4Q/Mi2R9
 FjCa/vKOugwYJQTynuJF5VQUGZ5lSvgnrKgGfaFSHWSDiYIjyUDYNgXSs/KpGFSoPodrmHo0KKD
 0iExyx7YQjCkyG1mZtTZT4mzNWvIyiNQteCEkVyBx6oYf9DDOE+LXTPdW0WCa/LywjNwUOfXQlk
 uCU9gPpDLEhv+L1WF11jLgDRGTL9ZIjzXgCXkQvQEM6JSbh/d5yzqD723SG0E0Hp1GJpziMGI6y
 ed+G5f+GlcY21KFk2Gr38l1InZzT5CHscZMfzBQW1117Tk1wG89MqKwbKLlwyboHMdiwWR+mYxP
 XMAu7WbnrhV//JJZ+w1ottFxeHsHcjDv2YSKmZ9uClsPenVMWRIaKdQVyow2rTbH6h5mOcXAYZH
 8XGMgzmhL4PumIWZLBujdibhhgGasjwjHjdFDWArQWCGWxu0b9I1s/5aQOLlvznJ1kfRqGoqYTI
 Qs8CLWz2+DKhiZQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 10:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251176

Add PACKAGECONFIG knobs matching zstd's configuration knobs:

- nobench disables the integrated benchmark module, which produces a
  smaller binary
- nocompress makes zstd compiled without compress support
- nodecompress makes zstd compiled without decompress support
- nodict compiles zstd without support for the integrated dictionary
  builder, which produces a smaller binary

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/recipes-extended/zstd/zstd_1.6.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/zstd/zstd_1.6.0.bb b/meta/recipes-extended/zstd/zstd_1.6.0.bb
index 6e4e07050a..cba70007b8 100644
--- a/meta/recipes-extended/zstd/zstd_1.6.0.bb
+++ b/meta/recipes-extended/zstd/zstd_1.6.0.bb
@@ -25,6 +25,10 @@ CVE_PRODUCT = "zstandard"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lz4] = "HAVE_LZ4=1,HAVE_LZ4=0,lz4"
 PACKAGECONFIG[lzma] = "HAVE_LZMA=1,HAVE_LZMA=0,xz"
+PACKAGECONFIG[nobench] = "ZSTD_NOBENCH=1,ZSTD_NOBENCH=0"
+PACKAGECONFIG[nocompress] = "ZSTD_NOCOMPRESS=1,ZSTD_NOCOMPRESS=0,,,,nodecompress"
+PACKAGECONFIG[nodecompress] = "ZSTD_NODECOMPRESS=1,ZSTD_NODECOMPRESS=0,,,,nocompress"
+PACKAGECONFIG[nodict] = "ZSTD_NODICT=1,ZSTD_NODICT=0"
 PACKAGECONFIG[zlib] = "HAVE_ZLIB=1,HAVE_ZLIB=0,zlib"
 
 # See programs/README.md for how to use this

-- 
2.56.0

