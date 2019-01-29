Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E80B16D563
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 09:05:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0T95snG024975
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 01:05:54 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Tue, 29 Jan 2019 01:05:53 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Jan 2019 17:14:41 +0800
Message-ID: <cover.1548753246.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] pkgdata.py: avoid target-sdk-dummy-provides to mess things up
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
X-List-Received-Date: Tue, 29 Jan 2019 09:05:54 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit ecfe26834922861ab69602b8c1aa404080f0fb0c:

  libtool: Fix ignoring compiler-rt libs (2019-01-27 13:05:17 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/pkgdata-clean
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/pkgdata-clean

Chen Qi (1):
  pkgdata.py: avoid target-sdk-dummy-provides to mess things up

 meta/lib/oeqa/selftest/cases/pkgdata.py | 1 +
 1 file changed, 1 insertion(+)

-- 
1.9.1


