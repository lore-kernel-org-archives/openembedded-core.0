Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1S7HxU-00043a-7g
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 03:59:32 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2D2olXo020578
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2012 19:50:47 -0700 (PDT)
Received: from build-PowerEdge-T100.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 12 Mar 2012 19:50:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Mar 2012 10:50:24 +0800
Message-ID: <cover.1331605922.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/1] package.bbclass: create debugsources.list if it doesn't exist
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
X-List-Received-Date: Tue, 13 Mar 2012 02:59:32 -0000
Content-Type: text/plain

The testing information:
# Take MACHINE=qemux86 as example:
1) $ bitbake core-image-sato
2) $ find tmp/work/i586-poky-linux/ -maxdepth 3 -name 'log.do*' -exec \
        grep -H 'debugsources.list: No such file or directory' {} \;

   # There should be no output(more than 100 lines without this patch).

// Robert

The following changes since commit f47ada62a3da879006e7cb27479dc9b72c56e923:

  cmake.bbclass: add ${base_libdir} to CMAKE_LIBRARY_PATH (2012-03-12 17:46:16 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/debugsources
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/debugsources

Robert Yang (1):
  package.bbclass: create debugsources.list if it doesn't exist

 meta/classes/package.bbclass |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

-- 
1.7.4.1



