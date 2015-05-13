Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D12EE74030
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 06:50:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4D6o7oM002361
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 23:50:07 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.153) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 12 May 2015 23:50:06 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 May 2015 14:50:07 +0800
Message-ID: <cover.1431499753.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] Mark some tasks in extensible SDK as 'noexec'
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
X-List-Received-Date: Wed, 13 May 2015 06:50:07 -0000
Content-Type: text/plain

The following changes since commit 2d09cb28f25080ed337d37d2d4381b846bbe6247:

  gcc5: Add PR65779 patch to fix powerpc compile issues (2015-05-12 13:10:17 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/SDK-noexec
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/SDK-noexec

Chen Qi (1):
  populate_sdk_ext: set noexec flag for some tasks

 meta/classes/populate_sdk_ext.bbclass | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

-- 
1.9.1


