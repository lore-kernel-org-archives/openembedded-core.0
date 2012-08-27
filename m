Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1T61gn-0006fb-Kc
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Aug 2012 17:57:24 +0200
Received: from mail-pz0-f52.google.com ([209.85.210.52])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 27 Aug 2012 08:45:09 -0700
Received: by dakf10 with SMTP id f10so2398231dak.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2012 08:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:organization:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=sbsrltM82m5DxI511LN+bBHytGvTqAPuwRui57UGzpE=;
	b=lreHczhvTh5umy9qyVJtwFfA+Olc4Ez9LKyH9DoYGlgFEQxakqPRhnukzMUVBnNfCQ
	YXcdnAETfmLd0rysY9uYfVk7hPbByozJgjCUeJCLvAUkWAMOHB88XQZWLayqWTYLwMwC
	uKuXoYS3Y7zBvQOQ+UQoAcZviCGC0gHAcmGCI8l4g4grGoPxftED5iAezr5lVvlRGB/X
	fgQfWMFDvkOdrUkxRKHNrsh9CittY/BUB8mlRkzQUjySXzWeUz/G4HUj9EhD3NPmeDc6
	/jELQrC20JQ9RqcgXxTbvm5GszyEV1QnksHKO7ADQCFYVU0rSHvnvo+bvEpH2PWXYNXV
	OVUA==
Received: by 10.68.218.162 with SMTP id ph2mr35381842pbc.21.1346082308920;
	Mon, 27 Aug 2012 08:45:08 -0700 (PDT)
Received: from [10.6.18.71] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id ka4sm14921722pbc.61.2012.08.27.08.45.07
	(version=SSLv3 cipher=OTHER); Mon, 27 Aug 2012 08:45:08 -0700 (PDT)
Message-ID: <503B9602.6060002@intel.com>
Date: Mon, 27 Aug 2012 08:45:06 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <cover.1345785364.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1345785364.git.bruce.ashfield@windriver.com>
X-Gm-Message-State: ALoCoQkbULHjYkaV3sWoIJ7UjUifjwvrKyvuNITZqkYtMY6GFXlp+iqn/wtkn24K6Gz6cfNV2hmW
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] kernel.bbclass: fix INC directory for SLANG
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Aug 2012 15:57:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/23/2012 10:18 PM, Bruce Ashfield wrote:
> Richard/Saul,
>
> Here's the perf slang fix implemented in the kernel.bbclass. I've removed
> the old noslang patch, and built perf here. Everything seems sane.
>
> The kernel patch portion (that isn't required to fix the build issue), will
> come tomorrow along with some other kernel updates.
>
> Take this for a spin, but it should solve everyone's problems with perf
> and slang.
>
> Cheers,
>
> Bruce
>
> The following changes since commit a865fbf423defb7d24c59ae8d7a79eb87e2e6a02:
>
>    kernel-yocto: set master branch to a defined SRCREV (2012-08-23 15:35:35 -0400)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel-perf
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-perf
>
> Liang Li (1):
>    kernel.bbclass: fix INC directory for SLANG
>
>   meta/classes/kernel.bbclass                        |    3 +++
>   .../recipes-kernel/linux/linux-yocto/noslang.patch |   20 --------------------
>   meta/recipes-kernel/linux/linux-yocto_3.0.bb       |    2 --
>   meta/recipes-kernel/linux/linux-yocto_3.2.bb       |    2 --
>   meta/recipes-kernel/linux/linux-yocto_3.4.bb       |    2 --
>   5 files changed, 3 insertions(+), 26 deletions(-)
>   delete mode 100644 meta/recipes-kernel/linux/linux-yocto/noslang.patch
>

Merged the updated version with PR Bump

Thanks
	Sau!




