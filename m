Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.4509.1614211051162974390
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 15:57:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A5j3DQR3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id i9so2902391wml.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 15:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=80c2UFbLyEshstj7GH1S/20EsVpcnmIyrBaJCU9VNOo=;
        b=A5j3DQR323rKGVR8dM+BpZxSn2QhqFsLleHJEefR5ysHgFOp9aW9uKu3Ntv3L9j52F
         eycGIdFInHuGg3OEanwpkSO/RBB4OGGUTyCDxSIA4y/J3Ko1siwArzdBNaOyi4emcU9g
         Xc8ni9HAxc9CmzLWgfrCmO+bYjcG3nAP+HfCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=80c2UFbLyEshstj7GH1S/20EsVpcnmIyrBaJCU9VNOo=;
        b=g9kd4GZS7WxeNA9KwWAr0USS3cr+0xB0N4GSJ3W/ymCFinWLrgncZLUqRLplPkagEb
         SbWLB51arY+l1bPhQ5poJe4UpSGoInJbCy92/koDLoBKA3sRefl/2LznXz5C/6B6BpAF
         MuL1/H4BWReOBGaoCgw8oqmIw6Q6kWRiX3icjxXeKM/QpyOY1/cWDVL/ZW/MwZpF+Qdt
         Jk5wPHmaSjXUcogY8mLNLSG7kuU8eXZv0CZwyEq1sCSIoeHLQ3KWaJVknRkTIKtWF4Qy
         raL2IMVWhdOmqQ9gWCONmPG5z8CpSR7OuSlmLdKW9pRRyM/1pAbw2BE4eEeE0rzSLCtS
         zSng==
X-Gm-Message-State: AOAM531b1RqmIZkwSFEPwdV0U/Gsz8qYwTyH63OKR+dXgL3maQ4i4NOO
	jlhjFH8gFE9CV1ugp5DUdrusiA==
X-Google-Smtp-Source: ABdhPJzD3fHLnNhmwk1k2tpFqimHlkRT2xpIY/AwjTaCe9uO8wQVlSkbkb4m92/0U+I211cVf5mZSg==
X-Received: by 2002:a05:600c:2314:: with SMTP id 20mr439352wmo.97.1614211039881;
        Wed, 24 Feb 2021 15:57:19 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4258:f6b6:9d0d:f472? ([2001:8b0:aba:5f3c:4258:f6b6:9d0d:f472])
        by smtp.gmail.com with ESMTPSA id t14sm6197158wru.64.2021.02.24.15.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 15:57:19 -0800 (PST)
Message-ID: <2961052af2e2429d0a8e2a5a26f8a0c929033794.camel@linuxfoundation.org>
Subject: Re: [OE-core] Current native SDK glibc compat
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Anatol Belski <anbelski@linux.microsoft.com>, openembedded-core
	 <openembedded-core@lists.openembedded.org>
Cc: randy.macleod@windriver.com
Date: Wed, 24 Feb 2021 23:57:16 +0000
In-Reply-To: <ce2c3ea0-891b-8c7d-e89a-590fcd7ab12c@linux.microsoft.com>
References: <4ec292a9-3723-34f2-51a5-01dd6652f651@linux.microsoft.com>
	 <1a309c4181d7de1b38497b4db6f4e1d664f18398.camel@linuxfoundation.org>
	 <9a8cb006-e161-b402-d496-72a1c983e90a@linux.microsoft.com>
	 <e4561a7e8c89fe26dd593b0412e16be67665baff.camel@linuxfoundation.org>
	 <ce2c3ea0-891b-8c7d-e89a-590fcd7ab12c@linux.microsoft.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-02-24 at 21:16 +0100, Anatol Belski wrote:
> On 2/24/2021 5:49 PM, Richard Purdie wrote:
> > No, I mean the dynamic loader pointer.
> > 
> > $ tmp/sysroots-uninative/x86_64-linux/usr/bin/patchelf-uninative python3-native/python3.9 --print-interpreter
> > [...]tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
> > 
> > Above I'm showing that a native binary in the build (python3-native)
> > has the interpreter (dynamic loader) set to our uninative ld.so.
> > The SDK is similar.
> > 
> > > As the binary where the issue was sighted has this
> > > 
> > > $ chrpath $(which cargo)
> > > /tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/usr/bin/cargo:
> > > RUNPATH=$ORIGIN/../lib
> > > 
> > > 
> > > but then, the DSOs have no rpath set, eg.
> > > 
> > > $ chrpath
> > > /tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/usr/bin/../lib/libcrypto.so.1.1
> > > /tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/usr/bin/../lib/libcrypto.so.1.1:
> > > no rpath or runpath tag found.
> > > 
> > > 
> > > so it might lead to the interferrence with the host. Does it perhaps
> > > need both $ORIGIN/../../lib and $ORIGIN/../lib if binaries are in /usr ?
> > Our dynamic loader knows how to use the specific sysroot and then
> > fall back to /usr and /lib.
> 
> Thanks a lot for explaining this.
> 
> Getting back to the initial case led to the question, i'm now able to 
> check what is the correct dynamic loader:
> 
> $ tmp/sysroots-uninative/x86_64-linux/usr/bin/patchelf-uninative 
> /tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/usr/bin/cargo 
> --print-interpreter
> /tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2
> 
> and also could use --print-needed which would be similar to "readelf -d 
> ", but it'd be still not possible to check things at the runtime? OFC 
> knowing what i know now, it's possible to locate the DSO and check 
> symbols like this:
> 
> $ x86_64-poky-linux-objdump -T 
> ./sysroots/x86_64-pokysdk-linux/lib/libc.so.6 | grep GLIBC_2.33
> 
> just seems the catch points are quite subtle :) Perhaps there could be a 
> recommendation on a good way validating the binaries in the SDK HOST part?

If you what to know what a partiular command is doing for symbols at runtime,
you can run it as:

LD_DEBUG=all <command>

which will have the loader spew out a lot of information about how it is
resolving the symbols.

Cheers,

Richard

