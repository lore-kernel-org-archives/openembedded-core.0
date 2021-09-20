Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.9065.1632128126293761156
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 01:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gxHIibja;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id l18-20020a05600c4f1200b002f8cf606262so14934878wmq.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 01:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Z6uB2rZaemPojcyNJFpk6/HVLc66uta53QIHLLw9+Uk=;
        b=gxHIibja8aNsGDu/anbSJQp2DYl5O9VLTNPwP1/Tl2etfDfa0qqSiAbA6eD33rC7C3
         NjvQ5BNi15Wljgcljucfupwz/u42FXDzEfl7KplK5k20JBLocMOP5aMO/BC1qEIlJR4F
         OWXDsjHl8ZWqSp1usutkePgd5WtAuqK1F6Vhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Z6uB2rZaemPojcyNJFpk6/HVLc66uta53QIHLLw9+Uk=;
        b=QInG9NzG5Ril5V+Dsx/r8mumLJ6kZW3ac6XyR5KoIV6G0fzgiR2FU5SST98y+AAfKh
         Xly4HV9Pz1vS2tley65mhKqIKPL/KcipsaMSLJpZvsM/N3Oa4kCFewWpY1kf6HLDS8g3
         /rZIl03WyyxL0UD33aQrip0igu2g+ZQ8DjPUbcaNrctszpLWnFnwTphxtfMsq4z7hkWH
         MahgmZ3GlOcRqSKfH2LqgEAzYRHTkdTI4YCDuoS4TGauuvGNx589wCLpWP9ablYp9DfQ
         IoO6Xc52k/Do6srh/EbF8PWzxzhDWREDOqyBi4zGdKPkJlOiD2AlFK25LNjnkVuO1Zzr
         +F+A==
X-Gm-Message-State: AOAM532sDWLFGZzToOTbMawMxZOgm/43s6iWqEh3zcxn4UV7GYiF4kmD
	tzDaxV0j0xpKhxHX2vrzt0aIIA==
X-Google-Smtp-Source: ABdhPJy7ZaK3+3b/WI5QErCZKkt23h80Ynuea4J9s2Q9PyA9iIPO6JAK0i/PYWJ3/nyOz1ES/8VI2Q==
X-Received: by 2002:a05:600c:3548:: with SMTP id i8mr628594wmq.106.1632128124694;
        Mon, 20 Sep 2021 01:55:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7173:466e:b128:3e8b? ([2001:8b0:aba:5f3c:7173:466e:b128:3e8b])
        by smtp.gmail.com with ESMTPSA id d2sm15130022wrc.32.2021.09.20.01.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 01:55:24 -0700 (PDT)
Message-ID: <0122af3a191b9d45c2fbae0eb575a3d712827b77.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] package_ipk/deb/rpm: Drop recursive do_build task dependencies
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Sep 2021 09:55:21 +0100
In-Reply-To: <20210920074554.42tmgvqdp2qjlxlc@fedora>
References: <16A633F8E639735E.6604@lists.openembedded.org>
	 <38ae386328c67ce4e48930950b8131d7fe2e10f4.camel@linuxfoundation.org>
	 <3a4c07ef7cfa4b918680ad8f560d2c29@axis.com>
	 <da6e756775ab97030299f02ee5a9060ee18e8a0e.camel@linuxfoundation.org>
	 <20210920074554.42tmgvqdp2qjlxlc@fedora>
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-09-20 at 09:45 +0200, Quentin Schulz wrote:
> Hi Richard,
> 
> On Sun, Sep 19, 2021 at 07:36:56PM +0100, Richard Purdie wrote:
> > On Sun, 2021-09-19 at 18:06 +0000, Peter Kjellerstedt wrote:
> > > > -----Original Message-----
> > > > From: openembedded-core@lists.openembedded.org <openembedded-
> > > > core@lists.openembedded.org> On Behalf Of Richard Purdie
> > > > Sent: den 19 september 2021 13:03
> > > > To: openembedded-core@lists.openembedded.org
> > > > Subject: Re: [OE-core] [RFC PATCH] package_ipk/deb/rpm: Drop recursive
> > > > do_build task dependencies
> > > > 
> > > > On Sun, 2021-09-19 at 11:57 +0100, Richard Purdie via lists.openembedded.org
> > > > wrote:
> > > > > This is a controversial change which removes the recursive dependencies
> > > > > from the do_build target of packaging tasks of recipes.
> > > > > 
> > > > > Currently this means when you "bitbake <image>" or "bitbake <recipe>",
> > > > > the packaging tasks run for all packaging backends enabled for all recipes
> > > > > in the dependency chain. The same therefore then applies to images.
> > > > > 
> > > > > We don't actually need that, it is a convinience thing. Removing it
> > > > > massively simplifies the task graph and causes much fewer tasks to execute
> > > > > in many common scenarios. It also means less sstate is fetched for
> > > > > example when building an image.
> > > > > 
> > > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > > ---
> > > > >  meta/classes/package_deb.bbclass | 2 --
> > > > >  meta/classes/package_ipk.bbclass | 2 --
> > > > >  meta/classes/package_rpm.bbclass | 2 --
> > > > >  3 files changed, 6 deletions(-)
> > > > > 
> > > > > diff --git a/meta/classes/package_deb.bbclass
> > > > > b/meta/classes/package_deb.bbclass
> > > > > index eca43e17876..8f0eadbcd2e 100644
> > > > > --- a/meta/classes/package_deb.bbclass
> > > > > +++ b/meta/classes/package_deb.bbclass
> > > > > @@ -320,5 +320,3 @@ addtask package_write_deb after do_packagedata
> > > > > do_package
> > > > > 
> > > > >  PACKAGEINDEXDEPS += "dpkg-native:do_populate_sysroot"
> > > > >  PACKAGEINDEXDEPS += "apt-native:do_populate_sysroot"
> > > > > -
> > > > > -do_build[recrdeptask] += "do_package_write_deb"
> > > > > diff --git a/meta/classes/package_ipk.bbclass
> > > > > b/meta/classes/package_ipk.bbclass
> > > > > index c3b53854e8b..756744279e1 100644
> > > > > --- a/meta/classes/package_ipk.bbclass
> > > > > +++ b/meta/classes/package_ipk.bbclass
> > > > > @@ -278,5 +278,3 @@ addtask package_write_ipk after do_packagedata
> > > > > do_package
> > > > > 
> > > > >  PACKAGEINDEXDEPS += "opkg-utils-native:do_populate_sysroot"
> > > > >  PACKAGEINDEXDEPS += "opkg-native:do_populate_sysroot"
> > > > > -
> > > > > -do_build[recrdeptask] += "do_package_write_ipk"
> > > > > diff --git a/meta/classes/package_rpm.bbclass
> > > > > b/meta/classes/package_rpm.bbclass
> > > > > index 88d861c0e75..9f415b234de 100644
> > > > > --- a/meta/classes/package_rpm.bbclass
> > > > > +++ b/meta/classes/package_rpm.bbclass
> > > > > @@ -752,5 +752,3 @@ addtask package_write_rpm after do_packagedata
> > > > > do_package
> > > > > 
> > > > >  PACKAGEINDEXDEPS += "rpm-native:do_populate_sysroot"
> > > > >  PACKAGEINDEXDEPS += "createrepo-c-native:do_populate_sysroot"
> > > > > -
> > > > > -do_build[recrdeptask] += "do_package_write_rpm"
> > > > 
> > > > Just to add a bit more context to this, the bigger impact will be on CI
> > > > setups
> > > > including our autobuilder since "bitbake XXX" will no longer do quite what
> > > > it
> > > > did before. I'm starting to think we should move to the new behaviour and
> > > > apapt
> > > > the CI targets as/where needed.
> > > > 
> > > > I have a build running on the autobuilder to see what impact this has on the
> > > > automated tests. I'd welcome other people's thoughts on this.
> > > > 
> > > > FWIW we have removed a lot of these recursive dependencies, this one is one
> > > > of
> > > > the few left on do_build but it has been left as it has the biggest user
> > > > visible
> > > > impact.
> > > > 
> > > > Cheers,
> > > > 
> > > > Richard
> > > 
> > > You write that this is a controversial change with big user visible impact.
> > > At the same time you write that we do not need the removed dependencies.
> > > What I don't see in your commit message, nor in the follow up mail, is _what_ 
> > > the impact actually is. What will I no longer get when I run `bitbake
> > > <image>`?
> > 
> > For this change, "bitbake <image>" will no longer generate packages you're not
> > using. So for example if ipk is you main format but you've enabled deb and rpm
> > as well, only the ipk will be generated after this whilst before, the others
> > would too. That may be a big deal for some CI systems, hopefully less so in real
> > world use.
> > 
> 
> Does this mean that technically PACKAGE_CLASSES will basically only ever
> make Bitbake use the first one in the list and do nothing with the
> others?

No, "bitbake <recipe>" would build each of the package formats, as would
"bitbake world".

Cheers,

Richard

