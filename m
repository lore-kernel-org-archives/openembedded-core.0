Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web09.672.1603397464976128275
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 13:11:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=APDQS8eU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id b8so4728801wrn.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2020 13:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=IwJOp1a89EHOAzwCJrXC/v0dhhzaSDXg+nwZvuf/QKk=;
        b=APDQS8eU8lJXtyx4mpmDWGJ0UjPVqjFJnGFrigRSAASpraS4zKsoKIPP+YgHtyUzbp
         gbfHoZgaLMn7gbM1P/voFzGw4SCvrKZHN93JlJ/h/teFCFPB15rzfGh+Kd8GvO5Lfs+G
         wEI+S323pqbfSlkF8I6/pY1jluzIwgpyNHpBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=IwJOp1a89EHOAzwCJrXC/v0dhhzaSDXg+nwZvuf/QKk=;
        b=HcFRXyePry9ILEKoAofcBD5aM4RlYMXumLCKs/mUT84Qs+DqMt4ghSX8/1jwChA3Pn
         4AGdtxfGwzrdLo8pmi89L3oi3pSAy7wdz2538dlwfjoq5m+ZPTLFwzI/cJqXiZBQqt0A
         a4STBEDdVcjSz2tdS6m37wQUoewCZeLLe2NCwVtvj8AdG+jvxaVsFILPu1orajmC9NG5
         kjxKqibiemZeTt+n4CIANrsM2qIi4puAA/NUJo2CHmP0Yhu3I+HDn7xZ8y1v7hRpg4HY
         C1QDyRDuccITHA/FKzM9BriZfqw9kVUp6oJus2JOVpm0wEMGgvFnDeflRCD5cTSAz1C5
         0zWQ==
X-Gm-Message-State: AOAM532lsyuM3fUxhTCuo4vhs7vJlT0CdzKBki9n6fpgeT+8vubYdwVK
	aQPc0dm/ucVFRoAt61/piKhz6g==
X-Google-Smtp-Source: ABdhPJwuaKMFgd2MA3fODwtaiwXFjpwjPMkNwv2JyRWHt8whJnEnOPgauFYtzIGJTfBhKQb1qNBLeA==
X-Received: by 2002:a5d:6506:: with SMTP id x6mr4766230wru.71.1603397463599;
        Thu, 22 Oct 2020 13:11:03 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from a.6.3.d.1.f.b.7.5.5.7.b.f.2.d.5.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (a.6.3.d.1.f.b.7.5.5.7.b.f.2.d.5.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:5d2f:b755:7bf1:d36a])
        by smtp.gmail.com with ESMTPSA id l1sm5990190wrb.1.2020.10.22.13.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 13:11:03 -0700 (PDT)
Message-ID: <0b8c63800f9b0c70e7949ec1244c5061efe2c746.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] multilib_header.bbclass: Do not install the stubs for non-multilib case
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2020 21:11:02 +0100
In-Reply-To: <16daa853-ba5a-af7b-40f7-8b4e757848be@gmail.com>
References: <20201021210932.984184-1-raj.khem@gmail.com>
	 <d4a88c9df72243f4e334d3b408200062b6113b59.camel@linuxfoundation.org>
	 <CAMKF1sp+iH=H3yTPWSr_6iSJK2F0yDGBHk59K_zq4_6JYLwwUQ@mail.gmail.com>
	 <16daa853-ba5a-af7b-40f7-8b4e757848be@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-10-22 at 12:21 -0700, Khem Raj wrote:
> I ran a few combination builds without this patch applied.
> 
> build core-image-minimal/qemux86-64
> 
> then add just following to local.conf
> 
> require conf/multilib.conf
> MULTILIBS = "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
> 
> and rebuild core-image-minimal
> 
> here is buildhistory-diff output ( before and after adding multilib to 
> local.conf)
> 
> http://sprunge.us/oM7Fg3
> 
> It ends up rebuilding all target packages inclduing some cross packages 
> e.g. libtool-cross, native sstate it still re-used and that remains so 
> with above patch applied as well.
> 
> Therefore this patch does not make things any different than they are 
> currently.
> 
> Let me know if I should be checking more things.

Imagine you configure 64 bit x86 to use /lib64 in all situations (which
many do now, it probably should be the default).

Then rerun that test. I doubt core2-64 will rebuild in that case but it
will after your patch.

Cheers,

Richard

