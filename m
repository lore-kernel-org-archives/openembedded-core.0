Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 77C8360557
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 15:04:41 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id i32so3084729pgl.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 08:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Hk2YIkjbvElvIovlK/N5DzCAG8m2KCbgHmf9PhyLWFU=;
	b=ItkKFhg/0hkb0nhIG+HW4b3PcDN3FL79iVGp2iYuAebaE+Zdy9xeTpK58VG6i6Hp0M
	KjMSAF3sD8SMW0wemc2oLCzOm9zQMY57MGmjrEszFRXVgy8AkWdbk85r3NT1ZxEugHqr
	wyUhoJG6C06kJV9OkHRvNSirqg7U1I6XAfqo+uC8y2FoPBJLkA3HM3btRDpm39MVIaYN
	YfBkcmO+ZtF57QDcXDyq7wyLt/rUfbgEnPSV8Wu+kuKQ/415OTUUY3UnkzOTs13fKGrK
	4FKTooMoFZDKZk//KsnCb6yxGNySaa89UAUtyxxQaBMoToACRB6HHCCLmHjjjs6ilBzu
	CZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Hk2YIkjbvElvIovlK/N5DzCAG8m2KCbgHmf9PhyLWFU=;
	b=b8NdpKkaXawBzbbJAk9zBqabPQ2Mo8goBIwKcLAGmwQzKwHFD2wVMGOZtqVtT2gf92
	ZtLBkQHiNKsbZG27regDt+Lr5psWqaCkPFFO0I4dF553UEtHpqoG4qppveyRAoFiJbaS
	KfROhRSWi0DI9AFyKy6b7WeKUHQxvWDfdIlLh646AmmsXGEQsb1HvxcLUmAce50wiySg
	kTvPRvlqRwLKkIkDWfChHKvCZmpbbSogQQ1rWQbdy7Zv9twLPldlKo3agF+P2u5IFoft
	LIdeYRInOJGGT1XA4WrlwYpWxev9wtgqWmYJAIWZ1/CuE/vLq7yQK+evcj7n5X+trVnU
	WZPw==
X-Gm-Message-State: APjAAAUmeCnxkTZ3WTFw1z1TinfsCN4LZCjEtYHxznR4dr4Qmneuys+C
	NkLDAhlrwWFcQ90SLXXje0H5e5qEYK0=
X-Google-Smtp-Source: APXvYqxGhEJynXNE7WMpdJdWMCB2KBgoU57abNxZy+Ei8j/U2rrCIQMCTELnrsiBL0B3/TTdFWlpPA==
X-Received: by 2002:a62:18d6:: with SMTP id 205mr40779214pfy.90.1570547082171; 
	Tue, 08 Oct 2019 08:04:42 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:8d14:b7f9:8b16:849f])
	by smtp.gmail.com with ESMTPSA id
	a8sm17675579pfo.118.2019.10.08.08.04.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Oct 2019 08:04:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2019 08:04:27 -0700
Message-Id: <cover.1570546808.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [warrior 00/10] Pull request
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
X-List-Received-Date: Tue, 08 Oct 2019 15:04:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please merge these into warrior mainline

Included 2 additional backport requests.

The following changes since commit acc0f4a6a99fe9367e57a5c2a4f995b6f4db4a9f:

  runqemu: Add support for kvm on aarch64 (2019-10-01 10:48:46 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/warrior-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/warrior-next

Adrian Bunk (1):
  json-c: Don't --enable-rdrand

Alexander Kanavin (1):
  python: update to 3.7.3

Andrii Bordunov via Openembedded-core (1):
  classes/image-live.bbclass: Don't hardcode cpio.gz

Anuj Mittal (1):
  python3: upgrade 3.7.3 -> 3.7.4

Armin Kuster (1):
  qemu: fix build issue on new hosts with glibc 2.30

Dan Tran (2):
  qemu: Fix CVE-2019-8934
  unzip: Fix CVE-2019-13232

Jan Klare (1):
  systemd: update SRCREV for systemd v241-stable

Michael Halstead (1):
  uninative: Update to 2.7 release

Ricardo Ribalda Delgado (1):
  meson: Fix native patch to python3

 meta/classes/image-live.bbclass                    |   2 +-
 meta/conf/distro/include/yocto-uninative.inc       |  10 +-
 meta/recipes-core/systemd/systemd.inc              |   2 +-
 meta/recipes-devtools/json-c/json-c_0.13.1.bb      |   2 -
 .../meson/meson/0003-native_bindir.patch           |   2 +-
 ...ysconfig-append-STAGING_LIBDIR-python-sys.patch |   2 +-
 ...2-distutils-prefix-is-inside-staging-area.patch |   2 +-
 .../python/python3/CVE-2018-20852.patch            | 124 -------
 .../python/python3/CVE-2019-9636.patch             | 154 ---------
 .../python/python3/CVE-2019-9740.patch             | 151 ---------
 .../python/{python3_3.7.2.bb => python3_3.7.4.bb}  |   9 +-
 meta/recipes-devtools/qemu/qemu.inc                |   3 +
 ...nux-user-assume-__NR_gettid-always-exists.patch |  49 +++
 ...rename-gettid-to-sys_gettid-to-avoid-clas.patch |  95 ++++++
 .../recipes-devtools/qemu/qemu/CVE-2019-8934.patch | 215 +++++++++++++
 .../unzip/unzip/CVE-2019-13232_p1.patch            |  33 ++
 .../unzip/unzip/CVE-2019-13232_p2.patch            | 356 +++++++++++++++++++++
 .../unzip/unzip/CVE-2019-13232_p3.patch            | 121 +++++++
 meta/recipes-extended/unzip/unzip_6.0.bb           |   3 +
 19 files changed, 888 insertions(+), 447 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2018-20852.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2019-9636.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2019-9740.patch
 rename meta/recipes-devtools/python/{python3_3.7.2.bb => python3_3.7.4.bb} (97%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-assume-__NR_gettid-always-exists.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-rename-gettid-to-sys_gettid-to-avoid-clas.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-8934.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2019-13232_p1.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2019-13232_p2.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2019-13232_p3.patch

-- 
2.7.4


