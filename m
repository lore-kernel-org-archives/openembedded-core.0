Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8ED106BA0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 09:52:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0H9qVIb023496
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 01:52:32 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 17 Jan 2019 01:52:25 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Jan 2019 17:52:22 +0800
Message-ID: <1547718744-239476-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAJTo0LZbjMKrjDO-NgFkhv3FHPfoDxhXFCuBpiFnj8O+iAYpaw@mail.gmail.com>
References: <CAJTo0LZbjMKrjDO-NgFkhv3FHPfoDxhXFCuBpiFnj8O+iAYpaw@mail.gmail.com>
MIME-Version: 1.0
Subject: [PATCH V2] populate_sdk_base: provide options to set sdk type
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
X-List-Received-Date: Thu, 17 Jan 2019 09:52:31 -0000
Content-Type: text/plain

change in V2:
1. add overrides to provide options for sdk type
2. move zip part into oe-core for more flexible
   who want to use type zip, only need to set
  SDK_ARCHIVE_TYPE to override the default tar.xz


Changqing Li (1):
  populate_sdk_base: provide options to set sdk type

 meta/classes/populate_sdk_base.bbclass | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

-- 
2.7.4


