Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id CFBA965C89
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 18:25:03 +0000 (UTC)
Received: by iebmu5 with SMTP id mu5so40534776ieb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 11:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jO9yUawSMJZjHC170NSOqHTDpRlEvCmvnsXQA8cqj4g=;
	b=DJ9OnUA3lNR9khH/MeJTU9Ca0KXzXDybWWWVjaOpGNZT06NTJRHoRsD7y+2Ye1BrnD
	3nwscyMSnWWN6YtikbqTZw72kFzqamUnqtAShjeUiDQCkTMHIvqBtHHVi8ufTCmeTA+J
	W1Vffe7aM9tYBz4g2PIg2yGZsPboB9LJNdiDaBKs7wmEQVAzsfFZkVIz0nz0RIX0WBhO
	+HStHVUxy8i2TZ6vrq2EKODDC7e14S9wbKyEk0rlW5DVYZmhp1C/E6rQz7puTZZ0qdUl
	HeIWZgtyBCkHBvZJvmZ5L2PNEF83QcFSdi1e4ww+xVUY0XugNzL1wDDcdRKueDvBXucm
	Ei7w==
X-Received: by 10.50.43.227 with SMTP id z3mr36345666igl.22.1435775103414;
	Wed, 01 Jul 2015 11:25:03 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id p4sm2229179igg.20.2015.07.01.11.25.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Jul 2015 11:25:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jul 2015 11:24:52 -0700
Message-Id: <4ce9590460509b82d8fec5b0423049b1be8912b2.1435774899.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1435774899.git.raj.khem@gmail.com>
References: <cover.1435774899.git.raj.khem@gmail.com>
Subject: [PATCH 1/6] libinput: Upgrade 0.7.0 -> 0.18.0
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
X-List-Received-Date: Wed, 01 Jul 2015 18:25:03 -0000

Upgrade is also required for wayland/weston 1.8.x

libinput license changes are
- COPYING: note that having linux/input.h in the tree does not make libinput GPL
- Updated to 2015 where appropriate, added where missing.
- filter: add Simon's copyright
  This code was largely lifted from the X server in
  bb25b2ad297891430606c367bfabc but didn't take the copyright messages
  that applied to that code.

- Change MIT X11 to MIT Expat license

  see

  http://cgit.freedesktop.org/wayland/libinput/commit/?id=bc9f16b40e23a1d25c105a4207b97d65253f0d98

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../wayland/{libinput_0.7.0.bb => libinput_0.18.0.bb}            | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_0.7.0.bb => libinput_0.18.0.bb} (50%)

diff --git a/meta/recipes-graphics/wayland/libinput_0.7.0.bb b/meta/recipes-graphics/wayland/libinput_0.18.0.bb
similarity index 50%
rename from meta/recipes-graphics/wayland/libinput_0.7.0.bb
rename to meta/recipes-graphics/wayland/libinput_0.18.0.bb
index 98d2942..0fe1c6c 100644
--- a/meta/recipes-graphics/wayland/libinput_0.7.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_0.18.0.bb
@@ -3,12 +3,15 @@ HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libinput/"
 SECTION = "libs"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=673e626420c7f859fbe2be3a9c13632d"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2184aef38ff137ed33ce9a63b9d1eb8f"
 
 DEPENDS = "libevdev udev mtdev"
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz"
-SRC_URI[md5sum] = "381b61396de28c12716ef7a5475fea50"
-SRC_URI[sha256sum] = "129f485afe5e4a9394641293991c97cb99f5f3338340d0d65b704ff463d1579e"
+SRC_URI[md5sum] = "0ddbb0d53d58dec0a86de6791560011a"
+SRC_URI[sha256sum] = "64a70f96bab17a22eaf2fd7af17cf83def3388374096c7623be9448f62808cda"
 
 inherit autotools pkgconfig
+
+FILES_${PN} += "${libdir}/udev/"
+FILES_${PN}-dbg += "${libdir}/udev/.debug"
-- 
2.1.4


