Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2969660030
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 08:16:46 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id b13so16457330wgh.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Dec 2014 00:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=TOMeXIeqCpoKx54w6n68yUcRoNSBro1SZxkbgd+ZG5A=;
	b=ZA1RtFuisZAVbvTBkMpIPlWWFVa1QE1d4GCjgxcjQaovbR8eSO+eOxHQyW3URqD1zn
	MPh1ntWVBYQOAmKcUpCP0dq2quTu0BC1voCKo3REHPbmjDnPBApSOJedQizY81ECdBeP
	9qo8pv0jEe+2Rxm84ifKTL4tSNXb4m1idh+hVr5lPGdccplY9v8iWwiisYiZ2YKs2auF
	uyTO6CnPrhF/uOl5bAlDlBMy6N4KufHDL6eXPFNcM0ylzF1pH1AfbfJyVPjEkauKcs9Z
	ABAqpwA3yFiAJdTe8RW64G09bf5iXNCDXP6PW+wMVmlllOJlj0zd9j9K7AvVAoRUg5sv
	LlDA==
X-Received: by 10.180.109.194 with SMTP id hu2mr3119754wib.24.1417508205953;
	Tue, 02 Dec 2014 00:16:45 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id
	wv8sm30692585wjc.44.2014.12.02.00.16.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Dec 2014 00:16:45 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Dec 2014 09:16:37 +0100
Message-Id: <1417508198-30563-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 1/2] pythonnative: set PYTHON_EXECUTABLE so that cmake can find it
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
X-List-Received-Date: Tue, 02 Dec 2014 08:16:53 -0000
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


