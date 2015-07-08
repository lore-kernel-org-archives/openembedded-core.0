Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AA7D275D79
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 09:05:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t68952WE008105
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Jul 2015 02:05:02 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 8 Jul 2015 02:05:02 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Jul 2015 17:03:39 +0800
Message-ID: <cover.1436346123.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 0/1] Improve the regex of sed command of SVN_SERF_INCLUDES macro of subversion
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
X-List-Received-Date: Wed, 08 Jul 2015 09:05:06 -0000
Content-Type: text/plain

The following changes since commit 8ad9a434c9fd0300cf5c38c368b181b78421e95a:

  bitbake: tests/data: Add new data tests (2015-07-01 15:40:21 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/subversion
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kangkai/subversion

Kai Kang (1):
  subversion: improve the regex of sed command of SVN_SERF_INCLUDES
    macro

 .../Improve_the_regex_of_sed_command_of.patch      | 31 ++++++++++++++++++++++
 .../subversion/subversion_1.8.13.bb                |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.8.13/Improve_the_regex_of_sed_command_of.patch

-- 
1.9.1


