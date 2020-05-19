Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com [209.85.222.65])
 by mx.groups.io with SMTP id smtpd.web10.5130.1589918242622350260
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 12:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PjypoJjs;
 spf=pass (domain: gmail.com, ip: 209.85.222.65, mailfrom: armccurdy@gmail.com)
Received: by mail-ua1-f65.google.com with SMTP id a37so417973uad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 12:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JmUMIM52hmRhU6c9SOKkDKPzNy7edbLqeES8FfGMUIE=;
        b=PjypoJjsGmGm4rjOaTJ5wcw+OC2aAniI5w8IBlAFsgFebmtiLWEsEGNsq2RIMHiv3Y
         giiqVhTdIp9vIf2mA0hDTxNhqbpOtoJYbkrgOfoT5us/WA1Fi/M11K8DGokPfchu45x7
         zirHA7ACdExo4lJ9dngr03VI3TiECb59Tag8Kmz5PxENSYXlOvbKfVH5gZsFpqxRNdqB
         255f5iilIyOox6pQ2HrY2bMIS1Q6fsiN4/O8WWjNBp02/i3svlsgJEjjprCJOPzfPskc
         MpICJHKXjqvWTHuE+12dlVVYK+MqIX4lO0fll+i797k6UkX7LWUOcHy8A5l7NCAZa9ue
         Tf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JmUMIM52hmRhU6c9SOKkDKPzNy7edbLqeES8FfGMUIE=;
        b=dWikdmC0s1Wo/ILrc9yHWR6E+WSpHMS58/QLFa5V87s+t47afqhCdYlzovFCMbUlNN
         OxVYR4nieFP/Y7g++RThkxWHiYATGljbAs+fRCcnRUru+MlC2issjkLsNnL43ze3x0DP
         i4QtglY8NKKrR7KllkUubh6XBoFR2UVO/o/GzeoKNDriShpjpoFV04ygqp3SaurSWO6k
         xJJXrJdHhJWJShGm9FrN3AT57qibffbgcCMbQWOG/mxvNabFBxaykoTfU4NeaAhu2qdw
         ldFu1i5wlBmJ5grsDsZF6SA8qZRtJNkllxDf3nN8/fPNpZ4ogKb+R7DnpaIybfP038in
         SgoA==
X-Gm-Message-State: AOAM531IE1j2b28+1eBtXSlqvXASCxIUlGfBFQWCJ6O+37glLyg7Xbqp
	XxPahfO4mUUvAaf4bWK8f+77e8gdsFnySvRpV+4=
X-Google-Smtp-Source: ABdhPJy6DGhEFDP2togFTuQ3+szKptcDfz+yISvYbFxPITI3MReom20tvLM4OIFsReDQ7UFHqYm5hgJhUbUzUwUOTcc=
X-Received: by 2002:ab0:d97:: with SMTP id i23mr970662uak.106.1589918241318;
 Tue, 19 May 2020 12:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
 <CAGDS+n=_mqZeLFusTNV6s7EKNBDVdM589wAmcJ5qQH2BMn=MLw@mail.gmail.com>
 <20200516174702.GA22042@localhost> <c18319417f2146939146bfac448c258c@XBOX03.axis.com>
 <20200516200957.GA8056@localhost> <CAHtQpK4AH08zQ6dx1OWjCR6WwAmrLHNZuz0O1O9WqUnBHNk2Pg@mail.gmail.com>
 <20200517132245.GA9940@localhost> <CA+chaQeoVSY1HqivTCVkDixgJZOzxYchZ83FvRhgKuADwKJcFg@mail.gmail.com>
 <20200517154525.GA16162@localhost> <CA+chaQdKYt1ZMGxEnb6nQ2B3KitWXcNBsecgzfZ-htEVH=ySnA@mail.gmail.com>
 <20200517161441.GB16162@localhost> <5731941e-fe0c-e242-bea5-cd0d3c2ef772@gmail.com>
 <CAGDS+nkfNwuePOPSJ3JdRVqbzz=XTAvxMK_pjoeAX8vGnSS0HA@mail.gmail.com> <CA+chaQcADhU_7tzV89CsEHH8YDa3xOobwxQmri9_2EWcLGVMWg@mail.gmail.com>
In-Reply-To: <CA+chaQcADhU_7tzV89CsEHH8YDa3xOobwxQmri9_2EWcLGVMWg@mail.gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Tue, 19 May 2020 12:57:10 -0700
Message-ID: <CAJ86T=XCWi=1K0XmFgNjJzMBfKhnLxTKF1zZ84K-=roJVzRoqw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 0/4] Import recipes from meta-python
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Steve Sakoman <sakoman@gmail.com>, Khem Raj <raj.khem@gmail.com>, Adrian Bunk <bunk@stusta.de>, 
	Andrey Zhizhikin <andrey.z@gmail.com>, Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Denys Dmytriyenko <denis@denix.org>, 
	Joshua Watt <jpewhacker@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"jdmason@kudzu.us" <jdmason@kudzu.us>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 19, 2020 at 11:25 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> We have discussed this in OE TSC meeting yesterday:
> https://lists.openembedded.org/g/tsc/topic/openembedded_tsc_meeting/74313532
>
> tsc suggested to use LAYERVERSION bump in oe-core with LAYERDEPENDS_meta-python update in meta-python, so that people will need to update both layers (or neither if they really cannot).

OE living up to it's nickname... Over Engineered :-)

> Joshua volunteered to send patches if everybody agrees on this proposal.
>
> On Tue, May 19, 2020 at 8:21 PM Steve Sakoman <sakoman@gmail.com> wrote:
>>
>> On Sun, May 17, 2020 at 1:47 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> > On 5/17/20 9:14 AM, Adrian Bunk wrote:
>>
>> > > IMHO moving recipes from meta-openembedded (or other layers) to oe-core
>> > > in a released stable series is not a good idea.
>> >
>> > I think in current form in this situation it certainly seems a bit
>> > complex sadly, however, we also need to explore if there is some "good"
>> > way of doing such changes without breaking distro builders.
>>
>> It seems we don't have a clear consensus that backporting these
>> patches to dunfell is a good idea.
>>
>> So for now I'm going to take the conservative approach and refrain
>> from taking these patches in LTS.
>>
>> We can always revisit this later if the situation changes.
>>
>> Steve
>
> 
