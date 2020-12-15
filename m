Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.8379.1608021743935819376
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 00:42:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Wr1t2/cw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id c5so15332268wrp.6
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 00:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=s9/z6pMoSNn6g4kyRMLyigWoFaTTyofdZFe2wybalnk=;
        b=Wr1t2/cwbN976HB2slIBOQA3g2IcE68aPuXy47HOAy+tO+QbGjiapgMnLBmVaNLnMI
         Tc9Ym0aGbM10KRDqztl/etcvyrEFHsswq91V3dVQq7OBndQYQrbbVD35LKFJXhUMDXyR
         DTQ6G3GcD311RRANpPX5AKal093deMnp57jYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=s9/z6pMoSNn6g4kyRMLyigWoFaTTyofdZFe2wybalnk=;
        b=M1wtXIto9wOLUDQSv7dhAIpNUZXBAwJke7Pcxz1maKAkfQ0ZZ2Ppsr6XIZBPmsTH2s
         9+VF3ySA3RP6rhrzD/qKVbrzm6lBgWQClTsT2lRNibwNzELsypoZZs14+lD2n8bvAdHQ
         3VC+qIIl5MZktvcrI+aM9m3jaZLFm8TmosWeXArpMz29susCBGSfmNj6Ku8P+lidlkqT
         IQXGiajmvfeVdZqMTcvAjkc5uxtzNPFhSruQ4ccuFxIzaLl34qDQ1oQqxGImld7ci2h3
         kRg1nJC5LAxJ7Qt0E82l6Apv/bkB5oAH9XgrUWhDiq1zS4iuiLndzxe3eAwreUxU8T7m
         Vl8w==
X-Gm-Message-State: AOAM532aRwYfgjh80/HLN5fBIOANj/KXdAanOU6whyzRWLzhi/2Tecgv
	Qp/PNNAZTa/6ZH1m/Bo6hWXQ/w==
X-Google-Smtp-Source: ABdhPJxBKYHhPJc3HM8+XWLTvcX6RuKt+IIbq4hlS3RvGCfeUJUEg6BQkeeWAoMR+k+YQqR0GJna6A==
X-Received: by 2002:adf:e710:: with SMTP id c16mr33291613wrm.295.1608021742343;
        Tue, 15 Dec 2020 00:42:22 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:15e3:7b39:fc6b:1133])
        by smtp.gmail.com with ESMTPSA id c10sm36777315wrb.92.2020.12.15.00.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 00:42:21 -0800 (PST)
Message-ID: <e764b980aaeff08300ca9b1cf2a7a7d5d817400f.camel@linuxfoundation.org>
Subject: Re: [OE-core] Strange segfault on native Go binaries
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Otavio Salvador
	 <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Dec 2020 08:42:19 +0000
In-Reply-To: <04ea4495-feba-652d-9b15-d09e23c7bc03@gmail.com>
References: 
	<CAP9ODKpXfVcDjtMwUvSRi68+-BHnK9nF6B-5wFX7nzW2wi2adQ@mail.gmail.com>
	 <20201214225851.yqscuyms4pwihtfy@apollo.localdomain>
	 <CAP9ODKqt6mQeckiFPhTrO8b1kZvbPOWE-S27pQp5PNj09EOviQ@mail.gmail.com>
	 <CAMKF1srVeApTW9Ym7-qrmTpSyttY8BG7LofAhMTBX02M4EG_dg@mail.gmail.com>
	 <04ea4495-feba-652d-9b15-d09e23c7bc03@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-12-14 at 21:18 -0800, Khem Raj wrote:
> The problem seems to obscure editing of the glide binary which is 
> resulting in a single byte in ELF header being modified between 
> do_install and do_populate_sysroot
> 
> easy reproducer is
> 
> bitbake -cinstall glide-native
> 
> then make a copy of glide installed in image/ dir ( where do_install 
> puts it ) then run
> 
> bitbake -cpopulate_sysroot glide-native
> 
> % cmp 
> ../../image/mnt/b/yoe/master/build/tmp/work/x86_64-linux/glide-
> native/0.13.3-r0/recipe-sysroot-native/usr/bin/glide 
> glide
> 
> so they are identical.
> 
> and now compare the installed binary and the saved copy.
> 
> % cmp 
> ../../image/mnt/b/yoe/master/build/tmp/work/x86_64-linux/glide-
> native/0.13.3-r0/recipe-sysroot-native/usr/bin/glide 
> glide
> ../../image/mnt/b/yoe/master/build/tmp/work/x86_64-linux/glide-
> native/0.13.3-r0/recipe-sysroot-native/usr/bin/glide 
> glide differ: byte 57, line 1
> 
> it seems installed binary is fine until do_install but then gets
> edited 
> during populate_sysroot
> 
> I have shunted many functions, including patchelf operations and the 
> binary still gets modified in place
> 
> I wonder what other operations could be put under scanner here, Let
> me 
> know if anyone has ideas..

Is it from chrpath.bbclass? or the patchelf call in uninative.bbclass?

Cheers,

Richard

