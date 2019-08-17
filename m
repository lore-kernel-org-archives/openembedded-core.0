Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 31AB7747E7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 21:21:45 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id p3so4689689pgb.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 14:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=BUCMV48j96TS/qaPaSD2GUC0wBqhYS+gjPUtL0iL7vg=;
	b=V7SwaLrFGdE9A6I6b7+PbUDBaCHnWqHIvX2Jrak3am65HcdKSGCH5QrLH02DGEYwiQ
	G2QPz5mUr4ODHJFFxff28y+zjE9rtrFSjjlOrz46Sj/tL5BTpNLJfNJKMv6Xx9WTLeLv
	+44cZjMuPWLCPq0xVookwCM47Xb4g6Ee0Z3pBSzZyQeXk8c/CRMBY5uXGJVyylT/vbEJ
	Uhj598TNHGq2hQEBirrSNkMfJDh6keHup/3gh5MP5ADZXm8cao2H/cKk+i5Cc+5owlgy
	pZ9maf4r/90tRkPF90W469kPUC/echp3vkIoC4Nz9aK/KGfX9r97rxloExikE350xNbI
	Bo7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=BUCMV48j96TS/qaPaSD2GUC0wBqhYS+gjPUtL0iL7vg=;
	b=pv/Xw7sgvYwb/owgB8jX621nIL9JyR5It1LTd7nVFBByLhfKyGsLTDARk2k4zjHV+d
	z6QBxMVDCL++cWwh8XPg5FWFkWM/X6tQ1Ja5WJFZ5t2WouUaqLRUAV3/HiIfKPvEWNnS
	HjnyAEWQy8PErB3aZ4n5gl+MnPEtyVl5zcwe9OoPHcU9K3VHwyJ7cTgotojHkWIllJXi
	fhEnjSkJuJ5eqXNhNdhMUHdOXMWcWYctx0RXNoMamL9d1t0iiDHHk8czZukXZNNOCMKg
	k0nrBXkOn+W4k8iNiW2chhSeD0+z7zl4AwKeEghMMUnd8Cu5OFmBQfWpFiwmjHXl10vm
	2dww==
X-Gm-Message-State: APjAAAVNNCGtySiaMSogNZvkk1OxV5JyC+vo7ZQsrNd2wrZMtRwDlzqs
	9z6YwMuh2GI231qYk9KVwro1HGEl
X-Google-Smtp-Source: APXvYqx9q9qSh01xpT2Vku0dqJR6LfaEMhOuhrvKin41OUxfsOBRQH7DvuMO6/dM9VKa5z25lAD6bw==
X-Received: by 2002:a63:784c:: with SMTP id t73mr13849853pgc.268.1566076905970;
	Sat, 17 Aug 2019 14:21:45 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:29d8:851b:cd27:3ce0])
	by smtp.gmail.com with ESMTPSA id a20sm7261804pjo.0.2019.08.17.14.21.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 17 Aug 2019 14:21:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Aug 2019 14:21:33 -0700
Message-Id: <cover.1566076780.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud-next][ 0/8] Thud-next patch review
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
X-List-Received-Date: Sat, 17 Aug 2019 21:21:45 -0000

Please have comments back by Monday.


The following changes since commit d3d3f443039b03f1200a14bfe99f985592632018:

  build-appliance-image: Update to thud head revision (2019-08-01 11:58:11 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/thud-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/thud-next

Alexander Kanavin (1):
  buildhistory: call a dependency parser only on actual dependency lists

Andrii Bordunov via Openembedded-core (4):
  curl: fix CVE-2018-16890 CVE-2019-3822 CVE-2019-3823
  dbus: fix CVE-2019-12749
  glib-2.0: fix CVE-2019-13012
  libcomps: fix CVE-2019-3817

Anuj Mittal (2):
  patch: fix CVE-2019-13636
  python3: fix CVE-2019-9740

Bartosz Golaszewski (1):
  qemu: add a patch fixing the native build on newer kernels

 meta/lib/oe/buildhistory_analysis.py               |   2 +-
 meta/recipes-core/dbus/dbus/CVE-2019-12749.patch   | 127 ++++++++
 meta/recipes-core/dbus/dbus_1.12.10.bb             |   1 +
 .../glib-2.0/glib-2.0/CVE-2019-13012.patch         |  47 +++
 meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb      |   1 +
 .../libcomps/libcomps/CVE-2019-3817.patch          |  97 ++++++
 meta/recipes-devtools/libcomps/libcomps_git.bb     |   1 +
 .../patch/patch/CVE-2019-13636.patch               | 113 +++++++
 meta/recipes-devtools/patch/patch_2.7.6.bb         |   1 +
 .../python/python3/CVE-2019-9740.patch             | 155 ++++++++++
 meta/recipes-devtools/python/python3_3.5.6.bb      |   1 +
 ...error-messages-when-qemi_cpu_kick_thread-.patch |  19 +-
 ...fix-to-handle-variably-sized-SIOCGSTAMP-w.patch | 336 +++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_3.0.0.bb           |   1 +
 .../recipes-support/curl/curl/CVE-2018-16890.patch |  50 +++
 meta/recipes-support/curl/curl/CVE-2019-3822.patch |  47 +++
 meta/recipes-support/curl/curl/CVE-2019-3823.patch |  55 ++++
 meta/recipes-support/curl/curl_7.61.0.bb           |   3 +
 18 files changed, 1046 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-core/dbus/dbus/CVE-2019-12749.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-13012.patch
 create mode 100644 meta/recipes-devtools/libcomps/libcomps/CVE-2019-3817.patch
 create mode 100644 meta/recipes-devtools/patch/patch/CVE-2019-13636.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2019-9740.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2018-16890.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2019-3822.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2019-3823.patch

-- 
2.7.4


