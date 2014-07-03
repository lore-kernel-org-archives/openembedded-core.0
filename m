Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id D1CC66116C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 13:42:39 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id j5so207204qga.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jul 2014 06:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=9JLbYHknAlXmTN3EzvvzLWQ/X4y1UcY/EOJQlugivxg=;
	b=chWHjAEmTWCeJ6jJRcdL2RUl9PBV3cqxyEC9zlTJENCBlw5jus8xO38+scGwKOPXgT
	dA0AG0RdAeSanK4TQx1x2OthJevBbYqdrRkD5cQzDsQp1pgM5vIi+KWT8/yGJDqb+fJQ
	lpyMXJZPcubm8xnv78YrmESyXgYvBuqplCHzoAxu6Ukufy4NJQP/IB7VD57CZUsTnxt8
	LkqbSVjRbAKNBBlxC2HZ6zIjwm4QwxQiIkoA7Cdb3jpX2o7LMwDBYSAnkCRZAS5xX1TN
	9f8cELeSFHdjtX2VVK8fp/So1EwMZKQoFO7c2NGyLNHh0G4eLRqdNDyA0Cr6YCDPMTq8
	II0Q==
X-Gm-Message-State: ALoCoQlmZbt3kmHNKcE9zq58QHFJM3C+Xlo2jkepRVMkB2d21oc5FIEPE3AnLrtqNIDcIwWn5PxZ
X-Received: by 10.224.124.74 with SMTP id t10mr7559455qar.78.1404394961033;
	Thu, 03 Jul 2014 06:42:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.40 with HTTP; Thu, 3 Jul 2014 06:42:19 -0700 (PDT)
In-Reply-To: <20140703074654.GA10498@ad.chargestorm.se>
References: <cover.1404244287.git.mark.hatle@windriver.com>
	<7ec8091f15256ddcbadf4051867119ae82d333d3.1404244287.git.mark.hatle@windriver.com>
	<CAJTo0LYnb4YifRMXyPdaX7ZQMBvT3Hw2S9bN-q4Uxmiz2x3efw@mail.gmail.com>
	<53B32439.6050804@windriver.com>
	<20140703074654.GA10498@ad.chargestorm.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 Jul 2014 14:42:19 +0100
Message-ID: <CAJTo0LYo=kpnBDvgaDgZHeoM6pGidJw_FibaZfoLdK3sF64AcQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] db: Uprev to 6.0.30
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
X-List-Received-Date: Thu, 03 Jul 2014 13:42:41 -0000
Content-Type: text/plain; charset=UTF-8

On 3 July 2014 08:46, Anders Darander <anders@chargestorm.se> wrote:
>> Baring that, it's likely that AGPL-3.0 has similar restrictions to GPL v3 and
>> LGPL v3.
>
> I took a quick look at AGPL-3.0, and as far as I can see, all the
> clauses that makes companies avoid GPL-3.0 are also in AGPL-3.0. Thus,
> INCOMPATIBLE_LICENSES ought to be extended to also cover AGPL-3.0.

So this is https://bugzilla.yoctoproject.org/show_bug.cgi?id=6499.

Do you agree with my suggestion that LGPLv3 also needs to be excluded?

Ross

