Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id F11066BE78
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 16:24:11 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id ib11so1349384vcb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2013 09:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+JywKFgmEGPWNPgz6yS2N3emWDWgfiRto4Vd4GizZ6E=;
	b=fW1dFksXwvhwgmTD1+KZhKwLAwsaYZglTIluiLStDxXJv6h8xslTyHbDHXn08IQMDI
	1wi9r2t4d9SQl7RDdtaJizJ0oRQT2UjV9ZQrRsfAKOics8KV2BHqiUgWTdKc5oqKH+iF
	SvLkzg6wacGI5+xrNMVTgeGLIBlWC/igrQUbWd+ovADzj8eFFTM5fcPEH7+RlepyxlsG
	6/gzs7u1o7oI61Fgxa/699uxBMJ5N9BVQvnJw8eX/1ZrSRcrNSkMbP7HHhDG27v7h83W
	OGxwEJ3y/LV9Hw9Uf5L/Cg5iacY+I5Wsi4XyUf1MNes+cXMjfWQuTUMkZ4tsrgk+jnL+
	8zdw==
X-Gm-Message-State: ALoCoQmnEP92906Y49kCbN8yXEQtcR4Bx1++mx/uZ5wj4GE8QC5fscP8wOroxqDYA+kbFdaO7GyS
X-Received: by 10.52.119.139 with SMTP id ku11mr650659vdb.42.1378398253481;
	Thu, 05 Sep 2013 09:24:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 5 Sep 2013 09:23:53 -0700 (PDT)
In-Reply-To: <1378395125.32427.78.camel@ted>
References: <cover.1378339881.git.dvhart@linux.intel.com>
	<7e9270b1c56aeeb6ed22210cab98d2675b092d5d.1378339881.git.dvhart@linux.intel.com>
	<CAJTo0La0W7PXkuBsvqD2XqPMMbbLtmJef5T97sikSJogZ1XCiQ@mail.gmail.com>
	<CAP9ODKqVU+ka+VzjPj6p0iVsirrOSqLtDFWNzfBcKutwj1Fo3Q@mail.gmail.com>
	<CAJTo0Labk000SpLOiM8gtuSu2pwK0jsgU9osO60GEFntThxSeA@mail.gmail.com>
	<1378383289.32427.63.camel@ted>
	<1378383839.6940.83.camel@phil-desktop.brightsign>
	<1378395125.32427.78.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Sep 2013 17:23:53 +0100
Message-ID: <CAJTo0LZozjJdqonXNqv1L1yL58YzsK11Z6xbio0YYo-gfTAEvw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Darren Hart <dvhart@linux.intel.com>, Poky <poky@yoctoproject.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] xorg-driver-common: Add configure and install appends from meta-intel
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
X-List-Received-Date: Thu, 05 Sep 2013 16:24:12 -0000
Content-Type: text/plain; charset=UTF-8

On 5 September 2013 16:32, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I guess the .la files just don't seem to be a big issue that some people
> seem to paint them as. Why do we need to remove them and deviate from
> the upstream?

You appear to be defending choices made by libtool upstream here.  Are
you unwell? :)

> Anyhow, if someone can show some world builds with and without the .la
> files and see what build history shows we'd be closer to taking a patch
> to turning them off. If we do it, we'll have to do it everywhere for
> everything since the remaining code will bitrot badly IMO otherwise.

I'll try and hack something up this week as a proof of concept.

Ross

