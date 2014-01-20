Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id CDA256DCFF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 11:22:35 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id hq11so2829739vcb.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 03:22:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=r9Yaap2nO+DvVRRIMif3QcCV/mS2llm4A007Io6bma8=;
	b=d0tzX6pEF5Xu+whDQfhqv2klPAOkLFUgwCG76MuDtgadETfbpjLYa8WL+l5sgexjXM
	mp4cBAcN+au4qudh39gbZOnXuu6DuIeZvHH9k8VCX7F2NcZ0f7+lCYiayUSZRzBTKgnb
	X80XUF4Tg+lrLmWaq7CaFBTb+D70+xo7aam+2WyzkJtrnjDQbGMKh0qwCsQhjJE/6Jm6
	34/LuQmHYrF6GpBWoLeF6p6tVtSt/RHqfqfTwoHbEwTH+0EHoNJ5yjyFjez2E4KN+S/5
	VpWOhlR+3msflMF6HIacTuhXmjaKwlZR1PxOPl/5C5XWsjumR0xUbLkMZeYwH9d7TuaN
	E2oQ==
X-Gm-Message-State: ALoCoQkn/1wUCYzcMOIHhq+E8GPEA8+ZUKgkGXKzPCuGZuqMCIOlt6B9fIWhHSRhuycFbiMt1p9L
X-Received: by 10.220.95.139 with SMTP id d11mr1166380vcn.21.1390216956349;
	Mon, 20 Jan 2014 03:22:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.96.84 with HTTP; Mon, 20 Jan 2014 03:22:16 -0800 (PST)
In-Reply-To: <CAGNsrLDtL6M-9Hoo6ghnpLRy+WUC0qh0vDempsiATmEP_tw6oQ@mail.gmail.com>
References: <1389995824-9066-1-git-send-email-fathi.boudra@linaro.org>
	<1389995824-9066-8-git-send-email-fathi.boudra@linaro.org>
	<CAJTo0LbwPOUWdwoToz5KGzNDNO0E6EyPgO_fzvE4Np-EWC92fg@mail.gmail.com>
	<CAGNsrLDtL6M-9Hoo6ghnpLRy+WUC0qh0vDempsiATmEP_tw6oQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Jan 2014 11:22:16 +0000
Message-ID: <CAJTo0LYi2d6HZvbqdu9uyZDzks3ww8rm=t+Z=gc=KEVrU9Trrg@mail.gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] Fix ffsb ftbfs on arm64 and cross-compiled environment
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
X-List-Received-Date: Mon, 20 Jan 2014 11:22:37 -0000
Content-Type: text/plain; charset=UTF-8

On 20 January 2014 11:19, Fathi Boudra <fathi.boudra@linaro.org> wrote:
> right, we don't need to patch config.sub/guess anymore since I added
> do_configure_prepend() later on to run autoreconf -vfi.

So drop this patch from the series, we don't need to see your in-progress work.

Ross

