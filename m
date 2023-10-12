Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7721ECDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 14:17:12 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web10.12732.1697120231335975486
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 07:17:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U0/AEj7S;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6c7bbfb7a73so628696a34.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 07:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697120230; x=1697725030; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wRRXRUlPQ20BjYwg5XJrrrUtQybJzgrdtvSVzY6GVkc=;
        b=U0/AEj7Sq/elwd/hJ6AKqDoeZXWZhKM+trm7zVu4Ri7CfyQFSnpTFbIEeCBGbaBq88
         v8jHODnCYG4g3LzzhCf8QAmroBzGov0kDlCgYeqQTYArnG5lJxwb//gbHPIeZ2gGtTZO
         kqEeytCu1mIHf6Ob3/DpjiQCkEHqMXNYwWljlsM8Rjt5x4eRgC7rcxHiHzFOPNXwQzNJ
         0ahih7uuniLheeTWmmACkBQUtPQy0AuNXIHeAGlFhAPBTkQPVChWmzsGL3pCx1P35aVg
         PkaIi2Iw0oSobcvyRs8RVZz07XI0pChF8gJjevCizp0gAEFkLckYTGpMFX0kjpWAA2Et
         9rVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697120230; x=1697725030;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wRRXRUlPQ20BjYwg5XJrrrUtQybJzgrdtvSVzY6GVkc=;
        b=ZcydPnUUBagGPIXbTS+Tl0nRo9tX8n7qIb9FqXQUe2yH1xNiCvqyQBNKa9DuM1k1al
         mzWFnajS4BnvXwg5POqaMrSUfUPsdNi1hmPL0B7KJOLlxQ1VHlsv1M32k2f3PTo+LZEb
         sDU4CVb3cnOGJhOwAzft//FRBtFJkUAi/BDVObNJAjp1UOK3N6S91KGBI96x3u0h9JRJ
         7VdZGKSJD2D/GRbXQlhwW35qwDiaBJ2j73RtZqgjTkcT3ovBsCcuWw6PMzNUich7zhtf
         +SEox5Be2W6wQYr/2+9n2gRpsEt8ra98GF3aOPQAZhTHnA5yV9lUP2AMTC917xFJfUc7
         s8jA==
X-Gm-Message-State: AOJu0YytO/rPrZi+WXdqTBHHlJfmnzAEvqQxDDqJKjazEznyYkmNLUd9
	kvtnAc9gTKkngzF/FmJ8QWedBST5nzbwwhp8uebmsXNn
X-Google-Smtp-Source: AGHT+IFigXwaBDKqgds781SjBSow1TrTTDsrZHccCg4Al5YG/8PYuINY2cJFIq1QghN+uSugUmWITUZJEzTztzPBY1c=
X-Received: by 2002:a05:6870:f155:b0:1d5:bb9e:a30e with SMTP id
 l21-20020a056870f15500b001d5bb9ea30emr28531819oac.34.1697120230518; Thu, 12
 Oct 2023 07:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sp1_ATk5=2k=5UVf9few7Er9HTAcWePBjyJ7qo_q4T-RQ@mail.gmail.com>
 <31911.1697112866787503087@lists.openembedded.org>
In-Reply-To: <31911.1697112866787503087@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 Oct 2023 07:16:59 -0700
Message-ID: <CAMKF1soFcxfbe04ptQ48oKrcMYtS9UMoauqX3KbN2VF98seuMw@mail.gmail.com>
Subject: Re: [OE-core] [mickledore] glibc: stable 2.37 branch updates.
To: Sanjana V <sanjanasanju1608@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007b339a0607859826"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 14:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189001

--0000000000007b339a0607859826
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 12, 2023 at 5:14 AM Sanjana V <sanjanasanju1608@gmail.com>
wrote:

> Hi Khem,
>
> Thanks very much for checking the results and your comments.
>
> >> How much memory does the device under test have?
>
> We are using the default memory assigned in qemu x86-64.
> cat /proc/meminfo
> MemTotal:228876 kB
>

For tests can you raise it to say 512mb and see if results are still same
Secondly how many cpus are there ? Maybe have atleast 2 or more


>
> Can you please let us know if we should increase the memory in the image
> while running oe-selftest?
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188992):
> https://lists.openembedded.org/g/openembedded-core/message/188992
> Mute This Topic: https://lists.openembedded.org/mt/101774187/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000007b339a0607859826
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Oct 12, 2023 at 5:14 AM Sanjana V &lt;<a href=3D"ma=
ilto:sanjanasanju1608@gmail.com">sanjanasanju1608@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Hi Khem,<br><br>Thanks very much fo=
r checking the results and your comments.<br><span><br>&gt;&gt;</span><span=
> How much memory does the device under test have?<br><br></span>We are usi=
ng the default memory assigned in qemu x86-64.<br>
<div>cat /proc/meminfo</div>
<div>MemTotal:228876 kB</div></blockquote><div dir=3D"auto"><br></div><div =
dir=3D"auto">For tests can you raise it to say 512mb and see if results are=
 still same=C2=A0</div><div dir=3D"auto">Secondly how many cpus are there ?=
 Maybe have atleast 2 or more=C2=A0</div><div dir=3D"auto"><br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div dir=3D"auto"><br><br>Can you please let us kn=
ow if we should increase the memory in the image while running oe-selftest?=
</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#188992): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/188992" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/188992</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101774187/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101774187/1997914</a><br>
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

--0000000000007b339a0607859826--

