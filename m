Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EC5876D77A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:39:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAL7dSfs028505
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:39:28 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 20 Nov 2013 23:39:27 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 15:39:25 +0800
Message-ID: <cover.1385019181.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.8.3
MIME-Version: 1.0
Subject: [PATCH 0/1] gettext-minimal-native/iconv.m4: remove the test to convert euc-jp
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
X-List-Received-Date: Thu, 21 Nov 2013 07:39:30 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

--
The following changes since commit ee3e2e5ce15a3bf78c7e9d76d7bf68131f2d3ef7:

  librsvg: upgrade to 2.40.0 (2013-11-20 14:03:06 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/d_guile-native_1121_1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_guile-native_1121_1

Jackie Huang (1):
  gettext-minimal-native/iconv.m4: remove the test to convert euc-jp

 ...conv-m4-remove-the-test-to-convert-euc-jp.patch | 43 ++++++++++++++++++++++
 .../gettext/gettext-minimal-native_0.18.3.1.bb     |  4 +-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/gettext/gettext-minimal-0.18.3.1/iconv-m4-remove-the-test-to-convert-euc-jp.patch

-- 
1.8.3


