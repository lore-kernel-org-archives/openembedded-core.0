Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 740497EC54
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 16:30:20 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id 44so23929055qtg.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 09:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KFqAj2lzApXl5x5oYLhRG4lNQK2D87ldQFygNs9WWR4=;
	b=vQeynkCK/mUIVKa9pDduCrDHswN2dtj4TEStmjNxJBrh0+ZmLkmyYCmtEWn1WTgBJN
	wn0DCqkUmrOPpC2V1sfuA+wOufWhhG89zXV/5wn/Pym6OwpBbHOJtvdZJCiSC1HI7vhb
	jiVxQc255qU9+oxYxTJ5PLoPm7bcSz+ygMWHEB9YvcYzmiYurRGOZi7fZvRciNrrI3qh
	ZeFKinrE+BYm29JJnEF3XoOHPmvY888BRFO1jIY4xzJg/AmilGREotKLYsrdR/DM6MxG
	jP7fEJhD64VMDxvqfSzITwNVCOW9A+BA6WPAfxUIp01zomDdqdR4h1cxpxZAa9bbKrwl
	aOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KFqAj2lzApXl5x5oYLhRG4lNQK2D87ldQFygNs9WWR4=;
	b=lkI/deQxCj9rFhAvAPgi8NdJFN3mn2dtE0OmPxR0vmLwvpZiOpjL3oaSLwnQ8YCd48
	mhAJBbxlKkFgjoJ7kembLxCHVkS+T5ppsde+RrQAysbQb3kayHPRLdWtHXlx9GtDLu8m
	bdReqPTRHfBB1ezryEM+EMxcgBYU2wWJF1mf3yLD3OcpCuj83qNWZuLoBZd1Q36KTrKh
	3d1ejJenfItL1F1ja50VxZHBUEP4P7c0iSWrJjW/CQ/3pQKFPY3vEmyMW8Yl7Sgyymww
	Di0TagyzB/dH/ShbmyMG6+EVCdwBT8RHUh3cg4nId2gXp4zWlZToX8u6hGxhQpZPbY0D
	9oSQ==
X-Gm-Message-State: APjAAAVN42gOgBZ4pzLLAeJdXrVcmZ7+YbtPGshlkwoziG1Dwm6xa68o
	R2Cul7bcoT7S4Q0qpJUjHPjYmFVpgROuXEdyQPM=
X-Google-Smtp-Source: APXvYqztEC+nxxgIR556bIm3WPpRmB6Jam7XMLQK/wFERdmjkf9DcKnX9nAuPg5sAYAUTXtOWsOojPsDWLqAclQ8aoc=
X-Received: by 2002:ac8:525a:: with SMTP id y26mr28516725qtn.378.1563381021025;
	Wed, 17 Jul 2019 09:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190715102016.114264-1-kai.kang@windriver.com>
	<CAMKF1sq8rpdxdH2Yr8bHze06-R3hsmLTDdSLkX-TEj4utY2VYQ@mail.gmail.com>
	<0f664af2-cea3-aaa2-2a7c-74c43d58ced4@windriver.com>
	<CAMKF1spSOgaLYgy6U3r=wXNPcMA+qyy1Oigpob42xFAOFugbvA@mail.gmail.com>
	<8164ebb7-8a4f-a7ce-74de-e4adb60a6022@windriver.com>
	<CAMKF1sp=r+x8+DyGPAmJUfAMn6qtSzjquP+iaEwjtz1SkYXf7A@mail.gmail.com>
	<4d14f4a4-c3a2-ed2d-e8dc-fd6de1963124@windriver.com>
	<CAMKF1srFgjj8r2PqzPKmsi2NToOkd60TknrcPWP4-pvRLLu58A@mail.gmail.com>
	<90bfbd77-4e09-9a83-77b1-e87d24e13c5c@windriver.com>
In-Reply-To: <90bfbd77-4e09-9a83-77b1-e87d24e13c5c@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Jul 2019 09:30:10 -0700
Message-ID: <CAMKF1sqJSPWavEz6RBdRXs5RKzousK=B=o=Gkg==thZA+Ww8pA@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: set incomptible with tune mips
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
X-List-Received-Date: Wed, 17 Jul 2019 16:30:20 -0000
Content-Type: multipart/alternative; boundary="000000000000682a85058de30235"

--000000000000682a85058de30235
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2019 at 1:25 AM Kang Kai <Kai.Kang@windriver.com> wrote:

> On 2019/7/17 =E4=B8=8B=E5=8D=884:18, Khem Raj wrote:
> > oh COMPATIBLE_HOST_mipsarch threw me off. do we need to use the
> > override when the specific check
> > is done on right hand side?
>
> I didn't figure out a better way to reset COMPATIBLE_HOST only for
> default tune 'mips'.  Without override _mipsarch,
> I need to list all the COMPATIBLE_HOSTs such as
> "(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'" in the *else*
> part of bb.utils.contains().


You could use (*)

>
>
> Regards,
> Kai
>
>
> >
> > On Tue, Jul 16, 2019 at 11:51 PM Kang Kai <Kai.Kang@windriver.com>
> wrote:
> >> On 2019/7/17 =E4=B8=8B=E5=8D=882:20, Khem Raj wrote:
> >>
> >> Right so we should only disable the tunes which don=E2=80=99t have clz=
 and not
> all mips as this patch is doing
> >>
> >> The patch only set COMPATILE_HOST to null  only when default tune is
> 'mips' which causes webkitgtk fails.
> >> And for other conditions, it doesn't block to build that the
> COMPATILE_HOST is 'mips.*-linux'.  Such as the
> >> default bsps qemumips(default tune mips32r2) and qemumips64(mips64r2),
> it doesn't affect them.
> >>
> >> Kai
> >>
> >>
> >>
> >> On Tue, Jul 16, 2019 at 10:42 PM Kang Kai <Kai.Kang@windriver.com>
> wrote:
> >>> On 2019/7/16 =E4=B8=8B=E5=8D=8811:33, Khem Raj wrote:
> >>>
> >>>
> >>>
> >>> On Tue, Jul 16, 2019 at 2:33 AM Kang Kai <Kai.Kang@windriver.com>
> wrote:
> >>>> On 2019/7/16 =E4=B8=8B=E5=8D=883:19, Khem Raj wrote:
> >>>>> On Mon, Jul 15, 2019 at 3:21 AM <kai.kang@windriver.com> wrote:
> >>>>>> From: Kai Kang <kai.kang@windriver.com>
> >>>>>>
> >>>>>> It fails to compile webkit when default tune is 'mips':
> >>>>>>
> >>>>>> |
> .../tmp-glibc/work/mips-wrs-linux/webkitgtk/2.24.2-r0/webkitgtk-2.24.2
> >>>>>> | /Source/JavaScriptCore/assembler/MacroAssemblerMIPS.h:418:23:
> >>>>>> | error: static assertion failed: CLZ opcode is not available for
> this ISA
> >>>>>>
> >>>>>> So don't build webkit when default tune is mips.
> >>>>>>
> >>>>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >>>>>> ---
> >>>>>>    meta/recipes-sato/webkit/webkitgtk_2.24.2.bb | 2 ++
> >>>>>>    1 file changed, 2 insertions(+)
> >>>>>>
> >>>>>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
> b/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
> >>>>>> index 056334fff5..891266b220 100644
> >>>>>> --- a/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
> >>>>>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
> >>>>>> @@ -43,6 +43,8 @@ DEPENDS =3D "zlib libsoup-2.4 curl libxml2 cairo
> libxslt libxt libidn libgcrypt \
> >>>>>>              gettext-native glib-2.0 glib-2.0-native libtasn1 \
> >>>>>>              "
> >>>>>>
> >>>>>> +COMPATIBLE_HOST_mipsarch =3D "${@bb.utils.contains('DEFAULTTUNE',
> 'mips', 'null', 'mips.*-linux', d)}"
> >>>>>> +
> >>>>> this disables is for all kind of mips. I think thats a broad set, i=
t
> >>>>> would be best to narrow it to what you saw it failing for
> >>>>> e.g. it should work for mips32 and mips64 so maybe mips1 is what yo=
u
> >>>>> want to disable for
> >>>> I tested with qemumips and qemumips64. When set
> >>>>
> >>>> DEFAULTTUNE=3D "mips"
> >>>
> >>> How about using mips32 and mips64 for default tune and retest
> >>>
> >>>
> >>> It build webkitgtk successfully on qemumips and qemumips64 with
> default tune mips32 and mips64.
> >>>
> >>>
> >>>>
> >>>> It fails with the error.
> >>>>
> >>>> Regards,
> >>>> Kai
> >>>>
> >>>>>
> >>>>>>    PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES',
> 'x11', 'x11', 'wayland' ,d)} \
> >>>>>>                       ${@bb.utils.contains('DISTRO_FEATURES',
> 'opengl', 'webgl opengl', '' ,d)} \
> >>>>>>                       enchant \
> >>>>>> --
> >>>>>> 2.20.0
> >>>>>>
> >>>>>> --
> >>>>>> _______________________________________________
> >>>>>> Openembedded-core mailing list
> >>>>>> Openembedded-core@lists.openembedded.org
> >>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>>>
> >>>> --
> >>>> Kai Kang
> >>>>
> >>> --
> >>> Kai Kang
> >>
> >> --
> >> Kai Kang
>
>
> --
> Kai Kang
>
>

--000000000000682a85058de30235
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jul 17, 2019 at 1:25 AM Kang Kai &lt;<a href=3D"mai=
lto:Kai.Kang@windriver.com">Kai.Kang@windriver.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On 2019/7/17 =E4=B8=8B=E5=8D=884:18, Khem Ra=
j wrote:<br>
&gt; oh COMPATIBLE_HOST_mipsarch threw me off. do we need to use the<br>
&gt; override when the specific check<br>
&gt; is done on right hand side?<br>
<br>
I didn&#39;t figure out a better way to reset COMPATIBLE_HOST only for <br>
default tune &#39;mips&#39;.=C2=A0 Without override _mipsarch,<br>
I need to list all the COMPATIBLE_HOSTs such as <br>
&quot;(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux&#39;&quot; i=
n the *else*<br>
part of bb.utils.contains().</blockquote><div dir=3D"auto"><br></div><div d=
ir=3D"auto">You could use (*)=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br=
>
<br>
Regards,<br>
Kai<br>
<br>
<br>
&gt;<br>
&gt; On Tue, Jul 16, 2019 at 11:51 PM Kang Kai &lt;<a href=3D"mailto:Kai.Ka=
ng@windriver.com" target=3D"_blank">Kai.Kang@windriver.com</a>&gt; wrote:<b=
r>
&gt;&gt; On 2019/7/17 =E4=B8=8B=E5=8D=882:20, Khem Raj wrote:<br>
&gt;&gt;<br>
&gt;&gt; Right so we should only disable the tunes which don=E2=80=99t have=
 clz and not all mips as this patch is doing<br>
&gt;&gt;<br>
&gt;&gt; The patch only set COMPATILE_HOST to null=C2=A0 only when default =
tune is &#39;mips&#39; which causes webkitgtk fails.<br>
&gt;&gt; And for other conditions, it doesn&#39;t block to build that the C=
OMPATILE_HOST is &#39;mips.*-linux&#39;.=C2=A0 Such as the<br>
&gt;&gt; default bsps qemumips(default tune mips32r2) and qemumips64(mips64=
r2), it doesn&#39;t affect them.<br>
&gt;&gt;<br>
&gt;&gt; Kai<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Jul 16, 2019 at 10:42 PM Kang Kai &lt;<a href=3D"mailto:Ka=
i.Kang@windriver.com" target=3D"_blank">Kai.Kang@windriver.com</a>&gt; wrot=
e:<br>
&gt;&gt;&gt; On 2019/7/16 =E4=B8=8B=E5=8D=8811:33, Khem Raj wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Tue, Jul 16, 2019 at 2:33 AM Kang Kai &lt;<a href=3D"mailto=
:Kai.Kang@windriver.com" target=3D"_blank">Kai.Kang@windriver.com</a>&gt; w=
rote:<br>
&gt;&gt;&gt;&gt; On 2019/7/16 =E4=B8=8B=E5=8D=883:19, Khem Raj wrote:<br>
&gt;&gt;&gt;&gt;&gt; On Mon, Jul 15, 2019 at 3:21 AM &lt;<a href=3D"mailto:=
kai.kang@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt; wr=
ote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; From: Kai Kang &lt;<a href=3D"mailto:kai.kang@wind=
river.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; It fails to compile webkit when default tune is &#=
39;mips&#39;:<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; | .../tmp-glibc/work/mips-wrs-linux/webkitgtk/2.24=
.2-r0/webkitgtk-2.24.2<br>
&gt;&gt;&gt;&gt;&gt;&gt; | /Source/JavaScriptCore/assembler/MacroAssemblerM=
IPS.h:418:23:<br>
&gt;&gt;&gt;&gt;&gt;&gt; | error: static assertion failed: CLZ opcode is no=
t available for this ISA<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; So don&#39;t build webkit when default tune is mip=
s.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.=
kang@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 meta/recipes-sato/webkit/<a href=3D"h=
ttp://webkitgtk_2.24.2.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2=
.24.2.bb</a> | 2 ++<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 1 file changed, 2 insertions(+)<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; diff --git a/meta/recipes-sato/webkit/<a href=3D"h=
ttp://webkitgtk_2.24.2.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2=
.24.2.bb</a> b/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.24.2.=
bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.24.2.bb</a><br>
&gt;&gt;&gt;&gt;&gt;&gt; index 056334fff5..891266b220 100644<br>
&gt;&gt;&gt;&gt;&gt;&gt; --- a/meta/recipes-sato/webkit/<a href=3D"http://w=
ebkitgtk_2.24.2.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.24.2.b=
b</a><br>
&gt;&gt;&gt;&gt;&gt;&gt; +++ b/meta/recipes-sato/webkit/<a href=3D"http://w=
ebkitgtk_2.24.2.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.24.2.b=
b</a><br>
&gt;&gt;&gt;&gt;&gt;&gt; @@ -43,6 +43,8 @@ DEPENDS =3D &quot;zlib libsoup-2=
.4 curl libxml2 cairo libxslt libxt libidn libgcrypt \<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ge=
ttext-native glib-2.0 glib-2.0-native libtasn1 \<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &q=
uot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; +COMPATIBLE_HOST_mipsarch =3D &quot;${@bb.utils.co=
ntains(&#39;DEFAULTTUNE&#39;, &#39;mips&#39;, &#39;null&#39;, &#39;mips.*-l=
inux&#39;, d)}&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt; this disables is for all kind of mips. I think thats a=
 broad set, it<br>
&gt;&gt;&gt;&gt;&gt; would be best to narrow it to what you saw it failing =
for<br>
&gt;&gt;&gt;&gt;&gt; e.g. it should work for mips32 and mips64 so maybe mip=
s1 is what you<br>
&gt;&gt;&gt;&gt;&gt; want to disable for<br>
&gt;&gt;&gt;&gt; I tested with qemumips and qemumips64. When set<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; DEFAULTTUNE=3D &quot;mips&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; How about using mips32 and mips64 for default tune and retest<=
br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; It build webkitgtk successfully on qemumips and qemumips64 wit=
h default tune mips32 and mips64.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; It fails with the error.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt;&gt; Kai<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 PACKAGECONFIG ??=3D &quot;${@bb.utils=
.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;x11&#39;, &#39;way=
land&#39; ,d)} \<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES=
&#39;, &#39;opengl&#39;, &#39;webgl opengl&#39;, &#39;&#39; ,d)} \<br>
&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enchant \<br>
&gt;&gt;&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt;&gt;&gt; 2.20.0<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt;&gt;&gt; _______________________________________________<br=
>
&gt;&gt;&gt;&gt;&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembe=
dded.org" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br=
>
&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/l=
istinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://list=
s.openembedded.org/mailman/listinfo/openembedded-core</a><br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt; Kai Kang<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; Kai Kang<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Kai Kang<br>
<br>
<br>
-- <br>
Kai Kang<br>
<br>
</blockquote></div></div>

--000000000000682a85058de30235--
