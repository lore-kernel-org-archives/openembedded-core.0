Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7699672123
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 07:27:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAL7Rgwt005943
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 23:27:42 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 20 Nov 2014 23:27:42 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Nov 2014 15:27:45 +0800
Message-ID: <cover.1416554582.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/2] Use ALTERNATIVES to manage 'nologin'
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
X-List-Received-Date: Fri, 21 Nov 2014 07:27:43 -0000
Content-Type: text/plain

The following changes since commit 4a888b2ab61662c7f749b5d1e64af92ed613d8eb:

  gtk+: drop part of patch adding useless file (2014-11-20 14:08:57 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/nologin-alternatives
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/nologin-alternatives

Chen Qi (2):
  util-linux: use ALTERNATIVE mechanism to manage 'nologin'
  shadow: use ALTERNATIVE to manage 'nologin'

 meta/recipes-core/util-linux/util-linux.inc | 3 ++-
 meta/recipes-extended/shadow/shadow.inc     | 7 ++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
1.9.1


