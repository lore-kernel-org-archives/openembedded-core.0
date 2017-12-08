Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id B693A6FFC7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 22:24:16 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id x49so12070289wrb.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Dec 2017 14:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=doscUx/Ho/v3A7bxMrklgCrZxnXeJAKGGPohK9jYKks=;
	b=iWR44+g/VR2SiEFRIIl0itrM8LmEV9f4LTX8aJxFN/+0yCxWluc86gY6oxY2GrYbPS
	o3xj4/MkzHdDvwYpNWxt2hqLPY9hDdDA5NqSMrKf0E3Yy/j2dubBnCBtZnxcHnMK3OnP
	9A4HyYLF7BM5n27n7yC2eOYL+SxPlZoyJSgbq/YHxxZBYmogUrV8+jS/ijb4RtmLtlv7
	jFP5+zxua1+kpKHDsgsCB8LgAEib18lFAOsI/TWHNyMW3w6XLpMF7gSP040DJGX7yToC
	V+e44oeWuCj0kX2CH5CtpuiBCP1mPbqigkKkTpW2P3mEmW4jK9tZPGObgs3pmu9Sj4eH
	z7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=doscUx/Ho/v3A7bxMrklgCrZxnXeJAKGGPohK9jYKks=;
	b=du1k4IxdOvqDtaXjuKqca0wrVmhDw6hltrn2VbeQJh4ZipCZpjP1cBEPBFlR3aNRGq
	JSj4t683rDv0Fvn9WsPg3h6/5jW+HkYaB4q2W0/gDolN3pQ4GXcH1z/rXwhlwmcSMEuE
	xamj5Lm2hgAI13KlUnzA91gbqBG+MhrdD+/vbOrS2bhjXAkEyVmB+YMOrJwKxcEIbVon
	rkZu1ML1mXrKfBoHEmllv0E3H38K4Vq5AFz6W9C+dYZ9VXi48K7sBfHNaoKpNHleQ8MG
	x5yO6wrXJhPIq1nMf5s9PkcZZCJkHjc/s4UNb9Qc3fDRrcBCd2Qwd6Cdv1BMBxiQ478I
	6TXg==
X-Gm-Message-State: AJaThX71l0nxvt9v/jzZW9qfKL3Scd52Z+e7+GTSj5VI3yu8EHgULX2q
	iABCfgC798Hq94ubT00o/STwnfzeN7Trwi1Kp04=
X-Google-Smtp-Source: AGs4zMazcbGCxAYEj39p8uONwMMnD5ChHD7kjTDHpe2wpnbQh5ssehBkD13td8oh5h7+I/eopLQ4CtsnGyX8DhcoA+w=
X-Received: by 10.223.176.194 with SMTP id j2mr26082909wra.62.1512771857567;
	Fri, 08 Dec 2017 14:24:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.133.68 with HTTP; Fri, 8 Dec 2017 14:24:17 -0800 (PST)
In-Reply-To: <CAMKF1srhviBz5_Y9Gsn=Db2y9wCJ8HN96+FjBci+XA3m1R-Pwg@mail.gmail.com>
References: <20171207161555.uqbdyctwj7qljnto@mcrowe.com>
	<CAMKF1soDvWpqpUaZQcPoVA_0_NFXh_UB6vJ5QTb=ZKhtX+L3XQ@mail.gmail.com>
	<CAJ86T=VzQrqQPa4OB_SgyhYGg_ySp9UgBLeRuY1XLCXYgNbtjA@mail.gmail.com>
	<CAMKF1srhviBz5_Y9Gsn=Db2y9wCJ8HN96+FjBci+XA3m1R-Pwg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 8 Dec 2017 14:24:17 -0800
Message-ID: <CAJ86T=XLobz3tiBOf+JqAt3JBV=o4HqUVBJwkjY0VR9LCDWNyQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 08 Dec 2017 22:24:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 8, 2017 at 1:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> The size limit for an uncompressed kernel vs a compressed kernel is
>> going to be quite different, so defining one size limit and applying
>> it to all images doesn't seem logical.
>
> I was hoping that we are talking about deployed kernels here compressed
> sizes can vary widely too
>
> So may be we can have a hook to define which image types should be monitored
> and what the limits are for individual type

We could do a lot of things and add a lot of complexity. However based
on the fact that the simplest test has been broken for some time and
no-one noticed, the evidence is that the kernel image size check isn't
a widely used feature (and the kernel image size check with multiple
kernel image types even less so, if at all) and so probably shouldn't
be the focus of our efforts.

