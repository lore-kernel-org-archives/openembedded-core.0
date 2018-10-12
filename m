Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 98D4360069
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 13:43:59 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id n1-v6so13493066wrt.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 06:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=LlDKXL58lCLfnj0RnMKrDZiS+2UNkvDbGKV3a9lVm4Q=;
	b=R5urvRfulYse3hhSAXlyN9DKmd5kpdW7jO+KlwbS1NJ41VPXA5aycYhDXv3HaJNIKO
	z57kpp607HtiNN4swsSvKAaW545XcMzvKzGINK+xF3lTq6hqeT1xaWIRIMbMzD2FUHUe
	Mzazuiqm7cBrIMouhL0yERaWIeWl0QXWaan/XkIPVLbNn+jfXLuMtYiKqncJFMD1aSnJ
	Se1WVZBIrlPVoDVD3ytIbH0/meAZciufF9TXwpscY+PpjfL6ptPzPCTZNbEXQ2Ab8k1z
	iIfGcKD4gb5JDVGkDlClFczQNQ593FfQu3biK4Afx5AVs/N52pbd//DPNnPofmI/3KMv
	pxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=LlDKXL58lCLfnj0RnMKrDZiS+2UNkvDbGKV3a9lVm4Q=;
	b=OS8EU4DaX0TMS1d4z8w7psskBBvS2dpU62Jn5rIif5+p+iWDwAMmDGk2t7+VvtxVKp
	67qBLl+7a4VazfXVEw8fcXD21Ls8f+ihZw9pab4DNzUybPVY58yuJoZASnVZrz5nfEhA
	5ERfV5cgf9k2LmMI0np48Jr2vi6SSJkM+pb7PNQGGSy3S840VHJTS8wKu01eqchki07v
	9EZt2BCe2QbrDWL5bjWnZYIYpAKLaTGftVhLEXCmDSoSZFSTvUxI/8d6TTP8Xv2WWZdE
	cpQSztS2VHV3hupVflwUHqSJ9mSbxQXAHFnly/Ur0W4u1jDTA833/66OJgnD5zW4JMAg
	twjQ==
X-Gm-Message-State: ABuFfoi06hJhOfKwDgWixgfSRZBz6k+hoxI6WEcqAXAlirf37tpWKDZm
	3jVpM9pf3fy/Ld/AveScafzWmW9OFHk=
X-Google-Smtp-Source: ACcGV60DxcyN8iw3YixQo0NZ2A0G9/7xfNEdhwsoez2jGodngc0ksnLPvytuszBVuP6FafrYOkvrjw==
X-Received: by 2002:a5d:6883:: with SMTP id
	h3-v6mr5404218wru.108.1539351839699; 
	Fri, 12 Oct 2018 06:43:59 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	c24-v6sm1917763wre.44.2018.10.12.06.43.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Oct 2018 06:43:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Oct 2018 14:43:55 +0100
Message-Id: <20181012134355.4654-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] python3: add ptest runner
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
X-List-Received-Date: Fri, 12 Oct 2018 13:43:59 -0000

Copy the Python 2 run-ptest script to execute the Python 3 test suite.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3/run-ptest | 3 +++
 meta/recipes-devtools/python/python3_3.5.6.bb  | 5 ++++-
 2 files changed, 7 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3/run-ptest

diff --git a/meta/recipes-devtools/python/python3/run-ptest b/meta/recipes-devtools/python/python3/run-ptest
new file mode 100644
index 00000000000..3863c6d314f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+python3 -m test -v | sed -e '/\.\.\. ok/ s/^/PASS: /g' -e '/\.\.\. [ERROR|FAIL]/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-devtools/python/python3_3.5.6.bb
index 95915447ab4..e007debeab2 100644
--- a/meta/recipes-devtools/python/python3_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3_3.5.6.bb
@@ -44,9 +44,10 @@ SRC_URI += "\
             file://0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch \
             file://0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch \
             file://0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch \
+            file://run-ptest \
            "
 
-inherit multilib_header python3native update-alternatives qemu
+inherit multilib_header python3native update-alternatives qemu ptest
 
 MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
 
@@ -244,6 +245,8 @@ FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN}"
 PACKAGES += "${PN}-man"
 FILES_${PN}-man = "${datadir}/man"
 
+RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2"
+
 BBCLASSEXTEND = "nativesdk"
 
 # We want bytecode precompiled .py files (.pyc's) by default
-- 
2.11.0


