Return-Path: <yann.dirson@blade-group.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6600B78E88
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 15:47:49 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id k9so26643238otl.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 08:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=blade-group.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/DKS2aVunHWv0LqY5HMvgtsLGjr4b8jYHS7zZk9jneM=;
	b=mPF5lutQZYIi+8UnmmR2qZq8zMfY8pqhzlN4zvf+tvaEx9IfTkbLb0KkE4LoOz3FoT
	PvlnmBaiKw0Iv8T1PRB31tUzCedEhopPMh2Agqpthd9KFAvL2inAbsRxO1Q2FD33Dg6K
	IF/apNfwWgm4pwoKGjL2m7Uy+hb9P+fQzptqIWxKYWxw28mZrOCkvFCyFJRzsLjkciTC
	AfJzmJqStM+pECIvYqbuZuzXI24Ux9lbk80ZzO8PC0/8Cce/6M1f/DX8n8kA3ASCdfhz
	dYbFBvB1zFI3CPEDfv3mRHKc6+gavNUby3/vnCUZpzcTO9v6rSxr8lVnRHyeL34xtgbv
	QmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/DKS2aVunHWv0LqY5HMvgtsLGjr4b8jYHS7zZk9jneM=;
	b=Tu+4C2WSgsizrZcQavfq9Ao12a+mSpLzdvh8Pq7EYc0qXpfTjDy8b4D0wXcejRfW/G
	f0IgNhEF3gm6ZfVzFM5/SGIYU/9NGYdIvp5yBqjVy1zNy8kHdQEpyepDn9F+pkZ4KT0x
	d6RhQJeBIi0PUZhX4tGWInwpKJfXbNZ29O6xCCcGuv/VaKEEShACmWd11XckpTc1ufTs
	PdGCzNI1chAZ0YyVTRMfm1T1eJn3oZxg26t2Kw7iW8e31L+Fp0ytOseLUAqvhK9kiZvQ
	FxbUXtXu+fKvX3RSWlzZjLchlIOFkRnJWg8US5y2J18CUdW7bz7oSs79uhvyDvatiBUK
	IOkA==
X-Gm-Message-State: ABuFfoj5ZyCPB6hxLbkvLnc+aI0qP2ld2SX+PZxZLM6kLwm6jdFWJjAk
	Uv7lpAISdwk14SAuZ5kx5Po8dqe2cd6715VZnuQr6Q==
X-Google-Smtp-Source: ACcGV603X4exCsdcbhWJTKq+MBZIc0kZmjilJOtuQH4CMXeBZ6ZYWbj/u59P1JxKLs0y0MYuER+ak595RekADvhD7y8=
X-Received: by 2002:a9d:4359:: with SMTP id y25mr17743801oti.80.1539791270302; 
	Wed, 17 Oct 2018 08:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20181017150757.14591-1-yann@blade-group.com>
	<CA+chaQekOHi4H=YYwvRvHv6AxV1UT909AOdmcTj+J_LJ4uRz-A@mail.gmail.com>
	<CA+4=imbf=QA9B_pUA3dcqnjB4vM0XjiTvk2VozNMtne64r+n7Q@mail.gmail.com>
	<CA+chaQe=QSL=H+vdu3JFgTbzh53ogwx+fY-59-Dms_8Snhtk9g@mail.gmail.com>
In-Reply-To: <CA+chaQe=QSL=H+vdu3JFgTbzh53ogwx+fY-59-Dms_8Snhtk9g@mail.gmail.com>
From: Yann Dirson <yann.dirson@blade-group.com>
Date: Wed, 17 Oct 2018 17:47:38 +0200
Message-ID: <CA+4=imYNXTXxO04GCxpL9_yJGqa3qGE_3LiZNMWK_hRD8reGpQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 17 Oct 2018 15:47:49 -0000
Content-Type: multipart/alternative; boundary="000000000000b1eeb105786e97a1"

--000000000000b1eeb105786e97a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Well, inline python was what was originally used before 5397ae5.

Le mer. 17 oct. 2018 =C3=A0 17:46, Martin Jansa <martin.jansa@gmail.com> a
=C3=A9crit :

> well, I realized that this won't work with the BLUEZ intentionally set to
> empty value and setting BLUEZ to no-bluetooth globally also probably won'=
t
> work for cases where it might be used in e.g. RDEPENDS_${PN} :/. Maybe
> inline python appending only either bluez4 or bluez5 alternative here?
>
> On Wed, Oct 17, 2018 at 5:43 PM Yann Dirson <yann.dirson@blade-group.com>
> wrote:
>
>> Yeah, that looks like a better idea.
>>
>> Le mer. 17 oct. 2018 =C3=A0 17:27, Martin Jansa <martin.jansa@gmail.com>=
 a
>> =C3=A9crit :
>>
>>> What about using some less confusing default BLUEZ value? RDEPENDS_
>>> looks wrong.
>>>
>>> BLUEZ ??=3D "no-bluetooth"
>>> RDEPENDS_no-bluetooth =3D ""
>>>
>>> Might be a bit more clear.
>>>
>>> On Wed, Oct 17, 2018 at 5:08 PM <yann.dirson@blade-group.com> wrote:
>>>
>>>> From: Yann Dirson <yann@blade-group.com>
>>>>
>>>> Otherwise the build fails with:
>>>>
>>>>   NOTE: Runtime target '${RDEPENDS_}' is unbuildable, removing...
>>>>   Missing or unbuildable dependency chain was: ['${RDEPENDS_}']
>>>>
>>>> This restores some truth in the "Otherwise install nothing" comment in
>>>> the recipe.
>>>>
>>>> Signed-off-by: Yann Dirson <yann@blade-group.com>
>>>> ---
>>>>  .../packagegroups/packagegroup-tools-bluetooth.bb               | 2 +=
+
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/meta-oe/recipes-connectivity/packagegroups/
>>>> packagegroup-tools-bluetooth.bb
>>>> b/meta-oe/recipes-connectivity/packagegroups/
>>>> packagegroup-tools-bluetooth.bb
>>>> index 0ede5e57b..e81516fef 100644
>>>> --- a/meta-oe/recipes-connectivity/packagegroups/
>>>> packagegroup-tools-bluetooth.bb
>>>> +++ b/meta-oe/recipes-connectivity/packagegroups/
>>>> packagegroup-tools-bluetooth.bb
>>>> @@ -32,6 +32,8 @@ RDEPENDS_bluez5 =3D " \
>>>>          '', d)} \
>>>>  "
>>>>
>>>> +RDEPENDS_ =3D ""
>>>> +
>>>>  # Install bluez4 tools or bluez5 tools depending on what is specified
>>>> in the distro.
>>>>  # Otherwise install nothing.
>>>>  RDEPENDS_${PN} =3D "${RDEPENDS_${BLUEZ}}"
>>>> --
>>>> 2.19.1
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
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

--000000000000b1eeb105786e97a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Well, inline python was what was originally used before 53=
97ae5.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">Le=C2=A0mer=
. 17 oct. 2018 =C3=A0=C2=A017:46, Martin Jansa &lt;<a href=3D"mailto:martin=
.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">well, I realized that th=
is won&#39;t work with the BLUEZ intentionally set to empty value and setti=
ng BLUEZ to no-bluetooth globally also probably won&#39;t work for cases wh=
ere it might be used in e.g. RDEPENDS_${PN} :/. Maybe inline python appendi=
ng only either bluez4 or bluez5 alternative here?</div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr">On Wed, Oct 17, 2018 at 5:43 PM Yann Dirson &lt=
;<a href=3D"mailto:yann.dirson@blade-group.com" target=3D"_blank">yann.dirs=
on@blade-group.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div dir=3D"ltr">Yeah, that looks like a better idea. <br></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr">Le=C2=A0mer. 17 oct. 2018 =C3=A0=C2=A01=
7:27, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"=
_blank">martin.jansa@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div dir=3D"ltr">What about using some less confusi=
ng default BLUEZ value? RDEPENDS_ looks wrong.<div><br></div><div>BLUEZ ??=
=3D &quot;no-bluetooth&quot;</div><div>RDEPENDS_no-bluetooth =3D &quot;&quo=
t;</div><div><br></div><div>Might be a bit more clear.</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Oct 17, 2018 at 5:08 PM &lt;=
<a href=3D"mailto:yann.dirson@blade-group.com" target=3D"_blank">yann.dirso=
n@blade-group.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Fr=
om: Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" target=3D"_blan=
k">yann@blade-group.com</a>&gt;<br>
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
_-2074142617775729286m_-5484289321282644411gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><div>Yann Dirson &lt;<a href=3D"mailt=
o:yann@blade-group.com" target=3D"_blank">yann@blade-group.com</a>&gt;<br>B=
lade -- 38 rue du Sentier, 75002 Paris<br></div></div></div>
</blockquote></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Ya=
nn Dirson &lt;<a href=3D"mailto:yann@blade-group.com" target=3D"_blank">yan=
n@blade-group.com</a>&gt;<br>Blade -- 38 rue du Sentier, 75002 Paris<br></d=
iv></div></div>

--000000000000b1eeb105786e97a1--
