Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.31118.1631546405464398632
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Sep 2021 08:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=06+iPLEN;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.43, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f43.google.com with SMTP id d6so15273137wrc.11
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Sep 2021 08:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ae30/q/LC9MsLKEIQmDodWZOsUlkbPRL6P7b9ueI5j4=;
        b=06+iPLENXWsYds1HQDr3GCbwIUEe1u+X9MJu3hFEPyGcWgBhyZMeqvhqtORc/7YM+2
         EDefFIu7E127I1HfRWPG+gy2hCP8rhq0yWWquLyRVKD7UDB4WxkQB9D3At6Eb1ln4O4d
         E+hVIoqVdEWIe6h9ur2f0euMq7XrWf5cklDwFzFLPcuR+ercAqNvq+BvrTWHPglsgPbM
         qyrfMuVNHAGoCKTctgjuduuFXApJbQtRifUXBLmRpgOa+Tm2i+JzGEYqltRe7y4uoHEU
         5M2q9hoIs62IbpZTbyZEjQTQbSuoAzxFp7cI5N50V5DnXpm+TyDrYx1AmVfg4ixyldTY
         zwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ae30/q/LC9MsLKEIQmDodWZOsUlkbPRL6P7b9ueI5j4=;
        b=R+OV4ivjRgeY2oEPCen/7l7RPDVSWcME5S1027n9BPME/c8Peg/zta4qACjd8ojbts
         3zST6gMRY790379vR81bVpBJT0uVeXNAFToZ4DF5XMBTqjRoHKmPIR/BTZuiKkZzVmio
         BMy+ad8v9RuaGOgLRLIh2PE7ygIoJtIyLsp0n6GTjzhienBi/t3loUj/udI20IpmY1P6
         59Nk5bgioHJ7cb/D9kgWpDT5KqFQdfc9HX6DQcQLcgh74OVZCwUYcZPS3xe3P4u5uBHF
         fDDqvRyQuHH8Imb4fUoJTQLexfSaxxTx1FX49bNxLkYAbp+SgXw+DnoS/6GhzwLXsyLx
         rivQ==
X-Gm-Message-State: AOAM532lQof3/ZV/JHuZdThErkP9c4X9Zw6FMeOmdQYEHwK/FqI0sFqZ
	aMxpBuzYm1ryr7RSus5h7WDL+XKnuf4VgizlwQS/Ug==
X-Google-Smtp-Source: ABdhPJzrj+CKQHDQrpbyuEKX+nKAo0emRryPHsQXzmFcn/KyWCzPZBp6Ug2VVP3oOa8uUjOfTyk87q08l7XtObq4J8o=
X-Received: by 2002:a5d:4803:: with SMTP id l3mr13352431wrq.61.1631546403562;
 Mon, 13 Sep 2021 08:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210912150121.8237296032A@nuc.router0800d9.com>
 <d6ad55b4fdcca27eee438031ea60b586c0f7f9da.camel@linuxfoundation.org> <16A41EB09718E439.21276@lists.openembedded.org>
In-Reply-To: <16A41EB09718E439.21276@lists.openembedded.org>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 13 Sep 2021 05:19:52 -1000
Message-ID: <CAOSpxda2cHN3d0WDMLszq8QJD0-Qa37e0NU57Xu21EXR672oFg@mail.gmail.com>
Subject: Re: [OE-core] [yocto-security] OE-core CVE metrics for hardknott on Sun 12 Sep 2021 05:00:01 AM HST
To: Steve Sakoman <steve@sakoman.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 12, 2021 at 6:05 AM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
>
>
> On Sun, Sep 12, 2021, 5:57 AM Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Sun, 2021-09-12 at 05:01 -1000, Steve Sakoman wrote:
>> > Branch: hardknott
>> >
>> > New this week: 0 CVEs
>> >
>> > Removed this week: 2 CVEs
>> > CVE-2020-27748: xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
>> > CVE-2021-38185: cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38185 *
>>
>> I'm not sure I believe these numbers as tar CVEs which showed up for dunfell and
>> master don't show up here. Why? :/
>
>
> Don't know! Will investigate tomorrow.

I re-ran the hardknott report this morning and it now includes the
missing tar cve's (as well as the libsolv, vim, and inetutils cve's we
saw in master/dunfell)

No idea why these weren't in yesterday's report since they were
obviously in the upstream database and appeared in the master and
dunfell runs (and hardknott runs last)

I've seen this kind of thing once or twice in the past and have never
been able to figure out what is going on since it is so intermittent.

Steve
