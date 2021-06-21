Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.3026.1624308663438577934
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jun 2021 13:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WO5tQfNf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id j2so10588191wrs.12
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jun 2021 13:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=gr9pLd4XnV8gotSkNPgf5ExPzm+kunnpt8mCSm7EDlo=;
        b=WO5tQfNfoq9qGrt3pAAbI/651Afm4/MppCur3FLO7IAI6ZWnqH4iYu/H7buVJlXGpX
         1nDvveomERcGlnmeS9zAaHqT2E4tHavSVKtav2tzOXbwxh4CyPRNbyNI4+IFcgkeHmjB
         FEHZoxRJtBv6lXbdd64pj1FrHs6LXg6S5/FD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gr9pLd4XnV8gotSkNPgf5ExPzm+kunnpt8mCSm7EDlo=;
        b=Tul54hboJVaSSBINa0MAniWZjFiiSk5e6UB5WYzsfL+7Q9MiPq0ADADYP5Pmks+rwn
         I+9uNG9v8Cho2+XgGVlgRYf8XozlwoV3d7AZS1X6V+hpn4UcGJSYugWTbwdpFFeiV6QF
         CbAndu6GYhu1uEe3yGYPMRRKBfPZYVOGx1ERbzxMaoisuLrfuk/Z9h8pkQVVUbfFMo3k
         LcXtv+c2CtBMHfUcQBIofV2fOAeiiBND+nBHZ8pPTcd4BBFl/0fs6q4zii1hIh7T+jMb
         X5zvz+pYpenLKaWN02AIiwRy7UJ5k5RagvT9Cv/vL895gY6hdK/Rn/k8InVuRlf3hjLh
         fexw==
X-Gm-Message-State: AOAM533R4JzwzT18mEOhiEyWXqq7aa28JvPiIjbR1RaYtadiShwEDLj0
	pdRyMmXxdUmNgr3agnoNsQvR9A==
X-Google-Smtp-Source: ABdhPJzdZ3ZzwQIV3AfF+tAZzDq2t0wqdrqbbOku0BLfZCk3i0tQnzbJkE05yYeJiedki8KvChMrnQ==
X-Received: by 2002:a5d:6846:: with SMTP id o6mr350030wrw.89.1624308661585;
        Mon, 21 Jun 2021 13:51:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:9ff1:dbee:2c00:96a7? ([2001:8b0:aba:5f3c:9ff1:dbee:2c00:96a7])
        by smtp.gmail.com with ESMTPSA id b15sm22539214wrr.27.2021.06.21.13.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 13:51:00 -0700 (PDT)
Message-ID: <9fc0beb461ef23b8ad98aa19e7948c9301ff6280.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] python3: skip tests requiring tools-sdk
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Tim Orling <ticotimo@gmail.com>, Alexander Kanavin
 <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Tim Orling
	 <timothy.t.orling@intel.com>
Date: Mon, 21 Jun 2021 21:50:59 +0100
In-Reply-To: <CANx9H-D3cnMKVNJq5-xu-kNGPDKCMqhggmfxFY8K22iDsTfYWw@mail.gmail.com>
References: <cover.1624060313.git.timothy.t.orling@intel.com>
	 <4207e03bcbbfd8b6113c04bc7c35ceb516af31f6.1624060313.git.timothy.t.orling@intel.com>
	 <CANNYZj8diO0prd1g6ixjhXVc6NFB0otk8dr8yY-Fw2OMEjJjSA@mail.gmail.com>
	 <CANx9H-D3cnMKVNJq5-xu-kNGPDKCMqhggmfxFY8K22iDsTfYWw@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-06-21 at 10:30 -0700, Tim Orling wrote:
> 
> 
> On Mon, Jun 21, 2021 at 5:00 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > Wait. How does this work, if IMAGE_FEATURES are set from image recipes, and not globally?
> > 
> > I'm afraid this may have to be reverted, as it just made it to master.
> > 
> > 
> 
> 
> These tests have only been passing (since.python3 3.9.0 upgrade) because the AB ptest images in one way or
> another have included packagegroup-core-buildessential.
> 
> I asked RP about adding packagegroup-core-buildessential as RDEPENDS for python3-ptest and he was concerned
> about build performance. I tried to narrow the scope to gcc-symlinks and binutils-symlinks, but that was not
> enough to make the tests pass.
> 
> As I see it, we have two options, this patch which skips the tests conditionally, or we UNCONDITIONALLY skip
> the tests.
> If you run python3-ptest (and nothing else) on core-image-minimal, these test cases will fail, which means
> we do not have proper RDEPENDS for python3-ptest.
> 
> Open to other ideas.

I think we're all fine with disabling these tests. The issue is that 
IMAGE_FEATURES isn't available in a recipe. As such we may as well 
unconditionally disable them as that is effectively what the current
change does.

Cheers,

Richard

