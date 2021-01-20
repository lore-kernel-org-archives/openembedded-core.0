Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.26519.1611142561367449445
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jan 2021 03:36:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K3ex+E5J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id m187so2566339wme.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Jan 2021 03:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=xcnhhhx8E0w922dxpVGdIfweBpYoTxmw2MprzupjTBU=;
        b=K3ex+E5Juq6kZ+IyxCs+uiaYc1wYFATeSzlzbo+Y8JFR4f04cGMMrgVW1oqBUwAW32
         Z6vWDMe8p8pJ8PCz3PRtmCFKDBVFLVq6OBsYz4NM1LtculMIGC4IcQiNjLWr9ZCTtvg0
         4KQ8ylu+bvcrCHRgOnMU7GJmwKJWelWUVXWYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xcnhhhx8E0w922dxpVGdIfweBpYoTxmw2MprzupjTBU=;
        b=k2XsmvSELjX7RfiOl2WtPaIs0wtyRqWeTf9vzhtyFel/Wd8irhbdAstA8vCL0EA8qI
         piYo36N8MgFXJG97ymBivuRRtCyiaFe4yHG8dBX1LcG/wt8ZELbRTTN3Vsq6UwnZ4XtJ
         jHCnwXw6oPowseWsNfOmCMQIaMlZ9q4kIVbMzmT73b9wziqfQ5N2esfNgiikyHVT2R2h
         EWhnJzrwWYVid0naStOPMmCdk/Z9Q8tjngN8tjj5FUQuxvr/iBhurygvRIjK9LUikULB
         A5nQqdGXE7Q4Z/m0iNV6qNF2fnWSJfk/4XBVJEl6TQ719vKqYH4ljQpjWQ6KTPH/1RIu
         eznw==
X-Gm-Message-State: AOAM532K1ryaPVRxfWTGZCm6R1BWSxlKNTKpd00OUzWW/nWTHBu18dER
	eN3xfIdOkcBi7pP9oQudnMwNbA==
X-Google-Smtp-Source: ABdhPJygO/5W2LLtLBgUngDw3jTZQQkhmbF8NVXTjqHtcQAvazYxybg71IYo86LSJouJrLLOGNPn2Q==
X-Received: by 2002:a1c:2783:: with SMTP id n125mr3912222wmn.74.1611142559776;
        Wed, 20 Jan 2021 03:35:59 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:be6:bfa3:56e8:18f1? ([2001:8b0:aba:5f3c:be6:bfa3:56e8:18f1])
        by smtp.gmail.com with ESMTPSA id l20sm3800639wrh.82.2021.01.20.03.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 03:35:59 -0800 (PST)
Message-ID: <2b853566d649604651e498ba9f465f265cf36d37.camel@linuxfoundation.org>
Subject: Re: Reformat PSEUDO_IGNORE_PATHS ?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "Yu, Mingli" <mingli.yu@windriver.com>
Date: Wed, 20 Jan 2021 11:35:56 +0000
In-Reply-To: <f76710e0703d4ab287f379ffcfbbf17e@XBOX03.axis.com>
References: <f76710e0703d4ab287f379ffcfbbf17e@XBOX03.axis.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-01-20 at 11:27 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Yu, Mingli
> > Sent: den 20 januari 2021 08:05
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH v2] bitbake.conf: use ${RECIPE_SYSROOT}
> > for PSEUDO_IGNORE_PATHS
> > 
> > From: Mingli Yu <mingli.yu@windriver.com>
> 
> [cut]
> 
> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ---
> >  meta/conf/bitbake.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index af1b3b8c3e..312b544d41 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -686,7 +686,7 @@ SRC_URI = ""
> >  PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
> >  PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
> >  PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
> > -PSEUDO_IGNORE_PATHS =
> > "/usr/,/etc/,/lib,/dev/,/run/,${T},${WORKDIR}/recipe-
> > sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-
> > sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-
> > ,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-
> > package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-
> > build-image_complete,${TMPDIR}/sysroots-
> > components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${
> > COREBASE}/scripts,${CCACHE_DIR}"
> > +PSEUDO_IGNORE_PATHS =
> > "/usr/,/etc/,/lib,/dev/,/run/,${T},${RECIPE_SYSROOT},${RECIPE_SYSRO
> > OT_NATIVE},${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-
> > sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-
> > ,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-
> > package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-
> > build-image_complete,${TMPDIR}/sysroots-
> > components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${
> > COREBASE}/scripts,${CCACHE_DIR}"
> 
> This is not related to the actual change of the above patch, but
> rather 
> triggered by it. Given how long the above lines are, and the fact
> that 
> it is nearly impossible to see what paths actually make them up and 
> what is being changed, would it make sense to reformat the definition
> of PSEUDO_IGNORE_PATHS like this:
> 
> PSEUDO_IGNORE_PATHS  = ""
> PSEUDO_IGNORE_PATHS .= "/usr/,"
> PSEUDO_IGNORE_PATHS .= "/etc/,"
> PSEUDO_IGNORE_PATHS .= "/lib,"
> PSEUDO_IGNORE_PATHS .= "/dev/,"
> PSEUDO_IGNORE_PATHS .= "/run/,"
> PSEUDO_IGNORE_PATHS .= "${T},"
> PSEUDO_IGNORE_PATHS .= "${RECIPE_SYSROOT},"
> PSEUDO_IGNORE_PATHS .= "${RECIPE_SYSROOT_NATIVE},"
> PSEUDO_IGNORE_PATHS .= "${SSTATE_DIR},"
> PSEUDO_IGNORE_PATHS .= "${STAMPS_DIR},"
> PSEUDO_IGNORE_PATHS .= "${WORKDIR}/pkgdata-sysroot,"
> PSEUDO_IGNORE_PATHS .= "${TMPDIR}/sstate-control,"
> PSEUDO_IGNORE_PATHS .= "${DEPLOY_DIR},"
> PSEUDO_IGNORE_PATHS .= "${WORKDIR}/deploy-,"
> PSEUDO_IGNORE_PATHS .= "${TMPDIR}/buildstats,"
> PSEUDO_IGNORE_PATHS .= "${WORKDIR}/sstate-build-package_,"
> PSEUDO_IGNORE_PATHS .= "${WORKDIR}/sstate-install-package_,"
> PSEUDO_IGNORE_PATHS .= "${WORKDIR}/sstate-build-image_complete,"
> PSEUDO_IGNORE_PATHS .= "${TMPDIR}/sysroots-components,"
> PSEUDO_IGNORE_PATHS .= "${BUILDHISTORY_DIR},"
> PSEUDO_IGNORE_PATHS .= "${TMPDIR}/pkgdata,"
> PSEUDO_IGNORE_PATHS .= "${TOPDIR}/cache,"
> PSEUDO_IGNORE_PATHS .= "${COREBASE}/scripts,"
> PSEUDO_IGNORE_PATHS .= "${CCACHE_DIR},"
> 
> If this is acceptable, then I can send a patch to do it.

One reason we've not done that is primarily parse overhead, this adds
both more to parse and makes the variable history a lot more complex. I
do try and keep half an eye on the performance situation as whilst one
change might not make that much of a difference, it does all add up and
we have a nightmare there already.

I do admit the variable is a lot more complex than I'd originally
thought/hoped.

I am also hoping that once we do get this sorted, it becomes something
we don't have to alter often.

> I would prefer to add that comma to the last line so that all 
> lines follow the same format, which avoids having to modify 
> multiple lines when adding/removing entries. I have verified the 
> code in pseudo and it is ok to have a trailing comma (or multiple 
> consecutive commas for that matter). The recently added 
> oe.path.canonicalize() function needs to be modified to skip 
> empty paths as well (no idea why I missed that when I added it).

I'm not sure the trailing comma is a good idea to encourage like this
as it will cause code churn, it also implies CWD may be in the ignore
path due to the behaviour of PATH (although ignore does work
differently for good reason).

> That leaves a question of what to do with other classes that add 
> to the PSEUDO_IGNORE_PATHS variable. They currently typically do
> PSEUDO_IGNORE_PATHS .= ",foo", but if a trailing comma is added 
> above, it would be more appropriate to change them to do 
> PSEUDO_IGNORE_PATHS .= "foo,". They will continue to work as they 
> are, however, there is the risk that someone wanting to add to the 
> PSEUDO_IGNORE_PATHS variable in their own layer looks at the above 
> code and then adds something like PSEUDO_IGNORE_PATHS_append = "foo,"
> without realizing there are other classes adding paths using ",foo". 
> My guess is that there are not many users of PSEUDO_IGNORE_PATHS 
> outside of OE-Core yet that we can still change this without 
> adverse effects.

I think there are deeper issues this patch hints at with the
code/approach itself and I worry this is going to distract from those
issues :(

With the queued patches to add this to dunfell, I'm also concerned in
that direction.

Cheers,

Richard


