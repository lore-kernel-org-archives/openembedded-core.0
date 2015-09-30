Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 231CA7570D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 08:09:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8U892jR003138
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 01:09:02 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 30 Sep 2015 01:09:01 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Sep 2015 04:08:57 -0400
Message-ID: <cover.1443600210.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3 v2] cleanup buildpaths for gnutls, curl, glib-2.0
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
X-List-Received-Date: Wed, 30 Sep 2015 08:09:02 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

V2 changes:

* limit sed logics to do_install_append_class-target()
* update commit logs for all three patches
 
The following changes since commit 4bc3f0994e68b3302a0523a3156dd0dca0cac7a0:

  bitbake: toaster: move clones into subdirectory (2015-09-29 14:11:39 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/buildpaths
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/buildpaths

Wenzong Fan (3):
  glib-2.0: cleanup buildpaths from pkgconfig files
  curl: cleanup buildpaths from curl-config
  gnutls: cleanup buildpaths from gnutls.pc

 meta/recipes-core/glib-2.0/glib.inc      | 6 ++++++
 meta/recipes-support/curl/curl_7.44.0.bb | 5 +++++
 meta/recipes-support/gnutls/gnutls.inc   | 5 +++++
 3 files changed, 16 insertions(+)

-- 
1.9.1


