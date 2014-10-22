Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D47A660097
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 07:12:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9M7CMUX000341
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 00:12:23 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 22 Oct 2014 00:12:22 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Oct 2014 15:09:42 +0800
Message-ID: <cover.1413960370.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V3 0/1] gconf: fix multilib conflict - org.gnome.GConf.service
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
X-List-Received-Date: Wed, 22 Oct 2014 07:12:29 -0000
Content-Type: text/plain

Change since v2:
split out org.gnome.GConf.service and libraries to libgconf package.

The following changes since commit 924da20c6f2f183fa7e930e4c3c6b14c090acbe5:

  build-appliance-image: Update to dizzy head revision (2014-10-18 16:16:38 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/gconf
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/gconf

Chong Lu (1):
  gconf: fix multilib conflict - org.gnome.GConf.service

 meta/recipes-gnome/gnome/gconf_3.2.6.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
1.9.1


