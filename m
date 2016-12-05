Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 42370719B5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 20:22:58 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id w194so16817526vkw.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 12:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=HfO3Vutc7+XJ27wm+Awtlro1L4ePOljmc9wICw4XpmY=;
	b=gdz7ptqxayAkt3n4xjslIhTvGuDRamqOcxkjUjcAmvAMSqtN96qUkLA86EPsEvSfpZ
	WwDK5tbhWQC6J1g/YWLh3qo+5OAPvdXgqdk0SKYLlgIsOA2NsDHsMp2mpuXIDxlVl69m
	1w7AygY43+PDZ8c4JcJN6vvsZMUnijsbZLz4MEAYN8+JI+r8SV9tepPBx4Y3kYmebP91
	Qmvj2WTkdFHjTtw4h8tzquSIYuiC+VLNPE8cNL+2T0xo90tZOrdvd7Araxf8yZHZl0ZX
	SjFfPPFbJ0/h6BV8tKuL5nU/2mZP7cXM817jXv3PkXicLkYBomXOQMBBy1I/7toLG6r1
	1NBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=HfO3Vutc7+XJ27wm+Awtlro1L4ePOljmc9wICw4XpmY=;
	b=JrQAi3U4INb7o/kx5pxWHHy84cxj9U0tOSNdXCu+aHKxxaHu9i7NnRE2ELIjbsE4dA
	ETb85iKBnY5Dbu5t0vPnEbxKz3kBVdYhbjEAqoQJe5V+KilRsHOxjv2MuKCfbMhL7KMG
	LuBAVpv7fhcoo5lie8Oh3Pt166W30iPXMp9WmrxvvFyCxNCrc7SUT0htKr/C6iF+f2JA
	zKjUjFYufZYIl6fFYt7EiF7o3GVfMu4/+GBP9DqzAy2datJR7MyRKs372h0D6MKWMAwX
	xiSPLxndKlGefCqzeRYxa0eWE57ugiHd+NVwC1wNivEbhLbPnIrPiwdybuZSirKHpYsl
	hzfA==
X-Gm-Message-State: AKaTC03Lcoc6mmZbG7YG0yj6UK9mRHruXrW42r6KmJaQg8Z8iof+kEfmKsLzs0+19ua7Pw==
X-Received: by 10.31.168.7 with SMTP id r7mr21722185vke.148.1480969379852;
	Mon, 05 Dec 2016 12:22:59 -0800 (PST)
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com.
	[209.85.213.54])
	by smtp.gmail.com with ESMTPSA id 16sm4565633vkl.28.2016.12.05.12.22.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Dec 2016 12:22:58 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f54.google.com with SMTP id x186so185117537vkd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 12:22:58 -0800 (PST)
X-Received: by 10.31.70.194 with SMTP id t185mr22317800vka.39.1480969378241;
	Mon, 05 Dec 2016 12:22:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.182.83 with HTTP; Mon, 5 Dec 2016 12:22:57 -0800 (PST)
In-Reply-To: <1602179.NQvUR1FKDG@peggleto-mobl.ger.corp.intel.com>
References: <1480687192-4813-1-git-send-email-fabio.berton@ossystems.com.br>
	<1956643.Hk647jXyjn@peggleto-mobl.ger.corp.intel.com>
	<CAP9ODKpVhncn-aZ=mJRef8WM5495nGafBaOmByXtUL_aOBQfkg@mail.gmail.com>
	<1602179.NQvUR1FKDG@peggleto-mobl.ger.corp.intel.com>
Date: Mon, 5 Dec 2016 18:22:57 -0200
X-Gmail-Original-Message-ID: <CAP9ODKp5YJw8o5+7=sZiU5JLXaiKBdfTY6b2e87MhD0R578ewQ@mail.gmail.com>
Message-ID: <CAP9ODKp5YJw8o5+7=sZiU5JLXaiKBdfTY6b2e87MhD0R578ewQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Add RPROVIDES bootloader
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
X-List-Received-Date: Mon, 05 Dec 2016 20:23:00 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 5, 2016 at 5:56 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Mon, 05 Dec 2016 17:45:40 Otavio Salvador wrote:
>> On Mon, Dec 5, 2016 at 5:31 PM, Paul Eggleton
>>
>> <paul.eggleton@linux.intel.com> wrote:
>> > On Fri, 02 Dec 2016 11:59:52 Fabio Berton wrote:
>> >> This change allow to install u-boot in /boot partition using
>> >> MACHINE_ESSENTIAL_EXTRA_RDEPENDS variable e.g.:
>> >>
>> >> MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "bootloader"
>> >>
>> >> This is usefull when system has only one partition and u-boot,
>> >> kernel and device tree need to be installed in /boot.
>> >
>> > If the intention is that other packages also have "bootloader" in
>> > RPROVIDES, I thought that these kinds of "virtual provides" weren't
>> > supported well by all of the package managers. (We might get away with it
>> > here since they probably will all be in their own separate
>> > machine-specific feeds, though).
>>
>> The point in having the bootloader is because different bootloaders
>> may provide the functionality for the board. This is especially keen
>> for commercial distributions where a U-Boot fork may include fixes and
>> this should be used on top of the BSP default and without many changes
>> on the layer.
>>
>> As you pointed out, the U-Boot usually has a single provider as it is
>> a MACHINE_ARCH package. I think it is a safe addition, isn't it?
>
> If we can guarantee that there will only be one runtime provider of
> "bootloader", then I would assume so, yes.
>
> One question - at OEDEM (based on the minutes, I wasn't there) the
> proliferation of u-boot recipes across BSPs was discussed and there was at
> least a desire to try to move to a single recipe where practically possible.
> Do you have any opinions on that? I bring it up because if there was only
> "u-boot" presumably we wouldn't need the "bootloader" RPROVIDES at all.

I agree and I think this should be a continuous goal for the entire
project and Yocto Project members, however, this is unlikely to happen
as internal BSPs and custom boards will always keep forked versions
around.

Even though having a single recipe is not going to happen, reducing
the fragmentation is very possible and desirable. We did some of work
on meta-freescale on this direction making many board to use
u-boot-fslc as provider. Some vendors moved to it while others keep
using their forks.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

