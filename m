Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7859C71DCE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 14:34:54 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id n124so129593218lfd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 06:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=NuX6aHOrKhg0uGutu8VuY7BVRmlj6RWCjViQJ2+Pvc8=;
	b=FClyZZi2SVewFKhwwkY/8gZUCD9wB+fXUgSMrC3Iff5MAZ5aJ0sWXGhjV4vYmbOfIh
	z6ATr14mY9VWE4BVtBB2/e0TwLsHpDCgkThNZ7MI0aOGYo9eKRgAax0LRt2qjztmIMJw
	7inpjbQyd9Ah7ZreE9yKYcvnDcam3QSaCI5ur03HXslGy8DakHnsEcHQGYCxL0KlTVW0
	l5aBZV2M0ElZ5ImhC+Ascp4/naSaETjbmIyJY0OtOQwqITVAUtJiCP6AamBRVrf8RzJc
	d1htWWELS/lH/nD8S9nrcliPW74o5UCJJ8nBKlyjiCt0ywr6G9FFKpXTgubolWno00i+
	b/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=NuX6aHOrKhg0uGutu8VuY7BVRmlj6RWCjViQJ2+Pvc8=;
	b=qTyExVFPfIhN0r8DV4+TMXFGmklTuqcXeYmNfnCBYw6isZDz8JnhzdWMNlfrLJMDSo
	GmaswF+epG140YB5hGEFhl3iFioOZTFKAI9LRhbLu1DLoF4Mn054AH2mpdoSqgqLkiBN
	6xIaSjpH1B2Pt2Q2lgMMgNwHQlXgpd/qjIEIzLGAnZW+ITPjJrWjCVGYoHB54vI8poIH
	oEY0Cxb7oVQFaBt3Gffn9dXHp+yWcgaYRa+n2Z68Ini2P8Z41BOJWwiWFEVuRlwOciXe
	6QJRRYq4Plx5SXiBDnKSZwcvaG90x4V13uITkgAQ0FLg2s/nAvtyiMZXLYSbV29z3I5M
	F+rA==
X-Gm-Message-State: AIkVDXJEMlJOBs/w1Ulk70vMplQ17bmi0mzJL58n8z0fgYorZevpg8Q12r7PaLnD1JOG9Q==
X-Received: by 10.46.6.17 with SMTP id 17mr16495376ljg.14.1485354895029;
	Wed, 25 Jan 2017 06:34:55 -0800 (PST)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	h3sm188638lfj.0.2017.01.25.06.34.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Jan 2017 06:34:53 -0800 (PST)
To: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1485347971.30673.95.camel@linuxfoundation.org>
	<20170125142330.4463.98518@do.openembedded.org>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <129d261e-6f76-b471-48cd-99ddd06c3667@mender.io>
Date: Wed, 25 Jan 2017 15:34:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170125142330.4463.98518@do.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIE1ha2UgU1NUQVRFX1NDQU5fQ01EIHZhcnMgY29uZmlndXJhYmxlIHVzaW5nIHdlYWsgZGVmYXVsdHMu?=
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
X-List-Received-Date: Wed, 25 Jan 2017 14:34:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Sorry I forgot the right patch format, but let me know if you agree with
the patch first, and I'll repost.

-- 
Kristian

On 25/01/17 15:23, Patchwork wrote:
> == Series Details ==
> 
> Series: Make SSTATE_SCAN_CMD vars configurable using weak defaults.
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/4967/
> State : failure
> 
> == Summary ==
> 
> 
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
> 
> 
> 
> * Patch            Make SSTATE_SCAN_CMD vars configurable using weak defaults.
>  Issue             Shortlog does not follow expected format [test_shortlog_format] 
>   Suggested fix    Commit shortlog (first line of commit message) should follow the format "<target>: <summary>"
> 
> 
> 
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
> 
> ---
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> 

