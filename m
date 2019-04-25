Return-Path: <andrey.z@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 631D87D9F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 14:55:14 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id 4so9681916wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 07:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1718dB7Lg6E2EQxSIYtDNFzzAhsWl4ViwtJvd20Sw4U=;
	b=HSKqQc+d8pngcklnGX9HloWN2QPBqSJi/WIS8EZRzUmQ4anqSikITSz/n+BEUYIwXT
	28AapQPuAqktOGFVqKVPt8huQC9f/pfoohzJADfCmZ/Sq6ebG+tUSBeju4SIghXgmhQD
	bIUnwX067ps9FnC2AMKEYVsdjUGG9Au573skdbEE01tNRcNpW4hRssw4Bqjd/2f1VKqT
	Iv4Ya/ZzO1+dpZm1dsVTbdXCNwIi+S+1OuueDsiR9KrQ4KztuJr8dsGjAhs/360/WpMI
	BUwUhsUiLmz7GhZSoYdT0MSkW7/ehWBWvBcxy84yQWPiCM9z0tvBcUTNzW82M+zmTb5k
	xlug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1718dB7Lg6E2EQxSIYtDNFzzAhsWl4ViwtJvd20Sw4U=;
	b=C31sIRO44ru6li1roQ3Rm5ahcHJfzgUInXhZzRrVOlE8BiyA4jl2eVmPdlh7+CmS6C
	czjY48APVS4CQwpeITqQ2z1eCGywOq7gwaBsnyHw2taoHyEa6+W7PATH6PrHfa1x6THH
	tgEIaAcukML2zyxfLgWK1DijkisCuL3MX5b+wHN4Q6VXmnS8e4G1eORBbZifdlS7PdPi
	SQqsERD/es2CE/oIykSC1ktqJipxrqOujcBYWw6/Fi0psK1K7sF+PSV9wr5ByNh87JGQ
	g0ry+yrehj3NekImdkTLFHqLkx4ZuGetIVyMN/25jioVC9ynhOHhfcRW3o2CqkE8HBz0
	O4kA==
X-Gm-Message-State: APjAAAU8atUnX6wKC4zoO6XvJnfkU8AIJ64Two74fGy3nLiax3vJedxK
	v5fVLmOpbdj6oW/nolptzj8HqIejUIu7X82Ja15lJGyZ
X-Google-Smtp-Source: APXvYqyhQMC9DlcJVs3voErJwQTAbFRfoioGUEkZrqagz+NBFNRB55uTVJokuVYo4AtpPElNGSVnNWUtQpEwqddFg0M=
X-Received: by 2002:a7b:c5ce:: with SMTP id n14mr4172616wmk.18.1556204115113; 
	Thu, 25 Apr 2019 07:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190328094652.19336-1-andrey.z@gmail.com>
	<CAHtQpK5ky=PfhuxTGaGkXTzxjevvQ9bD6yiTNkr9KwWL8buSRA@mail.gmail.com>
	<99b41243d8067275b52a17d01debdd42bf0fee78.camel@linuxfoundation.org>
	<CAHtQpK4kHoMUZ=d416kKqv7FRgNZtp5BJURuJbjif=CAV+LEQQ@mail.gmail.com>
	<854407565898da7154b769187cf2e28cf7d0e451.camel@linuxfoundation.org>
	<CAHtQpK7VUYr=jR2uQJU5HCZa-izC4u_2t_uGpiGtzid86GpyWQ@mail.gmail.com>
	<2b52357c0d72676caa87be5f873520494a93bf6e.camel@linuxfoundation.org>
	<CAHtQpK4eHaZ4dSPmXCOQe8ETXHTB0PnYWoAB3Zqx=PmQKbd0eA@mail.gmail.com>
In-Reply-To: <CAHtQpK4eHaZ4dSPmXCOQe8ETXHTB0PnYWoAB3Zqx=PmQKbd0eA@mail.gmail.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Thu, 25 Apr 2019 16:55:04 +0200
Message-ID: <CAHtQpK68KokxxHmzLK73fgDHxgH1yE=anrM1itQFRW-RDBcGCg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package_ipk: handle exception for subprocess command
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
X-List-Received-Date: Thu, 25 Apr 2019 14:55:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 25, 2019 at 4:51 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>
> Thanks a lot, I'll definitely give it a try! Would you be willing to
> take this further in into the master branch?

Just saw your other patch against [utils/multiprocess_launch], please
discard this question.

--
Regards,
Andrey.

