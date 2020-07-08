Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.6999.1594200043622343611
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 02:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gOETFScZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id f139so2147362wmf.5
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2020 02:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=yd+yCPNmtMu2OQ6w+tUR8ZT5OxSz5rn/k7VZS8eEJTE=;
        b=gOETFScZI+pOfT4Ar7z8VlxDl9X5QEMg8wyM+EjDfD9A98KB0KpfgUNsc8Jvo5lK+a
         Zwv9RHYlyc1Jp+ygFBKRIreJh+x2OQM8DadqjYI24lsDQ/N1Xllfv/qcAQCKVnJXT7Oa
         9Fv6KecpuAK+WLcdDk7QPyxFLTjDQtpL/GnrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=yd+yCPNmtMu2OQ6w+tUR8ZT5OxSz5rn/k7VZS8eEJTE=;
        b=g7TmhsNFoSkcLfqtlh52WySoAvFN2cwUWXEC1Wrn6YgASlKX/MW55NX9ov6YBqD7v0
         LOxfgfml54fP/2dY2Mfcomew+zDouwFbTSVKVq2dyjcDJ9ATkqcQrpbUv4xzvFk8AgHH
         opBbDL38tdWVcumdSwyur8XSAv9T7teZUxOhFTp1+7Dle1NfcpGT+SuZOPqVYA1bZztr
         n7r5LMYaEY96jfibUNvwpPNE77GZpkbJAA8InTUQ7XdXBeKexE/8ZmOft+I9wdKGQucB
         1UnP6hNYv9GgxlcaMoVXiRsTHfd7RhLNGG5JAU6BgoNUpzfMb1HGhQQqQGsKj6pUCsbs
         JV1A==
X-Gm-Message-State: AOAM532icnBe1/MkE2ttDId73IVtcrToEK/NJoy+MO4iKm9hx39g0qPy
	fSdhQDcjyKTtJUGZ8zQzm7msVg==
X-Google-Smtp-Source: ABdhPJxsFb6W83OxQpiBvqdvl5i6/OmGh/48Xs7DlRYE6ko0ChTemIzYVtn8r6JX7BHXR9vPOwkjoQ==
X-Received: by 2002:a7b:c099:: with SMTP id r25mr8920059wmh.159.1594200042109;
        Wed, 08 Jul 2020 02:20:42 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id h5sm5720682wrc.97.2020.07.08.02.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 02:20:41 -0700 (PDT)
Message-ID: <ec870c18ff3d28d9e0f45f9b128b380dd8b5d668.camel@linuxfoundation.org>
Subject: Re: [OE-core] Patches are stuck in master-next
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Christian Eggers <ceggers@arri.de>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 08 Jul 2020 10:20:40 +0100
In-Reply-To: <5614347.lOV4Wx5bFT@n95hx1g2>
References: <5614347.lOV4Wx5bFT@n95hx1g2>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-08 at 08:20 +0200, Christian Eggers wrote:
> Two of my patches are in master-next since some time. Is there any
> reason why
> they don't appear in master?
> 
> https://patchwork.openembedded.org/series/24760/#
> https://patchwork.openembedded.org/series/24775/#
> 
> I would like to send further patches for meta-openembedded which
> depend on the above ones.

The issue is I still don't really like the eudev one in particular. A
native eudev really doesn't make sense and I'm reluctant to encourage
people to build such a thing. I suspect you can't convince
networkmanager-native to build without it (although I'm not convinced
a native libnm is that useful either).

Cheers,

Richard



