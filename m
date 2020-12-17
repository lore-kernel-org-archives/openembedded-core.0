Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.2474.1608173537016031126
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 18:52:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=J4SQH9n9;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 679A920B717A; Wed, 16 Dec 2020 18:52:16 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 679A920B717A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1608173536;
	bh=OD8n+23QrsmuLi123OeWdvEjtSdx9C7z9jwry/6L99E=;
	h=From:To:Cc:Subject:Date:From;
	b=J4SQH9n91OUo/8ng4/ppd6BT2W8ArW/3mAuqkOs/TpJn8jYDLxT3A5t9Kdpa5IYzT
	 slritOnCDN5RB6aN46WIb5sw6HaLsi+QX7hIzyaw4HO+YKzRkcYnGehUweufY8SFeE
	 vhbc56vvqrYfIxpteZT6MKCRy5VS3nM4AUaXD990=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Usama Arif <usama.arif@arm.com>
Subject: [PATCH 0/8] kernel-fitimage extensions
Date: Wed, 16 Dec 2020 18:51:34 -0800
Message-Id: <cover.1608173226.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1

Some minor extensions to the kernel-fitimage class, mostly for signing,
with associated oe-selftest tests. 

(Separate docs patch is queued and will follow once these changes are
pass review).


The following changes since commit 6012fffa99b600956ea1076d60e050d0737b4c4f:

  systemd: Fix reallocarray check (2020-12-16 19:44:45 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/fitimage
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/fitimage

Easwar Hariharan (1):
  classes/kernel-fitimage: make fitimage_emit_section_config more
    readable

Luca Boccassi (1):
  classes/kernel-fitimage: add ability to sign individual images

Paul Eggleton (6):
  classes/kernel-fitimage: add variable for description
  classes/kernel-fitimage: allow substituting mkimage command
  classes/kernel-fitimage: add ability to add additional signing options
  oe-selftest: move FIT image tests to their own module
  oe-selftest: fitimage: Test for FIT_DESC
  oe-selftest: fitimage: add test for signing FIT images

 meta-selftest/classes/test-mkimage-wrapper.bbclass |  19 ++
 meta/classes/kernel-fitimage.bbclass               | 114 +++++++---
 meta/lib/oeqa/selftest/cases/fitimage.py           | 233 +++++++++++++++++++++
 meta/lib/oeqa/selftest/cases/imagefeatures.py      |  74 -------
 4 files changed, 339 insertions(+), 101 deletions(-)
 create mode 100644 meta-selftest/classes/test-mkimage-wrapper.bbclass
 create mode 100644 meta/lib/oeqa/selftest/cases/fitimage.py

-- 
1.8.3.1

