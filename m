Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0651678C15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 18:57:46 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id d74-v6so12635825vke.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 11:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5DrVbnaVn9X/7c/AfS9EW8RWy1PNR+Gnf7LBqFxQPHU=;
	b=VZLCw4b9psxUoiKvL8skjfDBo6orsAF5Z3AXPs1e3KShpb4eqmxdImOrplGLunc07A
	xLhrIMUYgIBDQrQ6eiSY7egr0Li15mfH0cKl62/7XUcXRgwkym/QWseNCd3l+cVrxkSl
	Hih+6YJvqwsrXZuTsHVb8LJSCkNsT0LnqKMs7QtWmRBi/meiR4j7+tKciLA5ikT8zv31
	F9Q6ZxgEBpDHEsZ22x7G7KXxXaMD8Wgo3v75eNgprmI7Fpbaz2Ax9xUKNZOM6vTntu1O
	BQSmIbRIqfG/OjnEToqgqZmEfbT3mo6v2Kng0xZol5mibNXuE7A/089RmblNPOFGuIeU
	VOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5DrVbnaVn9X/7c/AfS9EW8RWy1PNR+Gnf7LBqFxQPHU=;
	b=PNBLHVXUYUDscYZHi41vH2OjooXZe+UGLtj1ZA2FgA/n5E0OMMU1c6Ze7/KfG/z4/1
	dHzaGeNDmgpeY9bfDEPUyFDSIturd3cVUXT1tDEVbM1L2DH872ma5CaTihoRIPoW6vNJ
	/gfYoAsr3eWQ8xyvWQuYMMzz7In0UdnrJCBqVvdHzn+L8z/XFHkJfKKNAWT9j/qSAWTs
	GOQ3y/EdlRWM6aab0V1D7t/+qSdwz0JgaFTDkl7hLLuIghvPzYa5cyyj/WbwPHQ6NCPf
	M+QoALCNYV6B+iLB5ueKenlA9aCshFZD0L3GIwUw+v4RlsZr5TjEqNdfvD3tayBoPqp0
	hoOw==
X-Gm-Message-State: APt69E3XQmB5HAOptFNuN0HFyv0iDh8j2516ULZ6V285PMCweCPHPnKd
	mxzL18opeRLW2UmXDNiClxJheEicEAODEHwL77U=
X-Google-Smtp-Source: ADUXVKIpFFwvDtSazP9TigoKW2cAcfkhaCwj+eVQQ9/IMkUi4szDLz8Enp5vLH6L29UCny8OiE2aDuSXGxy79cFvBXY=
X-Received: by 2002:a1f:142:: with SMTP id 63-v6mr247662vkb.2.1528743467708;
	Mon, 11 Jun 2018 11:57:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Mon, 11 Jun 2018 11:57:47 -0700 (PDT)
In-Reply-To: <1528690704-338-1-git-send-email-akuster808@gmail.com>
References: <1528690704-338-1-git-send-email-akuster808@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 11 Jun 2018 11:57:47 -0700
Message-ID: <CAJ86T=UhtVB3r26Xt-ryPCzhiBTR6M3OWr9A6_+-wR35k+KRXw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [v5][PATCH] busybox: update to 1.28.4
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
X-List-Received-Date: Mon, 11 Jun 2018 18:57:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 10, 2018 at 9:18 PM, Armin Kuster <akuster808@gmail.com> wrote:
> refactored busybox-udhcpc-no_deconfig.patch for this update
> updated 1.28.3
>
> [v1]
> removed patches included in update:
> busybox/CVE-2011-5325.patch
> busybox/CVE-2017-15873.patch
> busybox/busybox-CVE-2017-16544.patch
>
> [v2]
> Add back busybox-udhcpc-no_deconfig.patch ti SRC_URI, missed earlier
>
> [v3]
> Update defconfig based on feedback
>
> [v4]
> Decided to update again.
> 1.28.4
>
> [v5]
> rebased change do to changes in master
> squashed .cfg into defconfig and remove files

The consensus when this was tried before was to keep config fragments:

  http://lists.openembedded.org/pipermail/openembedded-core/2015-July/107993.html

If there's been a change in policy and we do want to get rid of config
fragments now then it should probably be a separate patch (and not
mixed in with a buysbox version update).

> Delete busybox-fix-lzma-segfaults.patch which is included in updated.

