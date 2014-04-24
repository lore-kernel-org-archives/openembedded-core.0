Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 37E5465DCA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 02:06:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3O26K9c028403
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 19:06:20 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Wed, 23 Apr 2014 19:06:20 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Apr 2014 10:07:25 +0800
Message-ID: <cover.1398305029.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH V2 0/4] systemd related fixes post 1.6
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
X-List-Received-Date: Thu, 24 Apr 2014 02:06:22 -0000
Content-Type: text/plain

Changes since V1:
1. Fix an error in generate-rndc-key.sh. The command should be `chmod' instead of `chown'.

The following changes since commit bec37f8b85b6dd1e4e1c1b9b215a7952ca2fc386:

  build-appliance-image: Update to  head revision (2014-04-22 22:53:34 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/systemd-post-1.6
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/systemd-post-1.6

Chen Qi (4):
  cronie: add systemd support
  bind: add systemd support
  ppp: add systemd support
  tcf-agent: add systemd support

 .../bind/bind/generate-rndc-key.sh                 |    7 +++++++
 meta/recipes-connectivity/bind/bind/named.service  |   22 ++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.9.5.bb       |   17 ++++++++++++++-
 meta/recipes-connectivity/ppp/ppp/ppp@.service     |    9 ++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.6.bb         |    9 ++++++--
 .../tcf-agent/tcf-agent/tcf-agent.service          |   10 +++++++++
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |    8 ++++++-
 meta/recipes-extended/cronie/cronie/crond.service  |   11 ++++++++++
 meta/recipes-extended/cronie/cronie_1.4.11.bb      |   12 ++++++++++-
 9 files changed, 100 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/generate-rndc-key.sh
 create mode 100644 meta/recipes-connectivity/bind/bind/named.service
 create mode 100644 meta/recipes-connectivity/ppp/ppp/ppp@.service
 create mode 100644 meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service
 create mode 100644 meta/recipes-extended/cronie/cronie/crond.service

-- 
1.7.9.5


