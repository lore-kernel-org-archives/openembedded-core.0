Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.4683.1610730545875659444
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 09:09:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EzszY1TE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id s24so1297605wmj.0
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 09:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=DDHyDHvDGh8i6Rd3TZ8mslaTLaJgwGGCbYlGYQAYjvY=;
        b=EzszY1TEABgvLHSJPT/+PvdYjPuQyk8l5DBOurKx/NpCiOZhUaRpCI/m2I7qd8D94U
         td+2nG/HLgazhZgqG/8ok9zffdWyceOUGRtK+Nceew8CcB0cvzfOH5M2ZOxeNBehP05f
         ON7gaQVxHhFEZvYg0uGwyUGarhHtqjxuYN5Dc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=DDHyDHvDGh8i6Rd3TZ8mslaTLaJgwGGCbYlGYQAYjvY=;
        b=BJjqI+Bgk7q3HTFZ5HKYf7Z0TiIpdKLKlgk+P7Avsz6B49lE8UZa5zTk7snQeYAjgF
         8AcioBsETvuWdW7YFk96Dw3/Ivw3o/VjW1LBAvi6HK5QQ8vubRYDo6jkNvTfIcas5LRQ
         QG3wkiU6HMWxvHxWFg3+NOlGU5uWqeJSV0Ri74fJwRDqcH2eXqDEAX2P49yQ1tJc+KNk
         9AtL1ElLZi4WejbIffm3L0f/zEwh8exsObFTiL1Rnqeeoz6fkn1UajJbXJAk1Zp8UTiH
         w+LSHO9yIew425LFDqmDFaz+LIPsfqIBQeAbvjVEAxWSAXG9Sf156+hxzc3vgAbK9tXL
         0dgQ==
X-Gm-Message-State: AOAM531wR5OUL5vdjM94ht0PE6m9ZYgVAwF+FanbryLfIpEoHR6pGE08
	wQF0HoRE0mgy7ZsYnWxOGh5NKw==
X-Google-Smtp-Source: ABdhPJx9J00ZkzBjnSRq2MpO0INAMBGk8QMZG8jI7X8hjjngN9RS8oLRj3vYn3qRixT8dOWGAi4eSg==
X-Received: by 2002:a1c:acc9:: with SMTP id v192mr9401242wme.174.1610730544347;
        Fri, 15 Jan 2021 09:09:04 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:974a:2423:c71:b423? ([2001:8b0:aba:5f3c:974a:2423:c71:b423])
        by smtp.gmail.com with ESMTPSA id m82sm13702434wmf.29.2021.01.15.09.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 09:09:03 -0800 (PST)
Message-ID: <05fabb770ffbd897dfb0771efc9ed62c7637fa89.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky][PATCH] bitbake: remove /usr from pseudo ignore paths
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Anton Kachalov <rnouse@google.com>, Peter Kjellerstedt
	 <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jan 2021 17:09:03 +0000
In-Reply-To: <CADVsX8_otuGr+Ct3pAWHmSAPwEGgXMxpA8=qUdQ1N3-Z1S+nsg@mail.gmail.com>
References: <20210107215121.3901938-1-gmouse@google.com>
	 <CADVsX8-dMLvuccRjzU73=-reDjEBRq5PZZ+S6ZeugSvTy-iqog@mail.gmail.com>
	 <CADVsX8924shMc+PFUQ6jsmnUqsF+VAeRfn0xM+4G406EgvGFCg@mail.gmail.com>
	 <63d70805b829d08faf3e73865ed7f9c2ad9a1366.camel@linuxfoundation.org>
	 <CADVsX89HCqKYNOyDMK1czkfaOw_TdrwVLK=bi_RanOKgDd=ZuQ@mail.gmail.com>
	 <bfb21f1ec874e5d9638885885eb2530104c28ac5.camel@linuxfoundation.org>
	 <3810611592a344cbaeb1b907e150c2c5@XBOX03.axis.com>
	 <CADVsX8_otuGr+Ct3pAWHmSAPwEGgXMxpA8=qUdQ1N3-Z1S+nsg@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-01-15 at 18:04 +0100, Anton Kachalov wrote:
> nope, setting the entire PSEUDO_IGNORE_PATHS without "/usr" doesn't
> work. The do_install task fails with error code 134 without any log
> file. Neither temp/run.do_install file exists. The pseudo.log doesn't
> have any errors.

Right, Peter is correct and _remove is space delimited, the variable is
comma delimited. Sorry, I'm getting confused.

There is the rather uglier:

PSEUDO_IGNORE_PATHS := "${@d.getVar('PSEUDO_IGNORE_PATHS').replace('/usr/,','')}"

which should work (I did test this time!).

Cheers,

Richard



