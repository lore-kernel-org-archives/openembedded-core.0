Return-Path: <sujith.h@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0AEAB71A03
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 05:45:53 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n189so10912613qke.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2016 22:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EuvRIKhudHv+8+4774y6K66xaZb+wLX8w8ebPPqUKRs=;
	b=Q4eQjCbi4aiqqJdgkMQ1NYbAoPY4eXq13AcJHCeD4+qIa2KswVOl6CUiI5jhF2779i
	WSXeB3YnSP93McttnecyA8AXV8U6EPonnvnj5DlGu7nTeKDrk8l8AUksp7S+Oq8zGuYZ
	iYYgsS6MlK9ouoRBBjOWL5o+8wO1O3UXkprgyhKYTA7pOaoSilZ6XiT1bgC4IIL4xYQq
	xh6yd75HQbEp1Qe+TiBulnRWvo8o0eS2bHWmpb/uzZmMi30Rw0kDa5woyLHBl2dMXY82
	s9KQfwoAdgz3QbOgdJ/qXzB6H29Q7QdF+wJQaBFYtS1G6a1kx7fgEchDwp5fkKmhQZcD
	dxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EuvRIKhudHv+8+4774y6K66xaZb+wLX8w8ebPPqUKRs=;
	b=HBIM9/ZtEtC4YaPOY0dBvr90PlmKGtgthFkdBsSS54w5nwvMHgqHSWisGgFFuU68aD
	sKbASdcxMVdtE0Z8Bkz5lCh9dBNYNFUxLKyftZeBzJRtvxP2BJt8urs9db7rSCD1bVzs
	47TzGFb+dkBr18+O/sjCG5++SvTrB+ZoHYIteB2AJN5Ix3GdusYXoTUQpk2LxSJQ62S7
	oPVofZQQZrUIi4bfmMq5Rt7nW3iPx/1qoH6omEpv6Ai8sr5+p3ejdukihs9AWwbL2Q3I
	/V3sQeagK+OzXW5yM7f1uhsxZv5g2Yku9QUIHx5Uk7A/PZxIirj9wRJEh6YwKiZP/uaj
	SBVQ==
X-Gm-Message-State: AA6/9RmsHWpXGKOAQTd2kKbW3Xix9Tv3SSOedO2WSvLftIgRvsXN+C+oa0ml3tod2OjJfT73ZKoIjCqZX9tlpA==
X-Received: by 10.55.20.158 with SMTP id 30mr2109219qku.27.1475646354974; Tue,
	04 Oct 2016 22:45:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.183.1 with HTTP; Tue, 4 Oct 2016 22:45:34 -0700 (PDT)
In-Reply-To: <CABcZANnbd84phqLgQWn4rtzfDCSfvGFn6d9OxOGg_X7tq5UHGg@mail.gmail.com>
References: <1475574064-30613-1-git-send-email-sujith.h@gmail.com>
	<CABcZANnNaQrd9x4=vZuBjkogUDGU81Ft08bJ+AJAVpH+Qh-RjQ@mail.gmail.com>
	<CABcZANnbd84phqLgQWn4rtzfDCSfvGFn6d9OxOGg_X7tq5UHGg@mail.gmail.com>
From: sujith h <sujith.h@gmail.com>
Date: Wed, 5 Oct 2016 11:15:34 +0530
Message-ID: <CADyYWL=6WhJmMUpRr=MjOV_HOvBa2qODSFa0Y44Qy7LUencK=Q@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Sujith Haridasan <Sujith_Haridasan@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: Fix to obey LD failure
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
X-List-Received-Date: Wed, 05 Oct 2016 05:45:54 -0000
Content-Type: multipart/alternative; boundary=001a11400a1acd6d8d053e17b0e6

--001a11400a1acd6d8d053e17b0e6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 4, 2016 at 7:59 PM, Christopher Larson <clarson@kergoth.com>
wrote:

>
>
> On Tue, Oct 4, 2016 at 7:27 AM, Christopher Larson <clarson@kergoth.com>
> wrote:
>
>>
>> On Tue, Oct 4, 2016 at 2:41 AM, Sujith H <sujith.h@gmail.com> wrote:
>>
>>> From: Sujith Haridasan <Sujith_Haridasan@mentor.com>
>>>
>>> When built on minnowmax ( machine name: intel-corei7-64),
>>> an error is noticed during the do_compile:
>>>
>>>  /home/sujith/codebench-linux-install-2015.12-133-i686-pc-li
>>> nux-gnu/codebench/bin/i686-pc-linux-gnu-ld:
>>> Relocatable linking with relocations from format elf64-x86-64
>>> (/home/sujith/MEL/dogwood/build-minnowmax/tmp/work/intel_cor
>>> ei7_64-mel-linux/perf/1.0-r9/perf-1.0/fd/array.o)
>>> to format elf32-i386 (/home/sujith/MEL/dogwood/buil
>>> d-minnowmax/tmp/work/intel_corei7_64-mel-linux/perf/1.0-r9/p
>>> erf-1.0/fd/libapi-in.o)
>>> is not supported
>>>
>>> This change help fix the issue.
>>>
>>> Signed-off-by: Sujith Haridasan <Sujith_Haridasan@mentor.com>
>>> ---
>>>
>>
>> What=E2=80=99s with the redundant submission? You submitted the fix from
>> meta-mentor for this last week, and it was merged. http://git.openembedd=
e
>> d.org/openembedded-core/commit/?id=3D0ce06611068e74e6ea2
>> e226e3f967aaa91fecd25
>>
>
> Ah, nevermind, this adds another sed to the other Makefile. Why does this
> commit message say nothing about that? You should really indicate that th=
e
> previous fix was incomplete. This basically just pulls in the last bit fr=
om
> meta-mentor we didn=E2=80=99t apply in the previous submission, correct?
>

Yes, that's correct. I will update the patch commit message.

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>



--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
<Project>Contributor to Yocto project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info
C-x C-c

--001a11400a1acd6d8d053e17b0e6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Oct 4, 2016 at 7:59 PM, Christopher Larson <span dir=3D"ltr">&l=
t;<a href=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr=
"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><span class=
=3D"">On Tue, Oct 4, 2016 at 7:27 AM, Christopher Larson <span dir=3D"ltr">=
&lt;<a href=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergot=
h.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"l=
tr"><div class=3D"gmail_extra"><span><br><div class=3D"gmail_quote">On Tue,=
 Oct 4, 2016 at 2:41 AM, Sujith H <span dir=3D"ltr">&lt;<a href=3D"mailto:s=
ujith.h@gmail.com" target=3D"_blank">sujith.h@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:s=
olid;padding-left:1ex"><div id=3D"m_5265508435037254623m_-30668724932934553=
95gmail-m_-227703748311286951:2vu" class=3D"m_5265508435037254623m_-3066872=
493293455395gmail-m_-227703748311286951a3s m_5265508435037254623m_-30668724=
93293455395gmail-m_-227703748311286951aXjCH m_5265508435037254623m_-3066872=
493293455395gmail-m_-227703748311286951m1578f11f932cc27a">From: Sujith Hari=
dasan &lt;<a href=3D"mailto:Sujith_Haridasan@mentor.com" target=3D"_blank">=
Sujith_Haridasan@mentor.com</a>&gt;<br>
<br>
When built on minnowmax ( machine name: intel-corei7-64),<br>
an error is noticed during the do_compile:<br>
<br>
=C2=A0/home/sujith/codebench-linux-<wbr>install-2015.12-133-i686-pc-li<wbr>=
nux-gnu/codebench/bin/i686-pc-<wbr>linux-gnu-ld:<br>
Relocatable linking with relocations from format elf64-x86-64<br>
(/home/sujith/MEL/dogwood/buil<wbr>d-minnowmax/tmp/work/intel_cor<wbr>ei7_6=
4-mel-linux/perf/1.0-r9/p<wbr>erf-1.0/fd/array.o)<br>
to format elf32-i386 (/home/sujith/MEL/dogwood/buil<wbr>d-minnowmax/tmp/wor=
k/intel_cor<wbr>ei7_64-mel-linux/perf/1.0-r9/p<wbr>erf-1.0/fd/libapi-in.o)<=
br>
is not supported<br>
<br>
This change help fix the issue.<br>
<br>
Signed-off-by: Sujith Haridasan &lt;<a href=3D"mailto:Sujith_Haridasan@ment=
or.com" target=3D"_blank">Sujith_Haridasan@mentor.com</a>&gt;<br>
---</div></blockquote></div><br></span>What=E2=80=99s with the redundant su=
bmission? You submitted the fix from meta-mentor for this last week, and it=
 was merged.=C2=A0<a href=3D"http://git.openembedded.org/openembedded-core/=
commit/?id=3D0ce06611068e74e6ea2e226e3f967aaa91fecd25" target=3D"_blank">ht=
tp://git.openembedde<wbr>d.org/openembedded-core/<wbr>commit/?id=3D0ce06611=
068e74e6ea2<wbr>e226e3f967aaa91fecd25</a></div></div></blockquote><div><br>=
</div></span><div>Ah, nevermind, this adds another sed to the other Makefil=
e. Why does this commit message say nothing about that? You should really i=
ndicate that the previous fix was incomplete. This basically just pulls in =
the last bit from meta-mentor we didn=E2=80=99t apply in the previous submi=
ssion, correct?</div></div></div></div></blockquote><div><br></div><div>Yes=
, that&#39;s correct. I will update the patch commit message. <br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><sp=
an class=3D"">-- <br><div class=3D"m_5265508435037254623gmail_signature" da=
ta-smartmail=3D"gmail_signature">Christopher Larson<br>clarson at kergoth d=
ot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib=
<br>Senior Software Engineer, Mentor Graphics</div>
</span></div></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div>=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=
=B9=E0=B4=B0=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D<br>Banga=
lore<br>&lt;Project&gt;Contributor to KDE project<br></div><div>&lt;Project=
&gt;Contributor to Yocto project<br></div><div><a href=3D"http://fci.wikia.=
com/wiki/Anti-DRM-Campaign" target=3D"_blank">http://fci.wikia.com/wiki/Ant=
i-DRM-Campaign</a><br>&lt;Blog&gt; <a href=3D"http://sujithh.info" target=
=3D"_blank">http://sujithh.info</a><br></div><div>C-x C-c<br></div></div></=
div></div></div>
</div></div>

--001a11400a1acd6d8d053e17b0e6--
