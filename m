Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 028F46EE0D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 10:55:07 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1JAt334018207 for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 10:55:03 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id s6s5TdFFhEZS
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 10:55:03 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1JAsu2U018199
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 10:54:57 GMT
Message-ID: <1392807290.14081.267.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Feb 2014 10:54:50 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: RFC: systemd version - release or git?
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
X-List-Received-Date: Wed, 19 Feb 2014 10:55:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

As anyone looking at the autobuidler will know, we've been having a lot
of issues with instability with systemd tests under qemu.

I believe these are real world issues, most likely races in systemd
itself.

The last release of systemd, 208 was five months ago. There have been a
ton of changes since including many bug fixes.

Fedora 20 uses systemd 208 (the last release) with 200+ patches on top.

I'm therefore wondering if we shouldn't bite the bullet and add a git
recipe rather than trying to patch 208 into some form of life.

The proposal is therefore to add a more recent git recipe and make that
the default.

I have such a patch in master-next. I've debugged the toolchain issues,
missing kernel config and other issues with systemd master, it always
now seems to pass the autobuilder tests. I need to check on one
remaining automated QA test result to ensure its not a regression in
systemd.

Any objections to defaulting to a git version?

Cheers,

Richard



