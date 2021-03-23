Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.9969.1616511025196875627
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 07:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tB5SrLu/;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: tomasz.dziendzielski@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id z3so17970684ioc.8
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 07:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BLHOH44JftR6nDdEPG/IPAZRpHyobXS7n2BdUly7UlM=;
        b=tB5SrLu/6oxrmoVuNK8CgIRhjpjH6N6qED70mbGK6Vgz26KoGCvJAIUlYUJcIVZQHg
         DIkx63nR15TTGzWwb2qo2ZAJmubvwLSSzFEOSBwDxaJT2pPRGgZtw5dzrxAT8F6+QVfa
         5k4GHnSj00wecQgIYzV6BosnXl5ImRNVIXkTO0XmEK7EBhsVDnmzZyfg+CNjxFmUtqtt
         1OwU/+MDj7fF3nsTGXeHFJ7JwAWQkmuqcGxDCJ1WzTfqRIv60qDBVo1bAyWaNIZSpGeb
         gEjX5KHDwcRgeM2qQ04AWruGBb+ses0yxPHk6qgC4pARzJQhWay9RmX9Ao+cDj+BOOb1
         /cxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BLHOH44JftR6nDdEPG/IPAZRpHyobXS7n2BdUly7UlM=;
        b=Zzx8eKnrJHh1TBDR13OZZ2wQ5sksGFQ0ivafA+LqHkmqTEyqNjYg29oE8c7cdcx2yS
         snr2tZZvxdFY9qZRnOvC8RXiI2W3apSDg3r7hBSA6XRqwe3sqZcqDM7TToLy2xPySBem
         PK9iO9SNwOv0hMS6SzOdwYAa6A6rjpsb2wkpmO5Vuxwi7BKSx1Hykz6iJOrwtpbpdESg
         IIYVA5JYTrnJmqebrGsIXMUKqJvYr1WKXI3fAcwz9a9YA9cyeskUIEeElv6zJuyAHdq/
         SsqD9yxyGwlyS2NNFSM3fVSQc2TdzC1EbaNjUBP3L2foUiQuhqrCnD51ZI2Rp0t2s/ZK
         Mv+w==
X-Gm-Message-State: AOAM533NvGj6vP0q/kReC6PyRENcnTCR6O55m+uXvNHW81XcNYK75zIy
	s9UV12LoaMmkK+qfUXJCIkL5zGzm9VtwDJpPlos=
X-Google-Smtp-Source: ABdhPJxFqw/ekF97D/tXk5ofWNqZCI+xcze4Ppocwx+q0MiY6erFRUoGcfbHGEOFmm+aoojzsKKK7sbnZ6TqShvFO1U=
X-Received: by 2002:a02:694b:: with SMTP id e72mr4891697jac.89.1616511024557;
 Tue, 23 Mar 2021 07:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210323142503.11688-1-tomasz.dziendzielski@gmail.com> <CADkTA4Og-dpJRM8FPQDEUqK2M_vE0W=hCnuNQS1p2Edyqo-A-A@mail.gmail.com>
In-Reply-To: <CADkTA4Og-dpJRM8FPQDEUqK2M_vE0W=hCnuNQS1p2Edyqo-A-A@mail.gmail.com>
From: "Tomasz Dziendzielski" <tomasz.dziendzielski@gmail.com>
Date: Tue, 23 Mar 2021 15:52:22 +0100
Message-ID: <CAJkqNs0PuAxaYJurjKkPgAnNRexGemy5WZbkm8R5QYDs1FXV1Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-yocto: stop converting remote branches to local branches
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Wladislav Wiebe <wladislav.kw@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000064f5df05be354dbf"

--00000000000064f5df05be354dbf
Content-Type: text/plain; charset="UTF-8"

>On Tue, Mar 23, 2021 at 10:22 AM Tomasz Dziendzielski
><tomasz.dziendzielski@gmail.com> wrote:
>>
>> From: Wladislav Wiebe <wladislav.kw@gmail.com>
>>
>> Introduced poky upstream commit:
>> 14df6d53b6 linux-yocto: improve checkout error handling and reporting
>>
>> Converts all remote branches to local branches.
>> Our Linux repo has ~4500 remote branches:
>> git branch -a | grep remotes |wc -l  -> 4575
>>
>> This costs our best workstations ~20 minutes to simply do that conversion
>> in do_kernel_checkout which is not needed (at least I do not see any
>> benefit after testing with this patch).
>>
>
>Unfortunately, this is needed for some workflows on top of linux-yocto.
>
>So this can't go in as-is.
>
>Why you have 4500 remotes is another question of course ;)
>
>We could introduce a variable that when enabled makes the functionality
>optional, and would fix your use case.

Ok then, I'll prepare such a change with a variable to disable that
functionality. Thanks.

Best regards,
Tomasz Dziendzielski

--00000000000064f5df05be354dbf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;On Tue, Mar 23, 2021 at 10:22 AM Tomasz Dziendzielski<=
br>&gt;&lt;<a href=3D"mailto:tomasz.dziendzielski@gmail.com">tomasz.dziendz=
ielski@gmail.com</a>&gt; wrote:<br>&gt;&gt;<br>&gt;&gt; From: Wladislav Wie=
be &lt;<a href=3D"mailto:wladislav.kw@gmail.com">wladislav.kw@gmail.com</a>=
&gt;<br>&gt;&gt;<br>&gt;&gt; Introduced poky upstream commit:<br>&gt;&gt; 1=
4df6d53b6 linux-yocto: improve checkout error handling and reporting<br>&gt=
;&gt;<br>&gt;&gt; Converts all remote branches to local branches.<br>&gt;&g=
t; Our Linux repo has ~4500 remote branches:<br>&gt;&gt; git branch -a | gr=
ep remotes |wc -l =C2=A0-&gt; 4575<br>&gt;&gt;<br>&gt;&gt; This costs our b=
est workstations ~20 minutes to simply do that conversion<br>&gt;&gt; in do=
_kernel_checkout which is not needed (at least I do not see any<br>&gt;&gt;=
 benefit after testing with this patch).<br>&gt;&gt;<br>&gt;<br>&gt;Unfortu=
nately, this is needed for some workflows on top of linux-yocto.<br>&gt;<br=
>&gt;So this can&#39;t go in as-is.<br>&gt;<br>&gt;Why you have 4500 remote=
s is another question of course ;)<br>&gt;<br>&gt;We could introduce a vari=
able that when enabled makes the functionality<br><div>&gt;optional, and wo=
uld fix your use case.</div><div><br></div><div>Ok then, I&#39;ll prepare s=
uch a change with a variable to disable that functionality. Thanks.<br></di=
v><div><br></div><div>Best regards,</div><div>Tomasz Dziendzielski<br></div=
></div>

--00000000000064f5df05be354dbf--
