Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 86FD575470
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 09:41:29 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id v8-v6so41404698oie.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 02:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MErYWBeTvkLZ2GmY5MMIvY9e1Kv6DxBLE42Eg5wOmLU=;
	b=d8R5jMuSFR2jA5hB75rmacxTk0pJkPldkeGpUCLUg495IG2edgoNU/bURBNZinnnGW
	BqHSzH2NXivMoOdBqxekpOkzGu992gRjj4l9i6hAXLGyX0WIEQJR6Lp9N8lAkJq6mIQS
	I2LXuWHRAQiYHWR0OSMwCARV38MypDsZY+GXv8vIHVktRP/LfvNGMwl06STYAuqygbhF
	MItpdgyqSSfuuYEzJV4amRZRXgF7/kz/VJPMZ5Rea6+xRVcGnpOq0J1qB+/I+9PBYHaX
	V0kYM3RW7sijsKx7mCAdpi8JMcncnylnuNlVZp99pZl2invwNQlm560vOh7cnAeKLfZW
	GSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MErYWBeTvkLZ2GmY5MMIvY9e1Kv6DxBLE42Eg5wOmLU=;
	b=fjilAiBka6lXFZ7iNFLav89Z4qAzfQ0QgCU33VzpjW4FZz5f6SdcIedN+VIA0vo6h1
	TuJsVghM/ZTldzZUVFtoJdQqCfn1ja85OiBh5+hnfMqJ4yatwPbnAZr608ArNkiNp5RE
	XI7frYp+nRC6Am0ENkaqDMIIFugvxZeRmKJpbZC0ly2RtJ4yMkcHlMDdI8KCvoITKoXs
	oONYZO30rGG8mWTX5goIn2HG+6N3ZpvffFgIbDtVqurf/iW69lZ3azOEYN0Y9ODp43km
	g9UNl7Ha7G2oVnQ9eudIB6hZxtJVoxBsq3legNFAIiqsRNTgtl3kxej139xQonqizI1q
	Jsmw==
X-Gm-Message-State: APt69E1w1iiR/gYk3q+oFL7L3lZmR+uXReh4UiEa3InP46i4PsNUinvC
	fnS365HeL7FfTQ7YIUwN5Tu8qBYLwfRqmyV6e+GAIA==
X-Google-Smtp-Source: AAOMgpcjc+7S5xrVmBFv8HSx0E+ZdH3WR00yoZorVgh73yz1hQdCghEH6Mx/Fa+V4qS790SA0fidbkhzHqe1HgSvRvo=
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr28497883oih.102.1531215690705; 
	Tue, 10 Jul 2018 02:41:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Tue, 10 Jul 2018 02:41:10
	-0700 (PDT)
In-Reply-To: <20180710080702.20527-1-Martin.Jansa@gmail.com>
References: <20180710080702.20527-1-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Jul 2018 10:41:10 +0100
Message-ID: <CAJTo0LafAv3Qk0EDWnunng1fq4OENz2DhiOjth19hGNJ__Rh-Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libdrm: Add PACKAGECONFIG support for all meson options
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
X-List-Received-Date: Tue, 10 Jul 2018 09:41:29 -0000
Content-Type: text/plain; charset="UTF-8"

On 10 July 2018 at 09:07, Martin Jansa <martin.jansa@gmail.com> wrote:
> * Use the same defaults as meson does, with few modifications based on
>   previous EXTRA_OEMESON
> * move libpciaccess dependency to new intel PACKAGECONFIG
> * add dependency on util-macros which was previously pulled by
>   libpciaccess, because it's still needed even with intel disabled:
>   | configure.ac:34: error: must install xorg-macros 1.12 or later
>     before running autoconf/autogen

Why is configure giving you an error message when Meson is being used?

Ross

