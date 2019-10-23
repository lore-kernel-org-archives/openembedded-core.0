Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2A1237DF61
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 07:49:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x9N7ngjT029470
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 00:49:44 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Wed, 23 Oct 2019 00:49:41 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Oct 2019 15:49:38 +0800
Message-ID: <20191023074939.17611-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH v2 0/1] bind: fix CVE-2019-6471 and CVE-2018-5743
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
X-List-Received-Date: Wed, 23 Oct 2019 07:49:43 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

v2:
* add tag CVE in patch files

Kai Kang (1):
  bind: fix CVE-2019-6471 and CVE-2018-5743

 .../bind/0001-bind-fix-CVE-2019-6471.patch    |  64 ++
 ...01-fix-enforcement-of-tcp-clients-v1.patch |  60 ++
 ...p-clients-could-still-be-exceeded-v2.patch | 670 +++++++++++++
 ...rence-counter-for-pipeline-groups-v3.patch | 278 ++++++
 ...accounting-and-client-mortality-chec.patch | 512 ++++++++++
 ...a-and-pipeline-refs-allow-special-ca.patch | 911 ++++++++++++++++++
 ...allowance-for-tcp-clients-interfaces.patch |  80 ++
 ...perations-in-bin-named-client.c-with.patch | 140 +++
 .../bind/bind_9.11.5-P4.bb                    |   8 +
 9 files changed, 2723 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/0001-bind-fix-CVE-2019-6471.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0001-fix-enforcement-of-tcp-clients-v1.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0002-tcp-clients-could-still-be-exceeded-v2.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0003-use-reference-counter-for-pipeline-groups-v3.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0004-better-tcpquota-accounting-and-client-mortality-chec.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0005-refactor-tcpquota-and-pipeline-refs-allow-special-ca.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0006-restore-allowance-for-tcp-clients-interfaces.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/0007-Replace-atomic-operations-in-bin-named-client.c-with.patch

-- 
2.17.1


