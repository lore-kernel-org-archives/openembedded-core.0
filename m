Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RlG4n-00046F-Uo
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 09:32:02 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0C8OTHU018205
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 00:24:29 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 12 Jan 2012 00:24:29 -0800
Message-ID: <cover.1326355020.git.xiaofeng.yan@windriver.com>
Old-Date: Thu, 12 Jan 2012 15:57:00 +0800
Date: Thu, 12 Jan 2012 16:12:43 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: PATCH 0/3] Fix the error when building image "core-image-gtk-directfb"
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
X-List-Received-Date: Thu, 12 Jan 2012 08:32:02 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Bitbake complain " No package 'cairo-xlib' found" when building image "core-image-gtk-directfb".
Misconfiguration of directfb in PACKAGECONFIG causes this problem. I change directfb to gtk-directfb.
Another problem is about messy code when running gtk-demo because of no directfb "/etc/pango".
I create this directory in pango.inc.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/gtk-directfb
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/gtk-directfb

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (3):
  gtk.inc: Change configuration of directfb to gtk-directfb
  cairo.inc: Change configuration of directfb to gtk-directfb
  pango.inc: add directory "/etc/pango"

 meta/recipes-gnome/gtk+/gtk+.inc      |    2 +-
 meta/recipes-graphics/cairo/cairo.inc |    2 +-
 meta/recipes-graphics/pango/pango.inc |    7 ++++++-
 3 files changed, 8 insertions(+), 3 deletions(-)



