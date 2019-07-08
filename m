Return-Path: <aehs29@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id A11007D8DC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 20:55:15 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id v18so17329206ljh.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2019 13:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LEgJhQMGpWcOQOtX9gWMmVJGjlemNf08wP8l6OK4rtg=;
	b=QlVjm1fa+rlY2e3Wamls1EmmO7AjC20rb/MPoQML9syscsu5KsdSMg9uJjDLweDyXX
	cMXeTHqZuFCImUhe87wo03SpSWieKz/73SAbhVGE/6uLPJvRIXF+h1HzCLE23d3Yawc5
	4+WGRUNc7kXhLmTBWjmlJtQey2++zTBESjPKANvtmXG/TRvqyrPrRLtKU308SDITd1XC
	SVKJ449my6mpn9S+KJBg2lBsToG97EqYKap8LxFr1YA4NoQh9SDRrcPxohHe+qjgCD44
	lEhh+yyvw3IHWToiy91gu1mbU0fG4MHBDuW3e7ubO2QFCYSGWWg3ST92FgfWqjWD1Sf6
	KurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LEgJhQMGpWcOQOtX9gWMmVJGjlemNf08wP8l6OK4rtg=;
	b=gVb/ZsbW5Wo5nI0mSHThRuapMoweIHJymMU3c43JUdXB/VRdY4x6F2JpZOsxdv0v7W
	LtkBPV8KaI3czVswO1cd3hvbL+FmZw9zEBctOqseOgyX+WuU/+BqM8vZHafSaPLZp5j1
	jsoSQ/jAyH0jJ3D4CcC8s3Fom1pTiO1svjUYcYgARw9ERRYHRlb+66AO8lF+EGkdTX59
	58cgv7Rl5nd9hduWYzWn9ZwKHWR+opYql0bkxdWstzi/53i0KiEnnfzabGCkDwI2/CQx
	VWGFjJM/IuejxvosSVYey2TywpPfDLQbhj95TkDRd42QIICZRu5hZ1q1p1UfXo/Tfuwp
	10UA==
X-Gm-Message-State: APjAAAWaEtlu6fCZZUyEENpPW7Y6qPKLqG/Pn+67LdAtLGNuWz8yYx6I
	F1TJMA63gv1JICbUxRmQFL1VQxcITZVaUoEhkv4=
X-Google-Smtp-Source: APXvYqxp3wzHP+wxr0yLkEDMEG/2p8Uv1ElCr6LTIDcSzRfY0TaZOOz5bKmhSLpGIvjZKCSwbC3oTSFU7UsXIDQPsbw=
X-Received: by 2002:a2e:3e01:: with SMTP id l1mr11518582lja.208.1562619316076; 
	Mon, 08 Jul 2019 13:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190706113909.11836-1-nathan@nathanrossi.com>
	<2305ec57f78c799c2e72273b5e00d5faa4d0cba8.camel@linuxfoundation.org>
In-Reply-To: <2305ec57f78c799c2e72273b5e00d5faa4d0cba8.camel@linuxfoundation.org>
From: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
Date: Mon, 8 Jul 2019 13:55:05 -0700
Message-ID: <CAHMutrZycSEeLODmPeFaa4Lf9+pgh6owRBV8iKAfN1yGjwknwg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] Add gnu testsuite execution for OEQA
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
X-List-Received-Date: Mon, 08 Jul 2019 20:55:16 -0000
Content-Type: multipart/alternative; boundary="000000000000410706058d31a9a7"

--000000000000410706058d31a9a7
Content-Type: text/plain; charset="UTF-8"

Hey guys,

On Sat, Jul 6, 2019 at 5:52 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2019-07-06 at 11:39 +0000, Nathan Rossi wrote:
> > This patch is an RFC for adding support to execute the gnu test suites
> for
> > binutils, gcc and glibc. With the intention for enabling automated test
> running
> > of these test suites within the OEQA framework such that they can be
> executed by
> > the Yocto Autobuilder.
> >
> > Please note that this patch is not a complete implementation and needs
> > additional work as well as changes based on comments and feedback from
> this RFC.
>
> This is rather cool, thanks!
>
> Looking at this was on my todo list once we got the existing OEQA,
> ptest and ltp setups working well. I'm very happy to have been beaten
> to it though.
>
> > The test suites covered need significant resources or build artifacts
> such
> > that running them on the target is undesirable which rules out the use
> of ptest.
> > Because of this the test suites can be run on the build host and if
> necessary
> > call out to the target.
> >
> > The following implementation creates a number of recipes that are used to
> > build/execute the test suites for the different components. The reason
> for
> > creating separate recipes is primarily due to dependencies and the need
> for
> > components in the sysroot. For example binutils has tests that use the C
> > compiler however binutils is a dependency for the C compiler and thus
> would
> > cause a dependency loop. The issue with sysroots occurs with dependence
> on
> > `*-initial` recipes and the test suites needing the non-initial version.
>
> I think this means you're working with something pre-warrior as we got
> rid of most of the *-initial recipes apart from libgcc-initial.
>

 Yup, I agree with this, and yes, we still have initial recipes, which is
in what Nathan based his work.


> > Some issues with splitting the recipes:
> >  - Rebuilds the recipe
> >    - Like gcc-cross-testsuite in this patch, could use a stashed builddir
> >  - Source is duplicated
> >    - gcc gets around this with shared source
> >  - Requires having the recipe files and maintaining them
> >    - Multiple versions of recipes
> >    - Multiple variants of recipes (-cross, -crosssdk, -native if desired)
>
> It might be possible to have multiple tasks in these recipes and have
> the later tasks depend on other pieces of the system like the C
> compiler, thereby avoiding the need for splitting if only the later
> tasks have the dependencies. Not sure if it would work or not but may
> be worth exploring.
>

Worth exploring but might end up being more convoluted than necessary IMO.
Benefit vs Complication issue.



> > Target execution is another issue with the test suites. Note that
> binutils
> > however does not require any target execution. In this patch both
> > qemu-linux-user and ssh target execution solutions are provided. For the
> > purposes of OE, qemu-linux-user may suffice as it has great success at
> executing
> > gcc and gcc-runtime tests with acceptable success at executing the glibc
> tests.
>
> I feel fairly strongly that we probably want to execute these kinds of
> tests under qemu system mode, not the user mode. The reason is that we
> want to be as close to the target environment as we can be and that
> qemu-user testing is at least as much of a test of qemu's emulation
> that it is the behaviour of the compiler or libc (libc in particular).
> I was thinking this and then later read you confirmed my suspicions
> below...
>

I believe the QEMU recipe splitting is also new in the tree, and Nathan
isn't basing his work on that,
so there might be some issues there.


>
> > The glibc test suite can be problematic to execute for a few reasons:
> >  - Requires access to the exact same filesystem as the build host
> >    - On physical targets and QEMU this requires NFS mounts
>
> We do have unfs support already under qemu which might make this
> possible.
>
> >  - Relies on exact syscall behaviour
> >    - Causes some issues where there are differences between
> qemu-linux-user and
> >      the target architectures kernel
>
> Right, this one worries me and pushes me to want to use qemu system
> mode.
>
> >  - Can consume significant resources (e.g. OOM, or worse trigger
> bugs/panics in
> >    kernel drivers)
>
> Any rough guide to what significant is here? ptest needs 1GB memory for
> example. qemu-system mode should limit that to the VMs at least?
>
> >  - Slow to execute
> >    - With QEMU system emulation it can take many hours
>
> We do have KVM acceleration for x86 and arm FWIW which is probably
> where we'd start testing this on the autobuilder.
>

Excuse me if I'm mistaken, but would this be something similar to what
we did for python3 optimization?


>
> >    - With some physical target architectures it can take days (e.g.
> microblaze)
> >
> > The significantly increased execution speed of qemu-linux-user vs qemu
> system
> > with glibc, and the ability for qemu-linux-user to be executed in
> parallel with
> > the gcc test suite makes it a strong solution for continuous integration
> > testing.
>
> Was that with or without KVM?
>
> > The following table shows results for the major test suite components
> running
> > with qemu-linux-user execution. The numbers represent 'failed
> tests'/'total
> > tests'. The machines used to run the tests are the `qemu*` machine for
> the
> > associated architecture, not all qemu machines available in oe-core were
> tested.
> > It is important to note that these results are only indicative of
> > qemu-linux-user behaviour and that there are a number of test failures
> that are
> > due to issues not specific to qemu-linux-user.
> >
> >         | gcc          | g++          | libstdc++   | binutils    | gas
>        | ld          | glibc
> > x86-64  |   589/135169 |   457/131913 |     1/13008 |     0/  236 |
>  0/ 1256 |   166/ 1975 |  1423/ 5991
> > arm     |   469/123905 |   365/128416 |    19/12788 |     0/  191 |
>  0/  872 |   155/ 1479 |    64/ 5130
> > aarch64 |   460/130904 |   364/128977 |     1/12789 |     0/  190 |
>  0/  442 |   157/ 1474 |    76/ 5882
> > powerpc | 18336/116624 |  6747/128636 |    33/12996 |     0/  187 |
>  1/  265 |   157/ 1352 |  1218/ 5110
> > mips64  |  1174/134744 |   401/130195 |    22/12780 |     0/  213 |
> 43/ 7245 |   803/ 1634 |  2032/ 5847
> > riscv64 |   456/106399 |   376/128427 |     1/12748 |     0/  185 |
>  0/  257 |   152/ 1062 |    88/ 5847
>
> I'd be interested to know how these numbers compare to the ssh
> execution...
>
> The binutils results look good! :)
>
>
This is awesome!, some are a little scary though (percentage wise)


> > This patch also introduces some OEQA test cases which cover running the
> test
> > suites. However in this specific patch it does not include any
> implementation
> > for the automated setup of qemu system emulation testing with runqemu
> and NFS
> > mounting for glibc tests. Also not included in these test cases is any
> known
> > test failure filtering.
>
> The known test failure filtering is something we can use the OEQA
> backend for, I'd envisage this being intergrated in a similar way to
> the way we added ptest/ltp/ltp-posix there.
>
> > I would also be interested in the opinion with regards to whether these
> test
> > suites should be executed as part of the existing Yocto Autobuilder
> instance.
>
> Short answer is yes. We won't run them all the time but when it makes
> sense and I'd happily see the autobuilder apart to be able to trigger
> these appropriately. We can probably run the KVM accelerated arches
> more often than the others.
>

Would we separate test cases into different sets/suites based on
importance?, and yes
I'd love to see this in the Yocto AB.


> Plenty of implementation details to further discuss but this is great
> to see!
>
> Cheers,
>
> Richard
>
>
This looks good, great work Nathan!, my only other comment would be that we
would
probably need two versions of the patches (one for thud) and one for
master/warrior where
some of the changes to *-initial recipes and qemu- system/user have
happened already.

Regards,

Alejandro



> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


-- 
*M.S. Alejandro Enedino Herna**ndez Samaniego*

--000000000000410706058d31a9a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hey guys,</div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 6, =
2019 at 5:52 AM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Sat, 2019-07-06 at 11:39=
 +0000, Nathan Rossi wrote:<br>
&gt; This patch is an RFC for adding support to execute the gnu test suites=
 for<br>
&gt; binutils, gcc and glibc. With the intention for enabling automated tes=
t running<br>
&gt; of these test suites within the OEQA framework such that they can be e=
xecuted by<br>
&gt; the Yocto Autobuilder.<br>
&gt; <br>
&gt; Please note that this patch is not a complete implementation and needs=
<br>
&gt; additional work as well as changes based on comments and feedback from=
 this RFC.<br>
<br>
This is rather cool, thanks!<br>
<br>
Looking at this was on my todo list once we got the existing OEQA,<br>
ptest and ltp setups working well. I&#39;m very happy to have been beaten<b=
r>
to it though.<br>
<br>
&gt; The test suites covered need significant resources or build artifacts =
such<br>
&gt; that running them on the target is undesirable which rules out the use=
 of ptest.<br>
&gt; Because of this the test suites can be run on the build host and if ne=
cessary<br>
&gt; call out to the target.<br>
&gt; <br>
&gt; The following implementation creates a number of recipes that are used=
 to<br>
&gt; build/execute the test suites for the different components. The reason=
 for<br>
&gt; creating separate recipes is primarily due to dependencies and the nee=
d for<br>
&gt; components in the sysroot. For example binutils has tests that use the=
 C<br>
&gt; compiler however binutils is a dependency for the C compiler and thus =
would<br>
&gt; cause a dependency loop. The issue with sysroots occurs with dependenc=
e on<br>
&gt; `*-initial` recipes and the test suites needing the non-initial versio=
n.<br>
<br>
I think this means you&#39;re working with something pre-warrior as we got<=
br>
rid of most of the *-initial recipes apart from libgcc-initial.<br></blockq=
uote><div><br></div><div>=C2=A0Yup, I agree with this, and yes, we still ha=
ve initial recipes, which is=20
in what Nathan based his work.
</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Some issues with splitting the recipes:<br>
&gt;=C2=A0 - Rebuilds the recipe<br>
&gt;=C2=A0 =C2=A0 - Like gcc-cross-testsuite in this patch, could use a sta=
shed builddir<br>
&gt;=C2=A0 - Source is duplicated<br>
&gt;=C2=A0 =C2=A0 - gcc gets around this with shared source<br>
&gt;=C2=A0 - Requires having the recipe files and maintaining them<br>
&gt;=C2=A0 =C2=A0 - Multiple versions of recipes<br>
&gt;=C2=A0 =C2=A0 - Multiple variants of recipes (-cross, -crosssdk, -nativ=
e if desired)<br>
<br>
It might be possible to have multiple tasks in these recipes and have<br>
the later tasks depend on other pieces of the system like the C<br>
compiler, thereby avoiding the need for splitting if only the later<br>
tasks have the dependencies. Not sure if it would work or not but may<br>
be worth exploring.<br></blockquote><div>=C2=A0</div><div>Worth exploring b=
ut might end up being more convoluted than necessary IMO.
<br>Benefit vs Complication issue.=C2=A0<br></div><div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Target execution is another issue with the test suites. Note that binu=
tils<br>
&gt; however does not require any target execution. In this patch both<br>
&gt; qemu-linux-user and ssh target execution solutions are provided. For t=
he<br>
&gt; purposes of OE, qemu-linux-user may suffice as it has great success at=
 executing<br>
&gt; gcc and gcc-runtime tests with acceptable success at executing the gli=
bc tests.<br>
<br>
I feel fairly strongly that we probably want to execute these kinds of<br>
tests under qemu system mode, not the user mode. The reason is that we<br>
want to be as close to the target environment as we can be and that<br>
qemu-user testing is at least as much of a test of qemu&#39;s emulation<br>
that it is the behaviour of the compiler or libc (libc in particular).<br>
I was thinking this and then later read you confirmed my suspicions<br>
below...<br></blockquote><div><br></div><div>I believe the QEMU recipe spli=
tting is also new in the tree, and Nathan=20
isn&#39;t basing his work on that,
<br>so there might be some issues there.=C2=A0<br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; The glibc test suite can be problematic to execute for a few reasons:<=
br>
&gt;=C2=A0 - Requires access to the exact same filesystem as the build host=
<br>
&gt;=C2=A0 =C2=A0 - On physical targets and QEMU this requires NFS mounts<b=
r>
<br>
We do have unfs support already under qemu which might make this<br>
possible.<br>
<br>
&gt;=C2=A0 - Relies on exact syscall behaviour<br>
&gt;=C2=A0 =C2=A0 - Causes some issues where there are differences between =
qemu-linux-user and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 the target architectures kernel<br>
<br>
Right, this one worries me and pushes me to want to use qemu system<br>
mode.<br>
<br>
&gt;=C2=A0 - Can consume significant resources (e.g. OOM, or worse trigger =
bugs/panics in<br>
&gt;=C2=A0 =C2=A0 kernel drivers)<br>
<br>
Any rough guide to what significant is here? ptest needs 1GB memory for<br>
example. qemu-system mode should limit that to the VMs at least?<br>
<br>
&gt;=C2=A0 - Slow to execute<br>
&gt;=C2=A0 =C2=A0 - With QEMU system emulation it can take many hours<br>
<br>
We do have KVM acceleration for x86 and arm FWIW which is probably<br>
where we&#39;d start testing this on the autobuilder.<br></blockquote><div>=
<br></div><div>Excuse me if I&#39;m mistaken, but would this be something s=
imilar to what
<br>we did for python3 optimization?=C2=A0<br></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 - With some physical target architectures it can take day=
s (e.g. microblaze)<br>
&gt; <br>
&gt; The significantly increased execution speed of qemu-linux-user vs qemu=
 system<br>
&gt; with glibc, and the ability for qemu-linux-user to be executed in para=
llel with<br>
&gt; the gcc test suite makes it a strong solution for continuous integrati=
on<br>
&gt; testing.<br>
<br>
Was that with or without KVM?<br>
<br>
&gt; The following table shows results for the major test suite components =
running<br>
&gt; with qemu-linux-user execution. The numbers represent &#39;failed test=
s&#39;/&#39;total<br>
&gt; tests&#39;. The machines used to run the tests are the `qemu*` machine=
 for the<br>
&gt; associated architecture, not all qemu machines available in oe-core we=
re tested.<br>
&gt; It is important to note that these results are only indicative of<br>
&gt; qemu-linux-user behaviour and that there are a number of test failures=
 that are<br>
&gt; due to issues not specific to qemu-linux-user.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| gcc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | g++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | libstdc++=C2=A0 =C2=A0| binut=
ils=C2=A0 =C2=A0 | gas=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ld=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | glibc<br>
&gt; x86-64=C2=A0 |=C2=A0 =C2=A0589/135169 |=C2=A0 =C2=A0457/131913 |=C2=A0=
 =C2=A0 =C2=A01/13008 |=C2=A0 =C2=A0 =C2=A00/=C2=A0 236 |=C2=A0 =C2=A0 =C2=
=A00/ 1256 |=C2=A0 =C2=A0166/ 1975 |=C2=A0 1423/ 5991<br>
&gt; arm=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0469/123905 |=C2=A0 =C2=A0365/1284=
16 |=C2=A0 =C2=A0 19/12788 |=C2=A0 =C2=A0 =C2=A00/=C2=A0 191 |=C2=A0 =C2=A0=
 =C2=A00/=C2=A0 872 |=C2=A0 =C2=A0155/ 1479 |=C2=A0 =C2=A0 64/ 5130<br>
&gt; aarch64 |=C2=A0 =C2=A0460/130904 |=C2=A0 =C2=A0364/128977 |=C2=A0 =C2=
=A0 =C2=A01/12789 |=C2=A0 =C2=A0 =C2=A00/=C2=A0 190 |=C2=A0 =C2=A0 =C2=A00/=
=C2=A0 442 |=C2=A0 =C2=A0157/ 1474 |=C2=A0 =C2=A0 76/ 5882<br>
&gt; powerpc | 18336/116624 |=C2=A0 6747/128636 |=C2=A0 =C2=A0 33/12996 |=
=C2=A0 =C2=A0 =C2=A00/=C2=A0 187 |=C2=A0 =C2=A0 =C2=A01/=C2=A0 265 |=C2=A0 =
=C2=A0157/ 1352 |=C2=A0 1218/ 5110<br>
&gt; mips64=C2=A0 |=C2=A0 1174/134744 |=C2=A0 =C2=A0401/130195 |=C2=A0 =C2=
=A0 22/12780 |=C2=A0 =C2=A0 =C2=A00/=C2=A0 213 |=C2=A0 =C2=A0 43/ 7245 |=C2=
=A0 =C2=A0803/ 1634 |=C2=A0 2032/ 5847<br>
&gt; riscv64 |=C2=A0 =C2=A0456/106399 |=C2=A0 =C2=A0376/128427 |=C2=A0 =C2=
=A0 =C2=A01/12748 |=C2=A0 =C2=A0 =C2=A00/=C2=A0 185 |=C2=A0 =C2=A0 =C2=A00/=
=C2=A0 257 |=C2=A0 =C2=A0152/ 1062 |=C2=A0 =C2=A0 88/ 5847<br>
<br>
I&#39;d be interested to know how these numbers compare to the ssh<br>
execution...<br>
<br>
The binutils results look good! :)<br>
<br></blockquote><div>=C2=A0</div><div>This is awesome!, some are a little =
scary though (percentage wise)=C2=A0<br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
&gt; This patch also introduces some OEQA test cases which cover running th=
e test<br>
&gt; suites. However in this specific patch it does not include any impleme=
ntation<br>
&gt; for the automated setup of qemu system emulation testing with runqemu =
and NFS<br>
&gt; mounting for glibc tests. Also not included in these test cases is any=
 known<br>
&gt; test failure filtering.<br>
<br>
The known test failure filtering is something we can use the OEQA<br>
backend for, I&#39;d envisage this being intergrated in a similar way to<br=
>
the way we added ptest/ltp/ltp-posix there.<br>
<br>
&gt; I would also be interested in the opinion with regards to whether thes=
e test<br>
&gt; suites should be executed as part of the existing Yocto Autobuilder in=
stance.<br>
<br>
Short answer is yes. We won&#39;t run them all the time but when it makes<b=
r>
sense and I&#39;d happily see the autobuilder apart to be able to trigger<b=
r>
these appropriately. We can probably run the KVM accelerated arches<br>
more often than the others.<br></blockquote><div><br></div>Would we separat=
e test cases into different sets/suites based on importance?,=20
and yes
<br><div>I&#39;d love to see this in the Yocto AB.=C2=A0</div><div><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Plenty of implementation details to further discuss but this is great<br>
to see!<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br></blockquote><div>=C2=A0</div><div>This looks good, great work Nathan!,=
 my only other comment would be that=20
we would
<br>probably need two versions of the patches (one for thud) and one for=20
master/warrior where
<br>some of the changes to *-initial recipes and qemu- system/user have=20
happened already.
<br>
<br>Regards,
<br>
<br>Alejandro=C2=A0<br></div><div><br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><div><div dir=3D"ltr"><div><b style=3D"font-size:12.8px">M.S. =
Alejandro Enedino Herna</b><b style=3D"font-size:12.8px">ndez Samaniego</b>=
</div></div></div></div></div></div></div></div></div></div></div>

--000000000000410706058d31a9a7--
