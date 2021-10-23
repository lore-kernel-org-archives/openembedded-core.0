Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301F6C433EF
	for <webhook@archiver.kernel.org>; Sat, 23 Oct 2021 19:38:50 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.10480.1635017928663453988
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 12:38:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mykeI0K2;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id w8so6677514qts.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 12:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0bdxTNvdl18Bc6gAvm6g+SHYDrkBhIeVP0KvnSiEsh4=;
        b=mykeI0K2pCdSt0icUtywsD0bgIoFb7SqMs5vgD9GlciYQu+Yv5ip8PEufdGZZdFSsr
         6p54HCzJksnfVEn8QHqYUL1YdbLUGXyZbfcJBNE03FUM8dHrr6iGdced2/YZODfOaAnN
         EFK/D3D+KnbGk4B7yWnbyJrHCnFGbEQoXShnQRlSBS4CMY7diH8anUmMlf9zL2TdScXH
         qcbVj0I80eIdIHzcxYyvT63ytdOCTNgufKvk2W0Xwq/iwKDBddnYkni0kIkRUvzWfLjA
         d9NFStygvVjYGc4zEwOEghEjFu1e8TbkNxwsitKNlzLwkUxg+jcw7q0+AvJh5Fg/pgYM
         MDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0bdxTNvdl18Bc6gAvm6g+SHYDrkBhIeVP0KvnSiEsh4=;
        b=5mjtVBoOw2NfFxMCiXdIISwvbxKnjsRzganb8UqA+hGudefP2IkgT8h6VtGN0HAuyw
         35p+VGA4jPSsW+YqH3YdnAr9RhS3LeJhXCtqn87NtDykBvB58d6HTHPUa+Pe4pefv0DV
         QGJuYJZQCjAQ5nBiU+afRi2kfTNkdMivH+rI1SpLUNu6027MCypr6hh3K27dm2VTRs3V
         Yb+uagQ1StdXshJTp4OT2Y9n+wInDNlw71vHAgkmEq6P2mz5sAp9mx9FXTBF3iYx0KsC
         DDgDaLo9uFGp65M9S9EhcZhq+uYOjdW27kd1X9o33TLt26RiT3JJ0Zg1qkF+estshO+b
         l+wQ==
X-Gm-Message-State: AOAM5324lgmY2mbE0HGONIAFGjvM9OQCGqExzYKlkQAkigj5c7vBTDPV
	mP6mY2r4BeRs1ZTtsTcBBv5OVkupOt3/zhneW1A=
X-Google-Smtp-Source: 
 ABdhPJyKc9uM7MeiETW49mkLCCxKgKCnac9P2YTkPboD7vpS7iq+LoK9w6Bz8Y8MovxLWUvFj6O+hnNRj1zF+OLi5Cs=
X-Received: by 2002:a05:622a:190e:: with SMTP id
 w14mr8347663qtc.112.1635017927726;
 Sat, 23 Oct 2021 12:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211023181641.424368-1-raj.khem@gmail.com>
 <16B0BC8D2D865084.16488@lists.openembedded.org>
 <16B0BCF990E2640F.16488@lists.openembedded.org>
 <CANNYZj-eX+=QT30g7e50igBLsVjZB2tvs-0QAKsnfJSuNk-9TQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-eX+=QT30g7e50igBLsVjZB2tvs-0QAKsnfJSuNk-9TQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Oct 2021 12:38:37 -0700
Message-ID: 
 <CAMKF1sq0Dwfs3e78bj7pfUWFbZ8AdOEFXa6pDi74ricLBHWseA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] librsvg: Disable 64bit atomics in crossbeam for
 rv32
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c89cf005cf0a469c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Oct 2021 19:38:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157310

--000000000000c89cf005cf0a469c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 23, 2021 at 11:55 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> ... which might not be very easy - maybe adjusting no_atomic.rs is
> easiest.
>

The entries there are just fine if the build system does not use the build
that utils package uses then it does not respect the entries in that file

Perhaps librsvg might change how it builds this module then we can inject
the no_atomics feature via cargo toml file or rustc =E2=80=94cfg option

>
> Alex
>
> On Sat, 23 Oct 2021 at 20:40, Alexander Kanavin via lists.openembedded.or=
g
> <alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
>
>> Oh, and 'risc32gc' is already there, so our rust's riscv target name
>> should be adjusted to match that (as that's what upstream is using, so
>> we'll eliminate a mismatch).
>>
>> Alex
>>
>> On Sat, 23 Oct 2021 at 20:33, Alexander Kanavin via
>> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
>> wrote:
>>
>>> On Sat, 23 Oct 2021 at 20:16, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>>> +         println!("cargo:rustc-cfg=3Dcrossbeam_no_atomic_64");
>>>> +     } else {
>>>> +         // Otherwise, assuming `"max-atomic-width" =3D=3D 64`.
>>>> ++        println!("cargo:rustc-cfg=3Dcrossbeam_no_atomic_64");
>>>> +     }
>>>> +SRC_URI:append:riscv32 =3D " file://riscv32-no-64bit-atomics.patch"
>>>>
>>>
>>> The correct way to fix this is to adjust the target list in
>>> vendor/crossbeam-utils/no_atomic.rs.
>>>
>>> Alex
>>>
>>>
>>>
>>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#157308):
>> https://lists.openembedded.org/g/openembedded-core/message/157308
>
>
>> Mute This Topic: https://lists.openembedded.org/mt/86541048/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> alex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000c89cf005cf0a469c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Oct 23, 2021 at 11:55 AM Alexander Kanavin &lt;<a h=
ref=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>... which mi=
ght not be very easy - maybe adjusting <a href=3D"http://no_atomic.rs" targ=
et=3D"_blank">no_atomic.rs</a> is easiest.</div><div></div></div></blockquo=
te><div dir=3D"auto"><br></div><div dir=3D"auto">The entries there are just=
 fine if the build system does not use the build that utils package uses th=
en it does not respect the entries in that file=C2=A0</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Perhaps librsvg might change how it builds th=
is module then we can inject the no_atomics feature via cargo toml file or =
rustc =E2=80=94cfg option=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div di=
r=3D"ltr"><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 23 Oct 2021 at 20:40, A=
lexander Kanavin via <a href=3D"http://lists.openembedded.org" target=3D"_b=
lank">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail=
.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr"><div>Oh, and &#39;risc32gc&#39; is already there, so o=
ur rust&#39;s riscv target name should be adjusted to match that (as that&#=
39;s what upstream is using, so we&#39;ll eliminate a mismatch).</div><div>=
<br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sat, 23 Oct 2021 at 20:33, Alexander Kanav=
in via <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.op=
enembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.ope=
nembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Sat, 23 Oct 2021 at 20:16, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0println!(&quot;cargo:rustc-cfg=3Dcrossbeam_no_atomic_64&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Otherwise, assuming `&quot;max-atomic=
-width&quot; =3D=3D 64`.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 println!(&quot;cargo:rustc-cfg=3Dcrossbeam_no=
_atomic_64&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>+SRC_URI:append:riscv32 =3D &quot; file://riscv32=
-no-64bit-atomics.patch&quot;<br></blockquote><div><br></div><div>The corre=
ct way to fix this is to adjust the target list in vendor/crossbeam-utils/<=
a href=3D"http://no_atomic.rs" target=3D"_blank">no_atomic.rs</a>. <br></di=
v><div><br></div><div>Alex<br></div></div></div>
<br>
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157308): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157308" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157308</a></blockquote=
></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86541048/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86541048/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div></div>

--000000000000c89cf005cf0a469c--

