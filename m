Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.22921.1596975541863633909
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2020 05:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JFm8ZyVx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id 9so5349606wmj.5
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2020 05:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=z15KOdxQ0F6SjYbGRH68P3BzgLeyHQffseQSyrFFqmY=;
        b=JFm8ZyVx2qXlw6s/4LpJOpCTJB3iMcc2l+bXWkMakEDRyIRsiuhRyMl5O39Mdkk//i
         CIkBCJ0npxmLZ3ucyrT+2KS/ssQfa0uXi1CJtWuXMFqjhozbxY5r0E5ft1zrc4R6xkCW
         ltpzuLlBp17wmhc1z5cGHW9W0W3lJTKoC9rtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=z15KOdxQ0F6SjYbGRH68P3BzgLeyHQffseQSyrFFqmY=;
        b=QwcTvbeQy35uzgFyKHw6t6AvF+fitiQWb/9skTjAJkIXuzudBJXnySMGgm60Hp+kGU
         ziQ791UjPhs/X9zbr5m7JfLN8E4jZb7tpXrYQqmRye3XnGQaBfQmMPeotV45v5UyMegU
         fDlqLlOnCK1CCZ2ZNoZLl0hv0o4amZYfJqg4L09/sttPJeioKWzI3X5YLKKjy6VhPbVt
         Uf/SwSsBTHC4ahLbueBIwR+6/jAoYnfvc+bf/SFC7928JXzpY+VxjKxPTUOM6k4/6ZMn
         U9PNENX7O6PsFD8UMkTagmA9WINOO+Uwc9PHnsE2vsSa+XnDM7xiM7xk+GPDN1LNCzbe
         DeVg==
X-Gm-Message-State: AOAM533BQGkGNxmUVZx/+k7pEpKGXVijbsPZAUp+5UcMcYi8gDVDu6vA
	qyABF1sBfFUNqsLGkRydDMRofA==
X-Google-Smtp-Source: ABdhPJxpjTUhPF6W3beonN54aBxKj5qBQiSW4Ef8WI3BlJdYxhj/icF187mfi1ZyX6dJ4zBQzZXrWQ==
X-Received: by 2002:a1c:38b:: with SMTP id 133mr11640006wmd.153.1596975540368;
        Sun, 09 Aug 2020 05:19:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 9.a.b.2.3.a.a.7.c.e.f.b.f.8.9.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (9.a.b.2.3.a.a.7.c.e.f.b.f.8.9.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f98f:bfec:7aa3:2ba9])
        by smtp.gmail.com with ESMTPSA id s205sm17925036wme.7.2020.08.09.05.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 05:18:59 -0700 (PDT)
Message-ID: <83ff8e557f8872d5fe8c1bfdc387e1ec7bbfb3ff.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] populate_sdk_ext: Ensure buildtools doesn't corrupt OECORE_NATIVE_SYSROOT
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 09 Aug 2020 13:18:56 +0100
In-Reply-To: <CAOSpxdZrryt+TiLgpei1grJDQwxyqNfi_txg8=D2=4fLFmf8aw@mail.gmail.com>
References: <20200807202548.753073-1-richard.purdie@linuxfoundation.org>
	 <CAOSpxdZrryt+TiLgpei1grJDQwxyqNfi_txg8=D2=4fLFmf8aw@mail.gmail.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-08-08 at 12:12 -1000, Steve Sakoman wrote:
> Is this series suitable for dunfell?

The uninative one is probably a good idea. The buildtools one,
definitely not. This one should be harmless but isn't necessary without
the buildtools one.

Cheers,

Richard


