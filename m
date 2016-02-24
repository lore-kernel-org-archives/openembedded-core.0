Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6D9B277303
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 15:37:58 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id z135so46824129iof.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 07:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=vb03jQqM5cLuid1+HM/osWiWwWru/WlnQ+RgEHsf7eY=;
	b=LNkBGhPpasVJCGIJI4IufunOv9HK38W8WZenl2h0V0BBaTaFL/yJsal5qar6e7HzoE
	d1la8ZSwDtixyymmktD0W87OFDtPBipjeUfgNej0gIHy+/KPxDlVSPI7Q1jIpQC6DmyV
	mnjDHVr045ALT/zxOj0zBU5V0ZMhyVn/+JWZCvQu8KQzciIxvUc2EMlNsXJ0cx4p9mBD
	vt8NEDqKUN4cty5DUAs3uFY0MWuWT5sITkuJahJpuEUlDBzCyMWyPO3qEers0wWpPw24
	mbEKk6rf0FIzoJ/NngyKZB9IcMu8W85Hp3npJ0jYaWQGS7NNiNkZhzhOBOznJh2Yortg
	KE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=vb03jQqM5cLuid1+HM/osWiWwWru/WlnQ+RgEHsf7eY=;
	b=VCHGkyKEn91EBvo024wvDCulNT5TlDt9LOz6hTTBA7QPxvobfZeFhibn8q/llAAiM9
	l73NEqu5AX8eV7mSNmpQLgC4MCnJG0HWilpOtkuFhwh4nTSyjSI/helmI7MmwkczYcNz
	8CoqLvYPo/UICueyQMIw48mI3H0jn6O5ewNX1h7ZvfsymlDHA/rJRPH5N/hbJt6ZqsyJ
	OSclEzDhe4ANBDUJ9tXpfgzB2yvhYVRCbRvxhUCP5fuBbIxqqOE320maTWBUTxIYUDLD
	FZp6Z21vlSv5Z9kx9VXG3HzSfN7vir0TqsD/lFsdD1t49CuHPbW2jl6rrTLRpTeAQZKb
	4Htw==
X-Gm-Message-State: AG10YOQtgk4SalUHX/G5Xz2TzsydC23WP6qYH5gDnBKX7NoSfpo+U64Qqid+W2M7vAHL4jI3
X-Received: by 10.50.132.74 with SMTP id os10mr23487607igb.91.1456328278839;
	Wed, 24 Feb 2016 07:37:58 -0800 (PST)
Received: from pohly-mobl1 (p5DE8D62C.dip0.t-ipconnect.de. [93.232.214.44])
	by smtp.gmail.com with ESMTPSA id
	b101sm1454808iod.43.2016.02.24.07.37.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Feb 2016 07:37:58 -0800 (PST)
Message-ID: <1456328275.30039.49.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Joshua Lock <joshua.g.lock@intel.com>
Date: Wed, 24 Feb 2016 16:37:55 +0100
In-Reply-To: <cover.1456325292.git.joshua.g.lock@intel.com>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/10] Integrate swupd software updater
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
X-List-Received-Date: Wed, 24 Feb 2016 15:37:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello!

I haven't had a chance to play with the actual code yet and I don't know
yet when I'll be able to. Let me ask for some clarifications about the
approach first anyway.

On Wed, 2016-02-24 at 14:52 +0000, Joshua Lock wrote:
> Approach:
> An image that inherits the swupd-image bbclass will automatically have bundle
> 'chroots' created which contain the filesystem contents of the specified
> bundles, with the contents of the inheriting image forming the default os-core
> bundle.
> 
> The mechanism to achieve this is that several virtual image recipes are created
> using the swupdbundle class, one for each defined bundle plus a 'mega' image
> recipe. The 'mega' image contains the base image plus the contents of all of the
> bundles, whilst bundle images contain only the base image plus the contents of a
> single bundle.

Just to be sure, the actual "content" (a term that is a bit too
overloaded to be used precisely in all cases) of a file and its meta
attributes will come from the mega image, and the virtual image recipes,
including the base image, are merely used to generate file lists?

What is the content of the actual image that gets created? It has to
match the content (= file content and meta information) of the mega
image and not of the base image, otherwise there can be inconsistencies
between the actual running image and the core os bundle. I suppose swupd
will be able to fix that, but I'm not sure.

It sounds like this bundle creation is completely separated from the
regular image creation; if so, then I suspect that this may have to
change.

> We took the approach of building images, rather than populating the chroot-like
> bundle directories with a package manager, because various layers and recipes
> make changes to the rootfs contents outside of the package manager, particularly
> with IMAGE_POSTPROCESS_COMMAND, etc.

Makes sense to me.

Have you considered generating the file lists more efficiently? I can
think of some alternatives, but all have downsides.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




