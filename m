Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R8Oc4-00063J-Mp
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 05:45:45 +0200
Received: by yia27 with SMTP id 27so6021156yia.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2011 20:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=8pmMasrikQhRZHAYMAqAu2yFXJ6lLUxf0Jc2REBwTSo=;
	b=Y1VmBTpBJwAVYtLSE1/x53/74b58qaT4ysG5UL021EeJHw7xgiuNSvsxf7ilpi03rd
	SadzKUQmzwDV8b4pNZHh6WIyPWI/7rHDTxbUdeFxsoEwCAns8zztupSZi9+21Ou1h3av
	FhsWVq5exp7WQPiLJCWQ9jNRpIApSXyrQNez0=
Received: by 10.236.116.65 with SMTP id f41mr44071876yhh.116.1317094815228;
	Mon, 26 Sep 2011 20:40:15 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id g38sm29871657ann.4.2011.09.26.20.40.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Sep 2011 20:40:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Sep 2011 20:39:54 -0700
Message-Id: <97cdb79c75f9a546b287e15ac7a88eaa8b214977.1317094542.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <fd038ffaa07466c14dc983049a9a99989d33be9b.1317094542.git.raj.khem@gmail.com>
References: <fd038ffaa07466c14dc983049a9a99989d33be9b.1317094542.git.raj.khem@gmail.com>
In-Reply-To: <cover.1317094542.git.raj.khem@gmail.com>
References: <cover.1317094542.git.raj.khem@gmail.com>
Subject: [PATCH 4/4] gcc-4.6: Update to tip of FSF gcc-4_6-branch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Sep 2011 03:45:46 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index eef0ef0..a352e36 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r13"
+PR = "r14"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
@@ -16,9 +16,9 @@ PV = "4.6.1+svnr${SRCPV}"
 # 4.6.1 then the value below will have 2 which will mean 4.6.2
 # which will be next minor release and so on.
 
-BINV = "4.6.1"
+BINV = "4.6.2"
 
-SRCREV = 175454
+SRCREV = 178924
 BRANCH = "gcc-4_6-branch"
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.6' ], d)}"
 
-- 
1.7.5.4



