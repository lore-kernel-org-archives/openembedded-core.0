Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.315.1614966867844160142
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 09:54:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MU/mXhs6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id o2so2194829wme.5
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 09:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=MAyW4Hsaa6uYKuWIOFuU54T6q/L9Oht5RZf7gvPCgh0=;
        b=MU/mXhs6DdnPnbS9XQXoG4MfYxm9UNbm8Eq++j/FOheMx+15SMzkAfALsuWXcyjffF
         jb/pXAAmkazkYin+FJ8YNuFeNufWREzhMOvP6dNJuJC1Zvxxnb5HEPFbpjm5Vq1SkJf5
         tJUPyi5ckeG5X3N27j/ju0ZFoFfLeeyfrPh6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MAyW4Hsaa6uYKuWIOFuU54T6q/L9Oht5RZf7gvPCgh0=;
        b=uXtAtQeFcP2kVCroRV3os/z0LdHhnxAd3cqWwWlvMlVXPXo1DQW/b4uwhM4aWxnros
         ZMuxfu54G3IpaRf3sv726BJ/a5fH2iHCvPBXP0QwfsPyfhwPhgSzFGRTDAN9pQZtDQ8p
         3TGd3eWhEoyEb/fXt71pk1UaLG9JksaIS7eSTPnhPz9cvPD6pJjH5dTu1iu9RTUt27Ey
         ysg8Fw4ygd9a++mgV2PAsTEoWqLOFgRnhR01IWOCrjbPtcVid9QXpo+4Jw24dy8EKeHb
         3s9wSSjLJA0RmfzG0wGZ9LQt8kdg+Vrx8NUa72AwCp7cxDooIPS1OwV+VT+p634Nt7wW
         waHw==
X-Gm-Message-State: AOAM533fWPUszCRFAnXtVYbIoeGAOE9qAypqXINqrDORizKbb9npOujY
	UINMMXi6g9pbDXZUtzE9DkQ+Lg==
X-Google-Smtp-Source: ABdhPJxEDY2gxdwnILtLUsyHeQOdUr6/GdM+QVu9uDyHmAZChmWASadmbU6vSQQ8NqC2lavMwEeA0Q==
X-Received: by 2002:a1c:ddc6:: with SMTP id u189mr10193363wmg.171.1614966866425;
        Fri, 05 Mar 2021 09:54:26 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:a6be:e9e5:bd97:feaa? ([2001:8b0:aba:5f3c:a6be:e9e5:bd97:feaa])
        by smtp.gmail.com with ESMTPSA id r11sm5713162wrm.26.2021.03.05.09.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 09:54:26 -0800 (PST)
Message-ID: <b9ceb42871b6bfa49caaf1bb86ae6627154688d4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] glib-2.0: call os.path.normpath on THISDIR
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Martin Jansa
	 <martin.jansa@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "anibal.limon@linaro.org"
	 <anibal.limon@linaro.org>, "geoffhp@gmail.com" <geoffhp@gmail.com>
Date: Fri, 05 Mar 2021 17:54:25 +0000
In-Reply-To: <38592c5c6824461687563ed1a52913eb@XBOX03.axis.com>
References: <20210302193229.175044-1-Martin.Jansa@gmail.com>
	 <16696CDA6651CD2C.16425@lists.openembedded.org>
	 <0c5fb27d35c142d488642d21d24a37c4@XBOX03.axis.com>
	 <20210305115050.chhf5zf357wns3xl@jama>
	 <38592c5c6824461687563ed1a52913eb@XBOX03.axis.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-03-05 at 15:52 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: Martin Jansa <martin.jansa@gmail.com>
> > Sent: den 5 mars 2021 12:51
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Cc: openembedded-core@lists.openembedded.org; anibal.limon@linaro.org;
> > > 
> > > Actually, thinking a bit more on this, I believe that with my patch
> > > applied, this patch should _not_ be applied. That is because it makes
> > > the paths relative to thisdir, but then uses ${THISDIR} when using
> > > them. Thus if thisdir is normalized, it may no longer match ${THISDIR}
> > > and the relative paths will not work as intended.
> > 
> > I'm sorry I've tested and wrote that part of commit message when I had
> > if os.path.exists(filename):
> > at the beginning of this whole section, which I've then re-wrote to just
> > store only existing filenames in files as a list instead of a map (to
> > simplify the rest of this function as well), but then I was wondering
> > why Ross used the map in the initial implementation here:
> > https://git.openembedded.org/openembedded-
> > core/commit/?id=5acd9cbc9d5c6355010775250fb25f043441c5cd
> > and assumed it was needed to get all possible filenames in
> > do_configure[file-checksums] in case they are created later.
> > 
> > So I've removed all my cleanups and returned to smallest change to just
> > replace COREBASE with THISDIR.
> > 
> > What about checking the existence before showing the error, that will
> > show an error only when matching file exists while keeping all
> > not-skipped paths in do_configure[file-checksums] even when they don't
> > exist yet.
> > 
> > Will send a patch for this shortly.
> 
> Any objections to my patch, where there is no need for the bb.error() 
> in the first place?

Your patch encodes the paths of layers relative to each other into the 
sstate checksums. I'm not sure we want to encourage that and this code 
will end up copy and pasted around without people realising what they're 
doing :/.

Cheers,

Richard



