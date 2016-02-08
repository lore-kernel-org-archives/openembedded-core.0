Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4DCDC73197
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 19:57:59 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id s68so62663714qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 11:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=R7+6Lw6qHw09CHy8Q2BiXGiCI1okYdI5YPGWFHHq1K0=;
	b=wsU4gF5zViDEwyz17SG4X28UxfqcEikh6v+xty9U5cxvlFIsxSpGz6WQPIaqOy42vc
	oHIkv9AzaZdBlhSKEqN84sz1RGvyHx6m/U+Z3jXgAAUnoE7+3PlkGXgJYIcUwzjT4OnO
	ZDZbiQe3fjGcwC3BrF/7PLxzMPnQS+GAYX9R4OIx9U1d6HHE14rJnsAM0KwXa44Oqd+c
	9LnywzFVQIWRMVQRfnFY3qvC/ExsDDl+vn1svS3SJo/G1g/xF/MkgoJbBw3FimrE50N/
	7eLomPLFWk7JlRgkYruO2WmpBUTPuwH+d3ppIan4bV6SApqMELE1WfEpdSDiKJPRTptW
	aF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=R7+6Lw6qHw09CHy8Q2BiXGiCI1okYdI5YPGWFHHq1K0=;
	b=EnA9cTcqB4p0rO6G2qdtpjA0tXTj697hoiUjvRNPp/Gaa9QtLnBmcyETQDWyN51Z0f
	META3i63v/wqgDXLL0SCB6iaaN/HykeR0oC7ZYEfC8Ui5Q5acimq/graim3bEqFRvLlH
	i5KbLWgmom/k5DksX4jPsmySGRE47K210oq0OcuIyHgcUYPPpVJhkPILF+LRmfJRnYVt
	haK6Py5a9AIjKqcQBrX1MkWIsYqtiFqegLkSAbi+WtxBTNdBOmi/+G+A+SP3Zw3tsOyQ
	S+AOz1rPh/tg/2F+TmnHX4WnBv8oeZJv8izO+Kf2m54NJ+N+DKp9p6/hP6sEyL9e73c0
	Lg9A==
X-Gm-Message-State: AG10YOQbZE6pfaRVWJ+cCuDXLXMAjTGLi3PlLXsdb8lGP5Gxukevr89yq4zP593HqOWVzO6WhPzJvthLxrTjMQ==
X-Received: by 10.55.78.70 with SMTP id c67mr36173346qkb.37.1454961480225;
	Mon, 08 Feb 2016 11:58:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Mon, 8 Feb 2016 11:57:30 -0800 (PST)
In-Reply-To: <CAJ86T=UvphArYq85qN1yNsCeCtbr_AaapGoZmhprS7cCU3FM0Q@mail.gmail.com>
References: <CAJ86T=UvphArYq85qN1yNsCeCtbr_AaapGoZmhprS7cCU3FM0Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Feb 2016 11:57:30 -0800
Message-ID: <CAMKF1sqdRHprniyiaiUNrghVwZ4tY=hn7gEHwf1g2fxi3SWEtA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: TARGET_CFLAGS for non-target builds
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
X-List-Received-Date: Mon, 08 Feb 2016 19:58:00 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 8, 2016 at 11:52 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Although I don't see it on the mailing list, oe-core master now
> contains the following patch:
>
>   http://git.openembedded.org/openembedded-core/commit/?id=ff2c8af73046f55aa733ce8289b6236c88300290
>
> Is this necessary? Aren't TARGET_CFLAGS by definition only used for the target?

when doing native class TARGET_FLAGS are mutated to represent build
flags but it still is TARGET_FLAGS
and when you append to it then the flags go into your
native/cross/nativesdk builds as well. Not something you
are looking for.

> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

