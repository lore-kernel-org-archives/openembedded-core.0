Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id AAD9A74563
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 19:36:27 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id p12so5116845pff.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 12:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=d8hyZq2XIny9ZJmGD8ST85K0JV0sXnv/iNyDtlRMSOw=;
	b=CA98w5pToS85SxhSUjP92mlFcnWACj1Y7G+ZmxK+6oQzRD/MSTJunSPux06EM2VeAH
	AZlXLCUbrjs5zklSgiVf/GEPUbKlxW+vt24a7B+H33WgKAeR6nQiJBzamgp9ZSl7Saso
	7yo9q/7APQF0B1G6ojgX1bdexKdgBw54HGpRmiTTozkn3T2JcD6D9eEgaw3hw5Sk9Ld0
	AcnTmF3JbTIcUNS8EWj341OoySQa8g7Ox95I9PjX8jhX9YHkEvPwI3XtFmNhr6lrXiFP
	AmbeHji1ECcFBUBZK6uM4X7TbsKmxpB5ukMLpxjAJ6ADThMHCq4h5/WAAlOc6i3PsgXZ
	NrWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=d8hyZq2XIny9ZJmGD8ST85K0JV0sXnv/iNyDtlRMSOw=;
	b=PmtL7YIjcpiIg+SVLNp7npVaStQj6WOQLGsBjVnZiMO/6a+osXlU4ncw1zq9mHNPfs
	4j+mi1jyShu50Qg0hxoNH6LqS7ZYjxZYLDrUvy6mQP1j/jB3Nwuwkoe3AwvKjGCXstzZ
	9RryikKXMZZMufvNamzhi+5d0ZlCJvHs3dqoZAEhTX6H5AAnipD4YCbfTC7Enau1y/Of
	fdQsE69mg0XOwzti8G9vuymSA+NBenSW8QhrStVYtIXNPCsCpI31rUJGLDrDiwDfKaog
	TCfrYvGFuMVk+5RhYB88tCHhMz0H1AOQ7lAq1cjjdLKgUN4RmdKQxpc/3YUhHHDCIHoM
	4L4g==
X-Gm-Message-State: ALQs6tD01E0EVq/Xp3DV3ZvOY9zCFZXn9EeOgjFzfo+k47Rwpit1oeyR
	qScT0go689CpBw1izSibuxVoxA==
X-Google-Smtp-Source: AB8JxZqKQ+JgsxIrnRSKz+W3HAH6IaIC1H/yafVDT7IumZUtcq4HCu0W68emepYKaAoym0nhc9tpSQ==
X-Received: by 2002:a17:902:4203:: with SMTP id
	g3-v6mr8636456pld.315.1525030588724; 
	Sun, 29 Apr 2018 12:36:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::ddd5])
	by smtp.gmail.com with ESMTPSA id
	125sm11960737pfc.145.2018.04.29.12.36.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Apr 2018 12:36:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Apr 2018 12:35:57 -0700
Message-Id: <65f84677b46cae1369973753fa7a9bc732248a4c.1525029885.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525029885.git.raj.khem@gmail.com>
References: <cover.1525029885.git.raj.khem@gmail.com>
Subject: [PATCH 10/24] ruby: Upgrade to 1.5.1
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
X-List-Received-Date: Sun, 29 Apr 2018 19:36:28 -0000

License Update: https://github.com/ruby/ruby/commit/322d0d93adfe42fc89c574f67bcb9acb9b82f251#diff-c53151ffd180a17416e8f09b1ca4bfc3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/ruby/ruby.inc                   | 11 +++++------
 .../ruby/{ruby_2.5.0.bb => ruby_2.5.1.bb}             |  4 ++--
 2 files changed, 7 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_2.5.0.bb => ruby_2.5.1.bb} (90%)

diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
index fd3911ba75..a366e93f66 100644
--- a/meta/recipes-devtools/ruby/ruby.inc
+++ b/meta/recipes-devtools/ruby/ruby.inc
@@ -7,12 +7,11 @@ It is simple, straight-forward, and extensible. \
 HOMEPAGE = "http://www.ruby-lang.org/"
 SECTION = "devel/ruby"
 LICENSE = "Ruby | BSD | GPLv2"
-LIC_FILES_CHKSUM = "\
-    file://COPYING;md5=340948e1882e579731841bf49cdc22c1 \
-    file://BSDL;md5=19aaf65c88a40b508d17ae4be539c4b5\
-    file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263\
-    file://LEGAL;md5=8f871f3f03732c018a5fa9b185958231 \
-"
+LIC_FILES_CHKSUM = "file://COPYING;md5=340948e1882e579731841bf49cdc22c1 \
+                    file://BSDL;md5=19aaf65c88a40b508d17ae4be539c4b5 \
+                    file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://LEGAL;md5=23a79bb4c1a40f6cc9bcb6f4e7c39799 \
+                    "
 
 DEPENDS = "ruby-native zlib openssl tcl libyaml gdbm readline"
 DEPENDS_class-native = "openssl-native libyaml-native"
diff --git a/meta/recipes-devtools/ruby/ruby_2.5.0.bb b/meta/recipes-devtools/ruby/ruby_2.5.1.bb
similarity index 90%
rename from meta/recipes-devtools/ruby/ruby_2.5.0.bb
rename to meta/recipes-devtools/ruby/ruby_2.5.1.bb
index 1ac7f2aa5a..91048284c1 100644
--- a/meta/recipes-devtools/ruby/ruby_2.5.0.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.5.1.bb
@@ -5,8 +5,8 @@ SRC_URI += " \
            file://ruby-CVE-2017-9228.patch \
            "
 
-SRC_URI[md5sum] = "f4711f856fe14de222b9da3d3b8efa89"
-SRC_URI[sha256sum] = "46e6f3630f1888eb653b15fa811d77b5b1df6fd7a3af436b343cfe4f4503f2ab"
+SRC_URI[md5sum] = "23867bc8c16c55e43b14dfe0614bcfa8"
+SRC_URI[sha256sum] = "dac81822325b79c3ba9532b048c2123357d3310b2b40024202f360251d9829b1"
 
 # it's unknown to configure script, but then passed to extconf.rb
 # maybe it's not really needed as we're hardcoding the result with
-- 
2.17.0


