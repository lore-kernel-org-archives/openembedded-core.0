Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.7551.1589954835490966949
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 23:07:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jOLVbsc3;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: petr.vorel@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id h4so1399245wmb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 23:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=38mfBBhg0op3GMoDwPvEZrXie5Cw2o7TEQfAre8CqE8=;
        b=jOLVbsc3hpd3I4FH4yb5gSGrRvNrnVs13klPBqxgsLyzW9Auag8AqG1dBjLCBx3wSs
         uoZ23OIZGZxzrlJjeFh80+wKvKFdn3jARsliiDiLfcE4BVKae9656+B0x1thJgSwHS5p
         hCNRezytXB01yw7xhbMeoq0bFp99rziyrYhZaMG4S6ba3F+uHx0FkBFJNx7PRZg1X72o
         n+UoTxpF/h3aQdB7C9qyVQb9e0DbfShJmFxfUKZjlWIwMx8w/NKFMGVJzpfTVs6ke0Z3
         rGgJ6nOcfZ0Ta3li/5TUvZ38CFRCBs12DkczpaMJSvdHWL1gsySgfNY6AR1wsVD4bJe0
         Uixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=38mfBBhg0op3GMoDwPvEZrXie5Cw2o7TEQfAre8CqE8=;
        b=uGGKU4tAcnFaTaC2PNmTD9miL8fCdamL4pPzTKBxZgIpVCfAvEiTBNHaiiRJqJWS9t
         k+EZClRTIgNtrPOajQcceYyNEHeCYEeZCVapjJhEXrgFwELUCeoHbRKMU1mghDwaqHKA
         F5FiOXRjUjRzG60xZjqxYpNMyB8Y4TxRfxE55/YdjBnDONuDjWbto7UGOSsFeLfD3WCV
         s5h5fuM/m+S2tn7k9nkBfGKdSeFmTVwjRR5gi5s7aHyRiVdvCimIZ59RLiVSFGmUeGxr
         fp4K6hPUs4rJQD5vM0Or6V/Mye/I6GqkioKYlOLXWVNSX9wIACWwI0iAAHigJAfEbMUU
         +Sew==
X-Gm-Message-State: AOAM530ODX0pt1Q28cqdKKFvhiVJr/pLAqPgipm98Y/h1ttkSbqvFBXQ
	I7ytmQiFIo4mv8d6qUIZr3o=
X-Google-Smtp-Source: ABdhPJxvaTN3B5uVPNoX8MJBewNPoPelxNMf5TuZR72Nq7KQ+XZS9viOHx21ay0ANu35bAMR1Ua1jw==
X-Received: by 2002:a1c:5606:: with SMTP id k6mr3206607wmb.10.1589954833895;
        Tue, 19 May 2020 23:07:13 -0700 (PDT)
Return-Path: <petr.vorel@gmail.com>
Received: from dell5510 ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id i11sm1758872wrc.35.2020.05.19.23.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 23:07:13 -0700 (PDT)
Date: Wed, 20 May 2020 08:07:11 +0200
From: "Petr Vorel" <petr.vorel@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Daniel =?iso-8859-2?Q?D=EDaz?= <daniel.diaz@linaro.org>
Subject: Re: [PATCH] ltp: Fix format security warnings with gcc10
Message-ID: <20200520060711.GA7338@dell5510>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20200520052634.3291199-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200520052634.3291199-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Khem,

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Petr Vorel <petr.vorel@gmail.com>
> Cc: Daniel Díaz <daniel.diaz@linaro.org>

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Nice, just easy fix. Please just send patch to LTP ML.
Some time ago I tried to add -Wformat-security in upstream LTP travis CI, don't
remember why I haven't finished the effort. If this is the only needed fix,
we'll enable it.

BTW how to add -Wformat-security in for openembedded-core (for next time)?

Kind regards,
Petr
