Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f43.google.com (mail-qa0-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id D888465D03
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 09:16:23 +0000 (UTC)
Received: by mail-qa0-f43.google.com with SMTP id w8so2570013qac.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 02:16:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1UEQHWkNM8Ht8U//En2cVUUZeHrPDVeeRVHVa0dBh5g=;
	b=bDGavWbtpKGWpeu3HMx8l5aWAvOXpSFZcdGtnc2O9fOh/eYool4XlYF1xO9nnC+gDK
	++4CTxEdH6WaSe7KSgi8b9465emQEbzonDND8nhUmGuYUWmCfmpazBP/47Kh1DCQnAxZ
	R2Wp13qskuGdx95qglYxADogNOHZlcEelEZOug2AnBc34mWpbRrbMI35knUZEeDlcLp0
	T0zq+85x6Sxqt3EAJAhDo7gbZ0MTwajArsoupYAuZ5es+zRnvbCYaWEzKH5JXe6crL8H
	Vr06Dey0poV6IW/djfVtjyyYVz4wzt/i5ZATdnNuRnWEIQP/9p8oxb6fiGt/VGZJlf5/
	ArhA==
X-Gm-Message-State: ALoCoQmmo/VubKOHfvzIw9hP9trCWnFtoetZC4a2B31OQTRjELfa7IgbLY1+NI07DRvEn9Pub2KS
X-Received: by 10.224.167.136 with SMTP id q8mr12502139qay.35.1406193383629;
	Thu, 24 Jul 2014 02:16:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Thu, 24 Jul 2014 02:16:02 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1407240509150.1086@localhost>
References: <alpine.LFD.2.11.1407240509150.1086@localhost>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Jul 2014 10:16:02 +0100
Message-ID: <CAJTo0LZOnTtA_mrFMMTR-TtXwUeQYSECQ2utjwzkNZdMWXCrtA@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Mention package_tar packaging in local.conf.sample
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
X-List-Received-Date: Thu, 24 Jul 2014 09:16:25 -0000
Content-Type: text/plain; charset=UTF-8

On 24 July 2014 10:10, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> +#  - 'package_tar' for tarball packages
> +# E.g.: PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk package_tar"

package_tar is pretty limited (no dependencies, so images don't work)
- is there a good reason to keep it around?  If we're going to delete
it, now is the time to do it...

Ross

