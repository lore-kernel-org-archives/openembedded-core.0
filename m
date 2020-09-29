Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.20575.1601385282521924304
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2020 06:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hSk7iiFF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id e2so4776723wme.1
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2020 06:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=SRIgwHiNvYiE6ZbGDOiur5HUkKpDx9XnWRIezypYoYw=;
        b=hSk7iiFFpSM7UmP2D+pWEXIm22l8F4tMLh/YvWHv81M4wq2QvaPGAc5A7RVqfzYakk
         s+9JQZZKqTHlSTICRn30BW/G62WtYY10fbqQhKz9eMfWQtyC9JtCvXKl9juoSl7VEe4l
         +wzQ7PY8wvRDqOhvTxAGcCI552mAZb3LxAsrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=SRIgwHiNvYiE6ZbGDOiur5HUkKpDx9XnWRIezypYoYw=;
        b=ijShYkyeH6X5CSJ/fTEe0GzI/X3YhdtrP58VtINia4E9S9RDSJmLSlg2GnoAK7U5QK
         iPFz65Vb269Mw+NS5lyTtK7lLwT2E+6MOHMUC67oUumbjseDPlzHS881ViJgvU5oGq5h
         ZsYeGNTqzMUmDmV3goGEC1TbTcFJ4MLeEencKXMIJZJZLXO3Yqt+oebU5dxc/Wm90u8d
         VfIV2JIc1uoMyR0FJGbpe4jMRDMKIvjFlfQ+FzqiHE1t9qRDjDz4TDwGVCFWZzJCH757
         qaxlopqNQ/xJpjKymplCyrK5yqGhYZq6I8Mc4/uOFZ5t6bHEbTFPNqtPa/9nraPHUlRS
         /2Cw==
X-Gm-Message-State: AOAM532X62nBkjr1iGJQoahxsr6yIBohCptu7BR03IzediUToFzFhQ8b
	mfbEGfGC02AQ7MyW/1Lyk2iqIg==
X-Google-Smtp-Source: ABdhPJwrRPziS/2AjuhLfUJubZdoHDRneZwoO4gPF3T6vQfrFVPc9xyLbsJXX7OyXh/OhdWi9H6D/A==
X-Received: by 2002:a1c:32c6:: with SMTP id y189mr4731086wmy.51.1601385280618;
        Tue, 29 Sep 2020 06:14:40 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.f.c.3.4.0.2.3.2.2.3.7.e.3.c.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.f.c.3.4.0.2.3.2.2.3.7.e.3.c.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:9c3e:7322:3204:3cf7])
        by smtp.gmail.com with ESMTPSA id t203sm5429774wmg.43.2020.09.29.06.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 06:14:31 -0700 (PDT)
Message-ID: <531f74757b01b8bf1acb499b3e4c1139396bd0d3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] meson: remove shell wrapper for meson
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: christian.perkonig@sigmatek.at, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Sep 2020 14:14:27 +0100
In-Reply-To: <891eb6bb-09c5-041e-b389-99ff216aa3aa@sigmatek.at>
References: <20200918095004.34894-1-christian.perkonig@sigmatek.at>
	 <CAAnfSTuFBJ_-jKqkxzmDi-tpW+pVCvsZPGScxWqScJ7O6oqWVw@mail.gmail.com>
	 <58340a4b-ee68-1923-114e-e28d7bfef422@sigmatek.at>
	 <891eb6bb-09c5-041e-b389-99ff216aa3aa@sigmatek.at>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-09-29 at 08:33 +0200, Christian Perkonig via
lists.openembedded.org wrote:
> Can someone review the patches

I don't doubt there is a problem here but simply reverting them is
going to cause someone else a different problem for which the patch was
originally added.

Is there not a way we could improve things so the original problem was
addressed but your issues also are resolved?

Cheers,

Richard

