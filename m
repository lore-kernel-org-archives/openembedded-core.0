Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1S3Pws-00050l-SR
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 11:42:55 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q22AYNmI019750
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 02:34:23 -0800 (PST)
Received: from build-PowerEdge-T100.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 2 Mar 2012 02:34:23 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Mar 2012 18:34:18 +0800
Message-ID: <cover.1330684260.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/1] V2 Fix libpam's chmod
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Mar 2012 10:42:55 -0000
Content-Type: text/plain

Hi Saul,

This patch is based on oe-core, but I don't have permission to put the pull
request on git://git.openembedded.org/openembedded-core-contrib, so I still
put the pull request on poky-contrib.

Changes of V2:

* Update the PR bump as Koen pointed out.

//Robert


The following changes since commit 6b6aa170d5c618cfcd016dd1de926db647f7f932:

  busybox: Restore 'date' compatability (2012-03-01 23:16:43 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/libpam
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/libpam

Robert Yang (1):
  Fix libpam's chmod

 meta/recipes-extended/pam/libpam_1.1.5.bb |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

-- 
1.7.4.1



