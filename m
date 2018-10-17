Return-Path: <yann.dirson@blade-group.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2B1C8799F9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 16:18:55 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id c32so26769134otb.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 09:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=blade-group.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Krz9DNmHjYPw7PgGAaGxJcz/8Eec7uuxvadjjo/nZYo=;
	b=Sf/wqZ0ZYJZaNUw6IaA85Xt8KN0REZKEXMB1Jz/qZR1Zc0QegThMr97XokIiZWt5Jc
	dTkXoWom2CKlgij9eKjsM7zCgw1YFbTkVz43TsOsUsuXW2tHBf3OqfLxPRWsbujnYBOd
	Lz/24WQkEPkvqxq2dE0qjhuw+0yQhYBLK6Yj5NhAQAqT1yL/65m6vc9Z9gGZc7RQhe5D
	uamqVLJhOjnzjneedEPCl2MHaPg8Nbl3ywruWrTF3cxJNp7ESpIkKvuCJbUnLXUEzM+E
	A8J7O+vy5pvkMlGFCXRhlebjJO31nGLrKvQNZBUIK/ws0flQvWkFnKg5G2CA1q0Z+axH
	+rSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Krz9DNmHjYPw7PgGAaGxJcz/8Eec7uuxvadjjo/nZYo=;
	b=ENgG2HfX1rdLxyvt7u0bA5koczRt3ioRxjJd/J5mApuZ7L1vZXdaABA1qrtZmgpH0t
	Lgdj1lHGl6sxBMcWQNIAS1HWBgOSYiUSki6ReO9mQb0br/hMa4OgFHbpPt5aYVviVpSJ
	Tdk/xmTBrrOH3R8grUYRc+e46zwo8aruF+1mlKHVX9Emzka9YclSNay8E3g+LT6/YPd3
	o2OkN7XuMnIcajDt1oLwuo6KyEMo4Fb7q1Mx8jRMDdHoehY7/7IV9tzlwQ0Rvbljekw0
	CR8Pc8kl7/MUdruyeON+LlAM3A28tOFZObIJsmSntDWCXIqj89fpTCfZeT1ryQOFMWfP
	2iZQ==
X-Gm-Message-State: ABuFfojYGbOwAz9uSENETrl0GXVl4udiRpevttHHWavo0b6KUkCTKM3j
	huzmZGkGD3Jd1gM5iWM92Ai+96Mfjjy9UDa36XJubQ==
X-Google-Smtp-Source: ACcGV60/5cwMs+X7eSm7DEq8xh/0oIOM1EvoZackIl4NsM0n+m79CaKI956vPEtYcvHxgQo5MCKocZiWiJic+4Lwdw4=
X-Received: by 2002:a9d:4359:: with SMTP id y25mr17827205oti.80.1539793135959; 
	Wed, 17 Oct 2018 09:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <20181017150757.14591-1-yann@blade-group.com>
	<CA+chaQekOHi4H=YYwvRvHv6AxV1UT909AOdmcTj+J_LJ4uRz-A@mail.gmail.com>
	<CA+4=imbf=QA9B_pUA3dcqnjB4vM0XjiTvk2VozNMtne64r+n7Q@mail.gmail.com>
	<CA+chaQe=QSL=H+vdu3JFgTbzh53ogwx+fY-59-Dms_8Snhtk9g@mail.gmail.com>
	<CA+4=imYNXTXxO04GCxpL9_yJGqa3qGE_3LiZNMWK_hRD8reGpQ@mail.gmail.com>
	<CA+chaQcqzEi_vuWJyVjF_Wgg2Pm9JCHAj=2K9iM2A2GQuYFVzg@mail.gmail.com>
In-Reply-To: <CA+chaQcqzEi_vuWJyVjF_Wgg2Pm9JCHAj=2K9iM2A2GQuYFVzg@mail.gmail.com>
From: Yann Dirson <yann.dirson@blade-group.com>
Date: Wed, 17 Oct 2018 18:18:43 +0200
Message-ID: <CA+4=imYCruany9kMDZLBc+4zBkVTSywKT1udifJm5d5UpOiq2g@mail.gmail.com>
To: martin.jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] packagegroup-tools-bluetooth: work as advertized on distro without bluez* support
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
X-List-Received-Date: Wed, 17 Oct 2018 16:18:55 -0000
Content-Type: multipart/alternative; boundary="000000000000e5924805786f0625"

--000000000000e5924805786f0625
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

BTW, patchwork made me resend the patch to openembedded-devel, which list
would be right for this ?

Le mer. 17 oct. 2018 =C3=A0 17:54, Martin Jansa <martin.jansa@gmail.com> a
=C3=A9crit :

> Hmm, you're right 5397ae5 would be better with just DISTRO_FEATURES
> replaced with BLUEZ variable in
>
> RDEPENDS_${PN} =3D " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'bluez5',
> '${BLUEZ5_INSTALL}', "", d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'bluez4',
> '${BLUEZ4_INSTALL}', "", d)} \
> "
>
> Then it would work fine for both use cases and empty BLUEZ as well.
>
> On Wed, Oct 17, 2018 at 5:47 PM Yann Dirson <yann.dirson@blade-group.com>
> wrote:
>
>> Well, inline python was what was originally used before 5397ae5.
>>
>> Le mer. 17 oct. 2018 =C3=A0 17:46, Martin Jansa <martin.jansa@gmail.com>=
 a
>> =C3=A9crit :
>>
>>> well, I realized that this won't work with the BLUEZ intentionally set
>>> to empty value and setting BLUEZ to no-bluetooth globally also probably
>>> won't work for cases where it might be used in e.g. RDEPENDS_${PN} :/.
>>> Maybe inline python appending only either bluez4 or bluez5 alternative =
here?
>>>
>>> On Wed, Oct 17, 2018 at 5:43 PM Yann Dirson <yann.dirson@blade-group.co=
m>
>>> wrote:
>>>
>>>> Yeah, that looks like a better idea.
>>>>
>>>> Le mer. 17 oct. 2018 =C3=A0 17:27, Martin Jansa <martin.jansa@gmail.co=
m> a
>>>> =C3=A9crit :
>>>>
>>>>> What about using some less confusing default BLUEZ value? RDEPENDS_
>>>>> looks wrong.
>>>>>
>>>>> BLUEZ ??=3D "no-bluetooth"
>>>>> RDEPENDS_no-bluetooth =3D ""
>>>>>
>>>>> Might be a bit more clear.
>>>>>
>>>>> On Wed, Oct 17, 2018 at 5:08 PM <yann.dirson@blade-group.com> wrote:
>>>>>
>>>>>> From: Yann Dirson <yann@blade-group.com>
>>>>>>
>>>>>> Otherwise the build fails with:
>>>>>>
>>>>>>   NOTE: Runtime target '${RDEPENDS_}' is unbuildable, removing...
>>>>>>   Missing or unbuildable dependency chain was: ['${RDEPENDS_}']
>>>>>>
>>>>>> This restores some truth in the "Otherwise install nothing" comment
>>>>>> in the recipe.
>>>>>>
>>>>>> Signed-off-by: Yann Dirson <yann@blade-group.com>
>>>>>> ---
>>>>>>  .../packagegroups/packagegroup-tools-bluetooth.bb               | 2
>>>>>> ++
>>>>>>  1 file changed, 2 insertions(+)
>>>>>>
>>>>>> diff --git a/meta-oe/recipes-connectivity/packagegroups/
>>>>>> packagegroup-tools-bluetooth.bb
>>>>>> b/meta-oe/recipes-connectivity/packagegroups/
>>>>>> packagegroup-tools-bluetooth.bb
>>>>>> index 0ede5e57b..e81516fef 100644
>>>>>> --- a/meta-oe/recipes-connectivity/packagegroups/
>>>>>> packagegroup-tools-bluetooth.bb
>>>>>> +++ b/meta-oe/recipes-connectivity/packagegroups/
>>>>>> packagegroup-tools-bluetooth.bb
>>>>>> @@ -32,6 +32,8 @@ RDEPENDS_bluez5 =3D " \
>>>>>>          '', d)} \
>>>>>>  "
>>>>>>
>>>>>> +RDEPENDS_ =3D ""
>>>>>> +
>>>>>>  # Install bluez4 tools or bluez5 tools depending on what is
>>>>>> specified in the distro.
>>>>>>  # Otherwise install nothing.
>>>>>>  RDEPENDS_${PN} =3D "${RDEPENDS_${BLUEZ}}"
>>>>>> --
>>>>>> 2.19.1
>>>>>>
>>>>>> --
>>>>>> _______________________________________________
>>>>>> Openembedded-core mailing list
>>>>>> Openembedded-core@lists.openembedded.org
>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>>>
>>>>>
>>>>
>>>> --
>>>> Yann Dirson <yann@blade-group.com>
>>>> Blade -- 38 rue du Sentier, 75002 Paris
>>>>
>>>
>>
>> --
>> Yann Dirson <yann@blade-group.com>
>> Blade -- 38 rue du Sentier, 75002 Paris
>>
>

--=20
Yann Dirson <yann@blade-group.com>
Blade -- 38 rue du Sentier, 75002 Paris

--000000000000e5924805786f0625
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">BTW, patchwork made me resend the patch to openembedded-de=
vel, which list would be right for this ?<br></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr">Le=C2=A0mer. 17 oct. 2018 =C3=A0=C2=A017:54, Martin=
 Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com=
</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div d=
ir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hmm, you&#39;re right 5397ae5 =
would be better with just=C2=A0DISTRO_FEATURES replaced with BLUEZ variable=
 in</div><div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr">RDEPE=
NDS_${PN} =3D &quot; \</div><div dir=3D"ltr">=C2=A0 =C2=A0 =C2=A0${@bb.util=
s.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluez5&#39;, &#39;${BLUEZ5_INSTA=
LL}&#39;, &quot;&quot;, d)} \</div><div dir=3D"ltr">=C2=A0 =C2=A0 =C2=A0${@=
bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluez4&#39;, &#39;${BLUEZ=
4_INSTALL}&#39;, &quot;&quot;, d)} \</div><div dir=3D"ltr">&quot;</div><div=
 dir=3D"ltr"><br></div><div>Then it would work fine for both use cases and =
empty BLUEZ as well.</div></div></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr">On Wed, Oct 17, 2018 at 5:47 PM Yann Dirson &lt;<a href=3D=
"mailto:yann.dirson@blade-group.com" target=3D"_blank">yann.dirson@blade-gr=
oup.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"=
ltr">Well, inline python was what was originally used before 5397ae5.<br></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr">Le=C2=A0mer. 17 oct. 20=
18 =C3=A0=C2=A017:46, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail=
.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">well, I realized t=
hat this won&#39;t work with the BLUEZ intentionally set to empty value and=
 setting BLUEZ to no-bluetooth globally also probably won&#39;t work for ca=
ses where it might be used in e.g. RDEPENDS_${PN} :/. Maybe inline python a=
ppending only either bluez4 or bluez5 alternative here?</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Wed, Oct 17, 2018 at 5:43 PM Yann Dirs=
on &lt;<a href=3D"mailto:yann.dirson@blade-group.com" target=3D"_blank">yan=
n.dirson@blade-group.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div dir=3D"ltr">Yeah, that looks like a better idea. <br></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr">Le=C2=A0mer. 17 oct. 2018 =C3=A0=
=C2=A017:27, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" tar=
get=3D"_blank">martin.jansa@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr">What about using some less =
confusing default BLUEZ value? RDEPENDS_ looks wrong.<div><br></div><div>BL=
UEZ ??=3D &quot;no-bluetooth&quot;</div><div>RDEPENDS_no-bluetooth =3D &quo=
t;&quot;</div><div><br></div><div>Might be a bit more clear.</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Oct 17, 2018 at 5:08 P=
M &lt;<a href=3D"mailto:yann.dirson@blade-group.com" target=3D"_blank">yann=
.dirson@blade-group.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">From: Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" target=3D=
"_blank">yann@blade-group.com</a>&gt;<br>
<br>
Otherwise the build fails with:<br>
<br>
=C2=A0 NOTE: Runtime target &#39;${RDEPENDS_}&#39; is unbuildable, removing=
...<br>
=C2=A0 Missing or unbuildable dependency chain was: [&#39;${RDEPENDS_}&#39;=
]<br>
<br>
This restores some truth in the &quot;Otherwise install nothing&quot; comme=
nt in the recipe.<br>
<br>
Signed-off-by: Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" targ=
et=3D"_blank">yann@blade-group.com</a>&gt;<br>
---<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-tools-bluetooth.bb" =
rel=3D"noreferrer" target=3D"_blank">packagegroup-tools-bluetooth.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-connectivity/packagegroups/<a href=3D"http://p=
ackagegroup-tools-bluetooth.bb" rel=3D"noreferrer" target=3D"_blank">packag=
egroup-tools-bluetooth.bb</a> b/meta-oe/recipes-connectivity/packagegroups/=
<a href=3D"http://packagegroup-tools-bluetooth.bb" rel=3D"noreferrer" targe=
t=3D"_blank">packagegroup-tools-bluetooth.bb</a><br>
index 0ede5e57b..e81516fef 100644<br>
--- a/meta-oe/recipes-connectivity/packagegroups/<a href=3D"http://packageg=
roup-tools-bluetooth.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-=
tools-bluetooth.bb</a><br>
+++ b/meta-oe/recipes-connectivity/packagegroups/<a href=3D"http://packageg=
roup-tools-bluetooth.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-=
tools-bluetooth.bb</a><br>
@@ -32,6 +32,8 @@ RDEPENDS_bluez5 =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;&#39;, d)} \<br>
=C2=A0&quot;<br>
<br>
+RDEPENDS_ =3D &quot;&quot;<br>
+<br>
=C2=A0# Install bluez4 tools or bluez5 tools depending on what is specified=
 in the distro.<br>
=C2=A0# Otherwise install nothing.<br>
=C2=A0RDEPENDS_${PN} =3D &quot;${RDEPENDS_${BLUEZ}}&quot;<br>
-- <br>
2.19.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"m=
_1571655446455322552m_-7798490518947502568m_-2074142617775729286m_-54842893=
21282644411gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"=
ltr"><div>Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" target=3D=
"_blank">yann@blade-group.com</a>&gt;<br>Blade -- 38 rue du Sentier, 75002 =
Paris<br></div></div></div>
</blockquote></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"m=
_1571655446455322552m_-7798490518947502568gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><div>Yann Dirson &lt;<a href=3D"mailt=
o:yann@blade-group.com" target=3D"_blank">yann@blade-group.com</a>&gt;<br>B=
lade -- 38 rue du Sentier, 75002 Paris<br></div></div></div>
</blockquote></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Ya=
nn Dirson &lt;<a href=3D"mailto:yann@blade-group.com" target=3D"_blank">yan=
n@blade-group.com</a>&gt;<br>Blade -- 38 rue du Sentier, 75002 Paris<br></d=
iv></div></div>

--000000000000e5924805786f0625--
