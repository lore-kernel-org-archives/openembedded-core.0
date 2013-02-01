Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1U1Cih-0007ew-IM
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 10:15:51 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r118xuNW009693
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Feb 2013 00:59:56 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Fri, 1 Feb 2013 00:59:54 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Feb 2013 17:00:21 +0800
Message-ID: <cover.1359708915.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] busybox: add config fragments
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2013 09:16:02 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Test Cases
----------
1. Backward Compatibility
   Operation:
   No config fragments, build busybox

   Expected Result:
   Everything should be the same with before, especially the .config file

   [Actual Result (Success/Fail): Success]

2. Single config fragment: enable a utility
   Operation:
   Add a config fragment which enables hostid functionality and build core-image-minimal

   Expected Result:
   hostid command on target could work

   [Actual Result (Success/Fail): Success]

3. Multiple config fragments: enable utilities
   Followed by test case 2, add a config fragment which enables cal and build minimal image

   Expected Result:
   cal command on target could work

   [Actual Result (Success/Fail): Success]

4. Mutliple config fragments: enable some utilities and disable some utilities
   Operation:
   Followed by test case 3, add a config fragment which disables and build minimal image

   Expected Result:
   vi command on target could not work

   [Actual Result (Success/Fail): Success]


The following changes since commit 9a26b9c69c47c87ce71a06f76682c187767e7897:

  rpm: Ensure native binaries are correctly wrapped (2013-01-30 14:47:30 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/busybox-config-fragments
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/busybox-config-fragments

Chen Qi (1):
  busybox: add config fragments

 meta/recipes-core/busybox/busybox.inc |   45 +++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

-- 
1.7.9.5



