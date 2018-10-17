Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id B02BC72EA2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 15:54:17 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id a8-v6so2726811wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 08:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=O1Sl1ON6vZLFOAY16C3rauxBC9yblqRzGqxTAYyWv/M=;
	b=a4F/O8nftywC7aqBGBJzvJ4VwopuYvDPFXsLfPjNO9GGSsVLutOiCd0JWw98xLiAwi
	oU2Fsd4QyWx4UyoXM+nblTzIi4ws0mSG+wZmw4qX1AcmVQnfmlnmVrLWsVrSrxhK8s1d
	YRe+Bp+1eaF0d48oEU6VMyGDfi/0GuEicOdAoDIoItWs5kGzGeCIkpVdFteUEGEmByHT
	FnKPZebRpZ02yCvPnxTVUFMsN+u8xoUS7bd9wbItBTn4S4fsHv4AhFj2DDdtGGf45tQL
	jNgJPOuSDRxtgFv/V+j9C+Ynufg9DvP/RJegYUVK3+u9h0LrbpXYIX1WwvFlT30xmSnl
	6FWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=O1Sl1ON6vZLFOAY16C3rauxBC9yblqRzGqxTAYyWv/M=;
	b=jknxGbqp9ZulDAT07nF8sKmr+KQx2V5GsALgTdNtyrvxip8djzOn3fzdmRmR/OuE3k
	hhiszk62W7ZgcMkWlzOUg7Z9yqHotDY/smsBJhStiPIqbAClTLcN0VvgGIq/qVq35j+U
	H+8gnGjaN6qBczc8sZVgljByVTwQW8NM3BgKGOG2WUIxc1zo1N2VbJWSkhRUwTtztUaq
	doiN/ZV7qEQi56R1TubO2LJKidgyseFRPlcylJYvZfno2PfQVF2V872U7QAuFZcY6YrW
	N8kmQXOYDwVAjItgpw2IChul903KB9zYqgekoWxnI9bR4YH4vo8j6VOP8vZoYoJUmul0
	FcFg==
X-Gm-Message-State: ABuFfoig1iGTHefPxMyLySXgGak5YkUEYE9TF+v+jU+c4Jb66Lb1WDpo
	Ufkx7oDSGPTV5IpH4vS91pZAO7F2pv41WnIIyUo=
X-Google-Smtp-Source: ACcGV634m3bqJ2ClJe7N66kK94hVsdZvywf414Rf+H3byDuM9/oPaaYeVzM3yzqkp3bFD6Jsknow/vfRCid6/H06WII=
X-Received: by 2002:a1c:e15:: with SMTP id 21-v6mr3540604wmo.35.1539791658391; 
	Wed, 17 Oct 2018 08:54:18 -0700 (PDT)
MIME-Version: 1.0
References: <20181017150757.14591-1-yann@blade-group.com>
	<CA+chaQekOHi4H=YYwvRvHv6AxV1UT909AOdmcTj+J_LJ4uRz-A@mail.gmail.com>
	<CA+4=imbf=QA9B_pUA3dcqnjB4vM0XjiTvk2VozNMtne64r+n7Q@mail.gmail.com>
	<CA+chaQe=QSL=H+vdu3JFgTbzh53ogwx+fY-59-Dms_8Snhtk9g@mail.gmail.com>
	<CA+4=imYNXTXxO04GCxpL9_yJGqa3qGE_3LiZNMWK_hRD8reGpQ@mail.gmail.com>
In-Reply-To: <CA+4=imYNXTXxO04GCxpL9_yJGqa3qGE_3LiZNMWK_hRD8reGpQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 17 Oct 2018 17:54:07 +0200
Message-ID: <CA+chaQcqzEi_vuWJyVjF_Wgg2Pm9JCHAj=2K9iM2A2GQuYFVzg@mail.gmail.com>
To: yann.dirson@blade-group.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 17 Oct 2018 15:54:18 -0000
Content-Type: multipart/alternative; boundary="000000000000d39d0605786eae15"

--000000000000d39d0605786eae15
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hmm, you're right 5397ae5 would be better with just DISTRO_FEATURES
replaced with BLUEZ variable in

RDEPENDS_${PN} =3D " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', '${BLUEZ5_INSTALL}',
"", d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluez4', '${BLUEZ4_INSTALL}',
"", d)} \
"

Then it would work fine for both use cases and empty BLUEZ as well.

On Wed, Oct 17, 2018 at 5:47 PM Yann Dirson <yann.dirson@blade-group.com>
wrote:

> Well, inline python was what was originally used before 5397ae5.
>
> Le mer. 17 oct. 2018 =C3=A0 17:46, Martin Jansa <martin.jansa@gmail.com> =
a
> =C3=A9crit :
>
>> well, I realized that this won't work with the BLUEZ intentionally set t=
o
>> empty value and setting BLUEZ to no-bluetooth globally also probably won=
't
>> work for cases where it might be used in e.g. RDEPENDS_${PN} :/. Maybe
>> inline python appending only either bluez4 or bluez5 alternative here?
>>
>> On Wed, Oct 17, 2018 at 5:43 PM Yann Dirson <yann.dirson@blade-group.com=
>
>> wrote:
>>
>>> Yeah, that looks like a better idea.
>>>
>>> Le mer. 17 oct. 2018 =C3=A0 17:27, Martin Jansa <martin.jansa@gmail.com=
> a
>>> =C3=A9crit :
>>>
>>>> What about using some less confusing default BLUEZ value? RDEPENDS_
>>>> looks wrong.
>>>>
>>>> BLUEZ ??=3D "no-bluetooth"
>>>> RDEPENDS_no-bluetooth =3D ""
>>>>
>>>> Might be a bit more clear.
>>>>
>>>> On Wed, Oct 17, 2018 at 5:08 PM <yann.dirson@blade-group.com> wrote:
>>>>
>>>>> From: Yann Dirson <yann@blade-group.com>
>>>>>
>>>>> Otherwise the build fails with:
>>>>>
>>>>>   NOTE: Runtime target '${RDEPENDS_}' is unbuildable, removing...
>>>>>   Missing or unbuildable dependency chain was: ['${RDEPENDS_}']
>>>>>
>>>>> This restores some truth in the "Otherwise install nothing" comment i=
n
>>>>> the recipe.
>>>>>
>>>>> Signed-off-by: Yann Dirson <yann@blade-group.com>
>>>>> ---
>>>>>  .../packagegroups/packagegroup-tools-bluetooth.bb               | 2
>>>>> ++
>>>>>  1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/meta-oe/recipes-connectivity/packagegroups/
>>>>> packagegroup-tools-bluetooth.bb
>>>>> b/meta-oe/recipes-connectivity/packagegroups/
>>>>> packagegroup-tools-bluetooth.bb
>>>>> index 0ede5e57b..e81516fef 100644
>>>>> --- a/meta-oe/recipes-connectivity/packagegroups/
>>>>> packagegroup-tools-bluetooth.bb
>>>>> +++ b/meta-oe/recipes-connectivity/packagegroups/
>>>>> packagegroup-tools-bluetooth.bb
>>>>> @@ -32,6 +32,8 @@ RDEPENDS_bluez5 =3D " \
>>>>>          '', d)} \
>>>>>  "
>>>>>
>>>>> +RDEPENDS_ =3D ""
>>>>> +
>>>>>  # Install bluez4 tools or bluez5 tools depending on what is specifie=
d
>>>>> in the distro.
>>>>>  # Otherwise install nothing.
>>>>>  RDEPENDS_${PN} =3D "${RDEPENDS_${BLUEZ}}"
>>>>> --
>>>>> 2.19.1
>>>>>
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>>
>>>>
>>>
>>> --
>>> Yann Dirson <yann@blade-group.com>
>>> Blade -- 38 rue du Sentier, 75002 Paris
>>>
>>
>
> --
> Yann Dirson <yann@blade-group.com>
> Blade -- 38 rue du Sentier, 75002 Paris
>

--000000000000d39d0605786eae15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hmm, you&#39;re right 53=
97ae5 would be better with just=C2=A0DISTRO_FEATURES replaced with BLUEZ va=
riable in</div><div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr"=
>RDEPENDS_${PN} =3D &quot; \</div><div dir=3D"ltr">=C2=A0 =C2=A0 =C2=A0${@b=
b.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluez5&#39;, &#39;${BLUEZ5=
_INSTALL}&#39;, &quot;&quot;, d)} \</div><div dir=3D"ltr">=C2=A0 =C2=A0 =C2=
=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluez4&#39;, &#39;$=
{BLUEZ4_INSTALL}&#39;, &quot;&quot;, d)} \</div><div dir=3D"ltr">&quot;</di=
v><div dir=3D"ltr"><br></div><div>Then it would work fine for both use case=
s and empty BLUEZ as well.</div></div></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr">On Wed, Oct 17, 2018 at 5:47 PM Yann Dirson &lt;<a h=
ref=3D"mailto:yann.dirson@blade-group.com">yann.dirson@blade-group.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Well, i=
nline python was what was originally used before 5397ae5.<br></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr">Le=C2=A0mer. 17 oct. 2018 =C3=A0=C2=
=A017:46, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=
=3D"_blank">martin.jansa@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><div dir=3D"ltr">well, I realized that this won=
&#39;t work with the BLUEZ intentionally set to empty value and setting BLU=
EZ to no-bluetooth globally also probably won&#39;t work for cases where it=
 might be used in e.g. RDEPENDS_${PN} :/. Maybe inline python appending onl=
y either bluez4 or bluez5 alternative here?</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr">On Wed, Oct 17, 2018 at 5:43 PM Yann Dirson &lt;<a hr=
ef=3D"mailto:yann.dirson@blade-group.com" target=3D"_blank">yann.dirson@bla=
de-group.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div di=
r=3D"ltr">Yeah, that looks like a better idea. <br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr">Le=C2=A0mer. 17 oct. 2018 =C3=A0=C2=A017:27, =
Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank=
">martin.jansa@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><div dir=3D"ltr">What about using some less confusing def=
ault BLUEZ value? RDEPENDS_ looks wrong.<div><br></div><div>BLUEZ ??=3D &qu=
ot;no-bluetooth&quot;</div><div>RDEPENDS_no-bluetooth =3D &quot;&quot;</div=
><div><br></div><div>Might be a bit more clear.</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Wed, Oct 17, 2018 at 5:08 PM &lt;<a hr=
ef=3D"mailto:yann.dirson@blade-group.com" target=3D"_blank">yann.dirson@bla=
de-group.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Y=
ann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" target=3D"_blank">ya=
nn@blade-group.com</a>&gt;<br>
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
_-7798490518947502568m_-2074142617775729286m_-5484289321282644411gmail_sign=
ature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Yann Dirson=
 &lt;<a href=3D"mailto:yann@blade-group.com" target=3D"_blank">yann@blade-g=
roup.com</a>&gt;<br>Blade -- 38 rue du Sentier, 75002 Paris<br></div></div>=
</div>
</blockquote></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"m=
_-7798490518947502568gmail_signature" data-smartmail=3D"gmail_signature"><d=
iv dir=3D"ltr"><div>Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com"=
 target=3D"_blank">yann@blade-group.com</a>&gt;<br>Blade -- 38 rue du Senti=
er, 75002 Paris<br></div></div></div>
</blockquote></div>

--000000000000d39d0605786eae15--
