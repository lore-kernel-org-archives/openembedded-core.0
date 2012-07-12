Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SpNmG-0003fr-8M
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 20:06:12 +0200
Received: by yhjj56 with SMTP id j56so2993158yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 10:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=6ddxfLB1s74sIjz88zLx7hYc0EmZiMLH3NyUHkGE7cs=;
	b=kV5IJ/76gyhZKnwM/xf2+jkS5KmSGA6m2Y9ZWVVj77bUrhVtcf7rTYcsjW/II2JSKi
	6WhRs1I7GA+3NVeAbKZyxXZEUL1Jgkar3MpoqYjp4qg/ncfsvkD+KqYHiRVkjFEaWNTC
	yLjI5fhP3JXB0s4LeAYa8eRarlYDdg0Z4BajtNsKdL+ihcpWn/zwqk1V7rSuYO9ybePh
	Z3os/4z8oQg8Wjwdul4KKGGyPFYeY4jzC7EO99X985mfiuEtfrrkeS6VRM3CWhzXm9Tl
	63TQaMljKSBubINUpIdwJ7Vc2dkLq9NslJGtBVF4+eaTsxryr7CPze9m7Dn3HsKI9Feg
	mKOA==
Received: by 10.50.217.201 with SMTP id pa9mr6466486igc.54.1342115697871;
	Thu, 12 Jul 2012 10:54:57 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id ga6sm10876igc.2.2012.07.12.10.54.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jul 2012 10:54:57 -0700 (PDT)
From: andrei@gherzan.ro
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jul 2012 20:54:46 +0300
Message-Id: <cover.1342115559.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQnJiWo4xWjgBEw+dkqrHv2c5a6DwGn572/C7NNXN0ccpf5gRI/v2MQnPhlgyK5T1B2DTaaF
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [PATCH 0/2] Update connman to v1.3 and fix dependencies for some tests
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
X-List-Received-Date: Thu, 12 Jul 2012 18:06:12 -0000

From: Andrei Gherzan <andrei@gherzan.ro>

Machine tested: qemux86

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

  git://git.yoctoproject.org/poky-contrib ag/connman
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/connman

Andrei Gherzan (2):
  connman: Update to version 1.3
  connman.inc: Add missing dependencies needed by some tests

 meta/recipes-connectivity/connman/connman.inc      |    4 ++--
 .../connman/{connman_1.0.bb => connman_1.3.bb}     |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.0.bb => connman_1.3.bb} (82%)

-- 
1.7.9.5



