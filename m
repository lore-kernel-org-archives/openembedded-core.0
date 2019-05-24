Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id AC0D97E4BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 17:18:49 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id f8so10790371wrt.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 10:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=M0PUazTus7/WIpMJUT3njGfjaLUMtqjNyWPtxuY6/jo=;
	b=OZxPKBVQuh17QfrnDg8DWKoywusQWBXAl04kA4UoaJIbzZ3vafO++HDuqh4TFN5oFH
	GB2u8E+EnouiBI+mIco3y0L/O0WmAjylYeflceWByaJptUMBDp+d13tcXgTo9HLbmf5c
	3EVKKcgms3iC7pmLRC3+3jpxa0AWuy/WQCVXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=M0PUazTus7/WIpMJUT3njGfjaLUMtqjNyWPtxuY6/jo=;
	b=VHHANYr57LRz8vYK64PvoAiKK66+rCv4VYenjXOMBuH9iqgIQEefQ5QHVBZ8DadJFy
	1ErJuVGwo5G5NJN+KK31IgZzStaohfTZXh1Z7/3YQNISpAzqRgVHVl3wTrHgUBf0y7VQ
	R4mat40cBXvE4vzm2rkrVJqgLYzoo/ZO6XE+U5AUyU+NiqKo+rK5Osr1O2eBEgmN1GW/
	ekbBnwVSFqFzoLo/OIyto8g6yfwCsejXeSLbsIDXCZwJUeW6o9A6b3NWfN39YnrOJdAG
	qsxoxUIfYkOFlOQacz2KSaQBigLxfdiSvI4NaqsE0Ozo8lPEeqZsa3KkCceaF2n0y4P4
	oq5w==
X-Gm-Message-State: APjAAAWKa/3InnLlmz3KEfcyrUo2JA8vyZGG055+DUD0PVdF86G8h3MD
	F7Tw2SmDULO03HlQTDNIedjAzA==
X-Google-Smtp-Source: APXvYqxnBXFtSSDQjUtZPBMRx0/HCRQNMb8H/aP2k22aF0LTDBvJ3xF3J51WNQxIR+BR0nvF2KPKlQ==
X-Received: by 2002:adf:edc5:: with SMTP id v5mr40094122wro.257.1558718330347; 
	Fri, 24 May 2019 10:18:50 -0700 (PDT)
Received: from hex ([85.255.233.241]) by smtp.gmail.com with ESMTPSA id
	j123sm4873117wmb.32.2019.05.24.10.18.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 24 May 2019 10:18:49 -0700 (PDT)
Message-ID: <a59002825b793658afa2606f0d110d70a08e2384.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ming Liu <liu.ming50@gmail.com>, "Burton, Ross" <ross.burton@intel.com>,
	Tanu Kaskinen <tanuk@iki.fi>
Date: Fri, 24 May 2019 18:18:47 +0100
In-Reply-To: <CALatG=5SSBOa_TyQh8vY-iYshvp6+XHCS-Lg7tHCg_-qSay2YQ@mail.gmail.com>
References: <1558679856-10339-1-git-send-email-liu.ming50@gmail.com>
	<CAJTo0LbEXnKfSfOtpj3QVL9xsjsQJTuiZAGarPEFNz4v7q7_8w@mail.gmail.com>
	<CALatG=5SSBOa_TyQh8vY-iYshvp6+XHCS-Lg7tHCg_-qSay2YQ@mail.gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] alsa-utils: fix multilib names
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
X-List-Received-Date: Fri, 24 May 2019 17:18:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-05-24 at 15:19 +0200, Ming Liu wrote:
> Wouldn't that break the alsa-utils-scripts? Since ALSA_UTILS_PKGS is
> being depended by both alsa-utils and alsa-utils-scripts.
> 
> I did that in V1, but as Richard Purdie pointed out, it will break
> the alsa-utils-scripts build.

I was about to say we should refactor these recipes and create a common
inc file.

Looking at the justification in alsa-utils (avoid a bash dependency),
that is a runtime issue, not a build time one. We should merge these
recipes and ensure the packaging remains the same.

We can then avoid some of these problems, use PN and have a simpler
recipe. These changes should be done in multiple commits, one per
change as usual.

Is there any reason I'm missing not to do this?

Cheers,

Richard


