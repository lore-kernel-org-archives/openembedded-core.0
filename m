Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 08D7D613C7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 18:55:05 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q9so1828773wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 10:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=ecU9MijGXC1scphct6cfJyHH9aBhxrVGnJlBCAmn6Rk=;
	b=PzEtCfa8jOOuSl7hBjmMuDANYtG8ODPMAErwBvBadVKkUtNl+YXHgZwb3AVQOXYCIU
	xbWef668xVY3LDxcUdqHqTok9KKVwrA4b4E8TX2JXEe1WyTzgS9T9Ash4yhobw+kAbmQ
	gB08r/C7cM6zUiHCemRWR2ExhMeJzDC7EiHaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ecU9MijGXC1scphct6cfJyHH9aBhxrVGnJlBCAmn6Rk=;
	b=fkoiib6nCcwHDV7YJznMCR5GlGrxMD8MoDLI9FuyqAEj8vxgkEUUdiIkarvT9gcMfh
	ZqWy8wdiqfBWzATuCR9ZA9AYJ7cvscD0AQCtYQDj6XolfBW7wJTJc1ryI4VOpQK/Jhi+
	PyMkSR0CL1+pGODOLBGDxR18SgbWaqQx/WVnnBU4wigMIZsjKu2zcJaYcdIbFkU8j8bI
	czFaeNzDsYriQzvn85Bc37cBBrnrhhaGI69x6e0CPqkjnp2+Sunxl7vdoFBhfiFQyGyZ
	xeXj3j7FIkJY+3c0XwG270kYfnod3RdZCOjGr3aa+aQnhWo9xDjet6TfCvQbMJeZnlqK
	8nbw==
X-Gm-Message-State: APjAAAXaOj5wWTEpwU8jdKR55oRPI/0KUrGonh4M6tl89EYbQf5PpTFH
	FzLBC1p3hGFWO4BmaPzYfReKLw==
X-Google-Smtp-Source: APXvYqzH/y9WAxqwtQAfKQJwFUa7hunfrawHCArvdsyjmMCZWDwon7nMOAY3Pqw9ecQcec1OQ+F04w==
X-Received: by 2002:a05:600c:2c47:: with SMTP id
	r7mr3796303wmg.123.1582138506667; 
	Wed, 19 Feb 2020 10:55:06 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id q10sm970587wme.16.2020.02.19.10.55.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 10:55:05 -0800 (PST)
Message-ID: <c10081e8f424d555628a4bb323ee6c711953e34c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, "Mittal, Anuj"
	<anuj.mittal@intel.com>, "chet.ramey@case.edu" <chet.ramey@case.edu>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "De.Huo@windriver.com"
	<De.Huo@windriver.com>, "preid@electromag.com.au" <preid@electromag.com.au>
Date: Wed, 19 Feb 2020 18:55:04 +0000
In-Reply-To: <c0c877fa-9d36-1019-0785-5c984970629e@gmail.com>
References: <aa0bf5f6-aaf2-bfbf-6488-8d65cbe849f7@electromag.com.au>
	<4f09ab13-9571-3464-2fc3-334bc91b9c09@case.edu>
	<444185BB2F013F4E92378F99BCF8A58BC9AF9CBD@ALA-MBD.corp.ad.wrs.com>
	<99d34efd-3a68-0b05-0e15-fbfd360a2f2a@case.edu>
	<9b99752af2094590137fdaacf6668f170b34158c.camel@linuxfoundation.org>
	<41e8a2902bc8594a17f0afa1744f04a6facd5316.camel@intel.com>
	<de449babe3c4352a19928a05b569e7ca09cd89a1.camel@linuxfoundation.org>
	<c0c877fa-9d36-1019-0785-5c984970629e@gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: bash: Fix CVE-2019-18276
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
X-List-Received-Date: Wed, 19 Feb 2020 18:55:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-02-19 at 07:46 -0800, akuster808 wrote:
> 
> On 2/18/20 7:49 AM, Richard Purdie wrote:
> > On Tue, 2020-02-18 at 15:43 +0000, Mittal, Anuj wrote:
> > > On Tue, 2020-02-18 at 15:35 +0000, Richard Purdie wrote:
> > > > 
> > > > Someone just needs to remove that section of the patch.
> > > There are other issues with this patch which should also be fixed
> > > I
> > > think. It has been marked as a Backport while it is not one. The
> > > patch
> > > includes changes that are irrelevant to the CVE. And, it should
> > > have
> > > gone to master first.
> > I shall await guidance from you/Armin then.
> 
> We should revert the commit. Ill send a patch.

Anuj sent it, I've merged it to zeus. Open questions:

Should we ship 3.0.2 rc2?
Did this patch cause this regression:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13795

Cheers,

Richard


