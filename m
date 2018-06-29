Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9F0C674F05
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 06:17:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5T6HBgt024081
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 28 Jun 2018 23:17:11 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Thu, 28 Jun 2018 23:16:58 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<richard.purdie@linuxfoundation.org>
Date: Fri, 29 Jun 2018 02:16:18 -0400
Message-ID: <1530252980-133637-1-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta][PATCH v5 0/2] Add kernel-sample tests for runtime test
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
X-List-Received-Date: Fri, 29 Jun 2018 06:17:15 -0000
Content-Type: text/plain

V5:
    * remove a part of ksample.py code on 'OETestID'
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

 meta/lib/oeqa/runtime/cases/ksample.py    | 206 ++++++++++++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto.inc |   3 +
 2 files changed, 209 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/ksample.py

-- 
2.8.1


