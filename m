Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W07-0004rG-W6
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:30:24 +0200
Received: by pzk35 with SMTP id 35so573529pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=cp4itixP7q0ayMRP7Uuyv4X1y9TkezgSW4RlTbIC1tQ=;
	b=Q1ns0lIjdp6c+r/CCCdoJ0SZ2XpU+iljPo2aYk3yGdi5VxyQ/a61Nk7f+X0iCkflqz
	nOCGQ1dBAl0xn44xtv+bWmNwzGENqpKfdW/PXSbTgA4/Rn2n/kdbxiAGFyGHSrKPknau
	4qOlQeGH1ENjlqr/1eMdrxlbiGsOBoArWTDhM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=kUYYwbj5yvKBsoSdoFKPNfLyYH3kvMuf/wW3LVdoQdBfUyAl0VUHxSolW6/cuEiWtE
	vE1ttbEvLOcsnGMtKeVEtz064a/LokFXJ4HlLRYOzkD7syKEw6gQ7z+4YQee2Feb0N8S
	yzQqcdI2O51Peep53JW5tuBI3IbwBCkVWQY5U=
Received: by 10.143.46.3 with SMTP id y3mr2594821wfj.331.1301632102440;
	Thu, 31 Mar 2011 21:28:22 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n4sm2392155wfl.2.2011.03.31.21.28.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:28:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:28:14 -0700
Message-Id: <5b010d2abfe56cf39f3e42e5043b7f355c3a806a.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 03/46] classes: Use linux-uclibceabi instead of linux-uclibgnuceabi for os portion of triplet
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
X-List-Received-Date: Fri, 01 Apr 2011 04:30:24 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/insane.bbclass   |    2 +-
 meta/classes/siteinfo.bbclass |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index a2bcaae..fdfb659 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -75,7 +75,7 @@ def package_qa_get_machine_dict():
                         "arm" :       (40,     0,    0,          True,          32),
                         "armeb" :     (40,     0,    0,          False,         32),
                       },
-            "linux-uclibcgnueabi" : {
+            "linux-uclibceabi" : {
                         "arm" :       (40,     0,    0,          True,          32),
                         "armeb" :     (40,     0,    0,          False,         32),
                       },
diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index df29097..892abc1 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -22,13 +22,13 @@ def get_siteinfo_list(d):
                "armeb-linux":             "endian-big bit-32 common-glibc arm-common",\
                "armeb-linux-gnueabi":     "endian-big bit-32 common-glibc arm-common armeb-linux",\
                "armeb-linux-uclibc":      "endian-big bit-32 common-uclibc arm-common",\
-               "armeb-linux-uclibcgnueabi": "endian-big bit-32 common-uclibc arm-common armeb-linux-uclibc",\
+               "armeb-linux-uclibceabi": "endian-big bit-32 common-uclibc arm-common armeb-linux-uclibc",\
                "arm-darwin":              "endian-little bit-32 common-darwin",\
                "arm-darwin8":              "endian-little bit-32 common-darwin",\
                "arm-linux":               "endian-little bit-32 common-glibc arm-common",\
                "arm-linux-gnueabi":       "endian-little bit-32 common-glibc arm-common arm-linux",\
                "arm-linux-uclibc":        "endian-little bit-32 common-uclibc arm-common",\
-               "arm-linux-uclibcgnueabi": "endian-little bit-32 common-uclibc arm-common arm-linux-uclibc",\
+               "arm-linux-uclibceabi": "endian-little bit-32 common-uclibc arm-common arm-linux-uclibc",\
                "avr32-linux":             "endian-big bit-32 common-glibc avr32-common",\ 
                "avr32-linux-uclibc":      "endian-big bit-32 common-uclibc avr32-common",\
                "bfin-uclinux-uclibc":       "endian-little bit-32 common-uclibc bfin-common",\
-- 
1.7.4.1



