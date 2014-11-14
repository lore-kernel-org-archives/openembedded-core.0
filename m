Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0928F65C7B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 08:33:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAE8XEoT010576
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 00:33:15 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 14 Nov 2014 00:33:14 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Nov 2014 16:35:14 +0800
Message-ID: <cover.1415953970.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Use ALTERNATIVES to manage 'nologin'
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
X-List-Received-Date: Fri, 14 Nov 2014 08:33:17 -0000
Content-Type: text/plain

The following changes since commit e7b731a1a358e0007dba1038ad504888bec5916e:

  docbook-xsl-stylesheets: fix do_configure typo (2014-11-12 15:36:14 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/alternatives-nologin
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/alternatives-nologin

Chen Qi (2):
  util-linux: use ALTERNATIVE mechanism to manage 'nologin'
  shadow: use ALTERNATIVE to manage 'nologin'

 meta/recipes-core/util-linux/util-linux.inc | 3 ++-
 meta/recipes-extended/shadow/shadow.inc     | 7 ++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
1.9.1


