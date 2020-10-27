Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.11988.1603794719457216182
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 03:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dGpUO/gx;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id i1so1301583wro.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 03:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=JKfXcSp+o1ow0daZa4B8M1jQXeQWpyiAkuvR6b12PaM=;
        b=dGpUO/gxEfsWGq4dvjfKARhDZm5LtlM4BM5stEmVrHdnFoczoZRqbGZpj2T/m0gdpv
         CzZ+V9RiI/ZVP7ZiIn4nDhKXrIfVd+lpVGcfhwPcl7MaKL8W7mqAjJaiT4j3xEzRUSOQ
         mPuwRjN/uxbamxdZW2uYmvoI8/bE5W0b04gfmacJelSIrbiPPQ7B6jf5b18nG1mS0faH
         uNotD0NaI05P4fGGpDPZC+O4WsXo4mOnCdlGf+Q4VFz48aCjFIjADm4V5d5HE/a59ytB
         eXsW4uxPPptZ0Mw2n3NY7t4GS1ZSMiHGo16xKKJfT5MyS90e6Zm/4coUWgYJu0f/hdjm
         UCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JKfXcSp+o1ow0daZa4B8M1jQXeQWpyiAkuvR6b12PaM=;
        b=Z1aNWxFHovTQNipjeKCEjfSe3PDa0j6H/BFTOker+B6rdOLgxBW7rAioNg9HI5yDgz
         l8tgU8HJ1brjQ52R8YKgijLibSn5Rfud6wX10of5xhRlJHdaII0+oSJ3IyZ05t1/ayEN
         SULU4Fox/PU5jFrhJRnFJuJQoBf2AyLGf+zSl4TnBYCTb7f9Q9x1kVmz7KIpglnXKsiP
         M8fN7/SM8CBMCIv0VK4cu2aNdF/y3U/L/uRFetTRDiUc78Yg5hSb8KNl7+PMVDxHM1oV
         4SY0nAJtoDntsbdaxksUihH29LGX4tbNUSJ2xHx+UqCeXFNhdMOh2YVBCHZUn9FTOkt+
         pnUQ==
X-Gm-Message-State: AOAM531tuYJOoMNI1GP6hVSkWPvxlN9XWysXaJw+Ro09yf7AN1Ce9SoA
	BY8QVKKsRwzC3tGPfTIHzGE=
X-Google-Smtp-Source: ABdhPJxgUdBWyfT/jAr7I2JVK4orphs/bKjTZ7E8V/H+eNcG+ZVIN3sm0B/RtVSVZknKNm8dmksaGQ==
X-Received: by 2002:adf:81f4:: with SMTP id 107mr2018772wra.272.1603794717894;
        Tue, 27 Oct 2020 03:31:57 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id l6sm1517801wrt.7.2020.10.27.03.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 03:31:57 -0700 (PDT)
Message-ID: <3280f55bf35ebe4dafd2575d0275509b6e2e181a.camel@gmail.com>
Subject: Re: [PATCH v4] Add new recipe for squashfs-tools-ng
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 27 Oct 2020 10:31:56 +0000
In-Reply-To: <f76c89f8255ef9ecf082439c910f37cef38c893f.camel@gmail.com>
References: <20201022113036.2938947-1-luca.boccassi@gmail.com>
	 <20201026100503.3200192-1-luca.boccassi@gmail.com>
	 <2ad67eb9e783fa044d4d97f35f93a35014aa73e1.camel@linuxfoundation.org>
	 <f76c89f8255ef9ecf082439c910f37cef38c893f.camel@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-10-26 at 13:09 +0000, Luca Boccassi wrote:
> On Mon, 2020-10-26 at 10:29 +0000, Richard Purdie wrote:
> > On Mon, 2020-10-26 at 10:05 +0000, luca.boccassi@gmail.com wrote:
> > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > > 
> > > The main difference with squashfs-tools is the availability
> > > of a shared library and a programmatic interface, rather
> > > than just command-line tools.
> > > 
> > > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > > ---
> > > v2: added MIT, Zlib and BSD-2-Clause to LICENSE
> > > v3: fixed CPL-3.0+ tag, removed GPL2 from checksum (not used),
> > > changed
> > >     recipe to be versioned, use bb.utils.filter in PACKAGE_CONFIG
> > > v4: disable zstd support by default, dependency not available in oe-
> > > core
> > 
> > Sorry, there is one other issue. There is no maintainers entry for this
> > recipe (see meta/conf/distro/include/maintainers.inc) which would cause
> > oe-selftest to fail. Can you add an maintainers entry please?
> > 
> > Thanks,
> > Richard
> 
> Ok - who should be listed as maintainer?

Ping - please let me know and I'll send a v5. Thanks.

-- 
Kind regards,
Luca Boccassi

