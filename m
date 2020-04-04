Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.6246.1585995454562497153
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2020 03:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FyZCKI6z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id m17so11451962wrw.11
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2020 03:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=GfDyYSBx3OXqXbpAH2M1xve/9uDbSi+1RwkT2VD5G3Q=;
        b=FyZCKI6zSH4inmw0j7F0CTn+XHKGFyXDbCHvTNC+izS/ViQ3Bb5KP6qx7fqtVPbYHO
         Gwogl703AVnucQ05uzq5Y9/wrpAyyfNPWGx9suyO97fo9WhDaMUFsqWZ3dC8HKvWNnDB
         U45J9kmWq2uLmKfGgNkmytjDxiIGguW+/fPGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=GfDyYSBx3OXqXbpAH2M1xve/9uDbSi+1RwkT2VD5G3Q=;
        b=oOu62F2kpMs0rTXHMPQ9FVsNNDvUWtCSrI9wAnVkkK4nirZoW3Zd5Cg17xZeheyVV1
         g2PJAmSfdl0J+Bax5OlCPiIh/RV1S3a3B92+1TbXkg+ULHu83PGjKT1l41SsxEaC6buE
         9TAo2sXHTyhyommEp5nPGvN3zL3YOlFJtsNaLmQPekMDLtzisvlYs1YuKQYJtqe1YRZb
         Giw/GtEbLW6gXVQul7fVRum53yGUM+myi70Xpc1YQrfh3iE2rtxABloPajAO2VGReo/T
         F1wjVsNBTx2NqYx1NrX7stEC7BJWjszSoX66DdH5k05DIdUuadhj5PUoBKQ5793uFve3
         Sxng==
X-Gm-Message-State: AGi0PubkeZaFBwmpoGc1DWNlVnssYMCgwQd8+kdkBXMK7bO49KoqVTvg
	2x5Cnm9FnAS1EuHc/XiRYZwM7w==
X-Google-Smtp-Source: APiQypIT0vemDhYtG1JAHhkjndglNXPOQWyqBn577Dvfd2HguMQsO6EPv2ORCG4By1VtR1SBT7o28g==
X-Received: by 2002:a5d:63cc:: with SMTP id c12mr12687797wrw.77.1585995452963;
        Sat, 04 Apr 2020 03:17:32 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id t126sm15915056wmb.27.2020.04.04.03.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 03:17:32 -0700 (PDT)
Message-ID: <df6f9b54bb244e0f3e893f0db330649eb6bdfbcb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] pseudo: Force seccomp to return success when in fact doing nothing
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Sat, 04 Apr 2020 11:17:31 +0100
In-Reply-To: <CAJ86T=XabPQEn6xFeCwU9MLTPx50N86o6-HAyAAgu1r6UYWwCQ@mail.gmail.com>
References: <20200403215938.175657-1-richard.purdie@linuxfoundation.org>
	 <CAJ86T=XabPQEn6xFeCwU9MLTPx50N86o6-HAyAAgu1r6UYWwCQ@mail.gmail.com>
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-04-03 at 15:39 -0700, Andre McCurdy wrote:
> On Fri, Apr 3, 2020 at 2:59 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > ++      /* gcc magic to attempt to just pass these args to syscall.
> > we have to
> 
> Comment needs updating - you are calling prctl() here, not syscall().
> 
> > ++       * guess about the number of args; the docs discuss calling
> > conventions
> > ++       * up to 4, so let's try that?
> 
> The args for prctl() are option plus 4 additional arguments, so a
> total of 5, not 4.

Thanks, fixed.

Cheers,

Richard

