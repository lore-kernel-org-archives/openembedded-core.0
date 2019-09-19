Return-Path: <Meng.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C21657FEE3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 03:23:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x8J3NNe8028145
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 20:23:23 -0700 (PDT)
Received: from pek-mli1-d1.wrs.com (128.224.162.173) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Wed, 18 Sep 2019 20:23:22 -0700
From: <Meng.Li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Sep 2019 11:25:42 +0800
Message-ID: <1568863543-26393-1-git-send-email-Meng.Li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [yocto] : u-boot: add CVE patches for u-boot
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
X-List-Received-Date: Thu, 19 Sep 2019 03:23:23 -0000
Content-Type: text/plain

From: Limeng <Meng.Li@windriver.com>

Add 9 patches to fix below CVE issues.
CVE-2019-13103
CVE-2019-13104
CVE-2019-13105
CVE-2019-13106
CVE-2019-14192
CVE-2019-14193
CVE-2019-14194
CVE-2019-14195
CVE-2019-14196
CVE-2019-14197
CVE-2019-14198
CVE-2019-14199
CVE-2019-14200
CVE-2019-14201
CVE-2019-14202
CVE-2019-14203
CVE-2019-14204

Detail patches as below:

0001-u-boot-add-CVE-patches-for-u-boot.patch

 files/0001-CVE-2019-13103.patch                               |   69 ++++++++++
 files/0002-CVE-2019-13104.patch                               |   49 +++++++
 files/0003-CVE-2019-13105.patch                               |   37 +++++
 files/0004-CVE-2019-13106.patch                               |   56 ++++++++
 files/0005-CVE-2019-14192-14193-14199.patch                   |   43 ++++++
 files/0006-CVE-2019-14197-14200-14201-14202-14203-14204.patch |   44 ++++++
 files/0007-CVE-2019-14194-14198.patch                         |   42 ++++++
 files/0008-CVE-2019-14195.patch                               |   42 ++++++
 files/0009-CVE-2019-14196.patch                               |   48 ++++++
 u-boot-common.inc                                             |   12 +
 10 files changed, 441 insertions(+), 1 deletion(-)


thanks,
Limeng


