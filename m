Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5F7DA78200
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 19:44:11 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id f140so14810529wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Dec 2017 11:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0Ff6Lv2gp9ibVCXKhX+c7SbjTCrR+KcsaXY1CXNWupU=;
	b=ayll4y1P0MFEGzPxvimfVywRb3RSBY1lzfMWirHBnXcDQdG8HCgC/cU4yZG5ZBNzri
	Tkr1rgaqO0WKoNfEdl2z9jXAORuoroeG127FXWCuhqSX/ipKFwEtJhLEeSZji22dAWqs
	SfEGDowUhAEn9LDETYE/yWFFfhZj0veeJ7m9RcnvXiYcdLaoSd+rJRLW60WjlRFTuuX2
	VFzmRTU0AwtO36DxFV71xytGFll58VqYxKOBwceVX4wKz7UzpomUBIHNwV2sOdjJugc3
	T3ds4D08YVIz/G3A4mwqLWUpyWE3YRyLhvVPRIc3PTV1zE5qD2f3uzbeCs6EYRsvvJBt
	Tvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0Ff6Lv2gp9ibVCXKhX+c7SbjTCrR+KcsaXY1CXNWupU=;
	b=tchbpnoBjX3CBpUYaeSueNdSBBiR0WdbwVR+qO709HwC6U5Ub2Jvzh/7WVbvBRRmf7
	u4UjVYLKO58c5eEH6RyvNngWoGunzW4ASnxDp2OypPQsRK8RU63++knOrkOdeHIMj1H3
	fQdH2lWgbx5ZGjx+6LRn8/mkCd9esv+pSGInOczF14OryI2LVZBzu3vAa6zOk1DYK7n0
	0rfrxC3jEsk/7I8Gt++Lnre4iV0UQGRuHr8SrqmfDb8d/THUWd2hgrnSpc+OAjHmEVEx
	PUXlJ6qf34qdaZCmMuiXkzdiHhuqdShOu3eyY9n5qlrbowB4XrHOlV4J0q4uh+2tHEZv
	7pBg==
X-Gm-Message-State: AKGB3mL8s5Lbw93PjP9VtN9uldM5KJrRq2rth7u9LK8mIGicY2MLfZYn
	Aymw1YE9309+rXGn/rtdoHtzKD/luyFLIlAwyFE=
X-Google-Smtp-Source: AGs4zMa21gWhLnxpr65xgGdMGcUHpnW1aC6FIKxrZOuWa2K4KYcAv1y2OiJWh2uTX2/XmJ13tDQhjQ5jakMj7dOu5TU=
X-Received: by 10.28.147.8 with SMTP id v8mr2451527wmd.136.1512675853041; Thu,
	07 Dec 2017 11:44:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.133.68 with HTTP; Thu, 7 Dec 2017 11:44:12 -0800 (PST)
In-Reply-To: <CAMKF1soDvWpqpUaZQcPoVA_0_NFXh_UB6vJ5QTb=ZKhtX+L3XQ@mail.gmail.com>
References: <20171207161555.uqbdyctwj7qljnto@mcrowe.com>
	<CAMKF1soDvWpqpUaZQcPoVA_0_NFXh_UB6vJ5QTb=ZKhtX+L3XQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 7 Dec 2017 11:44:12 -0800
Message-ID: <CAJ86T=VzQrqQPa4OB_SgyhYGg_ySp9UgBLeRuY1XLCXYgNbtjA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Mike Crowe <mac@mcrowe.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernel.bbclass do_sizecheck behaviour changes
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
X-List-Received-Date: Thu, 07 Dec 2017 19:44:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 7, 2017 at 11:20 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Dec 7, 2017 at 8:15 AM, Mike Crowe <mac@mcrowe.com> wrote:
>> I discovered today that our kernel size check has been ineffective since we
>> took 7384d2831c713ac5999aca83c312154dc15cec56 from 2014 which changed the
>> units for KERNEL_IMAGE_MAXSIZE from bytes to kilobytes.
>>
>> However whilst fixing that, I also noticed that
>> 849b67b2e4820564b5e5c9bd4bb293c44351c5f3 in 2016 changed the consequences
>> of exceeding the size from being fatal to merely a warning.
>>
>> This second change in behaviour wasn't described in the commit message, so
>> I'm not sure whether it was intentional. I can believe that when generating
>> multiple kernel image types it may not be essential that they all fit, but
>> I don't really know what the use case for the feature is.
>>
>> I could fix this by adding to kernel.bbclass something like:
>>
>>  KERNEL_IMAGE_MAXSIZE_CONSEQUENCE ?= "warn"
>>
>> and then using it when delivering the bad news so that recipes can override
>> it if they wish.
>>
>> Alternatively, I could treat the error as being fatal if none of the kernel
>> images fit within the required size. This would degenerate to the old
>> behaviour automatically if KERNEL_IMAGETYPES contains only one entry.

That sounds like a good solution.

>> Does one of these solutions appeal, or is there another even better
>> solution?
>
> I think default should be a warning with a possibility to be turned
> into an error
> if user wishes too. I think if you are generating multiple kernel types then you
> will use all of them somewhere, so I would say if the size of one of
> them excedes
> the set limit them break the build.

The size limit for an uncompressed kernel vs a compressed kernel is
going to be quite different, so defining one size limit and applying
it to all images doesn't seem logical.

