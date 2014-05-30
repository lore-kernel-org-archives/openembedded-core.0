Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 47F526FD5E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 12:23:00 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id j5so5066249qga.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 05:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ayjz7hx1TlrV1DtEe3WZ+3UUXFcTnM3MM0wZ5RprkQA=;
	b=DwkqIfBisk7/7FBUl35ZEQXtLiGl+q1c0ZGUyB3j3++TvuCIu8yxfOe27Wv2unxsd4
	N/vXmz5w1/1GsA7SDAjIa10Lh/D2oJcmR1hoRQTyf5g4YZJBMmi7NYYk/qMtYaeo7Q6z
	Mm9j6Gdol3hX79xQhxW5Se5HzqRRv9EGD57Xei1Sc16uDeHGwPGMJFYGgjGwGDZU4xVo
	qU+y8rBdk15dgFnDnDBifAPaN2eqkqkz98BDky2aoP+A/L1PA201oouJdYPXwGEqVUfP
	Q+day03JcxE5S1YuvMCSvmtbc01MGb+O/YC8pqr7o6lk4TUicnd23C1F0LltGVk7zY1L
	+E9w==
X-Gm-Message-State: ALoCoQkTOpOjrIUsqVfN2pXVMA+qJlYlZNwlO5gDqu2jTHzktmA31rDMQElx8AwbdT1SdHUD3l2m
X-Received: by 10.140.48.161 with SMTP id o30mr19711393qga.68.1401452581417;
	Fri, 30 May 2014 05:23:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Fri, 30 May 2014 05:22:40 -0700 (PDT)
In-Reply-To: <5387E8C0.3090300@windriver.com>
References: <cover.1401354584.git.Chong.Lu@windriver.com>
	<e6a039546ac6da09a55950978189b3bc3b75fb8d.1401354584.git.Chong.Lu@windriver.com>
	<CAJTo0LZWqFB89AhgZtGOLmHGaZ-N=SVxLORsq-gK_Qhnfpib5w@mail.gmail.com>
	<5387E8C0.3090300@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 30 May 2014 13:22:40 +0100
Message-ID: <CAJTo0LZH5E0bbLTGwA8dXS8nWPPSZf6qu=9Xvc_O2C+FzY2P6Q@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] nfs-utils: use cross toolchain to compile testlk
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
X-List-Received-Date: Fri, 30 May 2014 12:23:06 -0000
Content-Type: text/plain; charset=UTF-8

On 30 May 2014 03:11, Chong Lu <Chong.Lu@windriver.com> wrote:
> I remove "CC=$(CC_FOR_BUILD)" in order to inherit compiler.
> Do you mean that I should reset CFLAGS in makefile rather than inherit
> compiler?
> If I reset CFLAGS, this makefile will use host compiler.
> Moreover, testlk can't execute in target.

I just had a proper look and it *should* be working as they're also
overriding CFLAGS.  Then again this is a test program that isn't
installed so instead of changing the makefile, why not just stop
recursing into testlock?

Ross

