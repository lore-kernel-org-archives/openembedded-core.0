Received: from atl4mhfb03.myregisteredsite.com ([209.17.115.61])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1UcEeN-0001XX-8M
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 14:48:17 +0200
Received: from atl4mhob08.myregisteredsite.com
	(atl4mhob08.myregisteredsite.com [209.17.115.46])
	by atl4mhfb03.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r4ECU5YL022788 for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2013 08:30:05 -0400
Received: from mail.hostingplatform.com ([10.30.71.203])
	by atl4mhob08.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r4ECU36E025122 for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2013 08:30:03 -0400
Received: (qmail 24409 invoked by uid 0); 14 May 2013 12:30:03 -0000
Received: from unknown (HELO ?192.168.80.45?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 14 May 2013 12:30:03 -0000
Message-ID: <51922E4A.4020809@topic.nl>
Date: Tue, 14 May 2013 14:30:02 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1368189198-1294-1-git-send-email-jukka.rissanen@linux.intel.com>
	<518FB7F9.2020102@linux.intel.com>
	<1368384890.16243.79.camel@pb-ThinkPad-R50e>
	<3529451.hQA8zCVn47@helios>
	<1368442968.6920.4.camel@phil-desktop.brightsign>
	<CAJTo0LYSqikcyXKsXA5OpnUNmwbvrRqbi4kQ93r2QzBtEuo2zQ@mail.gmail.com>
	<5190CF63.2030303@r-finger.com>
	<1368456796.6920.23.camel@phil-desktop.brightsign>
	<51920240.3070408@r-finger.com>
In-Reply-To: <51920240.3070408@r-finger.com>
Subject: libsoup missing DEPENDS
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
X-List-Received-Date: Tue, 14 May 2013 12:48:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I got the following build error once, on an attempt to fix it (and 
create a patch for OE-core) from the devshell, the problem magically 
disappeared:


| 
/home/mike/zynq/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/libsoup-2.4/2.42.1-r0/temp/run.do_configure.26683: 
line 175: intltoolize: command not found
| ERROR: Function failed: do_configure (see 
/home/mike/zynq/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/libsoup-2.4/2.42.1-r0/temp/log.do_configure.26683 
for further information)
ERROR: Task 420 
(/home/mike/zynq/oe-core/meta/recipes-support/libsoup/libsoup-2.4_2.42.1.bb, 
do_configure) failed with exit code '1'


I suspect libsoup-2.4_2.42.1.bb is lacking a dependency, I don't know 
what provides the "intltoolize" program though.

Mike.


