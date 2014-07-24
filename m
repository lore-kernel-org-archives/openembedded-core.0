Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 55FFA6FECD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 15:26:18 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id r2so6649928igi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 08:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=2jd8PgloVkydhswfWTKm9Hh+us97589iABCWLzCEsWc=;
	b=Fr2K1aLXmtXP8tdnrFDQzOhfMOl1Q0BM+n6IWu2X4YjeYEJlUPWVq9Bgj3c90DYqW2
	u5A5xuydbEAtTkbcgyO+qLZT/RLPWLnm4mHouc6tc/GTLFb6Jz9mXRzjIbCYsCnt9PWR
	TTopKXy/hXRZCRXAOay7Vw65ZQl60m0TOG4bc3Nkdfhkwmdae111N5VjLlXY6VkOy2B4
	D4p/NXxTg/cfhRMM2jFDu9B1K1O+EmbPFHjNWgdN/enbZs/B4LQed5n4GyAVKMuvJ6Fm
	Bt8njr0ABgeiead+f88zaJYNJGYL1zoomgkVXcizA7/CykVgfzHnohNpSVjqOU/JcsJE
	8WAA==
X-Received: by 10.50.25.71 with SMTP id a7mr39716254igg.17.1406215579420; Thu,
	24 Jul 2014 08:26:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Thu, 24 Jul 2014 08:25:49 -0700 (PDT)
In-Reply-To: <53D09B99.2030301@windriver.com>
References: <53D09B99.2030301@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Jul 2014 08:25:49 -0700
Message-ID: <CAMKF1spOer0K3cq-XvzEDPoZ0U5-N9q2CLNU2s3_mfjrFwSZWw@mail.gmail.com>
To: Liu Jian <jian.liu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] archiver: delete the tail slash in directory name
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
X-List-Received-Date: Thu, 24 Jul 2014 15:26:25 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 23, 2014 at 10:37 PM, Liu Jian <jian.liu@windriver.com> wrote:
> local = fetch.localpath(url)
> + local = local.rstrip("/")

may be you could just do local = fetch.localpath(url).rstrip("/") in
the same line

