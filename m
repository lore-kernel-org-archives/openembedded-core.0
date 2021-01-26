Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web08.15148.1611680110521367688
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 08:55:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CuYeOYg7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f48.google.com with SMTP id g1so20618654edu.4
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 08:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=sP2m7E1Nsg/7KCgIWuOGar/AsJnU4daBhEMnMW83iV4=;
        b=CuYeOYg7hFBE4g8hf5exAyxv8R7LO1mexRbmd4LakOa6FR5b4Y/KIB1FNLxsnASLxO
         oKdWB6/s8gkM6IUEHZy6PsPznewZ3mR0PFMhkAZwLzbPIHsyBYZhVbslX/S3PKpwlYj3
         jO5AAzJsOMEzvX+fPG/D7dVD9xhgtq3wuZMOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=sP2m7E1Nsg/7KCgIWuOGar/AsJnU4daBhEMnMW83iV4=;
        b=t0eNEq1DLC90iBjZxY6DP2egmwhmHg/2JEIpCB7VrHz30OJRZtRO40S0KgPFppBq9I
         ZCQdraHOVU0CmCuKkSYSSI8SYHRAs8/na0dLtto65k/ktjAqyqtwDMsMas64+2VtDBGQ
         Mbk+avl6IG0dmZIdVjwkZkzcaXQcyy/bWzJdN/7Gd/rBi8cBbyYShJX28ZRoWnmT7ym4
         I/lKGRd7V6axSykQM1xALkRfp9qvQCS4aZhOrT8tN/gCTUF7hX/61LfVkEylgSSQiaSz
         EPq5QlHzDxPjp8MOiXTYHZQv7UewYkCrcARCfrRgHDf3N+HECcKZnOdNFkoRUw5A51Eg
         Z8mg==
X-Gm-Message-State: AOAM531dohAwywn42UEimQ/1LoEllIVHDP+k5aodya2fSpl2+Xyo0muz
	1Fz5mhyG7vjKoj8h9TowjqusTw==
X-Google-Smtp-Source: ABdhPJwbZ2XhaPzW6ZHWeRQw25yUgVR+1vUx6IT6WC0kf65aHoKTdakhNfq9+TORLwZyp7g/7YLGSQ==
X-Received: by 2002:a05:6402:20e:: with SMTP id t14mr5372568edv.178.1611680108984;
        Tue, 26 Jan 2021 08:55:08 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:740b:f7b2:9a90:fbc0? ([2001:8b0:aba:5f3c:740b:f7b2:9a90:fbc0])
        by smtp.gmail.com with ESMTPSA id dm1sm12469899edb.72.2021.01.26.08.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 08:55:08 -0800 (PST)
Message-ID: <332c0f30e9d8ff14bda4bbb0aadbbda7ecdcc606.camel@linuxfoundation.org>
Subject: Re: [OE-core] [yocto-security] OE-core CVE metrics for master on Sun 24 Jan 2021 07:15:01 AM HST
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Lee, Chee Yang" <chee.yang.lee@intel.com>, Ross Burton
 <ross@burtonini.com>
Cc: Steve Sakoman <steve@sakoman.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, 
	"yocto-security@lists.yoctoproject.org"
	 <yocto-security@lists.yoctoproject.org>
Date: Tue, 26 Jan 2021 16:55:06 +0000
In-Reply-To: <MWHPR11MB200003E4ED93C922C896F758B9BC9@MWHPR11MB2000.namprd11.prod.outlook.com>
References: <20210124171809.D838F960256@nuc.router0800d9.com>
	 <cc80f8541aeef99a4625420fbf7d27dcc6abf341.camel@linuxfoundation.org>
	 <MWHPR11MB20005F089BE21737CFA246E7B9BD9@MWHPR11MB2000.namprd11.prod.outlook.com>
	 <0d314728a5aceabe78e9d61bfe257d69396b23e3.camel@linuxfoundation.org>
	 <MWHPR11MB2000D61465E2D74D9209E7DDB9BC9@MWHPR11MB2000.namprd11.prod.outlook.com>
	 <CAAnfSTuE45wUNr2BSDa3GfL2etkEvh9GDpEThCju5B-wFYD6Ew@mail.gmail.com>
	 <MWHPR11MB200003E4ED93C922C896F758B9BC9@MWHPR11MB2000.namprd11.prod.outlook.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-01-26 at 16:19 +0000, Lee, Chee Yang wrote:
> A variable in recipe to indicate the character as patch level?
> like CVE_VERSION_SUFFIX  in  “alphabetical”  so the parser understand
> the last alphabetical character as patched release

Something like that could work. We really need to handle openssl
versioning in particular so we need to do something (or revert the
change if we can't fix it).

Cheers,

Richard

