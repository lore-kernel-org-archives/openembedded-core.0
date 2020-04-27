Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.4626.1587990644841470901
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 05:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JRpctI6p;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id v8so15862952wma.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 05:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=IiW3qOlpfh7kG1DEAnB3zQKKyZw8KvnfOC0dB9ptc28=;
        b=JRpctI6pZW1HMyykwPVEmQf1ee223PMuoTmWaHUOMjWGICIQC73zJSsOf2SGuTc2/6
         aLtFAtpoAhaV5YV8URdTi+g9YDEnLpIO4D/LYXHh2dFQlwAoLLSdr6IL0IB8P7rmc/J6
         txKlXpXYy8RhoTIe42JewlIiZrwtExWn+ZuIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=IiW3qOlpfh7kG1DEAnB3zQKKyZw8KvnfOC0dB9ptc28=;
        b=uHI6yrJqMqmjUXjoa7kJqNEiUG33VWCm0Q/8Y236OkQV1kjYOflOrq4rMBOOVovllR
         v2zhCfmahy/aLsqVoW7B/ZqdP+McJKPkgyLWWYjiflC3pk4LFpzA8jiVGZip6Shemnw0
         CFRcxT5On9x9OGVL24zCcJtzHFoQxhPrLrsLQ3DsR/uoKF34Jzj33XfgzsSetnr66HvQ
         +w+gvZnx4CYxnnXBefWPb2H7VV3YfODEubk7ZCJzcQIvKncYev2YaxEjwERwWB1ScqUX
         OZ7XmyYn6moIs4kJjUSIYBRI28d8u/VhkonjH2nn6dCZ/xSusRpaqhuUk1WuvQFQTovb
         gz1w==
X-Gm-Message-State: AGi0PuYq2dZXOUW616xE8gUJaCZ7IdSizYEtn9g3YoyrCz5/+bCNbnLP
	1T+4JXaPKvNhUbZcFVS7qtZ0HA==
X-Google-Smtp-Source: APiQypK7JB/+cBcgdkDqMv0jZNPN6hlSFrBHuVkh9bDbVfnX/tYwb1YfOc3TW0qJxcpr/YWKLP1QoA==
X-Received: by 2002:a1c:6545:: with SMTP id z66mr25153901wmb.81.1587990643302;
        Mon, 27 Apr 2020 05:30:43 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id j13sm20732822wro.51.2020.04.27.05.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 05:30:42 -0700 (PDT)
Message-ID: <39285fa7c28870730f023b1b93399dbb54854a67.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 01/15] rpm: upgrade to 4.15.1
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Apr 2020 13:30:41 +0100
In-Reply-To: <CANNYZj-_Z_Kd5=6UbvMg5c-2T1QCrCuvexy+7RqzhWOZfRtArA@mail.gmail.com>
References: <20200425172814.27370-1-alex.kanavin@gmail.com>
	 <9121b61b00747df8d326b422d2bb34258dd6665c.camel@linuxfoundation.org>
	 <160972188EAFC253.2907@lists.openembedded.org>
	 <CANNYZj9MJiBPZE+-MYLVAe2nfR5rwCsE9fONwXM5omfT4Y1sWQ@mail.gmail.com>
	 <a2ee87b585ad797813c6985218ae0e3ea360597e.camel@linuxfoundation.org>
	 <20200427090911.GA19242@localhost>
	 <CANNYZj-=p9Ov7JJrDOAHZcFKu4m-aiYURQ4_mYLbBNT_R1T=AQ@mail.gmail.com>
	 <20200427100816.GA27417@localhost>
	 <CANNYZj-_Z_Kd5=6UbvMg5c-2T1QCrCuvexy+7RqzhWOZfRtArA@mail.gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-04-27 at 14:24 +0200, Alexander Kanavin wrote:
> On Mon, 27 Apr 2020 at 12:08, Adrian Bunk <bunk@stusta.de> wrote:
> > > Yes, I thought of sending a patch that adds libgomp-dev to the
> > extended
> > > tarball, but... the mysterious problem is, in some cases, rpm-
> > native will
> > > compile on the same worker machines without any failure (and
> > maybe it then
> > > gets linked against 'wrong' gomp, hence failures)  - see links
> > above. I'd
> > > like to try to ssh in and see how this could happen.
> > 
> > Richard had a possible explanation for that:
> > 
> > On Sun, Apr 26, 2020 at 10:07:30PM +0100, Richard Purdie wrote:
> > > I think what may happen is that sstate may become populated and
> > then
> > > builds proceed further than they did previously.
> 
> I still don't understand this. In both cases, rpm-native is compiled
> (not taken from sstate). In one case, it fails due to missing omp.h,
> but in another, do_compile completes without error. How does sstate
> influence this?

Have you a pointer to a build where this succeeds and one where it
fails?

> I think the build should be run again, then particularly the build
> directory of debian/centos where rpm-native was able to complete
> should be preserved. I suspect it succeeds because,
> somehow, the old gcc from the host is used, which might be a serious
> issue :(
> 
> After that we can look into the (most likely different) issue of
> providing the header via buildtools-tarball.

The infrastructure doesn't make it very easy to do that unfortunately.
I can do it but it will involve shutting down all the cleanup
processes, stopping all other builds, monitoring and manually coercing
things back to the "right" state for you to look at. I can do that but
it will take me several hours.

Cheers,

Richard

