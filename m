Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.306.1622673406997282892
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 15:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HO0TTDbC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id n17-20020a7bc5d10000b0290169edfadac9so4696316wmk.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jun 2021 15:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=6lxBh1sQYFHoJgLFSlQCd/ISnJ48p2BffRbUCB0ouCk=;
        b=HO0TTDbC1wIchPD/n0EQR5QPhL6Yi/98wpMuIub78lFJDXnInBGsXYmAzv/p7pw2ew
         c8GLoRdFe7n0AOYR880sQ2qvRJuww0XpMz+nSj/hOHgXegEn1+uSmjfy24mZJkmlai3B
         SDEqe4mNOjVEsl2CHXXYom7HAn81zwFmmLSII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6lxBh1sQYFHoJgLFSlQCd/ISnJ48p2BffRbUCB0ouCk=;
        b=iR13oLl1Dk0VDEfAPeMGO3v39uQ0u1siKIAcV4hgXauXA23OfrYPvGV74wUsOHD/8n
         FnCfgWDEYycxbnqpCQ/bYlYUHoBpvnn0qNLCuVlyNa59UNwVa/xlg5BQ9PC3nj6Ir9OV
         W5Jk3oDBgzmG881D8oCjCRZ/kcWSnHUHxI4I51ACBzNk5OnublcbrGloRZxl02wqw5f0
         CId0c85podKGPwfm+dHGTBZIrNDhTJK4VxluhC1kPXB+izS4wKOWs+iu14jwSdMqKLqU
         a9Ey0QwU7q+ZWOPzJcwFxj2h78t8FkCFJIkDPgIwrU+ABkjyB8L9QVb0y5UfwINDhvw8
         vTxw==
X-Gm-Message-State: AOAM531+kwNoa05sjPAXBCC1DaPg1A9xdSxdQE01wJip+F13VaZmgTh+
	zcBR1RwbbcRZPspIvto7Yr5E6w==
X-Google-Smtp-Source: ABdhPJy1lM8R0e5HSlyg0QWNxnN3eiNyCjBqsenqFA4KrN+pxUeiyLIzhVZDY2/ExFW71VX/q/a7fA==
X-Received: by 2002:a1c:1fd1:: with SMTP id f200mr7015042wmf.113.1622673405423;
        Wed, 02 Jun 2021 15:36:45 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:aa71:4934:cc48:7546? ([2001:8b0:aba:5f3c:aa71:4934:cc48:7546])
        by smtp.gmail.com with ESMTPSA id z12sm1242890wrv.68.2021.06.02.15.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 15:36:45 -0700 (PDT)
Message-ID: <dc93923039b634c48ab47fbd5b09f93ba1fae8cf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [hardknott] [PATCH 1/5] expat: set CVE_PRODUCT
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>, YP docs mailing list
	 <docs@lists.yoctoproject.org>
Date: Wed, 02 Jun 2021 23:36:41 +0100
In-Reply-To: <891d37d1-3f47-af73-86f7-bb07b2eb3371@bootlin.com>
References: <20210602132720.2921099-1-richard.purdie@linuxfoundation.org>
	 <891d37d1-3f47-af73-86f7-bb07b2eb3371@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-06-02 at 16:34 +0200, Michael Opdenacker wrote:
> Hi Richard,
> 
> On 6/2/21 3:27 PM, Richard Purdie wrote:
> > --- a/meta/recipes-core/expat/expat_2.2.10.bb
> > +++ b/meta/recipes-core/expat/expat_2.2.10.bb
> > @@ -25,3 +25,5 @@ do_install_ptest_class-target() {
> >  }
> >  
> > 
> > 
> > 
> >  BBCLASSEXTEND += "native nativesdk"
> > +
> > +CVE_PRODUCT = "expat libexpat"
> 
> 
> Oops, this variable doesn't appear in the documentation and more
> generally CVE management doesn't seem to be documented.
> 
> Your comments and suggestions are welcome. I created a new bug
> (https://bugzilla.yoctoproject.org/show_bug.cgi?id=14419) to track this.

It isn't documented and should be. Having the bug is good and we should 
fix/improve this.

Cheers,

Richard

