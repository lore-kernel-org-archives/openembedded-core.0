Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob02.myregisteredsite.com
	(atl4mhob02.myregisteredsite.com [209.17.115.40])
	by mail.openembedded.org (Postfix) with ESMTP id B35D87284D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 14:17:42 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.206])
	by atl4mhob02.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	sBIEHgJE018388 for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 09:17:42 -0500
Received: (qmail 3980 invoked by uid 0); 18 Dec 2014 14:17:42 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO paradigit.TOPIC.LOCAL)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 18 Dec 2014 14:17:42 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Dec 2014 15:17:27 +0100
Message-Id: <1418912251-3313-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1417688866-8329-1-git-send-email-mike.looijmans@topic.nl>
References: <1417688866-8329-1-git-send-email-mike.looijmans@topic.nl>
Subject: [PATCH v2 0/4] Busybox mdev improvements
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
X-List-Received-Date: Thu, 18 Dec 2014 14:17:48 -0000

I've been using busybox mdev instead of udev in many projects, which so
far has worked excellently.

Each of these projects needed similar patches to busybox to make it work,
so I think its time these changes move into the core for everyone to use.

v2: I joined the two patch sets together.
The first two fix the touchscreen support.
The third makes the system automatically load kernel modules when
you plug in a device.
The fourth adds automounter capabilities. In v2 the default location is
/run/media, which can be changed in /etc/default/mdev.


