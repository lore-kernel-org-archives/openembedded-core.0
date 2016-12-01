Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5C38A71B19
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 16:36:41 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id i88so46793524pfk.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2016 08:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:references:to:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=DVkZyS2ufxuO8K0MZHWjjsjFuINEu0DMkoZgEumPaEc=;
	b=0We/Rtmo4PLP/2KcB4GFxpN/8MoNmFBrEFqzXRXfN2u1ttxYWdYvhjTDLta5LBwX30
	RJMJwJ/h4TxZYpHSwamWVlgnkGpBPo35QH/+PUT+J3fWdXwMMXeGjKxAy5mIZmo6CJLc
	XD+s3i499TBX+bfy629iGBTmkm0/jajxjtMyCR2YTZUhBep/dHrWVU+d4Ar64GRk8E0+
	nRt7GhZ5a5dPjBCbnbJDbyWuLyvkEUED7OfWBzDTmQYQmYiosfiMproHC8AvwZKb4Zz0
	zXAM0vRDjvflNYG+/CuyUZGEPRhHrX7EfUgmgVh3cFtdVUgtwL+Fv5OtTNXVYvF8VQCU
	iqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:references:to:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=DVkZyS2ufxuO8K0MZHWjjsjFuINEu0DMkoZgEumPaEc=;
	b=gCCV10+z9hJXu3x/dLGRaIyiE5Gk1RxYzXB6ERTnyAhoAQF4BLXfTnoLvzSbnMAAs7
	K0giSxbUInUFWgQgQdu9RPnh4PZXph3UKSdbuTuzmOkck57l3KQbnHzwHRsONFeg2nJ1
	DBfxhs4ThJiSs+/e+4qveSwCV7LEJ7BBG0MlIU+QWYj/UmoxXfJVy6VswB9+CGf2iJ8j
	RNEg60ccSwL3P+ViGtLHjWVAx4AdIZFCVCFarTXtXnQp66DsqBaQqGBFMHf+TLa1DZuq
	cAzg9gH0nDUpE4LQD3o6kbIEWZfMzFyqhLITUkbsFoc4CgqJ2I+zjWoD0+NTP2lKRpiN
	Zu1Q==
X-Gm-Message-State: AKaTC016hA84fB3caSm9zFXAp4r69HrTCjhFX6f95bYMuz7DmsKNzfRxO6mmCr/9clgXMg==
X-Received: by 10.99.67.7 with SMTP id q7mr70379614pga.45.1480610203397;
	Thu, 01 Dec 2016 08:36:43 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:4575:d94e:4fdf:d5ef?
	([2601:202:4001:9ea0:4575:d94e:4fdf:d5ef])
	by smtp.googlemail.com with ESMTPSA id
	y200sm1476876pfb.16.2016.12.01.08.36.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Dec 2016 08:36:42 -0800 (PST)
References: <cover.1480439158.git.akuster@mvista.com>
To: OE-core <openembedded-core@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
X-Forwarded-Message-Id: <cover.1480439158.git.akuster@mvista.com>
Message-ID: <c9cec9c4-846d-01cc-111f-07ccbae51cbe@gmail.com>
Date: Thu, 1 Dec 2016 08:36:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <cover.1480439158.git.akuster@mvista.com>
Subject: [PATCH 00/27] Morty-next pull request cover letter only
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
X-List-Received-Date: Thu, 01 Dec 2016 16:36:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit


resending. looks like this did not hit the list. I think its do to my
corporate email not registered.

- armin

-------- Forwarded Message --------
Subject: [PATCH 00/27] Morty-next pull request cover letter only
Date: Tue, 29 Nov 2016 09:08:18 -0800
From: Armin Kuster <akuster@mvista.com>
To: akuster808@gmail.com, openembedded-core@lists.openembedded.org

Please consider these changes for Morty. Built clean in AB.

The following changes since commit 73454473d7c286c41ee697f74052fed03c79f9f5:

  bitbake: toaster: settings set ALLOWED_HOSTS to * in debug mode
(2016-11-16 11:38:51 +0000)

are available in the git repository at:

  http://git.yoctoproject.org/git/poky-contrib akuster/morty-next

http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/morty-next

André Draszik (2):
  cve-check.bbclass: CVE-2014-2524 / readline v5.2
  openssl: fix bashism in c_rehash shell script

Armin Kuster (2):
  tzcode: update to 2016i
  tzdata: update to 2016i

Daniel Díaz (1):
  weston: Add no-input-device patch to 1.11.0.

Ed Bartosh (1):
  systemd-bootdisk.wks: use PARTUUID

Kai Kang (3):
  openssh: fix CVE-2016-8858
  qemu: fix CVE-2016-7909
  qemu: update run-ptest script

Khem Raj (2):
  libbsd: Fix build with musl
  cmake.bbclass: Set CXXFLAGS and CFLAGS

Koen Kooi (1):
  libbsd 0.8.3: BBCLASSEXTEND to native and nativesdk

Li Zhou (1):
  db: disable the ARM assembler mutex code

Maciej Borzecki (3):
  wic: make sure that partition size is always an integer in internal
    processing
  wic: check that filesystem is specified for a rootfs partition
  wic: fix function comment typos

Robert Yang (1):
  qemuarm64.conf: make runqemu's graphics work

Ross Burton (5):
  Revert "libwnck3: remove the recipe"
  Revert "epiphany: remove unnecessary libwnck3 dependency"
  lib/oe/qa: handle binaries with segments outside the first 4kb
  systemtap: remove explicit msgfmt check
  systemtap: fix native linking on recent Ubuntu

T.O. Radzy Radzykewycz (1):
  OpenSSL: CVE-2004-2761 replace MD5 hash algorithm

Yi Zhao (3):
  openssl: Security fix CVE-2016-7055
  nfs-utils: fix protocol minor version fall-back
  tiff: Security fix CVE-2016-3632

Zhixiong Chi (1):
  tiff: Security fix CVE-2016-3658

 meta/classes/cmake.bbclass                         |   2 +
 meta/classes/cve-check.bbclass                     |   2 +-
 meta/conf/machine/qemuarm64.conf                   |   2 +-
 meta/lib/oe/qa.py                                  |  82 ++---
 .../fix-protocol-minor-version-fall-back.patch     |  55 ++++
 .../nfs-utils/nfs-utils_1.3.3.bb                   |   1 +
 .../openssh/openssh/fix-CVE-2016-8858.patch        |  39 +++
 meta/recipes-connectivity/openssh/openssh_7.3p1.bb |   1 +
 .../openssl/openssl/CVE-2016-7055.patch            |  43 +++
 .../Use-SHA256-not-MD5-as-default-digest.patch     |  69 ++++
 .../openssl/openssl/openssl-c_rehash.sh            |   2 +-
 .../recipes-connectivity/openssl/openssl_1.0.2j.bb |   1 +
 .../qemu/qemu/0004-fix-CVE-2016-7909.patch         |  42 +++
 meta/recipes-devtools/qemu/qemu/run-ptest          |   8 +-
 meta/recipes-devtools/qemu/qemu_2.7.0.bb           |   1 +
 ...code-native_2016h.bb => tzcode-native_2016i.bb} |   8 +-
 .../tzdata/{tzdata_2016h.bb => tzdata_2016i.bb}    |   4 +-
 meta/recipes-gnome/epiphany/epiphany_3.20.3.bb     |   4 +-
 meta/recipes-gnome/libwnck/libwnck3_3.20.1.bb      |  19 ++
 ...on-1.11-config-option-for-no-input-device.patch | 123 +++++++
 meta/recipes-graphics/wayland/weston_1.11.0.bb     |   1 +
 .../systemtap/systemtap/fix-monitor-linking.patch  |  41 +++
 .../systemtap/systemtap/no-msgfmt-check.patch      |  15 +
 meta/recipes-kernel/systemtap/systemtap_git.inc    |   2 +
 .../libtiff/files/CVE-2016-3632.patch              |  34 ++
 .../libtiff/files/CVE-2016-3658.patch              | 111 +++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |   2 +
 meta/recipes-support/db/db_6.0.35.bb               |   9 -
 ...001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch | 363
+++++++++++++++++++++
 .../libbsd/libbsd/0002-Remove-funopen.patch        |  55 ++++
 ...3-Fix-build-breaks-due-to-missing-a.out.h.patch | 130 ++++++++
 meta/recipes-support/libbsd/libbsd_0.8.3.bb        |   7 +
 scripts/lib/wic/canned-wks/systemd-bootdisk.wks    |   2 +-
 scripts/lib/wic/partition.py                       |  16 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py      |   2 +-
 scripts/lib/wic/plugins/source/rawcopy.py          |   4 +-
 scripts/lib/wic/utils/partitionedfs.py             |   4 +-
 37 files changed, 1234 insertions(+), 72 deletions(-)
 create mode 100644
meta/recipes-connectivity/nfs-utils/nfs-utils/fix-protocol-minor-version-fall-back.patch
 create mode 100644
meta/recipes-connectivity/openssh/openssh/fix-CVE-2016-8858.patch
 create mode 100644
meta/recipes-connectivity/openssl/openssl/CVE-2016-7055.patch
 create mode 100644
meta/recipes-connectivity/openssl/openssl/Use-SHA256-not-MD5-as-default-digest.patch
 create mode 100644
meta/recipes-devtools/qemu/qemu/0004-fix-CVE-2016-7909.patch
 rename meta/recipes-extended/tzcode/{tzcode-native_2016h.bb =>
tzcode-native_2016i.bb} (69%)
 rename meta/recipes-extended/tzdata/{tzdata_2016h.bb =>
tzdata_2016i.bb} (98%)
 create mode 100644 meta/recipes-gnome/libwnck/libwnck3_3.20.1.bb
 create mode 100644
meta/recipes-graphics/wayland/weston/weston-1.11-config-option-for-no-input-device.patch
 create mode 100644
meta/recipes-kernel/systemtap/systemtap/fix-monitor-linking.patch
 create mode 100644
meta/recipes-kernel/systemtap/systemtap/no-msgfmt-check.patch
 create mode 100644
meta/recipes-multimedia/libtiff/files/CVE-2016-3632.patch
 create mode 100644
meta/recipes-multimedia/libtiff/files/CVE-2016-3658.patch
 create mode 100644
meta/recipes-support/libbsd/libbsd/0001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch
 create mode 100644
meta/recipes-support/libbsd/libbsd/0002-Remove-funopen.patch
 create mode 100644
meta/recipes-support/libbsd/libbsd/0003-Fix-build-breaks-due-to-missing-a.out.h.patch

-- 
2.7.4


