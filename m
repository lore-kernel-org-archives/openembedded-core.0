Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EEA5D73F5C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 02:19:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4E2J1RY019754
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 19:19:01 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.153) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Wed, 13 May 2015 19:19:00 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 May 2015 10:19:02 +0800
Message-ID: <cover.1431569867.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] Mark some tasks in extensible SDK as 'noexec'
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
X-List-Received-Date: Thu, 14 May 2015 02:19:01 -0000
Content-Type: text/plain

Changes since V1:
Use the 'for' loop to simplify codes.

The following changes since commit 2d09cb28f25080ed337d37d2d4381b846bbe6247:

  gcc5: Add PR65779 patch to fix powerpc compile issues (2015-05-12 13:10:17 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/SDK-noexec
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/SDK-noexec

Chen Qi (1):
  populate_sdk_ext: set noexec flag for some tasks

 meta/classes/populate_sdk_ext.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

-- 
1.9.1


