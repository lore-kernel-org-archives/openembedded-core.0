Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SrUEJ-0003x6-G3
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 15:23:51 +0200
Received: by bkcik5 with SMTP id ik5so1115574bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 06:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=G4qy3l+Cs/OvVQr5i5himchr0pdztfKoKLs0CVM2vWc=;
	b=lwO2W/C6W43zPKzoV3TVrJeo4ppExu+hkkn9WX53IFrD2rUJYAFThEo/ZVE2mCQV/d
	HyHYhbPZv67t//da+QCmrD7SzkAVJiB/ghrtK6q+Zaa9KBwOoWMkDtHIy7g9ykaxlqVH
	pE0pjvnc6VVHjHTK91wCQo7fG4pDD2CjUsMGRH5uPd+rOVO2ZjYPOTby8i5F/zwf5+2G
	d/BzobhGVyGIJ4Au5aRkw68rZ1Jio5MJDGLxkMPWaOfroH9aXEbPj+l/68Glm584n+wW
	7KdKHWQ3lEJ3YfjHyqLrXmIUyj8inlpirlpsmrvHcU1MWk7cdlAaZtpqO59fiw9/99JQ
	ydpQ==
Received: by 10.205.123.8 with SMTP id gi8mr1518960bkc.92.1342617150769;
	Wed, 18 Jul 2012 06:12:30 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id g6sm11855333bkg.2.2012.07.18.06.12.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 06:12:28 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2012 16:12:19 +0300
Message-Id: <cover.1342616605.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQkAhK0LodNZ0jGl/WEXVFvFpi0Ro8pyiQEqFvOzhgRMPMzi9n6uWvr++UD8pscZRWJek5RW
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [PATCH V5 0/4] Modified the references to stat function in the patch's comments (only cover)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jul 2012 13:23:51 -0000

Changes from V4:
Added SoB and Upstream-Status to patches.
Modified the references to "stat" function in the patch's comments.
Modified Ross's patch name in SRC_URI.

Changes from V3: Messed up my patches. As well, added Ross Burton's patch:
[OE-core] [PATCH 2/2] connman: fix crashes on startup on PPC/MIPS

Update connman to v1.3.
Fix dependencies needed for tests.
Add patches to fix runtime segfault on mips and ppc architecture.

Machine tested: qemux86 / qemumips

Tests done on connman-gnome
        OnlineMode / OfflineMode
        Enable / Disable Wired Networks
        Set manual IP configuration

Tests on connman v.1.3
        addr-test
        iptables-test
        polkit-test
        get-global-timeservers
        get-proxy-autoconfig
        get-services
        get-state
        list-services
        show-introspection
        test-clock
        test-connman
        test-counter
        test-manager
        test-session

The following changes since commit 90ad663909c0c8a405b22a510c9f957007d02669:

  upstream_tracking: update boost (2012-07-09 17:21:38 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ag/connman1.3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/connman1.3

Andrei Gherzan (3):
  connman: Update to version 1.3
  connman.inc: Add missing dependencies needed by some tests
  connman: Add patches to fix connman on fs with no d_type support

Ross Burton (1):
  connman: fix crashes on startup on PPC/MIPS

 meta/recipes-connectivity/connman/connman.inc      |    4 +-
 ...ck-that-the-string-isn-t-empty-before-spl.patch |   37 ++++++++++++
 ...If-there-is-no-d_type-support-use-fstatat.patch |   61 ++++++++++++++++++++
 ...If-there-is-no-d_type-support-use-fstatat.patch |   49 ++++++++++++++++
 .../connman/{connman_1.0.bb => connman_1.3.bb}     |   11 ++--
 5 files changed, 156 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-storage-check-that-the-string-isn-t-empty-before-spl.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch
 rename meta/recipes-connectivity/connman/{connman_1.0.bb => connman_1.3.bb} (40%)

-- 
1.7.9.5



