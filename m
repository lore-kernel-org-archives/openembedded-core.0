Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SrBP9-0003LX-P4
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 19:17:47 +0200
Received: by bkcik5 with SMTP id ik5so511967bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 10:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=H9XdlEISaX7XnGDEjljWDgh2ozF518OcP+9waX2iQ6k=;
	b=IRbBFpByHGINq7pYLueglsi7HH/c6XnqfRG0dcb/NwVKsy70TCbIUAkUxZZ2jzs+Mr
	OmUoTWTYuUfEml/a7bhVigvSLzE4T/wxj4ad8+1leET4nxv3DQIyM/CmybJitWIU8Ywl
	7K3NKZ4BjGAYNh47tCXC7aJODxLzwodk3W07kFqqkGrTVu6TtPHlUrVu/8aITxp1IQqj
	FYToS3MGhXCImoJBXl1cnupz8vLT4ceCRPw3LKFMt5uZa8Fp7qHHEhTqPRGBG2XwX3pE
	prHJ6CMHAvfsiygyBY2EGLcGDi/3GEZi3c1iKfGzmHqg7iDjtk9/ZEL03f56UZUwDNlC
	WiGA==
Received: by 10.204.156.17 with SMTP id u17mr1771011bkw.52.1342544788097;
	Tue, 17 Jul 2012 10:06:28 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id fu8sm10438696bkc.5.2012.07.17.10.06.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 10:06:27 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 20:06:20 +0300
Message-Id: <cover.1342544558.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQk8v0uI+SZRujwsJ7MV7qN2PK3wt2OoU3E8D6BYDeXD7ObiYcHVEIftiLLiGKLjumSJHmDb
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [PATCH V4 0/4] Update connman to v1.3, fix dependencies and runtime
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
X-List-Received-Date: Tue, 17 Jul 2012 17:17:47 -0000

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
 ...ck-that-the-string-isn-t-empty-before-spl.patch |   37 +++++++++++++
 ...If-there-is-no-d_type-support-use-fstatat.patch |   57 ++++++++++++++++++++
 ...If-there-is-no-d_type-support-use-fstatat.patch |   45 ++++++++++++++++
 .../connman/{connman_1.0.bb => connman_1.3.bb}     |   11 ++--
 5 files changed, 148 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-storage-check-that-the-string-isn-t-empty-before-spl.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch
 rename meta/recipes-connectivity/connman/{connman_1.0.bb => connman_1.3.bb} (41%)

-- 
1.7.9.5



