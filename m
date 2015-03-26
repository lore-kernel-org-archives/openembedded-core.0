Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 45A096AC33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 06:42:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2Q6gZ6X003899
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 23:42:35 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 25 Mar 2015 23:42:34 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Mar 2015 23:42:33 -0700
Message-ID: <cover.1427352132.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] patch: fix CVE-2015-1196
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
X-List-Received-Date: Thu, 26 Mar 2015 06:42:36 -0000
Content-Type: text/plain

The following changes since commit 2d923d6dfe9431dbc005f8ba39838eb4519c471c:

  python-pygobject: Disable parallel make install in native case (2015-03-25 12:38:44 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/patch
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/patch

Robert Yang (1):
  patch: fix CVE-2015-1196

 meta/recipes-devtools/patch/patch.inc              |    5 +-
 .../patch/patch/patch-CVE-2015-1196.patch          |  200 ++++++++++++++++++++
 2 files changed, 204 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/patch/patch/patch-CVE-2015-1196.patch

-- 
1.7.9.5


