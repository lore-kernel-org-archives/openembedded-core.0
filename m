Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 8A1C560962
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 19:08:14 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NPS00FCLNT95S00@vms173025.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 11 Jun 2015 14:07:58 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Jp0M15MC c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=XAFQembCKUMA:10
	a=sozttTNsAAAA:8	a=HZ0uepUFdSjJEhG47tkA:9 a=TjakIkvq5rAA:10
	a=EQI-s8DoeD4A:10 a=arjBxkBb8twA:10
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9A718161A9A;	Thu,
	11 Jun 2015 15:07:57 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jun 2015 15:07:54 -0400
Message-id: <1434049675-15986-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [daisy][PATCH 0/1] Backport BAD_RECOMMENDATIONS fix from master/dizzy
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
X-List-Received-Date: Thu, 11 Jun 2015 19:08:18 -0000

From: Denys Dmytriyenko <denys@ti.com>

This is a self-contained clean backport of BAD_RECOMMENDATIONS fix for opkg.
Please consider applying to daisy.

Paul Barker (1):
  package_manager: Fix BAD_RECOMMENDATIONS for opkg

 meta/lib/oe/package_manager.py | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.2.0


