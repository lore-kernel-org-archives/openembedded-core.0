Return-Path: <hans.beckerus@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id B65FB61626
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 19:30:32 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id y6so2405210lbh.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 12:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type;
	bh=q2MJcrw6tebgkzEWVCNV03zW37BnhtINqJo2PJTBeyg=;
	b=iQHX2cJVis6Nd0zOXxpnMK9XAq+TuMoIpMZq15/ZzV5T4JOLoAsFcQ2xQCGdhElNwW
	QBfM5p72GXwsGqYipyiGE/w5MTCKJ45BNBXpFxXHhVlshlBZZjmlMCxV60iOAR0iLAWR
	XAKxAA18h2DBYMpEZN1dj5luLvHqKcDWfAWibV5ToS5z6BcL3Nw2vlkG9csYaJIQjau1
	IeuR7BrLCOx8xT2ds7LqaB/e5/+Gn3y+vp/mFi0IKqIE8TbQWLjb2ooe+Bct5a6GFZYw
	3Qqikdjn+Q+xKJFFUaaBollgdW8N8Ck6G3GHWcwy4S1Gfk3XXaUzhXLe/2Cr4HEBaelY
	6AGQ==
X-Received: by 10.152.3.42 with SMTP id 10mr12433000laz.22.1379100633670;
	Fri, 13 Sep 2013 12:30:33 -0700 (PDT)
Received: from [192.168.0.10] (h135n8-rny-a12.ias.bredband.telia.com.
	[217.209.54.135])
	by mx.google.com with ESMTPSA id zw2sm6966894lbb.14.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Sep 2013 12:30:32 -0700 (PDT)
Message-ID: <523367D6.4050604@gmail.com>
Date: Fri, 13 Sep 2013 21:30:30 +0200
From: Hans Beckerus <hans.beckerus@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1378825041-20190-1-git-send-email-hans.beckerus@gmail.com>
	<CAFyqS9qRvPafVSt90BQe6F3Vaz8f0P2E2R4PLKh5Zz8JH8T6Vw@mail.gmail.com>
	<CAFyqS9rvPFr2F8+Tb1P0BLn84jJ0Q+cSCM-9pt8gOATquo4Gig@mail.gmail.com>
	<5231F548.6010801@linux.intel.com>
	<CAFyqS9r3WOEjfrPe5s=n1H9SzFsnJ4FAdo=AGprWUkufUe6QRQ@mail.gmail.com>
	<52322D8B.7080406@gmail.com> <52324915.6030708@gmail.com>
	<CAFyqS9omO7majs22+o-DPii9wpw15rrhxkgQAUD35GRWjRFqLw@mail.gmail.com>
	<1379062359.3484.243.camel@ted>
	<CAFyqS9qFA-gRZw_9XXtZfROmzc5vaWSyg6MRobhFiWkzekAnHA@mail.gmail.com>
	<CAFyqS9pUHcEDZOpw9r2-LjCwN9EwK4Y0cpQp+oVCV2VzWL2FdQ@mail.gmail.com>
	<CAFyqS9oavyrMkDL_W8MM36_fA9p_mxweiCk17j470WTv4YFvYw@mail.gmail.com>
	<CAFyqS9pQdQMSBJ04Rz+AeRkfgZbPDZAsTK6DPerRdiB5LHRQ+w@mail.gmail.com>
	<1379074896.3484.262.camel@ted>
	<CAFyqS9q1RMXjV-L3M3ZGz+Bw2Ky81WjDQSLmdZJUmm2yp5-pqg@mail.gmail.com>
	<CAFyqS9pvkL9dv=Oh=S8LmApy2wQppttJeQH+1+s6+bqmKXwRyg@mail.gmail.com>
	<52335040.101@linux.intel.com> <5233538E.9020404@gmail.com>
In-Reply-To: <5233538E.9020404@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] libtool: fix resolve of lt_sysroot
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
X-List-Received-Date: Fri, 13 Sep 2013 19:30:34 -0000
Content-Type: multipart/alternative;
	boundary="------------000101060706080009090202"

--------------000101060706080009090202
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 2013-09-13 8:03, Hans Beckerus wrote:
> On 2013-09-13 7:49, Saul Wold wrote:
>> On 09/13/2013 06:29 AM, Hans Beckérus wrote:
>>> Hmm. Now suddenly I got an error on my current world build of
>>> util-linux-native package. Is this something that is a known issue?
>>> Provided that the sysroot is correct (which I assume) this is because
>>> of the local version of udev on my build host. So, is this perhaps one
>>> of the reasons why some hosts distros are not certified in eg. Yocto?
>>>
>> What is your host and host OS in this case?
>>
> Its SUSE-LINUX-11
>
>> Sau!
>>> | In file included from misc-utils/lsblk.c:46:0:
>>> | /usr/include/libudev.h:28:2: error: #error "#define
>>> LIBUDEV_I_KNOW_THE_API_IS_SUBJECT_TO_CHANGE is needed to use this
>>> experimental library version"
>>> | In file included from misc-utils/findmnt.c:36:0:
>>> | /usr/include/libudev.h:28:2: error: #error "#define
>>> LIBUDEV_I_KNOW_THE_API_IS_SUBJECT_TO_CHANGE is needed to use this
>>> experimental library version"
>>
>> Have not see this before.
>>
>>
> Actually, I have ;) I sort of remembered seeing it before and I found 
> an old post I made in the Yocto mailing list.
> (wish we could easily link to mail threads)
>
> "
> Ok, I seem to have worked around this particular problem. I have new 
> ones but I post them separately ;)
> In this case it seems the /libudev/ installed on my host is too old 
> and breaks the build.
> I solved it in my layer using a util-linux_2.22.2.bbappend file by doing:
> /   EXTRA_OECONF_append_class-native = " --without-udev"/
> This is ok in my case since I will use mdev rather than udev.
>
> Hans
> "
>
> Thanks.
> Hans
>
>
>>> | misc-utils/lsblk.c: In function 'get_udev_properties':
>>> | misc-utils/lsblk.c:426:2: warning: implicit declaration of function
>>> 'udev_device_new_from_subsystem_sysname'
>>> [-Wimplicit-function-declaration]
>>> | misc-utils/lsblk.c:426:2: warning: nested extern declaration of
>>> 'udev_device_new_from_subsystem_sysname' [-Wnested-externs]
>>> | misc-utils/lsblk.c:426:6: warning: assignment makes pointer from
>>> integer without a cast [enabled by default]
>>> | misc-utils/lsblk.c:430:3: warning: implicit declaration of function
>>> 'udev_device_get_property_value' [-Wimplicit-function-declaration]
>>> | misc-utils/lsblk.c:430:3: warning: nested extern declaration of
>>> 'udev_device_get_property_value' [-Wnested-externs]
>>> | misc-utils/lsblk.c:430:13: warning: assignment makes pointer from
>>> integer without a cast [enabled by default]
>>> | misc-utils/lsblk.c:434:13: warning: assignment makes pointer from
>>> integer without a cast [enabled by default]
>>> | misc-utils/lsblk.c:438:13: warning: assignment makes pointer from
>>> integer without a cast [enabled by default]
>>> | misc-utils/lsblk.c:442:13: warning: assignment makes pointer from
>>> integer without a cast [enabled by default]
>>> | misc-utils/lsblk.c:444:13: warning: assignment makes pointer from
>>> integer without a cast [enabled by default]
>>> | misc-utils/lsblk.c:446:13: warning: assignment makes pointer from
>>> integer without a cast [enabled by default]
>>> | misc-utils/lsblk.c:448:13: warning: assignment makes pointer from
>>> integer without a cast [enabled by default]
>>> | make[2]: *** [misc-utils/lsblk-lsblk.o] Error 1
>>> | make[2]: *** Waiting for unfinished jobs....
>>> | misc-utils/findmnt.c: In function 'get_tag_from_udev':
>>> | misc-utils/findmnt.c:386:2: warning: implicit declaration of
>>> function 'udev_device_new_from_subsystem_sysname'
>>> [-Wimplicit-function-declaration]
>>> | misc-utils/findmnt.c:386:2: warning: nested extern declaration of
>>> 'udev_device_new_from_subsystem_sysname' [-Wnested-externs]
>>> | misc-utils/findmnt.c:386:6: warning: assignment makes pointer from
>>> integer without a cast [enabled by default]
>>> | misc-utils/findmnt.c:394:3: warning: implicit declaration of
>>> function 'udev_device_get_property_value'
>>> [-Wimplicit-function-declaration]
>>> | misc-utils/findmnt.c:394:3: warning: nested extern declaration of
>>> 'udev_device_get_property_value' [-Wnested-externs]
>>> | misc-utils/findmnt.c:394:8: warning: assignment makes pointer from
>>> integer without a cast [enabled by default]
>>> | misc-utils/findmnt.c:397:8: warning: assignment makes pointer from
>>> integer without a cast [enabled by default]
>>> | misc-utils/findmnt.c:400:8: warning: assignment makes pointer from
>>> integer without a cast [enabled by default]
>>> | misc-utils/findmnt.c:403:8: warning: assignment makes pointer from
>>> integer without a cast [enabled by default]
>>> | make[2]: *** [misc-utils/findmnt-findmnt.o] Error 1
>>>
>>>
>>>
>>> On Fri, Sep 13, 2013 at 3:08 PM, Hans Beckérus 
>>> <hans.beckerus@gmail.com> wrote:
>>>> On Fri, Sep 13, 2013 at 2:21 PM, Richard Purdie
>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>> On Fri, 2013-09-13 at 14:14 +0200, Hans Beckérus wrote:
>>>>>> On Fri, Sep 13, 2013 at 11:53 AM, Hans Beckérus 
>>>>>> <hans.beckerus@gmail.com> wrote:
>>>>>>> On Fri, Sep 13, 2013 at 11:08 AM, Hans Beckérus 
>>>>>>> <hans.beckerus@gmail.com> wrote:
>>>>>>>> On Fri, Sep 13, 2013 at 11:01 AM, Hans Beckérus 
>>>>>>>> <hans.beckerus@gmail.com> wrote:
>>>>>>>>> On Fri, Sep 13, 2013 at 10:52 AM, Richard Purdie
>>>>>>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>>>>>>> On Fri, 2013-09-13 at 10:06 +0200, Hans Beckérus wrote:
>>>>>>>>>>> On Fri, Sep 13, 2013 at 1:07 AM, Hans Beckerus 
>>>>>>>>>>> <hans.beckerus@gmail.com> wrote:
>>>>>>>>>>>> On 2013-09-12 11:09, Hans Beckerus wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>> On 2013-09-12 8:02, Hans Beckérus wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>> I now got a somewhat better picture of what is going on. I 
>>>>>>>>>>>> know what is
>>>>>>>>>>>> failing, and why. But currently I have no solution ready. 
>>>>>>>>>>>> Actually there are
>>>>>>>>>>>> some nasty traps to get caught in here :(. The problem is 
>>>>>>>>>>>> actually as simple
>>>>>>>>>>>> as it is obvious. For all those native packages that do 
>>>>>>>>>>>> work (this is a
>>>>>>>>>>>> unique problem for native packages using libtool), they all 
>>>>>>>>>>>> seem to share a
>>>>>>>>>>>> common thing in their recipes:
>>>>>>>>>>>>
>>>>>>>>>>>> EXTRA_OECONF += " 
>>>>>>>>>>>> --with-libtool-sysroot=${STAGING_DIR_NATIVE}"
>>>>>>>>>>>>
>>>>>>>>>>>> Great! This is the way to do it. But, what if someone 
>>>>>>>>>>>> forgets to do this?
>>>>>>>>>>>> Well the answer is; it will most likely *not* compile!
>>>>>>>>>>>> Since libtool now has been fixed to correctly pick up the 
>>>>>>>>>>>> sysroot from the
>>>>>>>>>>>> compiler (using --print-sysroot) if --with-libtool-sysroot 
>>>>>>>>>>>> is not specified
>>>>>>>>>>>> it will try to execute ${CC} --print-sysroot. Bummer! ${CC} 
>>>>>>>>>>>> is most likely
>>>>>>>>>>>> simply set to 'gcc' for native packages. That is, the local 
>>>>>>>>>>>> host compiler is
>>>>>>>>>>>> used.
>>>>>>>>>>>> The sysroot for that is of course "/". And it should be. 
>>>>>>>>>>>> Otherwise it will
>>>>>>>>>>>> bring in the wrong set of header files and libraries. But, 
>>>>>>>>>>>> there is another
>>>>>>>>>>>> problem here. We should not let libtool use "/"! Because 
>>>>>>>>>>>> even if we use the
>>>>>>>>>>>> local host compiler for native packages, we still use the 
>>>>>>>>>>>> oe-core upstream
>>>>>>>>>>>> version of libtool, and that does not like using "/" as 
>>>>>>>>>>>> sysroot.  If it does
>>>>>>>>>>>> everything becomes a mess. And that is exactly what seems 
>>>>>>>>>>>> to happen now
>>>>>>>>>>>> after the patch. Before the patch libtool rendered the SDK 
>>>>>>>>>>>> for libtool
>>>>>>>>>>>> enabled packages more or less useless. But, it also saved 
>>>>>>>>>>>> us in the native
>>>>>>>>>>>> case. Because if --with-libtool-sysroot was set, the path 
>>>>>>>>>>>> was used directly,
>>>>>>>>>>>> but if it was not set, lt_sysroot was also kept unset. And 
>>>>>>>>>>>> here is the
>>>>>>>>>>>> spooky part again. Having lt_sysroot set to nothing seems 
>>>>>>>>>>>> to work just as
>>>>>>>>>>>> well as setting it, provided it points to a valid 
>>>>>>>>>>>> location!? This magic
>>>>>>>>>>>> however did not work for the SDK which requires the sysroot 
>>>>>>>>>>>> to be resolved
>>>>>>>>>>>> correctly when not specified. So one conclusion could be 
>>>>>>>>>>>> that, for native
>>>>>>>>>>>> packages, enforcement of --with-libtool-sysroot is a 
>>>>>>>>>>>> possible way forward.
>>>>>>>>>>>> Would this be safe? I think so, but I might have overlooked 
>>>>>>>>>>>> something.  I
>>>>>>>>>>>> can also see in config.log that "configure" is fed with a 
>>>>>>>>>>>> lot of arguments,
>>>>>>>>>>>> even if EXTRA_OECONF is not specified. How is this handled? 
>>>>>>>>>>>> How can I try to
>>>>>>>>>>>> force this in for all native packages. I looked into 
>>>>>>>>>>>> native.bbclass but it
>>>>>>>>>>>> was not obvious to me how anything in there actually ends 
>>>>>>>>>>>> up in arguments to
>>>>>>>>>>>> "configure". Any hints? There are still a lot of gaps in my 
>>>>>>>>>>>> analysis ;) If
>>>>>>>>>>>> anyone feels like they can fill in the gaps, please do.
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>> Now this is getting interesting. When I said before I could 
>>>>>>>>>>> reproduce
>>>>>>>>>>> the problem in a world build I did not know that it would 
>>>>>>>>>>> actually
>>>>>>>>>>> succeed later. On a different build server!! The previous 
>>>>>>>>>>> analysis
>>>>>>>>>>> made is mostly true. But there is something more. Why did it 
>>>>>>>>>>> succeed
>>>>>>>>>>> on one of my servers but not the other one? The way to find 
>>>>>>>>>>> out was to
>>>>>>>>>>> compare what lt_sysroot is resolved to in both cases. And 
>>>>>>>>>>> there it
>>>>>>>>>>> was. On the machine for which it works, lt_sysroot is now 
>>>>>>>>>>> picked up
>>>>>>>>>>> from $CC --print-sysroot (due to the patch), but the result 
>>>>>>>>>>> is not
>>>>>>>>>>> "/", it is unset! Which is the same behavior that can be 
>>>>>>>>>>> observed
>>>>>>>>>>> without the libtool patch. So this is getting even worse 
>>>>>>>>>>> now. It is
>>>>>>>>>>> gcc and host dependent. If gcc has been built with a sysroot 
>>>>>>>>>>> of "/" is
>>>>>>>>>>> does not work since that will be picked up by libtool, and 
>>>>>>>>>>> is of
>>>>>>>>>>> course wrong in our case. But if lt_sysroot is kept unset, 
>>>>>>>>>>> libtool
>>>>>>>>>>> seems to be able to resolve a working default using some other
>>>>>>>>>>> (unknown) mechanism. That is why we have not seen this 
>>>>>>>>>>> problem before,
>>>>>>>>>>> even though libtool actually did the wrong thing before the 
>>>>>>>>>>> patch. So
>>>>>>>>>>> this leaves me with at least this question; is it actually 
>>>>>>>>>>> correct
>>>>>>>>>>> that gcc has "/" as a compiled in sysroot on some machines?
>>>>>>>>>>>
>>>>>>>>>>> I then saw two possible solutions:
>>>>>>>>>>>
>>>>>>>>>>> a) update the patch in libtool and if gcc reports a single 
>>>>>>>>>>> "/", skip
>>>>>>>>>>> it and leave lt_sysroot unset.
>>>>>>>>>>> b) consistency is the key. Let all native packages force 
>>>>>>>>>>> setting of a
>>>>>>>>>>> proper lt_sysroot  using --with-libtool-sysroot.
>>>>>>>>>>>
>>>>>>>>>>> This is also when I found this in autotools.bbclass
>>>>>>>>>>>
>>>>>>>>>>> def append_libtool_sysroot(d):
>>>>>>>>>>>      # Only supply libtool sysroot option for non-native 
>>>>>>>>>>> packages
>>>>>>>>>>>      if not bb.data.inherits_class('native', d):
>>>>>>>>>>>          return '--with-libtool-sysroot=${STAGING_DIR_HOST}'
>>>>>>>>>>>      return ""
>>>>>>>>>>>
>>>>>>>>>>> I can somewhat understand the rationale behind this. If 
>>>>>>>>>>> building for
>>>>>>>>>>> target you wish to point libtool to a proper sysroot, and 
>>>>>>>>>>> leaving it
>>>>>>>>>>> unset for native seems like a good idea. But I do not think 
>>>>>>>>>>> that
>>>>>>>>>>> really is the case. Even for native builds you wish to point 
>>>>>>>>>>> it to the
>>>>>>>>>>> sysroot for the libtool actually being used. Not to what the 
>>>>>>>>>>> compiler
>>>>>>>>>>> is pointing to, which is now the effect after applying the 
>>>>>>>>>>> libtool
>>>>>>>>>>> patch. But which is actually what you want when building 
>>>>>>>>>>> from an
>>>>>>>>>>> placement independent SDK toolchain for which $CC is updated 
>>>>>>>>>>> with a
>>>>>>>>>>> proper --sysroot argument to gcc automatically when the 
>>>>>>>>>>> environment
>>>>>>>>>>> script is sourced.
>>>>>>>>>>>
>>>>>>>>>>> So my propasal now is to update autotools.bbclass and for 
>>>>>>>>>>> native
>>>>>>>>>>> packages set -with-libtool-sysroot=${STAGING_DIR_NATIVE}. 
>>>>>>>>>>> This should
>>>>>>>>>>> cover all the corner cases and work in all different 
>>>>>>>>>>> combinations.
>>>>>>>>>>> Again, consistency is the key. But I still need to try it. 
>>>>>>>>>>> Problem now
>>>>>>>>>>> is that I need to wait until I have access to the machine 
>>>>>>>>>>> for which it
>>>>>>>>>>> currently does not work to verify it properly.
>>>>>>>>>>>
>>>>>>>>>>> Please advise. Does anyone object strongly to this idea?
>>>>>>>>>>
>>>>>>>>>> Sadly its not the right thing to do. The purpose of a sysroot 
>>>>>>>>>> option is
>>>>>>>>>> to say "compile and link against things in this subdirectory, 
>>>>>>>>>> do not
>>>>>>>>>> look outside it". Our native binaries need to use the system 
>>>>>>>>>> libc and
>>>>>>>>>> headers. They are therefore expected to look outside 
>>>>>>>>>> STAGING_DIR_NATIVE
>>>>>>>>>> if they don't find what they need in there. Native is really 
>>>>>>>>>> a special
>>>>>>>>>> hybrid case.
>>>>>>> Ok. Now I am with you :) Had to get some food and give this a 
>>>>>>> second
>>>>>>> thought and I definitely agree.
>>>>>>> Patching autotools.bbclass is not the right thing to do. Most 
>>>>>>> likely a
>>>>>>> package wish to use the same sysroot as the compiler, but 
>>>>>>> sometimes it
>>>>>>> does not. The "sometimes" here is the troll! Looking at the libtool
>>>>>>> package itself you can see that it is setting
>>>>>>> -with-libtool-sysroot=${STAGING_DIR_NATIVE}. But that is for that
>>>>>>> package. Does not mean all of them wish to have it like that. 
>>>>>>> The real
>>>>>>> bug here (the second one) seems to be that libtool internals 
>>>>>>> does not
>>>>>>> handle a sysroot of "/" very well. It works fine if sysroot is
>>>>>>> undefined unless you really wish to point it to somewhere special,
>>>>>>> like in the case of the SDK for which you always wish to point 
>>>>>>> it to
>>>>>>> the sysroot of the compiler and which is never going to be "/".
>>>>>>> I think, and I am up for other suggestions here, that the only sane
>>>>>>> fix (or workaround) is to trigger on the "/" and unset 
>>>>>>> lt_sysroot and
>>>>>>> thus behave as it did before the patch was applied. This fix 
>>>>>>> should go
>>>>>>> into libtool.m4. I can so far see no danger in doing this and 
>>>>>>> should
>>>>>>> be bug-compatible with previous behavior. Also it will make sure 
>>>>>>> the
>>>>>>> SDK works placement independent which was not the case before the
>>>>>>> patch was applied.
>>>>>>>
>>>>>>> Thanks
>>>>>>> Hans
>>>>>>> .
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>>> Here I am not with you really. Yes, the sysroot purpose is 
>>>>>>>>> exactly what you say.
>>>>>>>>> But, the sysroot for libtool *is* different. It has nothing to do
>>>>>>>>> really with what gcc is using, it just happens to be the same on
>>>>>>>>> standard systems. The purpose of the libtool sysroot is to 
>>>>>>>>> point to
>>>>>>>>> libtools own sysroot, and this might not actually be the same 
>>>>>>>>> as the
>>>>>>>>> compiler sysroot. As in our case. Since for native packages, 
>>>>>>>>> gcc and
>>>>>>>>> libtool are executed in different context, libtool *must* 
>>>>>>>>> point to its
>>>>>>>>> proper location for which it was built and that is 
>>>>>>>>> STAGING_DIR_NATIVE.
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> So things should be working if "/" is specified as the 
>>>>>>>>>> sysroot, or its
>>>>>>>>>> not specified at all. I think there are deeper bugs in 
>>>>>>>>>> libtool we're
>>>>>>>>>> uncovering :(
>>>>>>>>>>
>>>>>>>>>> When I first saw the patch, it looked like the correct thing 
>>>>>>>>>> to be doing
>>>>>>>>>> but it now seems it may uncover further bugs which are going 
>>>>>>>>>> to need to
>>>>>>>>>> get fixed before we can take this patch :(.
>>>>>>>>>>
>>>>>>>>> I am testing this second patch now in a world build and so far
>>>>>>>>> everything looks good.
>>>>>>>>>
>>>>>>>> Btw, what about the first alternative? Patching "/" to nothing in
>>>>>>>> libtool. Having lt_sysroot unset seems to work ok.
>>>>>>>> I agree that patching autotools.bbclass might be wrong. It 
>>>>>>>> seems my
>>>>>>>> patch in libtool only cause problems if gcc return sysroot as 
>>>>>>>> "/", not
>>>>>>>> when it return nothing.
>>>>>>>>
>>>>>> Guys, I need your feedback on this. Is it worth trying this out and
>>>>>> testing a world build or should I simply drop it?
>>>>>> I have a new patch in libtool.m4 that now unsets lt_sysroot if $CC
>>>>>> -print-sysroot returns "/". But I am in some sense confused here 
>>>>>> since
>>>>>> on my bigger machine (for which gcc sets nothing) forcing it to 
>>>>>> return
>>>>>> "/" and let lt_sysroot become=/ still works! So this also seems 
>>>>>> to be
>>>>>> very host dependent. I need to try this out on the machine that I
>>>>>> could really reproduce the build errors on.
>>>>>
>>>>> "/" and no sysroot should behave exactly the same. If they do not, 
>>>>> that
>>>>> is a bug in libtool's code. I'd be fine with a check which unsets 
>>>>> it in
>>>>> that case though. It masks another issue but we have to take these 
>>>>> one
>>>>> at a time. I do believe this problem worth digging into. Whether 
>>>>> we can
>>>>> get the fix in for the 1.5 release I'm not sure but we will want to
>>>>> address it in 1.6 regardless.
>>>>>
>>>> Agree. Since all my patch did initially was to make sure gcc was
>>>> queried when --with-libtool-sysroot was not specified this is the only
>>>> possible reason I can think of that causes it to break like this. And
>>>> there is only one side on this coin. The result before the patch if a
>>>> sysroot *was* specified is the same now also after the patch. I will
>>>> get back later with a status update on my world build. Will probably
>>>> take all weekend since it is a simple dual-core ARM mini-server :(
>>>> I am not really concerned about what release this is targeting. I
>>>> consider this a workaround until I can dig deeper into what is
>>>> actually going wrong. My primary goal is to make sure that the SDK
>>>> does not break as it did before when installed in different paths. Of
>>>> course that must not affect legacy features so hopefully this
>>>> workaround eliminates that.
>>>>
The current patch looks good so far. I am still running a world build on 
my "failing" host and no errors as of yet. The packages that failed 
before has now passed. Should I make a v5 out of this and then someone 
else (Saul?) can give it an extra spin?

>>>> Thanks.
>>>> Hans
>>>>
>>>>
>>>>> Cheers,
>>>>>
>>>>> Richard
>>>>>
>>>>>
>>>
>>>
>


--------------000101060706080009090202
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 2013-09-13 8:03, Hans Beckerus
      wrote:<br>
    </div>
    <blockquote cite="mid:5233538E.9020404@gmail.com" type="cite">
      <meta content="text/html; charset=ISO-8859-1"
        http-equiv="Content-Type">
      <div class="moz-cite-prefix">On 2013-09-13 7:49, Saul Wold wrote:<br>
      </div>
      <blockquote cite="mid:52335040.101@linux.intel.com" type="cite">On
        09/13/2013 06:29 AM, Hans Beck&eacute;rus wrote: <br>
        <blockquote type="cite">Hmm. Now suddenly I got an error on my
          current world build of <br>
          util-linux-native package. Is this something that is a known
          issue? <br>
          Provided that the sysroot is correct (which I assume) this is
          because <br>
          of the local version of udev on my build host. So, is this
          perhaps one <br>
          of the reasons why some hosts distros are not certified in eg.
          Yocto? <br>
          <br>
        </blockquote>
        What is your host and host OS in this case? <br>
        <br>
      </blockquote>
      Its SUSE-LINUX-11<br>
      <br>
      <blockquote cite="mid:52335040.101@linux.intel.com" type="cite">Sau!

        <br>
        <blockquote type="cite">| In file included from
          misc-utils/lsblk.c:46:0: <br>
          | /usr/include/libudev.h:28:2: error: #error "#define <br>
          LIBUDEV_I_KNOW_THE_API_IS_SUBJECT_TO_CHANGE is needed to use
          this <br>
          experimental library version" <br>
          | In file included from misc-utils/findmnt.c:36:0: <br>
          | /usr/include/libudev.h:28:2: error: #error "#define <br>
          LIBUDEV_I_KNOW_THE_API_IS_SUBJECT_TO_CHANGE is needed to use
          this <br>
          experimental library version" <br>
        </blockquote>
        <br>
        Have not see this before. <br>
        <br>
        <br>
      </blockquote>
      Actually, I have ;) I sort of remembered seeing it before and I
      found an old post I made in the Yocto mailing list.<br>
      (wish we could easily link to mail threads)<br>
      <br>
      "<br>
      Ok, I seem to have worked around this particular problem. I have
      new ones but I post them separately ;)<br>
      In this case it seems the <i>libudev</i> installed on my host is
      too old and breaks the build.<br>
      I solved it in my layer using a util-linux_2.22.2.bbappend file by
      doing:<br>
      <i>&nbsp;&nbsp; EXTRA_OECONF_append_class-native = " --without-udev"</i><br>
      This is ok in my case since I will use mdev rather than udev. <br>
      <br>
      Hans<br>
      "<br>
      <br>
      Thanks.<br>
      Hans<br>
      <br>
      <br>
      <blockquote cite="mid:52335040.101@linux.intel.com" type="cite">
        <blockquote type="cite">| misc-utils/lsblk.c: In function
          'get_udev_properties': <br>
          | misc-utils/lsblk.c:426:2: warning: implicit declaration of
          function <br>
          'udev_device_new_from_subsystem_sysname' <br>
          [-Wimplicit-function-declaration] <br>
          | misc-utils/lsblk.c:426:2: warning: nested extern declaration
          of <br>
          'udev_device_new_from_subsystem_sysname' [-Wnested-externs] <br>
          | misc-utils/lsblk.c:426:6: warning: assignment makes pointer
          from <br>
          integer without a cast [enabled by default] <br>
          | misc-utils/lsblk.c:430:3: warning: implicit declaration of
          function <br>
          'udev_device_get_property_value'
          [-Wimplicit-function-declaration] <br>
          | misc-utils/lsblk.c:430:3: warning: nested extern declaration
          of <br>
          'udev_device_get_property_value' [-Wnested-externs] <br>
          | misc-utils/lsblk.c:430:13: warning: assignment makes pointer
          from <br>
          integer without a cast [enabled by default] <br>
          | misc-utils/lsblk.c:434:13: warning: assignment makes pointer
          from <br>
          integer without a cast [enabled by default] <br>
          | misc-utils/lsblk.c:438:13: warning: assignment makes pointer
          from <br>
          integer without a cast [enabled by default] <br>
          | misc-utils/lsblk.c:442:13: warning: assignment makes pointer
          from <br>
          integer without a cast [enabled by default] <br>
          | misc-utils/lsblk.c:444:13: warning: assignment makes pointer
          from <br>
          integer without a cast [enabled by default] <br>
          | misc-utils/lsblk.c:446:13: warning: assignment makes pointer
          from <br>
          integer without a cast [enabled by default] <br>
          | misc-utils/lsblk.c:448:13: warning: assignment makes pointer
          from <br>
          integer without a cast [enabled by default] <br>
          | make[2]: *** [misc-utils/lsblk-lsblk.o] Error 1 <br>
          | make[2]: *** Waiting for unfinished jobs.... <br>
          | misc-utils/findmnt.c: In function 'get_tag_from_udev': <br>
          | misc-utils/findmnt.c:386:2: warning: implicit declaration of
          <br>
          function 'udev_device_new_from_subsystem_sysname' <br>
          [-Wimplicit-function-declaration] <br>
          | misc-utils/findmnt.c:386:2: warning: nested extern
          declaration of <br>
          'udev_device_new_from_subsystem_sysname' [-Wnested-externs] <br>
          | misc-utils/findmnt.c:386:6: warning: assignment makes
          pointer from <br>
          integer without a cast [enabled by default] <br>
          | misc-utils/findmnt.c:394:3: warning: implicit declaration of
          <br>
          function 'udev_device_get_property_value' <br>
          [-Wimplicit-function-declaration] <br>
          | misc-utils/findmnt.c:394:3: warning: nested extern
          declaration of <br>
          'udev_device_get_property_value' [-Wnested-externs] <br>
          | misc-utils/findmnt.c:394:8: warning: assignment makes
          pointer from <br>
          integer without a cast [enabled by default] <br>
          | misc-utils/findmnt.c:397:8: warning: assignment makes
          pointer from <br>
          integer without a cast [enabled by default] <br>
          | misc-utils/findmnt.c:400:8: warning: assignment makes
          pointer from <br>
          integer without a cast [enabled by default] <br>
          | misc-utils/findmnt.c:403:8: warning: assignment makes
          pointer from <br>
          integer without a cast [enabled by default] <br>
          | make[2]: *** [misc-utils/findmnt-findmnt.o] Error 1 <br>
          <br>
          <br>
          <br>
          On Fri, Sep 13, 2013 at 3:08 PM, Hans Beck&eacute;rus <a
            moz-do-not-send="true" class="moz-txt-link-rfc2396E"
            href="mailto:hans.beckerus@gmail.com">&lt;hans.beckerus@gmail.com&gt;</a>
          wrote: <br>
          <blockquote type="cite">On Fri, Sep 13, 2013 at 2:21 PM,
            Richard Purdie <br>
            <a moz-do-not-send="true" class="moz-txt-link-rfc2396E"
              href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>
            wrote: <br>
            <blockquote type="cite">On Fri, 2013-09-13 at 14:14 +0200,
              Hans Beck&eacute;rus wrote: <br>
              <blockquote type="cite">On Fri, Sep 13, 2013 at 11:53 AM,
                Hans Beck&eacute;rus <a moz-do-not-send="true"
                  class="moz-txt-link-rfc2396E"
                  href="mailto:hans.beckerus@gmail.com">&lt;hans.beckerus@gmail.com&gt;</a>
                wrote: <br>
                <blockquote type="cite">On Fri, Sep 13, 2013 at 11:08
                  AM, Hans Beck&eacute;rus <a moz-do-not-send="true"
                    class="moz-txt-link-rfc2396E"
                    href="mailto:hans.beckerus@gmail.com">&lt;hans.beckerus@gmail.com&gt;</a>
                  wrote: <br>
                  <blockquote type="cite">On Fri, Sep 13, 2013 at 11:01
                    AM, Hans Beck&eacute;rus <a moz-do-not-send="true"
                      class="moz-txt-link-rfc2396E"
                      href="mailto:hans.beckerus@gmail.com">&lt;hans.beckerus@gmail.com&gt;</a>
                    wrote: <br>
                    <blockquote type="cite">On Fri, Sep 13, 2013 at
                      10:52 AM, Richard Purdie <br>
                      <a moz-do-not-send="true"
                        class="moz-txt-link-rfc2396E"
                        href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>
                      wrote: <br>
                      <blockquote type="cite">On Fri, 2013-09-13 at
                        10:06 +0200, Hans Beck&eacute;rus wrote: <br>
                        <blockquote type="cite">On Fri, Sep 13, 2013 at
                          1:07 AM, Hans Beckerus <a
                            moz-do-not-send="true"
                            class="moz-txt-link-rfc2396E"
                            href="mailto:hans.beckerus@gmail.com">&lt;hans.beckerus@gmail.com&gt;</a>
                          wrote: <br>
                          <blockquote type="cite">On 2013-09-12 11:09,
                            Hans Beckerus wrote: <br>
                            <blockquote type="cite"> <br>
                              On 2013-09-12 8:02, Hans Beck&eacute;rus wrote: <br>
                              <br>
                            </blockquote>
                            I now got a somewhat better picture of what
                            is going on. I know what is <br>
                            failing, and why. But currently I have no
                            solution ready. Actually there are <br>
                            some nasty traps to get caught in here :(.
                            The problem is actually as simple <br>
                            as it is obvious. For all those native
                            packages that do work (this is a <br>
                            unique problem for native packages using
                            libtool), they all seem to share a <br>
                            common thing in their recipes: <br>
                            <br>
                            EXTRA_OECONF += "
                            --with-libtool-sysroot=${STAGING_DIR_NATIVE}"
                            <br>
                            <br>
                            Great! This is the way to do it. But, what
                            if someone forgets to do this? <br>
                            Well the answer is; it will most likely
                            *not* compile! <br>
                            Since libtool now has been fixed to
                            correctly pick up the sysroot from the <br>
                            compiler (using --print-sysroot) if
                            --with-libtool-sysroot is not specified <br>
                            it will try to execute ${CC}
                            --print-sysroot. Bummer! ${CC} is most
                            likely <br>
                            simply set to 'gcc' for native packages.
                            That is, the local host compiler is <br>
                            used. <br>
                            The sysroot for that is of course "/". And
                            it should be. Otherwise it will <br>
                            bring in the wrong set of header files and
                            libraries. But, there is another <br>
                            problem here. We should not let libtool use
                            "/"! Because even if we use the <br>
                            local host compiler for native packages, we
                            still use the oe-core upstream <br>
                            version of libtool, and that does not like
                            using "/" as sysroot.&nbsp; If it does <br>
                            everything becomes a mess. And that is
                            exactly what seems to happen now <br>
                            after the patch. Before the patch libtool
                            rendered the SDK for libtool <br>
                            enabled packages more or less useless. But,
                            it also saved us in the native <br>
                            case. Because if --with-libtool-sysroot was
                            set, the path was used directly, <br>
                            but if it was not set, lt_sysroot was also
                            kept unset. And here is the <br>
                            spooky part again. Having lt_sysroot set to
                            nothing seems to work just as <br>
                            well as setting it, provided it points to a
                            valid location!? This magic <br>
                            however did not work for the SDK which
                            requires the sysroot to be resolved <br>
                            correctly when not specified. So one
                            conclusion could be that, for native <br>
                            packages, enforcement of
                            --with-libtool-sysroot is a possible way
                            forward. <br>
                            Would this be safe? I think so, but I might
                            have overlooked something.&nbsp; I <br>
                            can also see in config.log that "configure"
                            is fed with a lot of arguments, <br>
                            even if EXTRA_OECONF is not specified. How
                            is this handled? How can I try to <br>
                            force this in for all native packages. I
                            looked into native.bbclass but it <br>
                            was not obvious to me how anything in there
                            actually ends up in arguments to <br>
                            "configure". Any hints? There are still a
                            lot of gaps in my analysis ;) If <br>
                            anyone feels like they can fill in the gaps,
                            please do. <br>
                            <br>
                            <br>
                          </blockquote>
                          Now this is getting interesting. When I said
                          before I could reproduce <br>
                          the problem in a world build I did not know
                          that it would actually <br>
                          succeed later. On a different build server!!
                          The previous analysis <br>
                          made is mostly true. But there is something
                          more. Why did it succeed <br>
                          on one of my servers but not the other one?
                          The way to find out was to <br>
                          compare what lt_sysroot is resolved to in both
                          cases. And there it <br>
                          was. On the machine for which it works,
                          lt_sysroot is now picked up <br>
                          from $CC --print-sysroot (due to the patch),
                          but the result is not <br>
                          "/", it is unset! Which is the same behavior
                          that can be observed <br>
                          without the libtool patch. So this is getting
                          even worse now. It is <br>
                          gcc and host dependent. If gcc has been built
                          with a sysroot of "/" is <br>
                          does not work since that will be picked up by
                          libtool, and is of <br>
                          course wrong in our case. But if lt_sysroot is
                          kept unset, libtool <br>
                          seems to be able to resolve a working default
                          using some other <br>
                          (unknown) mechanism. That is why we have not
                          seen this problem before, <br>
                          even though libtool actually did the wrong
                          thing before the patch. So <br>
                          this leaves me with at least this question; is
                          it actually correct <br>
                          that gcc has "/" as a compiled in sysroot on
                          some machines? <br>
                          <br>
                          I then saw two possible solutions: <br>
                          <br>
                          a) update the patch in libtool and if gcc
                          reports a single "/", skip <br>
                          it and leave lt_sysroot unset. <br>
                          b) consistency is the key. Let all native
                          packages force setting of a <br>
                          proper lt_sysroot&nbsp; using
                          --with-libtool-sysroot. <br>
                          <br>
                          This is also when I found this in
                          autotools.bbclass <br>
                          <br>
                          def append_libtool_sysroot(d): <br>
                          &nbsp;&nbsp;&nbsp;&nbsp; # Only supply libtool sysroot option for
                          non-native packages <br>
                          &nbsp;&nbsp;&nbsp;&nbsp; if not bb.data.inherits_class('native',
                          d): <br>
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return
                          '--with-libtool-sysroot=${STAGING_DIR_HOST}' <br>
                          &nbsp;&nbsp;&nbsp;&nbsp; return "" <br>
                          <br>
                          I can somewhat understand the rationale behind
                          this. If building for <br>
                          target you wish to point libtool to a proper
                          sysroot, and leaving it <br>
                          unset for native seems like a good idea. But I
                          do not think that <br>
                          really is the case. Even for native builds you
                          wish to point it to the <br>
                          sysroot for the libtool actually being used.
                          Not to what the compiler <br>
                          is pointing to, which is now the effect after
                          applying the libtool <br>
                          patch. But which is actually what you want
                          when building from an <br>
                          placement independent SDK toolchain for which
                          $CC is updated with a <br>
                          proper --sysroot argument to gcc automatically
                          when the environment <br>
                          script is sourced. <br>
                          <br>
                          So my propasal now is to update
                          autotools.bbclass and for native <br>
                          packages set
                          -with-libtool-sysroot=${STAGING_DIR_NATIVE}.
                          This should <br>
                          cover all the corner cases and work in all
                          different combinations. <br>
                          Again, consistency is the key. But I still
                          need to try it. Problem now <br>
                          is that I need to wait until I have access to
                          the machine for which it <br>
                          currently does not work to verify it properly.
                          <br>
                          <br>
                          Please advise. Does anyone object strongly to
                          this idea? <br>
                        </blockquote>
                        <br>
                        Sadly its not the right thing to do. The purpose
                        of a sysroot option is <br>
                        to say "compile and link against things in this
                        subdirectory, do not <br>
                        look outside it". Our native binaries need to
                        use the system libc and <br>
                        headers. They are therefore expected to look
                        outside STAGING_DIR_NATIVE <br>
                        if they don't find what they need in there.
                        Native is really a special <br>
                        hybrid case. <br>
                      </blockquote>
                    </blockquote>
                  </blockquote>
                  Ok. Now I am with you :) Had to get some food and give
                  this a second <br>
                  thought and I definitely agree. <br>
                  Patching autotools.bbclass is not the right thing to
                  do. Most likely a <br>
                  package wish to use the same sysroot as the compiler,
                  but sometimes it <br>
                  does not. The "sometimes" here is the troll! Looking
                  at the libtool <br>
                  package itself you can see that it is setting <br>
                  -with-libtool-sysroot=${STAGING_DIR_NATIVE}. But that
                  is for that <br>
                  package. Does not mean all of them wish to have it
                  like that. The real <br>
                  bug here (the second one) seems to be that libtool
                  internals does not <br>
                  handle a sysroot of "/" very well. It works fine if
                  sysroot is <br>
                  undefined unless you really wish to point it to
                  somewhere special, <br>
                  like in the case of the SDK for which you always wish
                  to point it to <br>
                  the sysroot of the compiler and which is never going
                  to be "/". <br>
                  I think, and I am up for other suggestions here, that
                  the only sane <br>
                  fix (or workaround) is to trigger on the "/" and unset
                  lt_sysroot and <br>
                  thus behave as it did before the patch was applied.
                  This fix should go <br>
                  into libtool.m4. I can so far see no danger in doing
                  this and should <br>
                  be bug-compatible with previous behavior. Also it will
                  make sure the <br>
                  SDK works placement independent which was not the case
                  before the <br>
                  patch was applied. <br>
                  <br>
                  Thanks <br>
                  Hans <br>
                  . <br>
                  <br>
                  <br>
                  <br>
                  <blockquote type="cite">
                    <blockquote type="cite">Here I am not with you
                      really. Yes, the sysroot purpose is exactly what
                      you say. <br>
                      But, the sysroot for libtool *is* different. It
                      has nothing to do <br>
                      really with what gcc is using, it just happens to
                      be the same on <br>
                      standard systems. The purpose of the libtool
                      sysroot is to point to <br>
                      libtools own sysroot, and this might not actually
                      be the same as the <br>
                      compiler sysroot. As in our case. Since for native
                      packages, gcc and <br>
                      libtool are executed in different context, libtool
                      *must* point to its <br>
                      proper location for which it was built and that is
                      STAGING_DIR_NATIVE. <br>
                      <br>
                      <blockquote type="cite"> <br>
                        So things should be working if "/" is specified
                        as the sysroot, or its <br>
                        not specified at all. I think there are deeper
                        bugs in libtool we're <br>
                        uncovering :( <br>
                        <br>
                        When I first saw the patch, it looked like the
                        correct thing to be doing <br>
                        but it now seems it may uncover further bugs
                        which are going to need to <br>
                        get fixed before we can take this patch :(. <br>
                        <br>
                      </blockquote>
                      I am testing this second patch now in a world
                      build and so far <br>
                      everything looks good. <br>
                      <br>
                    </blockquote>
                    Btw, what about the first alternative? Patching "/"
                    to nothing in <br>
                    libtool. Having lt_sysroot unset seems to work ok. <br>
                    I agree that patching autotools.bbclass might be
                    wrong. It seems my <br>
                    patch in libtool only cause problems if gcc return
                    sysroot as "/", not <br>
                    when it return nothing. <br>
                    <br>
                  </blockquote>
                </blockquote>
                Guys, I need your feedback on this. Is it worth trying
                this out and <br>
                testing a world build or should I simply drop it? <br>
                I have a new patch in libtool.m4 that now unsets
                lt_sysroot if $CC <br>
                -print-sysroot returns "/". But I am in some sense
                confused here since <br>
                on my bigger machine (for which gcc sets nothing)
                forcing it to return <br>
                "/" and let lt_sysroot become=/ still works! So this
                also seems to be <br>
                very host dependent. I need to try this out on the
                machine that I <br>
                could really reproduce the build errors on. <br>
              </blockquote>
              <br>
              "/" and no sysroot should behave exactly the same. If they
              do not, that <br>
              is a bug in libtool's code. I'd be fine with a check which
              unsets it in <br>
              that case though. It masks another issue but we have to
              take these one <br>
              at a time. I do believe this problem worth digging into.
              Whether we can <br>
              get the fix in for the 1.5 release I'm not sure but we
              will want to <br>
              address it in 1.6 regardless. <br>
              <br>
            </blockquote>
            Agree. Since all my patch did initially was to make sure gcc
            was <br>
            queried when --with-libtool-sysroot was not specified this
            is the only <br>
            possible reason I can think of that causes it to break like
            this. And <br>
            there is only one side on this coin. The result before the
            patch if a <br>
            sysroot *was* specified is the same now also after the
            patch. I will <br>
            get back later with a status update on my world build. Will
            probably <br>
            take all weekend since it is a simple dual-core ARM
            mini-server :( <br>
            I am not really concerned about what release this is
            targeting. I <br>
            consider this a workaround until I can dig deeper into what
            is <br>
            actually going wrong. My primary goal is to make sure that
            the SDK <br>
            does not break as it did before when installed in different
            paths. Of <br>
            course that must not affect legacy features so hopefully
            this <br>
            workaround eliminates that. <br>
            <br>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
    The current patch looks good so far. I am still running a world
    build on my "failing" host and no errors as of yet. The packages
    that failed before has now passed. Should I make a v5 out of this
    and then someone else (Saul?) can give it an extra spin?<br>
    <br>
    <blockquote cite="mid:5233538E.9020404@gmail.com" type="cite">
      <blockquote cite="mid:52335040.101@linux.intel.com" type="cite">
        <blockquote type="cite">
          <blockquote type="cite"> Thanks. <br>
            Hans <br>
            <br>
            <br>
            <blockquote type="cite">Cheers, <br>
              <br>
              Richard <br>
              <br>
              <br>
            </blockquote>
          </blockquote>
          <br>
          <br>
        </blockquote>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------000101060706080009090202--
