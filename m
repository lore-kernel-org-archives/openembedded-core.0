Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web10.70222.1597769029976033687
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2020 09:43:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AfZOGqyz;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id g13so7555188ioo.9
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2020 09:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PElu/aP4OkICBY/miBoEmy+1l1i8rYC4LdWaF+A9ALk=;
        b=AfZOGqyzMnu1FuxKGAcZ1RjRjEyyDAkjNVmyqc825pyCfrKtjE5OqKtkLwq8HhoiW7
         JlbPs8Rrvp9L0xgx+PFITyaJGfmEENvRYmjKYBC4H+HgljG+sG2p9cnbVpQgzc3q61hH
         uQtA9z71/FKyz92lOmMsde95Fxhzm/0FVo+9sG6gwY7QK+99sNO0Sup8FuSCWYw1WdSd
         Ccp0/BhT9NyMFTLEwqVuMaw0O7UooIN+A8GnVIFJfKQ+UoT4ibMNg9UvfjnJjdBpN62m
         S2PK/Z/HyNlveAfMzRfUsHOCGF0HCiIwADyh1U+FQDOZbHqfvOLwmXPZIOFxErlH3yFu
         mUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PElu/aP4OkICBY/miBoEmy+1l1i8rYC4LdWaF+A9ALk=;
        b=jfTM0YlVuK0KbAboDlV+uFI3vDCCMbzohLht1iFYTUTCLt+bg071yzStgsPjnyIN/E
         eUARMN8L6/c11Pz+T8N0oy1DcPOIvWaYQNeofMDk1Xb9Tld0QxhmPJE4eagdTdMJ4Cvm
         hIpGKPcazMzlN2xlZTAKJkA6qliBx6n6Q4NmyvuZFIyjubXrsf3seJsGUBBBZa3rg3+Y
         vRW8J/yY8l93b3gkQx0D+E/DwPTvxYhUBsS3HIM9rtv5LeGiyVpYljhseW8MQDdSHdLk
         bjsNMDxJf8G47yYAgyGgbRVNfKDiSpUTLbyWVRZIejhVcxXjnvijGjC3byef3+wahTGa
         UyDw==
X-Gm-Message-State: AOAM5323dsw4M/9r/4Cjh+HFJLs4ngAVKuy2+oDz8B8fz3nHV2e9Q64R
	PLERn7SIp2m3GEheo27/EbLOhQDnzjMQjOSLPOU=
X-Google-Smtp-Source: ABdhPJyGzYr3mBrUtlx0o/x8WvvWBGt5XJN9CBu6kxpv1wgOw1DAnDs1wI0v73ZUoUFOglhXxQDnA+YdFaVGKhg5G8o=
X-Received: by 2002:a6b:6611:: with SMTP id a17mr9022048ioc.129.1597769027780;
 Tue, 18 Aug 2020 09:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200807164249.32605-1-alex.kiernan@gmail.com>
 <CAMKF1spoj_R_-=CvzV6OE==jpEb0SiGj6FXPi17LoNZjivCOWA@mail.gmail.com>
 <16299320E916D773.23035@lists.openembedded.org> <CAO5Uq5Qc+rVRjAiK6vTiZzG8Ayd3RU0Pko==FXB-OF=krXkLqQ@mail.gmail.com>
 <CAMKF1sp4LUgBiEVYZMYOD9gJaNZePTOG56Xk+ovM1D0bzJDg6Q@mail.gmail.com>
In-Reply-To: <CAMKF1sp4LUgBiEVYZMYOD9gJaNZePTOG56Xk+ovM1D0bzJDg6Q@mail.gmail.com>
From: "Alex Kiernan" <alex.kiernan@gmail.com>
Date: Tue, 18 Aug 2020 17:43:36 +0100
Message-ID: <CAO5Uq5RTiJ7Gjv9yq_axtpVu55AYwe87gmuOC96j3Zk1uO_LMA@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] systemd: upgrade v245.6 -> v246
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2020 at 3:24 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Sun, Aug 9, 2020 at 4:04 AM Alex Kiernan <alex.kiernan@gmail.com> wrot=
e:
>>
>> On Sun, Aug 9, 2020 at 11:35 AM Alex Kiernan via
>> lists.openembedded.org <alex.kiernan=3Dgmail.com@lists.openembedded.org>
>> wrote:
>> >
>> > On Sun, Aug 9, 2020 at 7:22 AM Khem Raj <raj.khem@gmail.com> wrote:
>> > >
>> > > Hi Alex
>> > >
>> > > I am seeing a packaging failure for iwd
>> > >
>> > > http://errors.yoctoproject.org/Errors/Details/459665/
>> > >
>> > >  which seems to originate from this patch
>> > > iwd configure detects path to systemd modules load directory if
>> > > --with-systemd-modloaddir is not specified using pkgconfing to enqui=
re
>> > > modulesloaddir variable from systemd.pc
>> > > and the value for this has changed in latest systemd via this patch
>> > >
>> > > https://github.com/systemd/systemd/commit/4a56315a990b802860170ecd1b=
bd3eb68e14a38b
>> > >
>> > > as a result now
>> > >
>> > > modules_load_dir=3D${rootprefix}/lib/modules-load.d
>> > > modulesloaddir=3D${modules_load_dir}
>> > >
>> > > but rootprefix is empty in OE version of systemd.pc i systemd < 246 =
 had
>> > >
>> > > modulesloaddir=3D${prefix}/lib/modules-load.d
>> > >
>> > > and prefix=3D/usr
>> > >
>> > > I could have easily fixed it in iwd by adding the additional configu=
re
>> > > option but it seems that systemd recipe should rather be fixed to us=
e
>> > > proper value for ROOTPREFIX
>> > >
>> >
>> > Presumably this is building with usrmerge?
>> >
>>
>> Having dug a bit more, I suspect this is without usrmerge?
>
>
> That=E2=80=99s correct
>
>>
>>
>> It looks to me like that upstream change is just wrong for the !usrmerge=
 case.
>
>
> I am not sure perhaps best to ask upstream Via comments to systemd commit
>

https://github.com/systemd/systemd/issues/16773

I have a patch locally which "fixes" it, but waiting to see first what
the upstream view is.

--=20
Alex Kiernan
