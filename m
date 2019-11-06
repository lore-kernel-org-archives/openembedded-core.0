Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 3E00B7F83A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Subject:References:In-Reply-To:Message-Id:Date:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5CRVaa0+PVEENcSm7DOVwYBoEeysvgySmdRbyl/ZSuk=;
	b=VTlXoakjK32oU9rzvJqLqRXAj5
	WvQnJ6RUP2BtsnV0QIgFrvlD8xOZadbSjBgicl9RZotVsKUfXvlHJ1ECK0PUDnmioRUssrCL3phSz
	HC8SK4hMcm/N77rqjzBn8OyQj0tYGStK+06aRJhtcAhDnPde8FZbIYwlnXVRPfqvzyy4cW4px9iBL
	zBzgJHXM2PZTL6EV0puvXFneqe13O7aQgzLtKOVaEC7jb134nSzdJ718N16kji7alSvYDLR+eiL43
	B2AbWNcWp9R/8N+H8zv1tKLkGAViF6GL11JS8u4xJb8nkB7SGb13Ad6MWFqljmJAmBZD3tYHUsAx+
	4UfdFViw==;
Received: from [2001:67c:1be8::12] (helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSNOO-00009i-E6; Wed, 06 Nov 2019 17:38:45 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSNO4-0007Ty-8p; Wed, 06 Nov 2019 17:38:24 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 17:37:19 +0200
Message-Id: <5d58a4474528e5258d8e85f1d54915ad2ee06b4b.1573047194.git.mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1573047194.git.mikko.rapeli@bmw.de>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
In-Reply-To: <cover.1573047194.git.mikko.rapeli@bmw.de>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
X-Rspam-Score: 8.3 (++++++++)
X-Rspam-Report: Action: add header Symbol: ARC_NA(0.00)
	Symbol: DMARC_POLICY_SOFTFAIL(0.10) Symbol: FROM_HAS_DN(0.00)
	Symbol: RCPT_COUNT_THREE(0.00) Symbol: R_SPF_ALLOW(-0.20)
	Symbol: MULTIPLE_UNIQUE_HEADERS(4.89) Symbol: MIME_GOOD(-0.10)
	Symbol: TO_MATCH_ENVRCPT_ALL(0.00) Symbol: NEURAL_SPAM(0.00)
	Symbol: TO_DN_SOME(0.00) Symbol: RCVD_TLS_LAST(0.00)
	Symbol: MID_CONTAINS_FROM(1.00) Symbol: IP_SCORE(-0.19)
	Symbol: FORGED_SENDER(0.30) Symbol: R_DKIM_NA(0.00)
	Symbol: MIME_TRACE(0.00) Symbol: ASN(0.00)
	Symbol: FROM_NEQ_ENVFROM(0.00)
	Symbol: HFILTER_HOSTNAME_UNKNOWN(2.50)
	Symbol: RCVD_COUNT_TWO(0.00) Message: (SPF): spf allow
	Message-ID:
	5d58a4474528e5258d8e85f1d54915ad2ee06b4b.1573047194.git.mikko.rapeli@bmw.de
X-Rspam-Status: Yes
X-Rspam-Bar: ++++++++
X-SA-Exim-Connect-IP: 2001:67c:1be8::12
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,RDNS_NONE,SPF_HELO_NONE,SPF_NEUTRAL,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.2
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
Subject: [PATCH RFC CFH][sumo 04/47] cve-check: Consider CVE that affects versions with less than operator
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
X-List-Received-Date: Wed, 06 Nov 2019 15:38:44 -0000

From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>

In the NVD json CVE feed, affected versions can be strictly matched to a
version, but they can also be matched with the operator '<='.

Add a new condition in the sqlite query to match affected versions that
are defined with the operator '<='. Then use LooseVersion to discard all
versions that are not relevant.

(From OE-Core rev: 3bf63bc60848d91e90c23f6d854d22b78832aa2d)

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cve-check.bbclass | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index e7540b8..379f712 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -166,6 +166,7 @@ def check_cves(d, patched_cves):
     Connect to the NVD database and find unpatched cves.
     """
     import ast, csv, tempfile, subprocess, io
+    from distutils.version import LooseVersion
 
     cves_unpatched = []
     # CVE_PRODUCT can contain more than one product (eg. curl/libcurl)
@@ -186,14 +187,25 @@ def check_cves(d, patched_cves):
     conn = sqlite3.connect(db_file)
     c = conn.cursor()
 
-    query = "SELECT * FROM PRODUCTS WHERE PRODUCT IS '%s' AND VERSION IS '%s';"
+    query = """SELECT * FROM PRODUCTS WHERE
+               (PRODUCT IS '{0}' AND VERSION = '{1}' AND OPERATOR IS '=') OR
+               (PRODUCT IS '{0}' AND OPERATOR IS '<=');"""
     for idx in range(len(bpn)):
-        for row in c.execute(query % (bpn[idx],pv)):
+        for row in c.execute(query.format(bpn[idx],pv)):
             cve = row[1]
+            version = row[4]
+
+            try:
+                discardVersion = LooseVersion(version) < LooseVersion(pv)
+            except:
+                discardVersion = True
+
             if pv in cve_whitelist.get(cve,[]):
                 bb.note("%s-%s has been whitelisted for %s" % (bpn[idx], pv, cve))
             elif cve in patched_cves:
                 bb.note("%s has been patched" % (cve))
+            elif discardVersion:
+                bb.debug(2, "Do not consider version %s " % (version))
             else:
                 cves_unpatched.append(cve)
                 bb.debug(2, "%s-%s is not patched for %s" % (bpn[idx], pv, cve))
-- 
1.9.1


