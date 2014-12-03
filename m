Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2B07D6AC19
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 12:41:05 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so24228320wiv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Dec 2014 04:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=TOMeXIeqCpoKx54w6n68yUcRoNSBro1SZxkbgd+ZG5A=;
	b=gOFyNwle7FmJekobxYepeKlKIHfEvqFmBIN75m6YoLF6Yy204uIZpNV3VROqgFSgZo
	j9fAc+ENvePEr/5/jdwcgL+T4p8qpoNahxOVYiZBA668bY83zaSKZeoj3ZcxH7HSt8/z
	2+s3rPQujlbDoyshlJJv9CNRxbtD/mpi54IibWGHc+Ec+aKMUl/i+wvd3jRiGn+Bhflx
	xDqmf+9ycm1FnTou0OJdgtnxapmVeS8jP1aabguObCK2ZxvS7d+OIRKcQG+jVLcC1C8f
	UkDjT/2TRD9naT6meeO4ie1deFUSn6+wS6g1ODmbiSIakF05uMi6nGgAxb/JODzrMxiw
	WfyQ==
X-Received: by 10.194.222.1 with SMTP id qi1mr7133857wjc.29.1417610464878;
	Wed, 03 Dec 2014 04:41:04 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id ce1sm36130063wjc.2.2014.12.03.04.41.03
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Dec 2014 04:41:03 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Date: Wed,  3 Dec 2014 13:40:54 +0100
Message-Id: <1417610456-788-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH][V2 1/3] pythonnative: set PYTHON_EXECUTABLE so that cmake can find it
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
X-List-Received-Date: Wed, 03 Dec 2014 12:41:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| CMake Error at /home/a.mueller/tmp/oe-core-glibc/sysroots/x86_64-linux/usr/share/cmake-2.8/Modules/FindPackageHandleStandardArgs.cmake:108 (message):
|   Could NOT find PythonInterp (missing: PYTHON_EXECUTABLE)

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/classes/pythonnative.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/pythonnative.bbclass b/meta/classes/pythonnative.bbclass
index fdd22bb..9fccee9 100644
--- a/meta/classes/pythonnative.bbclass
+++ b/meta/classes/pythonnative.bbclass
@@ -2,5 +2,6 @@
 inherit python-dir
 
 PYTHON="${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}"
+PYTHON_EXECUTABLE="${PYTHON}"
 EXTRANATIVEPATH += "${PYTHON_PN}-native"
 DEPENDS += " ${PYTHON_PN}-native "
-- 
1.8.3.1


