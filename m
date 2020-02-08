Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 64FDE6089D
	for <openembedded-core@openembedded.org>;
	Sat,  8 Feb 2020 07:45:28 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t2so1511801wrr.1
	for <openembedded-core@openembedded.org>;
	Fri, 07 Feb 2020 23:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=H6mBjfAxhkWL1KEZImNUa1GgTiL+ApyajTb6M/yFFdA=;
	b=Fv1hGvoiH3Gu4fQjmoGTrHCw0XdN6zf0dvBmLBBn8w5KGm7lcPsnBlffaDr/7HM2/r
	O+pBig/IKvml31oYTzTWoCl/0j9sG3uMDQ0y2d6gDsVGewcW6GKCyluFCkWdHQbFFE4L
	fzK3UCGu0MSAgbvaq+NkuTvrRNwvV+QF+Eh7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=H6mBjfAxhkWL1KEZImNUa1GgTiL+ApyajTb6M/yFFdA=;
	b=PUe6sPFLo/xPXu8BWpbOceMYy8oW+CWTiTqnMmBhfaSewLlUESF7Z2q6pfzWbPR4/6
	UKzRpbvLMq54EbBkXWqk7XvHwU4gmTwLn8VCP8Q+jFiyPd7BmACxPknLMRnhjFWoioj3
	sxJub/ooY70AkDkeoVegl0q9jV5aqfIiIboldlHfdwBQBm8EiPRQ2WUljszjkijyR7Pe
	cr4NJ7Oc/bssb3Kb2YUhy9wM+4poQF4a+Z7xhq7OovNStU5ey/EbU00vG2fgmAoc9aVD
	HUb9IkUpuidFPR2PKpuOjm4G+8NOVsMhy/k5fRSJ5swTCMaZaafePtEMyQKoLDdIGcGd
	Z2Bg==
X-Gm-Message-State: APjAAAWV6C+xNwx82OjWAiRpC2Gber8SzffzN93MExWk2w7iVvNl+4+H
	JJxwoXo1NiuXuEdE2mi1AeWQN2Rr5Yw=
X-Google-Smtp-Source: APXvYqyTGl6LUXEbrrU5sUEkCC5SK7mBaM2pUHVCFesKE8OA1C2TjvtYggAvo3iTGI/G6RfU9YHgrA==
X-Received: by 2002:adf:ea4a:: with SMTP id j10mr3874966wrn.119.1581147928972; 
	Fri, 07 Feb 2020 23:45:28 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y139sm6573168wmd.24.2020.02.07.23.45.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 07 Feb 2020 23:45:28 -0800 (PST)
Message-ID: <bd2c5b87416b5d77d7b1405666a6a333be2fb135.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alistair Francis <alistair.francis@wdc.com>, 
	openembedded-core@openembedded.org
Date: Sat, 08 Feb 2020 07:45:27 +0000
In-Reply-To: <20200204184113.16070-1-alistair.francis@wdc.com>
References: <20200204184113.16070-1-alistair.francis@wdc.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] qemu: Upgrade to 4.2.0
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
X-List-Received-Date: Sat, 08 Feb 2020 07:45:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-02-04 at 10:41 -0800, Alistair Francis wrote:
> While we are upgrading let's refresh patches and remove the outdated
> patches.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

I think this stopped qemu running on the autobuilder, we saw many
versions of:

https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/1538

Failed to run qemu: qemu: can't parse 'vga' parameter: Invalid argument

Cheers,

Richard


