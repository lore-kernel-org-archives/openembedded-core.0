Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TGVSj-0001d4-Ro
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 15:46:10 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8PDXKrh026679
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2012 06:33:20 -0700 (PDT)
Received: from fc17-64.wrs.com (128.224.163.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 25 Sep 2012 06:33:18 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Sep 2012 21:38:35 +0800
Message-ID: <cover.1348561895.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/2] package_rpm.bbclass: two fixes
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
X-List-Received-Date: Tue, 25 Sep 2012 13:46:10 -0000
Content-Type: text/plain

* Two fixes
  - Change the arch's "-" to "_" in /etc/rpm/platform
  - Fix the incremental rpm image generation

// Robert

The following changes since commit 8b3aa00029e62df6d05710cf166fd5d09bdb29cf:

  documentation/poky-ref-manual/ref-variables.xml: Update B variable (2012-09-24 16:36:09 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/rpm_arch_inc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/rpm_arch_inc

Robert Yang (2):
  package_rpm.bbclass: change the arch's "-" to "_" for platform
  package_rpm.bbclass: no initial_solution in the second build

 meta/classes/package_rpm.bbclass | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

-- 
1.7.11.2



