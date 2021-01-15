Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.4811.1610730955044106418
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 09:15:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g0kP3NpG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id d26so10015621wrb.12
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 09:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=o8DKtqbBxphvcVKyqTxtLaJaJHZcloq+dpZDep26JBM=;
        b=g0kP3NpGmIJbycBugxmhl/IDZEqWLbv0Rq/Ovc5Yb2nIUaIb4aIcYxp0VskNGZ4rZu
         jhsSDEAsld/TChHNWyPWKDurKB8oFxtpRmIS22Onku/897OQ1ZURUwgH6M5DGbHnos77
         +hqRvg/QcqZ3zWyQ/wbukn6jTh/Q8maTe/lVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=o8DKtqbBxphvcVKyqTxtLaJaJHZcloq+dpZDep26JBM=;
        b=LfV5RwGGzb8VFXhKlwnSAr7nc/XGf7jvQTF+qcwo8/yeIIMmzUWeeQ7NT+4tbsU1Ib
         vfX6DTiCOY/qpRrY8m2oa9h9Nrf5dCOUmzvjPsKsTFzDzcajhM0hkZl+Vo2x+GgC26sF
         PNSF9DkB8DO2K3oidxdxsg9f4/YqwHxwiZGBqpqZYZeOeM7mWGeua/0xofzpmX/0acNG
         N/z5M/oE9WYvkXbDgHk0O0rbPrOY2L7Je1yfuU2buyGy7QiK+fk3uk183yjV8HKKY/0n
         TH80CcvqytXQvKYfZbtZKg/ncq97TS7ZqOUp0n56WwFVXsQawpzq5cAsKlQXBZ3M2hfu
         o2HA==
X-Gm-Message-State: AOAM530OYzjd5TOl0Xr3UBnqxKGil7+uUWUBw7gSTGlXfvivPw3FHmfY
	C5d/qOKgCGePwbjAu8jWD6n+7w==
X-Google-Smtp-Source: ABdhPJw6pnYQQqs+YYxOq9pXeEiWz9+6Snw35jf45HS2nY9e/qKdNg2iu7ZHXH5zHFAcdJqW9qjbfw==
X-Received: by 2002:a5d:400c:: with SMTP id n12mr14373365wrp.218.1610730953453;
        Fri, 15 Jan 2021 09:15:53 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:974a:2423:c71:b423? ([2001:8b0:aba:5f3c:974a:2423:c71:b423])
        by smtp.gmail.com with ESMTPSA id a62sm12455693wmf.7.2021.01.15.09.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 09:15:52 -0800 (PST)
Message-ID: <dd7b90af3a41bd76856c1610309e7657336db343.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky][PATCH] bitbake: remove /usr from pseudo ignore paths
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Anton Kachalov <rnouse@google.com>, Peter Kjellerstedt
	 <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jan 2021 17:15:52 +0000
In-Reply-To: <05fabb770ffbd897dfb0771efc9ed62c7637fa89.camel@linuxfoundation.org>
References: <20210107215121.3901938-1-gmouse@google.com>
	 <CADVsX8-dMLvuccRjzU73=-reDjEBRq5PZZ+S6ZeugSvTy-iqog@mail.gmail.com>
	 <CADVsX8924shMc+PFUQ6jsmnUqsF+VAeRfn0xM+4G406EgvGFCg@mail.gmail.com>
	 <63d70805b829d08faf3e73865ed7f9c2ad9a1366.camel@linuxfoundation.org>
	 <CADVsX89HCqKYNOyDMK1czkfaOw_TdrwVLK=bi_RanOKgDd=ZuQ@mail.gmail.com>
	 <bfb21f1ec874e5d9638885885eb2530104c28ac5.camel@linuxfoundation.org>
	 <3810611592a344cbaeb1b907e150c2c5@XBOX03.axis.com>
	 <CADVsX8_otuGr+Ct3pAWHmSAPwEGgXMxpA8=qUdQ1N3-Z1S+nsg@mail.gmail.com>
	 <05fabb770ffbd897dfb0771efc9ed62c7637fa89.camel@linuxfoundation.org>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-01-15 at 17:09 +0000, Richard Purdie wrote:
> On Fri, 2021-01-15 at 18:04 +0100, Anton Kachalov wrote:
> > nope, setting the entire PSEUDO_IGNORE_PATHS without "/usr" doesn't
> > work. The do_install task fails with error code 134 without any log
> > file. Neither temp/run.do_install file exists. The pseudo.log doesn't
> > have any errors.
> 
> Right, Peter is correct and _remove is space delimited, the variable is
> comma delimited. Sorry, I'm getting confused.
> 
> There is the rather uglier:
> 
> PSEUDO_IGNORE_PATHS := "${@d.getVar('PSEUDO_IGNORE_PATHS').replace('/usr/,','')}"
> 
> which should work (I did test this time!).

Thinking more, this is safer:

PSEUDO_IGNORE_PATHS := "${@d.getVar('PSEUDO_IGNORE_PATHS', False).replace('/usr/,','')}"

I did test it parses and gave the right value with bitbake -e however I
not expanding it will be much safer as I suspect the first version
won't work in recipe context at build time.

Cheers,

Richard

