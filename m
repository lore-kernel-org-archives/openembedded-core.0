Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id AFD606FC68
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Oct 2014 09:07:03 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id m20so3585751qcx.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Oct 2014 02:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=kG9+cJfFBtDnvaFk8+dwHF3tdMh5LRvYJREBsnOuj9Q=;
	b=BAE2c1XGe4yLapaf6WnZjhvAXXACLLau7VUdnEElJKRKfUhzPt5BvTwgNnYp2tbMYi
	lIXg4WjYmmh1B94lG4ZYUEam4W+TOqq95r7MjDIX54rf8bRx5ueixQ8G1ub0C8LRn3Tx
	eotGiqwbtlKHkJ5qEGITvIRkR+oAigIycc4USsJJsCa6dmp2HKfD6QY4L1/MBhgK1q7v
	jDf/MdFdZjgEkNSUdh3rOe8fir4X5FmtNrWhV3pMkqrigCfn8pA98heEUWiDyfhR3wLi
	WSiObtT0LfBLWIleHdzSLFzjVWap3YEJWPXUbvzXk096MT5iHt8sVEku1PdUEBguOGwi
	cnkQ==
X-Gm-Message-State: ALoCoQkK8PZrOb5Wrvw3VEOsiOArXOMNMHEAChPzcUV0LIChp2kqLxGszXCT9dxL2kYOCqRG4Qbv
X-Received: by 10.140.27.239 with SMTP id 102mr25241962qgx.59.1412586424282;
	Mon, 06 Oct 2014 02:07:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Mon, 6 Oct 2014 02:06:44 -0700 (PDT)
In-Reply-To: <1412550979-15317-1-git-send-email-raj.khem@gmail.com>
References: <1412550979-15317-1-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Oct 2014 10:06:44 +0100
Message-ID: <CAJTo0LYakD7wSHpGMwEYnz_v2xoBv-hiD9zXmHLP72VrVT0oKg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH] gnome-desktop-testing: Fix build on uclibc
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
X-List-Received-Date: Mon, 06 Oct 2014 09:07:10 -0000
Content-Type: text/plain; charset=UTF-8

On 6 October 2014 00:16, Khem Raj <raj.khem@gmail.com> wrote:
> +From b1de2c6290bc0651fe87a8c4fb52e7a0a5fe6322 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 5 Oct 2014 16:01:49 -0700
> +Subject: [PATCH] gsystem-subprocess.c: Enable GNU extensions in system  C
> + library
> +
> +This should export O_CLOEXEC where it is only
> +available when _GNU_SOURCE is defined .e.g. uclibc based systems
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending

Shouldn't this be in master before backporting to daisy?

Ross

