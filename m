Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F32006BC89
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 06:46:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBI6k4dm004555
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 22:46:04 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Dec 2018 22:46:03 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Dec 2018 14:53:42 +0800
Message-ID: <cover.1545115967.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] package.bbclass: fix python unclosed file ResourceWarning
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
X-List-Received-Date: Tue, 18 Dec 2018 06:46:04 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit fe43e599327f26b399c1883205e988236a5e51bd:

  gcc: Drop 7.3 since 8.2 is working fine for us (2018-12-15 17:10:52 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/package_warn
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/package_warn

Chen Qi (1):
  package.bbclass: fix python unclosed file ResourceWarning

 meta/classes/package.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
1.9.1


