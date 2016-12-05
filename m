Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 80C5560720
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 19:45:41 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id w194so16756097vkw.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 11:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=wePAVBZ22DKTU9J/T4TU8ZxUabGi93HF7TXcVJahzGc=;
	b=PRLVjfgcpYIERJm9OBoeK86BW9ms0CJfngz6QvSZDcbKhj97vxQkStVUs4gOAkyrdP
	l3RzYGIzY+dKeHFfcOtskYfWwa6SC9xTJjqQ701Nu+ymZ+NqZg533+aUTnHTWOz/8J23
	OCoIkITvZRN54pHdP3XTM0BysDxQGEbj/m/Eun3VB/zw3uKnh4YbXSvvH8V99sr2Tky7
	i10w8EmWg93EzFYRoKjS1rETAXE8foAKYKp879Y+FbVhPOLPjhjNK8s+9RdWIHCEDopN
	GcSEOOyHT4YzDICnp2Cm7d4ILpYf7tS1BzYegEdHunHSU433iV3ZFG7Z2HezDTwKr0Bd
	TzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=wePAVBZ22DKTU9J/T4TU8ZxUabGi93HF7TXcVJahzGc=;
	b=LdbHaJJkocp+ye11XbPeYmqppE4eleOjtvP29dw2FdzCQviujo9TXxu1GNowloVRyH
	hpvTjEshYqWY06dbWAX+QTh0faycwxDlmbFuayOCjT3seF8fKlEGM4PjReYMJv+Jq86p
	7OjAnCPp3UqMRlgxXMvsPRJYpjJJ224bAqTB4xUHYQz1321bY0dvYQTvaTNALvkMvtQ8
	9CssL1ez8ThSgAMZhQvVyyIpiW1Y812kf1rPP3qgTuIFjZASGzanN2jQ1Lmi/oU7YmLG
	V4TS8z0R9xd02U2IKPPpgCxVZU0oQsXBgLbRQyaE6kQfG4ujUxBf0o7uJCQj45hdTfM0
	HslA==
X-Gm-Message-State: AKaTC03uMzUWgnGjrrVEGVx11Np7r5m1cRdb3wWeXpAefb6xTabo4uXg6ivmTjAFSxWf9w==
X-Received: by 10.31.96.202 with SMTP id u193mr22747327vkb.53.1480967143005;
	Mon, 05 Dec 2016 11:45:43 -0800 (PST)
Received: from mail-ua0-f182.google.com (mail-ua0-f182.google.com.
	[209.85.217.182]) by smtp.gmail.com with ESMTPSA id
	t74sm4572241vkb.14.2016.12.05.11.45.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Dec 2016 11:45:42 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ua0-f182.google.com with SMTP id 51so359369395uai.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 11:45:41 -0800 (PST)
X-Received: by 10.176.2.21 with SMTP id 21mr45791475uas.11.1480967141529; Mon,
	05 Dec 2016 11:45:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.182.83 with HTTP; Mon, 5 Dec 2016 11:45:40 -0800 (PST)
In-Reply-To: <1956643.Hk647jXyjn@peggleto-mobl.ger.corp.intel.com>
References: <1480687192-4813-1-git-send-email-fabio.berton@ossystems.com.br>
	<1956643.Hk647jXyjn@peggleto-mobl.ger.corp.intel.com>
Date: Mon, 5 Dec 2016 17:45:40 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpVhncn-aZ=mJRef8WM5495nGafBaOmByXtUL_aOBQfkg@mail.gmail.com>
Message-ID: <CAP9ODKpVhncn-aZ=mJRef8WM5495nGafBaOmByXtUL_aOBQfkg@mail.gmail.com>
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
X-List-Received-Date: Mon, 05 Dec 2016 19:45:42 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 5, 2016 at 5:31 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Fri, 02 Dec 2016 11:59:52 Fabio Berton wrote:
>> This change allow to install u-boot in /boot partition using
>> MACHINE_ESSENTIAL_EXTRA_RDEPENDS variable e.g.:
>>
>> MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "bootloader"
>>
>> This is usefull when system has only one partition and u-boot,
>> kernel and device tree need to be installed in /boot.
>
> If the intention is that other packages also have "bootloader" in RPROVIDES, I
> thought that these kinds of "virtual provides" weren't supported well by all
> of the package managers. (We might get away with it here since they probably
> will all be in their own separate machine-specific feeds, though).

The point in having the bootloader is because different bootloaders
may provide the functionality for the board. This is especially keen
for commercial distributions where a U-Boot fork may include fixes and
this should be used on top of the BSP default and without many changes
on the layer.

As you pointed out, the U-Boot usually has a single provider as it is
a MACHINE_ARCH package. I think it is a safe addition, isn't it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

