Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.1340.1616782326236521772
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Mar 2021 11:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ckijwuVc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id g25so3465467wmh.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Mar 2021 11:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=IrvTzIWIbAO3W5WIISfpq8jv+MMsn/5ubwX0+AO6vGw=;
        b=ckijwuVcjnIJYiM/WSgKP/dWl1/qTR10zUaq4HKK1PmG6NBP2TCE2TcgNI9EzSfIkP
         bsA0hBseZoI5o0KRaBmM+N6rwOYEzrCCt/dbYuknceWoboksnmKHB1J0gbAwORNNogZG
         xBHFG5YZp8t85LkV2uFgCx28h/tgY8TIAYzTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=IrvTzIWIbAO3W5WIISfpq8jv+MMsn/5ubwX0+AO6vGw=;
        b=o0xpz6QTO/CiGbgs6IEyXRVuGkJYO0cnBcvon/h7XlaXNt3UqJf/Methb5lahM7r8y
         cqBYubeho7SWCMOjvecXy2xxhmdX0pKqr8ucT5bCGjFqrbEycDFzhimf/qhkmm+V9CBl
         PISkfdAixpBO3OGoiLssdvUqlmUBCQbyUYlp7yLxHxuuEwQLONrPXKZyhcubwvFRKsku
         bGA6kYH+dRNlwhEbxuaulOvypvC1aFVYwc9/sw9TsTkANCa2Fg6jhcL2UR7ZquvC2ZIv
         ReuwdrcRZPqSjsgLel17joIZAJn0K5IVXM+PFl09/1BGsVnXukd83hh1f/UYt4moc1Ra
         iZUw==
X-Gm-Message-State: AOAM533YXFMVAa+ZWZBEye+t43k1AWr5YKuLiJQPBV1M77VI0+9WkJjR
	THunXwaoMibiH3Zor0f6wHPUJA==
X-Google-Smtp-Source: ABdhPJwdWagOd0R555lINxgV8PSAy4cNFdoACe9wHY9EtSNqbHzpjB8hCBnZPY+QM7vG+4PRcSUAWg==
X-Received: by 2002:a1c:1f8e:: with SMTP id f136mr3719829wmf.185.1616782324650;
        Fri, 26 Mar 2021 11:12:04 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:2f59:1239:417b:1a83? ([2001:8b0:aba:5f3c:2f59:1239:417b:1a83])
        by smtp.gmail.com with ESMTPSA id o62sm7035331wmo.3.2021.03.26.11.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 11:12:04 -0700 (PDT)
Message-ID: <b247e3521ddc2f0fc4cb20471c9b72956bc93c32.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v11] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, "Oleksiy Obitotskyi
	-X (oobitots - GLOBALLOGIC INC at Cisco)"
	 <oobitots@cisco.com>, Luca Bocassi <luca.boccassi@gmail.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "bluelightning@bluelightning.org" <bluelightning@bluelightning.org>, 
	Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Mar 2021 18:12:03 +0000
In-Reply-To: <6fd89e2f790a4a39832907f1832b1d92@XBOX03.axis.com>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 ,<20210311150959.782186-1-luca.boccassi@gmail.com>
	 <PH0PR11MB49023E90CAB5E58C2B603899D7629@PH0PR11MB4902.namprd11.prod.outlook.com>
	 <070d63d34bd6936df1e94c620103e2759dae0427.camel@linuxfoundation.org>
	 <5f37ee174e3f45e094ee2bb71c3c0422@XBOX03.axis.com>
	 <85dec47e7a6bf2533fe619fc391915d838e8924e.camel@linuxfoundation.org>
	 <bffd569338fe4f9f9e5671443d6cdbc6@XBOX03.axis.com>
	 <4b0c1bc6bb1ae476cdba3ce5848b0bf7008de1d7.camel@linuxfoundation.org>
	 <6fd89e2f790a4a39832907f1832b1d92@XBOX03.axis.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-03-26 at 18:06 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Sent: den 25 mars 2021 17:52
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Oleksiy Obitotskyi -
> > X (oobitots - GLOBALLOGIC INC at Cisco) <oobitots@cisco.com>; Luca Bocassi
> > <luca.boccassi@gmail.com>; openembedded-core@lists.openembedded.org
> > Cc: bluelightning@bluelightning.org; Khem Raj <raj.khem@gmail.com>
> > Subject: Re: [OE-core] [PATCH v11] util-linux: split uuid in separate
> > recipe to allow bootstrapping
> > 
> > On Thu, 2021-03-25 at 16:19 +0000, Peter Kjellerstedt wrote:
> > > > -----Original Message-----
> > > > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > Sent: den 25 mars 2021 15:27
> > > > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Oleksiy
> > Obitotskyi -
> > > > X (oobitots - GLOBALLOGIC INC at Cisco) <oobitots@cisco.com>; Luca
> > Bocassi
> > > > <luca.boccassi@gmail.com>; openembedded-core@lists.openembedded.org
> > > > Cc: bluelightning@bluelightning.org; Khem Raj <raj.khem@gmail.com>
> > > > Subject: Re: [OE-core] [PATCH v11] util-linux: split uuid in separate
> > > > recipe to allow bootstrapping
> > > > 
> > > > On Thu, 2021-03-25 at 14:22 +0000, Peter Kjellerstedt wrote:
> > > > > > -----Original Message-----
> > > > > > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > > > Sent: den 25 mars 2021 10:34
> > > > > > To: Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco)
> > > > > > <oobitots@cisco.com>; Luca Bocassi <luca.boccassi@gmail.com>;
> > > > > > openembedded-core@lists.openembedded.org
> > > > > > Cc: bluelightning@bluelightning.org; Peter Kjellerstedt
> > > > > > <peter.kjellerstedt@axis.com>; Khem Raj <raj.khem@gmail.com>
> > > > > > Subject: Re: [OE-core] [PATCH v11] util-linux: split uuid in
> > separate
> > > > > > recipe to allow bootstrapping
> > > > > > 
> > > > > > On Thu, 2021-03-25 at 09:17 +0000, Oleksiy Obitotskyi -X (oobitots
> > -
> > > > > > GLOBALLOGIC INC at Cisco) wrote:
> > > > > > > Could you look into this warning.
> > > > > > > 
> > > > > > > WARNING: util-linux-2.36.2-r0 do_package_qa: QA Issue: util-
> > linux-
> > > > dev
> > > > > > rdepends on util-linux-libuuid-dev, but it isn't a build
> > dependency?
> > > > > > [build-deps]
> > > > > > > 
> > > > > > > 
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/3226
> > > > > > 
> > > > > > That failure was my fault when testing some fixes.
> > > > > > 
> > > > > > I've sent out a patch which renames util-linux-uuid to util-linux-
> > > > libuuid
> > > > > > and sorts out the license issue Peter reported.
> > > > > 
> > > > > I don't mind the recipe being renamed and cleaned up, but I would
> > prefer
> > > > > to see my entire patch for the license parts being either integrated
> > > > before
> > > > > this or squashed into it, whichever you prefer. It does not make
> > sense
> > > > to
> > > > > use the same LIC_FILES_CHKSUM for util-linux-libuuid as for util-
> > linux,
> > > > > and setting the other LICENSE variables in util-linux.inc no longer
> > > > makes
> > > > > sense as they are only relevant for util-linux.
> > > > 
> > > > I'm torn on that. Code with the other licenses is present, just not
> > used
> > > > in the final output and I personally suspect that having one
> > LIC_FILES_CHKSUM
> > > > is going to be easier to maintain in the future rather than two
> > separate
> > > > ones.
> > > 
> > > I actually checked all the files that go into -dev and -src before
> > suggesting
> > > this change, and all files are either marked as public domain or use a
> > > BSD-3-Clause license.
> > 
> > There is a difference between what ends up in ${S} and what ends up in the
> > binary packages. LICENSE clearly governs the latter. Its the scope of
> > LIC_FILES_CHECKSUM which there are differences of opinion on.
> 
> Well, the latter governs what ends up in ${PN}-lic, so having a lot of 
> unrelated (to the installed packages) license files in LIC_FILES_CHECKSUM 
> does not make sense (to me). If everything that is built and (possibly) 
> installed and thus distributed is covered by BSD-3-Clause licenses, why 
> should ${PN}-lic include a lot of license files for unrelated code?

I hadn't considered ${PN}-lic :(.

We can't win. If we change LIC_FILES_CHKSUM we'll see complaints from
people scanning the code that there are licenses present in WORKDIR that
are not in LIC_FILES_CHKSUM. If we don't change it, ${PN}-lic does give
more information than necessary. I still think the latter is probably
safer and makes recipe upgrades easier.

Licensing in general needs a step back and an overhaul. Sadly people are 
generally only prepared to do this piecemeal solving their specific
issue rather than the general case and big picture.

Cheers,

Richard



