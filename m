Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id E423C60017
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2019 01:24:51 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id a22so2609164pgg.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2019 18:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DIeujppwqRSLfDhsk9hp4peKwt+Q7HIRWEQK9/QNuu0=;
	b=VPPulSDGhatMBhearfar30zeopTMhgGIoQtW3kXhZwuZ+I0m+xZP3ZLHXwvmSdzOIF
	dwkL5ZfJjrqh+gdpuVUugPjEB+8B2jH/nh5uxHLJR3JxpAmP2qitfFs0IkCSR+QBRqim
	/oc09McuuY++IfyP1+FBehsN+DzkDLkA+nghGFno/Bw2p64QpRf9SMfQUTz8NPzISbpq
	SIUQWU+aQK/YRvKUN1JSDLhcKzZszKqgOa79undHQNZih1IvBNW+BkeWKT0PdCT5HycX
	NLwUYZ27ShkvavF9VvTw9hr5IAKs/PbHrMkhHCr1zyjqAb0fnonqxT/VN72VQNM2GYz+
	KP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DIeujppwqRSLfDhsk9hp4peKwt+Q7HIRWEQK9/QNuu0=;
	b=pDAS7SpSPHJEMuQTN+QNTcNbyH2xNF4LtaqNV4bUzfeGwG0uH0KqtzFiubh9NseX0K
	zZ7+xrVLOjTWlVkSqUzyrizO6CeEUGO0SdyCoRA771dtqUnseTIsWuaQOVpe4NVO8ERx
	GeJQMhVPmxDrT+IBDEaGeUuPhLOEm8S809PMOtHRLWHpLdLcfBl0Zv4cFe3JiIF3AWdg
	PlN5qGBY6IB82f4smQU4UBMJJ2apAvWrH34j2X0WBii2YutZTBIykKzVe3CuK5WPTjE3
	C/Q8QspHT9ZGTp4I1lYUtQ4oy4lwnbSVBXc6vR0hCt0K3ysAmVWN5w2LQ1ptr0A3iOuD
	UzVQ==
X-Gm-Message-State: APjAAAWqsN8teu7x5/RR3K9kWePVaN0avXHi45qBkDjaeFvl9izDmOFz
	TMFKYGvIOXAA00X3VFKvlPuOsGPZ
X-Google-Smtp-Source: APXvYqwGfqP8S1u9GxkTieGNiHZUDnZ+KAig041Yeu+5VsZ24GOzOwbgpYi4jKS1LP0B9h8mDJMYHA==
X-Received: by 2002:a17:902:bd90:: with SMTP id
	q16mr6420036pls.162.1553304292744; 
	Fri, 22 Mar 2019 18:24:52 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:45a8:35fd:6c1a:9e02])
	by smtp.gmail.com with ESMTPSA id
	184sm11579131pff.149.2019.03.22.18.24.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Mar 2019 18:24:52 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2019 18:24:33 -0700
Message-Id: <cover.1553303619.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 00/16] Thud pull request
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
X-List-Received-Date: Sat, 23 Mar 2019 01:24:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please consider these changes for Thud.

The following changes since commit fbb688ab3eeca1bbfbaaaaffd8c81fd8052bcc68:

  mesa: ship /etc/drirc in mesa-megadriver (2019-03-05 22:24:06 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/thud-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/thud-next

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

 meta/classes/kernel.bbclass                        |   4 +-
 meta/classes/rm_work.bbclass                       |   3 +-
 .../recipes-core/meta/target-sdk-provides-dummy.bb |  14 ++
 ...-not-store-the-iovec-entry-for-process-co.patch |   6 +-
 ...ld-set-a-limit-on-the-number-of-fields-1k.patch |  56 ------
 ...nald-set-a-limit-on-the-number-of-fields.patch} |  93 +++++++--
 ...nal-fix-out-of-bounds-read-CVE-2018-16866.patch |  49 +++++
 .../0027-journal-fix-syslog_parse_identifier.patch |  77 --------
 ...not-remove-multiple-spaces-after-identifi.patch |  84 ---------
 .../systemd/systemd/CVE-2019-6454.patch            | 210 +++++++++++++++++++++
 ...e-receive-an-invalid-dbus-message-ignore-.patch |  61 ++++++
 meta/recipes-core/systemd/systemd_239.bb           |  10 +-
 meta/recipes-extended/pam/libpam_1.3.0.bb          |   4 +-
 ...ose-sk-wmem-in-sock_exceed_buf_limit-trac.patch |  67 -------
 ...g-modules_2.10.7.bb => lttng-modules_2.10.9.bb} |   5 +-
 ...ow-multiple-attempts-to-connect-to-relayd.patch |  17 +-
 ...{lttng-tools_2.9.5.bb => lttng-tools_2.9.11.bb} |   4 +-
 .../{lttng-ust_2.10.1.bb => lttng-ust_2.10.3.bb}   |   4 +-
 .../libpng/libpng/CVE-2019-7317.patch              |  20 ++
 meta/recipes-multimedia/libpng/libpng_1.6.36.bb    |   3 +-
 .../libsndfile/libsndfile1/CVE-2018-19432.patch    | 115 +++++++++++
 .../libsndfile/libsndfile1_1.0.28.bb               |   1 +
 ...tes_20180409.bb => ca-certificates_20190110.bb} |   2 +-
 scripts/send-error-report                          |  11 +-
 24 files changed, 586 insertions(+), 334 deletions(-)
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


