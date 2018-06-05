Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D273C75585
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 02:34:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w552XnNv006166
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Jun 2018 19:34:05 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 4 Jun 2018 19:33:32 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jun 2018 22:32:58 -0400
Message-ID: <1528165980-163833-1-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta][PATCH 0/2] Add kernel-sample tests for runtime test
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
X-List-Received-Date: Tue, 05 Jun 2018 02:34:14 -0000
Content-Type: text/plain

V4:
 * add support for qemu by default

V3:
 * remove duplicated code

V2:
 * use shared function to replace similar code

Hongzhi.Song (2):
  meta runtime testcases: enable kernel-sample features for runtime
    tests
  Meta runtime cases: add testcases for kernel sample

 meta/lib/oeqa/runtime/cases/ksample.py    | 213 ++++++++++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto.inc |   3 +
 2 files changed, 216 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/ksample.py

-- 
2.8.1


