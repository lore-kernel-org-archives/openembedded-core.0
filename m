Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 14D677E6F2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 22:00:17 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id h19so13208381wme.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 15:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=2x0ytp/sUWT8GhgCPksZMLHkQWH5DGeIUSdOMy9XBCs=;
	b=P2CeoOCWJk31vHpk/4kyNVBQbSaAHF+kgfylHOV20CrMf5aYGYJOE2lC2bgyVOICfo
	R2u0BzseJw4kwbgJQaj79k+jsrWFv1IAKUW5/pFCC2dD5XkCLGdiH8lvGemBlxDaEANT
	vJUdhltMCawP1LfW/6pZsQF2Ak2X4a/t8TFYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=2x0ytp/sUWT8GhgCPksZMLHkQWH5DGeIUSdOMy9XBCs=;
	b=VBXkrLqjRATK38eEslA2S6/g5rC4hMoLQKKzbPm1JC0ypfXkitfvTs1QQciTxcNQ2n
	n+VqW2Lusm2K5GuV5jabIjC2mBearJc01JS3Fdogg5F3JehjVBLE2r5zOEp+AwsyHTav
	N/FY+UQsXCW6ULlG8eE2ux0ULg7sYz+WppLW8anObnJTxQuUA50VPGkxtEN+AgjTtICh
	eVOmlF/v7+ZibDNWN8VHpYT/zR9BqVJINlS1HOPMFqf9/vy8jrYjeudkSRUzaN6Kqlzk
	QeMAC6r5eoMI+n6JlYWdjo884XWybLTR9Ci2yPtedRUfxbNAw2R6yA9MYbbReYhKK4Mp
	VWxw==
X-Gm-Message-State: APjAAAURaFpl23HcRzhGdQcR3RWwfZT0cmPsMS1wpSWC16UCKBftzCUP
	/v7IhibSqaOZlC/tk+Mt6rcOyA==
X-Google-Smtp-Source: APXvYqx1/9yz99YoH6P2ojKboUp5kwggRSLnmWNCgcE53/T/ZeAn4XosQ5aJmt23XJjwVddI673Dcg==
X-Received: by 2002:a1c:cf0b:: with SMTP id f11mr15104282wmg.138.1561932018561;
	Sun, 30 Jun 2019 15:00:18 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g25sm7021897wmk.39.2019.06.30.15.00.17
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 30 Jun 2019 15:00:17 -0700 (PDT)
Message-ID: <ed1f167e12e6cc6f1031c2de0a5c6e439a7b6e49.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>, openembedded-core@lists.openembedded.org
Date: Sun, 30 Jun 2019 23:00:17 +0100
In-Reply-To: <20190625131625.15658-1-mac@mcrowe.com>
References: <20190625131625.15658-1-mac@mcrowe.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] bitbake.conf: Stop exporting TARGET_ flags variables
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
X-List-Received-Date: Sun, 30 Jun 2019 22:00:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-06-25 at 14:16 +0100, Mike Crowe wrote:
> Way back in
> http://lists.openembedded.org/pipermail/openembedded-core/2014-April/210138.html
> a few of us discussed not exporting TARGET_LDFLAGS. There seemed to be
> support for this idea, and I modified our tree to not do so. I then seem to
> have dropped the ball. :( We've been running like that for over five years,
> and not observed any problems.
> 
> It seems sensible to stop exporting TARGET_CPPFLAGS, TARGET_CFLAGS and
> TARGET_CXXFLAGS too.
> 
> I've successfully compile-tested core-image-minimal and core-image-sato for
> x86_64 and qemuarm64 with these changes.

FWIW I'm really happy to see this!

Cheers,

Richard


