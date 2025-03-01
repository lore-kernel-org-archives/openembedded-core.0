Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07AC3C282CD
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 16:11:42 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.11641.1740845498979666044
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 08:11:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YbhjU3EB;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2bcc0c6c149so2672482fac.1
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 08:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740845498; x=1741450298; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fU9rRebx60rd01/dglTGs43Pskj+VgFcM0Zp5tmuq+U=;
        b=YbhjU3EBZA9ST99EaF7pT1w3jlW7u4v0DQ4fSG0iozFJzelbTygXsTSHM9ZK5gBEx5
         8xz4Nn0QkqnISIIhcqP45MTTxybjbZ34dYGMnxwjH2n/pIls1vE2NWCy8CjDKViq8GGu
         pX2a28XA3CZhgpf4GAYd/80b793yRL/lKTdm9DcSBh44oUwTdNRv1YFUiAloeg4J5RnE
         3DHdu4ngX//RdaWPWQ/1D5qkHCdJtQ8Aal7Ouj9mGc+PSYFdtf2B2Yl9E+yMA48fs9Hz
         6whkIg58buWSBOUql1/YQamBhyJ/fQwKJSXkoKzOBHzVlRO7JlBi1tIvyfbCQu6B4Ctu
         2R1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740845498; x=1741450298;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fU9rRebx60rd01/dglTGs43Pskj+VgFcM0Zp5tmuq+U=;
        b=AKSLOenQjuqG1kwjxnDbwPoctKu73PQ7yXpntTRj6c+T8T2xUliOYx+LY5U5NDecfw
         liHhi6COuI9YZMPkYkZ3Qs7sCVtN/aj2waGdlYnUjD1kMcGvvUBNfyrkYIn8jlIOsieo
         FWPHhYABtgVbqfwsP42G+2zASHD6R6toyl5MbPSyGyuWQwnns/Eyk1zjKAvp7UjT6vYE
         zM6+5Trc7jEii7ieGjN2ol58R3w/xLVGtF9oXa0VHtIfwmOuZF57mYLQoDjAwtJEPHOs
         s8xn42927ZAu95O3gz11QkplpFsEjg5A6NMz+JipjcWGJZk28bVc0AlPfX1U0jxUTHlj
         SJGA==
X-Forwarded-Encrypted: i=1; AJvYcCU7vkdc8Vlrc0nW2oAiFypSvEfQsTeKlKRgy8rmmYxJG/w9uQqAJSGBQXxeBc9V/EsX+8HH2Es66zimnik+TNmM7w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx6wvc0QIhI6wtvaAra7dgxiV+jeC+RY2m+TszMXJB6oYQznCcH
	rahhCFgeyZdlxAMs96qKcgWrtOyHWtPvJEQcTeG6a/lgOq8LWesXgXFsfZzd+OulLACBXYF7P6T
	9kYHlA7SRjjW0SRAmD92d0eEXKkk=
X-Gm-Gg: ASbGncvv3rTY+LYAgUWDyg3qe/pgU4RUtEMeM8Y38p5GmgyFYOW2kZd13k7OTWbmFHl
	8emob4xrEhHfLNbfRu9FAtnfHIjpIw1dkVS9FntI8BDE0x+iet0wulDSGN4ZA7/Vh4KCjzbS4n9
	xh6R2s9xVTbe9Wy1NIzVH9MWQ=
X-Google-Smtp-Source: AGHT+IELOZdTVRBT+NL0muHml105GfxyqMamkBCxvNn8jafgX1vapGr7VG/43XWFrSuv0dB/MLyUbXnEsYQdc4gRMWM=
X-Received: by 2002:a05:6870:5b8a:b0:29e:671b:6019 with SMTP id
 586e51a60fabf-2c178645d81mr4947689fac.31.1740845497994; Sat, 01 Mar 2025
 08:11:37 -0800 (PST)
MIME-Version: 1.0
References: <20250204103744.27883-1-othacehe@gnu.org> <11f5d7bcfd74d901e8001e7316244a037ae1860c.camel@linuxfoundation.org>
 <87frjysae1.fsf@gnu.org> <0b50a9ac2a5678fd35e2ecd0be842847223a0096.camel@linuxfoundation.org>
 <87ikotnlkp.fsf@gnu.org>
In-Reply-To: <87ikotnlkp.fsf@gnu.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 1 Mar 2025 08:11:27 -0800
X-Gm-Features: AQ5f1JryoBtAX-l2DyBGP7CbLCxCI_kGIum2C8y0YiqK06-CiaQu8IAK_UVfqsE
Message-ID: <CAMKF1squxXbc=7RsKTHBSqapD7za4qUwj=-ByE5mYAJYM9AsiQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] lib/oe/package: Add strip keep-section support
To: othacehe@gnu.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: multipart/alternative; boundary="00000000000084590d062f4a2dd8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 16:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212182

--00000000000084590d062f4a2dd8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 1, 2025 at 1:32=E2=80=AFAM Mathieu Othacehe via lists.openembed=
ded.org
<othacehe=3Dgnu.org@lists.openembedded.org> wrote:

>
> Hello Richard,
>
> > You're using this with minidebuginfo so does it not make sense to add
> > this as one of the debug sections injected there with the rest of the
> > minidebug info?
>
> Well minidebuginfo is about having compressed symbols in an ELF section,
> and keeping .debug_frame is about having unwinding material in another
> ELF section. In the end both of them are needed to get human-readable
> backtraces on target.
>
> Now, keeping .debug_frame when minidebuginfo is enabled seems a bit
> odd. We could only keep .debug_frame on the needed architectures (ARMv7)
> and rely on the more generic .eh_frame sections that are never stripped
> on other architectures (aarch64, x86_64). Yet, picking what to strip
> based on whether minidebuginfo is enabled does not feel right.
>

ARM EHABI defines two new sections exidx and extab for storing exception
indexes and exception unwind data which is what other architecture use
.eh_frame for at runtime. The rationale to have it done this way is reduced
size. Can minidebuginfo use these sections in same way like it uses
.eh_frame ?


> Maybe, we could go for a DISTRO_FEATURE that would be even more generic,
> such as "backtrace_on_target" that would enable minidebuginfo and keep
> the suitable unwinding sections based on the architecture. That way,
> users would have unwinding materials and symbols so that GDB, libunwind,
> systemd-coredump and other backtracing tools always work on target with
> a minimal overhead. People could enable "backtrace_on_target", see if
> the image overhead is acceptable to them, and have backtraces without
> diving into complex details.
>
> I think it would still be needed to offer minidebuginfo and
> PACKAGE_KEEP_SECTIONS so that users willing to invest more time can
> decide precisely what do they want on the target in terms of symbols and
> unwinding material.
>
> What would you think about that?
>
> Thanks,
>
> Mathieu
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212091):
> https://lists.openembedded.org/g/openembedded-core/message/212091
> Mute This Topic: https://lists.openembedded.org/mt/110989612/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000084590d062f4a2dd8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Sat, Mar 1, 2025 at 1:32=E2=80=AFAM =
Mathieu Othacehe via <a href=3D"http://lists.openembedded.org">lists.openem=
bedded.org</a> &lt;othacehe=3D<a href=3D"mailto:gnu.org@lists.openembedded.=
org">gnu.org@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;=
border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)=
"><br>
Hello Richard,<br>
<br>
&gt; You&#39;re using this with minidebuginfo so does it not make sense to =
add<br>
&gt; this as one of the debug sections injected there with the rest of the<=
br>
&gt; minidebug info?<br>
<br>
Well minidebuginfo is about having compressed symbols in an ELF section,<br=
>
and keeping .debug_frame is about having unwinding material in another<br>
ELF section. In the end both of them are needed to get human-readable<br>
backtraces on target.<br>
<br>
Now, keeping .debug_frame when minidebuginfo is enabled seems a bit<br>
odd. We could only keep .debug_frame on the needed architectures (ARMv7)<br=
>
and rely on the more generic .eh_frame sections that are never stripped<br>
on other architectures (aarch64, x86_64). Yet, picking what to strip<br>
based on whether minidebuginfo is enabled does not feel right.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">ARM EHABI define=
s two new sections exidx and extab for storing exception indexes and except=
ion unwind data which is what other architecture use .eh_frame for at runti=
me. The rationale to have it done this way is reduced size. Can minidebugin=
fo use these sections in same way like it uses .eh_frame ?</div><div dir=3D=
"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bo=
rder-left-color:rgb(204,204,204)"><br>
Maybe, we could go for a DISTRO_FEATURE that would be even more generic,<br=
>
such as &quot;backtrace_on_target&quot; that would enable minidebuginfo and=
 keep<br>
the suitable unwinding sections based on the architecture. That way,<br>
users would have unwinding materials and symbols so that GDB, libunwind,<br=
>
systemd-coredump and other backtracing tools always work on target with<br>
a minimal overhead. People could enable &quot;backtrace_on_target&quot;, se=
e if<br>
the image overhead is acceptable to them, and have backtraces without<br>
diving into complex details.<br>
<br>
I think it would still be needed to offer minidebuginfo and<br>
PACKAGE_KEEP_SECTIONS so that users willing to invest more time can<br>
decide precisely what do they want on the target in terms of symbols and<br=
>
unwinding material.<br>
<br>
What would you think about that?<br>
<br>
Thanks,<br>
<br>
Mathieu<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#212091): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/212091" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/212091</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110989612/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/110989612/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000084590d062f4a2dd8--

