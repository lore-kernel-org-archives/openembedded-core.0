Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3922171B1C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 20:43:01 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id w194so2405132vkw.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2016 13:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=zz9O07G4nGa6DcUmXDXolFE3Wc1maEIOrjEXHPeLOG4=;
	b=uhHCdjqJ8cpu0m4PSaS5kpSGrxmutG7bK+vxDRuGFyNPr3Izic+Nvrdg9+RhAXrs0i
	rFeQDlPh5UY5sl41tm+uEjnEBjOmRzCRTl6+cz2PjxDYm4g6d/4ZFhzF6e77EiD7P2vq
	8eacc5SOVNTt8jnuLjY+1YjsZPca66RnLeBabw8GXwWAzOfrHF6SkWrC8iV0p+QnCbmJ
	ll5xwxmD656BzpM/ze7rvMoyIfXrugCqFNGR00zkseiO8odRFdHw944rB66dhRQG9rQa
	uHAVQJWW6Sofizd9SDDZEgy0IrsB3XXBV5AThT7TOIpw/lS36wlxX/ovdXN0pIoe26Cr
	Z9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=zz9O07G4nGa6DcUmXDXolFE3Wc1maEIOrjEXHPeLOG4=;
	b=Bbq/25e8dfY0UgWXlzSpEshr+Z3MYDJtAUWVYiq3Z/etRejpYlFp9HZxD4l0Y8HDJr
	N+9BIhPnrHepG464TiCpxUc1CnGwc9vD5PY/uq3MjVrVQ2k3PzWbEI5sehpOqW3k0qLj
	s9aw5ERPWVrhV1DjyrYs/Ma7rK3LvRDCRotTt6i0Lf63ute7kxGzKiKuhmjP036VNX9W
	U5Y3cXc25nwb0E5DnWvLOXdQ4IkKJ3ucHcI9GgRWzHlu72lwtxa2X1mS5gJDoJBFA8Gq
	R7OJgsSYdVJWp6kfoZmqe1OvAFwDcVYcNuATIVV2q+cDvgRir4Lh1cYWqj3CeWCOU4s8
	DiEw==
X-Gm-Message-State: ABUngvc9vKzu8ihzH0lkvC9XJl8viVnwruaePu3yqHDkUnzzQkWmvBF8JuFktxUvBZtq7g==
X-Received: by 10.31.138.143 with SMTP id m137mr8982938vkd.148.1478205783167; 
	Thu, 03 Nov 2016 13:43:03 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.155.148])
	by smtp.gmail.com with ESMTPSA id 42sm2151339uah.2.2016.11.03.13.43.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Nov 2016 13:43:02 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Nov 2016 18:41:59 -0200
Message-Id: <1478205719-28589-3-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1478205719-28589-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1478205719-28589-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] 3/3] readline: Update to version 7.0
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
X-List-Received-Date: Thu, 03 Nov 2016 20:43:02 -0000

Remove readline 6.3 patches and config-dirent-symbols.patch already
apply on upstream.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../configure-fix.patch                            |  0
 .../{readline-6.3 => readline-7.0}/norpath.patch   |  0
 meta/recipes-core/readline/readline_6.3.bb         | 34 ----------------------
 meta/recipes-core/readline/readline_7.0.bb         |  7 +++++
 4 files changed, 7 insertions(+), 34 deletions(-)
 rename meta/recipes-core/readline/{readline-6.3 => readline-7.0}/configure-fix.patch (100%)
 rename meta/recipes-core/readline/{readline-6.3 => readline-7.0}/norpath.patch (100%)
 delete mode 100644 meta/recipes-core/readline/readline_6.3.bb
 create mode 100644 meta/recipes-core/readline/readline_7.0.bb

diff --git a/meta/recipes-core/readline/readline-6.3/configure-fix.patch b/meta/recipes-core/readline/readline-7.0/configure-fix.patch
similarity index 100%
rename from meta/recipes-core/readline/readline-6.3/configure-fix.patch
rename to meta/recipes-core/readline/readline-7.0/configure-fix.patch
diff --git a/meta/recipes-core/readline/readline-6.3/norpath.patch b/meta/recipes-core/readline/readline-7.0/norpath.patch
similarity index 100%
rename from meta/recipes-core/readline/readline-6.3/norpath.patch
rename to meta/recipes-core/readline/readline-7.0/norpath.patch
diff --git a/meta/recipes-core/readline/readline_6.3.bb b/meta/recipes-core/readline/readline_6.3.bb
deleted file mode 100644
index 8ec7c4a..0000000
--- a/meta/recipes-core/readline/readline_6.3.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-require readline.inc
-
-SRC_URI += "${GNU_MIRROR}/readline/readline-6.3-patches/readline63-001;name=patch1;apply=yes;striplevel=0 \
-            ${GNU_MIRROR}/readline/readline-6.3-patches/readline63-002;name=patch2;apply=yes;striplevel=0 \
-            ${GNU_MIRROR}/readline/readline-6.3-patches/readline63-003;name=patch3;apply=yes;striplevel=0 \
-            ${GNU_MIRROR}/readline/readline-6.3-patches/readline63-004;name=patch4;apply=yes;striplevel=0 \
-            ${GNU_MIRROR}/readline/readline-6.3-patches/readline63-005;name=patch5;apply=yes;striplevel=0 \
-            ${GNU_MIRROR}/readline/readline-6.3-patches/readline63-006;name=patch6;apply=yes;striplevel=0 \
-            ${GNU_MIRROR}/readline/readline-6.3-patches/readline63-007;name=patch7;apply=yes;striplevel=0 \
-            ${GNU_MIRROR}/readline/readline-6.3-patches/readline63-008;name=patch8;apply=yes;striplevel=0 \
-            file://configure-fix.patch \
-            file://config-dirent-symbols.patch \
-            file://norpath.patch"
-
-SRC_URI[archive.md5sum] = "33c8fb279e981274f485fd91da77e94a"
-SRC_URI[archive.sha256sum] = "56ba6071b9462f980c5a72ab0023893b65ba6debb4eeb475d7a563dc65cafd43"
-
-SRC_URI[patch1.md5sum]    = "4343f5ea9b0f42447f102fb61576b398"
-SRC_URI[patch1.sha256sum] = "1a79bbb6eaee750e0d6f7f3d059b30a45fc54e8e388a8e05e9c3ae598590146f"
-SRC_URI[patch2.md5sum]    = "700295212f7e2978577feaee584afddb"
-SRC_URI[patch2.sha256sum] = "39e304c7a526888f9e112e733848215736fb7b9d540729b9e31f3347b7a1e0a5"
-SRC_URI[patch3.md5sum]    = "af4963862f5156fbf9111c2c6fa86ed7"
-SRC_URI[patch3.sha256sum] = "ec41bdd8b00fd884e847708513df41d51b1243cecb680189e31b7173d01ca52f"
-SRC_URI[patch4.md5sum]    = "11f9def89803a5052db3ba72394ce14f"
-SRC_URI[patch4.sha256sum] = "4547b906fb2570866c21887807de5dee19838a60a1afb66385b272155e4355cc"
-SRC_URI[patch5.md5sum]    = "93721c31cd225393f80cb3aadb165544"
-SRC_URI[patch5.sha256sum] = "877788f9228d1a9907a4bcfe3d6dd0439c08d728949458b41208d9bf9060274b"
-SRC_URI[patch6.md5sum]    = "71dc6ecce66d1489b96595f55d142a52"
-SRC_URI[patch6.sha256sum] = "5c237ab3c6c97c23cf52b2a118adc265b7fb411b57c93a5f7c221d50fafbe556"
-SRC_URI[patch7.md5sum]    = "062a08ed60679d3c4878710b3d595b65"
-SRC_URI[patch7.sha256sum] = "4d79b5a2adec3c2e8114cbd3d63c1771f7c6cf64035368624903d257014f5bea"
-SRC_URI[patch8.md5sum]    = "ee1c04072154826870848d8b218d7b04"
-SRC_URI[patch8.sha256sum] = "3bc093cf526ceac23eb80256b0ec87fa1735540d659742107b6284d635c43787"
-
diff --git a/meta/recipes-core/readline/readline_7.0.bb b/meta/recipes-core/readline/readline_7.0.bb
new file mode 100644
index 0000000..85dfaa6
--- /dev/null
+++ b/meta/recipes-core/readline/readline_7.0.bb
@@ -0,0 +1,7 @@
+require readline.inc
+
+SRC_URI += "file://configure-fix.patch \
+            file://norpath.patch"
+
+SRC_URI[archive.md5sum] = "205b03a87fc83dab653b628c59b9fc91"
+SRC_URI[archive.sha256sum] = "750d437185286f40a369e1e4f4764eda932b9459b5ec9a731628393dd3d32334"
-- 
2.1.4


