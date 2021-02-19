Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.12179.1613756321810290177
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 09:38:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N4hWeAaS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id f7so8468465wrt.12
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Feb 2021 09:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=oC65MxRIMmpQygXxA5TpXKxwKSV1R5Ipzm3SwMSFzd4=;
        b=N4hWeAaSO4Wok4H/DFn+hI6vHUcHPjMf98Y2pD3R5JQGmHnekFprv9C1ndtQ49b/XG
         /6nsMgW8bdKF0gmxYJb1t3jIqK/grIJcytJ7M8Rkgvg/DJUwSe2P0W/f7F7+aQLlbjKu
         ekGyU2+lqGSHN3oRh2+/cDErV9OpUqkIRXroM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=oC65MxRIMmpQygXxA5TpXKxwKSV1R5Ipzm3SwMSFzd4=;
        b=Vmb9bjRIKo22Q89PH+AiVmfLaHUkQe8/mmpSCP/nAVyUDQXKkUkDMr5XeXOF8/dsh6
         hewuCoqCX3RV37uE/llVPwpIx+ubAYYfqtYfSCyNTPBWAZ82NTKN0Eyt1/nSgaJpxa6v
         rR//GgHeWPaCf/lKWKgG8ISJTAdBma0A83uc0bQIOazc76/VHwYv5F1ClaaNpiTqztOL
         sOp1kjQxuGfYOt7AhQSV6fZS15H0U05mx2XFFylQrPXz2DezMjpm+AT6e9VSTjPM8a0j
         1WmoYYPb8A7T3qM5dJmcvdSsXReRQ6QVuW+VRbqoJ/VU8kCpyDHtiQokLZqRwZkMaVg8
         R2Pg==
X-Gm-Message-State: AOAM531nMta+p0jHdZ/drcTlcYB9O/KyTFEOC8FGKXolUIxlE6YF4oFx
	g9RqhBRkqsb+Rj43vrKGRYChJQ==
X-Google-Smtp-Source: ABdhPJyUNlmCsMG2HoCismAFtjhwyYyaNzQsQYlNyBLyIpK5IHAHzcQ6xs2MXdG1Jl/pLK4gcTBL0w==
X-Received: by 2002:adf:b641:: with SMTP id i1mr10214177wre.295.1613756320493;
        Fri, 19 Feb 2021 09:38:40 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:569e:86b4:55e2:a2e9? ([2001:8b0:aba:5f3c:569e:86b4:55e2:a2e9])
        by smtp.gmail.com with ESMTPSA id o13sm17444445wrs.45.2021.02.19.09.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 09:38:40 -0800 (PST)
Message-ID: <9802d27eadcf72dd628a236fb42b06834d1158e1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [Question] "global" package list used to bump up customer packages
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mans Zigher <mans.zigher@gmail.com>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Feb 2021 17:38:36 +0000
In-Reply-To: <CAEhQi8=E4K3h5Y8ui3PRXYx68Jgk=RzShj0UwQEcGupd_YMYWQ@mail.gmail.com>
References: 
	<CAEhQi8=E4K3h5Y8ui3PRXYx68Jgk=RzShj0UwQEcGupd_YMYWQ@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-02-19 at 09:53 +0100, Mans Zigher wrote:
> Hi,
> 
> I have a problem getting my customer to understand how to work with
> OE. They have a set of private packages that they continuously need to
> bump up to use the latest version. The packages are stored up in an
> artifactory server. I have an idea of maybe helping them out by adding
> a manifest file containing a couple of entries for each package
> 
> VERSION = "0.25.6"
> SRC_URI[md5sum] = "0d6bc46bb69b2a0dce0c042d27b4f25c"
> SRC_URI[sha256sum] =
> "c20ea63a5e2f24e25d91e5cdfaa6b4b3735739d6170bea7b2b7d429fc397b718"
> 
> This manifest should then be pulled into the bitbake environment so
> that the packages can read these entries and download what is needed.
> Any comments regarding this potential solution would be greatly
> appreciated.
> 
> Also I have a faint memory of seeing something similar solution so if
> you know if something already exists then I would appreciate if you
> could let me know.

Are you thinking of AUTOREV? That works if the fetcher has support
for the source control system being used, e.g. git or subversion but
I'm not sure it would work for artifactory without a dedicated fetcher
module.

Certainly generating an include file like this is one way to handle
this. You can use package-name overrides, e.g.:

VERSION_pn-somepackagename = "0.1.2"

although its harder to do with flags, you might have to put those via
an intermediate variable:

SRCURISHA256_pn-somepackagename = "XXX"

then in the recipe:

SRC_URI[sha256sum] = "${SRCURISHA256}"

Cheers,

Richard



