Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f180.google.com (mail-ve0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id A526E6C732
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 16:41:57 +0000 (UTC)
Received: by mail-ve0-f180.google.com with SMTP id cz12so821215veb.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 08:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=b9ch+89wNAsBl+T1LmjYc/xo1B6IpteOHRW7HahN0l4=;
	b=PwWYyHwJIFUw7FBTIKdwwyy/Sj9coBbIcCPXWj9DeeyefYkDlx2ArRGDrkeBziUXs/
	N8NWWHZc6zEfnQqLn1CsYhm7pt3UCq30lQyqjMGNhBlqvTnvbj0W+KJnPal7+I3ci8Sa
	I3VSJ68L2PAuoEGtOjJNqNzJcXJsP698ggYqI/oECsGR1UCC5/sRr0UMKpCszwUit6oe
	QNLy91BSd6ytNcDUlL0wy3AKIrkeuBeePHXYO1NCmv7fWiGzI0zfpN3mhC82WrudsYwY
	jlC+Nx/cyVMA1x2cyd30TzqF/JXaWPsDlaNWPSlYADAQdRmMlGj5H46uSMvTCSBq/c/B
	OB7g==
X-Received: by 10.220.84.193 with SMTP id k1mr1545799vcl.64.1392914517621;
	Thu, 20 Feb 2014 08:41:57 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Thu, 20 Feb 2014 08:41:17 -0800 (PST)
In-Reply-To: <CAOMwXhP68XUd-6ZSa3+t_OBMgr=mim0_9-yz0q1sNf1i90hgvA@mail.gmail.com>
References: <CAOMwXhP68XUd-6ZSa3+t_OBMgr=mim0_9-yz0q1sNf1i90hgvA@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Thu, 20 Feb 2014 16:41:17 +0000
X-Google-Sender-Auth: Vgl3srfQWl_0RUFm4uCLvdMe7Ag
Message-ID: <CANyK_8d2i15W5s9-uAGWcG9kBcb1WMZDJovC-HAhzVwKuqUk4Q@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Removal of poky-feed-config-opkg_1.0.bb
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
X-List-Received-Date: Thu, 20 Feb 2014 16:42:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 20 February 2014 13:03, Laszlo Papp <lpapp@kde.org> wrote:
> Hi,
>
> I had a quick discussion on IRC with Ross. Is there a reason against
> removing it?
>
> ../meta/recipes-devtools/opkg/opkg-config-base_1.0.bb seems to be
> already doing the job. Is there any compatibility to be kept?
>

It does duplicate the creation of "${sysconfdir}/opkg/arch.conf" and
so that bit should go. I think it should probably be replaced by a
template recipe in meta-skeleton which shows a developer how to create
their own feed config in a recipe.

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

