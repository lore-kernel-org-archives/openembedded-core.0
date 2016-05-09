Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id F117F605FF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 12:43:20 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id x201so208527050oif.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2016 05:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=9fsC8D8fm6HC/XlrGDwj1cIjbQPGVpj/MBO1Ivf4EJ4=;
	b=uMP/QZpueXIxfE1QUw34ButTajWkAktejsw40P0xFWttWOkK6NmIOVoI9eGk0z4YTz
	BkejYAyk9wyOsbOJl55k3NtzdEidSjBAvABmzo6Gy+XzuuYi3vN7S168MS19/oLVl+0L
	egkW3px45jBEjKM6YweTrbx+qhataUx2oiVwNrpkfm78GMrvRLpmnl0iO0qXt16kH1Rl
	9GSCaMljw6hlLwjTX56//qwweDpxUiORMhwq5O/N8qOgkE4kFvNN4ua3rjTV3mWUaJz9
	8xAYBmI8a4XMgtvL8JAcgA3rSf8ZcGt8/W1N4gLO1g/8kdtRIh1tfdrFiiuWuNwjqoyu
	3jUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=9fsC8D8fm6HC/XlrGDwj1cIjbQPGVpj/MBO1Ivf4EJ4=;
	b=mh/AewDIn0c7ZF7OyfyZfrxJsjtyY2NnXoi4mz6UCN/1w7oIGLPmi5J3QRlNbHTHPu
	dyZ+JXWyuchojwYuaBcwgx3VZ0IB9jdCncTAbqSY4Mfe4koWY+qQwItVGJmBEReDCV8z
	nzb2DiidvsCRw+3OqE05SrmF9zHAMZ/s0//9A2UjT71dwWkwZuNnSLOPZhQT9t1AQn5r
	iMDeiExW07/kuUgMz4GUflULo0rUi679Gzi10Mn/H/UdvtCZ72QQ5KRf2hlue++MTrIp
	YqlJoePd0qeHZMjapqfhY2f4pUy4G9o2DrUv62C92p3rDeKDew6ABzkwfHMbEikZ9Idg
	nJGg==
X-Gm-Message-State: AOPr4FXOlkuHBBQsw3Qah5FrgvGrZQNloFwFiwZfgf8lswofJEJU1ntR5iS4jv74tsERsM/0PPJslELb+8qODg==
MIME-Version: 1.0
X-Received: by 10.202.46.139 with SMTP id u133mr15044637oiu.16.1462797801453; 
	Mon, 09 May 2016 05:43:21 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Mon, 9 May 2016 05:43:21 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1605090630480.21387@localhost.localdomain>
References: <alpine.LFD.2.20.1605090630480.21387@localhost.localdomain>
Date: Mon, 9 May 2016 08:43:21 -0400
Message-ID: <CADkTA4PzYTZhbgm0g=wnjfoK0hEDiDKKWqU7PePb=BxnerAXaw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: should a SRC_URI referring to "rday.cfg" look for "rday.scc"?
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
X-List-Received-Date: Mon, 09 May 2016 12:43:22 -0000
Content-Type: multipart/alternative; boundary=001a1137c99c557fd205326827f1

--001a1137c99c557fd205326827f1
Content-Type: text/plain; charset=UTF-8

On Mon, May 9, 2016 at 6:39 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   (aside: this is with wind river linux 8 and i dropped bruce a note
> about it, but i really should keep this stuff on the mailing list.)
>
>   not sure if this is a WRL issue, or more general OE or YP issue, but
> i was doing a kernel config yesterday, and my SRC_URI included, say,
> "rday.scc", which incorporated both kernel config fragments and
> patches, and that worked fine.
>
>   eventually, after massive refactoring, all that was left of that
> item was some kernel configuration which was already in "rday.cfg", so
> i edited SRC_URI and replaced "rday.scc" with "rday.cfg", but i left
> that old "rday.scc" in that directory (with its referent patches),
> assuming it would be ignored.
>
>   did a clean and configure and got:
>
>   | DEBUG: Executing shell function do_kernel_metadata
> | ERROR: could not find patch rday.patch, included from
> .../rday.scc ...
>
>   it *appears* that, even though SRC_URI now refers to (among other
> things) just "rday.cfg", it looks like the configure step is *still*
> trying to process "rday.scc", which contains a reference to a now
> non-existent patch, hence the failure.
>
>   if i just remove (or rename) "rday.scc", then things work fine. is
> this expected behaviour? is there some reason that if SRC_URI
> includes, say "derf.cfg", the configuration will automatically look
> for and try to process "derf.scc"? or am i just doing something silly?
>

There's no automatic inclusions like that. Take a look at your meta-series
and see if
there's an explicit reference to the .scc file.

Otherwise, I'll have to try and reproduce it here.

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
>
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

--001a1137c99c557fd205326827f1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, May 9, 2016 at 6:39 AM, Robert P. J. Day <span dir=3D"ltr">&lt;=
<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcour=
se.ca</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
=C2=A0 (aside: this is with wind river linux 8 and i dropped bruce a note<b=
r>
about it, but i really should keep this stuff on the mailing list.)<br>
<br>
=C2=A0 not sure if this is a WRL issue, or more general OE or YP issue, but=
<br>
i was doing a kernel config yesterday, and my SRC_URI included, say,<br>
&quot;rday.scc&quot;, which incorporated both kernel config fragments and<b=
r>
patches, and that worked fine.<br>
<br>
=C2=A0 eventually, after massive refactoring, all that was left of that<br>
item was some kernel configuration which was already in &quot;rday.cfg&quot=
;, so<br>
i edited SRC_URI and replaced &quot;rday.scc&quot; with &quot;rday.cfg&quot=
;, but i left<br>
that old &quot;rday.scc&quot; in that directory (with its referent patches)=
,<br>
assuming it would be ignored.<br>
<br>
=C2=A0 did a clean and configure and got:<br>
<br>
=C2=A0 | DEBUG: Executing shell function do_kernel_metadata<br>
| ERROR: could not find patch rday.patch, included from<br>
.../rday.scc ...<br>
<br>
=C2=A0 it *appears* that, even though SRC_URI now refers to (among other<br=
>
things) just &quot;rday.cfg&quot;, it looks like the configure step is *sti=
ll*<br>
trying to process &quot;rday.scc&quot;, which contains a reference to a now=
<br>
non-existent patch, hence the failure.<br>
<br>
=C2=A0 if i just remove (or rename) &quot;rday.scc&quot;, then things work =
fine. is<br>
this expected behaviour? is there some reason that if SRC_URI<br>
includes, say &quot;derf.cfg&quot;, the configuration will automatically lo=
ok<br>
for and try to process &quot;derf.scc&quot;? or am i just doing something s=
illy?<br></blockquote><div><br></div><div>There&#39;s no automatic inclusio=
ns like that. Take a look at your meta-series and see if=C2=A0</div><div>th=
ere&#39;s an explicit reference to the .scc file.</div><div><br></div><div>=
Otherwise, I&#39;ll have to try and reproduce it here.</div><div><br></div>=
<div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
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
<br>
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

--001a1137c99c557fd205326827f1--
