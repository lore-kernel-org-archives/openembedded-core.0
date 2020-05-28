Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
 by mx.groups.io with SMTP id smtpd.web11.18837.1590691068314711558
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 11:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C9u9mExS;
 spf=pass (domain: gmail.com, ip: 209.85.210.67, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f67.google.com with SMTP id r24so2499161ota.8
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 11:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xHWJN2SV8d1lt9YcfstAW+Zz+bZ0izXfyMbSHM84bWw=;
        b=C9u9mExSfcYPHDZS/kF9RyoiJyZmwQsCPcgiZLgUbOvm7MxG3n0Xqt8HievOGlVsc3
         7+8PL0lg8oTEcilObkyQsGrM/Wpv/0YhqgxPMNLlcIJKRN++60F7itsdUUvI/fXqOcQJ
         JAxpJJ0Z/67EbiLZK2gZ6pMcV66ETJK6JwsKYyvog6HMZTGIGDAQqEbhk04umYUA1rgu
         q1NvsXpQ9/0q3MRcM8WflakThRHKsCWlpuBtr6v7vdtQCUeJLfKrX0VAbPEMxiNhfbLB
         5Vj0EmQxw2iaVvyHyrmTnBoa1bZE+qsc1YLxyP1zqXoZ8VrelQty0eJFiaz6W6sn1P0H
         ATHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xHWJN2SV8d1lt9YcfstAW+Zz+bZ0izXfyMbSHM84bWw=;
        b=BEZKDsrqC+gt+jj4TEkFCTu4rEIjbKUKdsoN/A61rxs8T1LOd9BfJfDV/tJ+EqrlFr
         y98nKO1ALOK1BzqwAhtXsZyLKmJY3GJIOgxZN8T+PLIuMTsUsRro+BGDSpn69HyclFVd
         4qEFUjV+8pGnFpKQi1I7O6rtsxxcvuq/7T46t6R8OX8z9XZ8mSp+hIDxCiymCznJnzx0
         kqNEoKTNSvcfvhZhx/bKPT1qxIievoZi0oi0S+Tl35rGu6W8KDUJ2D3xwkTF0eYY8Kqd
         e01+rMGx2B13sFqrLhuW8Yrz7lEh+BX6yuDCM3WsBSc66OU0DnR2Lx/E7ZMIUr88fKMs
         BnEw==
X-Gm-Message-State: AOAM530acMhJB+caUYT2keN3PxZaRRRqJuiy/4VslyxDRCAsJ3UDpLZO
	tJ6wLa/yblWhWfjChjYiXyWyv0MdUs4=
X-Google-Smtp-Source: ABdhPJyDnM7h4q/goVySNEaa7jzOkkhbllvO3noSpnIlFcrhNSWQONv7PIzCM/kp16x2gErAbprJKQ==
X-Received: by 2002:a9d:3623:: with SMTP id w32mr3224759otb.91.1590691067160;
        Thu, 28 May 2020 11:37:47 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:5cfb:80e2:2942:9b65? ([2601:646:9200:4e0:5cfb:80e2:2942:9b65])
        by smtp.gmail.com with ESMTPSA id 6sm1833446otg.36.2020.05.28.11.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 11:37:46 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] linux-libc-headers: Check for asm/bpf_perf_event.h before multilibbing
To: Phil Blundell <pb@pbcl.net>
Cc: Andre McCurdy <armccurdy@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Denys Dmytriyenko <denis@denix.org>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20200527155011.3165976-1-raj.khem@gmail.com>
 <20200527155957.GK17660@denix.org>
 <765f3daeb6ce5f28c2d1e258dd303f5707363678.camel@linuxfoundation.org>
 <CAMKF1spMw=6ZfkBWy3=+rSiHknxLvVC6uPH3Q8z_UiGdOECVdw@mail.gmail.com>
 <20200527215251.GA20867@pbcl.net>
 <CAJ86T=X=su_-PaAG_fqs-AjFb_ZFPtvRJTFvP9ZOce1Kv1Z3nQ@mail.gmail.com>
 <CAMKF1spE6tvmsJuoFciA9-MPBZLH0GpOQiDcohL5qtJzF_BzbQ@mail.gmail.com>
 <CAMKF1spUHqFeyhr6R+3rQ8_1foDFZf6HgFNN70OOHgtFijjWaQ@mail.gmail.com>
 <20200528090112.GA1314@pbcl.net>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <74aa424c-8e1c-e6cd-1e31-f71c7506fdae@gmail.com>
Date: Thu, 28 May 2020 11:37:45 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200528090112.GA1314@pbcl.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/28/20 2:01 AM, Phil Blundell wrote:
> On Wed, May 27, 2020 at 05:02:00PM -0700, Khem Raj wrote:
>> https://github.com/torvalds/linux/commit/052876f8e5aec887d22c4d06e54aa5531ffcec75
>>
>> this change e.g. in userspace checks for UINPUT_VERSION and decides to
>> use one method
>> or legacy to setup the device but this is really not gonna work with
>> kernels where these ioctls
>> are not available, it perhaps can be fixed to not check for
>> UINPUT_VERSION but then there
>> could be many such cases, how many can we chase.
> 
> There's nothing inherently incompatible about that kernel change.  The
> compile-time UINPUT_VERSION tells you that things like struct uinput_setup
> have been declared.  If you want to be compatible with both old and new
> kernels at run time, the right way to do it is either to call
> ioctl(UI_GET_VERSION) or just to handle the appropriate error returns
> from the newly introduced ioctls.  It's entirely possible that there
> is userspace code out there that's doing something silly with this,
> but if there is then again I would take the view that it's just a bug
> and ought to be fixed.
> 
> In terms of OE, the theory is that generated binaries ought to work with
> any kernel of ${OLDEST_KERNEL} or newer.  Obviously, individual distros
> are welcome to do whatever is tactically appropriate for them, that's
> always fine.  If they know that they are only shipping a single kernel
> version then it might be reasonable to compile against the matching
> linux-libc-headers and set OLDEST_KERNEL to the same version in order
> to minimise compatibility issues.  Of course, that then means they're
> likely to be building against a different linux-libc-headers to
> everyone else and that might introduce a different set of problems,
> but it's a reasonable tradeoff to consider.

right, this is a quite common case in embedded Linux systems. 
OLDEST_KERNEL is also useful for third party apps ( which are precompiled)
for peices of firmware that are compiled from source, this is less of a 
problem, so using matching kernel headers has been a better approach, 
given the number of such bugs.

> 
> p.
> 
