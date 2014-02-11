Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f53.google.com (mail-pb0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 819126E8DE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 03:32:40 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id md12so7115425pbc.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 19:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=QxRrF2xpkjXg5ebvCOo8F8L06NDrLJxEMwppwSkDNL8=;
	b=PLjWdKcxL/B+gageRRsHTP+MnJjUAWDd/i32yOnDvT5bZBRDBkfusNE5MMP3Uv/9P/
	bsejCpIvp4Kv7aO1CZxbBJuBtb9VW/O1rgcXNLw8KTqsyT1smfu65ETMtszbqHnX8Og9
	Pg9Mllk3J71gDXgBeASBBpNra3Iz8qBcC19eAyc0D/gAMMEvQa9dPvdRKqnOxrIitmEj
	r3TORQNRZvr6dVDHFM2JMVNrGwlZEXShLbvgxvydMpWtK3uTrajZGgU/5sNAWjUa18BC
	ousv/4VgC6RarkemTj6yRcK76wRzoCOs32B9dVUSoVmIacJVuTqElE7ECCghWfECrkcA
	m2Tg==
X-Received: by 10.68.34.37 with SMTP id w5mr7640952pbi.159.1392089560763;
	Mon, 10 Feb 2014 19:32:40 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	dr1sm47621883pbc.18.2014.02.10.19.32.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Feb 2014 19:32:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Feb 2014 19:33:08 -0800
Message-Id: <cover.1392089446.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/3] Journald fixes
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
X-List-Received-Date: Tue, 11 Feb 2014 03:32:40 -0000

This patchset does two things. Enables systemd-journald-gatewayd
Fixes journald for various memory leaks and memory allocation problems
as seen under stress and big-endian architectures.

The following changes since commit b5b4898cd409036161c62891e9618d9ab3f891f9:

  python-pycurl: upgrade to 7.19.3 (2014-02-08 21:03:27 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/journald-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/journald-fixes

Khem Raj (3):
  systemd: Fix misc journald memory bugs
  libmicrohttpd: add recipe
  systemd: Enable building microhttpd

 ...ournal-Add-missing-byte-order-conversions.patch |   60 ++++++++++++++
 .../journal-file-protect-against-alloca-0.patch    |   23 ++++++
 ...n-appending-to-journal-file-allocate-larg.patch |   83 ++++++++++++++++++++
 .../systemd/journald-add-missing-error-check.patch |   16 ++++
 .../systemd/journald-fix-minor-memory-leak.patch   |   16 ++++
 meta/recipes-core/systemd/systemd_208.bb           |    7 ++
 .../libmicrohttpd/libmicrohttpd_0.9.33.bb          |   18 +++++
 7 files changed, 223 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/journal-Add-missing-byte-order-conversions.patch
 create mode 100644 meta/recipes-core/systemd/systemd/journal-file-protect-against-alloca-0.patch
 create mode 100644 meta/recipes-core/systemd/systemd/journal-when-appending-to-journal-file-allocate-larg.patch
 create mode 100644 meta/recipes-core/systemd/systemd/journald-add-missing-error-check.patch
 create mode 100644 meta/recipes-core/systemd/systemd/journald-fix-minor-memory-leak.patch
 create mode 100644 meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.33.bb

-- 
1.7.10.4


