Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7609DEE49A4
	for <webhook@archiver.kernel.org>; Sun, 20 Aug 2023 18:10:40 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.914.1692555031121730212
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Aug 2023 11:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Dp/LSLEl;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.176, mailfrom: steve@sakoman.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2b9db1de50cso40264911fa.3
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Aug 2023 11:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692555029; x=1693159829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23w/FbAlsTcIq3rWUEHxDsE1fXZyFPZpNSJHUBNtPWg=;
        b=Dp/LSLEl+ROZQ2VxgnBtzsthMa8moskNTAGAzDN7XInv5RBaMFl028pQ0fg8mpbvCE
         IAJF4owjiZ/ggOMRh4XqzrLrluTICAF0R88GKaYrIUq+yFmIe9ZtTUNZpVftf0E5Ufn5
         Fw/VugYlOsY0R6b0oWV8CHVCA6DLw6yen3hXneJYsTarUo91l2+OKbCEi6jCHdr8kQkG
         QAQku2uKHTf6VmylbCD6q6X6SFzH1pYjqChT72tJ/dDdX7ayEPt5czF1LhKoxP/vfkds
         5HtbfFMIEWZdjS03E9AwyB73TUOPrzCnhYjUg8TnqwAMBB3zfS7YjwyOPElHbAajSnV6
         v/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692555029; x=1693159829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23w/FbAlsTcIq3rWUEHxDsE1fXZyFPZpNSJHUBNtPWg=;
        b=Tv/eaQacKPFl+G2cVnDEwIiVd8y5vPNDdFM/gwvw4SPmWwZGl4nhs05mIR+6je9MGJ
         ZTH/2OVNqPbIIulPmmDvZtGZH2obTLfElihFYHTcQ6tpw6vK8cdszrROtrKGH1fdQUnZ
         4tXyIqmXuV8mWBCin/h06VidUYk44rrGR2aVkydOG3WoJhjUfrpr5NUP2t/MB+zcQia2
         yMKf5dXbreVcPVCgzmBojboKnWZ6whsaBzElm/YYBMpTdrsVpsOOPCPuAR9PJmRcCtR7
         MJRYuGUYDNFYK1sRgFY5O0x9I/AqP08/efBYXE3IlC72kbXhJEg8JN26/MCEFvUX9Cg9
         18Rg==
X-Gm-Message-State: AOJu0Yy5Fxh54QtYW8rroBVIMrignWxC7OTFvZuv/MHDep2exSBgng69
	wEguc58QdjgKhj3SrafTvzd2bvFx4Ytf6HvF3zW/FQ==
X-Google-Smtp-Source: AGHT+IFGtoMCVKOg5fjkD2uobAwuiMK4m1EyN3u0Yu3E9zlM/Rr1o24/8GabQ7/6RIBPbAOAgUGP669DY5dNOZa4yNk=
X-Received: by 2002:a2e:4952:0:b0:2b8:39e4:2e2c with SMTP id
 b18-20020a2e4952000000b002b839e42e2cmr3110208ljd.1.1692555029047; Sun, 20 Aug
 2023 11:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230820111950.15E381070A5@builder.sakoman.com> <CAMKF1srJgDx0w8NvQx+0WE9OPVdY+mDOz_q1En4nsXH=CPaBbw@mail.gmail.com>
In-Reply-To: <CAMKF1srJgDx0w8NvQx+0WE9OPVdY+mDOz_q1En4nsXH=CPaBbw@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 20 Aug 2023 08:10:18 -1000
Message-ID: <CAOSpxdZOG_=jnbBiQhCrcfPzscP251E1HeZH84ESFuEk3VUoCQ@mail.gmail.com>
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 20 Aug 2023
 01:00:01 AM HST
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Aug 2023 18:10:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186415

On Sun, Aug 20, 2023 at 7:30=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> On Sun, Aug 20, 2023 at 4:19=E2=80=AFAM Steve Sakoman <steve@sakoman.com>=
 wrote:
> >
> > Branch: master
> >
> > New this week: 3 CVEs
> > CVE-2023-0687 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-0687 *
>
> We are at 2.38 release on master and this release contains
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D801af9fafd468933=
7ebf27260aa115335a0cb2bc
> which fixes this problem. So I wonder why it appears in the scan here ?

Here is the note associated with this CVE:

"** DISPUTED ** A vulnerability was found in GNU C Library 2.38. It
has been declared as critical. This vulnerability affects the function
__monstartup of the file gmon.c of the component Call Graph Monitor.
The manipulation leads to buffer overflow. It is recommended to apply
a patch to fix this issue. VDB-220246 is the identifier assigned to
this vulnerability. NOTE: The real existence of this vulnerability is
still doubted at the moment. The inputs that induce this vulnerability
are basically addresses of the running application that is built with
gmon enabled. It's basically trusted input or input that needs an
actual security flaw to be compromised or controlled."

Steve
>
> > CVE-2023-4128 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-4128 *
> > CVE-2023-4147 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-4147 *
> >
> > Removed this week: 15 CVEs
> > CVE-2022-3533 (CVSS3: 5.7 MEDIUM): linux-yocto https://web.nvd.nist.gov=
/view/vuln/detail?vulnId=3DCVE-2022-3533 *
> > CVE-2022-3606 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov=
/view/vuln/detail?vulnId=3DCVE-2022-3606 *
> > CVE-2023-0160 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov=
/view/vuln/detail?vulnId=3DCVE-2023-0160 *
> > CVE-2023-2176 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-2176 *
> > CVE-2023-23039 (CVSS3: 5.7 MEDIUM): linux-yocto https://web.nvd.nist.go=
v/view/vuln/detail?vulnId=3DCVE-2023-23039 *
> > CVE-2023-2430 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov=
/view/vuln/detail?vulnId=3DCVE-2023-2430 *
> > CVE-2023-2975 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.n=
vd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-2975 *
> > CVE-2023-3446 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.n=
vd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3446 *
> > CVE-2023-35827 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2023-35827 *
> > CVE-2023-3618 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2023-3618 *
> > CVE-2023-37453 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.go=
v/view/vuln/detail?vulnId=3DCVE-2023-37453 *
> > CVE-2023-37454 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.go=
v/view/vuln/detail?vulnId=3DCVE-2023-37454 *
> > CVE-2023-3817 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.n=
vd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3817 *
> > CVE-2023-4132 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov=
/view/vuln/detail?vulnId=3DCVE-2023-4132 *
> > CVE-2023-4133 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov=
/view/vuln/detail?vulnId=3DCVE-2023-4133 *
> >
> > Full list:  Found 29 unpatched CVEs
> > CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2019-14899 *
> > CVE-2021-3714 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2021-3714 *
> > CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2021-3864 *
> > CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2022-0400 *
> > CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2022-1247 *
> > CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist=
.gov/view/vuln/detail?vulnId=3DCVE-2022-3219 *
> > CVE-2022-33065 (CVSS3: 7.8 HIGH): libsndfile1 https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2022-33065 *
> > CVE-2022-36402 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.go=
v/view/vuln/detail?vulnId=3DCVE-2022-36402 *
> > CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.go=
v/view/vuln/detail?vulnId=3DCVE-2022-38096 *
> > CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov=
/view/vuln/detail?vulnId=3DCVE-2022-4543 *
> > CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.ni=
st.gov/view/vuln/detail?vulnId=3DCVE-2022-46456 *
> > CVE-2023-0687 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-0687 *
> > CVE-2023-1206 (CVSS3: 5.7 MEDIUM): linux-yocto https://web.nvd.nist.gov=
/view/vuln/detail?vulnId=3DCVE-2023-1206 *
> > CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native ht=
tps://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-1386 *
> > CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native =
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3019 *
> > CVE-2023-3180 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native =
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3180 *
> > CVE-2023-3354 (CVSS3: 7.5 HIGH): qemu:qemu-native:qemu-system-native ht=
tps://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3354 *
> > CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-3640 *
> > CVE-2023-36632 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nv=
d.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-36632 *
> > CVE-2023-36664 (CVSS3: 7.8 HIGH): ghostscript https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2023-36664 *
> > CVE-2023-3772 (CVSS3: 4.4 MEDIUM): linux-yocto https://web.nvd.nist.gov=
/view/vuln/detail?vulnId=3DCVE-2023-3772 *
> > CVE-2023-3773 (CVSS3: 4.4 MEDIUM): linux-yocto https://web.nvd.nist.gov=
/view/vuln/detail?vulnId=3DCVE-2023-3773 *
> > CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nv=
d.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-37769 *
> > CVE-2023-4004 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-4004 *
> > CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov=
/view/vuln/detail?vulnId=3DCVE-2023-4010 *
> > CVE-2023-4016 (CVSS3: 5.5 MEDIUM): procps https://web.nvd.nist.gov/view=
/vuln/detail?vulnId=3DCVE-2023-4016 *
> > CVE-2023-4128 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-4128 *
> > CVE-2023-4135 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native =
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-4135 *
> > CVE-2023-4147 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-4147 *
> >
> > For further information see: https://autobuilder.yocto.io/pub/non-relea=
se/patchmetrics/
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#186408): https://lists.openembedded.org/g/openembed=
ded-core/message/186408
> > Mute This Topic: https://lists.openembedded.org/mt/100852965/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

