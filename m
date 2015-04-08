Return-Path: <naresh.bhat@linaro.org>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4269D73CC5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 07:15:49 +0000 (UTC)
Received: by obbeb7 with SMTP id eb7so50603805obb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Apr 2015 00:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=abAvm6Rusz9ANTMruxQUP+jpkBvhhD3MADuQro3gxfw=;
	b=bSofX1tiSHS9WgpHTM7h60pjLMus+FNO7dgYbxQooVzkuNUF2wb8vi2G2rmftMS6F6
	qFLPNVnZxoo8FvFPX5MoT3Z7/3P3SyI5JUELQe4alv+V4acr+p/1JtuOCTAQeIlnAvKI
	9GkWBO7xZVsZdXwxwp+uQArouGniiIK2Cl0v0ZcocRjUW0tJ2QspnhF+NYhBwtdJkLw2
	Np757JIK/xuBZvrLtKfjrbU7zxXDqgHcE+rGouCaZ4WSFQ6j3F50agpF9KhI6gQs4Zff
	1T1knN7EXCs9ZDrv8e5Wra4STWoIHW+Cmi0ynLh9Oujin7nInvlbpzQ/YqsWSAvWW9FD
	BQUw==
X-Gm-Message-State: ALoCoQmpr70hlYWBg5U1OtdClMEDXBfNvt3j9Iu4KmL55KRWdpBCoj810Zctt+rVMnkzaOt8mwVY
MIME-Version: 1.0
X-Received: by 10.60.52.19 with SMTP id p19mr78044oeo.37.1428477351124; Wed,
	08 Apr 2015 00:15:51 -0700 (PDT)
Received: by 10.60.98.242 with HTTP; Wed, 8 Apr 2015 00:15:51 -0700 (PDT)
In-Reply-To: <1426678029-19516-1-git-send-email-naresh.bhat@linaro.org>
References: <1426678029-19516-1-git-send-email-naresh.bhat@linaro.org>
Date: Wed, 8 Apr 2015 12:45:51 +0530
Message-ID: <CAFoFrHZLi0mdvxj8Go1eEviFzfaDmvBOOkUng5YC67f0QzAn7A@mail.gmail.com>
From: Naresh Bhat <naresh.bhat@linaro.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Cc: Matt Fleming <matt.fleming@intel.com>
Subject: Re: [OE-core v2 PATCH 0/5] aarch64 changes for meta layer
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
X-List-Received-Date: Wed, 08 Apr 2015 07:15:55 -0000
Content-Type: text/plain; charset=UTF-8

On 18 March 2015 at 16:57, Naresh Bhat <naresh.bhat@linaro.org> wrote:
> I am adding the support of aarch64 to LUV OS Distribution project.
> The luv-yocto project is based on poky distribution.
>
> https://01.org/linux-uefi-validation
>
> While adding support I find that these are the few meta layer changes,
> which I have been asked to upstream. If we merge these changes into
> openembedded-core it will be more helpful to maintain the minimum set
> patches at dependency projects like luv-yocto.
>
> Changes since V0:[RFC series]
> - grub: grub-efi: bootimg: Include all the chages suggested by Bernhard Reutner-Fischer
> - grub: Add grub recipe changes suggested by Burton Ross
>
> Changes since V1:
> - grub: More documentation on grub recipe and remove CACHED_CONFIGUREVARS as suggested by Richard Purdie
> - bootimg: Add NOISO as suggested by Bernhard Reutner-Fischer
> - syslinux: Impliment as suggested by Richard Purdie
>
> -Naresh
>
> Naresh Bhat (5):
>   bootimg: Add support to install Image
>   syslinux: Remove bootimg dependency on aarch64
>   bootimg: Skip iso image build on aarch64
>   grub-efi: Add to support to install grubaa64 efi
>   grub: Update grub git recipe
Ping,
Are you going to pick up any patches (out of above 5) in 1.9 release ?
>
>  meta/classes/bootimg.bbclass      |   12 ++++++++--
>  meta/classes/grub-efi.bbclass     |   17 +++++++++-----
>  meta/classes/syslinux.bbclass     |    5 +++-
>  meta/recipes-bsp/grub/grub_git.bb |   47 +++++++++++++++++++++++++++++++------
>  4 files changed, 65 insertions(+), 16 deletions(-)
>
> --
> 1.7.9.5
>

