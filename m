Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id D1E3A731F4
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jan 2016 14:32:39 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id cy9so297701092pac.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jan 2016 06:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=wX8f3rd2EKok9RaamS+efqXgRtK9J/xJxOkmO2lRaI8=;
	b=sCy8/5FIjkCGJmkgEAefWWvLtH+IbpbeVe/bCwWKri1ZMY+Dcw3LUzqw9MZ3TgORjl
	wrGkRAX5oWtHW/WvbcoM/Z/WUQ7LinboX1x8kcmbtiWGqnbuFZ2+0dn6n2OpB0li3hEI
	X23zcBzl10rff276Cbegie6DYjnH1/Jcnuc/iM/GXR5xXfILFLCum1tta1wMMtqHH7sV
	TmzrpxnJLw9WxVnasQS1oFbIicH+ZfX9AZLEfWO6dZQ3zd8igVDQgbKJHvvt3TMobyCr
	bfLEsmnfGRdx+gJKUk7JrG/YdqC/uTkFpNrYO/DJImF8rHAGgSsNMNm/ZshyoNlst6j3
	peRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wX8f3rd2EKok9RaamS+efqXgRtK9J/xJxOkmO2lRaI8=;
	b=ghsm78Zh6h6d6bu8c213q4tKhD0eKB3wmcvXducaQoLFPa4EC59aqywHDtHMDyTKL+
	wKR02K3wDPOlrwZEm0cbhk2A+EnHgga1fuCocCNAzLbQy2Nzdrk/zHZo4MEZD9udle8K
	rdkWSHu6odKqWlouQajLthmV1dDunGJACjDdpXHJsACJBJlR9z2pqN0MtUdEomyMTpqq
	3vbv/Z1nx4zQCxicR9JNMf4DQCwPw8aTeICqbuQum8O7E6chNnQOsNi4JAxsyTURX9g5
	eW46R6y6YiSr2827jBcqN4hZKtPaDmtxo1M//tuDKiun5w14Nfml9aUxLBHkhQhzpncj
	UiUQ==
X-Gm-Message-State: ALoCoQnZ6sDH5ubwOC/Mjh1R4BFOs13DTcyh6hNEsqzucpaP1p31dnIPQGSzFotXKgBQUG/vOWbHyg0AEy7pMXe0so3JdGuIkQ==
X-Received: by 10.66.236.103 with SMTP id ut7mr21155124pac.4.1452349960148;
	Sat, 09 Jan 2016 06:32:40 -0800 (PST)
Received: from ubuntu64.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	68sm11858413pfa.78.2016.01.09.06.32.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 09 Jan 2016 06:32:38 -0800 (PST)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jan 2016 20:02:31 +0530
Message-Id: <1452349952-11016-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] cantarell-fonts: Add recipe
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
X-List-Received-Date: Sat, 09 Jan 2016 14:32:41 -0000

1. The Cantarell font typeface is designed as a
   contemporary Humanist sans serif, and was developed for 
   on-screen reading; in particular, reading web pages on an
   HTC Dream mobile phone.

2. Pango test case (test-layout.test) requires cantarell-font
   typeface. This test case uses 'Cantarell 11' font type

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../cantarell-fonts/cantarell-fonts_git.bb         | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb

diff --git a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
new file mode 100644
index 0000000..f55fef1
--- /dev/null
+++ b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Cantarell, a Humanist sans-serif font family"
+
+DESCRIPTION = "The Cantarell font typeface is designed as a \
+               contemporary Humanist sans serif, and was developed for \
+               on-screen reading; in particular, reading web pages on an \
+               HTC Dream mobile phone."
+
+HOMEPAGE = "https://git.gnome.org/browse/cantarell-fonts/"
+SECTION = "fonts"
+LICENSE = "OFL-1.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=df91e3ffcab8cfb972a66bf11255188d"
+
+PV = "0.0.18.1+git${SRCPV}"
+PR = "r0"
+
+SRCREV = "3e954528d06de1c7e5ba8ebf8b0cca9c68faa0c4"
+SRC_URI = "git://git.gnome.org/cantarell-fonts;protocol=git;branch=master"
+
+S = "${WORKDIR}/git"
+
+inherit autotools allarch fontcache
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[fontforge] = "--enable-source-rebuild=yes,--enable-source-rebuild=no,fontforge-native"
+FILES_${PN} = "${datadir}/fonts ${datadir}/fontconfig"
-- 
1.9.1


