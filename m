Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.9001.1586174450381473304
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 05:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V/WnxsjL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id g3so14810341wrx.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2020 05:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=YFbPwSsV43sRoQzMEvPH/0Icjy753Ask79kIrIAsEao=;
        b=V/WnxsjL98EORs2cmg+RD/C3tI0hR2jQ8LA2EMeHDdrPQ+3UixE6fYl3R9f6XyiAAc
         S3WMgSygyjfTmvOj4DAM4Gzy/Q2n+9otIau1vI8Nw233Cz+tObT1oytYqbHtOp3Tdye7
         asJ9bENvOJriwzaD3Sx7SyOmarTxgGzAFg7Vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=YFbPwSsV43sRoQzMEvPH/0Icjy753Ask79kIrIAsEao=;
        b=OY9JHhadXvTzq9J+ftc8Lxo9TdL1/bKTSslD/d8Yfa4qiqHk3tpDR4LoCLIjNGfxeS
         XuKm61Kp3Wj14wdPRHyoO/+MdDg5w4wB/NlU4ovlz+sig6ha0cMXBGxErh0fL1UR/8Fu
         UudCtyteiToRGxYJ07d+4yYtG4PbAsFMaLipkQGtHtM9YwJfW6m7u2gbum2aRAYltiiM
         CKEHXILfP449XPBGfbdFJtuM70L1tG7z8TRkOmwF1S+HleTEtSuFOr8JeiBVsWqGckoP
         WWwM9Edjo9rPGQ72+LE59NVPCppPP/vz5PPBKTqBhtnaz8qbqmXaEpgRzHPRyYJlKtel
         145A==
X-Gm-Message-State: AGi0PuZ/BA7HcGKWNlpQuLSihZkV93HB4wmLDRShRS6v+oVYaHjVgWgP
	uqoWVjQdt1DKLjKTooM93Am9tg==
X-Google-Smtp-Source: APiQypIown9ghQ0WnK29watc5c0DUDfeaw7sSllkhv982Ow0Lk74zWharsWsBb49Db6DT5oqv6SUpA==
X-Received: by 2002:a05:6000:1205:: with SMTP id e5mr25205069wrx.73.1586174449047;
        Mon, 06 Apr 2020 05:00:49 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id c11sm813032wrt.24.2020.04.06.05.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 05:00:48 -0700 (PDT)
Message-ID: <3d20f00ac2d4f54f6bf4e67998df400548f0bfeb.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] curl: allow configuration of default CA bundle location
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jim Broadus <jbroadus@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Jim Broadus <jbroadus@xevo.com>
Date: Mon, 06 Apr 2020 13:00:47 +0100
In-Reply-To: <20200406060014.78150-1-jbroadus@xevo.com>
References: <20200406060014.78150-1-jbroadus@xevo.com>
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-04-05 at 23:00 -0700, Jim Broadus wrote:
> Add a CA_BUNDLE variable to set the built-in CA bundle location. By default,
> don't set anything for curl-native since that target's sysconfdir is a
> location in the recipe's native sysroot directory.
> 
> Signed-off-by: Jim Broadus <jbroadus@xevo.com>

That is a huge change in behaviour with potentially quite serious side
effects. As far as I remember we deliberately make our native utils
self contained rather than relying on the host system (which may or may
not have cert files).

We point at sysconfdir in the native case since we install ca-
certificates there if I remember correctly?

Cheers,

Richard

