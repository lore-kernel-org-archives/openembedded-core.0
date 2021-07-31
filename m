Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.5782.1627751116434963394
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Jul 2021 10:05:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dPiSZEfZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id d131-20020a1c1d890000b02902516717f562so8402423wmd.3
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Jul 2021 10:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=wZ9j5mxLgQ93oFLva7MJbTx03Q8c/iO78RPtMta+QKM=;
        b=dPiSZEfZlBJ0McBW9IJR0jPNpR7Qtnc0mU38CHIwX+MMaZNt7xN8VDwIAnTxZQgUNF
         OeNq/lwH0IjeDyJxInvw6n2Ltg4btpYSs6BLI8w3Pj7QGR85msw8uAfIE5cTOydNf0Jj
         BZoE5eOw3LT8Y2rM0/A1R96e4DeoMRrm8BBgljeh771zUKITO9Y6ry3QmR+NtGS+vdTa
         1bZflwNcPpn9VaEHKdtWqbYbURxHs7Se4ceGJqZGp9KYwqXLgynw0Vu5csnifPshuHon
         X8217VYUGcfpr7SW9dp/rkKk1yakhNeLoRzonBkjrmflye+d9tASItxRPTtOPObOk0Z8
         2z4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wZ9j5mxLgQ93oFLva7MJbTx03Q8c/iO78RPtMta+QKM=;
        b=TO4rpJnYVo1oadBPiWuL7VUX+3g0jv/6p9a0DKTBp7VyHntrZ/38iUk8uBdTbK7OSF
         EhY0slVZT4t58VV8SEjPIqLTrbbwMY/YH9kdbxq1mT3ty0ss4yPDhgVf5TiWHvHzpX/8
         j2SkQL7lWVAXNvIJYcjRYCQaoPx87kDhzkRUOxMfWiwMf+u+baCNUaH6pXJiuiE/R4Cp
         HBL3p194HMomSe42kdxtlfY2MLDxWNtYfxzhsa/Pzo0naeXPKaAMoufmVlKvDuADvzD1
         YnEA5M5ALe960u1x3RFtKDxk4i+Rs71NPrGMRDk4lepXfz+rKvZS7xFfK/X2NCpLBFAg
         Lc7g==
X-Gm-Message-State: AOAM533udg2jEpXi9zcLE1Q1JhkxsdQX7oCY6iovJFYsyzBtEMFm51FW
	d2brMcHXe9/bJvw9swa4FAeWWhe8Za0=
X-Google-Smtp-Source: ABdhPJwdwtqlHx7lzdDgngayXl7SVGNz9oUW8hKa/EZbeHE3gL+aeGUzNjDgL8ArlFXUoE38oH1Nmw==
X-Received: by 2002:a1c:6a0c:: with SMTP id f12mr8783679wmc.82.1627751114891;
        Sat, 31 Jul 2021 10:05:14 -0700 (PDT)
Return-Path: <oecore.mailinglist@gmail.com>
Received: from [192.168.42.52] (ppp-2-86-128-196.home.otenet.gr. [2.86.128.196])
        by smtp.gmail.com with ESMTPSA id c2sm5589844wrs.60.2021.07.31.10.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jul 2021 10:05:14 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 1/3] scripts/contrib: Add override conversion script
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <1695F9FE617EA75A.5172@lists.openembedded.org>
 <f147b797e6dff3358dde45fde9e911c01e420c86.camel@linuxfoundation.org>
 <0d8f3595-8738-4fa6-ac43-4844f06268cc@gmail.com>
 <1b4ebc0e442ccb7be375247300986d826c79279c.camel@linuxfoundation.org>
From: "Robert Berger" <oecore.mailinglist@gmail.com>
Message-ID: <ad36c6a2-dcfc-ccf7-a856-18d577028633@gmail.com>
Date: Sat, 31 Jul 2021 20:05:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1b4ebc0e442ccb7be375247300986d826c79279c.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Richard,

On 31/07/2021 16:14, Richard Purdie wrote:
> 
> That isn't correct. There are patches backported to the bitbake 1.50, 1.48
> and 1.46 branches which mean the older bitbake will accept the new syntax.
> 
> This means that converted layers will work with older releases, as long
> as someone has updated to the new version of bitbake for that stable series
> (and the later worked with that release in the first place!).

Makes sense. Thanks for the clarification.

> 
> Cheers,
> 
> Richard
> 

Regards,

Robert
