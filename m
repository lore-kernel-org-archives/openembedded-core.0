Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE4A8CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 16:13:27 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.177.1760458326482701598
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 09:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rllv9OsK;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: phanirajkiran.a@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-77f605f22easo4834278b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 09:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760458325; x=1761063125; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fgVkMRmT31SG4QEwxoV+TObWOdbjEcJaZvyuUf1pzUs=;
        b=Rllv9OsKjuyapd0t9wfnnwxRWXxTTTszLd1RIIGqXnHB2kbK/RjeYFfVOcvaQMQ72/
         MpvQfuKng8HYLbJFnY7uU4tj33leBgU4OTMxFBgC4H0pni52Xcpoy6Mz/mF1QBu6Tvof
         pHSJtqdsoT13tQOuXQpQlCjMdLAL2Zyr5W1TgDFPsecFBrv3TsDbNvOAG5y8FLvzPO6l
         ygoeBWrw58leH+XVbZSBIB4h8J+Efd+HoLzm+2RnOdQD/3h8blPe7LsY/9MwMZH1C4Jz
         YPA2nEnOJm3owVirhixUsJXIjI714HiYxrbMizXvfAvrnAk1XnJRhOTk8FxQ9vSiVlcS
         iFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760458325; x=1761063125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fgVkMRmT31SG4QEwxoV+TObWOdbjEcJaZvyuUf1pzUs=;
        b=VLCPY/BgDZGfMaOg/9vTilaZcWay1XRwcncANCBvJsaIySs4WUqzxW3abUMP9XnMM4
         TQDvkwItNOpXhjhnEeCh/adzYxG612JraizvNIkUuQu+u9ZsY4ubSIzsCPHe+kz4m/x5
         C+NPbNFa2HyEKtZcYcRFm5DiccSxVSjyRPzh19MhLvl3vT6R07F0qu0hUqEqQzqx513F
         0Ycm3oTjLO/t119a6p1TJ7AjakvXxHHuliLkDaU3ZuKWiSYTRozWSkVrSm0jTAnGs+rE
         wiEGOcbJco+3uPopXQRO5zOvRI4DkFAfDDtdA2ad6tbgNUE6RIGmC1QuQi4a+VkiNUys
         cOGg==
X-Gm-Message-State: AOJu0YywSrS2zcLKSE5oElXXm/7OnKdq/l7NvRXdolvIom7rsq/WcmNl
	Idm1Ou3lluUpB24QSYrH9fuQSdUwtkZN2AZC0FrXKhlJy6daiK/a6aFl1bPp0g==
X-Gm-Gg: ASbGncuw9xV2iY69Ul6cx2q0Ncf6nBih8z7XnSKoSXIKyfn3yAhKPhooFOR/giAXflL
	ncxPikElW6iilRoO8YrhCEc/C0ADe4ThGbP3+d1iiC+6JETbq4Bqmte224AO8f0oujZI+/rn/Pc
	XTf+fhkrQQBfABuv09wHrDjmjLNE2lZwNsIk7UlcYrc3+UjvDkNetZRASf/VsrJB3B0i+PZoDDm
	sWZiIpLUG4FKKXdmioBoilhG/pkToe41aMBTOUyrZvz+gBzGqjx6bLTOIfYOawAa/lltCg52bRf
	P9vQ4VxnZfh4kwXUoHRv7qqvLixhHc62x/QUZei776B4NEOV8+6qIrUpxQSsUndtr/VOjlo3dyI
	BTq69rBV4i/UXdYoixRgnsugUuKn9xCYgAfS1Vq8LDg==
X-Google-Smtp-Source: AGHT+IHZBF5PEUgS9HThbUgS2exA1T5qztMQrQQhK01Shz38L6IiJZeUmkLzbQOO6lk9ZlHfDy2AxQ==
X-Received: by 2002:a05:6a00:4195:b0:781:264b:dd96 with SMTP id d2e1a72fcca58-79387440a58mr27174382b3a.19.1760458325173;
        Tue, 14 Oct 2025 09:12:05 -0700 (PDT)
Received: from pop-os.. ([59.93.89.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d096527sm15485244b3a.44.2025.10.14.09.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 09:12:04 -0700 (PDT)
From: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>
Subject: [PATCH] [kirkstone] musl: backport fix for CVE-2025-26519 to LTS branches
Date: Tue, 14 Oct 2025 21:41:50 +0530
Message-Id: <20251014161150.9341-1-phanirajkiran.a@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 16:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224841

---
 ...ackport-fix-for-CVE-2025-26519-to-LT.patch | 52 +++++++++++++++++++
 meta/recipes-core/musl/musl_git.bb            |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-core/musl/musl/0001-kirkstone-musl-backport-fix-for-CVE-2025-26519-to-LT.patch

diff --git a/meta/recipes-core/musl/musl/0001-kirkstone-musl-backport-fix-for-CVE-2025-26519-to-LT.patch b/meta/recipes-core/musl/musl/0001-kirkstone-musl-backport-fix-for-CVE-2025-26519-to-LT.patch
new file mode 100644
index 0000000000..c65e88535f
--- /dev/null
+++ b/meta/recipes-core/musl/musl/0001-kirkstone-musl-backport-fix-for-CVE-2025-26519-to-LT.patch
@@ -0,0 +1,52 @@
+From ae865075dc7e1acd0cb7ee9417758c8e060800ed Mon Sep 17 00:00:00 2001
+From: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>
+Date: Tue, 14 Oct 2025 20:36:36 +0530
+Subject: [kirkstone] musl: backport fix for CVE-2025-26519 to LTS
+ branches
+
+Fixes [YOCTO #15932]
+
+The musl libc code in LTS (kirkstone) is missing
+the fix addressing CVE-2025-26519.  This patch backports the upstream
+changes (or applies the required fix) so that LTS builds include it.
+
+Reference:
+https://nvd.nist.gov/vuln/detail/CVE-2025-26519
+
+(From OE-Core rev: 0d11c9103f072841baf39166efc133f2a20fc4dc)
+
+Signed-off-by: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>
+Signed-off-by: Gunda Swetha <swetha12g@gmail.com>
+
+Reported-by: Cristian Morales Vega
+---
+ src/locale/iconv.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/locale/iconv.c b/src/locale/iconv.c
+index 3047c27b..0729465e 100644
+--- a/src/locale/iconv.c
++++ b/src/locale/iconv.c
+@@ -495,7 +495,7 @@ size_t iconv(iconv_t cd, char **restrict in, size_t *restrict inb, char **restri
+ 			if (c >= 93 || d >= 94) {
+ 				c += (0xa1-0x81);
+ 				d += 0xa1;
+-				if (c >= 93 || c>=0xc6-0x81 && d>0x52)
++				if (c > 0xc6-0x81 || c>=0xc6-0x81 && d>0x52)
+ 					goto ilseq;
+ 				if (d-'A'<26) d = d-'A';
+ 				else if (d-'a'<26) d = d-'a'+26;
+@@ -538,6 +538,10 @@ size_t iconv(iconv_t cd, char **restrict in, size_t *restrict inb, char **restri
+ 				if (*outb < k) goto toobig;
+ 				memcpy(*out, tmp, k);
+ 			} else k = wctomb_utf8(*out, c);
++			/* This failure condition should be unreachable, but
++			 * is included to prevent decoder bugs from translating
++			 * into advancement outside the output buffer range. */
++			if (k>4) goto ilseq;
+ 			*out += k;
+ 			*outb -= k;
+ 			break;
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 4b85401360..e5feef2cb6 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -15,6 +15,7 @@ PV = "${BASEVER}+git${SRCPV}"
 SRC_URI = "git://git.musl-libc.org/musl;branch=master \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
+           file://0001-kirkstone-musl-backport-fix-for-CVE-2025-26519-to-LT.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


