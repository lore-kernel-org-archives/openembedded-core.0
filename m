Return-Path: <hans.beckerus@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id C2BB560FDF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 12:14:45 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id va2so1015708obc.29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 05:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=lr//q7IHsW7zfz8MgIRrOoFEJnfi87yegzCsoZEmA2A=;
	b=vAJ8R1amDYU5+2x/wwpUL9ZQEpUyTt/56UfQ4hw02kJHr8ZNBsvC7dgsvbItxlbVKx
	6LQGRRLEn3Elxv/YTpNa59HhRM6AlyLFpHfTao76eOtGKD7ogobS1xbryNP8rPIqM/jd
	lMQzz6R4jQmbvEcxfo2dmozwpDuQlOWlGA3219JSSMFHGzgAdIo1pQ31xpxeJjurLiJK
	Iwqb/wotS1vVqpmpNeJa4ScTjcBn8groHUQyc7kcaoOq004s5WYmEjxIYkaoX17tfhjh
	rGDtM5dOLw8dnI4suyMGxnrFIRhdpIQ5Ym1yL/oJfP5P8WlZRplFZSA5m7f1lNAvMBii
	Y/5A==
MIME-Version: 1.0
X-Received: by 10.182.117.164 with SMTP id kf4mr8164obb.104.1379074487230;
	Fri, 13 Sep 2013 05:14:47 -0700 (PDT)
Received: by 10.182.44.8 with HTTP; Fri, 13 Sep 2013 05:14:47 -0700 (PDT)
In-Reply-To: <CAFyqS9oavyrMkDL_W8MM36_fA9p_mxweiCk17j470WTv4YFvYw@mail.gmail.com>
References: <1378825041-20190-1-git-send-email-hans.beckerus@gmail.com>
	<522F9030.3020804@linux.intel.com>
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
Date: Fri, 13 Sep 2013 14:14:47 +0200
Message-ID: <CAFyqS9pQdQMSBJ04Rz+AeRkfgZbPDZAsTK6DPerRdiB5LHRQ+w@mail.gmail.com>
From: =?ISO-8859-1?Q?Hans_Beck=E9rus?= <hans.beckerus@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Fri, 13 Sep 2013 12:14:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2013 at 11:53 AM, Hans Beck=E9rus <hans.beckerus@gmail.com>=
 wrote:
> On Fri, Sep 13, 2013 at 11:08 AM, Hans Beck=E9rus <hans.beckerus@gmail.co=
m> wrote:
>> On Fri, Sep 13, 2013 at 11:01 AM, Hans Beck=E9rus <hans.beckerus@gmail.c=
om> wrote:
>>> On Fri, Sep 13, 2013 at 10:52 AM, Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>>> On Fri, 2013-09-13 at 10:06 +0200, Hans Beck=E9rus wrote:
>>>>> On Fri, Sep 13, 2013 at 1:07 AM, Hans Beckerus <hans.beckerus@gmail.c=
om> wrote:
>>>>> > On 2013-09-12 11:09, Hans Beckerus wrote:
>>>>> >>
>>>>> >> On 2013-09-12 8:02, Hans Beck=E9rus wrote:
>>>>> >>
>>>>> > I now got a somewhat better picture of what is going on. I know wha=
t is
>>>>> > failing, and why. But currently I have no solution ready. Actually =
there are
>>>>> > some nasty traps to get caught in here :(. The problem is actually =
as simple
>>>>> > as it is obvious. For all those native packages that do work (this =
is a
>>>>> > unique problem for native packages using libtool), they all seem to=
 share a
>>>>> > common thing in their recipes:
>>>>> >
>>>>> > EXTRA_OECONF +=3D " --with-libtool-sysroot=3D${STAGING_DIR_NATIVE}"
>>>>> >
>>>>> > Great! This is the way to do it. But, what if someone forgets to do=
 this?
>>>>> > Well the answer is; it will most likely *not* compile!
>>>>> > Since libtool now has been fixed to correctly pick up the sysroot f=
rom the
>>>>> > compiler (using --print-sysroot) if --with-libtool-sysroot is not s=
pecified
>>>>> > it will try to execute ${CC} --print-sysroot. Bummer! ${CC} is most=
 likely
>>>>> > simply set to 'gcc' for native packages. That is, the local host co=
mpiler is
>>>>> > used.
>>>>> > The sysroot for that is of course "/". And it should be. Otherwise =
it will
>>>>> > bring in the wrong set of header files and libraries. But, there is=
 another
>>>>> > problem here. We should not let libtool use "/"! Because even if we=
 use the
>>>>> > local host compiler for native packages, we still use the oe-core u=
pstream
>>>>> > version of libtool, and that does not like using "/" as sysroot.  I=
f it does
>>>>> > everything becomes a mess. And that is exactly what seems to happen=
 now
>>>>> > after the patch. Before the patch libtool rendered the SDK for libt=
ool
>>>>> > enabled packages more or less useless. But, it also saved us in the=
 native
>>>>> > case. Because if --with-libtool-sysroot was set, the path was used =
directly,
>>>>> > but if it was not set, lt_sysroot was also kept unset. And here is =
the
>>>>> > spooky part again. Having lt_sysroot set to nothing seems to work j=
ust as
>>>>> > well as setting it, provided it points to a valid location!? This m=
agic
>>>>> > however did not work for the SDK which requires the sysroot to be r=
esolved
>>>>> > correctly when not specified. So one conclusion could be that, for =
native
>>>>> > packages, enforcement of --with-libtool-sysroot is a possible way f=
orward.
>>>>> > Would this be safe? I think so, but I might have overlooked somethi=
ng.  I
>>>>> > can also see in config.log that "configure" is fed with a lot of ar=
guments,
>>>>> > even if EXTRA_OECONF is not specified. How is this handled? How can=
 I try to
>>>>> > force this in for all native packages. I looked into native.bbclass=
 but it
>>>>> > was not obvious to me how anything in there actually ends up in arg=
uments to
>>>>> > "configure". Any hints? There are still a lot of gaps in my analysi=
s ;) If
>>>>> > anyone feels like they can fill in the gaps, please do.
>>>>> >
>>>>> >
>>>>> Now this is getting interesting. When I said before I could reproduce
>>>>> the problem in a world build I did not know that it would actually
>>>>> succeed later. On a different build server!! The previous analysis
>>>>> made is mostly true. But there is something more. Why did it succeed
>>>>> on one of my servers but not the other one? The way to find out was t=
o
>>>>> compare what lt_sysroot is resolved to in both cases. And there it
>>>>> was. On the machine for which it works, lt_sysroot is now picked up
>>>>> from $CC --print-sysroot (due to the patch), but the result is not
>>>>> "/", it is unset! Which is the same behavior that can be observed
>>>>> without the libtool patch. So this is getting even worse now. It is
>>>>> gcc and host dependent. If gcc has been built with a sysroot of "/" i=
s
>>>>> does not work since that will be picked up by libtool, and is of
>>>>> course wrong in our case. But if lt_sysroot is kept unset, libtool
>>>>> seems to be able to resolve a working default using some other
>>>>> (unknown) mechanism. That is why we have not seen this problem before=
,
>>>>> even though libtool actually did the wrong thing before the patch. So
>>>>> this leaves me with at least this question; is it actually correct
>>>>> that gcc has "/" as a compiled in sysroot on some machines?
>>>>>
>>>>> I then saw two possible solutions:
>>>>>
>>>>> a) update the patch in libtool and if gcc reports a single "/", skip
>>>>> it and leave lt_sysroot unset.
>>>>> b) consistency is the key. Let all native packages force setting of a
>>>>> proper lt_sysroot  using --with-libtool-sysroot.
>>>>>
>>>>> This is also when I found this in autotools.bbclass
>>>>>
>>>>> def append_libtool_sysroot(d):
>>>>>     # Only supply libtool sysroot option for non-native packages
>>>>>     if not bb.data.inherits_class('native', d):
>>>>>         return '--with-libtool-sysroot=3D${STAGING_DIR_HOST}'
>>>>>     return ""
>>>>>
>>>>> I can somewhat understand the rationale behind this. If building for
>>>>> target you wish to point libtool to a proper sysroot, and leaving it
>>>>> unset for native seems like a good idea. But I do not think that
>>>>> really is the case. Even for native builds you wish to point it to th=
e
>>>>> sysroot for the libtool actually being used. Not to what the compiler
>>>>> is pointing to, which is now the effect after applying the libtool
>>>>> patch. But which is actually what you want when building from an
>>>>> placement independent SDK toolchain for which $CC is updated with a
>>>>> proper --sysroot argument to gcc automatically when the environment
>>>>> script is sourced.
>>>>>
>>>>> So my propasal now is to update autotools.bbclass and for native
>>>>> packages set -with-libtool-sysroot=3D${STAGING_DIR_NATIVE}. This shou=
ld
>>>>> cover all the corner cases and work in all different combinations.
>>>>> Again, consistency is the key. But I still need to try it. Problem no=
w
>>>>> is that I need to wait until I have access to the machine for which i=
t
>>>>> currently does not work to verify it properly.
>>>>>
>>>>> Please advise. Does anyone object strongly to this idea?
>>>>
>>>> Sadly its not the right thing to do. The purpose of a sysroot option i=
s
>>>> to say "compile and link against things in this subdirectory, do not
>>>> look outside it". Our native binaries need to use the system libc and
>>>> headers. They are therefore expected to look outside STAGING_DIR_NATIV=
E
>>>> if they don't find what they need in there. Native is really a special
>>>> hybrid case.
> Ok. Now I am with you :) Had to get some food and give this a second
> thought and I definitely agree.
> Patching autotools.bbclass is not the right thing to do. Most likely a
> package wish to use the same sysroot as the compiler, but sometimes it
> does not. The "sometimes" here is the troll! Looking at the libtool
> package itself you can see that it is setting
> -with-libtool-sysroot=3D${STAGING_DIR_NATIVE}. But that is for that
> package. Does not mean all of them wish to have it like that. The real
> bug here (the second one) seems to be that libtool internals does not
> handle a sysroot of "/" very well. It works fine if sysroot is
> undefined unless you really wish to point it to somewhere special,
> like in the case of the SDK for which you always wish to point it to
> the sysroot of the compiler and which is never going to be "/".
> I think, and I am up for other suggestions here, that the only sane
> fix (or workaround) is to trigger on the "/" and unset lt_sysroot and
> thus behave as it did before the patch was applied. This fix should go
> into libtool.m4. I can so far see no danger in doing this and should
> be bug-compatible with previous behavior. Also it will make sure the
> SDK works placement independent which was not the case before the
> patch was applied.
>
> Thanks
> Hans
> .
>
>
>
>>> Here I am not with you really. Yes, the sysroot purpose is exactly what=
 you say.
>>> But, the sysroot for libtool *is* different. It has nothing to do
>>> really with what gcc is using, it just happens to be the same on
>>> standard systems. The purpose of the libtool sysroot is to point to
>>> libtools own sysroot, and this might not actually be the same as the
>>> compiler sysroot. As in our case. Since for native packages, gcc and
>>> libtool are executed in different context, libtool *must* point to its
>>> proper location for which it was built and that is STAGING_DIR_NATIVE.
>>>
>>>>
>>>> So things should be working if "/" is specified as the sysroot, or its
>>>> not specified at all. I think there are deeper bugs in libtool we're
>>>> uncovering :(
>>>>
>>>> When I first saw the patch, it looked like the correct thing to be doi=
ng
>>>> but it now seems it may uncover further bugs which are going to need t=
o
>>>> get fixed before we can take this patch :(.
>>>>
>>> I am testing this second patch now in a world build and so far
>>> everything looks good.
>>>
>> Btw, what about the first alternative? Patching "/" to nothing in
>> libtool. Having lt_sysroot unset seems to work ok.
>> I agree that patching autotools.bbclass might be wrong. It seems my
>> patch in libtool only cause problems if gcc return sysroot as "/", not
>> when it return nothing.
>>
Guys, I need your feedback on this. Is it worth trying this out and
testing a world build or should I simply drop it?
I have a new patch in libtool.m4 that now unsets lt_sysroot if $CC
-print-sysroot returns "/". But I am in some sense confused here since
on my bigger machine (for which gcc sets nothing) forcing it to return
"/" and let lt_sysroot become=3D/ still works! So this also seems to be
very host dependent. I need to try this out on the machine that I
could really reproduce the build errors on.

>> Thanks,
>> Hans
>>
>>>> Cheers,
>>>>
>>>> Richard
>>>>
>>>>
>>>>

