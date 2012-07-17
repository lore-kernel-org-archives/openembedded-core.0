Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SrAgA-00021K-Ag
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 18:31:18 +0200
Received: by bkcik5 with SMTP id ik5so466300bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 09:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=F8jIbZh5cZMK2DRw81HJu7nSMsejVP2FVyN99UV/2vY=;
	b=CAG8Yk9HdQwBqjrqyPFUVtsxzy3+3RBAhI4U/0KsgUPTAnvX+3aOdQegRSEfl784Sw
	b5d/EoB1KqDHPg8gncY95653Y98lp7B+fIOCepEuciQKJqLTyfS3laU/v0EnB4HcIZNp
	v5hBX0lnd0hLepiBLOxMEUtijeqctz0A5WoPpZVNwtVryoYA4nR2dwuydLXcYG9OSf+2
	ubat3gVu92lSWSfgymoua9M3guHYqT9LeJw15tKWe4xWiNr0PteEVM3jbaRoTVc9m5Nb
	kG/fxhebTdy0tbIgNYR+cwcj2YcHfqpZByz5wDJaBGzHxyVrS+cO1hXwfPrurAk34jI+
	LC7A==
Received: by 10.205.126.14 with SMTP id gu14mr1674811bkc.137.1342541998677;
	Tue, 17 Jul 2012 09:19:58 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id n5sm5711378bkv.14.2012.07.17.09.19.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 09:19:57 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 19:19:50 +0300
Message-Id: <cover.1342541736.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQkc2PPvXzLDXMCM9OQe9ndD8UFch8jHlR3xgmBn7EsWypYoV8jAUFxjGbN/gYI5gQG87e5e
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [PATCH V3 0/3] Minor typos in commit and patches messages
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
X-List-Received-Date: Tue, 17 Jul 2012 16:31:18 -0000

Changes from V2: minor typos in messages for commits and patches.

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

 meta/recipes-connectivity/connman/connman.inc      |    4 +-
 ....c-If-there-is-no-d_type-support-use-stat.patch |   42 ++++++
 ....c-If-there-is-no-d_type-support-use-stat.patch |   56 ++++++++
 .../connman/{connman_1.0.bb => connman_1.3.bb}     |   10 +-
 pull-5566/0000-cover-letter.patch                  |   60 ++++++++
 pull-5566/0001-connman-Update-to-version-1.3.patch |   34 +++++
 ...-Add-missing-dependencies-needed-by-some-.patch |   44 ++++++
 ...-patches-to-fix-connman-on-fs-with-no-d_t.patch |  152 ++++++++++++++++++++
 8 files changed, 396 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-storage.c-If-there-is-no-d_type-support-use-stat.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0002-timezone.c-If-there-is-no-d_type-support-use-stat.patch
 rename meta/recipes-connectivity/connman/{connman_1.0.bb => connman_1.3.bb} (47%)
 create mode 100644 pull-5566/0000-cover-letter.patch
 create mode 100644 pull-5566/0001-connman-Update-to-version-1.3.patch
 create mode 100644 pull-5566/0002-connman.inc-Add-missing-dependencies-needed-by-some-.patch
 create mode 100644 pull-5566/0003-connman-Add-patches-to-fix-connman-on-fs-with-no-d_t.patch

-- 
1.7.9.5



