Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5A8957FD0B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:24:03 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id y17so10002533wrh.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 08:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ApNYXbMRGSLDinGsUUIfXFIVGDznDYHrUTV3d6iL6PI=;
	b=PBPMDx3hWwzCt9s6Fpc02bSP10VPJla5i0Ahf3JoBeDKGOirf7ttmSLTZh9W3tXcx6
	Bce+LHjxZ/WcaDqfkHNGD2GD51s+IOhRY8uqdiUfMMgfQ4lVSL1W3tEW98NJ0mJykwTt
	Ugvh5X0MKMcopMqztsJJDmxQCnVGyI6X8u0+DKeAqdtIGrWQeo+e4CyCeo27lA2q8NLM
	K34mDurrpnJEv6HsW9oG5glQWnfdR0elWyYVw0vGR2da+371sMmMaD90pNcxlb0Tu6bA
	qA4/h4RVaFfp+4JWEqibsWIMgNpUVp6eScVEpQGe4hirGTuffBf96JM4K4YszqjioDUm
	8jkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ApNYXbMRGSLDinGsUUIfXFIVGDznDYHrUTV3d6iL6PI=;
	b=LX1WCAj8CrpApTs1gce90KhhW8iXROxSMFsVmia6Y3Xwvu+YsMD8ay8fMq5jBOO1VP
	T/bklLn1KfAPYkCtgj6B2ydurtmkvbpB5H/T7qRIhKteNWo7S4n4wAJ2rBkvU4rFoUVP
	VGQlfkBddThz6HQk+1u/Nf+7/LBzpQGMy7y8JTFji4uV+/rG6ljTpiH8+vyh/BuXtbj1
	FADGi0gqedpZYkezeh4kI9PRAAkY9e2vPQ8YLyOyO7InZDx2C7NuDvXpIMvu6oTePfP3
	tkg+LL1AdQLv6b00/E/gomrCDnuACjtbXm479NnaEx0n2xEiB5cL7gowi8Ze8J9gTDBd
	c5LA==
X-Gm-Message-State: APjAAAWSOBRmoNQmQZJlDgQwbbVvX0x7Ht3pLiv8oWyHJZbWroRtB6eq
	kEC1rHuev14dgZrGc+RD6t4/XYojQk4=
X-Google-Smtp-Source: APXvYqw7ZxEPqLDey/qZLMIJCSNSmIOeo7nbpIcTVbV00h5ZMyyIBg9c2N1N8mpBQjgR4RJoj4HHCg==
X-Received: by 2002:a5d:51c6:: with SMTP id n6mr15535957wrv.250.1576859043633; 
	Fri, 20 Dec 2019 08:24:03 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	w17sm10436356wrt.89.2019.12.20.08.24.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 08:24:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2019 17:23:49 +0100
Message-Id: <20191220162351.94498-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191220162351.94498-1-alex.kanavin@gmail.com>
References: <20191220162351.94498-1-alex.kanavin@gmail.com>
Subject: [PATCH 09/11] libxml-parser-perl: update to 2.46
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
X-List-Received-Date: Fri, 20 Dec 2019 16:24:03 -0000

License-Update: readme no longer carries a copyright notice, so take it from a source file
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ot-attempt-to-run-a-cross-executable.patch | 24 +++++++++++++++++++
 ...erl_2.44.bb => libxml-parser-perl_2.46.bb} | 11 +++++----
 2 files changed, 31 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/files/0001-CheckLib.pm-do-not-attempt-to-run-a-cross-executable.patch
 rename meta/recipes-devtools/perl/{libxml-parser-perl_2.44.bb => libxml-parser-perl_2.46.bb} (81%)

diff --git a/meta/recipes-devtools/perl/files/0001-CheckLib.pm-do-not-attempt-to-run-a-cross-executable.patch b/meta/recipes-devtools/perl/files/0001-CheckLib.pm-do-not-attempt-to-run-a-cross-executable.patch
new file mode 100644
index 00000000000..c5bbe7888ed
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/0001-CheckLib.pm-do-not-attempt-to-run-a-cross-executable.patch
@@ -0,0 +1,24 @@
+From a033c9ece12b6eead48eed63f106ccdec6159b0c Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 20 Dec 2019 16:26:55 +0100
+Subject: [PATCH] CheckLib.pm: do not attempt to run a cross executable
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ inc/Devel/CheckLib.pm | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/inc/Devel/CheckLib.pm b/inc/Devel/CheckLib.pm
+index 36a451a..b04acc1 100644
+--- a/inc/Devel/CheckLib.pm
++++ b/inc/Devel/CheckLib.pm
+@@ -330,7 +330,7 @@ sub assert_lib {
+         push @missing, $lib if $rv != 0 || !-x $exefile;
+         my $absexefile = File::Spec->rel2abs($exefile);
+         $absexefile = '"' . $absexefile . '"' if $absexefile =~ m/\s/;
+-        push @wrongresult, $lib if $rv == 0 && -x $exefile && system($absexefile) != 0;
++        push @wrongresult, $lib if $rv == 0 && -x $exefile && 0 != 0;
+         unlink $ofile if -e $ofile;
+         _cleanup_exe($exefile);
+     }
diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb
similarity index 81%
rename from meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
rename to meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb
index 7c9b7696a7a..bc154bbdc50 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.46.bb
@@ -2,13 +2,16 @@ SUMMARY = "XML::Parser - A perl module for parsing XML documents"
 HOMEPAGE = "https://libexpat.github.io/"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://README;beginline=2;endline=6;md5=c8767d7516229f07b26e42d1cf8b51f1"
+LIC_FILES_CHKSUM = "file://Parser.pm;beginline=1;endline=7;md5=d12cc778c80fc4c518f0e5dee29fd5fb"
 
 DEPENDS += "expat"
 
-SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}.tar.gz"
-SRC_URI[md5sum] = "af4813fe3952362451201ced6fbce379"
-SRC_URI[sha256sum] = "1ae9d07ee9c35326b3d9aad56eae71a6730a73a116b9fe9e8a4758b7cc033216"
+SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}.tar.gz \
+           file://ptest-perl/run-ptest \
+           file://0001-CheckLib.pm-do-not-attempt-to-run-a-cross-executable.patch \
+           "
+SRC_URI[md5sum] = "80bb18a8e6240fcf7ec2f7b57601c170"
+SRC_URI[sha256sum] = "d331332491c51cccfb4cb94ffc44f9cd73378e618498d4a37df9e043661c515d"
 
 S = "${WORKDIR}/XML-Parser-${PV}"
 
-- 
2.17.1


