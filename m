Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87388C54F53
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 06:42:13 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25497.1785134531875365114
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 23:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OWXUBGV9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49550ec592cso20760865e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 23:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785134530; x=1785739330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MVdK/c4JtpyrqME+2DnhpTW0j/i3Y/3obIlAuqt4uZI=;
        b=OWXUBGV9flOVS1/rUQ+K/6RC+0ihme2o361ifWcupf8WbM+wkDRLeis7/GJeKSqfeC
         CSrvjQGRHcHxQzs1j7du4+1R3rSnfCq0pFkO8T7lY/RvYGO4dTbF9ZMyZyP/eATbnbXP
         ar9n/B2gAdFH599Cy8cPPxdi6yoTPLtp+xVmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785134530; x=1785739330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MVdK/c4JtpyrqME+2DnhpTW0j/i3Y/3obIlAuqt4uZI=;
        b=MEn3D7WmAtVxGyKTUCbd/E7YwfeHzxlx/5zzOIJIWDm1V5gyC/NOlhtOLCOdH57TtA
         jVZjMLUoK9pbfoRXh/hB0k9BdpD0Af0qDX+BH//qZgSIxC97PghOu/0FflhSk5v2lwAP
         6FXWqNwMo0fgco7PGpnnWX4JrWLMt+4BiHXxyEZRRxzgN/5vk8OfsiOhL5FJSYSdEg/4
         OXHYxEL04/bFr6NVbE8LsYNuOhUNSbOhrCwmvtpwU5UhqrLb7s7UIHhILtw7kBWpy++q
         U4ljPRPRC54zfecGnHGOtyOe3pimG0zByVZztFAaHK2uJ7z05toD00PJHMCTib5t8me/
         W8Hg==
X-Gm-Message-State: AOJu0YyoL5uNjdfvqjAPJ9fIrniJo0+4TodWlQfb+x308ySwjmU5axN5
	yP1UaW+5uXBXpM6vnrDsGLsbgxxWqv2cbs14XNHPR3nX2XmXGtQbfJ39r64Vu19PCw+kp3pHxh/
	ZqrKmYtU=
X-Gm-Gg: AR+sD1292Kn1/PtLcEAcwiRX9K/6JRIsNcxTSh2zu7YMFbtfDIQH+xmX/eQR1d19C0P
	RENvKLHcFL+HPw5k/Puy3VX+Ip0+BvL5IcPd6bOx0eCLBWOVSTFl7MHvtkmXHvbDnBOH9O+D6lx
	YIc0tgIm0DN/HfrxUJZyon1CtLXhPlvPEDHsdxOISqqJa+M/F2erRREW9AeFkuzz9/CvUfGZPYJ
	LV6lixuv4gjas04zvQHT9C6Wh1/U7C08YFewjHkL+cn1T3k/oaKmnk4oWxnFy0NxziddQ+qtJn1
	pDJQb++a5l+AF1F+lkUN0+bz3sNnAzAi4edSu9UgyBGHxw0jV0YoFwWaUXORhz5D6DoTZVgw5Ol
	MQYtr1KWnEYVwlgroA4vcU500M7OrKfLy4umaM5HG3R8Z8egtxH7/anbgK9ux46beehAJQXCEV2
	W5CiHnAzGn2Sjol8X1xC0JRi3SkB/Etg==
X-Received: by 2002:a05:600c:4f89:b0:495:501a:fcf8 with SMTP id 5b1f17b1804b1-496b5c7181emr87010925e9.9.1785134529882;
        Sun, 26 Jul 2026 23:42:09 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3a01:52d:1da2:a363])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4866813sm229103255e9.8.2026.07.26.23.42.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 23:42:08 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/10] python3-uv-build: upgrade 0.11.29 -> 0.11.32
Date: Mon, 27 Jul 2026 07:41:57 +0100
Message-ID: <20260727064158.3784068-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727064158.3784068-1-richard.purdie@linuxfoundation.org>
References: <20260727064158.3784068-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 06:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242046

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-uv-build-crates.inc        | 32 +++++++++----------
 ...0.11.29.bb => python3-uv-build_0.11.32.bb} |  2 +-
 2 files changed, 17 insertions(+), 17 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.11.29.bb => python3-uv-build_0.11.32.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index f1de38878c2..c0839045bd5 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -28,7 +28,7 @@ SRC_URI += " \
     crate://crates.io/bumpalo/3.20.2 \
     crate://crates.io/bytecheck/0.8.2 \
     crate://crates.io/bytecheck_derive/0.8.2 \
-    crate://crates.io/bytes/1.12.0 \
+    crate://crates.io/bytes/1.12.1 \
     crate://crates.io/bzip2/0.5.2 \
     crate://crates.io/bzip2-sys/0.1.13+1.0.8 \
     crate://crates.io/cc/1.2.57 \
@@ -103,9 +103,9 @@ SRC_URI += " \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itoa/1.0.17 \
-    crate://crates.io/jiff/0.2.31 \
-    crate://crates.io/jiff-static/0.2.31 \
-    crate://crates.io/jiff-tzdb/0.1.6 \
+    crate://crates.io/jiff/0.2.32 \
+    crate://crates.io/jiff-static/0.2.32 \
+    crate://crates.io/jiff-tzdb/0.1.8 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
     crate://crates.io/jobserver/0.1.35 \
     crate://crates.io/js-sys/0.3.91 \
@@ -120,7 +120,7 @@ SRC_URI += " \
     crate://crates.io/lzma-sys/0.1.20 \
     crate://crates.io/mailparse/0.16.1 \
     crate://crates.io/matchers/0.2.0 \
-    crate://crates.io/memchr/2.8.2 \
+    crate://crates.io/memchr/2.8.3 \
     crate://crates.io/miniz_oxide/0.8.9 \
     crate://crates.io/mio/1.2.0 \
     crate://crates.io/munge/0.4.7 \
@@ -159,8 +159,8 @@ SRC_URI += " \
     crate://crates.io/ref-cast/1.0.25 \
     crate://crates.io/ref-cast-impl/1.0.25 \
     crate://crates.io/reflink-copy/0.1.30 \
-    crate://crates.io/regex/1.12.4 \
-    crate://crates.io/regex-automata/0.4.14 \
+    crate://crates.io/regex/1.13.0 \
+    crate://crates.io/regex-automata/0.4.15 \
     crate://crates.io/regex-syntax/0.8.11 \
     crate://crates.io/rend/0.5.3 \
     crate://crates.io/rkyv/0.8.17 \
@@ -235,7 +235,7 @@ SRC_URI += " \
     crate://crates.io/url/2.5.8 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.23.4 \
+    crate://crates.io/uuid/1.23.5 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/vte/0.14.1 \
@@ -313,7 +313,7 @@ SRC_URI[bstr-1.12.1.sha256sum] = "63044e1ae8e69f3b5a92c736ca6269b8d12fa7efe39bf3
 SRC_URI[bumpalo-3.20.2.sha256sum] = "5d20789868f4b01b2f2caec9f5c4e0213b41e3e5702a50157d699ae31ced2fcb"
 SRC_URI[bytecheck-0.8.2.sha256sum] = "0caa33a2c0edca0419d15ac723dff03f1956f7978329b1e3b5fdaaaed9d3ca8b"
 SRC_URI[bytecheck_derive-0.8.2.sha256sum] = "89385e82b5d1821d2219e0b095efa2cc1f246cbf99080f3be46a1a85c0d392d9"
-SRC_URI[bytes-1.12.0.sha256sum] = "8ae3f5d315924270530207e2a68396c3cc547f6dca3fbdca317cfb1a51edb593"
+SRC_URI[bytes-1.12.1.sha256sum] = "fc652a48c352aef3ea3aed32080501cf3ef6ed5da78602a020c991775b0aff04"
 SRC_URI[bzip2-0.5.2.sha256sum] = "49ecfb22d906f800d4fe833b6282cf4dc1c298f5057ca0b5445e5c209735ca47"
 SRC_URI[bzip2-sys-0.1.13+1.0.8.sha256sum] = "225bff33b2141874fe80d71e07d6eec4f85c5c216453dd96388240f96e1acc14"
 SRC_URI[cc-1.2.57.sha256sum] = "7a0dd1ca384932ff3641c8718a02769f1698e7563dc6974ffd03346116310423"
@@ -388,9 +388,9 @@ SRC_URI[insta-1.48.0.sha256sum] = "86f0f8fee8c926415c58d6ae43a08523a26faccb2323f
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itoa-1.0.17.sha256sum] = "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
-SRC_URI[jiff-0.2.31.sha256sum] = "ccfe6121cbe750cf81efa362d85c0bde7ea298ec43092d3a193baca59cdbd634"
-SRC_URI[jiff-static-0.2.31.sha256sum] = "e165e897f662d428f3cd3828a919dbe067c2d42bb1031eede74ef9d27ecdedd2"
-SRC_URI[jiff-tzdb-0.1.6.sha256sum] = "c900ef84826f1338a557697dc8fc601df9ca9af4ac137c7fb61d4c6f2dfd3076"
+SRC_URI[jiff-0.2.32.sha256sum] = "961d16382652bfdd8c6f68b223b26a8c93e0d475c672f414411db31c6c5c900e"
+SRC_URI[jiff-static-0.2.32.sha256sum] = "d0879bd39df99c4c5e2c6615ccc026391a423dde10532c573e6086eb94a802cc"
+SRC_URI[jiff-tzdb-0.1.8.sha256sum] = "142bd39932ad231f10513df9ab62661fead8719872150b7ad02a2df79f4e141e"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
 SRC_URI[jobserver-0.1.35.sha256sum] = "1c00acbd29eabad4a2392fa0e921c874934dbbf4194312ad20f04a0ed67a3cb3"
 SRC_URI[js-sys-0.3.91.sha256sum] = "b49715b7073f385ba4bc528e5747d02e66cb39c6146efb66b781f131f0fb399c"
@@ -405,7 +405,7 @@ SRC_URI[log-0.4.29.sha256sum] = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a659083
 SRC_URI[lzma-sys-0.1.20.sha256sum] = "5fda04ab3764e6cde78b9974eec4f779acaba7c4e84b36eca3cf77c581b85d27"
 SRC_URI[mailparse-0.16.1.sha256sum] = "60819a97ddcb831a5614eb3b0174f3620e793e97e09195a395bfa948fd68ed2f"
 SRC_URI[matchers-0.2.0.sha256sum] = "d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9"
-SRC_URI[memchr-2.8.2.sha256sum] = "88904434abc2901f197fe8cc55f0445e7ded921dba5911dad2e2b39b48e663c4"
+SRC_URI[memchr-2.8.3.sha256sum] = "cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4beb022d3b367256b91b87513d98"
 SRC_URI[miniz_oxide-0.8.9.sha256sum] = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
 SRC_URI[mio-1.2.0.sha256sum] = "50b7e5b27aa02a74bac8c3f23f448f8d87ff11f92d3aac1a6ed369ee08cc56c1"
 SRC_URI[munge-0.4.7.sha256sum] = "5e17401f259eba956ca16491461b6e8f72913a0a114e39736ce404410f915a0c"
@@ -444,8 +444,8 @@ SRC_URI[redox_syscall-0.5.15.sha256sum] = "7e8af0dde094006011e6a740d487931943948
 SRC_URI[ref-cast-1.0.25.sha256sum] = "f354300ae66f76f1c85c5f84693f0ce81d747e2c3f21a45fef496d89c960bf7d"
 SRC_URI[ref-cast-impl-1.0.25.sha256sum] = "b7186006dcb21920990093f30e3dea63b7d6e977bf1256be20c3563a5db070da"
 SRC_URI[reflink-copy-0.1.30.sha256sum] = "d9dd7ab4af0363d5ccfd2838d782a28196cf32a5cc2e4fe3c5dc83f2be588b8b"
-SRC_URI[regex-1.12.4.sha256sum] = "f1292b7759ae1cb9ec195452d1390a074f0cd8541ab7a5a8c31cd6db45d4a6ba"
-SRC_URI[regex-automata-0.4.14.sha256sum] = "6e1dd4122fc1595e8162618945476892eefca7b88c52820e74af6262213cae8f"
+SRC_URI[regex-1.13.0.sha256sum] = "2a0e75113e14dc5acb068cd0786884f214f1312650a3d36d269f5c4f3cdee8a2"
+SRC_URI[regex-automata-0.4.15.sha256sum] = "1f388202e4b80542a0921078cc23b6333bcf1409c1e3f86404cae4766a6131db"
 SRC_URI[regex-syntax-0.8.11.sha256sum] = "d6f6ff9a378485b298a5286656da665ba74413d36db0979633275d2e708145d4"
 SRC_URI[rend-0.5.3.sha256sum] = "cadadef317c2f20755a64d7fdc48f9e7178ee6b0e1f7fce33fa60f1d68a276e6"
 SRC_URI[rkyv-0.8.17.sha256sum] = "815cc8a37159a463064825246cadb07961e25cd9885908606f6d08a98d8f8874"
@@ -520,7 +520,7 @@ SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d
 SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.23.4.sha256sum] = "bf80a72845275afea99e7f2b434723d3bc7e38470fcd1c7ed39a599c73319a53"
+SRC_URI[uuid-1.23.5.sha256sum] = "ea5fab0d6c3c01ae70085a09cb03d4c7a1d6314e2b3e075392783396d724ca0a"
 SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[vte-0.14.1.sha256sum] = "231fdcd7ef3037e8330d8e17e61011a2c244126acc0a982f4040ac3f9f0bc077"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.11.29.bb b/meta/recipes-devtools/python/python3-uv-build_0.11.32.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.11.29.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.11.32.bb
index 202e7f18343..7f3487d25ca 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.11.29.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.11.32.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "7dd16d50366f410ae494a27be20b45206feeac37d99dc53abfa1a04410069b78"
+SRC_URI[sha256sum] = "906542262cf0e1f507d3e9bcf0a73afa9c9269daf261fbd5357a541b533b3c72"
 
 require ${BPN}-crates.inc
 

