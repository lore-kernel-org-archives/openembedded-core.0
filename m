Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 06E967C603
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 02:37:01 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 8so9218193pfr.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 19:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=st/hM4OvCVLYPDBIWbvcf01+uoGcZ7NJUPku8YTgboM=;
	b=HfQq2ZpwH+KCDPu6jlc35kucTQ1HBehOed7s7hFcXvGDrLArKqxVH1QojWrEyvl2q0
	RBl1A1l+2tr02k4Cf3ryfymkfg+16enTyOalemYysxjBbvMCWejYcb1r//0/szBEOZ30
	0mZ9MhyGJIJrLDGVH8WsmO/fabacmiVf6wQGliWRS/UonDEGomRYyKqEWG6gzNnVV4XR
	y9bg1trLTq7Hd4fQpTQnDM2PBiO6cVV9eEuYMX5cGa367IjkG90j5Vu7Gn7E+H9klGY4
	MrjT8ByZz+kWYAguagsFXRgP/W/X5KjOGqq00WpsKbZiQyPXWRksb5/GM2XOWN1NYQrb
	7iNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=st/hM4OvCVLYPDBIWbvcf01+uoGcZ7NJUPku8YTgboM=;
	b=kRjLDtAjDnrlt0w/+vt2upqYqTcvbgcuxZuKXoHe5VFWwly3r0d7ATATyb3YRnFVXt
	DY/I6eW+OWvrkAzj+6MCeGNm9B5NYSaXAmkgbed0/Gg+8+9zVqzJ7soYEUONsZMUeJbf
	TkJJWfhWlIwTCjT8Z6AQTYGRxDNEYZTIA+i3NLYIVSN7adkq618R8GTU5hs+7+WHhWPt
	hgb9+HFWi6sbWOEfUWnb3asW/HLMUsXUdMLLcGUXf3uXLdclHdXy94kYvXjtBsiyM8Fq
	VbZIZ8jSv7XMtiy/DXqXhg6RxHSjsqWCtVn5jQbGnsObFJNMWxL/DJet8zyJ3vxqNu+i
	4Z3w==
X-Gm-Message-State: APjAAAX1+WuxWjYex8uNH7rO9l81vmeK2AMRggfo9r0rO/C3AAod1kGH
	XjXpa0uZL6mjl2btZifX5YpwGWVs
X-Google-Smtp-Source: APXvYqyeLcpHX6IDy1IRubkpflMxPvYLsVnxCvQtyC64v1W9yqt9/8oE72pcb1JQIR+zVF44kCumog==
X-Received: by 2002:a62:b415:: with SMTP id h21mr22192846pfn.26.1552963019960; 
	Mon, 18 Mar 2019 19:36:59 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:97d:e5a7:4938:a8fe])
	by smtp.gmail.com with ESMTPSA id u4sm7756299pgp.59.2019.03.18.19.36.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Mar 2019 19:36:59 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Mar 2019 19:36:29 -0700
Message-Id: <cover.1552962581.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 00/26] thud patch review
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
X-List-Received-Date: Tue, 19 Mar 2019 02:37:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Responses should be made by Wed March 20th 22:00:00 UTC 2019

The following changes since commit f5a57e939e626a5b7c6de5b51799ca602ed355ed:

  mesa: ship /etc/drirc in mesa-megadriver (2019-03-05 22:24:13 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib stable/thud-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=stable/thud-next

Alexander Kanavin (1):
  ca-certificates: upgrade 20180409 -> 20190110

André Draszik (1):
  systemd: RDEPENDS on util-linux-umount

Changqing Li (1):
  libsndfile1: Security fix CVE-2018-19432

Chen Qi (1):
  target-sdk-provides-dummy: add more perl modules to avoid populate_sdk
    failure

Douglas Royds (1):
  libpam: libpamc is licensed under its own BSD-style licence

George McCollister (1):
  systemd: fix CVE-2019-6454

Jonathan Rajotte-Julien (3):
  lttng-ust: update to 2.10.3
  lttng-modules: update to 2.10.9
  lttng-tools: update to 2.9.11

Mark Hatle (10):
  gitsm.py: Fix when a submodule is defined, but not initialized
  gitsm.py: Add support for alternative URL formats from submodule files
  tests/fetch.py: Add alternative gitsm test case
  gitsm.py: Optimize code and attempt to resolve locking issue
  gitsm.py: revise unpack
  gitsm.py: Rework the shallow fetcher and test case
  gitsm.py: Refactor the functions and simplify the class
  gitsm.py: Fix relative URLs
  gitsmy.py: Fix unpack of submodules of submodules
  gitsm: The fetcher did not process some recursive submodules properly.

Ming Liu (1):
  rm_work: sort the value of do_build dependencies

Oleksandr Kravchuk (1):
  target-sdk-provides-dummy: add perl-module-overload

Richard Purdie (3):
  target-sdk-provides-dummy: Extend to -dev and -src packages
  systemd: Update recent CVE patches
  kernel: Ensure an initramfs is added if configured

Robert Yang (1):
  send-error-report: Add --no-ssl to use http protocol

Ross Burton (1):
  libpng: fix CVE-2019-7317

 bitbake/lib/bb/fetch2/gitsm.py                     | 253 +++++++++------------
 bitbake/lib/bb/tests/fetch.py                      |  70 +++++-
 meta/classes/kernel.bbclass                        |   4 +-
 meta/classes/rm_work.bbclass                       |   3 +-
 .../recipes-core/meta/target-sdk-provides-dummy.bb |  14 ++
 ...-not-store-the-iovec-entry-for-process-co.patch |   6 +-
 ...ld-set-a-limit-on-the-number-of-fields-1k.patch |  56 -----
 ...nald-set-a-limit-on-the-number-of-fields.patch} |  93 ++++++--
 ...nal-fix-out-of-bounds-read-CVE-2018-16866.patch |  49 ++++
 .../0027-journal-fix-syslog_parse_identifier.patch |  77 -------
 ...not-remove-multiple-spaces-after-identifi.patch |  84 -------
 .../systemd/systemd/CVE-2019-6454.patch            | 210 +++++++++++++++++
 ...e-receive-an-invalid-dbus-message-ignore-.patch |  61 +++++
 meta/recipes-core/systemd/systemd_239.bb           |  10 +-
 meta/recipes-extended/pam/libpam_1.3.0.bb          |   4 +-
 ...ose-sk-wmem-in-sock_exceed_buf_limit-trac.patch |  67 ------
 ...g-modules_2.10.7.bb => lttng-modules_2.10.9.bb} |   5 +-
 ...ow-multiple-attempts-to-connect-to-relayd.patch |  17 +-
 ...{lttng-tools_2.9.5.bb => lttng-tools_2.9.11.bb} |   4 +-
 .../{lttng-ust_2.10.1.bb => lttng-ust_2.10.3.bb}   |   4 +-
 .../libpng/libpng/CVE-2019-7317.patch              |  20 ++
 meta/recipes-multimedia/libpng/libpng_1.6.36.bb    |   3 +-
 .../libsndfile/libsndfile1/CVE-2018-19432.patch    | 115 ++++++++++
 .../libsndfile/libsndfile1_1.0.28.bb               |   1 +
 ...tes_20180409.bb => ca-certificates_20190110.bb} |   2 +-
 scripts/send-error-report                          |  11 +-
 26 files changed, 758 insertions(+), 485 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0025-journald-set-a-limit-on-the-number-of-fields-1k.patch
 rename meta/recipes-core/systemd/systemd/{0026-journal-remote-set-a-limit-on-the-number-of-fields-i.patch => 0025-journald-set-a-limit-on-the-number-of-fields.patch} (47%)
 create mode 100644 meta/recipes-core/systemd/systemd/0026-journal-fix-out-of-bounds-read-CVE-2018-16866.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0027-journal-fix-syslog_parse_identifier.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0028-journal-do-not-remove-multiple-spaces-after-identifi.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2019-6454.patch
 create mode 100644 meta/recipes-core/systemd/systemd/sd-bus-if-we-receive-an-invalid-dbus-message-ignore-.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-net-expose-sk-wmem-in-sock_exceed_buf_limit-trac.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.10.7.bb => lttng-modules_2.10.9.bb} (85%)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.9.5.bb => lttng-tools_2.9.11.bb} (97%)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.10.1.bb => lttng-ust_2.10.3.bb} (90%)
 create mode 100644 meta/recipes-multimedia/libpng/libpng/CVE-2019-7317.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-19432.patch
 rename meta/recipes-support/ca-certificates/{ca-certificates_20180409.bb => ca-certificates_20190110.bb} (98%)

-- 
2.7.4


