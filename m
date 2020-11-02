Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web09.805.1604334276911158489
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:24:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YiUbBc2R;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id r7so11995709qkf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wXkYDnyLldTW/2HMVVt8ry5ieP4jmwd6ibgZye9pU8M=;
        b=YiUbBc2RPPpqxw+iBOheesD2KwNGdUOjNN067R0ddsasBM0+AhYYgn2KS5H9dA3Cut
         xjTB2lsUXucb7U+dPtpqpj9+GW68MVSlYbizdqwsU6qTxgIaie9TCFJiLZtafyY8uR2F
         12M6GoGxjhYgZE1NDwCejgK6WxxcCXILW6B872I0zSn+zNs2dcwPWv052M0ncSuZ2czD
         jQMkHlmZykwSfL/kDQEdvoBNjgDuvA3+McMhLzzI4FRY7nyhLLsJplIOEaJr4WL7Blb/
         UOGkUAA18zzVIeRzzfL9lAV6VxoLbp214/6eQ878mZyjAJRkHEMLp95WwECVlSnCeZdp
         a4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wXkYDnyLldTW/2HMVVt8ry5ieP4jmwd6ibgZye9pU8M=;
        b=nB/0fP72PPUA/F5xxmhXhnFhktbnf28999yBUuTFlAZ6C72NWsj0aU8kGQLXLsarod
         gJknsymogJN3Lc/sW+4LxSCljtHp6AGIZserhVUIvgZOqByIuiwHDqSypyw2CEsKOWmi
         /22acstfm33kbiipBi3OlSzU5+Cb6rH+A0zGGkQJYKKpgsErCY3B5c7ccZ+QAYK0QKYu
         S/8HB4TWe3fN4Wk+F9HGn3KxiPPxv7wxAULMQKrNYwFJyC4nsdXF4KNJdmqHx+jqj1Q7
         JBQw4uTSBBu4SoXfG8t7KxUNvwwCHV/aPoVx+t+2wXM5UiAAxWAuti/7HAIL23mEUSh8
         9bmA==
X-Gm-Message-State: AOAM533RjW8wR22aJVSmuD/Ua5NAjgaBjzgq0oMLLZD18VUMDzAvSZE5
	qq2hvXoDE8E/hThrJXSRHuxbCxr43OFdffGzPSI=
X-Google-Smtp-Source: ABdhPJxAH0PIUNNNUHlhsF1C5w2/1fFcYb5yjtFfzDZ3B+WVxOhaJVIQPnFwbWrHM2ODc2C8bUmzePPzshOYcZwz2Qs=
X-Received: by 2002:a37:27c9:: with SMTP id n192mr14877881qkn.71.1604334275937;
 Mon, 02 Nov 2020 08:24:35 -0800 (PST)
MIME-Version: 1.0
References: <20201027081519.5550F80A5F80@fedora30-ty-1.yocto.io> <BYAPR11MB36246B84B23AA53E7D4F5377E3100@BYAPR11MB3624.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB36246B84B23AA53E7D4F5377E3100@BYAPR11MB3624.namprd11.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 2 Nov 2020 08:24:09 -0800
Message-ID: <CAMKF1soHmEaWaAs6MOKWZ7b1EnOawUo0jk=tGym4QE_+EKr=Aw@mail.gmail.com>
Subject: Re: [yocto] QA notification for completed autobuilder build (yocto-3.2.rc2)
To: Sangeeta Jain <sangeeta.jain@intel.com>
Cc: "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>, "yi.zhao@windriver.com" <yi.zhao@windriver.com>, 
	"Sangal, Apoorv" <apoorv.sangal@intel.com>, 
	"Chan, Aaron Chun Yew" <aaron.chun.yew.chan@intel.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"akuster808@gmail.com" <akuster808@gmail.com>, "sjolley.yp.pm@gmail.com" <sjolley.yp.pm@gmail.com>, 
	"Teoh, Jay Shen" <jay.shen.teoh@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 1, 2020 at 8:18 PM Sangeeta Jain <sangeeta.jain@intel.com> wrote:
>
> Hello all,
>
> This is the full report for yocto-3.2.rc2:
> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?h=intel-yocto-testresults
>
> ======= Summary ========
> No new defects are found.
> No high milestone defects.
>
> Bugs verified:
>
> BUG id:14106 - [QA 3.2 RC1] failure in ptest : glib-2.0.glib/gdatetime.test
>    Verified Fixed.
>
> Existing bugs observed in this release:
>
> BUG id:14051 - [QA 3.2 M3 RC1] failure in ptest : valgrind.drd and valgrind.helgrind
>    Updated with 17 ptests passed, 1 ptest still failing
>    No new failures.
>
>
> ======= Bugs ========
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14106
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14051
>
>


This looks good. I am fine with releasing this.

> Thanks,
> Sangeeta
>
> > -----Original Message-----
> > From: Pokybuild User <pokybuild@fedora30-ty-1.yocto.io>
> > Sent: Tuesday, 27 October, 2020 4:15 PM
> > To: yocto@lists.yoctoproject.org
> > Cc: otavio@ossystems.com.br; yi.zhao@windriver.com; Sangal, Apoorv
> > <apoorv.sangal@intel.com>; Yeoh, Ee Peng <ee.peng.yeoh@intel.com>; Chan,
> > Aaron Chun Yew <aaron.chun.yew.chan@intel.com>;
> > richard.purdie@linuxfoundation.org; akuster808@gmail.com;
> > sjolley.yp.pm@gmail.com; Jain, Sangeeta <sangeeta.jain@intel.com>
> > Subject: QA notification for completed autobuilder build (yocto-3.2.rc2)
> >
> >
> > A build flagged for QA (yocto-3.2.rc2) was completed on the autobuilder and is
> > available at:
> >
> >
> >     https://autobuilder.yocto.io/pub/releases/yocto-3.2.rc2
> >
> >
> > Build hash information:
> >
> > bitbake: fec2b85689bba1d26ad6f376bc11cc29bb27cbe5
> > meta-arm: 2d3ded053ae0774b9c7254bdc084451438b2150a
> > meta-gplv2: 6e8e969590a22a729db1ff342de57f2fd5d02d43
> > meta-intel: 4ee7bc0ab408db7388374e86920ffa378b7b4535
> > meta-kernel: dbf8bdfa6683404e5071feb47ef6aa347cab1b01
> > meta-mingw: d2809d7c93bdb46014e1f8b3b0a4f42030078905
> > oecore: d3114ca369792201a5316c1ede29eb72f0868d35
> > poky: 5d75168a13d00253460020e536b2a87833ec67d2
> >
> >
> >
> > This is an automated message from the Yocto Project Autobuilder
> > Git: git://git.yoctoproject.org/yocto-autobuilder2
> > Email: richard.purdie@linuxfoundation.org
> >
> >
> >
>
> 
>
