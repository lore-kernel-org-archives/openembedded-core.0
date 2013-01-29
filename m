Received: from atl4mhfb01.myregisteredsite.com ([209.17.115.55])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1U07n0-0004RN-Qm
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 10:47:39 +0100
Received: from atl4mhob08.myregisteredsite.com
	(atl4mhob08.myregisteredsite.com [209.17.115.46])
	by atl4mhfb01.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r0T9T955014986 for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 04:29:10 -0500
Received: from mailpod.hostingplatform.com (mail.networksolutionsemail.com
	[205.178.146.50])
	by atl4mhob08.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r0T9T8a8029272 for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 04:29:08 -0500
Received: (qmail 25747 invoked by uid 0); 29 Jan 2013 09:29:08 -0000
Received: from unknown (HELO ?192.168.80.45?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 29 Jan 2013 09:29:08 -0000
Message-ID: <51079663.60504@topic.nl>
Date: Tue, 29 Jan 2013 10:29:07 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: Multiple MACHINE building is broken in OE-core?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2013 09:47:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I often have several hardware boards sharing 99% of periferals and 
configuration. Usually they all have the exact same CPU, and the 
difference is in the minor details like the screen resolution.

In "classic" OE I was used to sharing the work, by just changing the 
MACHINE variable I could create an image for a slightly changed board in 
a matter of minutes.

In OE-core this seems to be horribly broken, unless there's some other 
procedure to follow.

If I change the MACHINE, it insists on rebuilding all kinds of packages 
that don't need rebuilding at all. Instead of minutes, it takes an hour 
to switch machines. And if I change back, the same thing happens all 
over again.

In addition to needlessly rebuilding dozens of packages for the same 
architecture, it often "starts" halfway through, so it tries to run the 
"deploy" phase for a package while the workspace has already been 
removed in the rm_work phase of the previous build. Which fails, so I 
have to manually reset stamps for that package and let it start over 
again (while usually the package shouldn't be rebuilt in the first place).

Is building for several machines no longer supported in OE-core? Or is 
there some secret way of setting up directories and variables that will 
make it work as it used to?

-- 
Mike Looijmans - TOPIC Automation


