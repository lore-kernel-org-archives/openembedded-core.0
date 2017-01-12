Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id F361B719A7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 13:44:20 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id k15so17863047qtg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 05:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ehH9CIhuTnjznZW27oXkqTYNjuzrQkRTTod5G51jxi8=;
	b=ToRdmqOFHFKo48LCbIHFMnu+7bI2P3QxKvuoLnHDQmEtaktmHjgSPK6NZSi1dh4bIT
	qnCE39BWKItObvVOijjlBsBVZMsAUqkc+vIjpDDEYL+jkNm3FXxQM/Z9Np85Hw0xwU7u
	RxSEsQqGJ0yLe1vnw2mhmtrandXretYCMVnPM4pnAKeVYbmoCNublKNrT2XxQyajeK2T
	89WZXZIt9QfPYRPRlsrZWcB8skNPTlszwpG2flES04gWhdCZwKSFngDE9mscqm4lXxuz
	OJsGyiJIO8uhO6prOocaF1sZOMahxAn/6hJLvICbGkcO26Iy+MQvTHBYxNKDo4Lo+Y3w
	GI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ehH9CIhuTnjznZW27oXkqTYNjuzrQkRTTod5G51jxi8=;
	b=KkTLG/UPc31PRwvZrHT+SylFFsJ7PvMZAJ30GjJcpHyccIj3GCDHvROcXtD3fY2a4I
	44V/V19uC30ttPWOCDVyyvJrrBBdfSiiavYgRquqS0Mpb37HDMXoeb1tkvVfNFQqGuNT
	GhtR5ckWNDyjzo1KVtxWcRXT2ZD8KPaC1sSlS1nKN0Ni1WaHYCuT1tfwAer5vfWtqlIC
	w0zMp4grifGrnzniwe0R8WGcgt/7JleIxoJ+iJH7N7nEVEEtCUssxU6EMBxs4gIaJaKG
	ewtOd+2eDGfxLbZScxEPdJ7oV4G9xlIBwHRcrmgqPUc7nEyV/Y/+zie9D4vQOTKax4ZP
	xdSw==
X-Gm-Message-State: AIkVDXJWS1QsL/tL7vTFQictYLpKAn1J1NT5RAsIn9nxPFvQG8KKkIYMNbe85dkUOXGcuMUMh42ipi3DtTWeBw==
X-Received: by 10.200.43.212 with SMTP id n20mr12197466qtn.117.1484228661041; 
	Thu, 12 Jan 2017 05:44:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.135.153 with HTTP; Thu, 12 Jan 2017 05:44:20 -0800 (PST)
In-Reply-To: <CADQUhkSLe=KPv660z1Bjmvcth5cP2MapzyfmLLn_mKGCkQuVeA@mail.gmail.com>
References: <1483955680-18110-1-git-send-email-ola.redell@retotech.se>
	<CADkTA4PFOUmv3W8stkhDmewwDfBE+efZEVym903937jz6eAo7g@mail.gmail.com>
	<314ad0bd-0cab-723a-520b-2db8b6e3b9f7@gmail.com>
	<CADkTA4NSnLvGX8FrFxcKXhWMDeCpn3ez=x8iraDL+RQqzZTGtw@mail.gmail.com>
	<CADQUhkSLe=KPv660z1Bjmvcth5cP2MapzyfmLLn_mKGCkQuVeA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 12 Jan 2017 08:44:20 -0500
Message-ID: <CADkTA4NP10emxMOfnTHn6nKFv-W1=+KnJGkfmZ8t1Q5+hJbpYw@mail.gmail.com>
To: Ola Redell <ola.redell@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] kernel-module-split: Append KERNEL_VERSION string to kernel module name
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
X-List-Received-Date: Thu, 12 Jan 2017 13:44:21 -0000
Content-Type: multipart/alternative; boundary=001a1135b98e1b90e90545e5eadb

--001a1135b98e1b90e90545e5eadb
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 11, 2017 at 9:43 AM, Ola Redell <ola.redell@gmail.com> wrote:

>
>
> 2017-01-10 15:45 GMT+01:00 Bruce Ashfield <bruce.ashfield@gmail.com>:
>
>>
>>
>>>
>>> So basically, as I understand it, this may be a blocker for this change.
>>> Alternatives I can come up with are:
>>>
>>> 1) For all packaged kernel modules, add meta packages that depend on the
>>> correct version of the kernel module itself. Then "kernel-module-foo" would
>>> depend on "kernel-module-foo-<version>". The package "kernel-modules" would
>>> then still be made depending on "kernel-module-foo-<version>" and the likes.
>>>
>>
>>
>> Wouldn't this break your primary use case ? i.e. if you had two kernels
>> in the image or
>> when you install the 2nd newer kernel, the meta packages would conflict
>> and hence couldn't
>> be around at the same time ?
>>
>>
> No, it would not break as far as my tests show. I use the meta package
> "kernel-modules" today and since it is versioned (not the version string we
> are talking about adding here - but regular package version) it all works
> fine. apt-get knows about the versions and installs the latest one, with
> dependencies, if I don't say anything else. I don't have any problems
> having many kernel-modules packages available for installation in my repos
> simultaneously. The fine thing with this is that I can perform an "apt-get
> dist-upgrade" (or if I'd prefer apt-get upgrade kernel-modules) to install
> all new versions of the packages. When I have done that, apt-get finds out
> that the older packages are no longer needed and allows me to remove them
> (when I want to remove them - i.e. when I know my new kernel works fine)
> using "apt-get autoremove". (A note here: After my first kernel upgrade
> this is not the case because apt-get considers the original kernel and all
> original kernel-modules to not having been installed "automatically", that
> is not as dependencies to other packages. But after my second dist-upgrade
> the autoremove option allows me to remove unused packages)
>


Aha. Good to know. I wasn't sure, not having tried this myself.


>
>
>> Rather than a meta-package, I think it would be feasible to just have the
>> generated split
>> modules RPROVIDE both a PN-<VERSION> and PN. i.e. kernel-module-foo and
>> kernel-module-foo-<version>
>> would be RPROVIDED by the packages. I'd still consider this the same
>> solution as #1, just
>> with a different implementation, but one that wouldn't generate more
>> packages and slow
>> the install/generation phase even more.
>>
>
>
>>
>> I'm not sure what happens if two packages can have a different on-disk
>> name (i.e. kernel-module-foo-1.2
>> and kernel-module-foo-1.3) and both RPROVIDE "kernel-module-foo". Only
>> one would be installed,
>> but if someone did an apt-get or a smart install of kernel-module-foo ..
>> chaos may erupt.
>>
>>
> That is an interesting alternative and I looked in to that a bit by doing
> the necessary hack and testing it out. Your earlier concerns are solved
> with this - you can do RDEPENDS_x = "kernel-module-foo" and I can install
> that virtual package using "apt-get install kernel-module-foo" as long as I
> only have one package providing that virtual package available.  But as
> soon as I have more than one package providing that virtual package,
> apt-get refuses to install it without me stating exactly what package I
> want. Hence I then need to point out kernel-module-foo-<version>. The
> reason for this seems to be that virtual packages are not versioned (again
> package version - not the postfix string we discuss here). This is not a
> huge problem for me with my current use case, but if I'd only install a
> couple of kernel modules with bitbake and then later would want to upgrade
> them using e.g. "apt-get dist-upgrade" or "apt-get upgrade", that would be
> a problem.
>
>

Interesting. I think we've probably fallen off the radar of the casual
reader that may have
more bitbake knowledge to explain why the virtual package (kernel-modules)
provides
works with the same name and different versions, while a package with the
version postfix
that rprovides the same name doesn't work with different versions.



> I agree adding a huge number of more meta packages should be avoided if
> possible.
>

Agreed again. If possible, taking a first step that doesn't break the
existing use cases,
but only adds a minor extra step in your transition case (individual module
installs) is
probably the least controversial route to take.

It would also be something that could evolve once in the tree.


>
>
>>
>>
>>>
>>> 2) Make the version postfix configurable with a
>>> KERNEL_MODULE_PACKAGE_POSTFIX, exactly like the prefix (which was added
>>> recently). The default would be an empty postfix, but it could be used to
>>> achieve this functionality for those who need it.
>>>
>>> No. 2 is a very simple change. No. 1 is more uncertain (to me at least).
>>>
>>
>> I was discussing this change with a few people in person this morning and
>> we came up with making this
>> optional as well (your #2), which would ensure that existing use cases
>> are not broken, but on the
>> flip side it makes already complex code more complex and would leave some
>> paths more tested
>> than others.
>>
>> If #1 is feasible, I wonder if a variant of both 1 an 2 are viable ? i.e.
>> make the generation of the
>> packages always have a version in the name, but make the generation of a
>> "versionless" meta
>> package be optional (or a versionless RPROVIDE). In the default case
>> they'd be enabled, and no
>> one would notice that anything had changed but the module-split code
>> would have a single path.
>> In a case where multiple kernels are to be installed, you'd have to
>> disable the versionless package
>> generation.
>>
>
> Given my tests described above, this may be the best solution, yes.
>

Sounds like a plan to me.


>
>
>>
>> I mentioned wildcards above, I'm not sure if anyone else reading this
>> thread knows if RDEPENDS
>> can use wildcards ? i.e. if RDEPENDS="kernel-module-foo-4%"  or
>> "kernel-module-foo-%" worked,
>> then I could see the version string requirement being less of an issue
>> and not something that would
>> require constant bumping as the kernel version changed.
>>
>
> I have not tested this yet and don't know if it would work, but of course
> it would require recipes to be changed.
>
>
True, but at least it would be a one time change, which would be preferable
to something that
needed to be bumped each time the kernel version moved.

Cheers,

Bruce


> Ola
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1135b98e1b90e90545e5eadb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Jan 11, 2017 at 9:43 AM, Ola Redell <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:ola.redell@gmail.com" target=3D"_blank">ola.redell@gmail.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><br=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><span class=3D""=
>2017-01-10 15:45 GMT+01:00 Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D=
"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.co=
m</a>&gt;</span>:<br><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote"><div=
 dir=3D"ltr"><span class=3D"m_-2014262970136456767gmail-"><div>=C2=A0</div>=
<blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex" class=3D"gmail_quote"><div bgcolor=3D"#FFFFFF">
    <br>
    So basically, as I understand it, this may be a blocker for this
    change. Alternatives I can come up with are:<br>
    <br>
    1) For all packaged kernel modules, add meta packages that depend on
    the correct version of the kernel module itself. Then
    &quot;kernel-module-foo&quot; would depend on
    &quot;kernel-module-foo-&lt;version&gt;&quot;. The package &quot;kernel=
-modules&quot;
    would then still be made depending on
    &quot;kernel-module-foo-&lt;version&gt;&quot; and the likes.<br></div><=
/blockquote><br></span><div class=3D"gmail_extra"><br><div class=3D"gmail_q=
uote">Wouldn&#39;t this break your primary use case ? i.e. if you had two k=
ernels in the image or<br>when you install the 2nd newer kernel, the meta p=
ackages would conflict and hence couldn&#39;t<br>be around at the same time=
 ?<br><br></div></div></div></blockquote><div><br></div></span><div>No, it =
would not break as far as my tests show. I use the meta package &quot;kerne=
l-modules&quot; today and since it is versioned (not the version string we =
are talking about adding here - but regular package version) it all works f=
ine. apt-get knows about the versions and installs the latest one, with dep=
endencies, if I don&#39;t say anything else. I don&#39;t have any problems =
having many kernel-modules packages available for installation in my repos =
simultaneously. The fine thing with this is that I can perform an &quot;apt=
-get dist-upgrade&quot; (or if I&#39;d prefer apt-get upgrade kernel-module=
s) to install all new versions of the packages. When I have done that, apt-=
get finds out that the older packages are no longer needed and allows me to=
 remove them (when I want to remove them - i.e. when I know my new kernel w=
orks fine) using &quot;apt-get autoremove&quot;. (A note here: After my fir=
st kernel upgrade this is not the case because apt-get considers the origin=
al kernel and all original kernel-modules to not having been installed &quo=
t;automatically&quot;, that is not as dependencies to other packages. But a=
fter my second dist-upgrade the autoremove option allows me to remove unuse=
d packages)<br></div></div></div></div></blockquote><div><br><br></div><div=
>Aha. Good to know. I wasn&#39;t sure, not having tried this myself.<br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div cl=
ass=3D"gmail_extra"><div class=3D"gmail_quote"><div></div><span class=3D"">=
<div>=C2=A0</div><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote"><div dir=
=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"></div><div c=
lass=3D"gmail_quote">Rather than a meta-package, I think it would be feasib=
le to just have the generated split<br></div><div class=3D"gmail_quote">mod=
ules RPROVIDE both a PN-&lt;VERSION&gt; and PN. i.e. kernel-module-foo and =
kernel-module-foo-&lt;version&gt;<br></div><div class=3D"gmail_quote">would=
 be RPROVIDED by the packages. I&#39;d still consider this the same solutio=
n as #1, just<br></div><div class=3D"gmail_quote">with a different implemen=
tation, but one that wouldn&#39;t generate more packages and slow <br></div=
><div class=3D"gmail_quote">the install/generation phase even more.<br></di=
v></div></div></blockquote><div>=C2=A0<br></div><blockquote style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
 class=3D"gmail_quote"><div dir=3D"ltr"><div class=3D"gmail_extra"><div cla=
ss=3D"gmail_quote"><br></div><div class=3D"gmail_quote">I&#39;m not sure wh=
at happens if two packages can have a different on-disk name (i.e. kernel-m=
odule-foo-1.2<br>and kernel-module-foo-1.3) and both RPROVIDE &quot;kernel-=
module-foo&quot;. Only one would be installed,<br></div><div class=3D"gmail=
_quote">but if someone did an apt-get or a smart install of kernel-module-f=
oo .. chaos may erupt.<br></div><div class=3D"gmail_quote"></div><div class=
=3D"gmail_quote"><br></div></div></div></blockquote><div>=C2=A0</div></span=
><div>That is an interesting alternative and I looked in to that a bit by d=
oing the necessary hack and testing it out. Your earlier concerns are solve=
d with this - you can do RDEPENDS_x =3D &quot;kernel-module-foo&quot; and I=
 can install that virtual package using &quot;apt-get install kernel-module=
-foo&quot; as long as I only have one package providing that virtual packag=
e available.=C2=A0 But as soon as I have more than one package providing th=
at virtual package, apt-get refuses to install it without me stating exactl=
y what package I want. Hence I then need to point out kernel-module-foo-&lt=
;version&gt;. The reason for this seems to be that virtual packages are not=
 versioned (again package version - not the postfix string we discuss here)=
. This is not a huge problem for me with my current use case, but if I&#39;=
d only install a couple of kernel modules with bitbake and then later would=
 want to upgrade them using e.g. &quot;apt-get dist-upgrade&quot; or &quot;=
apt-get upgrade&quot;, that would be a problem. <br><br></div></div></div><=
/div></blockquote><div><br><br></div><div>Interesting. I think we&#39;ve pr=
obably fallen off the radar of the casual reader that may have<br></div><di=
v>more bitbake knowledge to explain why the virtual package (kernel-modules=
) provides <br></div><div>works with the same name and different versions, =
while a package with the version postfix<br></div><div>that rprovides the s=
ame name doesn&#39;t work with different versions.<br></div><div><br></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_extra"><div class=3D"gmail_quote"><div>I agree adding a huge numb=
er of more meta packages should be avoided if=20
possible.<br></div></div></div></div></blockquote><div><br></div><div>Agree=
d again. If possible, taking a first step that doesn&#39;t break the existi=
ng use cases,<br></div><div>but only adds a minor extra step in your transi=
tion case (individual module installs) is<br></div><div>probably the least =
controversial route to take. <br><br></div><div>It would also be something =
that could evolve once in the tree.<br></div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D=
"gmail_quote"><div>=C2=A0=C2=A0 <br></div><span class=3D""><blockquote styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex" class=3D"gmail_quote"><div dir=3D"ltr"><div class=3D"gmail_extr=
a"><div class=3D"gmail_quote"></div><div class=3D"gmail_quote"><span class=
=3D"m_-2014262970136456767gmail-"><div>=C2=A0</div><blockquote style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex" class=3D"gmail_quote"><div bgcolor=3D"#FFFFFF">
    <br>
    2) Make the version postfix configurable with a
    KERNEL_MODULE_PACKAGE_POSTFIX, exactly like the prefix (which was
    added recently). The default would be an empty postfix, but it could
    be used to achieve this functionality for those who need it.<br>
    <br>
    No. 2 is a very simple change. No. 1 is more uncertain (to me at
    least).<br></div></blockquote><div><br></div></span><div>I was discussi=
ng this change with a few people in person this morning and we came up with=
 making this<br></div><div>optional as well (your #2), which would ensure t=
hat existing use cases are not broken, but on the<br></div><div>flip side i=
t makes already complex code more complex and would leave some paths more t=
ested<br></div><div>than others.<br><br></div><div>If #1 is feasible, I won=
der if a variant of both 1 an 2 are viable ? i.e. make the generation of th=
e <br></div><div>packages always have a version in the name, but make the g=
eneration of a &quot;versionless&quot; meta<br></div><div>package be option=
al (or a versionless RPROVIDE). In the default case they&#39;d be enabled, =
and no<br>one would notice that anything had changed but the module-split c=
ode would have a single path. <br>In a case where multiple kernels are to b=
e installed, you&#39;d have to disable the versionless package<br>generatio=
n.<br></div></div></div></div></blockquote><div><br></div></span><div>Given=
 my tests described above, this may be the best solution, yes. <br></div></=
div></div></div></blockquote><div><br></div><div>Sounds like a plan to me.<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div =
class=3D"gmail_extra"><div class=3D"gmail_quote"><div>=C2=A0<br></div><span=
 class=3D""><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote"><div dir=3D"l=
tr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div></div><div><=
br></div><div>I mentioned wildcards above, I&#39;m not sure if anyone else =
reading this thread knows if RDEPENDS<br></div><div>can use wildcards ? i.e=
. if RDEPENDS=3D&quot;kernel-module-foo-4%<wbr>&quot;=C2=A0 or &quot;kernel=
-module-foo-%&quot; worked,<br></div><div>then I could see the version stri=
ng requirement being less of an issue and not something that would<br></div=
><div>require constant bumping as the kernel version changed.<br></div></di=
v></div></div></blockquote><div>=C2=A0<br></div></span><div>I have not test=
ed this yet and don&#39;t know if it would work, but of course it would req=
uire recipes to be changed.<span class=3D"HOEnZb"><font color=3D"#888888"><=
br></font></span></div><span class=3D"HOEnZb"><font color=3D"#888888"><br><=
/font></span></div></div></div></blockquote><div><br></div><div>True, but a=
t least it would be a one time change, which would be preferable to somethi=
ng that<br></div><div>needed to be bumped each time the kernel version move=
d.<br><br></div><div>Cheers,<br><br></div><div>Bruce<br></div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_ext=
ra"><div class=3D"gmail_quote"><span class=3D"HOEnZb"><font color=3D"#88888=
8"></font></span></div><span class=3D"HOEnZb"><font color=3D"#888888">Ola<b=
r><br></font></span></div></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature">&quot;Thou shalt not follow the =
NULL pointer, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a1135b98e1b90e90545e5eadb--
