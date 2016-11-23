Return-Path: <nathan@nathanrossi.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7AAE771A66
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 05:29:07 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id h133so465811ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 21:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1FvhDiUTX5Mt3BoDPz3gNvNdF2QlkCjUfGRXBYjYqkU=;
	b=K0aAW88SDq6EfKx0s/npUKUmWnbyb/Xw1gVTMdvQ3C3GGyBf8kA/JZ38lh5+zZ86zd
	itenMdYqIYH3M5wX28+S2u60zGc0ZhJoXDUsw0YPaulpcspJYnazZrM8FBR6/KaJGOJW
	AHiF3HfXbizxPrN4d+UbOtoYBwhJqPxFwAukBMx8VEkC1YxMMPmy3XqYrGYnjD0kxT/E
	EkARi5/hk5NCnd+5Rc8OTH0ZTbDBP0Zm1wD+A74m1gd3396U81wN+PXNfY0xL6+uFhR/
	e6bOnnu9C42GICC6Kv2kk6TeDZkS4sddzTkfLzpRmfHo+h6MumQVWqnqThy+FOIyDE/G
	Lquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1FvhDiUTX5Mt3BoDPz3gNvNdF2QlkCjUfGRXBYjYqkU=;
	b=BuVyXjBAeZ34OXB+TGMpMFo09lHZjLFz+bkKM2IezNaBMNhg9XjjGZboo1MtvoX7BI
	+qDIen68UCbBs2KUXqj6mpbwDVpDFH8SR9XO8DrfWh07Yu6Kuw76vWJzmQP8Wxs7vOAp
	AdQpWFlZtly//3yse9PSTAZqp3y7PPUKaxQK5IZJNtBNMnlbD/0sBm0w/urkogXIvdGu
	JuEb2lkNDQW6DkogEkAxiGrMoe1ZYExm9nDX1zRFDP1iHF9pHqIUUgYhhzmIaSLW94sg
	PCgRaTlGbe+aLm6JcGjI9kH2coiN7xOSzExM6M0ilWSRJYAj4CPOA+04maffX76eziBL
	8Nzg==
X-Gm-Message-State: AKaTC03PGskzeDFoWM8mS1b48HNiSQziMBTVidzIhOlfAEA6OCDbnwD8pzsDo37wYEZnf8YLtuAZq5tJbgL7Ug==
X-Received: by 10.107.46.227 with SMTP id u96mr1782655iou.58.1479878949552;
	Tue, 22 Nov 2016 21:29:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.249.10 with HTTP; Tue, 22 Nov 2016 21:29:08 -0800 (PST)
In-Reply-To: <20161021120728.22639-1-nathan@nathanrossi.com>
References: <20161021120728.22639-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
Date: Wed, 23 Nov 2016 15:29:08 +1000
Message-ID: <CA+aJhH1F5M7pxXC7XCB8Et+-QaKGNbhAYpaA8Miu6dNvHtfrSA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel-fitimage.bbclass: Check value of UBOOT_SIGN_ENABLE
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
X-List-Received-Date: Wed, 23 Nov 2016 05:29:08 -0000
Content-Type: text/plain; charset=UTF-8

Just pinging these patches, to see if there were any issues or
comments. I realize I sent them just before a release so it was very
likely they would get lost in the noise.

Thanks,
Nathan

On 21 October 2016 at 22:07, Nathan Rossi <nathan@nathanrossi.com> wrote:
> Check the value of UBOOT_SIGN_ENABLE, as it is defaulted to "0" which
> for matches as True in python due to being a non-empty string.
>
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> ---
>  meta/classes/kernel-fitimage.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 8580247f82..3bbf91f65a 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -26,7 +26,7 @@ python __anonymous () {
>          # Verified boot will sign the fitImage and append the public key to
>          # U-boot dtb. We ensure the U-Boot dtb is deployed before assembling
>          # the fitImage:
> -        if d.getVar('UBOOT_SIGN_ENABLE', True):
> +        if d.getVar('UBOOT_SIGN_ENABLE', True) == "1":
>              uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot', True) or 'u-boot'
>              d.appendVarFlag('do_assemble_fitimage', 'depends', ' %s:do_deploy' % uboot_pn)
>  }
> --
> 2.9.3

