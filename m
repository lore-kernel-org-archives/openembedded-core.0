Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.839.1591111480587570050
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 08:24:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a1gtLCIs;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id i16so4280738qtr.7
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 08:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KSuhI0oyqW0Cg8p/NPFQzoJFPF4U71p/4vTTvEp4//Y=;
        b=a1gtLCIs03Ql7mKCwp5gkr1BVSDlZknEdzzHx/6iRwNlPQz0jUfwDb++Wy0ompRojE
         aRU979CH4olKjchfqLQWhYPegUOCvWmyc9toXoIOkpe8CVxk0P4W3Aoqm1B1uZhB9XFK
         7TGQW52MQGG6S7xIN+puZoHswhkaHLBZG1aTMvGnX0NgNy3y4qiXU6HhW51l0nKjdytU
         44dBHPmOI91NZqvWeBKOVXBYjOtEFci8IHV4KxXX2zsi7z6I4QzKVU2JmpBr2IJYoyhl
         5DK70dKkfmHoudEf9zxOlKr8152IQUfnP6UwMKTgEoYStf/pwF8hpIUbwY18kjsYsibH
         6Wow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KSuhI0oyqW0Cg8p/NPFQzoJFPF4U71p/4vTTvEp4//Y=;
        b=N5KczwStr2z5Ief4klTIjFNv37stI57BpVxygZk4vllZ7WmeMLEVM9s44MCxNjKd+C
         +CbU7lzcv4miXDb02IQLouZ/+0MXka36T2lpVWBmaQ5G/65kE6ryWsO1hb3LAHdFSMvo
         btg6zbEt9mZH1Rf3pIG4z5V2dLzkxb+6Z2a0HkaHnFjH/9sq+acG7dQSmVj3he24GmDt
         aacl6oD9na5gPoH85F2tnmP+4xWfv0OYexXIpuZ/sCEqyzKaPUIjUcziBwihYNr+2Exa
         hjaqMIvauFLRrS5YTtek4w9Vqj2dmET/Nm6OkVQK5/ZT3pSiHWVhOz5DTVh/SsQs0r0C
         2bhw==
X-Gm-Message-State: AOAM53244v9iTQIsh33bJd8o33r4//Qp4A6A83tG/OGFpHtsnfzQCG0S
	nqncLSD+WRQd1HqsmJm9bly7cyLxGQqXGEDmdpc=
X-Google-Smtp-Source: ABdhPJx4oLRKexs9WOrIgCeZnXWDdBp6i/eySwknliuYTHjE6N01i3dIzBu//lgkVCOAt2X4DHNQpxDQIsuzv+tdTsU=
X-Received: by 2002:aed:308e:: with SMTP id 14mr28056663qtf.146.1591111479620;
 Tue, 02 Jun 2020 08:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
 <20200531155254.10283-41-alex.kanavin@gmail.com> <cc365da8a2269d150ed2854c5eafea71c108b2be.camel@intel.com>
 <CANNYZj-rXODGtejn13KtYtUyHy083SeVtM7Gd6S3hmAsLuqPew@mail.gmail.com>
 <CAMKF1spKJZyjoE_qJWXhg+Jrqt2ZotJNRaUEkNZ69zhjxPHnkg@mail.gmail.com> <CANNYZj8zjOFUyYkgbK69hCphVNBUc-6EDyeiMasY9=hHtXTf2A@mail.gmail.com>
In-Reply-To: <CANNYZj8zjOFUyYkgbK69hCphVNBUc-6EDyeiMasY9=hHtXTf2A@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 2 Jun 2020 08:24:13 -0700
Message-ID: <CAMKF1sokpMAEniiqbQVkZNyitRQOO-THQn2iv6uzM=JKpPZKvw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 41/70] x264: upgrade to latest revision
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 2, 2020 at 12:18 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> I was thinking of simply dropping the revision from PV, and setting PE to 1 or so.
>

it seems gitlab is the new location for this so if SVN rev is
redundant info, then perhaps
bumping PE and dropping it from SRCREV is ok.

> Alex
>
> On Tue, 2 Jun 2020 at 05:51, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On Mon, Jun 1, 2020 at 3:53 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>>>
>>> On Mon, 1 Jun 2020 at 03:37, Mittal, Anuj <anuj.mittal@intel.com> wrote:
>>>>
>>>> >  UPSTREAM_CHECK_COMMITS = "1"
>>>> >
>>>> > -SRCREV = "1771b556ee45207f8711744ccbd5d42a3949b14c"
>>>> > +SRCREV = "296494a4011f58f32adc54304a2654627558c59a"
>>>> >
>>>> >  PV = "r2991+git${SRCPV}"
>>>>
>>>> PV will also need to be changed in this case to r2999+git${SRCPV}.
>>>
>>>
>>> I wonder if basing PV on svn revisions is still beneficial - we pull directly from github, rather than svn, and I don't think anyone is interested in what the svn revision is. Upstream does not tag releases.
>>
>>
>> Since it is set to denote svn rev not updating will add to confusion so please update it
>>>
>>>
>>> Alex
>>> 
