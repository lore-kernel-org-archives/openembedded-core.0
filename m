Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2F8F36080F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 19:53:22 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id n128so70518931pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 11:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=cUvuDczd4KS3luo2o9aQBBkOhek0ms4dhElICwrEOFo=;
	b=YAshzHCdRcGJuv/JQ1IcOS6SYmxAHPObzVDosG4GyioMFeGj+f2HhjoJIIhiFo1fFj
	8etBrZxXBh1KO/qHjACl1jx1MTW9LMDYO1xXMw1FFkth3Pve+DjUk8TnlWi4VmKY3rCy
	f7Tu91Dg6qKwf4v62UP8TzFsahXIi8PWPSitr6JLOvCwLm7IBs9WbZ+hD2WWA8zwim92
	0b7Y2g+8a8lnSrmpYxwMDD5Mx7AoEZlMLO+rhcE/5a6Kd+4JSlGiSigdGMuziKaAFkwe
	Hdd5sEBHBIqBAlVQRzqkaIu0pirmG+gM9YWQ+haZ8Ri//qUNNPKctS5/j6HsqaGQM6IB
	J4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=cUvuDczd4KS3luo2o9aQBBkOhek0ms4dhElICwrEOFo=;
	b=Non6IyctVoW5y6j15vPpyaLRzkl1dyJfj1wXFcLIoyZ2FsrXXaIQ7ae8xhqo9o5zwl
	veRMNe7xpiECMN/xGY3rqmW2H+C8qsMxlw65nJdLkN3HH3eENtADWiNkpoLTmwe70D4g
	Mpxv8Sy2sp9Hb1XeIfntqS3DKI9pHGFnBD+OHUgyi8WJFyKZHKQ/0aKtMCV+bCMjM4oS
	yoqbOJnYd607LYWNZKDh7LpTcRtimIq/Rj5iViEKXTyacN60nfknJMD9CvG31YfG4Whk
	D7TbnG16ZfgtRKXJLGGcAmossBvRh/tjozZy3V+cchO+VYj6S/g9TsB18e9o5Ek2yked
	fw1g==
X-Gm-Message-State: AG10YOQgHxYuZyjt1EeUCcTk5/mV5C8+hH3H7O8KTdHAo869NSj1HR9M0sbpzkNfkkeJiA==
X-Received: by 10.98.76.19 with SMTP id z19mr32152498pfa.78.1454270003535;
	Sun, 31 Jan 2016 11:53:23 -0800 (PST)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	q136sm37670536pfq.66.2016.01.31.11.53.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 Jan 2016 11:53:22 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Sun, 31 Jan 2016 11:53:06 -0800
Message-Id: <cover.1454255704.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
Subject: [jethro-next 0/8] pull request for jethro
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
X-List-Received-Date: Sun, 31 Jan 2016 19:53:23 -0000

From: Armin Kuster <akuster@mvista.com>

please consider these last few security fixes for jethro next

The following changes since commit 049be17b533d7c592dae8e0f33ddbae54639a776:

  libpcre: bug fixes include security (2016-01-30 12:13:10 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/jethro_cve_fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/jethro_cve_fixes

Armin Kuster (8):
  dpkg: Security fix CVE-2015-0860
  libxml2: Security fix CVE-2015-8241
  libxml2: Security fix CVE-2015-8710
  bind: Security fix CVE-2015-8000
  bind: Security fix CVE-2015-8461
  librsvg: Security fix CVE-2015-7558
  gdk-pixbuf: Security fix CVE-2015-7674
  grub: Security fix CVE-2015-8370

 meta/recipes-bsp/grub/files/CVE-2015-8370.patch    |  59 +++++
 meta/recipes-bsp/grub/grub2.inc                    |   1 +
 .../bind/bind/CVE-2015-8000.patch                  | 278 +++++++++++++++++++++
 .../bind/bind/CVE-2015-8461.patch                  |  44 ++++
 meta/recipes-connectivity/bind/bind_9.10.2-P4.bb   |   2 +
 meta/recipes-core/libxml/libxml2.inc               |   2 +
 .../libxml/libxml2/CVE-2015-8241.patch             |  40 +++
 .../libxml/libxml2/CVE-2015-8710.patch             |  71 ++++++
 .../recipes-devtools/dpkg/dpkg/CVE-2015-0860.patch |  52 ++++
 meta/recipes-devtools/dpkg/dpkg_1.18.2.bb          |   1 +
 .../gdk-pixbuf/gdk-pixbuf/CVE-2015-7674.patch      |  39 +++
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb |   1 +
 .../librsvg/librsvg/CVE-2015-7558_1.patch          | 139 +++++++++++
 .../librsvg/librsvg/CVE-2015-7558_2.patch          | 230 +++++++++++++++++
 .../librsvg/librsvg/CVE-2015-7558_3.patch          | 223 +++++++++++++++++
 meta/recipes-gnome/librsvg/librsvg_2.40.10.bb      |   6 +-
 16 files changed, 1187 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2015-8370.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-8000.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-8461.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8241.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-8710.patch
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/CVE-2015-0860.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2015-7674.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_1.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_2.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_3.patch

-- 
2.3.5


