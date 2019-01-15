Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 610237C0D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 05:28:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0F5SCWv014774
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 21:28:42 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 14 Jan 2019 21:28:14 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jan 2019 13:28:11 +0800
Message-ID: <1547530093-50658-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/2] piglit support build without x11
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
X-List-Received-Date: Tue, 15 Jan 2019 05:28:51 -0000
Content-Type: text/plain

Fixes bug: [YOCTO #6077]

To support piglit without x11 by disable PIGLIT_BUILD_GL_TESTS, but
the result is piglit can use without x11, but only small part of it
can be used. Most of testcase will be skipped.


Changqing Li (2):
  waffle: supprt build waffle without x11
  piglit: support build piglit without x11

 meta/recipes-graphics/piglit/piglit_git.bb   | 12 +++++++-----
 meta/recipes-graphics/waffle/waffle_1.5.2.bb |  5 +----
 2 files changed, 8 insertions(+), 9 deletions(-)

-- 
2.7.4


