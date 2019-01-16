Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 72C936DA25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 03:04:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0G34Iuh029505
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 19:04:18 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 15 Jan 2019 19:04:17 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Jan 2019 11:04:14 +0800
Message-ID: <1547607856-350971-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAJTo0La-p53Onb4bNXJ50XJi4XXyJe+b1p6RtfCEHo-B_7R8EA@mail.gmail.com>
References: <CAJTo0La-p53Onb4bNXJ50XJi4XXyJe+b1p6RtfCEHo-B_7R8EA@mail.gmail.com>
MIME-Version: 1.0
Subject: [PATCH V2 0/2] piglit support build without x11
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
X-List-Received-Date: Wed, 16 Jan 2019 03:04:17 -0000
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


