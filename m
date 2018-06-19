Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id C6C8075045
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 10:00:09 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id h6-v6so21906792otj.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 03:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9vLcT04Gl2kpcUwg1BGuRFDg/zSY/sTi+e9jgLqI01U=;
	b=wwwBx7O61zGqEMqrTkyUz+6ue5Ur29933NZmTF5sDpN60bccRFpCf/cNIiXq9VAUM9
	r9HNDGEbMn29ZrbesQEc8qMi+KWmBOK6UKyrvh4qquaNR8NuKMVCUbesRn1MDizBL96A
	aCe9udRSotrg7DzgXHpXWXlmPAWi2jl/12PEXsAeCGrkI0EY/FzLWJD6Fn8eP0FnM0wz
	eCa7bY17nzLIOk2XeGhO30r9AyLtKuczcU5BvD/tSfgbfUFwrngBRjEY03dFrlu26P8P
	UN2gWlbOR2Kg2pG3FX1yA79aSMjd5+wLRwBcEnZ7w5iGVd/yXj98HLsLv6ufetHB9oSN
	3U6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9vLcT04Gl2kpcUwg1BGuRFDg/zSY/sTi+e9jgLqI01U=;
	b=UnGwcz+tKe2RmE6f1/PIaYo9wzDBx0SQBLmhHu+wcUXIy2zlHFkt42wxYkr7VUAF5t
	mNaF9ymwnlOTom5FHjd5HFMY0ElSeOOmVyeiP4BEZMv9o7nUVD7hP9hCkcM0DJKiQf+s
	esPkoAhDaAmIHPdBt3UdFca36RGSNn+fTTFdrqps1b8QGmw0wYfLpGv+pa1gvnywItmG
	36FBBpRBykt+bDrDYVUDGxlqUwjB827prX9Ti+iCaTuIFnxAGpevA+SltM5RSItucQNJ
	y4ribjpGpqyYb06wnsHZjhf88+Yd2XzOx8Ek+uLTbi3RU0+K4g5S/OHeO652lEwvWZwa
	K9jA==
X-Gm-Message-State: APt69E1KOMa+7envn6UVhIrS2TpZ5zr8bG/Is8c38Gtvz/CM3G1259dh
	cMD6tNXSzjoJUMszi0cdvVNHsFWhngpU0LjBmUzIrg==
X-Google-Smtp-Source: ADUXVKJIfaKAg/g7lKfOXzFMzEzSydMNmyu/680yLYR3LsqS1L1FNMBVJ7KNGNC4UhgBqGo2xTEMHKxCDArSjF+9Vjw=
X-Received: by 2002:a9d:307:: with SMTP id 7-v6mr10725981otv.300.1529402410882;
	Tue, 19 Jun 2018 03:00:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Tue, 19 Jun 2018 02:59:50
	-0700 (PDT)
In-Reply-To: <32602a82-f07d-3c69-2305-3f0f17f4c9dc@windriver.com>
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
	<20180504123244.43049-12-alexander.kanavin@linux.intel.com>
	<32602a82-f07d-3c69-2305-3f0f17f4c9dc@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Jun 2018 10:59:50 +0100
Message-ID: <CAJTo0La2eicsFUCAPOktYs110iFdOrFWNzLXC+EeeRrDzBHtNQ@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/14] meson: update to 0.46.0 -- broke systemd on qemuppc
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
X-List-Received-Date: Tue, 19 Jun 2018 10:00:09 -0000
Content-Type: text/plain; charset="UTF-8"

On 19 June 2018 at 06:03, Randy MacLeod <randy.macleod@windriver.com> wrote:
> It seems that this meson update broke systemd on qemuppc.
> I'll look into it a more tomorrow but below is what I know so far.
> It looks like the libsystemd-shared.so size increased by 18% despite
> the build flags being the same!
>
> Despite my IRC handle, I'm a meson newbie so any tips will
> be appreciated. I'll work on getting meson/ninja to be more
> verbose tomorrow to track down what really changed.
>
>
> I recently started testing qemuppc by booting
> core-image-minimal with systemd as init. It fails with:
>
>    /sbin/init: error while loading shared libraries:
>       /lib/systemd/libsystemd-shared-237.so: R_PPC_REL24 relocation at
> 0x0054574c for symbol `strlen' out of range
>
> or in some cases:
>
>   systemd[1]: \
>      unhandled signal 11 at b804b784 nip 0070d184 lr 008ee1ac code 1
>   Kernel panic - not syncing: \
>      Attempted to kill init! exitcode=0x0000000b
> when running:
>     runqemu slirp nographic qemuppc ext4
>
> The error only appears when using the distro poky-lsb
> or a security template in the WR builds.

Khem suggests that this is due to the new gcc and PIE on PPC being
bust, but even after passing no-pie this is still happening for me.

Ross

