Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2F6D3710C7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Sep 2014 16:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s81GCkwK005662; Mon, 1 Sep 2014 17:12:46 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QBcHksJd2nd5; Mon,  1 Sep 2014 17:12:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s81GCiO8005658
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 1 Sep 2014 17:12:45 +0100
Message-ID: <1409587965.29296.233.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Mon, 01 Sep 2014 17:12:45 +0100
In-Reply-To: <5403DC5C.4020307@windriver.com>
References: <cover.1409345003.git.bruce.ashfield@windriver.com>
	<1409479646.29296.223.camel@ted> <5403DC5C.4020307@windriver.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/18] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 01 Sep 2014 16:12:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2014-08-31 at 22:39 -0400, Bruce Ashfield wrote:
> On 2014-08-31, 6:07 AM, Richard Purdie wrote:
> > Thanks for the other fix, I've pulled that in and am retesting. I did
> > also see:
> >
> > https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/24/steps/BuildImages/logs/stdio
> >
> > ERROR: Fetcher failure: Unable to find revision 5a47bbc4c3c2472f3746a8cf1485db7134cf9245 in branch master even from upstream
> > ERROR: Function failed: Fetcher failure for URL: 'git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=master,meta;name=machine,meta'. Unable to fetch URL from any source.
> > ERROR: Logfile of failure stored in: /home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/build/tmp/work/qemux86_64-poky-linux/linux-yocto-tiny/3.14.17+gitAUTOINC+ccad961c4c_5a47bbc4c3-r0/temp/log.do_fetch.10000
> > NOTE: recipe linux-yocto-tiny-3.14.17+gitAUTOINC+ccad961c4c_5a47bbc4c3-r0: task do_fetch: Failed
> > ERROR: Task 324 (/home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb, do_fetch) failed with exit code '1'
> > WARNING: Failed to fetch URL git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=master,meta;name=machine,meta, attempting MIRRORS if available
> > ERROR: Fetcher failure: Unable to find revision 12f9e966eb249c3bdcc935612e2a372e90bad950 in branch master even from upstream
> > ERROR: Function failed: Fetcher failure for URL: 'git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=master,meta;name=machine,meta'. Unable to fetch URL from any source.
> > ERROR: Logfile of failure stored in: /home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/build/tmp/work/qemux86_64-poky-linux/linux-yocto-rt/3.14.17+gitAUTOINC+ccad961c4c_12f9e966eb-r0/temp/log.do_fetch.9978
> > NOTE: recipe linux-yocto-rt-3.14.17+gitAUTOINC+ccad961c4c_12f9e966eb-r0: task do_fetch: Failed
> > ERROR: Task 325 (/home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb, do_fetch) failed with exit code '1
> >
> > (I've a fix in for the other alsa failure)
> >
> > Any idea what's up with this?
> 
> Fixed. I just pushed the patch to my contrib zedd/kernel branch. Attached
> here as well.
> 
> I did fat finger the conditional assignments and include order in my
> KBRANCH_DEFAULT removal patch.
> 
> But it is working now, and I'm back to normally scheduled long weekend
> activities .. but will of course continue to monitor.

Thanks, much appreciated. We're down to one remaining issue:

https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/27/steps/BuildImages/logs/stdio

which is basically because by default, meta-skeleton isn't in
bblayers.conf. Not quite sure what the correct fix is here.

For now I've merged everything in the series except the image addition.

Cheers,

Richard


