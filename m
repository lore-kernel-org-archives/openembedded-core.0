Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web11.2597.1624306603492894069
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jun 2021 13:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Jmq6ROJh;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id c26so1033231vso.8
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jun 2021 13:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k3GlcE7jqIFunaTKGwIP9FkT6SoXCsh6hN9fkDv70CA=;
        b=Jmq6ROJhCmmTPAnlL4kEV0pS//uBz4NJsbjgTATiyX1pD4M/dsaJqCdnJBFeJzkl6L
         qCJzc59J+dzBNsVC4LibIL+wNXj1NF1feSE85es4RvPkWjjJgsgQimrxXbVB49NKlCLo
         +Yf3U+u0WngXSlLu8odR98e7wvhlR5TeYXANGansR+WyUWa357QbGI5mQkARLY5pLKUh
         wXti+Y5Sxls/99gKJEK8/N0m+tdsuNC9rMh8VLM2jIgkANB7of0hy0/bM2vEknEreiSE
         c+UJK+X2I4ZMpRBMdrqlzN5UXPTPNsSyGThjTZkl9uNXVCc1+2bTb6IutiUlKEdpHH5W
         KJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k3GlcE7jqIFunaTKGwIP9FkT6SoXCsh6hN9fkDv70CA=;
        b=TENiT/6DrsAjkaMwCV2JuUl7KjIrbQrfVc3SNqq0YmnudgZeh4ZVvv2N/2AW557Vvq
         avJIcD7M34KGd/M3vrp6lQUTGbeQpLCrOoYLY1WS/Du4YuEjzlERshxFQgwXnwGRUqDQ
         YnuC5vsd12siJ2uTDJIGW9KW/1IZFJXf1a3P5UxAKqOr/JBJ62URsRMCLCE1mLXYTUlZ
         ngtKJ/ocyS9Dm36AfV8bhfTgTrjLoUWQyuwOXqqCojEsiXNPh58oR3lZMivxfjdLK4Xc
         KMYcUJxUUJwXofZYzgl2M/EXSNBco+eWC2MWcOxLoAQOrLbk9Q0qy+0TfGpS6HoJLhXU
         +WBQ==
X-Gm-Message-State: AOAM533Uk+LmqLLCqtdxgeZ3/NEKNgUKasUWFhb6DUo0r4EdPXjpHm/A
	/mhpQBT5GlRhl3kQRYTrqxIU4pV506dPTqD08nU=
X-Google-Smtp-Source: ABdhPJwLtvF5stw8ID3zuwWatAXROt21ySL1ToqyFowKRFW7Le8EfEbDhCujriRadK37H7BYYnpI8MiI+pU9M0awaLE=
X-Received: by 2002:a67:1502:: with SMTP id 2mr19941256vsv.54.1624306602624;
 Mon, 21 Jun 2021 13:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1624060313.git.timothy.t.orling@intel.com>
 <4207e03bcbbfd8b6113c04bc7c35ceb516af31f6.1624060313.git.timothy.t.orling@intel.com>
 <CANNYZj8diO0prd1g6ixjhXVc6NFB0otk8dr8yY-Fw2OMEjJjSA@mail.gmail.com> <CANx9H-D3cnMKVNJq5-xu-kNGPDKCMqhggmfxFY8K22iDsTfYWw@mail.gmail.com>
In-Reply-To: <CANx9H-D3cnMKVNJq5-xu-kNGPDKCMqhggmfxFY8K22iDsTfYWw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 21 Jun 2021 22:16:30 +0200
Message-ID: <CANNYZj-dFugvRFi2W1iQtQhHWLEC=aRGaf4EJJPwC3C61K1dOA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] python3: skip tests requiring tools-sdk
To: Tim Orling <ticotimo@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Tim Orling <timothy.t.orling@intel.com>
Content-Type: multipart/alternative; boundary="0000000000000e493b05c54c5a3b"

--0000000000000e493b05c54c5a3b
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Jun 2021 at 19:30, Tim Orling <ticotimo@gmail.com> wrote:

>
>
> On Mon, Jun 21, 2021 at 5:00 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> Wait. How does this work, if IMAGE_FEATURES are set from image recipes,
>> and not globally?
>>
>> I'm afraid this may have to be reverted, as it just made it to master.
>>
>>
> These tests have only been passing (since.python3 3.9.0 upgrade) because
> the AB ptest images in one way or another have included
> packagegroup-core-buildessential.
>
> I asked RP about adding packagegroup-core-buildessential as RDEPENDS for
> python3-ptest and he was concerned about build performance. I tried to
> narrow the scope to gcc-symlinks and binutils-symlinks, but that was not
> enough to make the tests pass.
>
> As I see it, we have two options, this patch which skips the tests
> conditionally, or we UNCONDITIONALLY skip the tests.
> If you run python3-ptest (and nothing else) on core-image-minimal, these
> test cases will fail, which means we do not have proper RDEPENDS for
> python3-ptest.
>

I think the right way out of this is to modify the tests so that they check
for the presence of items that are used by the tests and skip themselfes if
those items (gcc, etc) are not present (turn a hard dependency into a soft
one). Then simply apply the patch without any conditions in the recipe.

There are many other tests which self-skip in a similar way already, we do
not necessarily maintain the full soft dependency set for the fullest ptest
coverage, not should we try to.

Alex

--0000000000000e493b05c54c5a3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 21 Jun 2021 at 19:30, Tim Orling &lt;<a href=3D"mailto:ticot=
imo@gmail.com">ticotimo@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On M=
on, Jun 21, 2021 at 5:00 AM Alexander Kanavin &lt;<a href=3D"mailto:alex.ka=
navin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><=
div>Wait. How does this work, if IMAGE_FEATURES are set from image recipes,=
 and not globally?</div><div><br></div><div>I&#39;m afraid this may have to=
 be reverted, as it just made it to master.<br></div><div><br></div></div><=
/blockquote><div><br></div><div>These tests have only been passing (since.p=
ython3 3.9.0 upgrade) because the AB ptest images in one way or another hav=
e included packagegroup-core-buildessential.</div><div><br></div><div>I ask=
ed RP about adding packagegroup-core-buildessential as RDEPENDS for python3=
-ptest and he was concerned about build performance. I tried to narrow the =
scope to gcc-symlinks and binutils-symlinks, but that was not enough to mak=
e the tests pass.</div><div><br></div><div>As I see it, we have two options=
, this patch which skips the tests conditionally, or we UNCONDITIONALLY ski=
p the tests.</div><div>If you run python3-ptest=C2=A0(and nothing else) on =
core-image-minimal, these test cases will fail, which means we do not have =
proper RDEPENDS for python3-ptest.</div></div></div></blockquote></div><div=
 class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">I think the rig=
ht way out of this is to modify the tests so that they check for the presen=
ce of items that are used by the tests and skip themselfes if those items (=
gcc, etc) are not present (turn a hard dependency into a soft one). Then si=
mply apply the patch without any conditions in the recipe. <br></div><div c=
lass=3D"gmail_quote"><br></div><div class=3D"gmail_quote">There are many ot=
her tests which self-skip in a similar way already, we do not necessarily m=
aintain the full soft dependency set for the fullest ptest coverage, not sh=
ould we try to. <br></div><div class=3D"gmail_quote"><br></div><div class=
=3D"gmail_quote">Alex<br></div></div>

--0000000000000e493b05c54c5a3b--
