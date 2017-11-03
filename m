Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3683771A84
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 19:54:51 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id a192so3330734pge.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 12:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yNHOUyaQfCA7dA+yIBCUtq+NEdV15kDSFVzYJs9/N70=;
	b=nXABdCsFY8rYE2+RMn6rTJynz5sy4bhVZy6OEbqsY8G6mtO987e3KkKM/zpfqAOQYn
	Eu7DRg2YSJrXEopW1Yh6NaykU/wok1FYc06wLYfw6f2VZx5vYULYzfXifFR0Zfso+tsU
	9r+MmBacGd/UtZOnVd+oj+zb6fcALjfAcXMV49hvK6mQcEFHcI5jymBMSbNJ9Dv0D0M7
	dYhC0qt+r+HMoONTdEWJ9w0w7d5fU8zkfXuBHcJoWYoj6pnYJgLVA/QFczqut92Iepaz
	xUYFi7Re/uSlS6N4B8S10LRtcwys2lSe6ASVR/BCVDW2vAcQ+TtlWcQkBD00fhmfW59R
	znKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yNHOUyaQfCA7dA+yIBCUtq+NEdV15kDSFVzYJs9/N70=;
	b=rHmESV8znWP7+NzXxLV7IXd6iH0Qw25d/kbmkW4zdhHI25gJcw9uXXrY7kDhJeRDJS
	s5sRP3M9dXCQ3NXqlmA3XBqce01yd7+EsV1u2m5zG4Lc8e6JhjskQuObzleQhck9y75E
	KLScE/w9Iu8hTr7qY6UdNnC0jtbEwO17oteA/cqnp0z0w4DtJSAEarC9iV/T0SMPy3td
	QEYdwGBUC2NqUohsdtQssIsxk2AtmNQVkh2zOv4MSGQLeowsXhLndPsD/ENLotthQ3kJ
	fXj89w7IkRN4b358HN3pKpk6CA8qCo8fOA71cXYDOYPES9GtU7k7vv8oGdgtskeuD620
	X0yA==
X-Gm-Message-State: AMCzsaVHMonWNP6uXvXsLadkrS73Dru7knYpPJSYfxUOz/+xwaoZVSXL
	fPjWNzaBUQOoHnIL+NLDSNY=
X-Google-Smtp-Source: ABhQp+SKi01vmbl/XM43ISD8fWpBYdgDnBgsCXsYQCK85oFRZgd3/u3wOjbDjIVNqPQHIAAlSxCXjg==
X-Received: by 10.98.150.149 with SMTP id s21mr8703958pfk.151.1509738893210;
	Fri, 03 Nov 2017 12:54:53 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:78e5:dcc3:4839:af44])
	by smtp.gmail.com with ESMTPSA id
	c26sm12781112pfl.115.2017.11.03.12.54.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Nov 2017 12:54:52 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  3 Nov 2017 12:54:34 -0700
Message-Id: <cover.1509738544.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 00/15] core package updates
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
X-List-Received-Date: Fri, 03 Nov 2017 19:54:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

please consider these update for master-next

The following changes since commit 3b413a80578caacd9a7f405f3c51a3921d78a60d:

  README.qemu: qemuppc64 is not supported (2017-10-16 23:54:27 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib akuster/master-updates
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=akuster/master-updates

Armin Kuster (15):
  tzcode-native: update to 2017c
  tzdata: update 2017c
  libxres: upgrading to 1.2.0
  xkeyboard-config: upgrade to 2.22
  libxkbcommon: update to 0.7.2
  nspr: update to 4.17
  libxfont: update to 1.5.3
  xorg-xserver: update to 1.19.5
  libxfont2: update to 2.0.2
  xf86-input-libinput: update to 0.26.0
  nss: update to 3.33.0
  libpcre2: update to 10.30
  gnutls: update to 3.5.16
  bind: update to 9.10.6
  openssh: update to 7.6

 .../bind/{bind_9.10.5-P3.bb => bind_9.10.6.bb}     |   5 +-
 .../openssh/add-test-support-for-busybox.patch     |  64 +++-----
 ...h-7.1p1-conditional-compile-des-in-cipher.patch | 119 --------------
 ...h-7.1p1-conditional-compile-des-in-pkcs11.patch |  70 ---------
 .../openssh/{openssh_7.5p1.bb => openssh_7.6p1.bb} |  11 +-
 .../files/0001-Fix-Makefile-quoting-bug.patch      | 174 +++++++++++++++++++++
 .../files/0002-Port-zdump-to-C90-snprintf.patch    | 115 ++++++++++++++
 ...code-native_2017b.bb => tzcode-native_2017c.bb} |  15 +-
 .../tzdata/{tzdata_2017b.bb => tzdata_2017c.bb}    |   6 +-
 ...put_0.25.1.bb => xf86-input-libinput_0.26.0.bb} |   4 +-
 .../{libxfont2_2.0.1.bb => libxfont2_2.0.2.bb}     |   4 +-
 .../{libxfont_1.5.2.bb => libxfont_1.5.3.bb}       |   4 +-
 ...libxkbcommon_0.7.1.bb => libxkbcommon_0.7.2.bb} |   4 +-
 .../{libxres_1.0.7.bb => libxres_1.2.0.bb}         |   4 +-
 ...ard-config_2.21.bb => xkeyboard-config_2.22.bb} |   5 +-
 .../xserver-xorg/CVE-2017-10971-1.patch            |  76 ---------
 .../xserver-xorg/CVE-2017-10971-2.patch            |  55 -------
 .../xserver-xorg/CVE-2017-10971-3.patch            |  50 ------
 ...erver-xorg_1.19.3.bb => xserver-xorg_1.19.5.bb} |   7 +-
 .../gnutls/{gnutls_3.5.13.bb => gnutls_3.5.16.bb}  |   4 +-
 .../libpcre/libpcre2/libpcre2-CVE-2017-7186.patch  |  96 ------------
 .../libpcre/libpcre2/libpcre2-CVE-2017-8786.patch  |  93 -----------
 .../{libpcre2_10.23.bb => libpcre2_10.30.bb}       |   8 +-
 .../nspr/{nspr_4.16.bb => nspr_4.17.bb}            |   4 +-
 .../nss/{nss_3.31.1.bb => nss_3.33.bb}             |   4 +-
 25 files changed, 353 insertions(+), 648 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.10.5-P3.bb => bind_9.10.6.bb} (96%)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-cipher.patch
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-pkcs11.patch
 rename meta/recipes-connectivity/openssh/{openssh_7.5p1.bb => openssh_7.6p1.bb} (94%)
 create mode 100644 meta/recipes-extended/tzcode/files/0001-Fix-Makefile-quoting-bug.patch
 create mode 100644 meta/recipes-extended/tzcode/files/0002-Port-zdump-to-C90-snprintf.patch
 rename meta/recipes-extended/tzcode/{tzcode-native_2017b.bb => tzcode-native_2017c.bb} (54%)
 rename meta/recipes-extended/tzdata/{tzdata_2017b.bb => tzdata_2017c.bb} (97%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_0.25.1.bb => xf86-input-libinput_0.26.0.bb} (63%)
 rename meta/recipes-graphics/xorg-lib/{libxfont2_2.0.1.bb => libxfont2_2.0.2.bb} (80%)
 rename meta/recipes-graphics/xorg-lib/{libxfont_1.5.2.bb => libxfont_1.5.3.bb} (81%)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.7.1.bb => libxkbcommon_0.7.2.bb} (83%)
 rename meta/recipes-graphics/xorg-lib/{libxres_1.0.7.bb => libxres_1.2.0.bb} (77%)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.21.bb => xkeyboard-config_2.22.bb} (87%)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2017-10971-1.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2017-10971-2.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2017-10971-3.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.19.3.bb => xserver-xorg_1.19.5.bb} (81%)
 rename meta/recipes-support/gnutls/{gnutls_3.5.13.bb => gnutls_3.5.16.bb} (61%)
 delete mode 100644 meta/recipes-support/libpcre/libpcre2/libpcre2-CVE-2017-7186.patch
 delete mode 100644 meta/recipes-support/libpcre/libpcre2/libpcre2-CVE-2017-8786.patch
 rename meta/recipes-support/libpcre/{libpcre2_10.23.bb => libpcre2_10.30.bb} (85%)
 rename meta/recipes-support/nspr/{nspr_4.16.bb => nspr_4.17.bb} (96%)
 rename meta/recipes-support/nss/{nss_3.31.1.bb => nss_3.33.bb} (98%)

-- 
2.7.4


