Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U1GWS-0001F7-OR
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 14:19:25 +0100
Received: from mail-ea0-f197.google.com ([209.85.215.197])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 01 Feb 2013 05:03:31 -0800
Received: by mail-ea0-f197.google.com with SMTP id j13so4493079eaa.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2013 05:03:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=OufPocLGKUDIdwpBiN3OXaJU5nqYjEJA7lwbGoPnDo4=;
	b=fxw1+csisiCCwgJBoTswdJCOIlSSWB7r6iTPSgMGM9sptAhbWzTFQPYHr7GFe+EmCa
	yXQP+P9M9geJz6t1DkJK8BzVlDC2ldsBcow/+3hR4qYpBwRh4ShjYTZxiDwLJUALoVEw
	BaHtI5+nkyyTn5zTrshsapl61xJLndv07VG38rE5JEbM6wb8EPu0cxSHRy0HL6OPliKf
	3/T8FTy7bXrPWU+YMAbdYOLp8advMtLNhI6bSBgQb1JS/ubsjuLv1+Lxk/TxZoIGrZXg
	+wT+IjAN9j4qB8Bp4iemv6TJFwIeZAFxaAaW/kC5BihP4qNHAL2q1a0iqamPoSBPl99x
	TLtQ==
X-Received: by 10.194.171.198 with SMTP id aw6mr21721650wjc.3.1359723807262;
	Fri, 01 Feb 2013 05:03:27 -0800 (PST)
X-Received: by 10.194.171.198 with SMTP id aw6mr21721630wjc.3.1359723807093;
	Fri, 01 Feb 2013 05:03:27 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id hu8sm3146594wib.6.2013.02.01.05.03.25
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 01 Feb 2013 05:03:25 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2013 13:01:16 +0000
Message-Id: <cover.1359723526.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmJcle6vgcrKWhc7SYjQZr3qkQXpjBIl60jfoCgjgzpa3LjjABJNQgUxZAXeJIT9iex7yx1OSl9yVI7c+T5Un/tAJe9bHDd+PY9NzRZUA9MXCKM6M4J7ZBhbI3Ul+8/BWTRlvG5Vk8cEjoGVgjnuJkb0DO2G4V8mcqV67WSzu1LuNtqdX9TbI1cDe8YCuBoDQLFmyzL
Subject: [PATCH 0/6] Remove old recipes
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
X-List-Received-Date: Fri, 01 Feb 2013 13:19:34 -0000

Hi,

A series containing some more removes from oe-core:

libcanberra and metacity have already been submitted, but they're in this branch
for completeness.

clutter-box2d is about to move to meta-oe if they want it, as it's unused in oe-core.

orinoco-conf is legacy, if a BSP layer still needs it (meta-handheld doesn't,
and that's where I thought it would be) then they are welcome to restore it
there.

matchbox-stroke was a proof of concept, and considering that modern touch
screens are capacitive instead of resistive this is unlikly to be usable anyway.

Ross

The following changes since commit 8d80483e2f0f755a61087be1dffaf595fbc467fd:

  bitbake: bitbake-layers: print the recipe's depends that crosses a layer boundary (2013-01-31 14:00:03 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/removes

for you to fetch changes up to 3742a00f9efeb85866fd7b1748c8a346fe2e2bb9:

  matchbox-stroke: remove (2013-02-01 12:46:19 +0000)

----------------------------------------------------------------
Ross Burton (6):
      libcanberra: remove, migrated to meta-gnome
      metacity: remove, migrated to meta-gnome
      clutter-box2d: remove
      orinoco-conf: remove
      packagegroup-core-x11-sato: remove matchbox-stroke
      matchbox-stroke: remove

 meta/recipes-bsp/orinoco/files/COPYING.patch       |  346 --
 meta/recipes-bsp/orinoco/files/orinoco_cs.conf     |    2 -
 meta/recipes-bsp/orinoco/files/spectrum_fw.h       | 4569 --------------------
 meta/recipes-bsp/orinoco/orinoco-conf_1.0.bb       |   16 -
 .../metacity/remove-yelp-help-rules-var.patch      |   28 -
 meta/recipes-gnome/gnome/metacity_2.34.13.bb       |   30 -
 meta/recipes-graphics/clutter/clutter-box2d.inc    |   15 -
 meta/recipes-graphics/clutter/clutter-box2d_git.bb |   14 -
 .../pulseaudio/libcanberra_0.29.bb                 |   32 -
 .../matchbox-stroke/files/configure_fix.patch      |   15 -
 .../matchbox-stroke/files/single-instance.patch    |   20 -
 .../matchbox-stroke/matchbox-stroke_git.bb         |   25 -
 .../packagegroups/packagegroup-core-x11-sato.bb    |    1 -
 13 files changed, 5113 deletions(-)
 delete mode 100644 meta/recipes-bsp/orinoco/files/COPYING.patch
 delete mode 100644 meta/recipes-bsp/orinoco/files/orinoco_cs.conf
 delete mode 100644 meta/recipes-bsp/orinoco/files/spectrum_fw.h
 delete mode 100644 meta/recipes-bsp/orinoco/orinoco-conf_1.0.bb
 delete mode 100644 meta/recipes-gnome/gnome/metacity/remove-yelp-help-rules-var.patch
 delete mode 100644 meta/recipes-gnome/gnome/metacity_2.34.13.bb
 delete mode 100644 meta/recipes-graphics/clutter/clutter-box2d.inc
 delete mode 100644 meta/recipes-graphics/clutter/clutter-box2d_git.bb
 delete mode 100644 meta/recipes-multimedia/pulseaudio/libcanberra_0.29.bb
 delete mode 100644 meta/recipes-sato/matchbox-stroke/files/configure_fix.patch
 delete mode 100644 meta/recipes-sato/matchbox-stroke/files/single-instance.patch
 delete mode 100644 meta/recipes-sato/matchbox-stroke/matchbox-stroke_git.bb

Ross Burton (6):
  libcanberra: remove, migrated to meta-gnome
  metacity: remove, migrated to meta-gnome
  clutter-box2d: remove
  orinoco-conf: remove
  packagegroup-core-x11-sato: remove matchbox-stroke
  matchbox-stroke: remove

 meta/recipes-bsp/orinoco/files/COPYING.patch       |  346 --
 meta/recipes-bsp/orinoco/files/orinoco_cs.conf     |    2 -
 meta/recipes-bsp/orinoco/files/spectrum_fw.h       | 4569 --------------------
 meta/recipes-bsp/orinoco/orinoco-conf_1.0.bb       |   16 -
 .../metacity/remove-yelp-help-rules-var.patch      |   28 -
 meta/recipes-gnome/gnome/metacity_2.34.13.bb       |   30 -
 meta/recipes-graphics/clutter/clutter-box2d.inc    |   15 -
 meta/recipes-graphics/clutter/clutter-box2d_git.bb |   14 -
 .../pulseaudio/libcanberra_0.29.bb                 |   32 -
 .../matchbox-stroke/files/configure_fix.patch      |   15 -
 .../matchbox-stroke/files/single-instance.patch    |   20 -
 .../matchbox-stroke/matchbox-stroke_git.bb         |   25 -
 .../packagegroups/packagegroup-core-x11-sato.bb    |    1 -
 13 files changed, 5113 deletions(-)
 delete mode 100644 meta/recipes-bsp/orinoco/files/COPYING.patch
 delete mode 100644 meta/recipes-bsp/orinoco/files/orinoco_cs.conf
 delete mode 100644 meta/recipes-bsp/orinoco/files/spectrum_fw.h
 delete mode 100644 meta/recipes-bsp/orinoco/orinoco-conf_1.0.bb
 delete mode 100644 meta/recipes-gnome/gnome/metacity/remove-yelp-help-rules-var.patch
 delete mode 100644 meta/recipes-gnome/gnome/metacity_2.34.13.bb
 delete mode 100644 meta/recipes-graphics/clutter/clutter-box2d.inc
 delete mode 100644 meta/recipes-graphics/clutter/clutter-box2d_git.bb
 delete mode 100644 meta/recipes-multimedia/pulseaudio/libcanberra_0.29.bb
 delete mode 100644 meta/recipes-sato/matchbox-stroke/files/configure_fix.patch
 delete mode 100644 meta/recipes-sato/matchbox-stroke/files/single-instance.patch
 delete mode 100644 meta/recipes-sato/matchbox-stroke/matchbox-stroke_git.bb

-- 
1.7.10.4



