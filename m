Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF3C7570D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 19:41:48 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id d32so68433140qgd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 11:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ao2xDkJErbxC8YpWgSG0OYof0QKNXmm6TitC3GV0BQw=;
	b=lv3FvJb6qlbMfV+UpG1LnR+wC6QTw8gscl96mHu++9a+2tZaUalQWIjftmh0sYbYLq
	xAcA+4VntyJeHdGbKL87+DEleYTwW+If23WUt0wtoBN7awtayl7KDKd7sHHrSBGy5UhL
	bd3G7GUlPZeEU+5+KQ4jjqTGYD2E0uaCPQaWKIICMf0ZUhY9Sq20MMoQDzw4WGZ7dFpi
	8bluUbEVbMH3gcin6fRoXGuP/9uGhr7p6oNKp/jOroc2TDB4nDQGSGgL+UvZOpLVWn1H
	4nwn4ovPzVq7memn55nWTeUpspBENiFx0edrfdogljWE5I2ykL/5S0PTexHS0MKu7Nnm
	hyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ao2xDkJErbxC8YpWgSG0OYof0QKNXmm6TitC3GV0BQw=;
	b=imlivYAhyqTljmK6S/YTTsl3J+HiVr1TcjMLNuyR7oIbm45JEO/Q4jOYt8lGBEjiu6
	UEJyixJY/nGgAMwqbnzVcO4XhRELTnF30nNlbKLwobMpt1MKLRhUmeM8giSC3wBIGttQ
	YUNXLyOjnUGT5CLO0ApHg1x7HVFWB93slaHRGi73qFFFlvTcJkBkYbNev7dQ6YOhajHk
	PaecemHQR2s8vgJgkdmBtIIwnxJTjz1VeKSbzMYVd7N4kWdu47eZtkOOOFZwsGywqoSE
	Uf1lqerDoMqJ6sVCvWiRXwpzLT9TXk1EOMJ5rbwhPnLw/UqJc0MaJvF4obeM3hsZI9l5
	PLog==
X-Gm-Message-State: AD7BkJI70M/voFftssJ2BeS8hbwoV+aA6dJp85lHm79SgAfPB3EK0eOsTb6UO993c5PJjw==
X-Received: by 10.140.104.50 with SMTP id z47mr21833229qge.68.1456774909577;
	Mon, 29 Feb 2016 11:41:49 -0800 (PST)
Received: from eos.sys.comcast.net (a-96-118-179-133.sys.comcast.net.
	[96.118.179.133]) by smtp.gmail.com with ESMTPSA id
	w70sm11542795qge.13.2016.02.29.11.41.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 Feb 2016 11:41:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Feb 2016 19:41:41 +0000
Message-Id: <cover.1456774338.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] Clang inspired fixes
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
X-List-Received-Date: Mon, 29 Feb 2016 19:41:49 -0000

Trying to get OE-Core built using clang came up with
some errors which could be fixed with updating to newer
revision or backporting some of upstreamed patches

Hongxu Jia (1):
  ghostscript: 9.16 -> 9.18

Khem Raj (1):
  strace: Backport fixes for compiling with clang

 ...01-Move-gcc-compat-macros-to-gcc_compat.h.patch | 176 ++++++++++++
 ...1-scm_rights-fd.test-rewrite-without-fork.patch | 198 +++++++++++++
 .../strace/0001-tests-introduce-libtests.patch     | 306 +++++++++++++++++++++
 .../0001-tests-scm_rights.c-use-libtests.patch     |  54 ++++
 meta/recipes-devtools/strace/strace_4.11.bb        |   4 +
 ...Fix-support-for-building-with-no-jbig2-de.patch |  81 ++++++
 ...part-2-fix-support-for-building-with-a-JP.patch |  48 ++++
 .../files/do-not-check-local-libpng-source.patch   |  38 +++
 .../{ghostscript_9.16.bb => ghostscript_9.18.bb}   |  11 +-
 9 files changed, 912 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-Move-gcc-compat-macros-to-gcc_compat.h.patch
 create mode 100644 meta/recipes-devtools/strace/strace/0001-scm_rights-fd.test-rewrite-without-fork.patch
 create mode 100644 meta/recipes-devtools/strace/strace/0001-tests-introduce-libtests.patch
 create mode 100644 meta/recipes-devtools/strace/strace/0001-tests-scm_rights.c-use-libtests.patch
 create mode 100644 meta/recipes-extended/ghostscript/files/0001-Bug-696497-Fix-support-for-building-with-no-jbig2-de.patch
 create mode 100644 meta/recipes-extended/ghostscript/files/0002-Bug-696497-part-2-fix-support-for-building-with-a-JP.patch
 create mode 100644 meta/recipes-extended/ghostscript/files/do-not-check-local-libpng-source.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_9.16.bb => ghostscript_9.18.bb} (87%)

-- 
1.9.1


