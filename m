Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QW0Pz-0005UG-8G
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 08:14:35 +0200
Received: by mail-pw0-f47.google.com with SMTP id 9so2072308pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2011 23:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=e3BxEZ1H7/7K5Qj12YCjH1Ah9DX/8qfRdr0xZ3pau0M=;
	b=jk8a72ak/O2E+CCsMuRqa6RCk60s3mV6+sJRr4qWosm7NFKD+lroNZPWWTVPwfWL4S
	DWDwWCZhP1NTW7p3Cy5vS1XX1x0C8tKd6lgD76EIYxVC3oLB/VFn4uvDtHGVEZddOAHk
	LWDskMfVwfeCHLqA+dGtZfRYErgVk71US26BM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=NAONTZosvWo6MGnpAn8UudKAoseHgModoMHJJKTXRK0IJEJ41GZtxokvPBY+rTaN8I
	BSCjndAZxFna8tRL5NibphP+33dx7+VdULLNBBKDxtulupVuQzbsF6W52G8fe1UlEn08
	WcfazKfUYXDgSCNagtD+1zT3LQQBLwuvf+H8A=
Received: by 10.68.7.4 with SMTP id f4mr1895284pba.208.1307945472888;
	Sun, 12 Jun 2011 23:11:12 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p5sm4383819pbd.60.2011.06.12.23.11.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 12 Jun 2011 23:11:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Jun 2011 23:10:50 -0700
Message-Id: <c4a7531b0361a57f7f4b2e4d92ae52b563ce0872.1307945310.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1307945310.git.raj.khem@gmail.com>
References: <cover.1307945310.git.raj.khem@gmail.com>
Subject: [PATCH 1/1] eglibc 2.12/2.13: Upgrade SRCREV
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
X-List-Received-Date: Mon, 13 Jun 2011 06:14:35 -0000

We need http://www.eglibc.org/archives/patches/msg00923.html
to get through the problem we see when OPTION_EGLIBC_RTLD_DEBUG
is disabled. This patch has been backported to both 2.12 and 2.13
branches. We bump SRCREVs to have that change.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/eglibc/eglibc_2.12.bb |    2 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc_2.12.bb b/meta/recipes-core/eglibc/eglibc_2.12.bb
index e69cd0f..d851b5d 100644
--- a/meta/recipes-core/eglibc/eglibc_2.12.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.12.bb
@@ -4,7 +4,7 @@ DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
 PR = "r14"
 
-SRCREV = "11982"
+SRCREV = "14158"
 
 EGLIBC_BRANCH="eglibc-2_12"
 SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http \
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index c77bf3c..9a9773c 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -1,6 +1,6 @@
 require eglibc.inc
 
-SRCREV = "13356"
+SRCREV = "14157"
 
 DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
-- 
1.7.4.1



