Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E1D8672A85
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 08:08:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3T88a7G004146
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 01:08:36 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.192) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 29 Apr 2015 01:08:35 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Apr 2015 16:08:35 +0800
Message-ID: <cover.1430294879.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] populate_sdk_ext: two fixes
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
X-List-Received-Date: Wed, 29 Apr 2015 08:08:38 -0000
Content-Type: text/plain

The following changes since commit 4dd4b96b6d60246338bb30ede9f3ab1b2e757be9:

  libxfont: Security Advisory - libxfont - CVE-2015-1804 (2015-04-28 07:56:01 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/populate_sdk_ext_2_fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/populate_sdk_ext_2_fixes

Chen Qi (2):
  populate_sdk_ext: consider custom configuration in local.conf
  populate_sdk_ext: install the latest buildtools-tarball

 meta/classes/populate_sdk_ext.bbclass | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

-- 
1.9.1


