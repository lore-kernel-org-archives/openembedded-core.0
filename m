Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id C4E716E666
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 14:39:19 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id k142so28016474oib.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 07:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=QRfgZzu+M/YPh5vzPaI8auLs2vcDUUEZOxZTNbdTLhU=;
	b=e30azdDoNDwJ9Tpa/E/3STGKS0deDUpCJoQcvJvN1gTIXi046AI6xAe82Pd6xgNBzR
	RxpWMnic9I3PK8231GkA+MvA0+Tu8BRbH1O+l/TFc/2O7OjgecNXm3YOAfavPRKQZsqY
	x9f8hIBxQJwyaHSUq7m25EMJ7NDLPkp2DOs8QOzxRflbV/lv9dq9+Eo6DgaqxKCNebKt
	cs8o0UCtX9ptyjZt1O3nyWb7BWajCzUMFLu8IRYs4/VsbvX6dm3GDzFJTALEIpo6LkcQ
	uBGAooH6VXJuvryDPQqTZVWPcPyGBalbH3M63GjQN0Z3yQ7lcvjV95K0S4DFFSkXgK53
	m2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=QRfgZzu+M/YPh5vzPaI8auLs2vcDUUEZOxZTNbdTLhU=;
	b=GlWGsKScJXUCrRtSYurgGcwHGJ782en9Ln9uz5snTxHXaS/MPx4USlDacI5FAqyFLw
	HPxKDLBgeTZjEnGeIPjj0gBhuteXqsbdF7C45Q5thHeVkDlz2XZn2uBAkETX2/Kosu4V
	34Kt5t1bFNYwT6sSoXMaubhhvmRzlWIuNtVK6awPBR6ti3qi7yMC2MaWOlxu2JoeHu1v
	/+w8TSN0KzX3XYLoZ5S1rDs1YMkA2j4r3JrkuwMazrAhRm+P+7is/AM3eYbgE0jXtcwr
	tg1fVhkafWbHrIL1uq4t62wHm6WOb69krFZQDPslh7cqKlAK0zoXZjIf/R2ziYRWz+pA
	FFYQ==
X-Gm-Message-State: AOPr4FVzoheov/9+Q6Au2uUVoMzY1j0q88DLoeLXu8zcBawd+joDX5SYTHb8wSW/dwjkpmlVvsvTarSwK1+HfQ==
MIME-Version: 1.0
X-Received: by 10.157.17.107 with SMTP id p40mr1357077otp.144.1462286360075;
	Tue, 03 May 2016 07:39:20 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Tue, 3 May 2016 07:39:19 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1605030912110.17898@localhost.localdomain>
References: <alpine.LFD.2.20.1605030649490.20066@localhost.localdomain>
	<CADkTA4OwEaX6pCpuuiXxuMqY_++NLS+W6pnH0siNvXD0SwhWOg@mail.gmail.com>
	<alpine.LFD.2.20.1605030912110.17898@localhost.localdomain>
Date: Tue, 3 May 2016 10:39:19 -0400
Message-ID: <CADkTA4N+LvCos+qNDuANxEisezP3kZ9_DgtPTF4gNGhaKcoHXQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: how can i tell which default kernel config OE started with?
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
X-List-Received-Date: Tue, 03 May 2016 14:39:22 -0000
Content-Type: multipart/alternative; boundary=001a1141e9620d6daa0531f113c7

--001a1141e9620d6daa0531f113c7
Content-Type: text/plain; charset=UTF-8

On Tue, May 3, 2016 at 9:12 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

> On Tue, 3 May 2016, Bruce Ashfield wrote:
>
> >
> >
> > On Tue, May 3, 2016 at 6:53 AM, Robert P. J. Day <rpjday@crashcourse.ca>
> wrote:
> >
> >         (actually, working in wind river linux but i suspect the answer
> will
> >       be the same.)
> >
> >         i've defined a target board and, rather than supplying a full
> >       "defconfig" file as a starting point for kernel configuration, my
> BSP
> >       layer starts by applying a "kernel_baseline.cfg" file which
> contains
> >       only a couple hundred settings that i am particularly interested
> in.
> >
> >         so, given that, how can i tell what OE chose as a starting point
> for
> >       a .config file before beginning to apply my kernel config
> fragments?
> >       i'm poking around in the log files of the build, but i can't seem
> to
> >       see where the "configme" process selects a starting point. am i
> just
> >       missing the obvious? i want to see the .config file *before* any
> of my
> >       fragments are applied.
> >
> >
> > If you haven't specified a defconfig (in-tree, or in your layer),
> > and are only using fragments, then it will be the first fragment.
> > There's no logic to go out and find a baseline, since it would
> > almost always not be what someone wanted.
>
>   ok, i'm going to ask a few follow-up questions since i clearly don't
> totally understand the full kernel configuration process.
>
>
That's because it varies a bit, based on the kernel and options :)


>   i have a BSP layer for a target board that first specifies a
> "kernel_baseline.cfg" fragment file which contains just those kernel
> config settings i want to make sure are set, and that file is just
> over 200 lines long. i also drag in a few other *very* short .cfg
> files. but in the end, the .config file generated under
> .../linux-windriver/4.1-r0/linux-cxii-standard-build/ is almost 2,200
> lines long. where did all that extra content come from?
>


The .config is always the setting for all reachable kernel options. Some
are set in fragments, or defconfigs, others are the result of  'select'
and defaults by the kernel itself, etc.

If you run savedefconfig, you can see the non default options that were
set.


>
>   i'm assuming (and i could be wrong here) that since i'm using the
> line:
>
> TARGET_SUPPORTED_KTYPES = "standard"
>
> i'm automatically incorporating "standard"-related content under
> .../kernel-meta/ktypes/standard? as in, the files:
>
>   * standard.cfg
>   * standard.scc
>
> or am i mistaken? from where comes all that additional content that
> ends up in the final .config?  is there a record of it in a log file
> somewhere?
>

If you are not supplying a defconfig, and are inheriting the standard
kernel options, then yes, you'd be getting those fragments as well.

You can look in the work-shared/ .. kernel-source/.kernel-meta/ directory
for the meta-series (if using linux-yocto derived kernels), and that will
reference
everything that was used to configure and patch the kernel. If it isn't in
there,
it was a default or select by the kernel itself.

Bruce


>
>   couple more kernel config-related questions coming shortly ...
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1141e9620d6daa0531f113c7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, May 3, 2016 at 9:12 AM, Robert P. J. Day <span dir=3D"ltr">&lt;=
<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcour=
se.ca</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;borde=
r-left-color:rgb(204,204,204);padding-left:1ex"><span class=3D"">On Tue, 3 =
May 2016, Bruce Ashfield wrote:<br>
<br>
&gt;<br>
&gt;<br>
&gt; On Tue, May 3, 2016 at 6:53 AM, Robert P. J. Day &lt;<a href=3D"mailto=
:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 (actually, working in wind river linu=
x but i suspect the answer will<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0be the same.)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 i&#39;ve defined a target board and, =
rather than supplying a full<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;defconfig&quot; file as a starting poi=
nt for kernel configuration, my BSP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0layer starts by applying a &quot;kernel_base=
line.cfg&quot; file which contains<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0only a couple hundred settings that i am par=
ticularly interested in.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 so, given that, how can i tell what O=
E chose as a starting point for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0a .config file before beginning to apply my =
kernel config fragments?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0i&#39;m poking around in the log files of th=
e build, but i can&#39;t seem to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0see where the &quot;configme&quot; process s=
elects a starting point. am i just<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0missing the obvious? i want to see the .conf=
ig file *before* any of my<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fragments are applied.<br>
&gt;<br>
&gt;<br>
&gt; If you haven&#39;t specified a defconfig (in-tree, or in your layer),<=
br>
&gt; and are only using fragments, then it will be the first fragment.<br>
&gt; There&#39;s no logic to go out and find a baseline, since it would<br>
&gt; almost always not be what someone wanted.<br>
<br>
</span>=C2=A0 ok, i&#39;m going to ask a few follow-up questions since i cl=
early don&#39;t<br>
totally understand the full kernel configuration process.<br>
<br></blockquote><div><br></div><div>That&#39;s because it varies a bit, ba=
sed on the kernel and options :)</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;borde=
r-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">
=C2=A0 i have a BSP layer for a target board that first specifies a<br>
&quot;kernel_baseline.cfg&quot; fragment file which contains just those ker=
nel<br>
config settings i want to make sure are set, and that file is just<br>
over 200 lines long. i also drag in a few other *very* short .cfg<br>
files. but in the end, the .config file generated under<br>
.../linux-windriver/4.1-r0/linux-cxii-standard-build/ is almost 2,200<br>
lines long. where did all that extra content come from?<br></blockquote><di=
v><br></div><div><br></div><div>The .config is always the setting for all r=
eachable kernel options. Some</div><div>are set in fragments, or defconfigs=
, others are the result of =C2=A0&#39;select&#39;=C2=A0</div><div>and defau=
lts by the kernel itself, etc.</div><div><br></div><div>If you run <span cl=
ass=3D"">save</span><span class=3D"">defconfig, you can see the non default=
 options that were</span></div><div><span class=3D"">set.</span></div>







<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:r=
gb(204,204,204);padding-left:1ex">
<br>
=C2=A0 i&#39;m assuming (and i could be wrong here) that since i&#39;m usin=
g the<br>
line:<br>
<br>
TARGET_SUPPORTED_KTYPES =3D &quot;standard&quot;<br>
<br>
i&#39;m automatically incorporating &quot;standard&quot;-related content un=
der<br>
.../kernel-meta/ktypes/standard? as in, the files:<br>
<br>
=C2=A0 * standard.cfg<br>
=C2=A0 * standard.scc<br>
<br>
or am i mistaken? from where comes all that additional content that<br>
ends up in the final .config?=C2=A0 is there a record of it in a log file<b=
r>
somewhere?<br></blockquote><div><br></div><div>If you are not supplying a d=
efconfig, and are inheriting the standard=C2=A0</div><div>kernel options, t=
hen yes, you&#39;d be getting those fragments as well.</div><div><br></div>=
<div>You can look in the work-shared/ .. kernel-source/.kernel-meta/ direct=
ory</div><div>for the meta-series (if using linux-yocto derived kernels), a=
nd that will reference</div><div>everything that was used to configure and =
patch the kernel. If it isn&#39;t in there,</div><div>it was a default or s=
elect by the kernel itself.</div><div><br></div><div>Bruce</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,=
204);padding-left:1ex">
<br>
=C2=A0 couple more kernel config-related questions coming shortly ...<br>
<div class=3D""><div class=3D"h5"><br>
rday<br>
<br>
--<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Robert P. J. Day=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ottawa, Ontario,=
 CANADA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <a href=3D"http://crashcourse.ca" rel=3D"noreferrer" target=3D"_=
blank">http://crashcourse.ca</a><br>
<br>
Twitter:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a=
 href=3D"http://twitter.com/rpjday" rel=3D"noreferrer" target=3D"_blank">ht=
tp://twitter.com/rpjday</a><br>
LinkedIn:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://ca.linkedin.=
com/in/rpjday" rel=3D"noreferrer" target=3D"_blank">http://ca.linkedin.com/=
in/rpjday</a><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer=
, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a1141e9620d6daa0531f113c7--
