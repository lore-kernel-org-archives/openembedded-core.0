Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SnB0k-0001Hz-RP
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 18:04:07 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q66Fqql2025960;
	Fri, 6 Jul 2012 08:52:52 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri,  6 Jul 2012 11:52:40 -0400
Message-Id: <1341589961-14331-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [RFC PATCH 0/1] kernel.bbclass: add non-santized kernel provides
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
X-List-Received-Date: Fri, 06 Jul 2012 16:04:07 -0000

Richard/Saul,

I'm sending this out as a RFC, since I'm far from a packaging
expert. I've got all the details in the patch, but I ran into
a situation where the version string in utsrelease.h was being
santized for the kernel provides, and not in the kernel module
requires. 

I tried several solutions:

  - Changing the kernel module requires (more complex, more
    code involved)
  - Adding an extra provides in the kernel recipe with the
    version string (only fixes my problem and doens't help
    others)
  - Changing the string to something that doesn't change
    (aka run and hide)
  - Adding a secondary provides in the kernel RPM so both
    the sanitized and raw package name are present. This 
    was a small fix, works for my nasty version string, and
    for the normal strings that I have elsewhere. It also
    keeps existing provides intact in case something else I
    can't see depends on the behaviour.

If the change seems reasonable, I can send a pull request
(or merge it directly if you want :) .. but I'm definitely open
to hearing about better solutions as well.

Cheers,

Bruce


