Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DB24478280
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 09:45:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v599jXlx014652
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Jun 2017 02:45:33 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 9 Jun 2017 02:45:32 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 9 Jun 2017 05:45:30 -0400
Message-ID: <cover.1497001417.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/1] archiver.bbclass: add task do_prepare_recipe_sysroot before do_configure
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
X-List-Received-Date: Fri, 09 Jun 2017 09:45:33 -0000
Content-Type: text/plain

The following changes since commit 4a7612c7a12b9a381fb8343ba9586272b889fc15:

  buildhistory: skip tests if GitPython module is missing (2017-06-07 16:00:49 +0100)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git dengke/fix-archiver-configure-failed

Dengke Du (1):
  archiver.bbclass: add task do_prepare_recipe_sysroot before
    do_configure

 meta/classes/archiver.bbclass | 1 +
 1 file changed, 1 insertion(+)

-- 
2.8.1


