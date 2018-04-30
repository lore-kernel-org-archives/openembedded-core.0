Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id EFBE76011F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 14:15:00 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id o76so6840550pfi.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 07:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=d8hyZq2XIny9ZJmGD8ST85K0JV0sXnv/iNyDtlRMSOw=;
	b=KHmueqo02uWL/h0FYwYMmZz4tIqPmyniDuKpJdyEIlqytZkLbkG3Kv8sZ/n8IuyMVl
	cPOPGT6mzPbjbWJ/MttNeAOiwOn+VqdfdOArw82AdpZlcYBDt1/zs29FLpiR3cnd4xe4
	Heexb/bT1z2SVp1IXmG6mPDSbSHi/xIdTRVgRoLauPgjhsklwaUj1+t444mDnQ2Y92Ke
	AwBGD+9wwiA0WWcciBKSIAdU95yRixs7+MFWo71k3Divx2KmqGNLzlJfK+w/YkLrUroN
	Une1crFJ9Ah+SBgbS//ZnZ4v8uZvavW21dIPUcz3wGKexX8KH+pRfZegmokqm7CIRCnr
	Xnlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=d8hyZq2XIny9ZJmGD8ST85K0JV0sXnv/iNyDtlRMSOw=;
	b=mav9i+yBq13jxvliLI4H6N1nTx0oiIkQZ6QzFOM+7deoM5jx2MiQyrnffR3yqvRxhH
	CRsUJFpa1WiOdYf0FD/7R9YplSNlQdGBW49QfxMRm/TpICOvlI/NSUMENWXt2X1M+2oQ
	JHbrEP7OUH6ASSCHedAFW8M9JEsBigDqYB/jqcI3YHddTCcfmuidzs8vFg6lWieOLCsw
	TKhjuaZ1PvTT3Q7gPCUVMiD5He25U8yV4NMqdQhR70gArM3gIwnFYgklysVDECRZzbrs
	EsEym0goCF0m6Y4k4LO1beH8UGHKt1d9uSoNXzCu/eGlMFPR5PbLM/kiNZDkNz9MHQ64
	mqJQ==
X-Gm-Message-State: ALQs6tB3V9t6ivqpI4vy3ED/yIsWcF8feUlkWlOP4AYmYfTJgwOyrYn/
	AQCyXZW17mSkCWfoENCDW4c2KQ==
X-Google-Smtp-Source: AB8JxZp+MJ3A32QJZ30YcZj04DbVMu7qF7TaD+fmnRFa+YvYGr/LFyOFgIib2T+nKYbPGziw8UeKVw==
X-Received: by 10.98.141.201 with SMTP id p70mr12139425pfk.72.1525097701560;
	Mon, 30 Apr 2018 07:15:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	b72sm15781621pfm.69.2018.04.30.07.15.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Apr 2018 07:15:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2018 07:14:55 -0700
Message-Id: <20180430141455.2248-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180430141455.2248-1-raj.khem@gmail.com>
References: <20180430141455.2248-1-raj.khem@gmail.com>
Subject: [PATCH V2 10/25] ruby: Upgrade to 2.5.1
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
X-List-Received-Date: Mon, 30 Apr 2018 14:15:01 -0000

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


