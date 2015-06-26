Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BCCB8737AF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 06:23:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5Q6NLji003820
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 23:23:22 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 25 Jun 2015 23:23:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Jun 2015 23:23:20 -0700
Message-ID: <cover.1435299778.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] sanity.bbclass: check /bin/sh is dash or bash
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
X-List-Received-Date: Fri, 26 Jun 2015 06:23:24 -0000
Content-Type: text/plain

The following changes since commit 2587b83faabdc8858e8746201805369ed8d53ba8:

  wpa-supplicant: Revert "Make SystemD D-Bus config conditional" (2015-06-24 14:03:25 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/sh
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/sh

Robert Yang (1):
  sanity.bbclass: check /bin/sh is dash or bash

 meta/classes/sanity.bbclass |    4 ++++
 1 file changed, 4 insertions(+)

-- 
1.7.9.5


