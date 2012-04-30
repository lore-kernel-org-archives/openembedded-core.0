Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOuqQ-0002bu-MA
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 19:57:06 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so3372519pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 10:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=vwZ0QPddWfdCXSKxDYQ0Nedwfrn+FPgIUMFaWM0g+/0=;
	b=RywqCFPOO0zVx1N+fPLuJ9gjewHVmbd9HIlSFSncOslwyRWY503wP96bEU3i3+xq0A
	fYUN4aXFnyNCk2cIYwSy58gFDBH/+sXGG0wA3bv0KEYai62HjQGjZl0D775s8r30ztMP
	AHM9vk8PcTBVd0CCxxSJW4R8UHA5wICL+afrl7EgkHVBAeh9zyAjzqWYE7BsdejUqDI/
	hsC6LillJ/RUJVynMcJIXcA/ujsaggezCZyfggERGC3njEgrP9QBRzqtYJwIRd7J0BqS
	wz05DZxnifS9YuusR0lMRxja396Knp1CHT5J7QRR7IxYebHJXiM/RtxBbg5mEk5LKxPY
	Fawg==
Received: by 10.68.225.9 with SMTP id rg9mr20670842pbc.137.1335808046524;
	Mon, 30 Apr 2012 10:47:26 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id sx8sm8239860pbc.53.2012.04.30.10.47.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Apr 2012 10:47:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2012 10:46:21 -0700
Message-Id: <fe43712e0feeafbb0066f5c6f72aaa9a9c544097.1335807802.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <392442de49633f6d0f3146fb5a86ad25e6c91015.1335807802.git.raj.khem@gmail.com>
References: <392442de49633f6d0f3146fb5a86ad25e6c91015.1335807802.git.raj.khem@gmail.com>
In-Reply-To: <cover.1335807802.git.raj.khem@gmail.com>
References: <cover.1335807802.git.raj.khem@gmail.com>
Subject: [PATCH 06/10] gdb: Dont need lttng-ust for SH4
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
X-List-Received-Date: Mon, 30 Apr 2012 17:57:06 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 5dd4f74..b520353 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -10,6 +10,7 @@ LTTNGUST_mips = ""
 LTTNGUST_mipsel = ""
 LTTNGUST_mips64 = ""
 LTTNGUST_mips64el = ""
+LTTNGUST_sh4 = ""
 
 INC_PR = "r8"
 
-- 
1.7.5.4



