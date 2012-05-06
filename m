Received: from smtp-relay2.palm.com ([64.28.152.243])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prvs=46685ca14=rich.pixley@palm.com>)
	id 1SR5Yb-0007gR-AU for openembedded-core@lists.openembedded.org;
	Sun, 06 May 2012 19:47:41 +0200
X-IronPort-AV: E=Sophos;i="4.75,539,1330934400"; d="scan'208";a="13344170"
Received: from unknown (HELO ushqusdns4.palm.com) ([148.92.223.164])
	by smtp-relay2.palm.com with ESMTP; 06 May 2012 10:36:45 -0700
Received: from fuji.noir.com ([10.100.2.5])
	by ushqusdns4.palm.com (8.14.4/8.14.4) with ESMTP id q46Hai2N017073;
	Sun, 6 May 2012 10:36:45 -0700
Message-ID: <4FA6B6AC.60301@palm.com>
Date: Sun, 06 May 2012 10:36:44 -0700
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4FA17B2A.5060903@palm.com> <4FA17FA7.9030805@windriver.com>
	<4FA187F4.9040003@palm.com> <4FA18DA7.6010205@windriver.com>
	<4FA18EC8.5040504@palm.com> <4FA18F9D.5090805@windriver.com>
	<1335999994.30113.39.camel@ted>
In-Reply-To: <1335999994.30113.39.camel@ted>
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
X-List-Received-Date: Sun, 06 May 2012 17:47:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/12 16:06 , Richard Purdie wrote:
> On Wed, 2012-05-02 at 14:48 -0500, Mark Hatle wrote:
>> On 5/2/12 2:45 PM, Rich Pixley wrote:
>>> On 5/2/12 12:40 , Mark Hatle wrote:
>>>> On 5/2/12 2:16 PM, Rich Pixley wrote:
>>>>> On 5/2/12 11:40 , Mark Hatle wrote:
>>>>>> On 5/2/12 1:21 PM, Rich Pixley wrote:
>>>>>>> I'm seeing a lot of builds apparently hanging forever, (the ones that
>>>>>>> work seem to work within seconds - the ones that hang seem to hang for
>>>>>>> at least 10's of minutes), with:
>>>>>>>
>>>>>>> rich@dolphin>       nice tail -f Log
>>>>>>> MACHINE           = "qemux86"
>>>>>>> DISTRO            = ""
>>>>>>> DISTRO_VERSION    = "oe-core.0"
>>>>>>> TUNE_FEATURES     = "m32 i586"
>>>>>>> TARGET_FPU        = ""
>>>>>>> meta              = "master:35b5fb2dd2131d4c7dc6635c14c6e08ea6926457"
>>>>>>>
>>>>>>> NOTE: Resolving any missing task queue dependencies
>>>>>>> NOTE: Preparing runqueue
>>>>>>> NOTE: Executing SetScene Tasks
>>>>>>>
>>>>>>> If I run top, I see one processor pinned at 98 - 99% utilization running
>>>>>>> python, but no other clues.
>>>>>>>
>>>>>>> Can anyone point me to doc, explain what's going on here, or point me in
>>>>>>> the right direction to debug this?
>>>>>> The only time I've seen "hang-like" behavior the system actually opened a
>>>>>> devshell and was awaiting input.   But based on your log, it doesn't look like
>>>>>> that is the case.
>>>>>>
>>>>>> Run bitbake with -DDD option, you will get considerably more debug information
>>>>>> and it might help point out what it thinks it is doing.
>>>>> NOTE: Executing SetScene Tasks
>>>>> DEBUG: Stamp for underlying task
>>>>> 12(virtual:native:/home/rich/projects/webos/openembedded-core/meta/recipes-devtools/opkg/opkg_svn.bb,
>>>>> do_populate_sysroot) is current, so skipping setscene variant
>>>>> DEBUG: Stamp for underlying task
>>>>> 16(virtual:native:/home/rich/projects/webos/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb,
>>>>> do_populate_sysroot) is current, so skipping setscene variant
>>>>> DEBUG: Stamp for underlying task
>>>>> 20(virtual:native:/home/rich/projects/webos/openembedded-core/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb,
>>>>> do_populate_sysroot) is current, so skipping setscene variant
>>>>> DEBUG: Stamp for underlying task
>>>>> 24(/home/rich/projects/webos/openembedded-core/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb,
>>>>> do_populate_sysroot) is current, so skipping setscene variant
>>>>> DEBUG: Stamp for underlying task
>>>>> 32(virtual:native:/home/rich/projects/webos/openembedded-core/meta/recipes-devtools/genext2fs/genext2fs_1.4.1.bb,
>>>>> do_populate_sysroot) is current, so skipping setscene variant
>>>>> DEBUG: Stamp for underlying task
>>>>> 36(virtual:native:/home/rich/projects/webos/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb,
>>>>> do_populate_sysroot) is current, so skipping setscene variant
>>>>> DEBUG: Stamp for underlying task
>>>>> 40(virtual:native:/home/rich/projects/webos/openembedded-core/meta/recipes-devtools/qemu/qemu_0.15.1.bb,
>>>>> do_populate_sysroot) is current, so skipping setscene variant
>>>>> DEBUG: Stamp for underlying task
>>>>> 44(/home/rich/projects/webos/openembedded-core/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb,
>>>>> do_populate_sysroot) is current, so skipping setscene variant
>>>>>
>>>>> And then the spinning hang.
>>>> Sorry, I don't know how to continue debugging what might be wrong.  The only
>>>> other thing I can suggest is check that your filesystem is "real", not a
>>>> netapp/nfs/network emulated filesystem....
>>>>
>>>> And if you were continuing a previous build, start a new build directory and
>>>> retry it.
>>> Local file system.  I'm building a second time expecting a null build
>>> pass.  I was able to get a null build pass in the same directory yesterday.
>>>
>>> Removing my build directory and starting over has been working, but
>>> costs me a few hours each time, and this happens frequently enough that
>>> I get no other work done.  :(.
>> Ya, that is certainly not acceptable.  If you could file a bug on the
>> bugzilla.yoctoproject.org someone might be able to help you diagnose this
>> further and hopefully figure out a fix.
> What would really help is a way to reproduce this...
>
> Does it reproduce with a certain set of metadata/sstate perhaps?
>
> What is odd about the above logs is that it appears bitbake never
> executes any task. Its possible something might have crashed somewhere I
> guess and not realise part of the system had died. Or it could be some
> kind of circular dependency loop where X needs Y to build and Y needs X
> so nothing happens. We are supposed to spot and error if that would have
> happened.
>
> Does strace give an idea of which bits of bitbake are alive/looping? I'd
> probably resort to a few print()/bb.error() in the code at this point to
> find out what is alive, what is dead and where its looping...
I have more info now.

What I suspected was looping, (since it took longer than the ~1hr I was 
willing to wait), isn't actual looping.  Given enough time, the builds 
do complete and I have comparable results on 5 different servers, (all 
ubuntu-12.04 amd64 and all on btrfs).

My initial, full builds of core-image-minimal do build, and they build 
in ~60min, (~30min if I hand seed the downloads directory).  I'm using 
no mirrors other than the defaults.  My second build in an already built 
directory, (expected to do nothing), takes anywhere from 7 - 10.5hrs to 
complete and successfully do nothing, depending on the server.

During this time, top shows a single cpu pinned at 98 - 100% 
utilization, and strace shows literally millions of access and stat 
calls on stamp files, mkdir on the stamps directory, etc.  Statistical 
analysis of just the do_fetch access calls shows a distribution that 
seems to mimic the topological tree.  That is, the most called access is 
for quilt-native and the components higher up the tree get fewer stats.

Oh, and the setscene stamps are all nonexistent.  I presume that's expected.

First, I can't imagine why there would need to be more than one mkdir on 
the stamps directory within a single instantiation of bitbake.  I can 
imagine that it was easier to attempt to mkdir it than to check first, 
but once it has been mkdir'd, (or checked), there's no need to do it 
another million times, is there?

Second, I can't imagine why there would need to be all the redundant 
stamp checking.  That info is cached internally, isn't it?

And third, the fact that it seems to be checking the entire subtree what 
appear to be multiple times at every node suggests to me that the 
checking algorithm is broken.  Back of the envelope... perhaps 300 
components, maybe 10 tasks per component ~= 3e3 tasks.  Figure a 
geometric explosion of checks for an inefficient algorithm and we're up 
to around 10e6 checks.  I haven't counted an entire run, but based on 
the time it takes to run, I'd say I'm seeing one, maybe two orders of 
magnitude more checks than that.  I've seen a few million node 
traversals in about 15min and a node traversal appears to involve 
several accesses and at least one stat.

I'm not familiar with the current bitbake internals so my next thought 
would be to replace the calls to access, stat, and mkdir on the stamp 
files with caching, counting calls.  Build a dictionary of each file 
called, if it's new, do the kernel call and cache the result in the 
dictionary.  If it's already in the dictionary, then inc a counter for 
it and return the cached value.  This should a) improve the speed of the 
current algorithm, b) improve the speed of the eventual replacement 
algorithm, and c) give us some useful statistical data in the mean time.

I'm also going to try reformating one of the systems and compare how 
long a build on ext4 takes.

Any other ideas?

--rich




