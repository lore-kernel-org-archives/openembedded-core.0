Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.3925.1631956656426837939
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Sep 2021 02:17:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OvJCYgD9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id w17so10967673wrv.10
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Sep 2021 02:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=+Af5QgVRowW52PEgcE8XpO25GiUQN2l5ph3dw2PoTq0=;
        b=OvJCYgD90nXgUnPhj0ZDRCWa8CPicd3euJr6TQKiYypeR6gI7SljH6Ik7iyyMXv2rl
         4GRopwp7G14EftObh3B7TDLywpT4DKXYZ4zxlI70+V6s0n9/NgM7EIyUzXeTBUaFtOP/
         oHkfLFmTse3CCvZWPr6Y/S2QvONjByPIFPIMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=+Af5QgVRowW52PEgcE8XpO25GiUQN2l5ph3dw2PoTq0=;
        b=L3N4PC1GzApssspkvzzgy5Ml0PkU+zFuOcL8xT3wXBFSCnRPOhVADqp8DlmwJL53uB
         y2kPvY7O+QMPYw1E4urN2lvwhR6za4rtWBQhGlHTgmmYBRfUa1oYDfCU+JGGNplcu3lA
         Ad5+1NZfZPOJbtmJML3ixyKh9XXDxoACXqsuMx4tLEoNAu4NRVpxCVl4Do/35Kb/n3GA
         M5R4602Q4FlFH/7v0b+M8joXWKe7WkzmaojfspOJaJreBqnud3yzG/fRi5oEXEExWNdr
         QKHrh/7RKjaqrSKGfj9dTxu/IPE55+V7WiYWvwWVYhx6yrvzN7E8rVLQXJNJskWR055s
         KY8Q==
X-Gm-Message-State: AOAM530OSaepsEHOcl/Pinjzl1DsCcWkCQq21v3FFswm1BeX7iUDmUb9
	7RS5AUcf8XGom/X36fw52wscGA==
X-Google-Smtp-Source: ABdhPJwI4y+YPj6V5aaocz462WReR6x8qDUX3vaIF6gDrZ3YpktwHmlTE/9qSCQa8br0BS0XWIoZ2A==
X-Received: by 2002:a05:6000:1a52:: with SMTP id t18mr16602475wry.21.1631956654872;
        Sat, 18 Sep 2021 02:17:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:ef6a:1a6d:24b4:3ca? ([2001:8b0:aba:5f3c:ef6a:1a6d:24b4:3ca])
        by smtp.gmail.com with ESMTPSA id h8sm12595374wmb.35.2021.09.18.02.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 02:17:34 -0700 (PDT)
Message-ID: <042c07228f93912207b7d0616d99dbe0a1e6bfb6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] systemd: Add tpm2 PACKAGECONFIG
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, kristian@klausen.dk
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 18 Sep 2021 10:17:31 +0100
In-Reply-To: <YUS4fOY2J2hoAsxx@piout.net>
References: <20210915102308.1892-1-kristian@klausen.dk>
	 <20210915104818.43wown7ss2pcfnky@fedora> <YUHZe8zK2lV0lWPy@bob>
	 <YUS4fOY2J2hoAsxx@piout.net>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-09-17 at 17:47 +0200, Alexandre Belloni wrote:
> On 15/09/2021 13:31:07+0200, Kristian Klausen via lists.openembedded.org wrote:
> > Den Wed, Sep 15, 2021 at 12:48:18 +0200 skrev Quentin Schulz:
> > > Hi Kristian,
> > > 
> > > On Wed, Sep 15, 2021 at 12:23:08PM +0200, Kristian Klausen via lists.openembedded.org wrote:
> > > > The TPM2 support is used, among other things, for unlocking encrypted
> > > > volumes.
> > > > 
> > > > Signed-off-by: Kristian Klausen <kristian@klausen.dk>
> > > > ---
> > > >  meta/recipes-core/systemd/systemd_249.3.bb | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/meta/recipes-core/systemd/systemd_249.3.bb b/meta/recipes-core/systemd/systemd_249.3.bb
> > > > index c027b88fd6..f8c85dabf0 100644
> > > > --- a/meta/recipes-core/systemd/systemd_249.3.bb
> > > > +++ b/meta/recipes-core/systemd/systemd_249.3.bb
> > > > @@ -128,6 +128,7 @@ PACKAGECONFIG[bzip2] = "-Dbzip2=true,-Dbzip2=false,bzip2"
> > > >  PACKAGECONFIG[cgroupv2] = "-Ddefault-hierarchy=unified,-Ddefault-hierarchy=hybrid"
> > > >  PACKAGECONFIG[coredump] = "-Dcoredump=true,-Dcoredump=false"
> > > >  PACKAGECONFIG[cryptsetup] = "-Dlibcryptsetup=true,-Dlibcryptsetup=false,cryptsetup,,cryptsetup"
> > > > +PACKAGECONFIG[tpm2] = "-Dtpm2=true,-Dtpm2=false,tpm2-tss,tpm2-tss libtss2 libtss2-tcti-device"
> > > 
> > > Shouldn't the RDEPENDS part of the PACKAGECONFIG be pulled in
> > > automatically by Bitbake since I assume the libs they contained are used
> > > by the linker for systemd?
> > > 
> > > Also looking at the tpm2-tss recipe, I'm not sure there's a package
> > > named libtss2-tcti-device?
> > 
> > Are we looking at the same recipe? It is defined in 
> > tpm2-tss_3.0.3.bb[1].
> > 
> > [1] https://git.yoctoproject.org/cgit/cgit.cgi/meta-security/tree/meta-tpm/recipes-tpm2/tpm2-tss/tpm2-tss_3.0.3.bb?id=e0fca90835169e21ffabe6f2e4b901678236d36e#n37
> > 
> 
> Then, shouldn't that be a bbappend in meta-security? Else, you run the
> risk of pulling a dependency for a recipe in a layer you don't have.

Even if the dependency is in another layer, we've been moving towards having the
PACKAGECONFIG in the main recipe with the default as not enabled. This means the
correct "disable" configure options are added explicitly.

Cheers,

Richard

