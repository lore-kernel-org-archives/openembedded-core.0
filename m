Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=TX2EHSOBE007.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RBDAU-0007iq-AS
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 00:08:54 +0200
Received: from mail138-tx2-R.bigfish.com (10.9.14.241) by
	TX2EHSOBE007.bigfish.com (10.9.40.27) with Microsoft SMTP Server id
	14.1.225.22; Tue, 4 Oct 2011 22:03:19 +0000
Received: from mail138-tx2 (localhost.localdomain [127.0.0.1])	by
	mail138-tx2-R.bigfish.com (Postfix) with ESMTP id AA08F1F03F7	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2011 22:03:19 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bh8275dhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail138-tx2 (localhost.localdomain [127.0.0.1]) by mail138-tx2
	(MessageSwitch) id 1317765793157846_18205;
	Tue,  4 Oct 2011 22:03:13 +0000 (UTC)
Received: from TX2EHSMHS035.bigfish.com (unknown [10.9.14.245])	by
	mail138-tx2.bigfish.com (Postfix) with ESMTP id 1E04C127004B	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2011 22:03:13 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS035.bigfish.com
	(10.9.99.135) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Tue, 4 Oct 2011 22:03:09 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.323.7; Tue, 4 Oct 2011 17:03:09 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	p94M38JH010861	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Oct 2011 17:03:08 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Oct 2011 17:03:04 -0500
Message-ID: <1317765787-19127-3-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1317765787-19127-1-git-send-email-msm@freescale.com>
References: <1317765787-19127-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 3/6] Add new IMAGE_CLASSES variable for classes for image generation
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
X-List-Received-Date: Tue, 04 Oct 2011 22:08:54 -0000
Content-Type: text/plain

Allows us to import classes only for images and not to the global
namespace

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
Work around to solve issue from this thread:

https://lists.yoctoproject.org/pipermail/yocto/2011-September/005059.html

 meta/classes/image.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index f17e989..f03df5b 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -111,7 +111,8 @@ def get_devtable_list(d):
         str += " %s" % bb.which(bb.data.getVar('BBPATH', d, 1), devtable)
     return str
 
-inherit image_types
+IMAGE_CLASESS ??= ""
+inherit image_types ${IMAGE_CLASSES}
 
 IMAGE_POSTPROCESS_COMMAND ?= ""
 MACHINE_POSTPROCESS_COMMAND ?= ""
-- 
1.7.6.1




