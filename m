Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 92C427C64E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Feb 2019 06:44:16 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id d17so6460604wre.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 22:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=4/93rojmaqsyk9hJX9l/XYaJAmNEBidasHFrjWQ06lo=;
	b=aBwrz2KNIz3qKfDISuGAo8ADlVTzQH005Z1+41iu1hQUhhHZzNiRqKnfMF6Jz7otO1
	cWmksvXaB4utQ1LY/hqdmUIMyJ6fguu+Lu1kCwvQyvrr4oKnt28aCbY/brNNWenHIQgn
	/vl6tzJqvqWNnOn0kpzUqUnHz2EcqpquZ+fNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=4/93rojmaqsyk9hJX9l/XYaJAmNEBidasHFrjWQ06lo=;
	b=C0AsZ1EuRR18kK7sFzdATdwIhiVAtFKyPOn28Dpk9KFi8qcFK8VlJAHcs9SxrZ9ex7
	E17XLf3QC80AjIE1QQD94+mewIeRpzQLMXu1yQHwlmyaYnTzcVI4i3FhyaU6/klSUz87
	6VpPvymIcpjhLfpjnZIX4s34j+fyA2X3pbI8sQaBb0aacDiGtWIK0SPFQ3AFMJGP2vfS
	Ncfx4IpuujL4W9koWZiYKmy1Pr7Z/BVOoi0WgMVf01n3eU44Yu+lGRv1ZRYMVxZyFk59
	XnbU77rcF/F6gsv2jhHa+5qWx4GiZ4gFDIMSiJgf9VtBZgx9PF5d2T+n2QPcSgd8z6bp
	DzKA==
X-Gm-Message-State: AHQUAub9hksj5WVSmAqqN0rcn/b4wPLS93D8KMwFKvsCE3qEUKduQ6Bo
	PNVTtNUby0foiNNC+xxa9iSdsQ==
X-Google-Smtp-Source: AHgI3IZx/J/j+PV4+H3kpTESH5nf0pz8plAO8SPpfSHBixEJgVk3TVTia3eknJVZfRq2M6GO2tl9Eg==
X-Received: by 2002:adf:fc49:: with SMTP id e9mr8941366wrs.2.1550990657073;
	Sat, 23 Feb 2019 22:44:17 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v196sm9091048wmf.15.2019.02.23.22.44.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 23 Feb 2019 22:44:16 -0800 (PST)
Message-ID: <fabce8c2aae9b6db6f3cf21c1161be2399a7b81a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, George McCollister
	<george.mccollister@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 24 Feb 2019 06:44:14 +0000
In-Reply-To: <a2e02826-1247-be96-6f62-0e5851b0c687@gmail.com>
References: <20190222165450.30773-1-george.mccollister@gmail.com>
	<CANNYZj-Fx7W5MKb8hp9F5mPC05fhxq1S56_F9-PDr38yK1ofVw@mail.gmail.com>
	<CAFSKS=M3WckCq3mwaMVWUoo6HaBOR1tBbMyYrg5nJw6=E_0XZQ@mail.gmail.com>
	<CANNYZj-dz6xKtuuOTVAKz-j-+w_qeQXrC_5PTG8cxNeJFs4ZDg@mail.gmail.com>
	<CAFSKS=O3B17J_5oOD6_xhKU7_obNcD4rVm3-zqP4tWQjEroiww@mail.gmail.com>
	<a2e02826-1247-be96-6f62-0e5851b0c687@gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: fix CVE-2019-6454
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
X-List-Received-Date: Sun, 24 Feb 2019 06:44:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-02-23 at 16:08 -0800, akuster808 wrote:
> George,
> 
> On 2/22/19 9:22 AM, George McCollister wrote:
> > I missed that some how.
> > 
> > Thanks for correcting me.
> 
> thanks for the patch. it should apply to Thud so it wont go to waste.

I was thinking of applying it to master until we get the upgrade which
helps with the backporting...

Cheers,

Richard


