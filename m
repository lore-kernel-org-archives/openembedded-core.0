Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id C1E0871C80
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 11:09:00 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id w194so3057739vkw.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2016 04:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=ZMtYivp8Zph5ueV+M8mT6w4R5hHokRScrQjAvqwVBno=;
	b=OYQxNI1ZHq0lR2xQtIRv2m1PlrVyzcZiM6q8kPhAviYpykDyVCEMR0Vi50ScNcDSjL
	0rihuTLbXtLVqNKcOAvN59UxtTghcQOdp9vpdcY5B1jwkS/zVK9lowH+6e+5ady5xRAA
	+yB4tG3lfgqpVyn8prBMh7juTG9tlgTtrv1E/WxqgOdu1XdzCMUBkXz2KJIbRGdHn5rH
	RO2ah/nyC+7v3IsUlFrb7z222DHFSPiVw2ij5GAyev5nWoXxJkR/UVMyKCDKAOCYWwIO
	eClJGqK5RrG5IZfxittiVwOkM3qrQy3kUkVFVRjSrQ5Tw6eweu5vdyFEQ4ciE9qPXFDa
	3GoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=ZMtYivp8Zph5ueV+M8mT6w4R5hHokRScrQjAvqwVBno=;
	b=eMrlAYp3Mxugtq0gZG1JvzXkOHOetqALMRQnVHjY8y2X/LLZhzv276PyY7an7gsa6A
	QyUacwwAc2br9GuvAXW2DcXgnrGecNHNLAXsQPn7MhRQhwIopTr/RRvwzSQAM5VJcuq/
	Gqg8T+IWtBpd2ltgsUM3532/r6lVABORk7+pqmizU1+AB5Fv2Fu/YPjFERsGsNbN/5GT
	q/HDuhjhFC9vjI3+vB2p3CqIwGhPKPsoCzoQavOEpNx+lJeHg7XZEqDdGvrnQv03wGDh
	zBTMDnZyUAgh9hSwy+T2uDjMM/2dXya2fz+rhJ3D25rpKDpdnn1NzpuF0yB6W+TWPs08
	Tgng==
X-Gm-Message-State: ABUngvdaZIQEV+MQaYbtPhhcTMelX99+10kzkwZKMVmoOvxucn9KnUT5F9dwP7tMK/axog==
X-Received: by 10.31.228.71 with SMTP id b68mr10697947vkh.163.1478257742261;
	Fri, 04 Nov 2016 04:09:02 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([187.23.155.148])
	by smtp.gmail.com with ESMTPSA id
	b186sm2760846vkf.15.2016.11.04.04.09.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 Nov 2016 04:09:01 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2016 09:08:38 -0200
Message-Id: <1478257718-6928-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [PATCH v2]] gawk: Update to version 4.1.4
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
X-List-Received-Date: Fri, 04 Nov 2016 11:09:04 -0000

Add patch to remove hashbang line in file test/arrayind1.awk. This
patch fixes:
/
|WARNING: gawk-4.1.4-r0 do_package_qa: QA Issue:
|/usr/lib/gawk/ptest/test/arrayind1.awk contained in package gawk-ptest
|requires /usr/local/bin/awk, but no providers found in RDEPENDS_gawk-ptest?
|[file-rdeps]
\

Patch was submitted to upstream [1]

[1] https://lists.gnu.org/archive/html/bug-gawk/2016-11/msg00003.html

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../gawk/{gawk-4.1.3 => gawk-4.1.4}/run-ptest      |  0
 .../test-arrayind1-Remove-hashbang-line.patch      | 30 ++++++++++++++++++++++
 .../gawk/{gawk_4.1.3.bb => gawk_4.1.4.bb}          |  5 ++--
 3 files changed, 33 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/gawk/{gawk-4.1.3 => gawk-4.1.4}/run-ptest (100%)
 create mode 100644 meta/recipes-extended/gawk/gawk-4.1.4/test-arrayind1-Remove-hashbang-line.patch
 rename meta/recipes-extended/gawk/{gawk_4.1.3.bb => gawk_4.1.4.bb} (85%)

diff --git a/meta/recipes-extended/gawk/gawk-4.1.3/run-ptest b/meta/recipes-extended/gawk/gawk-4.1.4/run-ptest
similarity index 100%
rename from meta/recipes-extended/gawk/gawk-4.1.3/run-ptest
rename to meta/recipes-extended/gawk/gawk-4.1.4/run-ptest
diff --git a/meta/recipes-extended/gawk/gawk-4.1.4/test-arrayind1-Remove-hashbang-line.patch b/meta/recipes-extended/gawk/gawk-4.1.4/test-arrayind1-Remove-hashbang-line.patch
new file mode 100644
index 0000000..d4262ed
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk-4.1.4/test-arrayind1-Remove-hashbang-line.patch
@@ -0,0 +1,30 @@
+From a3a3f26078223c47871c7b53e5c015ad163ae045 Mon Sep 17 00:00:00 2001
+From: Fabio Berton <fabio.berton@ossystems.com.br>
+Date: Thu, 3 Nov 2016 14:50:52 -0200
+Subject: [PATCH] test/arrayind1: Remove hashbang line
+Organization: O.S. Systems Software LTDA.
+
+Remove "#!/usr/local/bin/awk -f" as none of the other awk scripts in the
+test suite have a hashbang.
+
+Upstream-Status: Submitted [1]
+
+[1] https://lists.gnu.org/archive/html/bug-gawk/2016-11/msg00003.html
+
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+---
+ test/arrayind1.awk | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/test/arrayind1.awk b/test/arrayind1.awk
+index 5d4a6f3..59e8b4e 100755
+--- a/test/arrayind1.awk
++++ b/test/arrayind1.awk
+@@ -1,4 +1,3 @@
+-#!/usr/local/bin/awk -f
+ # this script renums pedigrees with metafounders
+ # so that they are added *before*regular animals
+ # mf are ascertained because they are not in the 1st column
+-- 
+2.1.4
+
diff --git a/meta/recipes-extended/gawk/gawk_4.1.3.bb b/meta/recipes-extended/gawk/gawk_4.1.4.bb
similarity index 85%
rename from meta/recipes-extended/gawk/gawk_4.1.3.bb
rename to meta/recipes-extended/gawk/gawk_4.1.4.bb
index 6ca7f3e..b888df1 100644
--- a/meta/recipes-extended/gawk/gawk_4.1.3.bb
+++ b/meta/recipes-extended/gawk/gawk_4.1.4.bb
@@ -17,10 +17,11 @@ PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
 
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
+           file://test-arrayind1-Remove-hashbang-line.patch \
 "
 
-SRC_URI[md5sum] = "55d37f4069502677f25d1340df8eec97"
-SRC_URI[sha256sum] = "524effa5b9ecd4ed940f2581c5d3c1df4e4bd7e6f768aa033c1916f47dfc6e29"
+SRC_URI[md5sum] = "f20c94ca51b6ebfc9bffb90f95c8ffbb"
+SRC_URI[sha256sum] = "8c03080e2b5a56263e8783f6f1f306398d4591be18254041f3f547efef944d35"
 
 inherit autotools gettext texinfo update-alternatives
 
-- 
2.1.4


