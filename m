Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E456D77D24
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 19:32:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v86JWtox032353
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 6 Sep 2017 12:32:55 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 12:32:54 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Sep 2017 14:26:53 -0500
Message-ID: <1504726014-12929-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH] Bring over change from meta-openembedded
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
X-List-Received-Date: Wed, 06 Sep 2017 19:32:55 -0000
Content-Type: text/plain

This is the change required for the problem discussed in the email w/ the
subject:
 iproute2 - meta-openembedded/libmnl and Yocto Project compat

I could find no other way to remedy the Yocto Project compat checker against
meta-openembedded without moving this change from there to here.  A
corresponding patch has been sent to the meta-openembedded mailing list.

Mark Hatle (1):
  iproute2: Default to tipc enabled, and include libmnl dependency

 meta/recipes-connectivity/iproute2/iproute2.inc |  2 +-
 meta/recipes-extended/libmnl/libmnl_1.0.4.bb    | 13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libmnl/libmnl_1.0.4.bb

-- 
1.8.3.1


