Received: from atl4mhfb03.myregisteredsite.com ([209.17.115.61])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1U5yHj-0005jp-OI
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Feb 2013 13:51:53 +0100
Received: from atl4mhob06.myregisteredsite.com
	(atl4mhob06.myregisteredsite.com [209.17.115.44])
	by atl4mhfb03.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r1ECZTJW021334 for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2013 07:35:30 -0500
Received: from mailpod.hostingplatform.com (mail.networksolutionsemail.com
	[205.178.146.50])
	by atl4mhob06.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r1ECZSZD007887 for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2013 07:35:28 -0500
Received: (qmail 9707 invoked by uid 0); 14 Feb 2013 12:35:28 -0000
Received: from unknown (HELO ?192.168.80.45?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 14 Feb 2013 12:35:28 -0000
Message-ID: <511CDA0F.9060002@topic.nl>
Date: Thu, 14 Feb 2013 13:35:27 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <511BB265.8030505@windriver.com> <511CA4B2.1090307@intel.com>
	<511CA9E2.70700@windriver.com>
	<CAJTo0LYLtan2=YkzCN9Xvkj7k695LGba7T1QMHwYQ8EK46YvgQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYLtan2=YkzCN9Xvkj7k695LGba7T1QMHwYQ8EK46YvgQ@mail.gmail.com>
Subject: How to "implement" systemd
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
X-List-Received-Date: Thu, 14 Feb 2013 12:52:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

So far i've been using good old initscripts for my systems. I want to 
try out systemd. Having zero experience with that, I just added 
"systemd" to the DISTRO_FEATURES and started a fresh  build. The build 
ran fine, but it produced something that still seems to be using 
initscripts, albeit that a few things stopped working (the network did 
not start, for example).

Is there some openembedded "guide" on what one has to do to actually use 
systemd? I've tried google, but because i don't have a clue what 
keywords to look for, I got only irrelevant results on various Linux 
distributions while searching with "oe-core initscripts to systemd" and 
variations on that theme.


