Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6C15B6E5CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 15:46:22 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id 63-v6so30219111wra.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 08:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fk6i9r+eCn5psPKZIE0stBSZVO+CUn8+OJqqlS95z1M=;
	b=Bug21KiKnPYFtMIGIuMtj3a3yxAKeoOjQGqY/5iJzc7dTawRfPr2NYSz8v/oL8juNb
	iCcBviMMt5jEAynhU5IuWhCgaxLuRZYTX+4uVp7AsiKD9dmeMQUlGhxeGk30FOSr8RKe
	wzaNpPrcDph4QUaW2j5jDS4fJvBNd7E3qqEok9Bup34v7OOWvxKda+yuI58SsH18Daw/
	cUqSev+VebjWNnd9CbTYKoSD1vq25khImteXaHIY1WA2PhaamewVcvdWbtskHSnIviJ7
	NPW1jvb9C0zpw/rOqIxOqQ/2U7QDk/eyLh/tXrnmmvyRzdaJgeDIG3SKzGY+Qzt25qH/
	dQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fk6i9r+eCn5psPKZIE0stBSZVO+CUn8+OJqqlS95z1M=;
	b=QOfOWW+ZOc3aTPVtQwLmMb3hOYiGxPTbFxtai6l1q018O1wAobi1ir3xIzWWadyoov
	Gyp5Ca8ZG/5RLLJiLyYdwgRVp9NDKNtjYN6FAH2nV7COiSFGeAH9aT2Zv7Jgu2sz8WnW
	fbdRk1LM/8v7Ha7oiNQlIor4hgr6tfbTSTAwp3f8MEqarhd9lVtxJkDAi2hFQ6NUA4bE
	vsrI/7e6tDGt1YzAxeGJCpOyRJ8AQMhFT3id44nXBYGAp1ybDlvfh7JLNvsee76tECLw
	DGylyBYzU1t916YIfOtNbU457okKll9556njPzR5P7URxGTn6+j2S/ijYryhrVBEGfw3
	TMYQ==
X-Gm-Message-State: ABuFfog84IwJevZjFpjR27fBZiL4bNz3o9y+LftOTgpvyNq4V6GTT1vj
	VH7mytY1E60tedrskifYAetZS30MNSryRAlZpzo=
X-Google-Smtp-Source: ACcGV60kd7fpHz+TcvDvSwVvwDJ/ghlbh4p+DwwBNo7inDREPBDvyYm8RZamxXlPnsCYpfKjFpm9bCJhdTUJy7NpG8E=
X-Received: by 2002:a5d:4cc3:: with SMTP id
	c3-v6mr25255497wrt.75.1539791182987; 
	Wed, 17 Oct 2018 08:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <20181017150757.14591-1-yann@blade-group.com>
	<CA+chaQekOHi4H=YYwvRvHv6AxV1UT909AOdmcTj+J_LJ4uRz-A@mail.gmail.com>
	<CA+4=imbf=QA9B_pUA3dcqnjB4vM0XjiTvk2VozNMtne64r+n7Q@mail.gmail.com>
In-Reply-To: <CA+4=imbf=QA9B_pUA3dcqnjB4vM0XjiTvk2VozNMtne64r+n7Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 17 Oct 2018 17:46:11 +0200
Message-ID: <CA+chaQe=QSL=H+vdu3JFgTbzh53ogwx+fY-59-Dms_8Snhtk9g@mail.gmail.com>
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
X-List-Received-Date: Wed, 17 Oct 2018 15:46:22 -0000
Content-Type: multipart/alternative; boundary="0000000000007d885b05786e927d"

--0000000000007d885b05786e927d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

well, I realized that this won't work with the BLUEZ intentionally set to
empty value and setting BLUEZ to no-bluetooth globally also probably won't
work for cases where it might be used in e.g. RDEPENDS_${PN} :/. Maybe
inline python appending only either bluez4 or bluez5 alternative here?

On Wed, Oct 17, 2018 at 5:43 PM Yann Dirson <yann.dirson@blade-group.com>
wrote:

> Yeah, that looks like a better idea.
>
> Le mer. 17 oct. 2018 =C3=A0 17:27, Martin Jansa <martin.jansa@gmail.com> =
a
> =C3=A9crit :
>
>> What about using some less confusing default BLUEZ value? RDEPENDS_ look=
s
>> wrong.
>>
>> BLUEZ ??=3D "no-bluetooth"
>> RDEPENDS_no-bluetooth =3D ""
>>
>> Might be a bit more clear.
>>
>> On Wed, Oct 17, 2018 at 5:08 PM <yann.dirson@blade-group.com> wrote:
>>
>>> From: Yann Dirson <yann@blade-group.com>
>>>
>>> Otherwise the build fails with:
>>>
>>>   NOTE: Runtime target '${RDEPENDS_}' is unbuildable, removing...
>>>   Missing or unbuildable dependency chain was: ['${RDEPENDS_}']
>>>
>>> This restores some truth in the "Otherwise install nothing" comment in
>>> the recipe.
>>>
>>> Signed-off-by: Yann Dirson <yann@blade-group.com>
>>> ---
>>>  .../packagegroups/packagegroup-tools-bluetooth.bb               | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta-oe/recipes-connectivity/packagegroups/
>>> packagegroup-tools-bluetooth.bb
>>> b/meta-oe/recipes-connectivity/packagegroups/
>>> packagegroup-tools-bluetooth.bb
>>> index 0ede5e57b..e81516fef 100644
>>> --- a/meta-oe/recipes-connectivity/packagegroups/
>>> packagegroup-tools-bluetooth.bb
>>> +++ b/meta-oe/recipes-connectivity/packagegroups/
>>> packagegroup-tools-bluetooth.bb
>>> @@ -32,6 +32,8 @@ RDEPENDS_bluez5 =3D " \
>>>          '', d)} \
>>>  "
>>>
>>> +RDEPENDS_ =3D ""
>>> +
>>>  # Install bluez4 tools or bluez5 tools depending on what is specified
>>> in the distro.
>>>  # Otherwise install nothing.
>>>  RDEPENDS_${PN} =3D "${RDEPENDS_${BLUEZ}}"
>>> --
>>> 2.19.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>
>
> --
> Yann Dirson <yann@blade-group.com>
> Blade -- 38 rue du Sentier, 75002 Paris
>

--0000000000007d885b05786e927d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">well, I realized that this won&#39;t work with the BLUEZ i=
ntentionally set to empty value and setting BLUEZ to no-bluetooth globally =
also probably won&#39;t work for cases where it might be used in e.g. RDEPE=
NDS_${PN} :/. Maybe inline python appending only either bluez4 or bluez5 al=
ternative here?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed=
, Oct 17, 2018 at 5:43 PM Yann Dirson &lt;<a href=3D"mailto:yann.dirson@bla=
de-group.com">yann.dirson@blade-group.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div dir=3D"ltr">Yeah, that looks like a better idea.=
 <br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">Le=C2=A0mer. 17 =
oct. 2018 =C3=A0=C2=A017:27, Martin Jansa &lt;<a href=3D"mailto:martin.jans=
a@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; a =C3=A9crit=
=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">What about=
 using some less confusing default BLUEZ value? RDEPENDS_ looks wrong.<div>=
<br></div><div>BLUEZ ??=3D &quot;no-bluetooth&quot;</div><div>RDEPENDS_no-b=
luetooth =3D &quot;&quot;</div><div><br></div><div>Might be a bit more clea=
r.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Oct 1=
7, 2018 at 5:08 PM &lt;<a href=3D"mailto:yann.dirson@blade-group.com" targe=
t=3D"_blank">yann.dirson@blade-group.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">From: Yann Dirson &lt;<a href=3D"mailto:yann@blade-gro=
up.com" target=3D"_blank">yann@blade-group.com</a>&gt;<br>
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
_-5484289321282644411gmail_signature" data-smartmail=3D"gmail_signature"><d=
iv dir=3D"ltr"><div>Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com"=
 target=3D"_blank">yann@blade-group.com</a>&gt;<br>Blade -- 38 rue du Senti=
er, 75002 Paris<br></div></div></div>
</blockquote></div>

--0000000000007d885b05786e927d--
