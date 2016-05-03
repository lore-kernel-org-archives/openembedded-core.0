Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id B925C601A4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 18:10:52 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id k142so36721439oib.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 11:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=QW1fvGdecNsR0f7IO7EjSdcvOG3rm+sy1zrGfcVVr6w=;
	b=QBpuNBdmHZYbd3SzGCw8QzdIXQuCbeUXHBbVJjQ+l8H2ocYujr3GcXdudcAhIfRLbw
	V0JH8hYp+rcwMeMRqQCTDnbed4gDY0yGsQBhH9bj8+Pz+Jk8xMVwp70A1Si451anRQbH
	V+B0r6aofk28ixtKaDrZUEOiTbVlZDCHOBxAvivole3Umf17itjoVgJ9DVKOfkT214jL
	MJgbDU8Z0v6uY41R4SLtjs5wuMgJSpl7pErDegDKk9qUsNn2F45JqkhP9S5H7YqQeSuw
	tuIOtrC9MkLiwf6V4E1NzabRvJuq7lgGzyjeBQpit7HwpU73v7TTZuXJfgUnFWA5mW7J
	+81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=QW1fvGdecNsR0f7IO7EjSdcvOG3rm+sy1zrGfcVVr6w=;
	b=DmOrFieAwgkyvImVy8yeJ5+1P/Fki1WUjw4/jaiFYQyuMxRWWW4Yj4qZYqiJnMaiv5
	h4P4ozcNYjRgBux7y7fgTtFnd9O4oyNyzfkMcNyDs3eGIlb3tKZkiGJW3VDZqKEQ50GX
	W0/SKrv/fAxLuWn/z9tlm+v3+vsH/zHE8byEdtYX74WhUDdIyzTi3iX7iTnJHUqgrWVZ
	IAJbrrn1/R66FlizwiJVCqzfwgqIHk96hRvaeIji4d6E/DImGBHNp5YM5H/507XRiTQR
	RxfnrK6xWQCx3v/wWBCHyANpKjE9SizbBma1ufbNDi24FWVVbG9DfkipP/7nwhz+2x0A
	J6cw==
X-Gm-Message-State: AOPr4FUX7nPZh3TV1tEsRF0/P9L0wWLrZeGzT97BPm39alXuAkkXenbcv4j5ie4VjcW1AK97kK3ct+t+6pMThA==
MIME-Version: 1.0
X-Received: by 10.157.40.70 with SMTP id h6mr1975252otd.186.1462299052389;
	Tue, 03 May 2016 11:10:52 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Tue, 3 May 2016 11:10:52 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1605031245360.6672@localhost.localdomain>
References: <alpine.LFD.2.20.1605031245360.6672@localhost.localdomain>
Date: Tue, 3 May 2016 14:10:52 -0400
Message-ID: <CADkTA4PPYfetBymZ1mii_sc7f71za-V0dBbcgApHyhDHwxKyVw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: clarifying details about "is not set" lines in kernel config fragment files
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
X-List-Received-Date: Tue, 03 May 2016 18:10:52 -0000
Content-Type: multipart/alternative; boundary=001a1142f25892baf80531f407de

--001a1142f25892baf80531f407de
Content-Type: text/plain; charset=UTF-8

On Tue, May 3, 2016 at 1:04 PM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   oddly, in the current YP kernel dev manual, i don't see the phrase
> "is not set" explained anywhere in the entire doc, which is weird
> since it seems like it would be important.
>

The manuals don't cover the mechanics of how the mainline kernel is
configured.
Just the same way the don't cover the configuration language for any number
of packages in the system.


>
>   first, just to confirm *i* know what it's used for, it's not just a
> comment -- it's used explicitly by the kernel config process to
> stipulate that we are aware of a kernel config setting, and we don't
> want it. that is, if we have a kernel .config file used as the basis
> of a "make *config" command, and there is no mention whatever of a
> reachable config variable, the config process will stop and ask us
> about it. am i right so far?
>

Also correct. That's more upstream kernel configuration detail, not
something we duplicate.


>
>   this means that, once the kernel config process completes and the
> .config file is generated, every single *available* and *settable*
> kernel config option should be listed in the .config file, to avoid
> being asked about it the next time we do a kernel configuration.
>
>   oh, and about that "reachable" thing, we don't need a line regarding
> every single kernel config setting, just the ones that are available
> to be set given the current config settings. how am i doing so far?
>
>
Yep, and that means the final .config varies quite a bit, based on very
small
deltas in some config option.


>   given all that, my understanding is that, when one is writing kernel
> config fragments, it is necessary to explicitly deselect ("# ... is
> not set") *only* those kernel config options that would be selected
> based on other config settings we selected. do i have that right?
>

Nope.

If a Kconfig actually has "select FOO", you can't turn it off "FOO" no
matter how
hard you try. You need to turn off the option that has the select itself,
i.e. the
parent/containing option.

So you use # CONFIG_FOO is not set, to turn off your typical boolean or
tristate option, that may have a default 'y', or be otherwise enabled when
you
don't want it.


>
>   for instance, here's kernel Kbuild file net/Kconfig:
>
>
>     ...
>     menuconfig NETFILTER
>         bool "Network packet filtering framework (Netfilter)"
>         ... snip ...
>     if NETFILTER
>
>     config NETFILTER_DEBUG
>         bool "Network packet filtering debugging"
>         depends on NETFILTER
>         help
>           You can say Y here if you want to get additional messages useful
> in
>           debugging the netfilter code.
>
>
> as a test, i added a single-line frgament file:
>
>   CONFIG_NETFILTER=y
>
> however, even though NETFILTER_DEBUG was then selectable, because it
> wasn't *explicitly* selected, what i got in my final .config file was:
>
>     ...
>     CONFIG_NETFILTER=y
>     # CONFIG_NETFILTER_DEBUG is not set
>     ...
>
> however, because the very next Kconfig stanza was "default y":
>
>     config NETFILTER_ADVANCED
>         bool "Advanced netfilter configuration"
>         depends on NETFILTER
>         default y
>
> i *did* get the line in the final .config:
>
>     CONFIG_NETFILTER_ADVANCED=y
>
> does all this sound right? i always thought it was pretty
> straightforward, but i'm willing to be convinced i never really
> understood it.
>

Those are some relatively simple examples, but yes, pretty straight
forward. But no
one has ever claimed Kconfig to be simple or easy to fully grok.


>
>   and it does seem odd that it's not described anywhere in the YP
> kernel dev manual.
>

See above. We don't document what is already described in the mainline
kernel's
Kconfig specification.

Bruce


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
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1142f25892baf80531f407de
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, May 3, 2016 at 1:04 PM, Robert P. J. Day <span dir=3D"ltr">&lt;=
<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcour=
se.ca</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
=C2=A0 oddly, in the current YP kernel dev manual, i don&#39;t see the phra=
se<br>
&quot;is not set&quot; explained anywhere in the entire doc, which is weird=
<br>
since it seems like it would be important.<br></blockquote><div><br></div><=
div>The manuals don&#39;t cover the mechanics of how the mainline kernel is=
 configured.</div><div>Just the same way the don&#39;t cover the configurat=
ion language for any number</div><div>of packages in the system.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
<br>
=C2=A0 first, just to confirm *i* know what it&#39;s used for, it&#39;s not=
 just a<br>
comment -- it&#39;s used explicitly by the kernel config process to<br>
stipulate that we are aware of a kernel config setting, and we don&#39;t<br=
>
want it. that is, if we have a kernel .config file used as the basis<br>
of a &quot;make *config&quot; command, and there is no mention whatever of =
a<br>
reachable config variable, the config process will stop and ask us<br>
about it. am i right so far?<br></blockquote><div><br></div><div>Also corre=
ct. That&#39;s more upstream kernel configuration detail, not</div><div>som=
ething we duplicate.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
=C2=A0 this means that, once the kernel config process completes and the<br=
>
.config file is generated, every single *available* and *settable*<br>
kernel config option should be listed in the .config file, to avoid<br>
being asked about it the next time we do a kernel configuration.<br>
<br>
=C2=A0 oh, and about that &quot;reachable&quot; thing, we don&#39;t need a =
line regarding<br>
every single kernel config setting, just the ones that are available<br>
to be set given the current config settings. how am i doing so far?<br>
<br></blockquote><div><br></div><div>Yep, and that means the final .config =
varies quite a bit, based on very small</div><div>deltas in some config opt=
ion.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
=C2=A0 given all that, my understanding is that, when one is writing kernel=
<br>
config fragments, it is necessary to explicitly deselect (&quot;# ... is<br=
>
not set&quot;) *only* those kernel config options that would be selected<br=
>
based on other config settings we selected. do i have that right?<br></bloc=
kquote><div><br></div><div>Nope.</div><div><br></div><div>If a Kconfig actu=
ally has &quot;select FOO&quot;, you can&#39;t turn it off &quot;FOO&quot; =
no matter how</div><div>hard you try. You need to turn off the option that =
has the select itself, i.e. the</div><div>parent/containing option.</div><d=
iv><br></div><div>So you use # CONFIG_FOO is not set, to turn off your typi=
cal boolean or</div><div>tristate option, that may have a default &#39;y&#3=
9;, or be otherwise enabled when you</div><div>don&#39;t want it.</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">
<br>
=C2=A0 for instance, here&#39;s kernel Kbuild file net/Kconfig:<br>
<br>
<br>
=C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 menuconfig NETFILTER<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;Network packet filtering framework (=
Netfilter)&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ... snip ...<br>
=C2=A0 =C2=A0 if NETFILTER<br>
<br>
=C2=A0 =C2=A0 config NETFILTER_DEBUG<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;Network packet filtering debugging&q=
uot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on NETFILTER<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 You can say Y here if you want to get ad=
ditional messages useful in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 debugging the netfilter code.<br>
<br>
<br>
as a test, i added a single-line frgament file:<br>
<br>
=C2=A0 CONFIG_NETFILTER=3Dy<br>
<br>
however, even though NETFILTER_DEBUG was then selectable, because it<br>
wasn&#39;t *explicitly* selected, what i got in my final .config file was:<=
br>
<br>
=C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 CONFIG_NETFILTER=3Dy<br>
=C2=A0 =C2=A0 # CONFIG_NETFILTER_DEBUG is not set<br>
=C2=A0 =C2=A0 ...<br>
<br>
however, because the very next Kconfig stanza was &quot;default y&quot;:<br=
>
<br>
=C2=A0 =C2=A0 config NETFILTER_ADVANCED<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;Advanced netfilter configuration&quo=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on NETFILTER<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default y<br>
<br>
i *did* get the line in the final .config:<br>
<br>
=C2=A0 =C2=A0 CONFIG_NETFILTER_ADVANCED=3Dy<br>
<br>
does all this sound right? i always thought it was pretty<br>
straightforward, but i&#39;m willing to be convinced i never really<br>
understood it.<br></blockquote><div><br></div><div>Those are some relativel=
y simple examples, but yes, pretty straight forward. But no</div><div>one h=
as ever claimed Kconfig to be simple or easy to fully grok.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<br>
=C2=A0 and it does seem odd that it&#39;s not described anywhere in the YP<=
br>
kernel dev manual.<br></blockquote><div><br></div><div>See above. We don&#3=
9;t document what is already described in the mainline kernel&#39;s</div><d=
iv>Kconfig specification.</div><div><br></div><div>Bruce</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
<br>
rday<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
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
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a1142f25892baf80531f407de--
