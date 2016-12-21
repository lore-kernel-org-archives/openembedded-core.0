Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3357B773DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 22:25:38 +0000 (UTC)
Received: by mail-vk0-f51.google.com with SMTP id 137so156790471vkl.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 14:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JnbyUm2P5kJ6tBuU3vkuZVHaApj8lXcqTqTvKqo4B50=;
	b=dKDJiUf+BUrzoDwVfM4kyAovr19KPmZTOUhE+qBWrmIVcEK57ThbFcreBeu1SHjtNz
	iJ/N1/raUOwbsens+/dKTvyhUWJMZY+IhhnUjoIYtsyBs0lZUYo4/nY9ZHO30+Zi0/o4
	WSO6sGRvPM1l2JCdQFxRMab1+okNAoGo0fXyWDl/u8SbUN3JhS59yK1gpctRYYi1vQ9o
	KIpkiI1z3KCT0CnlUqsFnuttpwR9Eufk+9N2o2cobPCmUvZNWiPI6Wk2sG2OXqgWzPiC
	C3pP8fI1ziq8CXzNp3dy1AVALjUwKb96gvJ1tFM3TYwuJ8jtyVc6U2cC4rlSH/146aHe
	Se/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JnbyUm2P5kJ6tBuU3vkuZVHaApj8lXcqTqTvKqo4B50=;
	b=bCXDMIJYhparV4hh3e60qpqTVrJNF48gqJBJX3mb+GkE4PLnZ3UobMxt4rYabP8CJL
	iUsjZxqvv6wgIPOd40WNWepyHX/KLOI5PKw/6owijUuy5svp70FAiEm64a+nwoEpmxL1
	oVwHq+8mX4oLfHW7bu06snj3y35p30nEbNWq4zFnhRNIDa/araNR0TOecUDST5+z1kmX
	5+sbWXZZDlL46o0qxV3ynxw8W13uI6BYYh9KoP0Nwn9nvN5w/ypSdN2gEfGahgPR07bP
	/V7Uv9dvfL1PqFogvMAIVnSxkr1OkC9a0fuYpZkcoooHd/95mgYlTF/eBk/Y4VSReEey
	c7dA==
X-Gm-Message-State: AIkVDXLVkM7quAzJwPqsPKx1C4nRT7Is/bvbeZCBjMJFTnU1sGCmAc2RfKNrryg50aGj7aV1EvTXLLLPDD3psg==
X-Received: by 10.31.197.195 with SMTP id v186mr2820265vkf.84.1482359140144;
	Wed, 21 Dec 2016 14:25:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Wed, 21 Dec 2016 14:25:09 -0800 (PST)
In-Reply-To: <CAJTo0LaRcmKATHBTRzosaFGAOLGc6R_1ioZfGbr4CU_7zShN4A@mail.gmail.com>
References: <CAJTo0LaRcmKATHBTRzosaFGAOLGc6R_1ioZfGbr4CU_7zShN4A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Dec 2016 14:25:09 -0800
Message-ID: <CAMKF1sqZjBsjwSkGQ0+pjpaYpxSxT9fcYC0J0KA_6_EPquh9dQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Broadcom firmware alternatives
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
X-List-Received-Date: Wed, 21 Dec 2016 22:25:39 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 21, 2016 at 5:27 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Hi,
>
> So /lib/firmware/brcm/brcmfmac-sdio.bin is an alternative with five
> possibilities:
>
> /lib/firmware/brcm/brcmfmac4330-sdio.bin 10
> /lib/firmware/brcm/brcmfmac4329-sdio.bin 10
> /lib/firmware/brcm/brcmfmac4334-sdio.bin 10
> /lib/firmware/brcm/brcmfmac4339-sdio.bin 20
> /lib/firmware/brcm/brcmfmac43340-sdio.bin 10
> /lib/firmware/brcm/brcmfmac43430-sdio.bin 10
>
> Note that they're all the same priority, so the choice of what goes into the
> rootfs is effectively random.
>
> From reading the internet it looks like this alternative was only required
> for kernels older than 3.13, so can we just remove this alternative now?
>

arent they for different chipsets ? if they are not supersets then
they should be able to
live together.

> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

