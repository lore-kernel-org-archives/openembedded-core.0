Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.2708.1624307090607788485
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jun 2021 13:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f2UoEK1H;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id g22so3599301iom.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jun 2021 13:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BaSui6jEiELRbCB0sSjsvoah/HB875Ytmx1QACiQz94=;
        b=f2UoEK1Hzenxsn3KUj9YoyiLnxUvnLMtGaYadPegUupc99BbKBbrW9PjnURZ23dIIY
         1ke+ugA0CPUCDkF7OAkqrBGj4Kf2qnBPRAinul0Guo0Ag19fW+2kquxXpHwDTAsK8wVe
         tMhXQmRl0PTJVtF9NuSDIOfaiFcvwf3ixIs5zHshXnYs08NqPOXO/LGrkh8OIwUOsl9l
         amLwN7GeMVT0aH9nPvSvz4UkxjvSa3YFrfPj4S263X7lbQLP7ft2+kb3tQ2YDqIuElKl
         JQMSqUkToZDZAmrixeB+4pcMy7Ir1qqbvtdVHD4KWNY1pOhdehFnW0sXVKlPcUsHfBjs
         x9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BaSui6jEiELRbCB0sSjsvoah/HB875Ytmx1QACiQz94=;
        b=LUf+N0CEThuI35O+5c6UbSkQi2pkKMk54kmX8j1Jm/MWKbSZzzpvl8rHiZ7MeyoO3h
         rNsUx/TXJW9uSttueStKf0rtvTgiLVn5+FJ1H23wk3WEKUefjgnVnvf/wWqOiqBpuUZh
         RsXhGR6N4YuTbdMOy36R4nz6cWW9v4HQqRT8thDdNuV/4hMEmtffzO9WU3QdzXKJQaq4
         j/rQOKvxtwzeNqCzVXpswm7OlhueP1rO7NBEaw1xSY4l6UYR4pUxvSGz5ou6JJBQo1/u
         cENTUnkdrEMdJl5QPbioDdzQw4h7QI4uaIcUBw+08nQaOQ4tWrsvNMcDSQvsxuRb9/Q9
         GMkQ==
X-Gm-Message-State: AOAM5313sKXG7i6Dk9pdGWww2K8LdQT909vx4eFqDDVmVnJ4xK4UHr9A
	J68PY1AYvZ67N5BGdE8YFzLnJbnW27he4tGHHC4=
X-Google-Smtp-Source: ABdhPJwAKj5giN9yNdsjTNVjpbYi56QIVRnYqt1XFak8gcisAcLQxe/YDOLB1gcfcpLYxsOjsaGHeUBD6zoTv96mUoA=
X-Received: by 2002:a02:ba0a:: with SMTP id z10mr265718jan.10.1624307089834;
 Mon, 21 Jun 2021 13:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1624060313.git.timothy.t.orling@intel.com>
 <4207e03bcbbfd8b6113c04bc7c35ceb516af31f6.1624060313.git.timothy.t.orling@intel.com>
 <CANNYZj8diO0prd1g6ixjhXVc6NFB0otk8dr8yY-Fw2OMEjJjSA@mail.gmail.com>
 <CANx9H-D3cnMKVNJq5-xu-kNGPDKCMqhggmfxFY8K22iDsTfYWw@mail.gmail.com> <CANNYZj-dFugvRFi2W1iQtQhHWLEC=aRGaf4EJJPwC3C61K1dOA@mail.gmail.com>
In-Reply-To: <CANNYZj-dFugvRFi2W1iQtQhHWLEC=aRGaf4EJJPwC3C61K1dOA@mail.gmail.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Mon, 21 Jun 2021 13:24:38 -0700
Message-ID: <CANx9H-B-AfsL-SsBhsQrRwaCZp7sVU8Gj==POYnV2d=nespGPg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] python3: skip tests requiring tools-sdk
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Tim Orling <timothy.t.orling@intel.com>
Content-Type: multipart/alternative; boundary="00000000000018870605c54c7700"

--00000000000018870605c54c7700
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 21, 2021 at 1:16 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Mon, 21 Jun 2021 at 19:30, Tim Orling <ticotimo@gmail.com> wrote:
>
>>
>>
>> On Mon, Jun 21, 2021 at 5:00 AM Alexander Kanavin <alex.kanavin@gmail.com>
>> wrote:
>>
>>> Wait. How does this work, if IMAGE_FEATURES are set from image recipes,
>>> and not globally?
>>>
>>> I'm afraid this may have to be reverted, as it just made it to master.
>>>
>>>
>> These tests have only been passing (since.python3 3.9.0 upgrade) because
>> the AB ptest images in one way or another have included
>> packagegroup-core-buildessential.
>>
>> I asked RP about adding packagegroup-core-buildessential as RDEPENDS for
>> python3-ptest and he was concerned about build performance. I tried to
>> narrow the scope to gcc-symlinks and binutils-symlinks, but that was not
>> enough to make the tests pass.
>>
>> As I see it, we have two options, this patch which skips the tests
>> conditionally, or we UNCONDITIONALLY skip the tests.
>> If you run python3-ptest (and nothing else) on core-image-minimal, these
>> test cases will fail, which means we do not have proper RDEPENDS for
>> python3-ptest.
>>
>
> I think the right way out of this is to modify the tests so that they
> check for the presence of items that are used by the tests and skip
> themselfes if those items (gcc, etc) are not present (turn a hard
> dependency into a soft one). Then simply apply the patch without any
> conditions in the recipe.
>
>
I don't disagree, but a simple check for gcc or ld (and ldconfig) is not
enough to pass the tests. I proved this by adding gcc-symlinks and
binutils-symlinks to the RDEPENDS.
It's a bit convoluted in the code base.

There are many other tests which self-skip in a similar way already, we do
> not necessarily maintain the full soft dependency set for the fullest ptest
> coverage, not should we try to.
>
> Alex
>

--00000000000018870605c54c7700
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 21, 2021 at 1:16 PM Alexa=
nder Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Mon, 21 Jun 2021 at 19:30, Tim Orling &lt;<a href=3D"mailto=
:ticotimo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><=
div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Mon, Jun 21, 2021 at 5:00 AM Alexander Kanavin &lt;<=
a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr"><div>Wait. How does this work, if IMAGE_FEATURES are=
 set from image recipes, and not globally?</div><div><br></div><div>I&#39;m=
 afraid this may have to be reverted, as it just made it to master.<br></di=
v><div><br></div></div></blockquote><div><br></div><div>These tests have on=
ly been passing (since.python3 3.9.0 upgrade) because the AB ptest images i=
n one way or another have included packagegroup-core-buildessential.</div><=
div><br></div><div>I asked RP about adding packagegroup-core-buildessential=
 as RDEPENDS for python3-ptest and he was concerned about build performance=
. I tried to narrow the scope to gcc-symlinks and binutils-symlinks, but th=
at was not enough to make the tests pass.</div><div><br></div><div>As I see=
 it, we have two options, this patch which skips the tests conditionally, o=
r we UNCONDITIONALLY skip the tests.</div><div>If you run python3-ptest=C2=
=A0(and nothing else) on core-image-minimal, these test cases will fail, wh=
ich means we do not have proper RDEPENDS for python3-ptest.</div></div></di=
v></blockquote></div><div class=3D"gmail_quote"><br></div><div class=3D"gma=
il_quote">I think the right way out of this is to modify the tests so that =
they check for the presence of items that are used by the tests and skip th=
emselfes if those items (gcc, etc) are not present (turn a hard dependency =
into a soft one). Then simply apply the patch without any conditions in the=
 recipe. <br></div><div class=3D"gmail_quote"><br></div></div></blockquote>=
<div><br></div><div>I don&#39;t disagree, but a simple check for gcc or ld =
(and ldconfig) is not enough to pass the tests. I proved this by adding gcc=
-symlinks and binutils-symlinks to the RDEPENDS.</div><div>It&#39;s a bit c=
onvoluted in the code base.</div><div><br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"></div><d=
iv class=3D"gmail_quote">There are many other tests which self-skip in a si=
milar way already, we do not necessarily maintain the full soft dependency =
set for the fullest ptest coverage, not should we try to. <br></div><div cl=
ass=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Alex<br></div></di=
v>
</blockquote></div></div>

--00000000000018870605c54c7700--
