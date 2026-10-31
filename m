Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3740.1793405761358170763
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=heOiR6xD;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so11366115e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405760; x=1794010560; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RNEOwpRbC8H/x/ExUaL8Olf+KaLVsgrAIpPMIDg6ZqA=;
        b=heOiR6xDrj4N3HvfupOS0x0Vfc5jnBFAP/vEwKYwnkN8nVSUFBW/LqfRGcS+W7XAyl
         XGaynQEqBLmOnuQPT6I0hSS3kFB907HPapDlxJIG4VELcWisZ5NBvgZoqXo1HM679Gyh
         cfmD8Ls23NU3Q9rVz+b30xmm9y4HjVCcawBCMoTRLnRZ80B5g2gIgY4i7ngPZjd3Ie4I
         baV0uSIha/9DLqc7cg04zSukcQxc3UbCLvvq4QB38b1peDx6ojIltO5p0uRnx/ooYM6u
         3czEACcuYfB9MSzwpXzVYR7n66DBwlfGWxYa99PGqDS5gIB5mvYKEFqm7aLLC/3CJtPm
         BstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405760; x=1794010560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RNEOwpRbC8H/x/ExUaL8Olf+KaLVsgrAIpPMIDg6ZqA=;
        b=O05cXbLmDRH6ULGgX37XSStfUo8HmIcr6/ky47r4YYzB6rTNP5+PZIYFLCICQVm4V7
         wPNHL6BcNBjmEyum5q/b/W473JQ0CwEeH4RAgoAtEMmHReflH9qYuxl6Qda6f/35fqmO
         TC0JSJOCKi4xqcArn1P/61OrI8+D30YuUPq9WsNeavYKiOOzbleo08s9DoIbT0H6iiXW
         VsQP08TtNAzBDBR/aQEye2wJaBjOCF5DwLAKoZEngxfMYZuGBm+0r0t5MNtQFHb9MfW6
         CJEnMf4B0uXqXBxaOhG9sDT+NwM/7b1suvLZ8nmvYPyBZqt4mRsw3AESeMINe51R240X
         auyw==
X-Gm-Message-State: AFq9FYI4Vtb7P38GzYhude6fQEVzdA8SNA0AwTGcLvuZuyTnd3m27Yn8
	x70z4/TsQBUVhR6Zcr8QAawINFMDrsyy2sBjs6Jj7hGJ2JsHbF162CckC4xMsANeHLSGNs39hbp
	tP7XMmcE=
X-Gm-Gg: AYBFou2h9pnnHrfdjatV2xeLVQe6hQ9PHzTuPthx/R2j02TUpEnxB5NXUPDNFZMSFxt
	Cf4MMEWY2P/El26/Kr1cUjHSsgCmjob8I7/C1h9xEox4IHnNozdVP+FwxAx7SFpsE0rKPHk6xEu
	pUiH0gVowh/3QszaZwYhUn8P93UUJUbbwBnKiGdgu45ZmAD53ok1CPCNp173RQ1ixJEDRVPjEcO
	DJyd6dkzQMZ8Wqa+Hypl49iiXWm5rx+BW2JiVJv0A8OoWmVka5nDZAb+vNWN5TTlA1KWlTNtIar
	tgplryDdxJZsBfQeewUWntY7GPxGI1daPvwVYpDjSflnuzoMMwz61FUyqbDu+RVG8rYjFOyW8xy
	zrlmTUnYPza3UyrHsnxAIS9aahGyivDpg2UgsDEKPR0D3nG+FjvvVSLb06CElqt5FrCHU4qLlpI
	w6DPHJ41q4CJS1VYhOulFV5zDBEVCr08kqsoLsZADrQ5RwBtZyzmBIb+mnEnRhj/4OTWcOmjLpe
	5AseqZR+J4Yrz5DT5FxawJocxk8GlbzcccJ3wb/pt0ABKc/9NOviAOJD+llf/B+XKrHZYohhOv6
	mRnXD0UTWNsUw+bKdmZFo3Eo6DHxuncAy7QK3vMen5MZALtUYQ0Du1C1I4l9AD1wtJcdyV1nLol
	O+VVdQBtMwov0gpDqi18cSYWe18T8
X-Received: by 2002:a05:600c:64c9:b0:4a2:180a:3417 with SMTP id 5b1f17b1804b1-4ac14dd1debmr90451745e9.1.1793405759610;
        Fri, 30 Oct 2026 17:15:59 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.15.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:15:59 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 28/55] glibc: patch CVE-2026-80489
Date: Sat, 31 Oct 2026 01:14:49 +0100
Message-ID: <bdf6a7982e20e874aafa06b85b44d9e2bb6ef54a.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249103
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE from 2.41 branch (oldest release
still receiving security updates).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: fixed a 3.41 -> 2.41 typo in branch name]
---
 .../glibc/glibc/0038-CVE-2026-80489.patch     | 32 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0038-CVE-2026-80489.patch

diff --git a/meta/recipes-core/glibc/glibc/0038-CVE-2026-80489.patch b/meta/recipes-core/glibc/glibc/0038-CVE-2026-80489.patch
new file mode 100644
index 00000000000..3ca1c959bb2
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0038-CVE-2026-80489.patch
@@ -0,0 +1,32 @@
+From ec116a0fbedcc860631e525e70b409cf295f27da Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 28 Aug 2026 10:26:07 +0200
+Subject: [PATCH] iconvdata: EUC_JISX0213 decoding lacks pending character
+ reset (CVE-2026-80489)
+
+This fixes bug 34568.
+
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+(cherry picked from commit 4dafa087ff5fe7df45bd37dc727e988da6b8c935)
+
+CVE: CVE-2026-80489
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=ec116a0fbedcc860631e525e70b409cf295f27da]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ iconvdata/euc-jisx0213.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/iconvdata/euc-jisx0213.c b/iconvdata/euc-jisx0213.c
+index 9c3f28da2d..f0305c113a 100644
+--- a/iconvdata/euc-jisx0213.c
++++ b/iconvdata/euc-jisx0213.c
+@@ -224,6 +224,9 @@
+ 	    STANDARD_FROM_LOOP_ERR_HANDLER (1);				      \
+ 	  }								      \
+       }									      \
++    else 								      \
++      /* There was a pending character.  Clear it.  */			      \
++      *statep = 0;							      \
+ 									      \
+     put32 (outptr, ch);							      \
+     outptr += 4;							      \
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index 3090b9cd277..bd0b4f06190 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -70,6 +70,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0035-CVE-2026-19542.patch \
            file://0036-CVE-2026-19499.patch \
            file://0037-CVE-2026-77117.patch \
+           file://0038-CVE-2026-80489.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
