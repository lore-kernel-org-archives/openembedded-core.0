Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.67.1616625610259057784
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 15:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WLbKra7e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id k8so393449wrc.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 15:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=gWSh5pEgPjJ1gFQxIfKNOHQh2W/OxwtydpH3NrUKsP4=;
        b=WLbKra7eF5LMqhPZxPSr918ApT2to12C5jdEx/fFksVr0sDxw9ohuzyedEywjWwLff
         bTTIR+tzl8Xn9liop2pVrtO6jwUOrPJ4kxXRUkms29TveeoRGc/n3k0KqlEMnbpeqpKr
         0Afr1LGk64sji0NNnVO3OI6aq+qwoOVnSsohw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gWSh5pEgPjJ1gFQxIfKNOHQh2W/OxwtydpH3NrUKsP4=;
        b=L9I2dkCOcrJ6Pr4pkHVYTt+LETly6wtiZPT3cBc6aBINGSHvxbeQ69uxKuPnkYdyfu
         MxF/5ETSd0Kgd0XHOWXwxBOYrsUWMgFt8e2S1bPMvnttTI1azFYZNDhIE3eav52mlMTW
         zJORSlLFJfnbwY6N2snlVzr4eIxopKq2sBFS57Z3hYoRVL/nFsGTtUz86sVr1HDXg68B
         UTFKfa2nk+t+gby627JufjyIP08ZaqaJzyna2+npN+HnmlZWwSIOif5YLy/RYXF0l/6W
         k674pIfR21Jyt/0j49NOVxb7vOU3XcHFnuozhnv3BUTzgWSGbtI3mmRMxL8ikYwIWv8R
         wz0Q==
X-Gm-Message-State: AOAM533ICj4ImpYxJUJRru4dhmT+bxkBG5mICc3RdOZZUi3zGuEWSQGj
	9mK7BjIV1GK+u4Bvo+aeebVTXw==
X-Google-Smtp-Source: ABdhPJwrNXR2ACX6+o6bvSztjllZdXXcy6/A4YtAk/QudteYPjAcD3QuZTU1z4jIPfVRBPSGW7z7CQ==
X-Received: by 2002:a5d:4b0e:: with SMTP id v14mr5088637wrq.61.1616625608765;
        Wed, 24 Mar 2021 15:40:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6a6e:24cd:b165:9075? ([2001:8b0:aba:5f3c:6a6e:24cd:b165:9075])
        by smtp.gmail.com with ESMTPSA id c131sm4289649wma.37.2021.03.24.15.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 15:40:08 -0700 (PDT)
Message-ID: <421058e01619ff5cf6e22fccc814ed3ff787aaa9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] util-linux.inc: Set the correct license for util-linux-libuuid again
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Mar 2021 22:40:07 +0000
In-Reply-To: <47b4399805074e89a13de8af539c4448@XBOX03.axis.com>
References: <20210324191508.8400-1-pkj@axis.com>
	 <daec4eaf8dce63a70617a4a70b87e33b230f9462.camel@linuxfoundation.org>
	 <47b4399805074e89a13de8af539c4448@XBOX03.axis.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-03-24 at 22:38 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Sent: den 24 mars 2021 22:35
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-
> > core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] util-linux.inc: Set the correct license for
> > util-linux-libuuid again
> > 
> > On Wed, 2021-03-24 at 20:15 +0100, Peter Kjellerstedt wrote:
> > > LICENSE_${PN}-libuuid was not updated when libuuid was moved to the
> > > util-linux-uuid recipe. Use LICENSE_${BPN}-libuuid instead as BPN is
> > > set to "util-linux" for both util-linux and util-linux-uuid.
> > > 
> > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > ---
> > >  meta/recipes-core/util-linux/util-linux.inc | 10 +++++-----
> > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-
> > core/util-linux/util-linux.inc
> > > index 4031c586c9..bb93eb67d6 100644
> > > --- a/meta/recipes-core/util-linux/util-linux.inc
> > > +++ b/meta/recipes-core/util-linux/util-linux.inc
> > > @@ -7,11 +7,11 @@ disk partitioning, kernel message management,
> > filesystem creation, and system lo
> > >  SECTION = "base"
> > >   LICENSE = "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause"
> > > -LICENSE_${PN}-libblkid = "LGPLv2.1+"
> > > -LICENSE_${PN}-libfdisk = "LGPLv2.1+"
> > > -LICENSE_${PN}-libmount = "LGPLv2.1+"
> > > -LICENSE_${PN}-libsmartcols = "LGPLv2.1+"
> > > -LICENSE_${PN}-libuuid = "BSD-3-Clause"
> > > +LICENSE_${BPN}-libblkid = "LGPLv2.1+"
> > > +LICENSE_${BPN}-libfdisk = "LGPLv2.1+"
> > > +LICENSE_${BPN}-libmount = "LGPLv2.1+"
> > > +LICENSE_${BPN}-libsmartcols = "LGPLv2.1+"
> > > +LICENSE_${BPN}-libuuid = "BSD-3-Clause"
> > 
> > How was this tested? This will not work for multilibs or nativesdk.
> 
> Well, we don't use either, so obviously I only tested building for 
> target. However, I believe it should work. At least `bitbake -e 
> nativesdk-util-linux-uuid` shows the expected value for 
> LICENSE_nativesdk-util-linux-libuuid.
> 
> Note that BPN is explicitly set in the util-linux.inc file to 
> "util-linux", so the definitions above should be no different than 
> if I had used LICENSE_util-linux-libuuid = "BSD-3-Clause"
> Or am I missing something?

It may fix libuuid but I think it will break libblkid and the others.

Cheers,

Richard

