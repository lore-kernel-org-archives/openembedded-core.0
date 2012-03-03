Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1S3miV-0002au-KT
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Mar 2012 12:01:35 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q23Ar2sY008049
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 3 Mar 2012 02:53:02 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Sat, 3 Mar 2012 02:53:02 -0800
Message-ID: <cover.1330771239.git.xiaofeng.yan@windriver.com>
Old-Date: Sat, 3 Mar 2012 18:40:39 +0800
Date: Sat, 3 Mar 2012 18:53:58 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/3] Realize archiver.bbclass
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
X-List-Received-Date: Sat, 03 Mar 2012 11:01:36 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

archiver.bbclass is for archiving sources , patches and logs including .bb and .inc files by configuring  archiver_configure.bbclass which control what a archiving package should include.
For archiving a source rpm package, I add some functions to package_rpm.bbclass.
I also merge source_pkg.bbclass to archiver.bbclass due to their similar functions. 

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/1977
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/1977

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (3):
  package_rpm.bbclass: Add srpm function
  archiver.bbclass: archive sources, patches,logs to tarball
  archiver_configure.bbclass: configure the content for archiving
    package

 meta/classes/archiver.bbclass           |  393 +++++++++++++++++++++++++++++++
 meta/classes/archiver_configure.bbclass |   35 +++
 meta/classes/package_rpm.bbclass        |   54 ++++-
 3 files changed, 479 insertions(+), 3 deletions(-)
 create mode 100644 meta/classes/archiver.bbclass
 create mode 100644 meta/classes/archiver_configure.bbclass



