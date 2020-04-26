Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.1755.1587922503103370170
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2020 10:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HLq2J88I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id g13so17755523wrb.8
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2020 10:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=2TaMzGQyh0Fat9acSzCNIYly8NEgPl+GWU4a4v685Jo=;
        b=HLq2J88IDLMvS4W+XGkSxfiHdbKhR/N60O37d75yyyrwIaPbDX/eoqodxZaUJ30zt7
         td2/T2zAJ/ppT6dh0+bXcvcIgHC8ETUOXLPbBLV4CtZUm7WSwKQpJUCpBNJw2tjEYD/W
         oRvWltkQmxd7GCiMfcUy47iUS4yK2AEJQy0kY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2TaMzGQyh0Fat9acSzCNIYly8NEgPl+GWU4a4v685Jo=;
        b=F1/X5AVwrYRTMLQMjATjUKo+d01nYUlSrARK7fTc6Q+Z2BEfUtBwZzXJkbs/66U3uY
         5nl5XW5Fa9Nka4C2jU5iF4MFQhR3c3nLmKFOQ9XizjXQqhPS0yHvT61nC3BDQtODdsXi
         K1tHp4W9ZJ7/9OxoYfkJ5A2xDGcVKJnKX5D/vnNTuQogav5HoX/NZgalAEFTE0P37VBd
         dgBQdAPHMb4m8ho6267q5C3eOUpGje76okNRD78a1GHr64X2xO4wpxyaGII8Nm0jFzhu
         3yz1gDNT5AQcIdzbs/3RaFp8amGlKSgfJ3GeKU5RvMuIkmeXFAhZkfxULQmDHLwoq5Le
         Ra1Q==
X-Gm-Message-State: AGi0Pub8bHJrc4st9IO52xEZLQA9wr6iKZd7/rMrFlJCo81bNeIVuNLn
	vJnmf/dY8Oh9ggUsXGn9IiEJSQ==
X-Google-Smtp-Source: APiQypIaISIbB9nLgJDKQDZ5E6bNZ76u3FhAa40uoz30y0DEHpQlEvWD9HZ3VhkriQf3IPACYPpltw==
X-Received: by 2002:a5d:4ecf:: with SMTP id s15mr24490978wrv.226.1587922501482;
        Sun, 26 Apr 2020 10:35:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id y40sm18807773wrd.20.2020.04.26.10.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2020 10:35:00 -0700 (PDT)
Message-ID: <9121b61b00747df8d326b422d2bb34258dd6665c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 01/15] rpm: upgrade to 4.15.1
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 26 Apr 2020 18:34:59 +0100
In-Reply-To: <20200425172814.27370-1-alex.kanavin@gmail.com>
References: <20200425172814.27370-1-alex.kanavin@gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-04-25 at 19:28 +0200, Alexander Kanavin wrote:
> Drop patches that were merged upstream.
> 
> 0001-mono-find-provides-requires-do-not-use-monodis-from-.patch
> modifies a file that was removed upstream.
> 
> Add a 0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch
> as unfortunately the new parallel file classification feature from
> upstream trips over somewhere in libmagic when inspected files are
> compressed:
> https://github.com/rpm-software-management/rpm/issues/756
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>

Hi Alex,

There were some failures from this series:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/890

It may be easiest for you to have a look through that build result as I
think all the failures are from your patches as that is the main thing
in -next! :)

Cheers,

Richard

