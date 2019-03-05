Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 65CF479D4A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 16:30:10 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id z84so3173885wmg.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2019 08:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=EsvLZ/DvA/8vDcDuFRri9/5GWmF+gmob8eIF0ghPbCA=;
	b=AprZyRmhIEXSir/r/W4bKwHHKgfQHSJiRO+53EfuLfkGGydvgo43WvF/F1hMs1Gxca
	T+a+cXySnU1w8E8fdFGMtQl/i2F5eqtOx3pCNypPylAvcQz+jnaK7M7rxRxMUSln9BZE
	91eEEPcY86xlhTaDQAZ6Lx7I3elLmqq3M4vPyolOs4Mj4VJeyw+PySqQRAmVMRMmLKH/
	92+8rBEsSVpxsRE5Ev9s1DKNeP154OvUQmB14ayydbCLnv2VeOM3YnOIF3JVlXyq1HcT
	QzS/TUNdRKJGlZN6x5BO0U7sRYyUMo0L/TMg7WhQXqAyeaPDOvrq7pKK5ll4I9LnslNo
	bIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=EsvLZ/DvA/8vDcDuFRri9/5GWmF+gmob8eIF0ghPbCA=;
	b=qhvwKoPYf2+7X48NvVw0KQGd6L3yU87lUDEVrjIpocH9QcLJBBYxIbPfV0zUUm9BkN
	0SIH0TfqoHvMuxDH0ErzMHHWmBYMEWXJUy5U2xWwTFkMMh1pjX85TdCdTQTYzBhBce6X
	i88XmRqO45gXsM+GqbttWelqz8FOFttjqYqxOBDLjxFGwepJ1P6NJen54IY8nrRoTGsU
	8TM5vvGsXzNgagjwyZLcVb7rGPKxQiiRdj7Z0IhiSL6J3TmfdUkBPW7UUa+hPH/ZdqU9
	dUlEAtaYRPmYWPD7B0YJpREpnlAsLGgCXjVttIrX1n8ug+LwsyWPnvhjPCTLi5jdAnJO
	AJzQ==
X-Gm-Message-State: APjAAAUCW+a5+WvMf+cHGbdGIbQg17heUyHesF/q3ErC9oIGW7I/pQQk
	SOIRRSvVHsLYeh8lac9n+aANp4G1RB0=
X-Google-Smtp-Source: APXvYqwdkOGWQYPQvbCuKeV07emOC730tvtcqRHcgpzYH1+uwES09fa6NVSfP5VRb7XqGexLWNGvrA==
X-Received: by 2002:a7b:cc93:: with SMTP id p19mr3338110wma.113.1551803410788; 
	Tue, 05 Mar 2019 08:30:10 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e6sm10511265wrt.14.2019.03.05.08.30.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Mar 2019 08:30:10 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Mar 2019 16:30:01 +0000
Message-Id: <20190305163003.16745-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190305163003.16745-1-ross.burton@intel.com>
References: <20190305163003.16745-1-ross.burton@intel.com>
Subject: [PATCH 3/5] file: upgrade to 5.36
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
X-List-Received-Date: Tue, 05 Mar 2019 16:30:10 -0000

Upgrade to 5.36.

Drop debian-742262.patch, this appears to have been fixed properly upstream some
releases ago.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-devtools/file/file/debian-742262.patch | 27 ----------------------
 .../file/{file_5.35.bb => file_5.36.bb}            |  6 ++---
 2 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-devtools/file/file/debian-742262.patch
 rename meta/recipes-devtools/file/{file_5.35.bb => file_5.36.bb} (90%)

diff --git a/meta/recipes-devtools/file/file/debian-742262.patch b/meta/recipes-devtools/file/file/debian-742262.patch
deleted file mode 100644
index 319f9dbcf9b..00000000000
--- a/meta/recipes-devtools/file/file/debian-742262.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-The awk pattern was checked *before* the Perl pattern, so the
-perl script with BEGIN{...} would be reported as awk, this patch fixes it.
-
-Upstream-Status: Backport [debian]
-
-Signed-off-by: Christoph Biedl <debian.axhn@manchmal.in-ulm.de>
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
-Rebase on 5.31
-
-Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
----
- magic/Magdir/commands | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/magic/Magdir/commands b/magic/Magdir/commands
-index f6ad1c8..f79e7dd 100644
---- a/magic/Magdir/commands
-+++ b/magic/Magdir/commands
-@@ -57,6 +57,7 @@
- 0	string/wt	#!\ /usr/bin/awk	awk script text executable
- !:mime	text/x-awk
- 0	regex/4096	=^[\040\t\f\r\n]{0,100}BEGIN[\040\t\f\r\n]{0,100}[{]	awk or perl script text
-+!:strength - 12
- 
- # AT&T Bell Labs' Plan 9 shell
- 0	string/wt	#!\ /bin/rc	Plan 9 rc shell script text executable
diff --git a/meta/recipes-devtools/file/file_5.35.bb b/meta/recipes-devtools/file/file_5.36.bb
similarity index 90%
rename from meta/recipes-devtools/file/file_5.35.bb
rename to meta/recipes-devtools/file/file_5.36.bb
index 2f0589de686..1a81fde259d 100644
--- a/meta/recipes-devtools/file/file_5.35.bb
+++ b/meta/recipes-devtools/file/file_5.36.bb
@@ -14,11 +14,9 @@ DEPENDS_class-native = "zlib-native"
 # Blacklist a bogus tag in upstream check
 UPSTREAM_CHECK_GITTAGREGEX = "FILE(?P<pver>(?!6_23).+)"
 
-SRC_URI = "git://github.com/file/file.git \
-        file://debian-742262.patch \
-        "
+SRC_URI = "git://github.com/file/file.git"
 
-SRCREV = "d1ff3af7a2c6b38bdbdde7af26b59e3c50a48fff"
+SRCREV = "f3a4b9ada3ca99e62c62b9aa78eee4935a8094fe"
 S = "${WORKDIR}/git"
 
 inherit autotools update-alternatives
-- 
2.11.0


