Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.60289.1600087536785957869
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 05:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iS+xKdUS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id k15so18554770wrn.10
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 05:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=cbMOSke++6vait3XBdoKtWDhGDEdCTjOUWY3Y2Kmlxk=;
        b=iS+xKdUSTXtUPYUPjdQiBLuhnlIggMB6T/RaYO7kqhYRhzJd1p+ERVBUzporth1oaI
         d3jffc3RbbmfDBUEiPpCjpcIuIUGpaA+XhwuiXoXl40vsKIlBKvDzZmuAiE8KtT8sbgX
         1VxFboyjHLqPHA3hbw/hdIf0EijkkeHI8a8A8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=cbMOSke++6vait3XBdoKtWDhGDEdCTjOUWY3Y2Kmlxk=;
        b=BCuDZgUqlwAw8ozJm1RWx5ehF+BBA7pBOmImijMzI0oeS3+jyJ7HAUBN3lAs/DAfnx
         OBtYjamfIn8RwRvkSRNl4+18T8CFQiVzQ5rW3nXW7KRG7Ri10NOs2LWS86kJkcj4zCEU
         G+AnA0U0+d3O7h3diFuy5Mn0xWWSa0tVKpQJ68YpOOOZFI8Ppo0rwKSTNZb5Xj4I3oka
         RbA/D0YS+XUNfJRa6Rc04EhPClboEufSDhjNvmfXw/rzfpYoC1HIGMh7nhWWyBMll7As
         /+L6GZtfsNzVeJMxF+6L0D6/Od0R4jZaqo2uTxGmuiqzQo5HaWvDltDxbnNRS7UXSGgV
         wdTQ==
X-Gm-Message-State: AOAM533uiOrlyAOsuntMI0R1mHu0q6hOVmo510j0NyTS3jnUpRT2CEil
	GhVRSfy5t+AH06BwhouUIEwQwg==
X-Google-Smtp-Source: ABdhPJzEHieJfTEhH53ph/kG03tB1+pjR4LGufNpSmiu8DmWLMR84DkD9mzSa13fdnaYqh/pVCjqpg==
X-Received: by 2002:adf:fc0a:: with SMTP id i10mr15462574wrr.111.1600087535022;
        Mon, 14 Sep 2020 05:45:35 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 1.9.9.2.a.3.7.f.d.c.a.e.2.4.1.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (1.9.9.2.a.3.7.f.d.c.a.e.2.4.1.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6142:eacd:f73a:2991])
        by smtp.gmail.com with ESMTPSA id m13sm19860851wrr.74.2020.09.14.05.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 05:45:34 -0700 (PDT)
Message-ID: <af41d5614ae98ab9a993bbbb8f7feb2ee0e96adc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] cve-check: use ALLOWLIST
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, Lee Chee Yang <chee.yang.lee@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Sep 2020 13:45:33 +0100
In-Reply-To: <CAAnfSTuxVhcA1P_-efXbSL5X5i8_RkP_ruVEoY571pOwhTvdCw@mail.gmail.com>
References: <20200914033421.48381-1-chee.yang.lee@intel.com>
	 <CAAnfSTuxVhcA1P_-efXbSL5X5i8_RkP_ruVEoY571pOwhTvdCw@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-09-14 at 11:42 +0100, Ross Burton wrote:
> On Mon, 14 Sep 2020 at 04:34, Lee Chee Yang <chee.yang.lee@intel.com>
> wrote:
> > use allowlist instead of whitelist.
> > Replace CVE_CHECK_PN_WHITELIST with CVE_CHECK_PN_ALLOWLIST.
> 
> This is a deprecated variable already, I wouldn't bother changing it.

If its deprecated, lets remove it.

> > Replace CVE_CHECK_WHITELIST with CVE_CHECK_ALLOWLIST.
> 
> ALLOWLIST really is a horrible word as this isn't a list of CVEs
> being
> allowed, it's a list of CVEs being not considered.  CVE_CHECK_IGNORE?
> CVE_CHECK_EXCLUDE?

My preference is for CVE_CHECK_IGNORE which is basically what it causes
the tool to do.

> I do also think that we should do these variable renames in one go,
> instead of piecemeal either side of a release.

I am worried about the timing of this, and the documentation
implications. We still haven't built M3 as we decided to do the sphinx
transition but we're not getting anywhere need the volume of patches to
make it happen :(

That means I don't have time to start handling piecemeal patches to
variable names, handling the fallout as things break.

Cheers,

Richard

