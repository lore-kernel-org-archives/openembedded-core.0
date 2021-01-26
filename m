Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.5029.1611619490975233813
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 16:04:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Tzd79RX7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id y187so1143264wmd.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 16:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=B6olUnhoVhMDLaciZ3hnylJFQ0NUDesWG8M2+4mIYsg=;
        b=Tzd79RX7aLj0hmtSlaiePmHSkjBqbg58yGuRlgYgxHYDxRyV6/psjKgaLN/lmq6FC2
         i+gV5g9BpNnKeB1ZUhecsilNL51FoqNV1hsNT5QASCOcT+wY3QkhpAg9thPG89p16QxC
         nw7CxiBcB6jl6+6KhXYHVpROmLuLUS8ZLrge8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=B6olUnhoVhMDLaciZ3hnylJFQ0NUDesWG8M2+4mIYsg=;
        b=JLSUqMHOdEZZWvofGe0+lL+Y6Zb5KHju5HQIPuH94uAhwhYCzA4WhRZxv6sc9CfC7Q
         V39h3+p7CZxNRI6APCc/GzkzGMhPouch1b558MSwKofHPAm1tjHW8OwLjpj+rqnZLyQj
         A+3Zr4UgR81mCHatoqOblHGjHHupr2Oh4At5TTh6LEM7H5h0km+BCQj8k4K7VHGkd42L
         jWUxfDNA+CR9ZK038P4qHx+bs1enB+UJXKu+9IaNzvem2cj2m2aL1fr2Yj6R7ztOyXzV
         vE2YklgF1p0t5RyVw4rN+O2A9h8P+2FEG9484wqoikd9RvWw0Vhhdo+MWR/5xvG+C9Jl
         GgNQ==
X-Gm-Message-State: AOAM5320kMARrQR6B1NQmYNcIwDAfeitQLjbP5ej+fdSLZdWWdAokCMk
	Ta2vkpaAmPqHoUaZzC6c/RlRDA==
X-Google-Smtp-Source: ABdhPJw45cCmmE3QE0EmB4IGeBpROcuBrHl8cnRZnGYFfyjzS6EjwuJ+OCuMcckVuvvnP0dKSKgeJQ==
X-Received: by 2002:a1c:98c6:: with SMTP id a189mr2182035wme.88.1611619489495;
        Mon, 25 Jan 2021 16:04:49 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:b393:1589:56b4:ccf1? ([2001:8b0:aba:5f3c:b393:1589:56b4:ccf1])
        by smtp.gmail.com with ESMTPSA id d199sm920329wmd.1.2021.01.25.16.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 16:04:49 -0800 (PST)
Message-ID: <d49db6f343cc465a25909c516d5618c403b9098d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/4] selftest/reproducible: remove spirv-tools-dev from exclusion list
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Date: Tue, 26 Jan 2021 00:04:48 +0000
In-Reply-To: <CANPvuR=3dY1KvoPcjrpAzdMnr2o5kSfR_M7PcVQEnFmhQn3wTw@mail.gmail.com>
References: <20210124182647.1613511-1-quaresma.jose@gmail.com>
	 <20210124182647.1613511-3-quaresma.jose@gmail.com>
	 <37e34b2d593317b1910784a988fe14de1d32c232.camel@linuxfoundation.org>
	 <CANPvuR=3dY1KvoPcjrpAzdMnr2o5kSfR_M7PcVQEnFmhQn3wTw@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-01-25 at 23:52 +0000, Jose Quaresma wrote:
> Hi Richard,
> 
> librt.so is part of the glibc and are allays present on staging
> sysroot.
> how does the cmake can find the librt.so outside of the sysroot if it
> are present on that.
> 
> The problem is at:
> https://github.com/KhronosGroup/SPIRV-Tools/blob/b27b1afd12d05bf238ac7368bb49de73cd620a8e/source/CMakeLists.txt#L397
> 
> Probably I need to force the find_library to search first on
> STAGING_DIR_HOST

I think somehow we need to replace the full sysroot path with a
variable, or make cmake do that itself if we can. It may be possible to
have cmake evaluate the variable with reference to the sysroot too but
that is likely more complex. I'm afraid cmake isn't one of my strong
areas.

We do have a second issue too the autobuilder has shown up:

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210125-3iawhiyz/packages/diff-html/

Does something in glslang or spriv-tools use precompiled headers? We
had problems with that in the vulkan-samples recipe that looked like
this (a cmake based C++ project where there were changes in the
debug_loc section) so we may need to disable PCH here too...

Cheers,

Richard

