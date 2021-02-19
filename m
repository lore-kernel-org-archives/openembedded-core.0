Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web09.6776.1613731432383767473
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 02:43:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fwSBbbbs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id n10so7146056wmq.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Feb 2021 02:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ypxqo6wnoGtaFGLaS2eCZtYOUlhQXt2S9moR4b4LKFU=;
        b=fwSBbbbsrI5eOAaD673j6z7lPcHvYL2yAt5zNrTUBNXhMGd2V7qZpl0wdB3nYXwUeO
         /RnRaGFLlygfb3Rq2G5MmwTMeUuem7CMyX8loA4zINU3E79+GwRoff9Sx4BvpriSc9Pa
         gWFVTJ3lDlyS3b+adw+kunC6m9V+SBeQyUyzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ypxqo6wnoGtaFGLaS2eCZtYOUlhQXt2S9moR4b4LKFU=;
        b=P1n63PbO2Pp7UjfWL1ZNNU3ua0b52MukoN+zBPbRNxx1HIfm9OmBHzFyz9+dchXUjn
         LTSO1VhKFXatf90eR2vvUKpyLlEtomh86jzm+HYwhgeOy38OPaU95nswtQnr15UYtgFH
         Ic4m2rs5zOV71rV5a3KWWifcbe1H9p3vjGcHsYLeoLPStRFx/k2kxRmfO55kGuU7Psiv
         WEV2LWQUYTlOYedHV0wH1/0bi0SgvDOcyExjzE1Fhm9RPqp5vOqvP8xp/qxwGmVO4iv7
         Mgwd5V7YD+0tbkCqsnvFdxPzzk65cgBbtySeVuoe/SfE0b6Xf2fw3kJlO5SY+T7hZAzA
         kp1w==
X-Gm-Message-State: AOAM532yofmeAHTOMaMiTlWH9mh9F+yfCPXNRRr0Q+zdXYc+1Fw8yVGi
	XaGC2r61dRKZO6oS8T5eanfa3w==
X-Google-Smtp-Source: ABdhPJxoItwlOIlRAgetRX70SlzQvko0HqNaeq9qaim0vA8iw3DWeqIPijDLUj+G2DrfnAtLyQ2e/A==
X-Received: by 2002:a05:600c:19cf:: with SMTP id u15mr7496222wmq.139.1613731430837;
        Fri, 19 Feb 2021 02:43:50 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:569e:86b4:55e2:a2e9? ([2001:8b0:aba:5f3c:569e:86b4:55e2:a2e9])
        by smtp.gmail.com with ESMTPSA id y1sm12834357wrr.41.2021.02.19.02.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 02:43:50 -0800 (PST)
Message-ID: <83ec533a7bdb94356c0cc761ca7ff2ec1b103b91.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 05/11] licenses: Update INCOMPATIBLE_LICENSE for 'or-later' handling
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2021 10:43:47 +0000
In-Reply-To: <20210219101346.h3aolkvmezpjmyuu@qschulz>
References: <20210218165646.2109894-1-richard.purdie@linuxfoundation.org>
	 <20210218165646.2109894-5-richard.purdie@linuxfoundation.org>
	 <20210219101346.h3aolkvmezpjmyuu@qschulz>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-02-19 at 11:13 +0100, Quentin Schulz wrote:
> Hi Richard,
> 
> On Thu, Feb 18, 2021 at 04:56:40PM +0000, Richard Purdie wrote:
> > Where a user adds "GPLv3" to INCOMPATIBLE_LICENSE they almost certainly
> > mean both GPLv3-only and GPLv3-or-later. Update the code to handle this
> > correctly.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/classes/license.bbclass | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> > index 358c716a801..be8541f20dc 100644
> > --- a/meta/classes/license.bbclass
> > +++ b/meta/classes/license.bbclass
> > @@ -281,6 +281,12 @@ def expand_wildcard_licenses(d, wildcard_licenses):
> >      wildcards from SPDXLICENSEMAP flags and AVAILABLE_LICENSES.
> >      """
> >      import fnmatch
> > +
> > +    # Assume if we're passed "GPLv3" it means -or-later as well
> > +    for lic in wildcard_licenses[:]:
> > +        if "*" not in lic and not lic.endswith(("-or-later", "-only")):
> > +            wildcard_licenses.append(lic + "-or-later")
> > +
> 
> This means that "GPLv3" will have a different meaning in recipes than in
> INCOMPATIBLE_LICENSE.
> 
> Can't we just force users to use an original SPDX (the one which ends
> with -or-later or -only) instead for INCOMPATIBLE_LICENSE? This would
> probably be as simple as looking if the license is in SPDXLICENSEMAP
> varflags keys?
> 
> This feels less hacky to me.

I'm torn on this, I don't think there is a perfect solution. If a user 
has GPLv3 in INCOMPATIBLE_LICENSE they invariably mean GPLv3* so after 
the recent changes, a load of GPLv3+ could "escape" into their build.
That is a particularly bad scenario which I felt was worth catching. If
a user really did want to exclude GPLv3-only, they can write that and
it would work.

In the last round of testing after I sent this patch, I found that there 
is also *GPLv3 which the above tweak doesn't currently work with (it really
should mean *GPLv3*). I haven't decided what to do about it. I did send
a patch for the GPLv2 layer which uses this but I'm torn.

The main issue is that the commonly used values for this variable won't
work correctly without some kind of code change and the breakage is
important/bad, probably worth more to catch than being a bit hacky...

Cheers,

Richard

