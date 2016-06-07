Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 4A6117326D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 07:31:15 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id s64so109243179lfe.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jun 2016 00:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=isqPKex6v+aKOZhoRxiaCsnYXrMwnLsdJTCEx4I+6Lw=;
	b=VpD+YgEyPX0ePCw9qlSBdP3NsbZI2LeMNjFMr2sfrYI+tN4u/TaCpzTEVdzT0Ohqcd
	8yIuTKht4BFNsIF7075pZ4FWg1gATSYI9Y8pMw1fXduu2WCRmxrKxZBBYDvO/zP5nLgW
	F5yu7pweL0glQUGzmIhK8mSv/aR/2RjCT6xRtqEldzCz2FqtN1c+02KPkPzbMorBdSVI
	u7ZTJYfClfkpjPwfdLsvEBz33CcT/bRUHcxBE0/snqNDHe6GSifLrk6+mOGdNjaFza4P
	K54haI245JPRe4NM+xKkM1IbDUSRh9bdoDIE69hW6zEm9h06PMOy4xKyd5H3gMVDiKO1
	FLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:organization:user-agent;
	bh=isqPKex6v+aKOZhoRxiaCsnYXrMwnLsdJTCEx4I+6Lw=;
	b=Ch2RW+btvLEB/6UocEwzGiREPEM8EHe4l15xsOx0WI+jeCi3CrGLdNYbNhn3ARrMWC
	DCkSw3V+4E5iNaLfa9f2cKF1nrELY+CVv19StHMkrZFceWUEjktg9spq7TJYgf1fKYFa
	q777blHh3fLYOupIsK/HlBFEZFvOivWP90Swqf/8EMoNeDGBakwt6dBxgCRyz7XC4hfI
	39shFyD40B7WSopvBZc9FUrVKzjInDiCUuBggp3UOJYwmqD0siQzBclbWHuBr+fZTt94
	7U/agvmXvqDY/u8DUGJsActeO8c1gSNtq2ItBc6ke0PWKl94+O6t5A8mMnceQy7AKkSR
	cciw==
X-Gm-Message-State: ALyK8tK1sBwn270HWgxipTiEJ7ZVgd4NHC7M3/0vTREYE7zlvH8geEVMTwHGuuK64Rhw4A==
X-Received: by 10.25.43.70 with SMTP id r67mr2019548lfr.80.1465284675396;
	Tue, 07 Jun 2016 00:31:15 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-218-130-no126.business.telia.com.
	[213.64.218.130])
	by smtp.gmail.com with ESMTPSA id z6sm1937141lbf.45.2016.06.07.00.31.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2016 00:31:14 -0700 (PDT)
Date: Tue, 7 Jun 2016 09:31:12 +0200
From: Anders Darander <anders@chargestorm.se>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20160607073112.GC3930@ad.chargestorm.se>
Mail-Followup-To: akuster808 <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1463979792-7559-1-git-send-email-anders@chargestorm.se>
	<574294A2.9000806@gmail.com>
MIME-Version: 1.0
In-Reply-To: <574294A2.9000806@gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [krogoth][PATCH] lib/oe/rootfs: Fix DEBUGFS generation, without openssl
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
X-List-Received-Date: Tue, 07 Jun 2016 07:31:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

* akuster808 <akuster808@gmail.com> [160523 07:29]:
> On 05/22/2016 10:03 PM, Anders Darander wrote:
> > In commit 20ea6d274bb0a9a5addb111f32793de49b907865, debugfs generation
> > for images using opkg, which included openssl was fixed.

> > However, that broke the generation of the opkg-based images, that lacks
> > openssl. The error is a python stack trace, showing that shutil.copytree
> > tries to copy a non-existing directory.

> > This relates to [YOCTO #9040].

> > Signed-off-by: Anders Darander <anders@chargestorm.se>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit f6b0b260ce18a30d04edfb0afb7942b9f9a5480b)

> pulled in.

What's the status of this? Waiting for autobuilders?

Martin sent a query for this patch last week.

Cheers,
Anders
-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

