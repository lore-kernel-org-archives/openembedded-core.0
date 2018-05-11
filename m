Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 52CEB78690
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 22:05:54 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id t23-v6so8659474ioc.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 15:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NQ8upV8cGF79w/d0nbtM29X0/KnalBlvOOk8wKNKDsY=;
	b=ZnUarcWSkLwr/rkPanTZ3X1kwuOhb/xDgvkgy+dZoSdBaiBgH0EdDpGKiKYbhF7QvM
	ftpt3H0e3SXKaS2ILGlC+1uL4ZUgan5nLE6/JeEsQjzrq343TEuIuosz5M/9oii+Ua8M
	AJwXceJdbXl2liwROyqEA45e8UmMv4A+UMPvKmRE67YrAlDpjMJ/DBu4NHC4W+bpQygd
	2mRymP96m1M1fmG3Nk3hZbmUx5fEM1mL1CLWpJaOLFqqIj5BnUb5PoHXK1HiJVRJtYzn
	u3ZP15FPQ6jnR8ozlr0LaUFJFcErd+R+g6cY702HO8nR8a2iPYZthx0QlIoZNNkr0hS1
	aJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NQ8upV8cGF79w/d0nbtM29X0/KnalBlvOOk8wKNKDsY=;
	b=GSOe0q6FKuUSwaaEJfHZzaZBWl6WkNpZQQDIMUllYkhE7ibmn2eXydiB+Dabr/+o+8
	59bkbWdmZRZOyZxa6TFZU5fTase//5WkASF8ucsk8lL5HzTIgu5/XVvs2zb34sUp06nK
	kjsxekUPyVmBJIkUGMNSeRVnLjOeaXDuRkMwvXWmbwVOWnrKlRTnrmdmY+y1oFaaGbMD
	B//WA0Rk90IpsMvLhmilEjs9nAidscPYQ9l3KNUDNlXjL7isO4Lub2OrCgj3sQbPQRwE
	jpqQpr262Tq/jSJ2aLQwZ2fIgmG8QIU8uNyLMU1beQpKmC+eeQ1nv8IZcriaeX5c0CSC
	o1Ww==
X-Gm-Message-State: ALKqPwcoQ1WQb4i+mayYRED3Bd5H1x/cziymunxMHQkJBWOlvf5+PEFE
	+nXiBt2kbJ3JbfuoRT0iMopAS1cssh1k7ln09yPsrw==
X-Google-Smtp-Source: AB8JxZp/oll2DIGo0AVw2YCAuajt7MtWM3Uxck9LBFMmXAU/qTHFUExli6M5ZD0u4tC1PeBjXUch6tte3c8iLM6alik=
X-Received: by 2002:a6b:248e:: with SMTP id
	k136-v6mr187199iok.270.1526076355316; 
	Fri, 11 May 2018 15:05:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Fri, 11 May 2018 15:05:34 -0700 (PDT)
In-Reply-To: <CAMKF1spa1bbrUjQWbhdUw3C4Cxu99fU=Be3sEm+SYFNq_oxEKw@mail.gmail.com>
References: <CAMKF1spa1bbrUjQWbhdUw3C4Cxu99fU=Be3sEm+SYFNq_oxEKw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 May 2018 23:05:34 +0100
Message-ID: <CAJTo0LYmyzY67JC=72OMRBRH=8juBSnAVaYUKB6ENZ9koqPqTA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] GCC 8.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 May 2018 22:05:54 -0000
Content-Type: text/plain; charset="UTF-8"

I threw the branch at the Yocto Project autobuilder today, produced a
number of failures:

http://errors.yoctoproject.org/Errors/Latest//?filter=b23dba19607412c8cc7d267d95354d65f5631088&type=commit

Ross

On 5 May 2018 at 01:26, Khem Raj <raj.khem@gmail.com> wrote:
> Hi All
>
> As you might have noticed that gcc 8.1 was released this week, I am
> calling out for some testing help on testing branch so we can weed out
> issues you might see in your setups. so if you have your
> builders idling over weekend, then you know what they can do this weekend :)
>
> Highlighted changes are
>
> https://gcc.gnu.org/gcc-8/changes.html
>
> and porting doc is
>
> https://gcc.gnu.org/gcc-8/porting_to.html
>
> The branch is here
>
> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-8
>
> Its uptodate on top of current master oe-core
>
> May fourth be with you !!
>
> Cheers!
>
> -Khem
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

