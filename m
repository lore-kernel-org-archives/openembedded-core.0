Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 265E0601A0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 11:19:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9TBJN3P010960
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 04:19:23 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Wed, 29 Oct 2014 04:19:22 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Oct 2014 19:16:06 +0800
Message-ID: <1414581368-532-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 0/2] V2: patches for python and beecrypt
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
X-List-Received-Date: Wed, 29 Oct 2014 11:19:25 -0000
Content-Type: text/plain

V2:
* Fix wrong Upstream-Status of remove-BOM-insection-code.patch

Kai Kang (2):
  beecrpty: add option --with-dev-dsp
  python-2.7.3:remove BOM insertion code

 .../python/python/remove-BOM-insection-code.patch  | 24 +++++++++++++++
 meta/recipes-devtools/python/python_2.7.3.bb       |  1 +
 .../beecrypt/beecrypt/add-option-dev-dsp.patch     | 34 ++++++++++++++++++++++
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb    |  1 +
 4 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/remove-BOM-insection-code.patch
 create mode 100644 meta/recipes-support/beecrypt/beecrypt/add-option-dev-dsp.patch

-- 
1.9.1


