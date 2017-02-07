Return-Path: <herve.jourdain@neuf.fr>
X-Greylist: delayed 597 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 07 Feb 2017 01:45:49 UTC
Received: from smtp26.services.sfr.fr (smtp26.services.sfr.fr [93.17.128.10])
	by mail.openembedded.org (Postfix) with ESMTP id 0BE1A6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 01:45:49 +0000 (UTC)
Received: from nbhjo (1-160-243-27.dynamic.hinet.net [1.160.243.27])
	by msfrf2627.sfr.fr (SMTP Server) with ESMTP id D9BE71C001D11;
	Tue,  7 Feb 2017 02:35:50 +0100 (CET)
Received: from nbhjo (1-160-243-27.dynamic.hinet.net [1.160.243.27])	(using
	TLSv1.2
	with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))	(No client
	certificate requested)	(Authenticated sender: herve.jourdain@neuf.fr)
	by msfrf2627.sfr.fr (SMTP Server) with ESMTPSA;
	Tue,  7 Feb 2017 02:35:48 +0100 (CET)
Authentication-Results: sfr.fr; auth=pass (LOGIN)
	smtp.auth=herve.jourdain@neuf.fr
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: openembedded-core@lists.openembedded.org
References: <1465458091-94186-1-git-send-email-herve.jourdain@neuf.fr>
	<1465458091-94186-2-git-send-email-herve.jourdain@neuf.fr>
In-Reply-To: <1465458091-94186-2-git-send-email-herve.jourdain@neuf.fr>
Date: Tue, 7 Feb 2017 02:35:43 +0100
Message-ID: <005001d280e2$82d1fdd0$8875f970$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQGXdt1oARUQIMlbbB1/UbhLbrKL3gExdsL4oclK7DA=
X-sfr-mailing: LEGIT
Cc: "'Klauer, Daniel'" <Daniel.Klauer@gin.de>
Subject: Re: [smartpm][PATCH 1/1] smartpm: if RPM transaction fails with an empty list of problems in attempt mode, ignore it!
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
X-List-Received-Date: Tue, 07 Feb 2017 01:45:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Language: fr

Ping...

Without that patch, I get errors on some builds - but not all - like the
following, and the patch fixes the problem.

----------------------------------------------------------------------------
-------------------------------------

Loading cache...
Updating cache...               ########################################
[100%]

Computing transaction...

Installing packages (127):
  acl-dbg                                libogg-dbg

  alsa-lib-dbg                           libomxil-dbg

  attr-dbg                               libossp-uuid-dbg

  base-files-dbg                         libpcre-dbg

  base-passwd-dbg                        libpixman-1-dbg

  bash-dbg                               libpng16-dbg

  bluez5-dbg                             libpopt-dbg

  busybox-dbg                            libproxy-dbg

  bzip2-dbg                              libreadline-dbg

  ca-certificates-dbg                    librsvg-2-dbg

  chromium-wayland-dbg                   libsndfile-dbg

  connman-dbg                            libsoup-2.4-dbg

  crda-dbg                               libspeex-dbg

  curl-dbg                               libspeexdsp-dbg

  db-dbg                                 libtag-dbg

  dbus-dbg                               libtheora-dbg

  dropbear-dbg                           libunistring-dbg

  e2fsprogs-dbg                          libusb-1.0-dbg

  elfutils-dbg                           libvorbis-dbg

  faad2-dbg                              libvorbisidec-dbg

  file-dbg                               libwebp-dbg

  flac-dbg                               libxkbcommon-dbg

  gcc-runtime-dbg                        libxml2-dbg

  gconf-dbg                              libz-dbg

  gdb-dbg                                mesa-dbg

  glib-networking-dbg                    mobile-broadband-provider-info-dbg

  gstreamer1.0-dbg                       ncurses-dbg

  gstreamer1.0-libav-dbg                 netbase-dbg

  gstreamer1.0-omx-dbg                   nettle-dbg

  gstreamer1.0-plugins-bad-dbg           nspr-dbg

  gstreamer1.0-plugins-base-dbg          nss-dbg

  gstreamer1.0-plugins-good-dbg          ofono-dbg

  iptables-dbg                           openssh-dbg

  kbd-dbg                                openssl-dbg

  keymaps-dbg                            opkg-utils-dbg

  kmod-dbg                               orc-dbg

  libc6-dbg                              os-release-dbg

  libcairo-dbg                           packagegroup-core-boot-dbg

  libcap-dbg                             packagegroup-core-eclipse-debug-dbg

  libcheck-dbg                           packagegroup-core-ssh-dropbear-dbg

  libcroco-dbg                           packagegroup-e2fs-dbg

  libdbus-glib-1-dbg                     pango-dbg

  libdrm-dbg                             psplash-dbg

  libexpat-dbg                           pulseaudio-dbg

  libffi-dbg                             python-dbg

  libfontconfig-dbg                      python-smartpm-dbg

  libfreetype-dbg                        rpm-dbg

  libgcc-s-dbg                           run-postinsts-dbg

  libgcrypt-dbg                          sbc-dbg

  libgdbm-dbg                            shadow-dbg

Committing transaction...

Preparing...                    ######################################## [
0%]
   1:Installing xz-dbg          ######################################## [
0%]
   2:Installing libgpg-error-.. ######################################## [
1%]
   3:Installing update-rc.d-dbg ######################################## [
2%]
   4:Installing pulseaudio-dbg  ######################################## [
3%]
   5:Installing attr-dbg        ######################################## [
3%]
   6:Installing packagegroup-.. ######################################## [
4%]
   7:Installing db-dbg          ######################################## [
5%]
   8:Installing wpa-supplican.. ######################################## [
6%]
   9:Installing libfontconfig.. ######################################## [
7%]
  10:Installing libgdk-pixbuf.. ######################################## [
7%]
  11:Installing libharfbuzz-dbg ######################################## [
8%]
  12:Installing gstreamer1.0-.. ######################################## [
9%]
  13:Installing keymaps-dbg     ######################################## [
10%]
  14:Installing libproxy-dbg    ######################################## [
11%]
  15:Installing libcap-dbg      ######################################## [
11%]
  16:Installing gstreamer1.0-.. ######################################## [
12%]
  17:Installing curl-dbg        ######################################## [
13%]
  18:Installing gdb-dbg         ######################################## [
14%]
  19:Installing alsa-lib-dbg    ######################################## [
14%]
  20:Installing shadow-secure.. ######################################## [
15%]
  21:Installing libgdbm-dbg     ######################################## [
16%]
  22:Installing packagegroup-.. ######################################## [
17%]
  23:Installing libcheck-dbg    ######################################## [
18%]
  24:Installing kbd-dbg         ######################################## [
18%]
  25:Installing connman-dbg     ######################################## [
19%]
  26:Installing libpixman-1-dbg ######################################## [
20%]
  27:Installing psplash-dbg     ######################################## [
21%]
  28:Installing pango-dbg       ######################################## [
22%]
  29:Installing libtheora-dbg   ######################################## [
22%]
  30:Installing base-passwd-dbg ######################################## [
23%]
  31:Installing gstreamer1.0-.. ######################################## [
24%]
  32:Installing volatile-bind.. ######################################## [
25%]
  33:Installing netbase-dbg     ######################################## [
25%]
  34:Installing wireless-regd.. ######################################## [
26%]
  35:Installing libspeex-dbg    ######################################## [
27%]
  36:Installing ncurses-dbg     ######################################## [
28%]
  37:Installing chromium-wayl.. ######################################## [
29%]
  38:Installing libglib-2.0-dbg ######################################## [
29%]
  39:Installing libc6-dbg       ######################################## [
30%]
  40:Installing opkg-utils-dbg  ######################################## [
31%]
  41:Installing e2fsprogs-dbg   ######################################## [
32%]
  42:Installing python-smartp.. ######################################## [
33%]
  43:Installing libnl-3-dbg     ######################################## [
33%]
  44:Installing acl-dbg         ######################################## [
34%]
  45:Installing openssl-dbg     ######################################## [
35%]
  46:Installing mobile-broadb.. ######################################## [
36%]
  47:Installing dropbear-dbg    ######################################## [
37%]
  48:Installing gcc-runtime-dbg ######################################## [
37%]
  49:Installing gstreamer1.0-.. ######################################## [
38%]
  50:Installing libidn-dbg      ######################################## [
39%]
  51:Installing systemd-seria.. ######################################## [
40%]
  52:Installing mesa-dbg        ######################################## [
40%]
  53:Installing crda-dbg        ######################################## [
41%]
  54:Installing libvorbisidec.. ######################################## [
42%]
  55:Installing os-release-dbg  ######################################## [
43%]
  56:Installing libusb-1.0-dbg  ######################################## [
44%]
  57:Installing libgnutls-dbg   ######################################## [
44%]
  58:Installing libxkbcommon-.. ######################################## [
45%]
  59:Installing bash-dbg        ######################################## [
46%]
  60:Installing bluez5-dbg      ######################################## [
47%]
  61:Installing nettle-dbg      ######################################## [
48%]
  62:Installing libspeexdsp-dbg ######################################## [
48%]
  63:Installing gconf-dbg       ######################################## [
49%]
  64:Installing nspr-dbg        ######################################## [
50%]
  65:Installing gstreamer1.0-.. ######################################## [
51%]
  66:Installing rpm-dbg         ######################################## [
51%]
  67:Installing busybox-dbg     ######################################## [
52%]
  68:Installing libxml2-dbg     ######################################## [
53%]
  69:Installing openssh-dbg     ######################################## [
54%]
  70:Installing sbc-dbg         ######################################## [
55%]
  71:Installing libz-dbg        ######################################## [
55%]
  72:Installing libpopt-dbg     ######################################## [
56%]
  73:Installing libpcre-dbg     ######################################## [
57%]
  74:Installing elfutils-dbg    ######################################## [
58%]
  75:Installing shadow-dbg      ######################################## [
59%]
  76:Installing libvorbis-dbg   ######################################## [
59%]
  77:Installing libogg-dbg      ######################################## [
60%]
  78:Installing librsvg-2-dbg   ######################################## [
61%]
  79:Installing ca-certificat.. ######################################## [
62%]
  80:Installing libdbus-glib-.. ######################################## [
62%]
  81:Installing packagegroup-.. ######################################## [
63%]
  82:Installing gstreamer1.0-.. ######################################## [
64%]
  83:Installing libgmp-dbg      ######################################## [
65%]
  84:Installing libossp-uuid-.. ######################################## [
66%]
  85:Installing wayland-dbg     ######################################## [
66%]
  86:Installing libtag-dbg      ######################################## [
67%]
  87:Installing libomxil-dbg    ######################################## [
68%]
  88:Installing systemd-compa.. ######################################## [
69%]
  89:Installing util-linux-dbg  ######################################## [
70%]
  90:Installing libfreetype-dbg ######################################## [
70%]
  91:Installing libsoup-2.4-dbg ######################################## [
71%]
  92:Installing libexpat-dbg    ######################################## [
72%]
  93:Installing libgcrypt-dbg   ######################################## [
73%]
  94:Installing libmms-dbg      ######################################## [
74%]
  95:Installing libdrm-dbg      ######################################## [
74%]
  96:Installing base-files-dbg  ######################################## [
75%]
  97:Installing libffi-dbg      ######################################## [
76%]
  98:Installing libpng16-dbg    ######################################## [
77%]
  99:Installing libreadline-dbg ######################################## [
77%]
 100:Installing libneon-dbg     ######################################## [
78%]
 101:Installing tcf-agent-dbg   ######################################## [
79%]
 102:Installing libwebp-dbg     ######################################## [
80%]
 103:Installing packagegroup-.. ######################################## [
81%]
 104:Installing sqlite3-dbg     ######################################## [
81%]
 105:Installing libsndfile-dbg  ######################################## [
82%]
 106:Installing glib-networki.. ######################################## [
83%]
 107:Installing iptables-dbg    ######################################## [
84%]
 108:Installing file-dbg        ######################################## [
85%]
 109:Installing orc-dbg         ######################################## [
85%]
 110:Installing flac-dbg        ######################################## [
86%]
 111:Installing ofono-dbg       ######################################## [
87%]
 112:Installing bzip2-dbg       ######################################## [
88%]
 113:Installing dbus-dbg        ######################################## [
88%]
 114:Installing python-dbg      ######################################## [
89%]
 115:Installing libcroco-dbg    ######################################## [
90%]
 116:Installing systemd-dbg     ######################################## [
91%]
 117:Installing libcairo-dbg    ######################################## [
92%]
 118:Installing kmod-dbg        ######################################## [
92%]
 119:Installing libjpeg-dbg     ######################################## [
93%]
 120:Installing libgudev-1.0-.. ######################################## [
94%]
 121:Installing libical-dbg     ######################################## [
95%]
 122:Installing nss-dbg         ######################################## [
96%]
 123:Installing libunistring-.. ######################################## [
96%]
 124:Installing faad2-dbg       ######################################## [
97%]
 125:Installing libjson-c-dbg   ######################################## [
98%]
 126:Installing run-postinsts.. ######################################## [
99%]
 127:Installing libgcc-s-dbg    ########################################
[100%]
Preparing...                    ######################################## [
0%]
error: package xz-dbg-5.2.2-r0.cortexa7hf_neon_vfpv4 is already installed
error: package libgpg-error-dbg-1.25-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package update-rc.d-dbg-0.7-r5.all is already installed
error: package pulseaudio-dbg-9.0-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package attr-dbg-2.4.47-r0.cortexa7hf_neon_vfpv4 is already installed
error: package packagegroup-e2fs-dbg-1.0-r0.all is already installed
error: package db-dbg-6.0.35-r1.cortexa7hf_neon_vfpv4 is already installed
error: package wpa-supplicant-dbg-2.6-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package libfontconfig-dbg-2.12.1-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package libgdk-pixbuf-2.0-dbg-2.36.1-r0.cortexa7hf_neon_vfpv4 is
already installed
error: package libharfbuzz-dbg-1.3.4-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package gstreamer1.0-plugins-base-dbg-1.10.2-r0.cortexa7hf_neon_vfpv4
is already installed
error: package keymaps-dbg-1.0-r31.raspberrypi2 is already installed
error: package libproxy-dbg-0.4.13-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package libcap-dbg-2.25-r0.cortexa7hf_neon_vfpv4 is already installed
error: package gstreamer1.0-plugins-good-dbg-1.10.2-r0.cortexa7hf_neon_vfpv4
is already installed
error: package curl-dbg-7.52.1-r0.cortexa7hf_neon_vfpv4 is already installed
error: package gdb-dbg-7.12-r0.cortexa7hf_neon_vfpv4 is already installed
error: package alsa-lib-dbg-1.1.2-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package shadow-securetty-dbg-4.2.1-r3.raspberrypi2 is already
installed
error: package libgdbm-dbg-1.12-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package packagegroup-core-boot-dbg-1.0-r17.raspberrypi2 is already
installed
error: package libcheck-dbg-0.10.0-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package kbd-dbg-2.0.3-r0.cortexa7hf_neon_vfpv4 is already installed
error: package connman-dbg-1.33-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package psplash-dbg-0.1+git0+88343ad23c-r15.cortexa7hf_neon_vfpv4 is
already installed
error: package pango-dbg-1.40.3-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package libtheora-dbg-1.1.1-r1.cortexa7hf_neon_vfpv4 is already
installed
error: package base-passwd-dbg-3.5.29-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package gstreamer1.0-dbg-1.10.2-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package volatile-binds-dbg-1.0-r0.all is already installed
error: package wireless-regdb-dbg-2016.06.10-r0.cortexa7hf_neon_vfpv4 is
already installed
error: package libspeex-dbg-1.2rc2-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package ncurses-dbg-6.0+20160625-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package libc6-dbg-2.24-r0.cortexa7hf_neon_vfpv4 is already installed
error: package opkg-utils-dbg-0.3.2+git0+3ffece9bf1-r0.cortexa7hf_neon_vfpv4
is already installed
error: package e2fsprogs-dbg-1.43.3-r1.cortexa7hf_neon_vfpv4 is already
installed
error: package
python-smartpm-dbg-1.5+git0+407a7eca76-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package acl-dbg-2.2.52-r0.cortexa7hf_neon_vfpv4 is already installed
error: package openssl-dbg-1.0.2j-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package dropbear-dbg-2016.74-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package gcc-runtime-dbg-5.4.0-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package gstreamer1.0-libav-dbg-1.10.2-r0.cortexa7hf_neon_vfpv4 is
already installed
error: package libidn-dbg-1.33-r0.cortexa7hf_neon_vfpv4 is already installed
error: package systemd-serialgetty-dbg-1.0-r5.raspberrypi2 is already
installed
error: package crda-dbg-3.18-r0.cortexa7hf_neon_vfpv4 is already installed
error: package libvorbisidec-dbg-20150107-r1.cortexa7hf_neon_vfpv4 is
already installed
error: package os-release-dbg-1.0-r0.all is already installed
error: package libusb-1.0-dbg-1.0.20-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package libgnutls-dbg-3.5.7-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package libxkbcommon-dbg-0.7.0-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package bash-dbg-4.3.30-r0.cortexa7hf_neon_vfpv4 is already installed
error: package bluez5-dbg-5.43-r0.cortexa7hf_neon_vfpv4 is already installed
error: package nettle-dbg-3.3-r0.cortexa7hf_neon_vfpv4 is already installed
error: package libspeexdsp-dbg-1.2rc3-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package gconf-dbg-3.2.6-r0.cortexa7hf_neon_vfpv4 is already installed
error: package nspr-dbg-4.13.1-r0.cortexa7hf_neon_vfpv4 is already installed
error: package gstreamer1.0-omx-dbg-1.10.2-r0.cortexa7hf_neon_vfpv4 is
already installed
error: package rpm-dbg-5.4.16-r0.cortexa7hf_neon_vfpv4 is already installed
error: package busybox-dbg-1.24.1-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package libxml2-dbg-2.9.4-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package openssh-dbg-7.3p1-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package sbc-dbg-1.3-r0.cortexa7hf_neon_vfpv4 is already installed
error: package libz-dbg-1.2.8-r0.cortexa7hf_neon_vfpv4 is already installed
error: package libpopt-dbg-1.16-r3.cortexa7hf_neon_vfpv4 is already
installed
error: package libpcre-dbg-8.39-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package elfutils-dbg-0.166-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package shadow-dbg-4.2.1-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package libvorbis-dbg-1.3.5-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package libogg-dbg-1.3.2-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package librsvg-2-dbg-2.40.16-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package ca-certificates-dbg-20161130-r0.all is already installed
error: package libdbus-glib-1-dbg-0.108-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package packagegroup-core-ssh-dropbear-dbg-1.0-r1.all is already
installed
error: package gstreamer1.0-plugins-bad-dbg-1.10.2-r0.cortexa7hf_neon_vfpv4
is already installed
error: package libgmp-dbg-6.1.1-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package libossp-uuid-dbg-1.6.2-r2.cortexa7hf_neon_vfpv4 is already
installed
error: package wayland-dbg-1.12.0-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package libtag-dbg-1.11.1-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package libomxil-dbg-0.9.3-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package systemd-compat-units-dbg-1.0-r29.cortexa7hf_neon_vfpv4 is
already installed
error: package util-linux-dbg-2.29-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package libfreetype-dbg-2.7-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package libsoup-2.4-dbg-2.56.0-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package libexpat-dbg-2.2.0-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package libgcrypt-dbg-1.7.3-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package libmms-dbg-0.6.4-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package libdrm-dbg-2.4.74-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package base-files-dbg-3.0.14-r89.raspberrypi2 is already installed
error: package libffi-dbg-3.2.1-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package libpng16-dbg-1.6.26-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package libreadline-dbg-7.0-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package libneon-dbg-0.30.2-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package tcf-agent-dbg-1.4.0+git0+2dddd5f440-r0.cortexa7hf_neon_vfpv4
is already installed
error: package libwebp-dbg-0.5.1-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package packagegroup-core-eclipse-debug-dbg-1.0-r0.all is already
installed
error: package libsndfile-dbg-1.0.27-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package glib-networking-dbg-2.50.0-r0.cortexa7hf_neon_vfpv4 is
already installed
error: package iptables-dbg-1.6.0-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package file-dbg-5.29-r0.cortexa7hf_neon_vfpv4 is already installed
error: package orc-dbg-0.4.26-r0.cortexa7hf_neon_vfpv4 is already installed
error: package flac-dbg-1.3.1-r0.cortexa7hf_neon_vfpv4 is already installed
error: package ofono-dbg-1.19-r0.cortexa7hf_neon_vfpv4 is already installed
error: package bzip2-dbg-1.0.6-r5.cortexa7hf_neon_vfpv4 is already installed
error: package dbus-dbg-1.10.10-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package python-dbg-2.7.12-r1.cortexa7hf_neon_vfpv4 is already
installed
error: package libcroco-dbg-0.6.11-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package libcairo-dbg-1.14.8-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package kmod-dbg-23+git0+65a885df5f-r0.cortexa7hf_neon_vfpv4 is
already installed
error: package libgudev-1.0-dbg-230-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package libical-dbg-2.0.0-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package nss-dbg-3.27.1-r0.cortexa7hf_neon_vfpv4 is already installed
error: package libunistring-dbg-0.9.7-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package faad2-dbg-2.7-r1.cortexa7hf_neon_vfpv4 is already installed
error: package libjson-c-dbg-0.12-r0.cortexa7hf_neon_vfpv4 is already
installed
error: package run-postinsts-dbg-1.0-r9.all is already installed
error: package libgcc-s-dbg-5.4.0-r0.cortexa7hf_neon_vfpv4 is already
installed
.0-dbg                  shadow-securetty-dbg                   
  libglib-2.0-dbg                        sqlite3-dbg

  libgmp-dbg                             systemd-compat-units-dbg

  libgnutls-dbg                          systemd-dbg

  libgpg-error-dbg                       systemd-serialgetty-dbg

  libgudev-1.0-dbg                       tcf-agent-dbg

  libharfbuzz-dbg                        update-rc.d-dbg

  libical-dbg                            util-linux-dbg

  libidn-dbg                             volatile-binds-dbg

  libjpeg-dbg                            wayland-dbg

  libjson-c-dbg                          wireless-regdb-dbg

  libmms-dbg                             wpa-supplicant-dbg

  libneon-dbg                            xz-dbg

  libnl-3-dbg                            

1874.2MB of package files are needed. 4819.5MB will be used.


Saving cache...

-----Original Message-----
From: Herve Jourdain [mailto:herve.jourdain@neuf.fr] 
Sent: jeudi 9 juin 2016 09:42
To: openembedded-core@lists.openembedded.org
Cc: Herve Jourdain <herve.jourdain@neuf.fr>
Subject: [OE-core][smartpm][PATCH 1/1] smartpm: if RPM transaction fails
with an empty list of problems in attempt mode, ignore it!

Since commit be0cabf816a84c59e0e951b92a570121ed843822 on 2016/05/17, smartpm
will retry the transaction if ts.run() returns with an empty list of
problems, and we're in attempt mode.
But then, since all the packages are already installed, the transaction will
fail with "package already installed" error.

In attempt mode, it's fine to not retry nor generate an error when the
transaction fails for no reason linked to files/packages conflicts, so this
patch fixes this behaviour.

Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
---
 .../python/python-smartpm/smart-attempt.patch              | 14
+++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
b/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
index 5aedc88..e118204 100644
--- a/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
+++ b/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
@@ -26,7 +26,7 @@ diff --git a/smart/backends/rpm/pm.py
b/smart/backends/rpm/pm.py  index 9bbd952..ba6405a 100644
 --- a/smart/backends/rpm/pm.py
 +++ b/smart/backends/rpm/pm.py
-@@ -241,15 +241,48 @@ class RPMPackageManager(PackageManager):
+@@ -241,15 +241,56 @@ class RPMPackageManager(PackageManager):
          cb = RPMCallback(prog, upgradednames)
          cb.grabOutput(True)
          probs = None
@@ -36,7 +36,12 @@ index 9bbd952..ba6405a 100644
          finally:
              del getTS.ts
              cb.grabOutput(False)
-+            if (probs is not None) and sysconf.has("attempt-install",
soft=True):
++            # If there are file conflicts, and we're attempting
installation,
++            # remove conflicting packages from the transaction and retry
++            # If there are other problems returned by ts.run(), that are
not
++            # linked with packages/files conflicts (the returned list is
empty),
++            # then don't retry
++            if (probs is not None) and (len(probs) != 0) and
sysconf.has("attempt-install", soft=True):
 +                def remove_conflict(pkgNEVR):
 +                    for key in changeset.keys():
 +                        if pkgNEVR == str(key):
@@ -68,7 +73,10 @@ index 9bbd952..ba6405a 100644  +
              prog.setDone()
 -            if probs is not None:
-+            if (probs is not None) and (not retry):
++            # If there are other problems than packages/files conflicts
++            # returned by ts.run(), the returned list is empty, and if
++            # we're only attempting installation, then don't raise any
error
++            if (probs is not None) and ((len(probs) != 0) or not
sysconf.has("attempt-install", soft=True)) and (not retry):
                  raise Error, "\n".join([x[0] for x in probs])
              prog.stop()
 +            if retry and len(changeset):
--
2.7.4


