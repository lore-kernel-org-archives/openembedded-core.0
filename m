Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TeSXk-00066f-0t
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 16:30:20 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so507854lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 07:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=JnSO+NfGR6J17IlhsMcntFvokM+uwC2FNNMmS68t0Gc=;
	b=vj0uhgLyD6nP0oN/qqM5MLFWAt+AJQieBKpIILxMVObQ2Fk4PkFD6axsRY3noDBHfX
	bLQD/l1IuMv5yU6pc73kbm/T9kFmQDgohG30m+BYtd1wLnJUTeiMGanp3BqL6/Kics0F
	7Z9rm52ifnKO3jgBpus94fbTiE2Jdy0Zwejh9lJrJw549wrvEHZwIv+Oz0+GfpAYCynI
	Dy+fbtcWQPdT0x+/HoYzL/W25A1m4V7hpzu2jotmUI5aM9dUzS2uVvLtu2kgmQo9O0qx
	5HLH96tnfgjlEPh9nDcvoos+bYHHfkZAYPG2erfukq0YsSAsmCGv4c04BAI1xmxK/gzh
	90gg==
Received: by 10.112.17.170 with SMTP id p10mr979735lbd.53.1354288562905;
	Fri, 30 Nov 2012 07:16:02 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id er8sm2212761lbb.9.2012.11.30.07.16.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Nov 2012 07:16:01 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TeSJq-0002y5-Ua; Fri, 30 Nov 2012 17:15:58 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2012 17:15:37 +0200
Message-Id: <1354288544-10778-4-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1354288544-10778-3-git-send-email-cazfi74@gmail.com>
References: <1354288544-10778-1-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-2-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-3-git-send-email-cazfi74@gmail.com>
Subject: [PATCH 03/10] ltp: fix license segment md5sum boundary
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Nov 2012 15:30:20 -0000

Replaced incorrect "startline" with correct "beginline" for telling
where license segment in file begins. Old md5sum was calculated from
the beginning of the file, not from beginning of the license segment.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-extended/ltp/ltp_20120903.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ltp/ltp_20120903.bb b/meta/recipes-extended/ltp/ltp_20120903.bb
index 1bc1d60..87c45b0 100644
--- a/meta/recipes-extended/ltp/ltp_20120903.bb
+++ b/meta/recipes-extended/ltp/ltp_20120903.bb
@@ -6,7 +6,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2 & GPLv2+ & LGPLv2+ & LGPLv2.1+ & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 		    file://testcases/kernel/controllers/freezer/COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
-		    file://testcases/kernel/controllers/freezer/run_freezer.sh;startline=5;endline=17;md5=aeac3f7691caa2e76fd5a732fbd6510d \
+		    file://testcases/kernel/controllers/freezer/run_freezer.sh;beginline=5;endline=17;md5=86a61d2c042d59836ffb353a21456498 \
 		    file://testcases/kernel/fs/ext4-new-features/ffsb-6.0-rc2/COPYING;md5=c46082167a314d785d012a244748d803 \
 		    file://testcases/kernel/hotplug/memory_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
 		    file://testcases/kernel/hotplug/cpu_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
-- 
1.7.10.4



