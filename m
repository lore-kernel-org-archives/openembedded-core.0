Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33996.1793149812140935211
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 18:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=rzoKdD8p;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15ea896ddc8so631489c88.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 18:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793149811; x=1793754611; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQN2CYSWUtlFHSPBvVxjj+1aFMOeFLiTaJdGtvZF0GE=;
        b=rzoKdD8psef5kng+7hcv27dzDI+pdi3h+bycuCXOCgt0CQczGJIzTsILSbrVxeEwBf
         wT8fKbEDRBuoWuECvSnHgjxl/CMjcSsM2/XFPGO+A09byQfyHRNdpw07UQs/y6jvkcTW
         S8zrIKi3s+cwLA82SgLgLA4mzfn+QNt+EjMdu3wKP9eJXOXZoWa2EzWVO2TOLqsRcSy7
         +TEZMuxvNMeyJnei2VBUJYqXTyPNAhtHHKtnjeHn1j49scm0L9gcy4zz+KKtytzAELIv
         g0bbur+piORoovSIHhMiWRzbomM+DMtbE0iawlbQFf23iPOMObp2kwcM1ixV+POETlkD
         ZZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793149811; x=1793754611;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JQN2CYSWUtlFHSPBvVxjj+1aFMOeFLiTaJdGtvZF0GE=;
        b=QQEgXFxI4gf5rvljxsMuBvUdatGFdxSvFKckY9jczpA1ojqrSflBvwPRk5noA4dOir
         /TSIkZTFwEgOfCHBLSA7vXrODXB9Bufmrux7McyZCMCaJipBx7K/XHTr+A94RSgY7+iU
         RoxKJ8bGMH3bBmsGW+tA6naPp+05qnKglOjtNpSviy9LGHj6V//H1YX12ROtSMowq+zM
         xVKlCYoIRvvI28JeilJpUKX0B0//Ln9mk+9vC1ajOWIGk6QRMhVzTfXHllllRkiErWgM
         cCr7ftj7AzlLH9buP9WwnyhuYV2jOWdTsjjst1l6US7N6ENDJPwQgO/UEf5LkiSxnFAT
         R/Ug==
X-Gm-Message-State: AFq9FYLDyMl2wFzdOHq0VkwTAouZputu9eOoMFa0z7USHvPBy436wUPE
	lxCSzCyTrG5s2u9OH0M4mKVKFzrT9a7U+Zb8/HcPI+ywvglQ8z8cDwMj5+/1qRqAryA=
X-Gm-Gg: AYBFou15k9lyumpUWLI57T0W3a2tcI19N/DjFRQRLVaAe0xPW4R9g4frrQMq9p+tCUs
	+x3100CwMB7Asz2f4vuS/U8jlLrjuGf1pU3SAw+epkwONWHGG4PohoiN6gKsEsfwOyrc+fK+Lbc
	c4LZYo48HDeVxE5fg5j7JpJTkY9YTpUvd5KvWtOzFgIDA9LT7ojHoJGVgdpNjrtI4H76WR0SP6/
	BWj7Um3O7zqdq2BZqmCvLIoXp2X6I9O4Xt87GFQJyu8rEcivdqyB23dhI0KUbbG0fOGjpc9JW2n
	qar6Nj7ZxLlSHkU3Jjqwvjb7Jp/RpCch22aWcpNG8es2GB7+B4nFKr4IaL2OnPS77mbfnPfhDRc
	PFvnREuOhxbaGuyBQmKGeNrYXR8ZOKKS9wUAOVuRAL9QcPKI7GRELJNT2Z5dFgcNSsN1hGpVy7t
	uCSRJhQPdDM6qJAH6dG7CfLOpx5TDoCGfBRroKV8hHFSKxjCtuCFAZSuvpM7Qne8QNHZCPKUMRE
	TsIOrO0sd13+mB5Q3+bcOMisg7OOwBk/1TcgriCeneGH9Iv4DVKPocuEQhcUpFzkV+K5xQkKPtZ
	fFF9K9qy3cy3ymtWKcVWuzxAgsVRIWIBc2pFlDYC46IwjLP35Bx1b35sHzb27E7TZV7FKpL3tr5
	KeHpKLEFf1pVHaZtt6FGnJ+qtm2eZEK9Q37D5Bo8mvJn/4hRvqHTa4h7BBvdbDE/1sDihJogGFo
	1fdP23Kv9od1IBjhe+PzXnMi3yx9Wirc8ZfHNR/kP9MKRB6kYp2ugNJMbYTGf4PVx0eAEW7tEtb
	og0zEV6mP2SyGCy3b0dSU5/zX10Io0pyskT1ytw3k9kBcTxK3NFVdvOeDSe6qBf+mVg/P1RSGMf
	ry9K
X-Received: by 2002:a05:701b:424b:20b0:17d:7b45:f91f with SMTP id a92af1059eb24-1a6cf914486mr1235704c88.32.1793149811083;
        Tue, 27 Oct 2026 18:10:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a7549528ebsm711949c88.0.2026.10.27.18.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 18:10:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] lrzsz: Fix build with clang 23
Date: Tue, 27 Oct 2026 18:10:04 -0700
Message-ID: <20261028011006.1704070-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 01:10:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248772
Content-Type: text/plain; charset="utf-8"

clang 23 enables -Wunused-but-set-global with -Wall, and lrzsz builds
with -Werror by default:

  src/zm.c:37:12: error: variable 'Crc32' set but not used [-Werror,-Wunused-but-set-global]

Remove the four write-only file-scope variables it flags in zm.c, lrz.c
and lsz.c.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...2-Remove-unused-file-scope-variables.patch | 119 ++++++++++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.13.1.bb        |   1 +
 2 files changed, 120 insertions(+)
 create mode 100644 meta/recipes-bsp/lrzsz/lrzsz/0002-Remove-unused-file-scope-variables.patch

diff --git a/meta/recipes-bsp/lrzsz/lrzsz/0002-Remove-unused-file-scope-variables.patch b/meta/recipes-bsp/lrzsz/lrzsz/0002-Remove-unused-file-scope-variables.patch
new file mode 100644
index 0000000000..efec7c78cc
--- /dev/null
+++ b/meta/recipes-bsp/lrzsz/lrzsz/0002-Remove-unused-file-scope-variables.patch
@@ -0,0 +1,119 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 27 Oct 2026 14:16:28 -0700
+Subject: [PATCH] Remove unused file-scope variables
+
+Crc32 (zm.c), ztrans (lrz.c), vpos and Beenhereb4 (lsz.c) are only ever
+assigned, never read: Crc32 is a leftover display flag superseded by
+Rxframeind, and the other three no longer feed anything. clang 23 adds
+-Wunused-but-set-global, enabled by -Wall, so the default -Werror build
+now fails:
+
+  src/zm.c:37:12: error: variable 'Crc32' set but not used [-Werror,-Wunused-but-set-global]
+  src/lrz.c:111:13: error: variable 'ztrans' set but not used [-Werror,-Wunused-but-set-global]
+  src/lsz.c:97:13: error: variable 'vpos' set but not used [-Werror,-Wunused-but-set-global]
+  src/lsz.c:132:12: error: variable 'Beenhereb4' set but not used [-Werror,-Wunused-but-set-global]
+
+Remove them and their stores.
+
+Upstream-Status: Submitted [https://github.com/UweOhse/lrzsz/pull/3]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/lrz.c | 2 --
+ src/lsz.c | 5 -----
+ src/zm.c  | 4 ----
+ 3 files changed, 11 deletions(-)
+
+diff --git a/src/lrz.c b/src/lrz.c
+index 3fd74bc..a15f285 100644
+--- a/src/lrz.c
++++ b/src/lrz.c
+@@ -108,7 +108,6 @@ static long min_bps_time=120;
+ static char Lzmanag;		/* Local file management request */
+ static char zconv;		/* ZMODEM file conversion request */
+ static char zmanag;		/* ZMODEM file management request */
+-static char ztrans;		/* ZMODEM file transport request */
+ bool Zctlesc;		/* Encode control characters */
+ unsigned int Zrwindow = 1400;	/* RX window size (controls garbage count) */
+ 
+@@ -1683,7 +1682,6 @@ again:
+ 				skip_if_not_found=true;
+ 			}
+ 			zmanag = Rxhdr[ZF1];
+-			ztrans = Rxhdr[ZF2];
+ 			tryzhdrtype = ZRINIT;
+ 			c = zrdata(secbuf, LRZSZ_MAX_SUBPACKET_LEN, &bytes_in_block);
+ 			io_mode(0,3);
+diff --git a/src/lsz.c b/src/lsz.c
+index 18766a6..b9e79cf 100644
+--- a/src/lsz.c
++++ b/src/lsz.c
+@@ -94,8 +94,6 @@ static FILE *input_f;
+ 
+ static char *txbuf;
+ 
+-static long vpos = 0;			/* Number of bytes read from file */
+-
+ static char Lastrx;
+ static char Crcflg;
+ int Verbose=0;
+@@ -129,7 +127,6 @@ static int Cmdtries = 11;
+ static int Cmdack1;		/* Rx ACKs command, then do it */
+ static int Exitcode;
+ static size_t Lastsync;		/* Last offset to which we got a ZRPOS */
+-static int Beenhereb4;		/* How many times we've been ZRPOS'd same place */
+ /* set when an abort arm has answered a receiver's ZABORT/ZFERR with the
+  * spec-required ZFIN sequence (zmodem-wip.txt §4): the session is then
+  * already ended cleanly, and main() must not append a cancel sequence */
+@@ -762,7 +759,6 @@ wcs(const char *oname, const char *remotename)
+ 			setvbuf(input_f,s,_IOFBF,last_length);
+ 		}
+ 	}
+-	vpos = 0;
+ 	/* fstat must succeed: its fields are transmitted below as the file's
+ 	 * metadata (mode/mtime/size). A failure used to send uninitialized
+ 	 * memory - a garbage size in particular can make the receiver
+@@ -1800,7 +1796,6 @@ zsendfdata (struct zm_fileinfo *zi)
+ 
+ 	Lrxpos = 0;
+ 	junkcount = 0;
+-	Beenhereb4 = 0;
+ 	last_txpos = 0;
+ 	low_bps = 0;
+ 	not_printed = 0;
+diff --git a/src/zm.c b/src/zm.c
+index 9aa3298..9a62c1c 100644
+--- a/src/zm.c
++++ b/src/zm.c
+@@ -34,7 +34,6 @@ unsigned char Rxhdr[4];		/* Received header */
+ unsigned char Txhdr[4];		/* Transmitted header */
+ int Txfcs32;		/* true means send binary frames with 32 bit FCS */
+ int Crc32t;		/* Display flag indicating 32 bit CRC being sent */
+-static int Crc32;		/* Display flag indicating 32 bit CRC being received */
+ int Znulls;		/* Number of nulls to send at beginning of ZDATA hdr */
+ char Attn[ZATTNLEN+1];	/* Attention string rx sends to tx on err */
+ 
+@@ -784,7 +783,6 @@ zgethdr(unsigned char *hdr, int eflag, size_t *Rxpos)
+ 				continue;
+ 			case ZBIN:
+ 				Rxframeind = ZBIN;
+-				Crc32 = false;
+ 				c =  zrbhdr(hdr);
+ 				if (c==ERROR) {
+ 					stats_msg_invalid();
+@@ -799,7 +797,6 @@ zgethdr(unsigned char *hdr, int eflag, size_t *Rxpos)
+ 				continue;
+ 			case ZBIN32:
+ 				Rxframeind = ZBIN32;
+-				Crc32 = true;
+ 				c =  zrbhdr32(hdr);
+ 				if (c==ERROR) {
+ 					stats_msg_invalid();
+@@ -814,7 +811,6 @@ zgethdr(unsigned char *hdr, int eflag, size_t *Rxpos)
+ 				continue;
+ 			case ZHEX:
+ 				Rxframeind = ZHEX;
+-				Crc32 = false;
+ 				c =  zrhhdr(hdr);
+ 				if (c==ERROR) {
+ 					stats_msg_invalid();
diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.13.1.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.13.1.bb
index 521cedf789..3e374aa2c9 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.13.1.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.13.1.bb
@@ -13,6 +13,7 @@ DEPENDS = ""
 
 SRC_URI = "https://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
            file://0001-Fix-build-with-32-bit-targets-under-Werror.patch \
+           file://0002-Remove-unused-file-scope-variables.patch \
            "
 SRC_URI[sha256sum] = "112f91059fbd118e016d800c1a5c5a1702e965d8b9bfbda6015e44e20bfb93c9"
 
