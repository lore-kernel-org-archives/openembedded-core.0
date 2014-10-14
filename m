Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 16C456ACB8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 08:42:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9E8g5ZL002459
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Oct 2014 01:42:05 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 14 Oct 2014 01:42:04 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Oct 2014 16:39:58 +0800
Message-ID: <cover.1413275947.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] gconf: fix multilib conflict - org.gnome.GConf.service
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
X-List-Received-Date: Tue, 14 Oct 2014 08:42:12 -0000
Content-Type: text/plain

The following changes since commit ccf5a4d2342c4fd40e4e0b332ea7e34e0bf175d4:

  build-appliance-image: Update to dizzy head revision (2014-10-11 08:11:17 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/gconf
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/gconf

Chong Lu (1):
  gconf: fix multilib conflict - org.gnome.GConf.service

 meta/recipes-gnome/gnome/gconf_3.2.6.bb | 1 +
 1 file changed, 1 insertion(+)

-- 
1.9.1


