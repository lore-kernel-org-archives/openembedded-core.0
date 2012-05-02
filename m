Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SPimY-0003H7-Vp for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 01:16:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q42N6gne027038
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 May 2012 00:06:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25760-10 for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2012 00:06:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q42N6VKZ027031
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 May 2012 00:06:32 +0100
Message-ID: <1335999994.30113.39.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 03 May 2012 00:06:34 +0100
In-Reply-To: <4FA18F9D.5090805@windriver.com>
References: <4FA17B2A.5060903@palm.com> <4FA17FA7.9030805@windriver.com>
	<4FA187F4.9040003@palm.com> <4FA18DA7.6010205@windriver.com>
	<4FA18EC8.5040504@palm.com> <4FA18F9D.5090805@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: SetScene tasks hang forever?
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
X-List-Received-Date: Wed, 02 May 2012 23:16:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-02 at 14:48 -0500, Mark Hatle wrote:
> On 5/2/12 2:45 PM, Rich Pixley wrote:
> > On 5/2/12 12:40 , Mark Hatle wrote:
> >> On 5/2/12 2:16 PM, Rich Pixley wrote:
> >>> On 5/2/12 11:40 , Mark Hatle wrote:
> >>>> On 5/2/12 1:21 PM, Rich Pixley wrote:
> >>>>> I'm seeing a lot of builds apparently hanging forever, (the ones that
> >>>>> work seem to work within seconds - the ones that hang seem to hang for
> >>>>> at least 10's of minutes), with:
> >>>>>
> >>>>> rich@dolphin>      nice tail -f Log
> >>>>> MACHINE           = "qemux86"
> >>>>> DISTRO            = ""
> >>>>> DISTRO_VERSION    = "oe-core.0"
> >>>>> TUNE_FEATURES     = "m32 i586"
> >>>>> TARGET_FPU        = ""
> >>>>> meta              = "master:35b5fb2dd2131d4c7dc6635c14c6e08ea6926457"
> >>>>>
> >>>>> NOTE: Resolving any missing task queue dependencies
> >>>>> NOTE: Preparing runqueue
> >>>>> NOTE: Executing SetScene Tasks
> >>>>>
> >>>>> If I run top, I see one processor pinned at 98 - 99% utilization running
> >>>>> python, but no other clues.
> >>>>>
> >>>>> Can anyone point me to doc, explain what's going on here, or point me in
> >>>>> the right direction to debug this?
> >>>> The only time I've seen "hang-like" behavior the system actually opened a
> >>>> devshell and was awaiting input.   But based on your log, it doesn't look like
> >>>> that is the case.
> >>>>
> >>>> Run bitbake with -DDD option, you will get considerably more debug information
> >>>> and it might help point out what it thinks it is doing.
> >>> NOTE: Executing SetScene Tasks
> >>> DEBUG: Stamp for underlying task
> >>> 12(virtual:native:/home/rich/projects/webos/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb,
> >>> do_populate_sysroot) is current, so skipping setscene variant
> >>> DEBUG: Stamp for underlying task
> >>> 16(virtual:native:/home/rich/projects/webos/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb,
> >>> do_populate_sysroot) is current, so skipping setscene variant
> >>> DEBUG: Stamp for underlying task
> >>> 20(virtual:native:/home/rich/projects/webos/openembedded-core/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb,
> >>> do_populate_sysroot) is current, so skipping setscene variant
> >>> DEBUG: Stamp for underlying task
> >>> 24(/home/rich/projects/webos/openembedded-core/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb,
> >>> do_populate_sysroot) is current, so skipping setscene variant
> >>> DEBUG: Stamp for underlying task
> >>> 32(virtual:native:/home/rich/projects/webos/openembedded-core/meta/recipes-devtools/genext2fs/genext2fs_1.4.1.bb,
> >>> do_populate_sysroot) is current, so skipping setscene variant
> >>> DEBUG: Stamp for underlying task
> >>> 36(virtual:native:/home/rich/projects/webos/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb,
> >>> do_populate_sysroot) is current, so skipping setscene variant
> >>> DEBUG: Stamp for underlying task
> >>> 40(virtual:native:/home/rich/projects/webos/openembedded-core/meta/recipes-devtools/qemu/qemu_0.15.1.bb,
> >>> do_populate_sysroot) is current, so skipping setscene variant
> >>> DEBUG: Stamp for underlying task
> >>> 44(/home/rich/projects/webos/openembedded-core/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb,
> >>> do_populate_sysroot) is current, so skipping setscene variant
> >>>
> >>> And then the spinning hang.
> >> Sorry, I don't know how to continue debugging what might be wrong.  The only
> >> other thing I can suggest is check that your filesystem is "real", not a
> >> netapp/nfs/network emulated filesystem....
> >>
> >> And if you were continuing a previous build, start a new build directory and
> >> retry it.
> > Local file system.  I'm building a second time expecting a null build
> > pass.  I was able to get a null build pass in the same directory yesterday.
> >
> > Removing my build directory and starting over has been working, but
> > costs me a few hours each time, and this happens frequently enough that
> > I get no other work done.  :(.
> 
> Ya, that is certainly not acceptable.  If you could file a bug on the 
> bugzilla.yoctoproject.org someone might be able to help you diagnose this 
> further and hopefully figure out a fix.

What would really help is a way to reproduce this...

Does it reproduce with a certain set of metadata/sstate perhaps?

What is odd about the above logs is that it appears bitbake never
executes any task. Its possible something might have crashed somewhere I
guess and not realise part of the system had died. Or it could be some
kind of circular dependency loop where X needs Y to build and Y needs X
so nothing happens. We are supposed to spot and error if that would have
happened.

Does strace give an idea of which bits of bitbake are alive/looping? I'd
probably resort to a few print()/bb.error() in the code at this point to
find out what is alive, what is dead and where its looping...

Cheers,

Richard



