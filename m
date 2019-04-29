Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1C77B7D735
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 07:37:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3T7bwEv004796
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 00:37:59 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Mon, 29 Apr 2019 00:37:58 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Apr 2019 15:37:55 +0800
Message-ID: <1556523477-268112-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/2 V3] piglit support build without x11
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
X-List-Received-Date: Mon, 29 Apr 2019 07:37:58 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

To support piglit without x11 by disable PIGLIT_BUILD_GL_TESTS, but
the result is piglit can use without x11, but only small part of it
can be used. Most of testcase will be skipped.

Changqing Li (2):
  waffle: supprt build waffle without x11
  piglit: support build piglit without x11

 meta/recipes-graphics/piglit/piglit_git.bb   | 13 ++++++++-----
 meta/recipes-graphics/waffle/waffle_1.5.2.bb |  7 +++----
 2 files changed, 11 insertions(+), 9 deletions(-)

-- 
2.7.4


