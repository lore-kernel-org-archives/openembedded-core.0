Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1URxOo-0001WT-A9
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 06:21:46 +0200
Received: from mail59-ch1-R.bigfish.com (10.43.68.228) by
	CH1EHSOBE002.bigfish.com (10.43.70.52) with Microsoft SMTP Server id
	14.1.225.23; Tue, 16 Apr 2013 03:18:49 +0000
Received: from mail59-ch1 (localhost [127.0.0.1])	by mail59-ch1-R.bigfish.com
	(Postfix) with ESMTP id 01B1B180AE8	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 03:18:49 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz936eIzz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail59-ch1 (localhost.localdomain [127.0.0.1]) by mail59-ch1
	(MessageSwitch) id 1366082327189747_9752;
	Tue, 16 Apr 2013 03:18:47 +0000 (UTC)
Received: from CH1EHSMHS027.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.236])	by mail59-ch1.bigfish.com (Postfix) with ESMTP id
	2BA7C26004A for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 03:18:47 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS027.bigfish.com
	(10.43.70.27) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 16 Apr 2013 03:18:47 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Tue, 16 Apr 2013 03:18:46 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r3G3Ig2i030243;	Mon, 15 Apr 2013 20:18:43 -0700
From: <b28495@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Apr 2013 11:18:36 +0800
Message-ID: <1366082316-4312-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] openssl: update range information in man-section.patch
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
X-List-Received-Date: Tue, 16 Apr 2013 04:21:47 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

do_patch failed after upgrading to openssl-1.0.1e. Log:
| ERROR: Command Error: exit status: 1  Output:
| Applying patch man-section.patch
| patching file Makefile.org
| Hunk #1 succeeded at 160 (offset 26 lines).
| Hunk #2 succeeded at 626 (offset 19 lines).
| misordered hunks! output would be garbled
| Hunk #3 FAILED at 633.
| 1 out of 3 hunks FAILED -- rejects in file Makefile.org
| Patch man-section.patch does not apply (enforce with -f)
| ERROR: Function failed: patch_do_patch
| ERROR: Logfile of failure stored in:temp/log.do_patch.14679
| ERROR: Task 646 (virtual:native:openssl_1.0.1e.bb, do_patch) failed with exit code '1'

Change-Id: Ib63031fdbd09443e387ee57efa70381e0aca382c
Signed-off-by: Ting Liu <b28495@freescale.com>
---
 .../openssl-1.0.1e/debian/man-section.patch        |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/man-section.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/man-section.patch
index e8b9268..21c1d1a 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/man-section.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/debian/man-section.patch
@@ -4,7 +4,7 @@ Index: openssl-1.0.0c/Makefile.org
 ===================================================================
 --- openssl-1.0.0c.orig/Makefile.org	2010-12-12 16:11:37.000000000 +0100
 +++ openssl-1.0.0c/Makefile.org	2010-12-12 16:13:28.000000000 +0100
-@@ -134,7 +134,8 @@
+@@ -160,7 +160,8 @@
  MANDIR=/usr/share/man
  MAN1=1
  MAN3=3
@@ -14,7 +14,7 @@ Index: openssl-1.0.0c/Makefile.org
  HTMLSUFFIX=html
  HTMLDIR=$(OPENSSLDIR)/html
  SHELL=/bin/sh
-@@ -606,7 +607,7 @@
+@@ -651,7 +652,7 @@
  		echo "installing man$$sec/$$fn.$${sec}$(MANSUFFIX)"; \
  		(cd `$(PERL) util/dirname.pl $$i`; \
  		sh -c "$$pod2man \
@@ -23,7 +23,7 @@ Index: openssl-1.0.0c/Makefile.org
  			--release=$(VERSION) `basename $$i`") \
  			>  $(INSTALL_PREFIX)$(MANDIR)/man$$sec/$$fn.$${sec}$(MANSUFFIX); \
  		$(PERL) util/extract-names.pl < $$i | \
-@@ -623,7 +624,7 @@
+@@ -668,7 +669,7 @@
  		echo "installing man$$sec/$$fn.$${sec}$(MANSUFFIX)"; \
  		(cd `$(PERL) util/dirname.pl $$i`; \
  		sh -c "$$pod2man \
-- 
1.7.5.4




