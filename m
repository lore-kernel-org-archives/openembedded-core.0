Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id BBC4E78273
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 21:16:10 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id t124so6677289oih.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 14:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=XIwH7xKfZNmaQEEBt6EfNgppbwe41g35aXbUTrMUssI=;
	b=dlAsfC3uPiRaI1oXVSL+wR7TIs7Ls8w/NgU1E7uVZe1IHR34Gy3pCapfSVkUyY7mmO
	ilsCGDKGbdHedBh5K3ZhoxTyddfo+44Qmq4vkJum0rDLofTTQ09s8c6FLf3OHmFayRSr
	QWjC57pQT8cuZQfN0JmMV6NbFvmncQecNZTuKxGAV5UzMcECuHfY+0Es3lZmNYV3P5Iu
	cI0S4+nSZjLWiYMNE6Iglzc5u58gYoN6rUD1OqyZuCMZCkS4UBsVih+8sU0xgfkPmIzX
	b3xRfI1EKHLzvdq/PJQ2irQyvgrmXDkE/O6PzipoFNf9zAKBxkbD7D06r1L9dO0CJH8M
	pt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=XIwH7xKfZNmaQEEBt6EfNgppbwe41g35aXbUTrMUssI=;
	b=aFHCl5NGp6zA0BQTqv30zzyK6kDV9j3iK8d0VJWnstibr33DdUK7oYe46PLhpN01CQ
	RyuUEsHUdhu/tEpY3kfG0bvnP7ryoA7IRRx42EnJn419/oz4bDVSVoDiTzZFw1CZo6uQ
	on95wEqhhNy+5NPPm6fNEVkvdWVHMvMYabZ9yf3bIbRcx079R5+CJgC0D1+ilsVw6TGm
	Jg4KGgK4FXYaBO30gUJYkTgFo836o4jEw4WQRsrDDrwGUCz9qyufRrQrKQDmHoq4VQFE
	TMXB9vH6nS9drODVLXkIr2MM6ZDKpTRt8uu9vCyWCK+IBcvlSAqNBNtksqQBfLP2Q7D/
	lsgA==
X-Gm-Message-State: AHYfb5iPC3L/aWI8nlSpQYsZcLFW3yvTjrPmFR2K7+GHU4OhaR7H6NwP
	i4K7oym8183Uu4XfScA=
X-Google-Smtp-Source: ADKCNb4pChnf2Wab7Ikix+QfqdqmZm8aeFG5T7qybQ7VMuEYs5rSpnN8+oOQNL2JQ73u6OpuRDM3Ag==
X-Received: by 10.202.83.78 with SMTP id h75mr2716347oib.54.1504127771209;
	Wed, 30 Aug 2017 14:16:11 -0700 (PDT)
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com.
	[209.85.218.41]) by smtp.gmail.com with ESMTPSA id
	e184sm6958465oih.35.2017.08.30.14.16.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 14:16:09 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f41.google.com with SMTP id t75so61443424oie.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 14:16:09 -0700 (PDT)
X-Received: by 10.202.104.40 with SMTP id d40mr2610106oic.32.1504127768821;
	Wed, 30 Aug 2017 14:16:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.37 with HTTP; Wed, 30 Aug 2017 14:16:07 -0700 (PDT)
In-Reply-To: <4839097.lYi3dlrNZm@crde-port-20.cahors.local>
References: <20170816181539.5327-1-otavio@ossystems.com.br>
	<CAP9ODKpOcrd7h5AcgW2zxPHPvkhrgAByZEvF-tzsb-iOGxh_PA@mail.gmail.com>
	<4839097.lYi3dlrNZm@crde-port-20.cahors.local>
Date: Wed, 30 Aug 2017 18:16:07 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoZCkBhe-1JtKwBSuye-cONe0DGu-7Y-GGRytyTN8H=Vw@mail.gmail.com>
Message-ID: <CAP9ODKoZCkBhe-1JtKwBSuye-cONe0DGu-7Y-GGRytyTN8H=Vw@mail.gmail.com>
To: David Vincent <freesilicon@gmail.com>, "Burton,
	Ross" <ross.burton@intel.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "kernel: Fix symlinks"
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
X-List-Received-Date: Wed, 30 Aug 2017 21:16:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

David,

On Tue, Aug 22, 2017 at 12:40 PM, David Vincent <freesilicon@gmail.com> wro=
te:
> On vendredi 18 ao=C3=BBt 2017 14:44:30 CEST Otavio Salvador wrote:
>> On Wed, Aug 16, 2017 at 3:15 PM, Otavio Salvador
>>
>> <otavio@ossystems.com.br> wrote:
>> > This reverts commit c7bc46b9bc29dd0953ab8d63b50fa105bb66892e.
>> >
>> > The commit has broken the alternatives concept as it is managed by
>> > links controlled by the alternatives system. That said the failing
>> > case identified (which some bootloaders fail to load the file) seems
>> > to be due a misuse of the alternative system.
>> >
>> > Cc: Christopher Larson <chris_larson@mentor.com>
>> > Cc: Ross Burton <ross.burton@intel.com>
>> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>
>> I ended forgetting to add the commit author on Cc. Adding now :-)
>
> This issue has been discussed here : http://lists.openembedded.org/piperm=
ail/
> openembedded-core/2017-April/135923.html
>
> Reverting this patch to solve the alternative problem cannot be a definit=
ive
> solution as it breaks boot on some boards. IMHO, I'd rather break the
> alternative system than boot (full disclosure : I use opkg's update-
> alternatives).
>
> As already said, absolute paths cannot be used in bootloaders since it ma=
y
> point to an invalid location (rootfs may not be mounted). I do not have
> another solution with plain 'ls', but I think we should find a way to bet=
ter
> handle all cases than going back and forth on this patch.
>
> FYI, this is my use case : I have a bootloader which resides in EEPROM, b=
ut
> needs to boot kernels that can be upgraded. Therefore, I rely on a fixed =
path
> to the last kernel / devicetree on a specific partition outside rootfs.

I understand the problem you are fixing but the solution in use is wrong.

We should stop using the update-alternatives for the kernel and device
tree files and instead just use plain symbolic links. Abusing of
update-alternatives is just wrong.

In fact, the update-alternatives for this specific use case is broken
as the database is elsewhere and so the link cannot be managed
properly.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

