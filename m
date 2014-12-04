Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhfb03.myregisteredsite.com
	(atl4mhfb03.myregisteredsite.com [209.17.115.61])
	by mail.openembedded.org (Postfix) with ESMTP id 6204772300
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 10:34:13 +0000 (UTC)
Received: from atl4mhob02.myregisteredsite.com
	(atl4mhob02.myregisteredsite.com [209.17.115.40])
	by atl4mhfb03.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	sB4ARvgW009924 for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Dec 2014 05:27:57 -0500
Received: from mailpod.hostingplatform.com ([10.30.71.203])
	by atl4mhob02.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	sB4ARpcu007038 for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Dec 2014 05:27:51 -0500
Received: (qmail 15172 invoked by uid 0); 4 Dec 2014 10:27:51 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO paradigit.TOPIC.LOCAL)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 4 Dec 2014 10:27:51 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Dec 2014 11:27:44 +0100
Message-Id: <1417688866-8329-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] Busybox mdev improvements
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
X-List-Received-Date: Thu, 04 Dec 2014 10:34:13 -0000

I've been using busybox mdev instead of udev in many projects, which so
far has worked excellently.

Each of these projects needed similar patches to busybox to make it work,
so I think its time these changes move into the core for everyone to use.

This first series fixes the touchscreen support. A patch to automatically
have mdev mount storage devices will follow soon, I'm still testing it.


