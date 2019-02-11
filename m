Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 41DB379BA6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 14:45:08 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id v13so5007416wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 06:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=StDIJofog3RnYaLAjgKqiPZqnbfTouB4rp+M7YQla7Y=;
	b=YUxi0xAbbfdSRPxVBOnmdIUrid2QSlB3npVHNKtCWL9eWdQW3NVNn3xTTBFZXDKnu/
	sFDo9fMuaD6g0Owy3UgUljXfWkfDYpFkhoX/wk7aiTpAgB8Dx1gj9I2Mo6sXUJXY0YwG
	+0N4VOgKsz3lzKstyOxFHlJMb8nRHWZPjsM+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=StDIJofog3RnYaLAjgKqiPZqnbfTouB4rp+M7YQla7Y=;
	b=kWoLFKopsdJzL54pFCKD8XQkBf1tTrskHI7C9N+GnfWemF6zNqXKyo1AoG8y0ndvii
	s1by8gZhH4ofGo97YZuJBEfW9QuYm/RAIrQ0dK7hqN6Zl2/SIdNHXh8HdOwK6fI4tsPJ
	1rvpeG01pDtfNLf+RwItC6lLs+92931EKq+yYwq4osRS6QJ9PVucwBiNg3pipv/foKs2
	kfBLx4+Ql4RdqBBSvHDnblFPxg92I1bSf69YCJgUKgdvybqcKxq1X2rLuPgZjU+qQVfp
	QgiuAAFxtq1cS9sPquLq5RBpPpGRT/0emC438aGxzJI0IdsoV7Tzy5ZWf29vAhNpAvRh
	vPcQ==
X-Gm-Message-State: AHQUAuZhTjvfdTUpAMXAMU2TqQy4mWKFZ5NGfcKYv0G4t8Kxb2Z2UY64
	1aYBH33hbtGbtVjg2+mM6ZyA3w==
X-Google-Smtp-Source: AHgI3IYOAweZFoubF2NRPgZgpaBpup33AGdmTq3biZIAjI9WvJZ3WkVwrJj55uO9S1ALytF076lzGA==
X-Received: by 2002:adf:dd4b:: with SMTP id u11mr16873193wrm.307.1549896308791;
	Mon, 11 Feb 2019 06:45:08 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b13sm18775246wmj.42.2019.02.11.06.45.07
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 11 Feb 2019 06:45:07 -0800 (PST)
Message-ID: <8ecd7e5d936576e19915df658461bd416fef4160.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Phil Reid <preid@electromag.com.au>
Date: Mon, 11 Feb 2019 14:45:06 +0000
In-Reply-To: <CAMKF1srR3zd+-wC3npBO+ULJxjEzYRMVejw+vNHcQ8p=n9KGRQ@mail.gmail.com>
References: <20181207120605.11344-1-richard.purdie@linuxfoundation.org>
	<20181207120605.11344-2-richard.purdie@linuxfoundation.org>
	<fae0fb29acedc0c26cf9d5860e053d1427316cb8.camel@linuxfoundation.org>
	<857809ce-49de-16c2-f26d-805acc3601c2@siemens.com>
	<31abffa69bca5ee313a7d6c30dd7fc06011a14e5.camel@linuxfoundation.org>
	<8ac88775-35f9-e3f6-a0c6-f218aa697e70@siemens.com>
	<81618ab958486def551d22764d960944fb09b73d.camel@linuxfoundation.org>
	<b269e78b-ebc9-751a-1253-dacf881f0a36@electromag.com.au>
	<CAMKF1srR3zd+-wC3npBO+ULJxjEzYRMVejw+vNHcQ8p=n9KGRQ@mail.gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] nativesdk-*-provides-dummy: Fixes to allow correct operation with opkg
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
X-List-Received-Date: Mon, 11 Feb 2019 14:45:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-02-11 at 06:35 -0800, Khem Raj wrote:
> On Wed, Feb 6, 2019 at 6:39 PM Phil Reid <preid@electromag.com.au>
> wrote:
> > On 3/01/2019 9:59 pm, Richard Purdie wrote:
> > > On Mon, 2018-12-31 at 20:56 +0100, Andrej Valek wrote:
> > > > Your previous solution is working for me, so I was not working
> > > > on
> > > > fixing
> > > > this. I thought, that You will just add missing packages, and
> > > > that
> > > > is.
> > > > I don't have setup for failing machine.
> > > > 
> > > > Is there any simple way to get all missing perl packages?
> > > 
> > > I reworked the patch a bit, tested and just merged a working
> > > version of
> > > it:
> > > 
> > > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=d4e27863f3874fb7dc543eed8dcf6a8c4d146fb5
> > > 
> > > Cheers,
> > > 
> > > Richard
> > > 
> > 
> > This patch seems to trigger the following new warning for me during
> > populate_sdk
> > 
> > Collected errors:
> >   * Solver encountered 1 problem(s):
> >   * Problem 1/1:
> >   *   - package busybox-dev-1.29.2-r0.4.cortexa9t2hf-neon requires
> > busybox = 1.29.2-r0.4, but none of the providers can be installed
> >   *
> >   * Solution 1:
> >   *   - allow deinstallation of target-sdk-provides-dummy-1.0-
> > r0.9.sdk-provides-dummy-target
> > 
> >   *   - do not ask to install a package providing target-sdk-
> > provides-dummy-dev
> > 
> >   * Solution 2:
> >   *   - do not ask to install a package providing busybox-dev
> > 
> > 
> > Not sure what is request busybox-dev to be istalled in the sdk.
> > Any thoughts?
> > 
> 
> Richard
> 
> I am seeing same failure as well. I solved it by adding
> 
> RDEPENDS_${PN}-dev = "" in busybox recipe.
> 
> I am not sure if thats right solution, busybox-dev seems to be empty
> package.

Its not. The real question is why busybox is being installed into the
SDK (which in turn pulls in busybox-dev). I don't think it is being
pulled in on our test images so its probably both your local
configurations that trigger something we don't see on the autobuilder.
Perhaps something is missing from target-sdk-provides-dummy.bb?

I'm also guessing this is thud so its possible we're missing a backport
of a related patch...

Cheers,

Richard


