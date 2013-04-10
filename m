Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1UPlx1-0003pW-Q5
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 05:44:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3A3QbDJ000172
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Apr 2013 20:26:37 -0700 (PDT)
Received: from pek-wfan-d2.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 9 Apr 2013 20:26:37 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Apr 2013 11:26:34 +0800
Message-ID: <cover.1365564103.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] xcursor-transparent-theme: install index.theme explicitly
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
X-List-Received-Date: Wed, 10 Apr 2013 03:44:09 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

xcursor-transparent-theme: install index.theme explicitly
    
The xcursor-transparent-theme doesn't install index.theme by default,
this might cause below command fails on target:
 
    $ gtk-update-icon-cache -q /usr/share/icons/xcursor-transparent
    Error: "gtk-update-icon-cache: No theme index file"
    
Just install index.theme explicitly to remove those error, its content
is from xcursor-transparent-theme's README file.
    
[YOCTO #4234]

The following changes since commit 307e860860badd4420a01ed781c6c845fc9bf603:

  udev: fix init script for the location of udevd (2013-04-09 18:09:14 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/4234
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/4234

Wenzong Fan (1):
  xcursor-transparent-theme: install index.theme explicitly

 .../xcursor-transparent-theme-0.1.1/index.theme       |    2 ++
 .../xcursor-transparent-theme_0.1.1.bb                |   17 ++++++++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme-0.1.1/index.theme

-- 
1.7.10.4



