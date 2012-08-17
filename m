Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T2L1l-0002b8-LW
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 13:47:46 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 17 Aug 2012 04:35:45 -0700
Received: by wibhr14 with SMTP id hr14so1244109wib.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 04:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=W1+k5f6qX2ZqJNh2CvQ1/id5rVGiLhDuqGUVasdJ2sw=;
	b=An0K74L0WmW1IT0wny/qKrG40TM+NlBAcNi9nKf3+xg4ssh+9HFGj0IytIXXGziy62
	6hoZ9SEB3d96BhaKoPHdB1bYVe9Jcv+y1LVmaky8LFWli0SXysDNNFbHYQhRvAuO3Vf5
	FNkxZZSQxdaBdnIertgKnEDdi2Wwl/Jxsl+CRXUBsOh/1rTKyWgViJJPrENPZT36DVyM
	bX7epIWBU9/B9DHfSIn1i6eRfcpRFnmxaz4GpOOv2oG6ipDpviABvEWQB1FEUfIngruv
	/ecBv+2evvPddddZ0zFsTYDGz0g0bwOhRAWkuGKGbV3j4KXCud6+8399O5U2LNw7Yyqr
	U85A==
Received: by 10.180.84.164 with SMTP id a4mr4256552wiz.12.1345203343650;
	Fri, 17 Aug 2012 04:35:43 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id w7sm9288608wiz.0.2012.08.17.04.35.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Aug 2012 04:35:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 12:35:07 +0100
Message-Id: <cover.1345203203.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmNmZ4ECXd1RMTXJXuDyJeZytNfj4ujh5GH9h8f7HhlN4YGwI0ctrhqicApl45K/nFfvxmA
Subject: [PATCH 0/2] Remove older GTK+ versions
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
X-List-Received-Date: Fri, 17 Aug 2012 11:47:46 -0000

Remove the very old versions of GTK+ 2.x that we don't build.  They were
kept for their patches, but the patches don't apply anymore because the
relevant code has changed dramatically.

If someone still wants to use them, meta-oe is a better place for them to
live.

Ross

The following changes since commit af847d36375aa53f0c1ee2a00c97ba9f38837d1b:

  bitbake: bitbake: build.py: Add stampdir argument to cached_mtime_noerror (2012-08-16 12:27:41 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/gtk2

for you to fetch changes up to f6cf7bda28c1ae5f9033863f70657e1970b6bdc9:

  gtk+ remove 2.16.6 (2012-08-17 12:29:59 +0100)

----------------------------------------------------------------
Ross Burton (2):
      gtk+: remove 2.12.7
      gtk+ remove 2.16.6

 .../gtk+/gtk+-2.12.7/cellrenderer-cairo.patch      |   34 -
 .../gtk+/gtk+-2.12.7/combo-arrow-size.patch        |   69 -
 .../gtk+/gtk+-2.12.7/disable-print.patch           |   28 -
 .../gtk+/gtk+-2.12.7/entry-cairo.patch             |  105 -
 .../gtk+/gtk+-2.12.7/filechooser-default.patch     | 9523 --------------------
 .../gtk+/gtk+-2.12.7/filechooser-props.patch       |   59 -
 .../gtk+/gtk+-2.12.7/filechooser-sizefix.patch     |   37 -
 .../gtk+/gtk+-2.12.7/filesystem-volumes.patch      |  200 -
 .../gtk+/gtk+-2.12.7/gtklabel-resize-patch         |   12 -
 .../gtk+/gtk+-2.12.7/hardcoded_libtool.patch       |   31 -
 .../gtk+/gtk+-2.12.7/menu-deactivate.patch         |   53 -
 meta/recipes-gnome/gtk+/gtk+-2.12.7/no-demos.patch |   12 -
 .../gtk+/gtk+-2.12.7/pangoxft2.10.6.diff           | 2458 -----
 .../gtk+/gtk+-2.12.7/range-no-redraw.patch         |  130 -
 .../gtk+/gtk+-2.12.7/run-iconcache.patch           |   21 -
 .../gtk+/gtk+-2.12.7/scrolled-placement.patch      |   24 -
 .../gtk+/gtk+-2.12.7/toggle-font.diff              |  102 -
 .../recipes-gnome/gtk+/gtk+-2.12.7/xsettings.patch |   18 -
 ...Duplicate-the-exec-string-returned-by-gtk.patch |   33 -
 .../gtk+/gtk+-2.16.6/cellrenderer-cairo.patch      |   34 -
 .../gtk+-2.16.6/disable-gio-png-sniff-test.diff    |   99 -
 .../gtk+/gtk+-2.16.6/entry-cairo.patch             |  105 -
 .../gtk+/gtk+-2.16.6/hardcoded_libtool.patch       |   33 -
 meta/recipes-gnome/gtk+/gtk+-2.16.6/no-demos.patch |   12 -
 .../gtk+/gtk+-2.16.6/run-iconcache.patch           |   21 -
 .../gtk+/gtk+-2.16.6/toggle-font.diff              |  102 -
 .../recipes-gnome/gtk+/gtk+-2.16.6/xsettings.patch |   18 -
 meta/recipes-gnome/gtk+/gtk+_2.12.7.bb             |   49 -
 meta/recipes-gnome/gtk+/gtk+_2.16.6.bb             |   49 -
 29 files changed, 13471 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/cellrenderer-cairo.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/combo-arrow-size.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/disable-print.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/entry-cairo.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/filechooser-default.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/filechooser-props.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/filechooser-sizefix.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/filesystem-volumes.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/gtklabel-resize-patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/hardcoded_libtool.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/menu-deactivate.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/no-demos.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/pangoxft2.10.6.diff
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/range-no-redraw.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/run-iconcache.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/scrolled-placement.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/toggle-font.diff
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/xsettings.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.16.6/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.16.6/cellrenderer-cairo.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.16.6/disable-gio-png-sniff-test.diff
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.16.6/entry-cairo.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.16.6/hardcoded_libtool.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.16.6/no-demos.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.16.6/run-iconcache.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.16.6/toggle-font.diff
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.16.6/xsettings.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+_2.12.7.bb
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+_2.16.6.bb

Ross Burton (2):
  gtk+: remove 2.12.7
  gtk+ remove 2.16.6

 .../gtk+/gtk+-2.12.7/cellrenderer-cairo.patch      |   34 -
 .../gtk+/gtk+-2.12.7/combo-arrow-size.patch        |   69 -
 .../gtk+/gtk+-2.12.7/disable-print.patch           |   28 -
 .../gtk+/gtk+-2.12.7/entry-cairo.patch             |  105 -
 .../gtk+/gtk+-2.12.7/filechooser-default.patch     | 9523 --------------------
 .../gtk+/gtk+-2.12.7/filechooser-props.patch       |   59 -
 .../gtk+/gtk+-2.12.7/filechooser-sizefix.patch     |   37 -
 .../gtk+/gtk+-2.12.7/filesystem-volumes.patch      |  200 -
 .../gtk+/gtk+-2.12.7/gtklabel-resize-patch         |   12 -
 .../gtk+/gtk+-2.12.7/hardcoded_libtool.patch       |   31 -
 .../gtk+/gtk+-2.12.7/menu-deactivate.patch         |   53 -
 meta/recipes-gnome/gtk+/gtk+-2.12.7/no-demos.patch |   12 -
 .../gtk+/gtk+-2.12.7/pangoxft2.10.6.diff           | 2458 -----
 .../gtk+/gtk+-2.12.7/range-no-redraw.patch         |  130 -
 .../gtk+/gtk+-2.12.7/run-iconcache.patch           |   21 -
 .../gtk+/gtk+-2.12.7/scrolled-placement.patch      |   24 -
 .../gtk+/gtk+-2.12.7/toggle-font.diff              |  102 -
 .../recipes-gnome/gtk+/gtk+-2.12.7/xsettings.patch |   18 -
 ...Duplicate-the-exec-string-returned-by-gtk.patch |   33 -
 .../gtk+/gtk+-2.16.6/cellrenderer-cairo.patch      |   34 -
 .../gtk+-2.16.6/disable-gio-png-sniff-test.diff    |   99 -
 .../gtk+/gtk+-2.16.6/entry-cairo.patch             |  105 -
 .../gtk+/gtk+-2.16.6/hardcoded_libtool.patch       |   33 -
 meta/recipes-gnome/gtk+/gtk+-2.16.6/no-demos.patch |   12 -
 .../gtk+/gtk+-2.16.6/run-iconcache.patch           |   21 -
 .../gtk+/gtk+-2.16.6/toggle-font.diff              |  102 -
 .../recipes-gnome/gtk+/gtk+-2.16.6/xsettings.patch |   18 -
 meta/recipes-gnome/gtk+/gtk+_2.12.7.bb             |   49 -
 meta/recipes-gnome/gtk+/gtk+_2.16.6.bb             |   49 -
 29 files changed, 13471 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/cellrenderer-cairo.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/combo-arrow-size.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/disable-print.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/entry-cairo.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/filechooser-default.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/filechooser-props.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/filechooser-sizefix.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/filesystem-volumes.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/gtklabel-resize-patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/hardcoded_libtool.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/menu-deactivate.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/no-demos.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/pangoxft2.10.6.diff
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/range-no-redraw.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/run-iconcache.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/scrolled-placement.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/toggle-font.diff
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.12.7/xsettings.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.16.6/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.16.6/cellrenderer-cairo.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.16.6/disable-gio-png-sniff-test.diff
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.16.6/entry-cairo.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.16.6/hardcoded_libtool.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.16.6/no-demos.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.16.6/run-iconcache.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.16.6/toggle-font.diff
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.16.6/xsettings.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+_2.12.7.bb
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+_2.16.6.bb

-- 
1.7.10



