Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B3DC433F5
	for <webhook@archiver.kernel.org>; Sat, 23 Oct 2021 18:55:25 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web11.9975.1635015324177641880
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 11:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HqGFozN9;
 spf=pass (domain: gmail.com, ip: 209.85.222.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id e10so14056230uab.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 11:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b2la/QaL1VU7dvkIuGekKct5fs2iqxPeZ764m3cJWcU=;
        b=HqGFozN9aJ5uGYSl9MA2ET2gMdPlIalwq3Gu8roqkw9sHQmt4zx7x/A3rJ9QpjD3WA
         v97upFLvm1fIpSFQ+HoyUmQxXCpoNF80+SYt5OwxoJavcRs3Rfo9sRrKiYf/BhDzdqQX
         hHleOZSra0mQMrAgb63U3ZhEpZIo1IqFya9uNrMsTT8I9t6dJigaw79KhdFr5GjdxsyG
         C5VIhFPlrgBWVcx/iBwp3XMpK4jBazvNtROHiH93buoXgXhuqbq39kOuRv4Hpm+9Hb55
         a/qCXX79PQQA8wFReJ9rryUSUH4VHdCrJQeeS/Ry21tPPijA3xw0HGKAd5OBDPJP+q4H
         7XcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b2la/QaL1VU7dvkIuGekKct5fs2iqxPeZ764m3cJWcU=;
        b=c68xqLvkQksltOtI/1mnKXxQBTLxFTf7cBkHG+CNtUQrNqGfY5yWMSvqtHo6tnlw3X
         v3hgg0C47EjB6yo36aJRLciNCUU67O1UUHHYFuMHXyFz0n8Vh8Ae/xM/Ug9L71ml2d58
         nX+JNyh3mbYlvpP6+DJeeyuPS3210gJifkvPSlt14FYIKiBmEAxsuAHIxSmqmARHoTeg
         5N8XjmSz9Yc/rHr0DLel+a6tOqNpdPYVxjKLwS1Un7G+/Ki/WO658JBbPS1uYRASm2UJ
         RVTn8bNkRKbSTGfaTd+TjMeRmcXFiX6EbvvPcOkUd0N6+r+4IQYaarjPHavfJMpfCoIP
         7O+A==
X-Gm-Message-State: AOAM532r7/7fwrKZtYc4cD921IOYL2d2SEZCSWR9bJB+UudHf9X085z1
	Mmyp/V6/vBoCbFZgUFlf0mXXVQN+z6SY78DwVfs=
X-Google-Smtp-Source: 
 ABdhPJwcEr2nbR24bNIfJsiZSHGGhS7L3vegvK5FNk4o6psstc96vHugJJg7QSgZG4/rKPzlir7dLH+4mTN216JgZMM=
X-Received: by 2002:ab0:3c93:: with SMTP id a19mr7863981uax.93.1635015323331;
 Sat, 23 Oct 2021 11:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211023181641.424368-1-raj.khem@gmail.com>
 <16B0BC8D2D865084.16488@lists.openembedded.org>
 <16B0BCF990E2640F.16488@lists.openembedded.org>
In-Reply-To: <16B0BCF990E2640F.16488@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 23 Oct 2021 20:55:11 +0200
Message-ID: 
 <CANNYZj-eX+=QT30g7e50igBLsVjZB2tvs-0QAKsnfJSuNk-9TQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] librsvg: Disable 64bit atomics in crossbeam for
 rv32
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008cadc605cf09ab03"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Oct 2021 18:55:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157309

--0000000000008cadc605cf09ab03
Content-Type: text/plain; charset="UTF-8"

... which might not be very easy - maybe adjusting no_atomic.rs is easiest.

Alex

On Sat, 23 Oct 2021 at 20:40, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> Oh, and 'risc32gc' is already there, so our rust's riscv target name
> should be adjusted to match that (as that's what upstream is using, so
> we'll eliminate a mismatch).
>
> Alex
>
> On Sat, 23 Oct 2021 at 20:33, Alexander Kanavin via lists.openembedded.org
> <alex.kanavin=gmail.com@lists.openembedded.org> wrote:
>
>> On Sat, 23 Oct 2021 at 20:16, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> +         println!("cargo:rustc-cfg=crossbeam_no_atomic_64");
>>> +     } else {
>>> +         // Otherwise, assuming `"max-atomic-width" == 64`.
>>> ++        println!("cargo:rustc-cfg=crossbeam_no_atomic_64");
>>> +     }
>>> +SRC_URI:append:riscv32 = " file://riscv32-no-64bit-atomics.patch"
>>>
>>
>> The correct way to fix this is to adjust the target list in
>> vendor/crossbeam-utils/no_atomic.rs.
>>
>> Alex
>>
>>
>>
>>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157308):
> https://lists.openembedded.org/g/openembedded-core/message/157308
> Mute This Topic: https://lists.openembedded.org/mt/86541048/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000008cadc605cf09ab03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>... which might not be very easy - maybe adjusting <a=
 href=3D"http://no_atomic.rs">no_atomic.rs</a> is easiest.</div><div><br></=
div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Sat, 23 Oct 2021 at 20:40, Alexander Kanavin via =
<a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;al=
ex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@=
lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"ltr"><div>Oh, and &#39;risc32gc&#39; is a=
lready there, so our rust&#39;s riscv target name should be adjusted to mat=
ch that (as that&#39;s what upstream is using, so we&#39;ll eliminate a mis=
match).</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 23 Oct 2021 at 20:33=
, Alexander Kanavin via <a href=3D"http://lists.openembedded.org" target=3D=
"_blank">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gm=
ail.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembed=
ded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, 23 Oct 2021 at 20:16, Khem Raj &lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">+=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0println!(&quot;cargo:rustc-cfg=3Dcrossbeam_no_atomic_64=
&quot;);<br>
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
//lists.openembedded.org/g/openembedded-core/message/157308</a><br>
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

--0000000000008cadc605cf09ab03--

