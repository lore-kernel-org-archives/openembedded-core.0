Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 07911777E7
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Mar 2017 00:55:25 +0000 (UTC)
Received: by mail-vk0-f49.google.com with SMTP id x75so20631078vke.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Mar 2017 16:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1YZQrp6QgQJa32TlEx5k1Yk3wLWfYsreeIBnEvYrZHI=;
	b=mgOTJJJbUiycqtgecO/fdg0qDwRn/d1dBWm7AuFtw1F3mMB9fNMDbAtZoyaq2HTK3s
	h0Jj9cg9+dWO2PFcaDpe2aEnFO+j1GrANR/UK+AiIJSOVX/e7k8YWF/9G/q0SlLcLfZJ
	1ihjGMYLXHMb49gykTrRqKmX4pk7UZfzu6XXpi6VEQOm4wUCDmz5uaRlE7ic21z7Af/w
	P86ejV0raKVZa10FQBvVdg6E0LMyMBuOk4vMdHeFZNeEhXcjpw7/mN50ZfxIHy7IflC1
	xe350O4ehI4CyPV8Bu+N+Ylv57A6ttf7310k0mL7k630R8g/ovyLJfGndI+2t0RM53fL
	FKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1YZQrp6QgQJa32TlEx5k1Yk3wLWfYsreeIBnEvYrZHI=;
	b=Zj1fo+WLYrCej521Gm1+6euLoQmLikJU2sqiK5VKx9Hj840RqIFHAAyWounV4qSJWM
	rEDDJ92oafX7Rgsq1Z11DT//dbFGSIqey/r8zO6LquLpjNIzvr7tO+zUj+rN6p87nAw4
	N+YHH9bV6SYrUkJu/Eqk0sbvYdn/3yu448AxRpchU1RJoy9uC6zbAklHHwDyxYQrD7Lu
	+VbADVmswfbTtDa3Y30/RYTcZvhPn11dGSbJfWo6XruFCw+vl39ZRJO2VRn1W37ngedH
	Ty6SDtGhzAVoL4+//zHroA4/EfHlhJ7gxFPaafx6szUynpAwlPu0vLreZB1+nbFZxJ42
	naqg==
X-Gm-Message-State: AMke39mubo4nOUxV6hI6ys8i6tbdfvgo0Y3NbzwnP5Qb+q72ZRxv+fTB3IXTIM/u2uS1MjRSIN6YQ5wwz7Mq+A==
X-Received: by 10.31.3.83 with SMTP id 80mr3347159vkd.64.1488675326537; Sat,
	04 Mar 2017 16:55:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.71.65 with HTTP; Sat, 4 Mar 2017 16:55:25 -0800 (PST)
In-Reply-To: <1487009117.27753.14.camel@linuxfoundation.org>
References: <CALbNGRSgxbz1F2YLzQ-F2Fn+01hiA4LAoDgQuQ-qLg9KMVTHAw@mail.gmail.com>
	<CALbNGRR1+yVyMC1O1G1mCYp8e87Q2kucGEgs-dL0P3KHxi8WCQ@mail.gmail.com>
	<CA+chaQcHBzDJ4UbW1NCex70T56PL02+agOZBMoK4=Q1WWSm2EA@mail.gmail.com>
	<1486999455.13854.241.camel@intel.com>
	<CALbNGRQns-G9XOtS8wGetnAAYVv7Z+F+2h3rLQ2XxgSiSBwHWQ@mail.gmail.com>
	<1487009117.27753.14.camel@linuxfoundation.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Sun, 5 Mar 2017 01:55:25 +0100
Message-ID: <CALbNGRTHovM4qdU=7_+uypZpwTGSvBES0iXz1irCo_QnSQ6zEw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Does recipe specific sysrooot (or whatelse in current oe) break native dependencies?
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
X-List-Received-Date: Sun, 05 Mar 2017 00:55:26 -0000
X-Groupsio-MsgNum: 94255
Content-Type: multipart/mixed; boundary=001a1142881c069b650549f13c03

--001a1142881c069b650549f13c03
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 13, 2017 at 7:05 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> To be clear, you can't depend on the build dependencies of some other
> recipe to be available to your recipe just because you DEPEND on it.
Sorry me again - but is it possible that this behavior has changed?
With recent oe-core I see

* many configure logs finding pkg-config from recipe-sysroot-native
although the recipes do not inherit pkgconfig and do not have
pkgconfig-native in depends
* adding cmake to inherit adds "bzip2-replacement-native expat-native
xz-native zlib-native curl-native" to
recipe-sysroot-recipe-sysroot-native/sysroot-providers.

I reduced the recipe I was currently working on to no dependencies and
inherit cmake only (for test attached).

Can somebody tell me what was changed or what I am missing?

Andreas

--001a1142881c069b650549f13c03
Content-Type: application/octet-stream; name="supertuxkart_0.9.2.bb"
Content-Disposition: attachment; filename="supertuxkart_0.9.2.bb"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_izvysfqp0

TElDRU5TRSA9ICJHUEx2MiAmIEdQTHYzKyAiCkxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NP
UFlJTkc7bWQ1PWE3MWNiNzg2NTlkNjBmMmNlZDU4YTU5NGNiNjViZmJhIgoKaW5oZXJpdCBjbWFr
ZQoKUyA9ICIke1dPUktESVJ9L3N1cGVydHV4a2FydC0ke1BWfSIKClNSQ19VUkkgPSAiaHR0cDov
L3NvdXJjZWZvcmdlLm5ldC9wcm9qZWN0cy9zdXBlcnR1eGthcnQvZmlsZXMvU3VwZXJUdXhLYXJ0
LyR7UFZ9L3N1cGVydHV4a2FydC0ke1BWfS1zcmMudGFyLnh6O3Byb3RvY29sPWh0dHBzIgoKU1JD
X1VSSVttZDVzdW1dID0gImYxZjUwODFmZDQxYjhlZWIzMTBiNGVkYzA3YjllZTEyIgpTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMGIwODBiYjA5OGEyNmFkYjU1MmQ2ZmQ0ODkwNWJjYjZiMWU4NzNlZjE1
Njc0NTdkNzI2OGQ3ZDNhYWE0ODI4MiIK

--001a1142881c069b650549f13c03--
