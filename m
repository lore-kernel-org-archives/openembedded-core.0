Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5436A73FDA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 02:13:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4C2Dtkx017986
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 19:13:55 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 11 May 2015 19:13:54 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 May 2015 19:13:52 -0700
Message-ID: <cover.1431396786.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] Fix B !=S for bind and lttng-tools
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
X-List-Received-Date: Tue, 12 May 2015 02:13:58 -0000
Content-Type: text/plain

The following changes since commit 7ffe10df73cc20d10fcd41b121074445273bd60e:

  license_class: license_create_manifest improvment (2015-05-09 22:26:02 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/bs
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/bs

Robert Yang (2):
  bind: separate B and S
  lttng-tools: separate B and S

 meta/recipes-connectivity/bind/bind_9.10.2.bb  |    6 ++++--
 meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb |    4 +++-
 2 files changed, 7 insertions(+), 3 deletions(-)

-- 
1.7.9.5


