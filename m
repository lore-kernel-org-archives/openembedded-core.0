Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.362.1620940285751863219
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 14:11:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EwYyKKiN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id u133so3799212wmg.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 14:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=TxGa5to31jOzYNRumdHFYSfezYVVgKJlRw6UjMEK4iA=;
        b=EwYyKKiNLqVsZ3LLc4CYcegOg6ZOr8sMXkN+8bqGwhvMAKR4w57OAUt7DdtwyIHkeA
         RfMzBwu8BFJTq2544wiZJk1SjtNjE5v6YG88MvcdPDTqsW/TOgdjVBI7OuumtJmd0/+F
         vL4x/AUYiVT9728Vc0U9CuRSl28ApkY9Ws8bI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=TxGa5to31jOzYNRumdHFYSfezYVVgKJlRw6UjMEK4iA=;
        b=jkas+r/fn6izSHiv879YvqANYlLU3aQK/fnLKGkPf3llKwVXObWw73m/qw+LeumeEi
         SXTmVDFXUyH4QUDjpAkKujuSn99/RArRWNYnsdLbYZOhs6aC1ndvL2mKq3WHzofwuD85
         Ih0wKQ6sbzWzuHYdYPBnvKUHmTlxIyj1LDj6JAkk02P/wGzTX3J1epyqzRAbSVMNEsXy
         iXHGMeR1W3WC94ZzEzwhNAfv49rGaYAzN+cK5ljw43j6yxzYO78ZNN49ViD5wV1ls6rs
         runYrfUro6eDjs9dxxfnc/GC/MThNDeoQh/nm4FvuvhoWb7TOuSJAAFZCv6HPwzO0dP5
         9N3Q==
X-Gm-Message-State: AOAM530FxoA8O3PMLnE6gJRVN4m7tDh/9mH/OLfnR/V/WPge47M8T8RW
	tyNKc8KT0tHoGehtCZn8ixR0Bw==
X-Google-Smtp-Source: ABdhPJywOvzN360TpYop+PQa48AjuXB1hsJ4nVsHdIG+tzaYTxi6nfN3ENFij963JMNZHWhH7qmZvw==
X-Received: by 2002:a1c:35c6:: with SMTP id c189mr5635575wma.127.1620940284136;
        Thu, 13 May 2021 14:11:24 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:87b3:98a4:71f:63a5? ([2001:8b0:aba:5f3c:87b3:98a4:71f:63a5])
        by smtp.gmail.com with ESMTPSA id h8sm4158169wrw.85.2021.05.13.14.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 14:11:23 -0700 (PDT)
Message-ID: <9fd94de1240096c57c37ee3a02742167b1319ecc.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 00/25] Pull request (cover letter only)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 13 May 2021 22:11:20 +0100
In-Reply-To: <cover.1620830796.git.steve@sakoman.com>
References: <cover.1620830796.git.steve@sakoman.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-05-12 at 04:47 -1000, Steve Sakoman wrote:
> The following changes since commit 834a8e357bc999a0163e7c5bafbcc1a8816448d4:
> 
>   license_image.bbclass: Fix symlink to generic license files (2021-05-03 04:56:23 -1000)
> 
> are available in the Git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next
> 
> Alexander Kanavin (5):
>   diffoscope: add native libraries to LD_LIBRARY_PATH
>   Revert "oeqa: Set LD_LIBRARY_PATH when executing native commands"
>   ovmf: update to 202002
>   ovmf: update to 202005
>   ovmf: update edk2-stable202005 -> edk2-stable202008
> 
> Anatol Belski (1):
>   tar: Fix CVE-2021-20193
> 
> Bruce Ashfield (4):
>   linux-yocto/5.4: update to v5.4.114
>   linux-yocto/5.4: update to v5.4.116
>   perf: fix python-audit RDEPENDS
>   make-mod-scripts: add HOSTCXX definitions and gmp-native dependency
> 
> Christophe Chapuis (1):
>   rootfs.py: find .ko.gz and .ko.xz kernel modules as well
> 
> Jose Quaresma (1):
>   ptest-runner: libgcc must be installed for pthread_cancel to work
> 
> Joshua Watt (1):
>   classes/image: Use xargs to set file timestamps
> 
> Kai Uwe Broulik (1):
>   gstreamer1.0-plugins-good: on wayland qt5 needs qtwayland
> 
> Khem Raj (1):
>   cml1.bbclass: Return sorted list of cfg files
> 
> Lee Chee Yang (1):
>   binutils: fix CVE-2021-3487
> 
> Mark Hatle (1):
>   kernel.bbclass: Remove do_install[prefunc] no longer needed
> 
> Michael Opdenacker (1):
>   sanity.bbclass: mention CONNECTIVITY_CHECK_URIS in network failure
>     message
> 
> Richard Purdie (3):
>   yocto-uninative: Update to 3.1 which includes a patchelf fix
>   pybootchart/draw: Avoid divide by zero error
>   oeqa/qemurunner: Improve logging thread exit handling for qemu
>     shutdown test

I merged this branch apart from this last patch above as the author of the 
patch messed up and you'd need the subsequent fixes too ;-) It can come
together, later.

Cheers,

Richard

