Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D12C433F5
	for <webhook@archiver.kernel.org>; Sat, 23 Oct 2021 18:40:45 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web10.9822.1635014444406479806
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 11:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PaODfjG2;
 spf=pass (domain: gmail.com, ip: 209.85.222.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id q13so14009095uaq.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 11:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2whsUpH2JH7ZVkYUmHdjSJHOHbDCyBTzL//neZbZAeQ=;
        b=PaODfjG2Kn2VVZBqyWAnAW0qIlBc3w2MH1OP+qXGDzAggE04j897pb45lq+5iRdHGx
         7F7Vrvk+HdMecutWpmGJakUbOodZergZyydmOu6Ifm6UrlKJ0cvB/C045yzxAbFcl+oY
         C/nbAyrEiVhQ91qGA4i6X7C3fqsm5kHOZR4+pcn0ri2lga41CUoBy4JL56EOYgFEXB0h
         JzhNt9UkgWUkE2N6dP94A42Z+CFWNrth4QkIdyK20LxCoSXQlVCAJOsFvThWq4ubMi8P
         C5JQo9ZOQTiSgTmJ7DZg/AvFS4t8QmwSW4YblazJAGGT7c7z8qxaFdf/Az6s/W5Hl80N
         pUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2whsUpH2JH7ZVkYUmHdjSJHOHbDCyBTzL//neZbZAeQ=;
        b=DOFR6F612YANmd7UDRBrZMCQJmSwJjxYvEXgKWe7a4wuMvSUMKClpfHkEbJ9eQ8b+/
         ntk6EfAGxk3odUf2xcztYI4q1/+U5dw4D1JcmFfKXkJle6L1Bc7+e+6QPrafF+PPt1vh
         oj+nevRwayUrNlQVzGrSYVdYu03hIB4EGLh02ybm4XX+6/+my0Dgn67znfdCutWwOpkH
         zdyeOkFaWVACA4MP62dXsQHXlWKh4vKhDbvbG0XeqEOFe2Sgxu5r0pmP7xccUJxY5Cd1
         04BvdVBCDy8EG9X8aG1FoHHD8xJggWAfno2LM5j15QFCtJznO/WDvLUXfEbh28VzpIjM
         i9Pw==
X-Gm-Message-State: AOAM532Kb5q3KOLu1Q93lH7czPh/dhn86Mu2qU6adXkRaVVZpitThC8c
	V5LMZXux/3Nqz3zEFUrPUjFAQ0DHNCeWiMEQHsU=
X-Google-Smtp-Source: 
 ABdhPJx0CdhBl4aC4eL9Uh3u2blLzDD8FMwH5cFmV3wQOxQ7Zqa+SyNc8hdyYKeYyqbEgrNO6cN6/aEf+6uG5Gi5OPU=
X-Received: by 2002:a67:c11e:: with SMTP id d30mr7949838vsj.1.1635014443467;
 Sat, 23 Oct 2021 11:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211023181641.424368-1-raj.khem@gmail.com>
 <16B0BC8D2D865084.16488@lists.openembedded.org>
In-Reply-To: <16B0BC8D2D865084.16488@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 23 Oct 2021 20:40:32 +0200
Message-ID: 
 <CANNYZj8rpaHo1Vu5O5pohpw62Usf44zbgjTRyoYWgr18ZOnW_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] librsvg: Disable 64bit atomics in crossbeam for
 rv32
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001b087205cf097709"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Oct 2021 18:40:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157308

--0000000000001b087205cf097709
Content-Type: text/plain; charset="UTF-8"

Oh, and 'risc32gc' is already there, so our rust's riscv target name should
be adjusted to match that (as that's what upstream is using, so we'll
eliminate a mismatch).

Alex

On Sat, 23 Oct 2021 at 20:33, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> On Sat, 23 Oct 2021 at 20:16, Khem Raj <raj.khem@gmail.com> wrote:
>
>> +         println!("cargo:rustc-cfg=crossbeam_no_atomic_64");
>> +     } else {
>> +         // Otherwise, assuming `"max-atomic-width" == 64`.
>> ++        println!("cargo:rustc-cfg=crossbeam_no_atomic_64");
>> +     }
>> +SRC_URI:append:riscv32 = " file://riscv32-no-64bit-atomics.patch"
>>
>
> The correct way to fix this is to adjust the target list in
> vendor/crossbeam-utils/no_atomic.rs.
>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157307):
> https://lists.openembedded.org/g/openembedded-core/message/157307
> Mute This Topic: https://lists.openembedded.org/mt/86541048/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000001b087205cf097709
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Oh, and &#39;risc32gc&#39; is already there, so our r=
ust&#39;s riscv target name should be adjusted to match that (as that&#39;s=
 what upstream is using, so we&#39;ll eliminate a mismatch).</div><div><br>=
</div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Sat, 23 Oct 2021 at 20:33, Alexander Kanavin vi=
a <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;=
alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.co=
m@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Sat, 23 Oct 2021 at 20:16, Khem Raj &lt;<=
a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0println!(&quot;cargo:rustc-cfg=3Dcrossbea=
m_no_atomic_64&quot;);<br>
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
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157307): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157307" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157307</a><br>
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

--0000000000001b087205cf097709--

