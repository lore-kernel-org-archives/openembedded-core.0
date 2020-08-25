Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.320.1598375050653622681
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2020 10:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=diyItaHo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id p17so7825235wrj.8
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2020 10:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=EiTzCoEWHVTKE4p9xx6Oou28Hl0gFD1BNmXKL/ywtoU=;
        b=diyItaHoK0OiIRp0nwSIa+bctdFrnEisqW5dNj75xSC9ukhNvYMJmdCx9P0TyRC6qA
         l87CIJV1nQJ7GZjGWgBeWjvAcblqNxL5u6cl08glQ5To+swkh36j6qTk0UU8s//5T/dR
         eYOj6Y+BIGN6GgQy3MvGWzdiOCOCXnUt9HbIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=EiTzCoEWHVTKE4p9xx6Oou28Hl0gFD1BNmXKL/ywtoU=;
        b=d3U4+utHZBpbPEWxQC2mzNCNVu5vvcIPqJugXPtiYxdK8qZkIwIP2FOoxpJ2z3+bai
         qfrPsMiV4paWgfQdsvhgfjY5vsMpMAC5Yeh2UAGR2zpVzka7Mi4NNPIEA2KULmwH2kzF
         qaUBxT0BYpKQZJNs9CqlMIZQMkUemq2vSOxaJJAqGdDBaLl93SouOyW2pERDg3oroohc
         8KL0bvtTj2q8hzxNMHW35M/MH2pS8JBP6/Zj7pqB59/sGu3hY8/4SEMQ5a/0QUsvKYAx
         UVOwNNJG5TXfwdd0eSHJYfL/sIFA/VKvxZ5vD7y+BvwZUKI/scW+eUB+vXvwxeZyO7Uz
         6RRw==
X-Gm-Message-State: AOAM531HiImgqYTTYgDBlX5bRxd9+sfn8B5Huyz1Z2WV6xIBzt+I3PLZ
	oES/QZMBD5iqf0VToVsWJBZt1w==
X-Google-Smtp-Source: ABdhPJy22uiasvi7ciFNKw2c/gRbcTNc5BJ8Bx3+OHJvmiV9z5WLuXKrFnxVQQmFU1YBPmM+Mh7mNg==
X-Received: by 2002:adf:c983:: with SMTP id f3mr11449409wrh.348.1598375048950;
        Tue, 25 Aug 2020 10:04:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c407:538:d07:8b9d])
        by smtp.gmail.com with ESMTPSA id q3sm6442041wmq.12.2020.08.25.10.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 10:04:08 -0700 (PDT)
Message-ID: <258d47f12d2f3d66cb0a0558a9e3bb19ed46ac19.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master][PATCH 4/5] package / packagedata bbclass: Change the way PRAUTO and AUTOINC are handled
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@kernel.crashing.org>, 
	openembedded-core@lists.openembedded.org, Bruce Ashfield
	 <bruce.ashfield@windriver.com>
Date: Tue, 25 Aug 2020 18:04:06 +0100
In-Reply-To: <fbfa1c68-27b0-c734-868f-615a62f47ee3@kernel.crashing.org>
References: <20200824232930.150388-1-mark.hatle@kernel.crashing.org>
	 <20200824232930.150388-5-mark.hatle@kernel.crashing.org>
	 <f80beeb723c0f891dd5727ba09ab28de79836ed5.camel@linuxfoundation.org>
	 <162E885FFA00831B.12036@lists.openembedded.org>
	 <fbfa1c68-27b0-c734-868f-615a62f47ee3@kernel.crashing.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-08-25 at 11:52 -0500, Mark Hatle wrote:
> 
> On 8/25/20 9:14 AM, Mark Hatle wrote:
> > 
> > On 8/25/20 5:56 AM, Richard Purdie wrote:
> > > On Mon, 2020-08-24 at 18:29 -0500, Mark Hatle wrote:
> > > > A related change was also needed for the kernel.bbclass.  The
> > > > kernel
> > > > 
> > > > needs to get the AUTOINC values used by the various PV/PKGV,
> > > > but with
> > > > this new system we don't want to call auto_pr each time --
> > > > instead
> > > > call the read_subpackage_metadata to ensure a consistent
> > > > result.
> > > > 
> > > > This also fixes an issue in the old version where the kernel
> > > > sometimes
> > > > caused the PR to be incremented twice, as the auto_pr was
> > > > called
> > > > multiple times from different tasks.
> > > 
> > > [...]
> > > 
> > > > diff --git a/meta/classes/kernel.bbclass
> > > > b/meta/classes/kernel.bbclass
> > > > index e2ceb6a333..4449452065 100644
> > > > --- a/meta/classes/kernel.bbclass
> > > > +++ b/meta/classes/kernel.bbclass
> > > > @@ -416,7 +416,7 @@ kernel_do_install() {
> > > >  	install -d ${D}${sysconfdir}/modules-load.d
> > > >  	install -d ${D}${sysconfdir}/modprobe.d
> > > >  }
> > > > -do_install[prefuncs] += "package_get_auto_pr"
> > > > +do_install[prefuncs] += "read_subpackage_metadata"
> 
> I talked with Bruce on this.  We see no reason do_install[prefuncs]
> is required
> any longer.
> 
> It was when that line was written, but when the kernel was refactored
> to permit multiple kernel builds and such the need for this went
> away.

Ok, lets start with a patch to remove that call.

> > > >  # Must be ran no earlier than after do_kernel_checkout or else
> > > > Makefile won't be in ${S}/Makefile
> > > >  do_kernel_version_sanity_check() {
> > > > @@ -749,7 +749,7 @@ kernel_do_deploy() {
> > > >  		done
> > > >  	fi
> > > >  }
> > > > -do_deploy[prefuncs] += "package_get_auto_pr"
> > > > +do_deploy[prefuncs] += "read_subpackage_metadata"
> > > >  
> > > >  addtask deploy after do_populate_sysroot do_packagedata
> > > 
> > > I don't think this can be right. I understand why the kernel was
> > > expanding these early but at this point do_package hasn't
> > > happened so
> > > reading the subpackage metadata is a null op at best and
> > > potentially
> > > changes a lot more in the data store.
> > > 
> > > I suspect this is not doing the right thing and will be something
> > > that
> > > comes back to bite us so we need something more careful here and
> > > I'd
> > > like to better understand exactly what change to the variables
> > > do_install and do_deploy need.
> > 
> > I don't know exactly why it's doing this.  But I believe it is so
> > that the
> > PV/PKGV is expanded (AUTOINC translated).  I don't see any other
> > reason for it
> > to be expanded in either do_install or do_deploy.
> > 
> > Best I can find is:
> > 
> > kernel-artifact-names.bbclass:KERNEL_ARTIFACT_NAME ?=
> > "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
> > 
> > (That is then used in other places.)
> > 
> > So the PKGV replacement is desired to be that early.
> > 
> > I'll look into it further.
> 
> In do_deploy, I see multiple usages of the KERNEL_ARTIFACT_NAME
> (sometimes with
> alternative variables.. but in the end both PKGV and PKGR are used
> here.)
> 
> do_deploy is after do_package/do_packagedata (where the values are
> assigned and
> stored).  So it should be safe for us to use the
> read_subpackage_metadata (or
> something new if desired) to read back in the stored PKGV (AUTOINC)
> and PKGR
> (PRAUTO) values.

That sounds reasonable. FWIW do_deploy doesn't have to be after
do_package but we can arrange that in the kernel case.

I'd prefer to have a more granular function to call here than
read_subpackage_metadata, just to make it clear what is happening and
why.

Cheers,

Richard

