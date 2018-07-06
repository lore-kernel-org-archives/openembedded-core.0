Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id CBBB9771B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 18:35:09 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id j11-v6so7324022vke.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jul 2018 11:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pWj6kGunxzQ0tN2ZiMppOsVSt3T0ug7HPQPyV63HgGs=;
	b=GXTRvVwD9rmCyo40T/sFoOyK8+Xp4WlsYW72yZCOYoZtN0c6GuDRgD2KzUJnH0SiH8
	otXuUgjlpshwTSFxUKPOjFeZGN+GaAJd3CJiC6asmAmixEF7I6oLbUiNqggy6M6Pqwmm
	R1JCiViT9CqL5PQ8WsvwANQDw9jRkwWV2nTvutkLNEdyAGkIuUo1xZkMvbQfg8zvfupj
	HlehwQ3K0BOI+DIFj/DFWLhdL6eI2bQIT4Q//7+k/YcHSZtuw8pJhJnLJxGV2pQ+s6I2
	pqi+lCMl1cYCxwYK7avDdo+NUtZbtwdelnTHxIvlxDE411+RPM3IRJkCduZ2r9e+xddm
	A70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pWj6kGunxzQ0tN2ZiMppOsVSt3T0ug7HPQPyV63HgGs=;
	b=lTud2smmNllEaqsDkDKJdLVfoNt426kxri8uA2nwR3kJ9LVfpyEkzocdHd9eFoVbRB
	UU/NyM3MZRGthZt24P24xjfTyxLWtp9AdawHNt0/7Hp8i1ZhflI+HepVLtjYBPqbiUS5
	VMcuDJmYwoYUf+UhMnsoaECEexqAZbb8cNT2vd0npyMIZhCHldqh7QQGoKBK69yVgnpJ
	6RTxvtxYtmfTJKxp0yGOS4YkPsWFCkWWPHorU5K7wzXAvG0sgfVeh+iZTq2Ow5YhUFti
	KDKYVxsSWgfK34z48+FwkQeXr5/9dCEVnvGrev88WHZfR6sRTR2jGaIv+pySl2cGXMK7
	+vFQ==
X-Gm-Message-State: APt69E20r/dV3tyCFQwpGNw1iUYnz+XWy72rOp5XIDmHV0HKZbvMEfIk
	C0cuzXNhdpdYCi95/bWK01s+76ZYe/sc9NIENoM=
X-Google-Smtp-Source: AAOMgpc9uxuavhN58SeTgTEofH6mEiRNfxauqxPQCbzmZx68hBXJftI086LzIQmoLOW4pbc9L6f5CorsRyTfx4TZBzo=
X-Received: by 2002:a1f:9757:: with SMTP id
	z84-v6mr5857677vkd.174.1530902110562; 
	Fri, 06 Jul 2018 11:35:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Fri, 6 Jul 2018 11:35:10 -0700 (PDT)
In-Reply-To: <CAJTo0LZzdbqxQNU2kvz=a=f3gurXbYPJD-7U37wU4LPGHiE0Aw@mail.gmail.com>
References: <1530665722-23464-1-git-send-email-armccurdy@gmail.com>
	<CAJTo0LYhD_m-+d8cxiCDEULgYLEe7OSq12O3Q=CYFRiqJMP+5w@mail.gmail.com>
	<CAJ86T=W1kjJgn-6P2POoLqF4oBcovEs2Sekp-saaD9dqTSzi4w@mail.gmail.com>
	<CAJTo0LaUkxKcPhasnQh6KAsh2kv5rEmy-jMW3oXKxttS-kd1mQ@mail.gmail.com>
	<CAJ86T=ULm4BBu2JWmVTDfuVxh4vcd9FVDVJzyC3Qt6tgiTNHZw@mail.gmail.com>
	<CAJTo0LZzdbqxQNU2kvz=a=f3gurXbYPJD-7U37wU4LPGHiE0Aw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 6 Jul 2018 11:35:10 -0700
Message-ID: <CAJ86T=VP+eLW8rPmHgw4hSEyAt4BuRMuAUqJD3r9Z9P42B3_PQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-setuptools.inc: avoid using += with an over-ride
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
X-List-Received-Date: Fri, 06 Jul 2018 18:35:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 6, 2018 at 8:10 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 6 July 2018 at 01:57, Andre McCurdy <armccurdy@gmail.com> wrote:
>> That all sounds plausible, but starts to unravel into a bigger set of
>> potential cleanups. For example, digging a little more uncovers this
>> from distutils-base.bbclass:
>
> Let's take these cleanups one at a time.  I've just submitted the
> distribute->setuptools change as a start.

In that spirit, should we merge the original patch, which cleans up +=
with an over-ride without changing any dependencies?

