Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6D79665E38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 09:54:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8C9sIAJ009948
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 02:54:19 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 12 Sep 2014 02:54:18 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Sep 2014 02:54:17 -0700
Message-ID: <cover.1410515355.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] sstate.bbclass: fix sstate_hardcode_path()
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
X-List-Received-Date: Fri, 12 Sep 2014 09:54:21 -0000
Content-Type: text/plain

The following changes since commit 10df0718d6a626d99beb68cde8d914ee0820d7eb:

  classes/populate_sdk_base: enable adding custom commands to SDK install script (2014-09-11 17:44:40 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/ssgrep
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/ssgrep

Robert Yang (1):
  sstate.bbclass: fix sstate_hardcode_path()

 meta/classes/sstate.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.9.5


