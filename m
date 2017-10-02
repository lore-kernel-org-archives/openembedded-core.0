Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f169.google.com (mail-yw0-f169.google.com
	[209.85.161.169])
	by mail.openembedded.org (Postfix) with ESMTP id 56C2473117
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 14:34:41 +0000 (UTC)
Received: by mail-yw0-f169.google.com with SMTP id u205so3788972ywa.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 07:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=At+IvdJoy90xstAP8Ve3szmftOqOj8PkSzwXsqemv/M=;
	b=S8+OVGicCSSPfMR43LUKY9QryrRg7Mhwl/gB/x9LiNIwe+hCZ02UcUKtzCVCDrw80R
	acT5cQs/2RS2qCY4WS6nEaB/VgCimKdet5ErC5MuUSjtge4+SWS2KGtxuq5zMhgu9yID
	LLRbnlAJVBu9iPR5SRcS6Dcm30NIE/SBDcNgheBCKY2/i0lUivsbOIMKVE7aHvzYYvdF
	VbF/ggfaHrYBOJau+bDv5QLJvkPXM4MJjE1+zv+ACvJi2Et9gXATVj4iGmngqd2HPWJL
	wn+Pelh8uZjpExtDPaMWUYIKnLayFqPalCFDU4Mp0Axx4TYDzTBU1FCb0/OuCJyAXXcD
	wpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=At+IvdJoy90xstAP8Ve3szmftOqOj8PkSzwXsqemv/M=;
	b=QHn6R3EauwlvzRIQg1nLjczK9/BcKPYzRgdWPk0KpmHiFNnx4h2jNwPjt62hK3Nbi7
	rfsDP2giRV7CW2vwEcI0K5MhHII0f6IPka6d6Ioo/m1ZvIfKGktu+oYQ31QwnUGBCcFF
	iEL3W+Ku4CiaNMZAR8ZR/zA46gaKlrymixeC6h+RvjV944/qtLq38QdbaXpiAUIP0N56
	zJ0c0/xwMoH8czDxCCebY2u6KZpvZ5cDBm792wgzg0GKMd/kFQMHM53BKGIgK2Reg4RQ
	K95BrfSW3V1L4LT2p22Ad/6vCLqLv4J7eVQU0J8GR2F6WI/o3uH5bz0lnOZc5FYKbpf+
	Cv3g==
X-Gm-Message-State: AMCzsaXniGLnZEaSlE09hs4nl4zIq9hNhLXfGNPH8EK4e5T8UUoyo6yg
	2Cb3EmRMWsR3qHb+0ivHm1cWjPTY
X-Received: by 10.129.48.5 with SMTP id w5mr499840yww.468.1506954883041;
	Mon, 02 Oct 2017 07:34:43 -0700 (PDT)
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com.
	[209.85.218.49]) by smtp.gmail.com with ESMTPSA id
	v130sm4273017ywc.66.2017.10.02.07.34.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Oct 2017 07:34:42 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f49.google.com with SMTP id q133so3470652oic.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 07:34:41 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QD1eAdeq25L729qWfThyMSHi0WWJgMW0SPRFyefvAfAlXy41lP5tekP3+e/HeVOgl9ZNhLliq8xRo1n55PNM0A=
X-Received: by 10.202.81.10 with SMTP id f10mr1797684oib.93.1506954881276;
	Mon, 02 Oct 2017 07:34:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Mon, 2 Oct 2017 07:34:40 -0700 (PDT)
In-Reply-To: <28ebae92-b3c1-7664-87f7-4c326711e647@linux.intel.com>
References: <20171002141814.29709-1-otavio@ossystems.com.br>
	<28ebae92-b3c1-7664-87f7-4c326711e647@linux.intel.com>
Date: Mon, 2 Oct 2017 11:34:40 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpr_ypij4Z919kVkQkJgWcr_VaS7AzP=0Wi7oumP3k8oA@mail.gmail.com>
Message-ID: <CAP9ODKpr_ypij4Z919kVkQkJgWcr_VaS7AzP=0Wi7oumP3k8oA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] lib/oe/package_manager.py (rpm): Allow use of non-signed packages
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
X-List-Received-Date: Mon, 02 Oct 2017 14:34:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 2, 2017 at 11:25 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 10/02/2017 05:18 PM, Otavio Salvador wrote:
>>
>> When we wish to use the package feed for local development, it does
>> not uses GPG signed feeds by default but dnf uses package signature
>> check. We need to configure the GPG signature check out so it works
>> out of box.
>>
>> With this patch, installing non-signed packages works:
>>
>> $: dnf install <package>
>
>
> This patch is still wrong, and for exact same reasons. You didn't change it
> at all compared to v1! I already spelled the reasons out, so I can repeat
> them quickly:
>
> The patch adds 'gpgcheck=0' when repo feed signing is disabled, which will
> also disable package verification at runtime, ignoring the altogether
> different build setting controlling that. As I've already explained to you,
> package signing and feed signing are two different things, with their own
> sets of options.
>
> Test case:
>
> - enable package signing, disable package feed signing, check that the
> resulting dnf.conf file has package verification enabled (it won't).

It does not work as you are explaining. Without this patch I /need/ to use:

dnf install --nogpgcheck nano

to install nano. dnf has it enabled.

root@qemux86-64:~# grep gpg /etc/dnf/dnf.conf
gpgcheck=1



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

