Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5914860DD7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Oct 2014 11:50:09 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id hi2so3578169wib.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Oct 2014 04:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=BU4axELvlHRm3WgsxPqbUU8DrmaCMb4DEgh+77giJAs=;
	b=i1mMGPZAADFEIy+dNZIBvGquwLP8UwC8wGoyCXeqUrC1WdyOmnu9cIL91Q0l8FVS/w
	KFQZcljtJQYYuLYGUSfLjO+WRjbGapY6Gb2F9FVm751TgaxxjYgFudvQpIrLSoxKgfKU
	MJK41NoXpnQTORePXa2MjcFkYwBD4R90LcVzO4SqBbRAqALPspg5170FBOflNMOTMHqQ
	MMPdoYavOyfRl8yDOenMFEjwB86/BNh3F62C0Yo1mJ4+P3YBdJdxc7n8mtDxaw9T7sZB
	gIlUc2jIz72Kcqv4j94q/X7Bk68eQgWpHDQ8MK6ghAj3kkVLhMavcRE9u0j5tdlYkg5a
	gBjg==
X-Gm-Message-State: ALoCoQne1QvUcu4hmcGaBAXoNc0u2vVZ2l7xV2yfmnKXujZdl0CKA1zrPKT7HrvsS05GZ+t0hNjL
X-Received: by 10.194.58.205 with SMTP id t13mr9377546wjq.55.1413546610150;
	Fri, 17 Oct 2014 04:50:10 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id wl1sm1434681wjb.4.2014.10.17.04.50.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Oct 2014 04:50:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Oct 2014 12:50:02 +0100
Message-Id: <cover.1413544461.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 00/13] Dizzy c-pull
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
X-List-Received-Date: Fri, 17 Oct 2014 11:50:14 -0000

Hi,

Thanks to the POODLE attack there's a slew of CVEs, so we integrated the new
libssl release.  As we're going to run another RC, merge some other security or
low-impact patches too.

Ross

The following changes since commit ccf5a4d2342c4fd40e4e0b332ea7e34e0bf175d4:

  build-appliance-image: Update to dizzy head revision (2014-10-11 08:11:17 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/mut

for you to fetch changes up to 723a5dc4f839767d35ed9148433c10ec1ad0abe4:

  gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0869 (2014-10-16 22:23:44 +0100)

----------------------------------------------------------------
Hongxu Jia (2):
      wic/bootimg-pcbios.py: checking the existance of syslinux
      file: add wrapper to nativesdk-file

Kai Kang (3):
      gnupg: CVE-2013-4242
      readline: Security Advisory - readline - CVE-2014-2524
      gnupg_1.4.7: add package config libusb

Paul Eggleton (2):
      python: force off_t size to 8 to enable large file support
      openssh: avoid screen sessions being killed on disconnect with systemd

Peter Urbanec (1):
      sstate.bbclass: Fix up white space lost in last commit.

Ross Burton (1):
      openssl: upgrade to 1.0.1j

Wenlin Kang (1):
      mtools: fix broken /usr/bin/lz

Wenzong Fan (1):
      sstate.bbclass: specify func dirs for sstate_hardcode_path

Yue Tao (2):
      gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-4358
      gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0869

 meta/classes/sstate.bbclass                        |   45 +++---
 .../openssh/openssh/sshd@.service                  |    1 +
 .../{openssl_1.0.1i.bb => openssl_1.0.1j.bb}       |    4 +-
 .../readline/readline-6.3/readline63-003           |   43 ++++++
 meta/recipes-core/readline/readline_6.3.bb         |    2 +
 meta/recipes-devtools/file/file_5.18.bb            |    5 +
 .../mtools/mtools/fix-broken-lz.patch              |   23 ++++
 meta/recipes-devtools/mtools/mtools_3.9.9.bb       |    4 +-
 meta/recipes-devtools/python/python_2.7.3.bb       |    3 +
 ...t-parameters-from-SPS-whenever-it-changes.patch |  145 ++++++++++++++++++++
 ...rror-concealment-when-SPS-and-slices-are-.patch |   33 +++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    2 +
 .../gnupg/gnupg-1.4.7/CVE-2013-4242.patch          |   62 +++++++++
 meta/recipes-support/gnupg/gnupg_1.4.7.bb          |    2 +
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |   11 +-
 15 files changed, 361 insertions(+), 24 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.1i.bb => openssl_1.0.1j.bb} (92%)
 create mode 100644 meta/recipes-core/readline/readline-6.3/readline63-003
 create mode 100644 meta/recipes-devtools/mtools/mtools/fix-broken-lz.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264-set-parameters-from-SPS-whenever-it-changes.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264-skip-error-concealment-when-SPS-and-slices-are-.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4242.patch

Hongxu Jia (2):
  wic/bootimg-pcbios.py: checking the existance of syslinux
  file: add wrapper to nativesdk-file

Kai Kang (3):
  gnupg: CVE-2013-4242
  readline: Security Advisory - readline - CVE-2014-2524
  gnupg_1.4.7: add package config libusb

Paul Eggleton (2):
  python: force off_t size to 8 to enable large file support
  openssh: avoid screen sessions being killed on disconnect with
    systemd

Peter Urbanec (1):
  sstate.bbclass: Fix up white space lost in last commit.

Ross Burton (1):
  openssl: upgrade to 1.0.1j

Wenlin Kang (1):
  mtools: fix broken /usr/bin/lz

Wenzong Fan (1):
  sstate.bbclass: specify func dirs for sstate_hardcode_path

Yue Tao (2):
  gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-4358
  gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0869

 meta/classes/sstate.bbclass                        |   45 +++---
 .../openssh/openssh/sshd@.service                  |    1 +
 .../{openssl_1.0.1i.bb => openssl_1.0.1j.bb}       |    4 +-
 .../readline/readline-6.3/readline63-003           |   43 ++++++
 meta/recipes-core/readline/readline_6.3.bb         |    2 +
 meta/recipes-devtools/file/file_5.18.bb            |    5 +
 .../mtools/mtools/fix-broken-lz.patch              |   23 ++++
 meta/recipes-devtools/mtools/mtools_3.9.9.bb       |    4 +-
 meta/recipes-devtools/python/python_2.7.3.bb       |    3 +
 ...t-parameters-from-SPS-whenever-it-changes.patch |  145 ++++++++++++++++++++
 ...rror-concealment-when-SPS-and-slices-are-.patch |   33 +++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    2 +
 .../gnupg/gnupg-1.4.7/CVE-2013-4242.patch          |   62 +++++++++
 meta/recipes-support/gnupg/gnupg_1.4.7.bb          |    2 +
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |   11 +-
 15 files changed, 361 insertions(+), 24 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.1i.bb => openssl_1.0.1j.bb} (92%)
 create mode 100644 meta/recipes-core/readline/readline-6.3/readline63-003
 create mode 100644 meta/recipes-devtools/mtools/mtools/fix-broken-lz.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264-set-parameters-from-SPS-whenever-it-changes.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264-skip-error-concealment-when-SPS-and-slices-are-.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4242.patch

-- 
1.7.10.4


