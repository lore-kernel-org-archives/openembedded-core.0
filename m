Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 38B2561927
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 13:28:30 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t11so4334065wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2020 05:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=7ymQJXCzJDEZLmWWxegxQPCiugvPU4bkj0llHD+iZyo=;
	b=H+Tlu+7vK0xlWtED03+wCY0/oGS6XwOOgDAJiImXUU7p+tsKF9fgavAvdOAGMPuD4b
	vF/4XHXLVZzCN9nD5D1/lekI1xMTZvKrsFmfkxdj/UgHO0xssXBh1QttHMV2qBnb2WZR
	fVh+sUkC5xbHW44dOCJR2xgmfTeo3e+t0nSCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=7ymQJXCzJDEZLmWWxegxQPCiugvPU4bkj0llHD+iZyo=;
	b=LY9dWqalpWKFUjF6MAjCay6cmQtijUfWkyX+iJ8YbzFQy5YP62lZoaDNDVI1L3qW/r
	rH2YZFCYSH82ir41IYxjZrmMPPWCbSlQZ1hDbQ+x8a95mboFrpgrX+92QyfFMav1osBG
	6MLwJDogQghv6y3Hg7lubkwK38XyNiB5YcU9+r+FoFsWcDJdvHIA6fYI6k4BX7FO4tAL
	m2kqzCl0erLD1CKYe6u3Y5gvapaYOBmwYD3exFbLwjYg/OZ87I4S61Co6OtWSHL30vz5
	B3Xo/n1mUYhCexsattMRZRZS6t3tGmd3Ti9rri2+n0BJtPaF3+1GSaqVKbBS393KNQsm
	z4FQ==
X-Gm-Message-State: ANhLgQ16GrrORTLAt6dbq5+HM4Ii2mBMWlrs1ysIFz7hwilpyHgHbGWP
	Eqgdj/B+u+ECRqoo9FXzOodw3g==
X-Google-Smtp-Source: ADFU+vv5VU6mW0TaEnquE0aX205zoH/OCK3pzft7F7w49CQf4XR0AIrlaFnmuHiCyx4bdbTT8gHkAg==
X-Received: by 2002:a05:6000:149:: with SMTP id
	r9mr5180679wrx.147.1583242110845; 
	Tue, 03 Mar 2020 05:28:30 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j5sm33850216wrx.56.2020.03.03.05.28.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Mar 2020 05:28:30 -0800 (PST)
Message-ID: <7bc3721593abda11b0fbc0802969b387f47a20aa.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 03 Mar 2020 13:28:28 +0000
In-Reply-To: <390fd7bab651456084420a36a41478a4@XBOX03.axis.com>
References: <20200229161603.495994-1-richard.purdie@linuxfoundation.org>
	<390fd7bab651456084420a36a41478a4@XBOX03.axis.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Subject: Re: [PATCH] python3-scons: Fix license file collision
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Mar 2020 13:28:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-03-03 at 11:21 +0000, Peter Kjellerstedt wrote:
> >  SUMMARY = "Software Construction tool (make/autotools replacement)"
> >  SECTION = "devel/python"
> >  LICENSE = "MIT"
> > -LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=e14e1b33428df24a40a782ae142785d0"
> > +LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE-python3-scons-${PV};md5=e14e1b33428df24a40a782ae142785d0"
> > 
> >  # pypi package does not have a valid license file
> > -SRC_URI += "https://raw.githubusercontent.com/SCons/scons/${PV}/LICENSE;name=license"
> > +SRC_URI += "https://raw.githubusercontent.com/SCons/scons/${PV}/LICENSE;downloadfilename=LICENSE-python3-scons-${PV};name=license"
> 
> Any reason to not use "${BP}" instead of "python3-scons-${PV}" above?
> Or should I send a cleanup patch?

No reason. I tend to find BP a little harder to read I guess but its
just a personal preference.

Cheers,

Richard


