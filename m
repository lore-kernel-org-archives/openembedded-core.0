Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4187E762B7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 10:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t83AqYfT017186; Thu, 3 Sep 2015 11:52:34 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 40pHUKqpmxBj; Thu,  3 Sep 2015 11:52:34 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t83AqMCg017096
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 3 Sep 2015 11:52:33 +0100
Message-ID: <1441277542.24871.106.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 03 Sep 2015 11:52:22 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: Release status (M3 feature freeze)
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
X-List-Received-Date: Thu, 03 Sep 2015 10:52:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The end of last week was supposed to be feature freeze. We're still
trying to get through the backlog of patches and we continue to see new
random/weird build failures, particularly in the runtime testing. I do
have a rough idea of the things I'm planning to take at this point, or
at least strongly consider:

* systemd upgrade (assuming tests are fixed)
* extensible SDK patches (pending review)
* devtool changes
* sstate signing
* rpm signing
* kergoth's sanity test for file ownership
* package feed comparison (build-compare)
* persistent /var/log
* consider the gcc 5.2 default change
* pseudo upgrade if we can fix the opkg issues
* midori/ephipany replacement
* initramfs/qemu improvements from Patrick

There are a number of changes in master-next which are looking ready too
(pending the current build results). If there is a feature you want to
see in 2.0 and its not listed above, let me know ASAP.

Cheers,

Richard





