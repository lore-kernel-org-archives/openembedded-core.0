Return-Path: <hans.beckerus@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id A992760FDF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 13:08:49 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id m6so1093738oag.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 06:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=n+AKY05oNBMpAAi2myaOLxCV2pBzwnykIRyEgnfLRJE=;
	b=ZXDryaE6bYtYp3ymylYbe0n20FTURSx1jKq1ELVSutmjnyckUMps/ZaUXaVQmGS5mg
	DP6mMjsQhN3bNZo9F5ssoi2Wc4V/6JeNqbXZv2ziYppYOXTYPEZLjnuOa3UK4K13V1iz
	4KYmgFBshUrFDQ6cZ4n+wp0uejLsIdX4pH9MseBlgqy1e/h+eJE6c3WfsEpm80f4Qkcc
	pz02H+2LXdz+fJJh8tSeH28eg99wApV/jUiWK4+cQw5H7vv6pVjP5/x4Lh7VX5IL/K1Y
	IitVi2lbHX36KeUZHddSWiRlbZpqR1YqwEeI22LmLQEwitG2U07Nyi+OYIuiNkpwUhAd
	Vemg==
MIME-Version: 1.0
X-Received: by 10.60.44.9 with SMTP id a9mr1783772oem.67.1379077730936; Fri,
	13 Sep 2013 06:08:50 -0700 (PDT)
Received: by 10.182.44.8 with HTTP; Fri, 13 Sep 2013 06:08:50 -0700 (PDT)
In-Reply-To: <1379074896.3484.262.camel@ted>
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
	<CAFyqS9pQdQMSBJ04Rz+AeRkfgZbPDZAsTK6DPerRdiB5LHRQ+w@mail.gmail.com>
	<1379074896.3484.262.camel@ted>
Date: Fri, 13 Sep 2013 15:08:50 +0200
Message-ID: <CAFyqS9q1RMXjV-L3M3ZGz+Bw2Ky81WjDQSLmdZJUmm2yp5-pqg@mail.gmail.com>
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
X-List-Received-Date: Fri, 13 Sep 2013 13:08:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2013 at 2:21 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2013-09-13 at 14:14 +0200, Hans Beck=E9rus wrote:
>> On Fri, Sep 13, 2013 at 11:53 AM, Hans Beck=E9rus <hans.beckerus@gmail.c=
om> wrote:
>> > On Fri, Sep 13, 2013 at 11:08 AM, Hans Beck=E9rus <hans.beckerus@gmail=
.com> wrote:
>> >> On Fri, Sep 13, 2013 at 11:01 AM, Hans Beck=E9rus <hans.beckerus@gmai=
l.com> wrote:
>> >>> On Fri, Sep 13, 2013 at 10:52 AM, Richard Purdie
>> >>> <richard.purdie@linuxfoundation.org> wrote:
>> >>>> On Fri, 2013-09-13 at 10:06 +0200, Hans Beck=E9rus wrote:
>> >>>>> On Fri, Sep 13, 2013 at 1:07 AM, Hans Beckerus <hans.beckerus@gmai=
l.com> wrote:
>> >>>>> > On 2013-09-12 11:09, Hans Beckerus wrote:
>> >>>>> >>
>> >>>>> >> On 2013-09-12 8:02, Hans Beck=E9rus wrote:
>> >>>>> >>
>> >>>>> > I now got a somewhat better picture of what is going on. I know =
what is
>> >>>>> > failing, and why. But currently I have no solution ready. Actual=
ly there are
>> >>>>> > some nasty traps to get caught in here :(. The problem is actual=
ly as simple
>> >>>>> > as it is obvious. For all those native packages that do work (th=
is is a
>> >>>>> > unique problem for native packages using libtool), they all seem=
 to share a
>> >>>>> > common thing in their recipes:
>> >>>>> >
>> >>>>> > EXTRA_OECONF +=3D " --with-libtool-sysroot=3D${STAGING_DIR_NATIV=
E}"
>> >>>>> >
>> >>>>> > Great! This is the way to do it. But, what if someone forgets to=
 do this?
>> >>>>> > Well the answer is; it will most likely *not* compile!
>> >>>>> > Since libtool now has been fixed to correctly pick up the sysroo=
t from the
>> >>>>> > compiler (using --print-sysroot) if --with-libtool-sysroot is no=
t specified
>> >>>>> > it will try to execute ${CC} --print-sysroot. Bummer! ${CC} is m=
ost likely
>> >>>>> > simply set to 'gcc' for native packages. That is, the local host=
 compiler is
>> >>>>> > used.
>> >>>>> > The sysroot for that is of course "/". And it should be. Otherwi=
se it will
>> >>>>> > bring in the wrong set of header files and libraries. But, there=
 is another
>> >>>>> > problem here. We should not let libtool use "/"! Because even if=
 we use the
>> >>>>> > local host compiler for native packages, we still use the oe-cor=
e upstream
>> >>>>> > version of libtool, and that does not like using "/" as sysroot.=
  If it does
>> >>>>> > everything becomes a mess. And that is exactly what seems to hap=
pen now
>> >>>>> > after the patch. Before the patch libtool rendered the SDK for l=
ibtool
>> >>>>> > enabled packages more or less useless. But, it also saved us in =
the native
>> >>>>> > case. Because if --with-libtool-sysroot was set, the path was us=
ed directly,
>> >>>>> > but if it was not set, lt_sysroot was also kept unset. And here =
is the
>> >>>>> > spooky part again. Having lt_sysroot set to nothing seems to wor=
k just as
>> >>>>> > well as setting it, provided it points to a valid location!? Thi=
s magic
>> >>>>> > however did not work for the SDK which requires the sysroot to b=
e resolved
>> >>>>> > correctly when not specified. So one conclusion could be that, f=
or native
>> >>>>> > packages, enforcement of --with-libtool-sysroot is a possible wa=
y forward.
>> >>>>> > Would this be safe? I think so, but I might have overlooked some=
thing.  I
>> >>>>> > can also see in config.log that "configure" is fed with a lot of=
 arguments,
>> >>>>> > even if EXTRA_OECONF is not specified. How is this handled? How =
can I try to
>> >>>>> > force this in for all native packages. I looked into native.bbcl=
ass but it
>> >>>>> > was not obvious to me how anything in there actually ends up in =
arguments to
>> >>>>> > "configure". Any hints? There are still a lot of gaps in my anal=
ysis ;) If
>> >>>>> > anyone feels like they can fill in the gaps, please do.
>> >>>>> >
>> >>>>> >
>> >>>>> Now this is getting interesting. When I said before I could reprod=
uce
>> >>>>> the problem in a world build I did not know that it would actually
>> >>>>> succeed later. On a different build server!! The previous analysis
>> >>>>> made is mostly true. But there is something more. Why did it succe=
ed
>> >>>>> on one of my servers but not the other one? The way to find out wa=
s to
>> >>>>> compare what lt_sysroot is resolved to in both cases. And there it
>> >>>>> was. On the machine for which it works, lt_sysroot is now picked u=
p
>> >>>>> from $CC --print-sysroot (due to the patch), but the result is not
>> >>>>> "/", it is unset! Which is the same behavior that can be observed
>> >>>>> without the libtool patch. So this is getting even worse now. It i=
s
>> >>>>> gcc and host dependent. If gcc has been built with a sysroot of "/=
" is
>> >>>>> does not work since that will be picked up by libtool, and is of
>> >>>>> course wrong in our case. But if lt_sysroot is kept unset, libtool
>> >>>>> seems to be able to resolve a working default using some other
>> >>>>> (unknown) mechanism. That is why we have not seen this problem bef=
ore,
>> >>>>> even though libtool actually did the wrong thing before the patch.=
 So
>> >>>>> this leaves me with at least this question; is it actually correct
>> >>>>> that gcc has "/" as a compiled in sysroot on some machines?
>> >>>>>
>> >>>>> I then saw two possible solutions:
>> >>>>>
>> >>>>> a) update the patch in libtool and if gcc reports a single "/", sk=
ip
>> >>>>> it and leave lt_sysroot unset.
>> >>>>> b) consistency is the key. Let all native packages force setting o=
f a
>> >>>>> proper lt_sysroot  using --with-libtool-sysroot.
>> >>>>>
>> >>>>> This is also when I found this in autotools.bbclass
>> >>>>>
>> >>>>> def append_libtool_sysroot(d):
>> >>>>>     # Only supply libtool sysroot option for non-native packages
>> >>>>>     if not bb.data.inherits_class('native', d):
>> >>>>>         return '--with-libtool-sysroot=3D${STAGING_DIR_HOST}'
>> >>>>>     return ""
>> >>>>>
>> >>>>> I can somewhat understand the rationale behind this. If building f=
or
>> >>>>> target you wish to point libtool to a proper sysroot, and leaving =
it
>> >>>>> unset for native seems like a good idea. But I do not think that
>> >>>>> really is the case. Even for native builds you wish to point it to=
 the
>> >>>>> sysroot for the libtool actually being used. Not to what the compi=
ler
>> >>>>> is pointing to, which is now the effect after applying the libtool
>> >>>>> patch. But which is actually what you want when building from an
>> >>>>> placement independent SDK toolchain for which $CC is updated with =
a
>> >>>>> proper --sysroot argument to gcc automatically when the environmen=
t
>> >>>>> script is sourced.
>> >>>>>
>> >>>>> So my propasal now is to update autotools.bbclass and for native
>> >>>>> packages set -with-libtool-sysroot=3D${STAGING_DIR_NATIVE}. This s=
hould
>> >>>>> cover all the corner cases and work in all different combinations.
>> >>>>> Again, consistency is the key. But I still need to try it. Problem=
 now
>> >>>>> is that I need to wait until I have access to the machine for whic=
h it
>> >>>>> currently does not work to verify it properly.
>> >>>>>
>> >>>>> Please advise. Does anyone object strongly to this idea?
>> >>>>
>> >>>> Sadly its not the right thing to do. The purpose of a sysroot optio=
n is
>> >>>> to say "compile and link against things in this subdirectory, do no=
t
>> >>>> look outside it". Our native binaries need to use the system libc a=
nd
>> >>>> headers. They are therefore expected to look outside STAGING_DIR_NA=
TIVE
>> >>>> if they don't find what they need in there. Native is really a spec=
ial
>> >>>> hybrid case.
>> > Ok. Now I am with you :) Had to get some food and give this a second
>> > thought and I definitely agree.
>> > Patching autotools.bbclass is not the right thing to do. Most likely a
>> > package wish to use the same sysroot as the compiler, but sometimes it
>> > does not. The "sometimes" here is the troll! Looking at the libtool
>> > package itself you can see that it is setting
>> > -with-libtool-sysroot=3D${STAGING_DIR_NATIVE}. But that is for that
>> > package. Does not mean all of them wish to have it like that. The real
>> > bug here (the second one) seems to be that libtool internals does not
>> > handle a sysroot of "/" very well. It works fine if sysroot is
>> > undefined unless you really wish to point it to somewhere special,
>> > like in the case of the SDK for which you always wish to point it to
>> > the sysroot of the compiler and which is never going to be "/".
>> > I think, and I am up for other suggestions here, that the only sane
>> > fix (or workaround) is to trigger on the "/" and unset lt_sysroot and
>> > thus behave as it did before the patch was applied. This fix should go
>> > into libtool.m4. I can so far see no danger in doing this and should
>> > be bug-compatible with previous behavior. Also it will make sure the
>> > SDK works placement independent which was not the case before the
>> > patch was applied.
>> >
>> > Thanks
>> > Hans
>> > .
>> >
>> >
>> >
>> >>> Here I am not with you really. Yes, the sysroot purpose is exactly w=
hat you say.
>> >>> But, the sysroot for libtool *is* different. It has nothing to do
>> >>> really with what gcc is using, it just happens to be the same on
>> >>> standard systems. The purpose of the libtool sysroot is to point to
>> >>> libtools own sysroot, and this might not actually be the same as the
>> >>> compiler sysroot. As in our case. Since for native packages, gcc and
>> >>> libtool are executed in different context, libtool *must* point to i=
ts
>> >>> proper location for which it was built and that is STAGING_DIR_NATIV=
E.
>> >>>
>> >>>>
>> >>>> So things should be working if "/" is specified as the sysroot, or =
its
>> >>>> not specified at all. I think there are deeper bugs in libtool we'r=
e
>> >>>> uncovering :(
>> >>>>
>> >>>> When I first saw the patch, it looked like the correct thing to be =
doing
>> >>>> but it now seems it may uncover further bugs which are going to nee=
d to
>> >>>> get fixed before we can take this patch :(.
>> >>>>
>> >>> I am testing this second patch now in a world build and so far
>> >>> everything looks good.
>> >>>
>> >> Btw, what about the first alternative? Patching "/" to nothing in
>> >> libtool. Having lt_sysroot unset seems to work ok.
>> >> I agree that patching autotools.bbclass might be wrong. It seems my
>> >> patch in libtool only cause problems if gcc return sysroot as "/", no=
t
>> >> when it return nothing.
>> >>
>> Guys, I need your feedback on this. Is it worth trying this out and
>> testing a world build or should I simply drop it?
>> I have a new patch in libtool.m4 that now unsets lt_sysroot if $CC
>> -print-sysroot returns "/". But I am in some sense confused here since
>> on my bigger machine (for which gcc sets nothing) forcing it to return
>> "/" and let lt_sysroot become=3D/ still works! So this also seems to be
>> very host dependent. I need to try this out on the machine that I
>> could really reproduce the build errors on.
>
> "/" and no sysroot should behave exactly the same. If they do not, that
> is a bug in libtool's code. I'd be fine with a check which unsets it in
> that case though. It masks another issue but we have to take these one
> at a time. I do believe this problem worth digging into. Whether we can
> get the fix in for the 1.5 release I'm not sure but we will want to
> address it in 1.6 regardless.
>
Agree. Since all my patch did initially was to make sure gcc was
queried when --with-libtool-sysroot was not specified this is the only
possible reason I can think of that causes it to break like this. And
there is only one side on this coin. The result before the patch if a
sysroot *was* specified is the same now also after the patch. I will
get back later with a status update on my world build. Will probably
take all weekend since it is a simple dual-core ARM mini-server :(
I am not really concerned about what release this is targeting. I
consider this a workaround until I can dig deeper into what is
actually going wrong. My primary goal is to make sure that the SDK
does not break as it did before when installed in different paths. Of
course that must not affect legacy features so hopefully this
workaround eliminates that.

Thanks.
Hans


> Cheers,
>
> Richard
>
>

