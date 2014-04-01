Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 737FC6F572
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 13:51:56 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s31Dpiig024630; Tue, 1 Apr 2014 14:51:44 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id oLbEwzs5NRW7; Tue,  1 Apr 2014 14:51:44 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s31DpfM9024621
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 1 Apr 2014 14:51:43 +0100
Message-ID: <1396360296.2910.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 01 Apr 2014 14:51:36 +0100
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
X-List-Received-Date: Tue, 01 Apr 2014 13:51:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Executive Summary
=================

3.14 kernel is in and we have green builds. Managed to make a dent in
the defect tracking metrics but work remains. Trending well for the
release, need to keep up the bug fixing.

1.6 Release Status
===============

The 3.14 kernel was released, we were able to updated the patches we had
queued ready and it merged fairly smoothly. The builds last night after
3.14 was integrated were all green which is nice to see. This included
the switch to the two new reference BSPs. This was a big risk factor for
the release so its nice to see it happen smoothly, finally.

I've started aggressively trying to sort out my bug backlog, I've
managed to close about 10 of them over the past week, some were found
not to be bugs when they were delved into, some were resolved. There are
some interesting bugs to do with sstate reuse too. My remaining 6 bugs
(ignoring enhancements) are probably 1.7 material at this point. I know
others have been making an effort too, including in other areas like
documentation. We still have some runway before release so lets use that
time to best advantage and see if we can lower the bug tracking metrics
further.

I have been trying to merge bug fixes quickly. I have to say that there
has been a sharp drop in quality of patches on the list over the last
week though. As people rush to try and get things in, its clear less
testing is happening and this puts the build at risk. I'm therefore
starting to be quite strict on review and if something is rushed and
buggy, it (and any subsequent versions) will move to the bottom of the
priority list.

Autobuilder
===========

This seems to be stabilising. There has been the odd setup issue,
another AB had RAID issues and the odd regression crept into the
autobuilder code but things are being dealt with and feel under control.

Bitbake Changes
===============

There is still some churn on the toaster codebase but given its new
code, that is probably only to be expected. There have been some useful
sstate signature fixes merged. I'm particularly interested in reports
from people where sstate should have been reused and it wasn't. I'd
really like to get to the bottom of these issues once and for all.

Cheers,

Richard


