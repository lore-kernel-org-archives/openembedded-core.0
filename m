Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.20595.1629920595938366757
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 12:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KzmkRZrt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id m2so289478wmm.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 12:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=5dWknnRwI5+aNiON6eRxZrLDojf6Hw5OnmAGoZHw2so=;
        b=KzmkRZrtchwbD5rVDhQhH5hc5fNRTVGbqbEnDuSzPz57G9qIDNkjHTMyqxcCYQdN1g
         nV8Th4IRTSw4tQCbLFJ+RtkeecLyRdiUBFjnGQwr0U0zzFSJEc0SHIGcdifgsi2qEgLv
         7TD4j05sEpusL361GGtdjs5Ffq5itz0uQXT88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5dWknnRwI5+aNiON6eRxZrLDojf6Hw5OnmAGoZHw2so=;
        b=dqWj4EkuoPJ4GKbUxDVN2JPXYZuk3l0wQRl6oggmenC6Gz0CPiWu0IHgqvVZB/V+Ki
         h7gccTENmyhakbuxMRuz2oETLCvF/TeteN+doB4xv2rQzfKKa9mHMxrTKbpbSMIo6TeY
         Vu8AVeDiRzF/+fuhbNJ1/xyQYs0UTcO0lpSJyeJNc7HAofTPbyhibfIpPH2HCDKkWuA4
         9oGLM/e9MeMEmssvAKgMuu+85MvJ/Wwxvf9XnTRqMZKiPSnPOaiutmmH0sPd+szS0DuD
         cAyY3UNY91DaT/3TvtYZ4d3D4S33WIA/jHD8a4cNkiTkrt2P9cbZJn8nW6z6YxZkMY18
         FtsQ==
X-Gm-Message-State: AOAM530Y+H/LolFf9UR+2pjCbf5Kzt0kTpPMqHwJOSC+SysYGv2mqj59
	P6hSNUAwYSXF1gZF5y8E14Ro7Q==
X-Google-Smtp-Source: ABdhPJxssKi8rkAukWC85srFDZCe8WC6/mrvHWaf3HXxg9CDj4c5vit/542FBO9XE684MHJgDGIj3A==
X-Received: by 2002:a05:600c:2186:: with SMTP id e6mr10659774wme.71.1629920594379;
        Wed, 25 Aug 2021 12:43:14 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:a9d5:4a4f:480b:62d4? ([2001:8b0:aba:5f3c:a9d5:4a4f:480b:62d4])
        by smtp.gmail.com with ESMTPSA id g6sm549073wmq.14.2021.08.25.12.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 12:43:14 -0700 (PDT)
Message-ID: <db691c357f05e5e2e34819ecbec4778223eae0d7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] go: upgrade to 1.17 release
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>
Cc: Sakib Sajal <sakib.sajal@windriver.com>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Aug 2021 20:43:11 +0100
In-Reply-To: <CANNYZj8D+D1zBiT=jdHLOcq0-4W615Qtj--FFhRuDjXxRWX41w@mail.gmail.com>
References: <169E9C6226DE3CC6.18091@lists.openembedded.org>
	 <32b22790-eac9-9e8d-ab6c-661bb77e2fac@windriver.com>
	 <CADkTA4M4O5kkPv2zhosT1XQZrtWXe0=arT=zPH4eTxd=WtVZpA@mail.gmail.com>
	 <CANNYZj9dsOkd5w7n4o8oox732VNZMmR6FunbOn_R3=y0X4qHfQ@mail.gmail.com>
	 <CADkTA4O2JWwy_Ft92aahvQ4iGBumyZ0UwoZr34NOw1PaXxm7bg@mail.gmail.com>
	 <CANNYZj-puppF2z_p-fDjZ9uXKHCQbbbdTBfFvzhR9_tRX1k9Bg@mail.gmail.com>
	 <CADkTA4OnBqmmwEnnA0K+pf3MGk2JUHsH-2mtXEyfjTOCti+7TQ@mail.gmail.com>
	 <CANNYZj8D+D1zBiT=jdHLOcq0-4W615Qtj--FFhRuDjXxRWX41w@mail.gmail.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-08-25 at 21:31 +0200, Alexander Kanavin wrote:
> On Wed, 25 Aug 2021 at 21:26, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > I mentioned meta-virtualization in the non-threaded part of this
> > discussion, so that specific information has been covered. Sakib is a
> > contributor there (and isn't new to core), and knows what he's doing,
> > hence why I have the luxury of being less detailed in the reponses.
> > 
> > I've said my bit on this, I'll pick up the pieces if anything ends up
> > breaking .. I'm just trying to be proactive since history shows that
> > go always breaks something.
> > 
> 
> 
> Please try to understand where I am coming from. Yours truly is doing the bulk
> of version updates in oe-core, because no one else bothers to, not even listed
> maintainers (and more and more recipes do not even have a listed maintainer
> anyore). So when someone else is showing initiative in version updates - and
> Sakib has not updated go before - I would much rather show appreciation for
> the effort, rather than immediate (and vague!) criticism for not enough
> testing.
> 

Enough, please :)

Alex does a lot of good work with version upgrades in OE-Core and it is much
appreciated.

Bruce does a lot of good work with the kernels, associated bits and other
things, both in core and as maintainer of meta-virtualization and it is also
much appreciated.

Go is a bit of a problem at the moment as previous upgrades introduced bugs
which the triage team has been unable to get resolved. We know the next version
makes further related changes which *will* cause problems. As such we are
worried about it. I'm close to reverting the last uprev over the lack of
attention to bugs.

OE-Core doesn't use go that much and our test coverage is known to be weak
there. meta-virt does use it much more heavily so asking for that to be tested
with go uprevs is a reasonable request IMO.

We are increasing the test matrix the autobuilder covers and meta-virt is
potentially part of that, as is meta-oe. We do already have some basic check-
layer tests.

I think we all agree that it is too late for 1.17 in this cycle, we have enough
risky problems on the go without that one.

Cheers,

Richard



> 

