Return-Path: <jupiter.hce@gmail.com>
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id D75E160C16
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 10:39:43 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id f5so4650304ilq.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 02:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/1qQoGyod6NdQu7OZ/NgoMwp8aI6nX0JbHgkGmcofc0=;
	b=PvdCgnuFEB5MRnAe0ng+KViZnUAm0N0MqGvV2xcBQOmVW737HllBOHKFD+YP0B/9I/
	MVNW+J8Qv+ws2NI2lBc8yrL0+jJlrTj7MHG7hnghyM7qRwJopKWuqZC/maImzQt1u82f
	3TPxwDau2aFSUkvVlNgi/2PPafEBC4gj4RtuKozwM6bnDOHJt2FvuS4deD5ysRMqr5NU
	Az4cM1BzIdoTX1z1uhbh1eHYGO5TxCzJMiK6t6ix6x5PCQWt9Nh8Z2DwuJR9tIvOJEue
	APH23BqUVHkdsHu3EgdDnL3rOr7dstE7ZT5M2AzE4OLnIASW+QavvsUBR31D2zjNFEM4
	5PjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/1qQoGyod6NdQu7OZ/NgoMwp8aI6nX0JbHgkGmcofc0=;
	b=Sd4ujPL8BYEt2KIGNEy1/goJu1obMpcEPk3Ux/h4RsXbC1Ib3ARG9iEkQPkTqUuHo4
	/zx/NzpFy89XydEslAFs/df1n3NfaOAkbpC6EL/hRdd+yOdeDNS5p5CSP+YQ/sVohL50
	d26VBA7JsuAE8VNOZl7wphmT37nsHIBEp4KqAkrPCULicEFTtI4dMnocx8ZV/KY02oRD
	49hMYxM1oxn1lKCnwCelPrkKQwmHvtyNkvX8CpdI++/CBdAAek4hwgUhSJGDwhjSC7rf
	1gcO7jiBpbgq3bN/v19pTCS9+nACbvRylMrZ8XNUun72UidMVoTv2y+hQYZRAPOUzuNc
	pYDQ==
X-Gm-Message-State: APjAAAVW+2Mj93XCDjNvORyNwaOXU3z7x2MYqOLYzWa5RuHyCCAG8vik
	cGH2LS65TvhHJEYeGHStFcjsPtmNRs6Lzt1evt0=
X-Google-Smtp-Source: APXvYqyIS7F+RLWtmTdVq4YPRc+8dNbmqrdzkbdzKKdI5hQfmuy/OiKfLOnmTaRQje4MYbYwe+yd6vDxTO27aa6Y2CM=
X-Received: by 2002:a92:d5cf:: with SMTP id d15mr3066998ilq.306.1580985584782; 
	Thu, 06 Feb 2020 02:39:44 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP;
	Thu, 6 Feb 2020 02:39:44 -0800 (PST)
In-Reply-To: <CAA=hcWSAbcf9GchJN_+-DzMDYJQfMKBGYHmJzRNwY5P_szMvOg@mail.gmail.com>
References: <CAA=hcWSCZROrpDBWV5ZAA+LV6j0cjRSKxyjonOfWS4mCZAtdHg@mail.gmail.com>
	<CAAx3WaDGin=NcQk3X4=MTK8RfTrNO=LvrG+LbAyrWFUnWgU9aQ@mail.gmail.com>
	<CAA=hcWSAbcf9GchJN_+-DzMDYJQfMKBGYHmJzRNwY5P_szMvOg@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Thu, 6 Feb 2020 21:39:44 +1100
Message-ID: <CAA=hcWR7vHD9AbgkJXTxQD3dvQCdc0oo6eXzP3T2NSnyhdYsQQ@mail.gmail.com>
To: Gabriele Zampieri <gabbla.malist@gmail.com>
Cc: Meta Freescale <meta-freescale@yoctoproject.org>,
	Yocto discussion list <yocto@yoctoproject.org>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Support UBI u-boot
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
X-List-Received-Date: Thu, 06 Feb 2020 10:39:44 -0000
Content-Type: text/plain; charset="UTF-8"

On 2/6/20, JH <jupiter.hce@gmail.com> wrote:
> I think I need to add an appended recipes-bsp to my layer just like I
> added the recipes-kernel to my layer to overwrite kernel defconfig, I
> need to overwrite u-boot defconfig.
>
> In kernel, to overwrite defconfig, I run bitbake -c menuconfig
> virtual/kernel, how can I generate u-boot defconfig, to run bitbake -c
> menuconfig u-boot?

Hmm, more complicated than I thought, it does not have defconfig in
u-boot like kernel does, how do you overwrite u-boot config in Yocto?

