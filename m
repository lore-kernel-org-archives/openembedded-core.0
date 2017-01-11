Return-Path: <ola.redell@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 035EF60939
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 14:43:21 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id f2so13521294uaf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 06:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rNzrlRfeVgo3YaHYFCNR4Ozv7w4zEXXsmfRA1MHn/Uw=;
	b=IfGhdsWzHOzuJuHqozWsiCxheeE4QE4kfOmrdqCAETU8lCpeHC8poLZQICzgSQPpZB
	1h+fB1KVC5LJcZsaxHmSZS/s17NQaRBFTkgm9qtrlrCGKiPpSinde/l7AUc0YG/kaBB1
	H2kaKm1haZbjqlXifKlBqqB1zhj/aBAB5wWID2ZM3b+xCbcUCBEt8BbwDuiBnlXKTCDC
	c0oXenR1y1zm4ob3T5N7w691DUNGy9lp/FLDoQH5lV81+tFsbqDofrPv0T7bysLcx7Wz
	C8Lca297cBZpiY5UDCvYjjJKFel4lsBm5r82RiVD5zk5U5jL+ard+A+8ddCHxi6JFN+0
	J0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rNzrlRfeVgo3YaHYFCNR4Ozv7w4zEXXsmfRA1MHn/Uw=;
	b=sssUtXfutCLdaIxz0kONt+M7Z8KXGz0KNtWCUAOU0+lcvW/64FW72krPDjMOBxPVvh
	IMOiejzjqU8U0U+Sh6Fyf+h84fJQWW8M+LorZzHdWlXvugKociIZys+byvZziEVikkf7
	2h9+xmMdjbMoERe8QKA7R7jeFjJbIEvJ+nv7l99Ox9Wb417msFUvRjjfd1yqNei1b4mM
	r12Opew3p4zHaRPVYZMNr7Qz5i+KLjwZhVh6O7fUhNzzBlrETuo+nak4xpFKtulEKIQJ
	VKcCW3uUMWkvosg4bC6ru6kh7PWAzmayh0OA1hh7DeltU0TDEoH9ssmws31CbZq6G+lk
	JIjw==
X-Gm-Message-State: AIkVDXJJXWj9Z2bDhqsKiqOJgkoXTsBy3NQPxLekk5uUDm5VDHH1d7UtqfLr1LVjdEpGYfoGz5sP+n6eT2J8kg==
X-Received: by 10.159.34.105 with SMTP id 96mr4906792uad.84.1484145801721;
	Wed, 11 Jan 2017 06:43:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.141.193 with HTTP; Wed, 11 Jan 2017 06:43:21 -0800 (PST)
In-Reply-To: <CADkTA4NSnLvGX8FrFxcKXhWMDeCpn3ez=x8iraDL+RQqzZTGtw@mail.gmail.com>
References: <1483955680-18110-1-git-send-email-ola.redell@retotech.se>
	<CADkTA4PFOUmv3W8stkhDmewwDfBE+efZEVym903937jz6eAo7g@mail.gmail.com>
	<314ad0bd-0cab-723a-520b-2db8b6e3b9f7@gmail.com>
	<CADkTA4NSnLvGX8FrFxcKXhWMDeCpn3ez=x8iraDL+RQqzZTGtw@mail.gmail.com>
From: Ola Redell <ola.redell@gmail.com>
Date: Wed, 11 Jan 2017 15:43:21 +0100
Message-ID: <CADQUhkSLe=KPv660z1Bjmvcth5cP2MapzyfmLLn_mKGCkQuVeA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
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
X-List-Received-Date: Wed, 11 Jan 2017 14:43:22 -0000
Content-Type: multipart/alternative; boundary=001a113fa0924e7cc30545d29f4f

--001a113fa0924e7cc30545d29f4f
Content-Type: text/plain; charset=UTF-8

2017-01-10 15:45 GMT+01:00 Bruce Ashfield <bruce.ashfield@gmail.com>:

>
>
>>
>> So basically, as I understand it, this may be a blocker for this change.
>> Alternatives I can come up with are:
>>
>> 1) For all packaged kernel modules, add meta packages that depend on the
>> correct version of the kernel module itself. Then "kernel-module-foo" would
>> depend on "kernel-module-foo-<version>". The package "kernel-modules" would
>> then still be made depending on "kernel-module-foo-<version>" and the likes.
>>
>
>
> Wouldn't this break your primary use case ? i.e. if you had two kernels in
> the image or
> when you install the 2nd newer kernel, the meta packages would conflict
> and hence couldn't
> be around at the same time ?
>
>
No, it would not break as far as my tests show. I use the meta package
"kernel-modules" today and since it is versioned (not the version string we
are talking about adding here - but regular package version) it all works
fine. apt-get knows about the versions and installs the latest one, with
dependencies, if I don't say anything else. I don't have any problems
having many kernel-modules packages available for installation in my repos
simultaneously. The fine thing with this is that I can perform an "apt-get
dist-upgrade" (or if I'd prefer apt-get upgrade kernel-modules) to install
all new versions of the packages. When I have done that, apt-get finds out
that the older packages are no longer needed and allows me to remove them
(when I want to remove them - i.e. when I know my new kernel works fine)
using "apt-get autoremove". (A note here: After my first kernel upgrade
this is not the case because apt-get considers the original kernel and all
original kernel-modules to not having been installed "automatically", that
is not as dependencies to other packages. But after my second dist-upgrade
the autoremove option allows me to remove unused packages)


> Rather than a meta-package, I think it would be feasible to just have the
> generated split
> modules RPROVIDE both a PN-<VERSION> and PN. i.e. kernel-module-foo and
> kernel-module-foo-<version>
> would be RPROVIDED by the packages. I'd still consider this the same
> solution as #1, just
> with a different implementation, but one that wouldn't generate more
> packages and slow
> the install/generation phase even more.
>


>
> I'm not sure what happens if two packages can have a different on-disk
> name (i.e. kernel-module-foo-1.2
> and kernel-module-foo-1.3) and both RPROVIDE "kernel-module-foo". Only one
> would be installed,
> but if someone did an apt-get or a smart install of kernel-module-foo ..
> chaos may erupt.
>
>
That is an interesting alternative and I looked in to that a bit by doing
the necessary hack and testing it out. Your earlier concerns are solved
with this - you can do RDEPENDS_x = "kernel-module-foo" and I can install
that virtual package using "apt-get install kernel-module-foo" as long as I
only have one package providing that virtual package available.  But as
soon as I have more than one package providing that virtual package,
apt-get refuses to install it without me stating exactly what package I
want. Hence I then need to point out kernel-module-foo-<version>. The
reason for this seems to be that virtual packages are not versioned (again
package version - not the postfix string we discuss here). This is not a
huge problem for me with my current use case, but if I'd only install a
couple of kernel modules with bitbake and then later would want to upgrade
them using e.g. "apt-get dist-upgrade" or "apt-get upgrade", that would be
a problem.

I agree adding a huge number of more meta packages should be avoided if
possible.


>
>
>>
>> 2) Make the version postfix configurable with a
>> KERNEL_MODULE_PACKAGE_POSTFIX, exactly like the prefix (which was added
>> recently). The default would be an empty postfix, but it could be used to
>> achieve this functionality for those who need it.
>>
>> No. 2 is a very simple change. No. 1 is more uncertain (to me at least).
>>
>
> I was discussing this change with a few people in person this morning and
> we came up with making this
> optional as well (your #2), which would ensure that existing use cases are
> not broken, but on the
> flip side it makes already complex code more complex and would leave some
> paths more tested
> than others.
>
> If #1 is feasible, I wonder if a variant of both 1 an 2 are viable ? i.e.
> make the generation of the
> packages always have a version in the name, but make the generation of a
> "versionless" meta
> package be optional (or a versionless RPROVIDE). In the default case
> they'd be enabled, and no
> one would notice that anything had changed but the module-split code would
> have a single path.
> In a case where multiple kernels are to be installed, you'd have to
> disable the versionless package
> generation.
>

Given my tests described above, this may be the best solution, yes.


>
> I mentioned wildcards above, I'm not sure if anyone else reading this
> thread knows if RDEPENDS
> can use wildcards ? i.e. if RDEPENDS="kernel-module-foo-4%"  or
> "kernel-module-foo-%" worked,
> then I could see the version string requirement being less of an issue and
> not something that would
> require constant bumping as the kernel version changed.
>

I have not tested this yet and don't know if it would work, but of course
it would require recipes to be changed.

Ola

--001a113fa0924e7cc30545d29f4f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">2017-01-10 15:45 GMT+01:00 Bruce Ashfield <span dir=3D"ltr">&lt;<a targ=
et=3D"_blank" href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail=
.com</a>&gt;</span>:<br><blockquote style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote"><=
div dir=3D"ltr"><span class=3D"gmail-"><div>=C2=A0</div><blockquote style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex" class=3D"gmail_quote"><div bgcolor=3D"#FFFFFF">
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
 ?<br><br></div></div></div></blockquote><div><br></div><div>No, it would n=
ot break as far as my tests show. I use the meta package &quot;kernel-modul=
es&quot; today and since it is versioned (not the version string we are tal=
king about adding here - but regular package version) it all works fine. ap=
t-get knows about the versions and installs the latest one, with dependenci=
es, if I don&#39;t say anything else. I don&#39;t have any problems having =
many kernel-modules packages available for installation in my repos simulta=
neously. The fine thing with this is that I can perform an &quot;apt-get di=
st-upgrade&quot; (or if I&#39;d prefer apt-get upgrade kernel-modules) to i=
nstall all new versions of the packages. When I have done that, apt-get fin=
ds out that the older packages are no longer needed and allows me to remove=
 them (when I want to remove them - i.e. when I know my new kernel works fi=
ne) using &quot;apt-get autoremove&quot;. (A note here: After my first kern=
el upgrade this is not the case because apt-get considers the original kern=
el and all original kernel-modules to not having been installed &quot;autom=
atically&quot;, that is not as dependencies to other packages. But after my=
 second dist-upgrade the autoremove option allows me to remove unused packa=
ges)<br></div><div>=C2=A0</div><blockquote style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_q=
uote"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote=
"></div><div class=3D"gmail_quote">Rather than a meta-package, I think it w=
ould be feasible to just have the generated split<br></div><div class=3D"gm=
ail_quote">modules RPROVIDE both a PN-&lt;VERSION&gt; and PN. i.e. kernel-m=
odule-foo and kernel-module-foo-&lt;version&gt;<br></div><div class=3D"gmai=
l_quote">would be RPROVIDED by the packages. I&#39;d still consider this th=
e same solution as #1, just<br></div><div class=3D"gmail_quote">with a diff=
erent implementation, but one that wouldn&#39;t generate more packages and =
slow <br></div><div class=3D"gmail_quote">the install/generation phase even=
 more.<br></div></div></div></blockquote><div>=C2=A0<br></div><blockquote s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex" class=3D"gmail_quote"><div dir=3D"ltr"><div class=3D"gmail_e=
xtra"><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">I&#39=
;m not sure what happens if two packages can have a different on-disk name =
(i.e. kernel-module-foo-1.2<br>and kernel-module-foo-1.3) and both RPROVIDE=
 &quot;kernel-module-foo&quot;. Only one would be installed,<br></div><div =
class=3D"gmail_quote">but if someone did an apt-get or a smart install of k=
ernel-module-foo .. chaos may erupt.<br></div><div class=3D"gmail_quote"></=
div><div class=3D"gmail_quote"><br></div></div></div></blockquote><div>=C2=
=A0</div><div>That is an interesting alternative and I looked in to that a =
bit by doing the necessary hack and testing it out. Your earlier concerns a=
re solved with this - you can do RDEPENDS_x =3D &quot;kernel-module-foo&quo=
t; and I can install that virtual package using &quot;apt-get install kerne=
l-module-foo&quot; as long as I only have one package providing that virtua=
l package available.=C2=A0 But as soon as I have more than one package prov=
iding that virtual package, apt-get refuses to install it without me statin=
g exactly what package I want. Hence I then need to point out kernel-module=
-foo-&lt;version&gt;. The reason for this seems to be that virtual packages=
 are not versioned (again package version - not the postfix string we discu=
ss here). This is not a huge problem for me with my current use case, but i=
f I&#39;d only install a couple of kernel modules with bitbake and then lat=
er would want to upgrade them using e.g. &quot;apt-get dist-upgrade&quot; o=
r &quot;apt-get upgrade&quot;, that would be a problem. <br><br>I agree add=
ing a huge number of more meta packages should be avoided if=20
possible.<br>=C2=A0=C2=A0 <br></div><blockquote style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex" class=3D"gm=
ail_quote"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_=
quote"></div><div class=3D"gmail_quote"><span class=3D"gmail-"><div>=C2=A0<=
/div><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex" class=3D"gmail_quote"><div bgcolor=3D"#FFF=
FFF">
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
n.<br></div></div></div></div></blockquote><div><br></div><div>Given my tes=
ts described above, this may be the best solution, yes. <br>=C2=A0<br></div=
><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex" class=3D"gmail_quote"><div dir=3D"ltr"><div cl=
ass=3D"gmail_extra"><div class=3D"gmail_quote"><div></div><div><br></div><d=
iv>I mentioned wildcards above, I&#39;m not sure if anyone else reading thi=
s thread knows if RDEPENDS<br></div><div>can use wildcards ? i.e. if RDEPEN=
DS=3D&quot;kernel-module-foo-4%<wbr>&quot;=C2=A0 or &quot;kernel-module-foo=
-%&quot; worked,<br></div><div>then I could see the version string requirem=
ent being less of an issue and not something that would<br></div><div>requi=
re constant bumping as the kernel version changed.<br></div></div></div></d=
iv></blockquote><div>=C2=A0<br></div><div>I have not tested this yet and do=
n&#39;t know if it would work, but of course it would require recipes to be=
 changed.<br></div><br></div>Ola<br><br></div></div>

--001a113fa0924e7cc30545d29f4f--
