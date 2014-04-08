Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 8EE3165D92
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 12:25:48 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s38CPahE013343; Tue, 8 Apr 2014 13:25:37 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qIisdw-mfA2k; Tue,  8 Apr 2014 13:25:36 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s38CPXjQ013334
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 8 Apr 2014 13:25:34 +0100
Message-ID: <1396959927.24597.104.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 08 Apr 2014 13:25:27 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: Status Update
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
X-List-Received-Date: Tue, 08 Apr 2014 12:25:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Executive Summary
=================

Continuing to trend well for release, bug fixes continue to be merged
although patches are starting to get deferred for 1.7 if they're too
risky at this point.


1.6 Release Status
===============

The summary says it all really, bug trends are good but work remains.
The openssl CVE needs to get addresses so we'll probably take a package
upgrade for that specific component.

I am continuing to see a lot of "dubious" patches where the rationale
for the fix doesn't add up. I'm leaning not to take these in those
cases.


Autobuilder
===========

Builds are greenish however we've had a lot of problem with the sanity
tests suffering hung processes. There have also been buildslave issues,
particularly with ab05 which has now been taken out the pool pending
investigation as to why its "upset", so its hard to know if issues are
the hardware or the sanity tests.

Cheers,

Richard



