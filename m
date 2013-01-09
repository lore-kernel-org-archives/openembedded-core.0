Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tsz5m-00087x-QO
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 18:05:34 +0100
Received: from mail-we0-f198.google.com ([74.125.82.198])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 09 Jan 2013 08:50:17 -0800
Received: by mail-we0-f198.google.com with SMTP id r1so1695293wey.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 08:50:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=7gvBu2ZkI04rZ+FJtdxcg9rTnxg/+ocGxu22AZ1yeXY=;
	b=fOfXgpZDbznV82OfsSiypOmC+CfrEZOxUbBLR1uMQhO+i74kuib/zu861uoX0Jg3f4
	C+0f9GVtE2oo7mOQ4dK1ncIFoqh9Bler9QUtAXFHXtGr8t3bCYlVvjIJqTg9Nh3ytooA
	j2uuhGc3M+tAZ72b3hbZpsdXhej7WbBuUqfo/QDUlReU7QHpcFSSRAi3NxNDMez+XLBI
	izz5snb4Q3xw0wHF0MAUa1zRpUe++V5U3eG8C47T1R5DRLO+8bsypa4XDMWwb25FbJLO
	qPkfR3IusP9N7TkYAHH8ugHX4vqFZG5NYG9NM+tqxNzqmh7/4l9B8M2uSSUgULFGooQ8
	MNBw==
X-Received: by 10.181.13.75 with SMTP id ew11mr4511337wid.9.1357750215013;
	Wed, 09 Jan 2013 08:50:15 -0800 (PST)
X-Received: by 10.181.13.75 with SMTP id ew11mr4510191wid.9.1357750204005;
	Wed, 09 Jan 2013 08:50:04 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id gz3sm4637422wib.2.2013.01.09.08.50.02
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 09 Jan 2013 08:50:03 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Jan 2013 16:48:05 +0000
Message-Id: <cover.1357749457.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQktlfIIExGixgNq7cG7Qps1k7kuyureOgzG2nrwUoPU6C4Du5gGAmYVappi8UHkQJevXSEO+M8VqvOnEAvO7lYM/SU3c9sAgBVC/OZQwPLOkn0TfO1usrshm+aanDPnogeUc+nHVyGJ29uCmecS3ENSYF2rBlel75lg6dRmYJem64Qbf4fYNNtmoV1oTo1zZ0dGfp/1
Subject: [PATCH 0/3] Add GTK+3
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
X-List-Received-Date: Wed, 09 Jan 2013 17:05:51 -0000
X-List-Received-Date: Wed, 09 Jan 2013 17:05:51 -0000

This short series adds GTK+ 3 after preparing GTK+ 2 and extending pkg-config.

The GTK+ 2 changes move gtk-update-icon-cache to use alternatives so that it
doesn't conflict with GTK+ 3's gtk-update-icon-cache.  The alternative that
meta-oe takes is to depend on GTK+ 2 to provide these tools, so it would be
impossible to produce an image with just GTK+ 3.

pkg-config is extended to allow cross packages to use pkg-config to find native
libraries, as a way of avoiding native packages just to build a tool.

GTK+ 3.4.4 is used as upstream is considering making the 3.4.x series long-term
supported.  The cross-compilation patch to avoid depending on gtk+-native is a
work in progress of a patch that is being worked on with upstream.

This has been tested by building a GTK+ 3 port of matchbox-desktop.

Ross

The following changes since commit 09359e6ec00901abfe49157f1f9730117b4d284b:

  freetype: update to 2.4.11 which includes fixes for CVE-2012-{5668, 5669, 5670} (2012-12-31 09:43:27 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/gtk3

for you to fetch changes up to 374767b5c1c81658f09f997becc3b8461574746d:

  gtk+3: add 3.4.4 (2013-01-09 16:30:49 +0000)

----------------------------------------------------------------
Ross Burton (3):
      gtk+: version installed gtk-update-icon-cache and use alternatives
      pkgconfig: add -native script that uses the native sysroot instead of target
      gtk+3: add 3.4.4

 meta/recipes-devtools/pkgconfig/pkgconfig.inc      |   10 +
 .../pkgconfig/pkgconfig/pkg-config-native.in       |    7 +
 meta/recipes-gnome/gtk+/gtk+.inc                   |   15 +-
 meta/recipes-gnome/gtk+/gtk+3/cross.patch          |  284 ++++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk+3_3.4.4.bb             |  111 ++++++++
 meta/recipes-gnome/gtk+/gtk+_2.24.14.bb            |    2 +-
 6 files changed, 426 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/cross.patch
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3_3.4.4.bb

Ross Burton (3):
  gtk+: version installed gtk-update-icon-cache and use alternatives
  pkgconfig: add -native script that uses the native sysroot instead of
    target
  gtk+3: add 3.4.4

 meta/recipes-devtools/pkgconfig/pkgconfig.inc      |   10 +
 .../pkgconfig/pkgconfig/pkg-config-native.in       |    7 +
 meta/recipes-gnome/gtk+/gtk+.inc                   |   15 +-
 meta/recipes-gnome/gtk+/gtk+3/cross.patch          |  284 ++++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk+3_3.4.4.bb             |  111 ++++++++
 meta/recipes-gnome/gtk+/gtk+_2.24.14.bb            |    2 +-
 6 files changed, 426 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/cross.patch
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3_3.4.4.bb

-- 
1.7.10.4



