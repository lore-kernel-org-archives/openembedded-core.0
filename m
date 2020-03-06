Return-Path: <andrej.valek@siemens.com>
X-Greylist: delayed 854 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 06 Mar 2020 15:47:05 UTC
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by mail.openembedded.org (Postfix) with ESMTP id 99C3A61086
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2020 15:47:05 +0000 (UTC)
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 026FWpUr003982
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Mar 2020 16:32:51 +0100
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 026FWmvk032168
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Mar 2020 16:32:50 +0100
Received: from dev.vm6.ccp.siemens.com ([163.242.56.79])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id 026FWmss021652;
	Fri, 6 Mar 2020 16:32:48 +0100
Received: from mail2.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id BFC63950A88;
	Fri,  6 Mar 2020 16:32:47 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Mar 2020 16:32:32 +0100
Message-Id: <20200306153234.23875-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
	further information)
X-purgate-size: 430
X-purgate-ID: 149902::1583508772-000010EA-F733BB9D/0/0
Subject: [PATCH 0/2] Extensible SDK improvements
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
X-List-Received-Date: Fri, 06 Mar 2020 15:47:06 -0000

"add option to append lines into local.conf":
 - What about dropping "sdk_extraconf"?

Andrej Valek (2):
  populate_sdk_ext.bbclass: enable custom templateconf.cfg
  populate_sdk_ext.bbclass: add option to append lines into local.conf

 meta/classes/buildhistory.bbclass     |  4 ++--
 meta/classes/populate_sdk_ext.bbclass | 22 ++++++++++++++++++----
 2 files changed, 20 insertions(+), 6 deletions(-)

-- 
2.11.0


