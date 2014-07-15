Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1B79A6A9C4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 01:41:25 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id fa1so2904505pad.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 18:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=6M7EFTV9Uia/LzKb8qckBIr5s//aui2PQ/ohsKI7I+I=;
	b=PIYYNrH4E9PGRW3u6VVpb+hlUkKQMcMpKp3sVlnfAP9x4u6T7GpHqBMr2mRL+hVaaG
	GBhhteX5t7Lsu9epB3c0nP5/sxRfqm6Sl7RUbZQt+SGkTovR7OQNQrErStsEd3ibTX6n
	aoIP9xfBjnPhmfdLiumHtGOaqaULsYioN3M4dRWWmmmLGbg+0fS/j33H0hWu7u5U4SrY
	BVgmsW0nWuBPgobaqVccA7UngOSTmLJHno/7SPU1IGDmvjkSrngm0Jtd2ZcMdTzy/pyd
	VAAm/JBPuEb5/Et0Bvstn2JvwTdGRBFbFPChHLCADAnRtqfXkUC+ubwuxKinbdGjJS6m
	0POw==
X-Gm-Message-State: ALoCoQmFYW0LiF+ig8FRAT4xpq5R0Z2czyuKcTfkEkivxDmIpidqsJPCLOMJPAAsXKTarNQZhaS/
X-Received: by 10.66.231.139 with SMTP id tg11mr19772671pac.87.1405388486477; 
	Mon, 14 Jul 2014 18:41:26 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55])
	by mx.google.com with ESMTPSA id k8sm12135065pbq.94.2014.07.14.18.41.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Jul 2014 18:41:25 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jul 2014 18:41:23 -0700
Message-Id: <1405388483-30716-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] V2 lz4: update to latest version
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
X-List-Received-Date: Tue, 15 Jul 2014 01:41:27 -0000

update to version r119
Use github instead of svn
LICENSE md5sum changed since it was updated in r117
FIxes CVE-2014-4611

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/lz4/lz4_git.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/recipes-support/lz4/lz4_git.bb

diff --git a/meta/recipes-support/lz4/lz4_git.bb b/meta/recipes-support/lz4/lz4_git.bb
new file mode 100644
index 0000000..3978d76
--- /dev/null
+++ b/meta/recipes-support/lz4/lz4_git.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Extremely Fast Compression algorithm"
+DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0b0d063f37a4477b54af2459477dcafd"
+
+SRCREV = "28fd251bc7b42e5cde15f9a2d78fc53b3b575558"
+SRC_URI= "git://github.com/Cyan4973/lz4.git;branch=master"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}"
+
+do_install() {
+	oe_runmake install
+}
+
+BBCLASSEXTEND += "native nativesdk"
-- 
1.9.1


