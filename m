Received: from atl4mhfb03.myregisteredsite.com ([209.17.115.61])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1U1GSl-00010n-Rz
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 14:15:40 +0100
Received: from atl4mhob12.myregisteredsite.com
	(atl4mhob12.myregisteredsite.com [209.17.115.50])
	by atl4mhfb03.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r11CxjEP015358 for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Feb 2013 07:59:45 -0500
Received: from mailpod.hostingplatform.com (mail.networksolutionsemail.com
	[205.178.146.50])
	by atl4mhob12.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r11CxgAE025917 for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Feb 2013 07:59:42 -0500
Received: (qmail 14577 invoked by uid 0); 1 Feb 2013 12:59:42 -0000
Received: from unknown (HELO ?192.168.80.45?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 1 Feb 2013 12:59:42 -0000
Message-ID: <510BBC3D.1030207@topic.nl>
Date: Fri, 01 Feb 2013 13:59:41 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <51079663.60504@topic.nl>
	<20130129094059.GI16904@jama.palm1.palmone.com>
	<5107A295.2060307@topic.nl>
	<CAJTo0LYJ8aza9P0V2X_UszE2yWJjGGacWUstPYeoxF0KcwDYxg@mail.gmail.com>
	<510B73EB.8060907@topic.nl>
	<CAJTo0LbkOMXqZkHd-JAcNKxiOmXTy+TXPEEJ-CkPc1Jx3Ujekg@mail.gmail.com>
In-Reply-To: <CAJTo0LbkOMXqZkHd-JAcNKxiOmXTy+TXPEEJ-CkPc1Jx3Ujekg@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Multiple MACHINE building is broken in OE-core?
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
X-List-Received-Date: Fri, 01 Feb 2013 13:15:42 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/01/2013 11:29 AM, Burton, Ross wrote:
> On 1 February 2013 07:51, Mike Looijmans <mike.looijmans@topic.nl> wrote:
>>> A concrete example might help.
>>
>> Would be glad to comply, if you care to explain what you need. What should I
>> do, which logging to collect (and maybe how)?
>
> To start with just the two machines you are changing between and the
> packages/tasks that are re-ran.

How can I get a list of packages/tasks? They just flash by on screen, 
but I bet there's a convenient flag that I can pass to bitbake to get 
what I want.

One case was between "zynq-zc702" and "zedboard" using my BSP overlay on 
https://github.com/milosoftware/meta-zynq
Both boards have the same SOC, just different board configurations.

Another is when switching from settop box "et9x00" to "vusolo2" in the 
upcoming OpenPLi at 
http://openpli.git.sourceforge.net/git/gitweb.cgi?p=openpli/openpli-oe-core;a=shortlog;h=refs/heads/upstream
The latter failed so miserably that I had to remove the whole "tmp" 
directory and start over to get it to build at all for either of them.


 > As Martin said, switching machine
> will mean a new sysroot so you'll see lots of setscene tasks running
> for every package to start with, but that will only take a minute.

Would using INHERIT += "rm_work" in my config files be problematic here? 
If I need to preserve all the work items, I'll go and buy a bigger 
harddisk, but it's more efficient to just clean up.

Mike.

(sorry, forgot to click the "reply to list" button in my previous response)


