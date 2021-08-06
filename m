Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.4698.1628256602409916039
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 06:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h7rx4aMC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id l18so11114074wrv.5
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 06:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=BVeut2R5Xy9qBtXp2aXPzo5WiyqswQt8znT8E70jiME=;
        b=h7rx4aMCbvYf7bjjaNcl6AWDxdgvc4UTgknOOVfKHcLYIBL6Jahf+fYWj39kZ7ZCUk
         4PfmXrUN7106ELn3czDKohPZZFBbqZl2Hb0YhmF6Dusg14gbafBWKUoKxTxaA+UWhTdv
         aQICmqb1EGgsHnlfT1ug11UAX58dXiHGoy5s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=BVeut2R5Xy9qBtXp2aXPzo5WiyqswQt8znT8E70jiME=;
        b=bNADtc+xQSYEr6wIq1ZAFcft5MmKRJ9w4IUkaEi7amKk7NI4k1NDoGAgckia6c8deK
         pBZdN5R3MGkFrO3u69GFHhnGyKB03/QFZLQXD+6zunLCvWc48oUFbqrQ187L6GUVGP5K
         hT9xmP1RIsgEVjc5Ak3YJNIBTWruDjvQpEljQINhtPI9H8v2KwJDBVBW3gNJCa/lggjX
         vSn9viN0z3XpNvWRRBC5PbZc9jBIZAvrgpebhS89hQ1qt2jbo8x2P2naQK7Q8isWjGNd
         2Nztv6sn6fMUOl6JNXGIMJzyfJ8PY8B92NagH/NPulk3ZSReIbyVsGYIyM+APLzSDxKm
         vJrg==
X-Gm-Message-State: AOAM532VDIfKoXt1DyBUuUJlQLK/6h65tfpnE3Yp/AC5JJnhDXoQ6eOI
	kzvrHV4Qn+GcgGNuDVcN3FezFg==
X-Google-Smtp-Source: ABdhPJyGSTpehKtuWtLAf5weieAgRtEpWFgM0HMyAJoQOr9L/m8PFceq4caygQyuItSxCPZ2/BAUmg==
X-Received: by 2002:a05:6000:136f:: with SMTP id q15mr11006165wrz.148.1628256600709;
        Fri, 06 Aug 2021 06:30:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:9b1a:3a88:2016:c4d0? ([2001:8b0:aba:5f3c:9b1a:3a88:2016:c4d0])
        by smtp.gmail.com with ESMTPSA id f3sm9829525wro.30.2021.08.06.06.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 06:30:00 -0700 (PDT)
Message-ID: <06c6556bed6b89c9c33e5f1cade5c9b48b7bfeea.camel@linuxfoundation.org>
Subject: Re: [OE-core] override syntax for VIRTUAL-RUNTIME and PREFERRED_PROVIDER
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Devendra Tewari <devendra.tewari@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 06 Aug 2021 14:29:59 +0100
In-Reply-To: <jlRY.1628256264796581157.ukjw@lists.openembedded.org>
References: <jlRY.1628256264796581157.ukjw@lists.openembedded.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-08-06 at 06:24 -0700, Devendra Tewari wrote:
> Does the override syntax change affect VIRTUAL-RUNTIME and PREFERRED_PROVIDER? If yes, 
> will convert-overrides.py support changes to these?

It does not so it does not need changing.

Cheers,

Richard



