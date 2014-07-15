Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 267E77022A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 16:18:47 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id u57so3647039wes.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 09:18:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=6Hep/3JIS9uwcTd1dcAbZz6vVP4nQvmo+e8+AYcVnwA=;
	b=YqYBIZWJ6m2+LDyI/FVUE4Vfi347N9IITzPT6BIDGRoyc5kTSf3YWWqfmjySpK6Qv4
	L2bmu0hKd5RQG5wZwR+CdANOXrZkRaiPHlkvOSjidnVghrF7rcig6Ao5jCIWDluiUdyH
	qo3wDLGWgoZ/t1j6A41qc8o51TD68CaBgSZkEXlzCJC26WLNgjRug0vRRAGIC4BFzZqK
	QBCGAMSg3iK2svFZnJJ1uDuKR6q4mDzGB24zfdF+7Fy8IFOSRV0CImVtLJZy4oKfARKe
	hnpIqEeCnI2tHfGGNzO/WCoqZqT9wkwqlOaCYfPs/NQTed0Fkm23YEHGo0yINvqyDsK0
	lzdw==
X-Gm-Message-State: ALoCoQlWkEDJT79VdR0LUmEhHdDOEbkaVW2IUd59C8kfWVFxbqK7WLGBcl0e3gZETTMeashPOjcO
X-Received: by 10.180.24.97 with SMTP id t1mr6803725wif.45.1405441128723;
	Tue, 15 Jul 2014 09:18:48 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	au7sm33554040wjc.41.2014.07.15.09.18.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 09:18:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 17:18:35 +0100
Message-Id: <a06eef80fa6a0912e704aa2d1fce598c46f7b588.1405440532.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1405440532.git.ross.burton@intel.com>
References: <cover.1405440532.git.ross.burton@intel.com>
In-Reply-To: <cover.1405440532.git.ross.burton@intel.com>
References: <cover.1405440532.git.ross.burton@intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/7] oprofile: use "foreign" automake strictness
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
X-List-Received-Date: Tue, 15 Jul 2014 16:18:48 -0000

oprofile doesn't want GNU-levels of automake strictness so tell it to be
"foreign".

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/oprofile/oprofile.inc                    |    1 +
 meta/recipes-kernel/oprofile/oprofile/automake-foreign.patch |    7 +++++++
 2 files changed, 8 insertions(+)
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/automake-foreign.patch

diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
index 76d0b6c..6958203 100644
--- a/meta/recipes-kernel/oprofile/oprofile.inc
+++ b/meta/recipes-kernel/oprofile/oprofile.inc
@@ -20,6 +20,7 @@ FILES_${PN}-staticdev += "${libdir}/${BPN}/lib*.a"
 
 SRC_URI = "file://opstart.patch \
            file://acinclude.m4 \
+           file://automake-foreign.patch \
            file://oprofile-cross-compile-tests.patch \
            file://run-ptest \
            file://root-home-dir.patch"
diff --git a/meta/recipes-kernel/oprofile/oprofile/automake-foreign.patch b/meta/recipes-kernel/oprofile/oprofile/automake-foreign.patch
new file mode 100644
index 0000000..e82a381
--- /dev/null
+++ b/meta/recipes-kernel/oprofile/oprofile/automake-foreign.patch
@@ -0,0 +1,7 @@
+diff --git a/configure.ac b/configure.ac
+index 5740585..cf6c316 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -16 +16 @@ AC_CONFIG_SRCDIR([libop/op_config.h])
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([foreign])
-- 
1.7.10.4


