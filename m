Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.6339.1620286209759152050
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 May 2021 00:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OEbxm8lw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id m9so4468080wrx.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 May 2021 00:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=qNveCQ8OePvIrr0X3S6wo+c5QH6LEtMaD0Ufw6CgvyI=;
        b=OEbxm8lwRLcibsl/enWW8VjKjeMFm5Xhl4LGpywSndLqyX2OB2KUVFRiE/QDbmPbDy
         VXFwl7R+X4y/qhRB/Mb096h9v0Fn1U3shAvHvMhoskrAfs6KQlKUyR6vW5Fl6/5kPb2L
         y0fzzxIyeKhT1tA6yGqyU7hvSWvvRl3zRe09o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qNveCQ8OePvIrr0X3S6wo+c5QH6LEtMaD0Ufw6CgvyI=;
        b=Ppp+dEcwfyIzpy5/8EtIGMLcXJ1PwxkjYO5gkp5U/g7/3gEX+wLo7iimYe/KWCFmW4
         74V/OPnv3e5guLYYwCYVojBhaMIFdnjbky1QeQT59W9irXWbMZX+iMLKS2AyIq3Cc+dM
         cU59qZs/LoqShLzLSVHAgWg0io3OYYkLna6vgYA1+1kooO1mSizUIXNjuPp3p8XGq6s9
         rLWFhuOLF4F4iYtwgas85EtHyZWYVI9kr87cmCs/TlW2w6f8hTQySdnoMcvaZByAkqnL
         R1RGElXi7JTN4dbKc7EfxQ9rVaoRbgUfafo07fjgJ7mpMaH9p57QecSI8vXugI06nXop
         MwpQ==
X-Gm-Message-State: AOAM533eyEgv0r1pI6pwxQJ63vrFKG8AOaUuDsZLE5150mIeZNv6hw0a
	7HCUl28hrraL/l38JtUDMVYb2Q==
X-Google-Smtp-Source: ABdhPJwDhXRNm2i/GXC/hk5b2gLLK+Tmhcc+MndPdyVUiR6T2rxmKpwTcx8I/H542Kq82/3BNcRkdQ==
X-Received: by 2002:adf:fc42:: with SMTP id e2mr3354291wrs.302.1620286207992;
        Thu, 06 May 2021 00:30:07 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d0ab:d9f1:6e0d:9f6e? ([2001:8b0:aba:5f3c:d0ab:d9f1:6e0d:9f6e])
        by smtp.gmail.com with ESMTPSA id c8sm2893871wrx.4.2021.05.06.00.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 00:30:07 -0700 (PDT)
Message-ID: <a86ae7902cb7b63b25b9696d617a1012663f89a0.camel@linuxfoundation.org>
Subject: Re: [PATCH] linux-yocto/5.10: qemuppc32: reduce serial shutdown issues
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 06 May 2021 08:30:04 +0100
In-Reply-To: <20210505175821.39714-1-bruce.ashfield@gmail.com>
References: <20210505175821.39714-1-bruce.ashfield@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-05-05 at 13:58 -0400, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Integrating the following commit(s) to linux-yocto/5.10:
> 
>     qemuppc32: reduce serial issues seen on shutdown
> 

Thanks for this, I appreciate being able to test it quickly. We are seeing
a warning from it:

WARNING: linux-yocto-5.10.34+gitAUTOINC+16df1d13c6_85c17ad073-r0 do_kernel_configcheck: [kernel config]: This
BSP contains fragments with warnings:
[INFO]: Fragments with duplicated configuration options:
    - fragment configs/v5.10/standard/qemuppc/bsp/qemu-ppc32/qemu-ppc32.cfg has a duplicated option: CONFIG_SERIAL_PMACZILOG_CONSOLE


Cheers,

Richard

