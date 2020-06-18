Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.238.1592452451759337020
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 20:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=FWSiocVT;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 1165D207562B; Wed, 17 Jun 2020 20:54:11 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1165D207562B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1592452451;
	bh=x8t/TlCQfIam/uPaGJkop3k8tmBwaa2YLwawnG8PiXE=;
	h=From:To:Subject:Date:From;
	b=FWSiocVTib8e3GNO6ACVugVroFe9dTrxBZjraU3YKHkrYxYwReEpDGc7diGbawTHK
	 kq5L0SC3JQXB0w9g2APhMSz9ANRgFUZN2tzB73lqaWAMOkBZyNVOwnKPgq1FM40jQh
	 6jFGy+7z0asVKnc5WQI6VR6b6yO88QclkSJbfmzY=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] Misc fixes
Date: Wed, 17 Jun 2020 20:54:01 -0700
Message-Id: <cover.1592452323.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1

Reinstate a patch for dpkg-native that was removed some time ago,
plus fix a couple of trivial things I noticed at the same time.


The following changes since commit 878a8561e10017bb91ea42bbbe6d4acfc0985482:

  gstreamer1.0-plugins-bad: add support for vdpau (2020-06-17 16:31:48 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/fixes
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/fixes

Paul Eggleton (3):
  dpkg-native: rebase and reinstate fix for "tar: file changed as we read it"
  shadow-sysroot: drop unused SRC_URI checksums
  devtool: fix typo

 ...01-build.c-ignore-return-of-1-from-tar-cf.patch | 52 ++++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.20.0.bb          |  2 +
 meta/recipes-extended/shadow/shadow-sysroot_4.6.bb |  3 --
 scripts/lib/devtool/deploy.py                      |  4 +-
 4 files changed, 56 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch

-- 
1.8.3.1

