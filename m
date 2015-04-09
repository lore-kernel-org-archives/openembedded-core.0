Return-Path: <patrick.ohly@intel.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9D0BA724DC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 09:24:22 +0000 (UTC)
Received: by iedfl3 with SMTP id fl3so108072922ied.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Apr 2015 02:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ML1z8OFvzGsCUmVO8gLIaGzpv6DR5XPcDHeveQ1H6jM=;
	b=M8kQKFnwgJUmQ38V7sWyMvUR75egpDAgP5WxmSdNs+7mz66wzqAjUEtxXm17t4CawP
	CUFVrPUnS1XFfZjM4hzlYxxqOlhC88704CBnvO5eEQ9Bj0Ccp7fMZjBKDWfNzgrIGpiG
	EX7oE5DAYig0GPPZawboHw/qZ3raE0VB7z3LJUOQXKYG0EvZMWOueKyIUZZ9XopvFb8C
	wI6B9VTwRb9X3EjXiYjsuxzCO/epJGJng3gPIfV5P3FkTG7AT9k4/z2pxZJhVvYpSQTf
	YTsgUd6J6q7Rm9kIMF0i3CTgJpsUiPp1dmaQZ8Hhp7314mAMyd0cHSVImGQ00ON2i8B2
	Qbsw==
X-Gm-Message-State: ALoCoQnxFdvMcSWJf4wQMOMFZdxaxFovxlpVzXtIaZbzSUdLV0rZW3Xz94R4MdlQJCiTiD0mztsK
X-Received: by 10.50.43.197 with SMTP id y5mr18447628igl.14.1428571463581;
	Thu, 09 Apr 2015 02:24:23 -0700 (PDT)
Received: from syncev.vlan14.01.org (p5DE8CDA6.dip0.t-ipconnect.de.
	[93.232.205.166])
	by mx.google.com with ESMTPSA id ka2sm8619716igb.2.2015.04.09.02.24.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Apr 2015 02:24:22 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Apr 2015 02:24:14 -0700
Message-Id: <cover.1428571193.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH 0/3] testimage improvements
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
X-List-Received-Date: Thu, 09 Apr 2015 09:24:25 -0000

I recently started using testimage.bbclass with an image using systemd and
found some issues:
- inconsistent output
- systemd tests failing due to missing avahi in image
- tests not run in desired order when using TEST_SUITES="auto"

The following changes since commit 6333186e9764b2c269a2b3869956860fa8fde2b1:

  binutils: Fix packaging now gold is always built (2015-04-08 23:10:57 +0100)

are available in the git repository at:

  git://github.com/pohly/openembedded-core master
  https://github.com/pohly/openembedded-core/tree/master

Patrick Ohly (3):
  oeqa/oetest.py: use bb logging
  oeqa/runtime/systemd.py: skip instead of failing without avahi
  testimage: sort modules based on dependencies

 meta/classes/testimage.bbclass    |  6 +++-
 meta/lib/oeqa/oetest.py           | 61 +++++++++++++++++++++++++++++++++++----
 meta/lib/oeqa/runtime/systemd.py  |  7 +++++
 meta/lib/oeqa/utils/decorators.py |  1 +
 4 files changed, 69 insertions(+), 6 deletions(-)

-- 
1.8.4.5


