Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AE1C060556
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 17:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1GHbDmX009639; Mon, 16 Feb 2015 17:37:13 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xJg-sVYTWY2t; Mon, 16 Feb 2015 17:37:12 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1GHavQb009611
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 16 Feb 2015 17:37:08 GMT
Message-ID: <1424108217.25541.4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Feb 2015 17:36:57 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: Feature Freeze
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
X-List-Received-Date: Mon, 16 Feb 2015 17:37:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I have to admit I've lost track of time a bit however the calender says
Milestone 3 (M3) finishes this week and that marks "feature freeze" for
the release. Beyond this point we have M4 which which is targeted for
bug fixing only, no extra features and no package upgrades in general.

I'm therefore looking at the list of things we'd like to get into 1.8
and trying to figure out what is missing. The things I'm thinking we'd
prefer to get in, *if* we can are:

Upgrades:
* Bluez v4/v5 switch (in master-next testing)
* Upgrade to glibc (assuming it builds and don't regress anything)
* Pulseaudio 6.0 (related to bluez in particular)
* Python 2.7.3 -> python 2.7.9 upgrade (long overdue and nearly ready)

Enhancements:
* kernel-dev: make Kconfig audit output visible (#6943) since this 
  impacts our user experience
* Extended SDK containing development workflow tools
* Further integration of build-compare for package feed maintenance

Bruce: Are we at the right kernel versions we want for release for qemu
for example?

I get the feeling there may be some pieces I've forgotten, please let me
know if so. Whilst M3 technically closes now, there are probably a few
more days, as time moves forward its going to become harder to convince
me to take things though.

Cheers,

Richard




