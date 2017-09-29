Return-Path: <riku.voipio@linaro.org>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id B06216FEFA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 23:16:23 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id 23so1013887lfs.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 16:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vJUKoQPd1yB9bk6RnZkf4xyJrh+lo7vnUL3YSFw2KGM=;
	b=FhhQBYDrARm1pypqolELX7w+aHjHnLjtR5tLLJFwZVekkciod2eHS38ac5laI/xoKV
	5b4kggVGHqga7hHeKxss+Z13gfmBPGIC+oA+qPXxBoDmB6skoj6DcnqgyCQrYHsh8stP
	IieAmxLJjoCruPOjbqhyYvTDcPC2OLeAOwwXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vJUKoQPd1yB9bk6RnZkf4xyJrh+lo7vnUL3YSFw2KGM=;
	b=qzj+a2+DKuHdsoF4EGkPQGdtSsy60a2pPEM1fS31tzTscYkr3g37XGnqrmySIvRrt6
	sqMrqry/mYbporffMjmhVra/Mc5yGAUfVDGBDYYTSxSkuKvvlCw0lODd27A5RyL3x87c
	l6+ZjBSbBQr1vp/o4FhSfqzmdLKQ6n/5ZeWqzpPjfy68f/BGyUdeUC/GT6n/T987DCw+
	UsjHq2j/FvvNOZYD3MzZOigif1shrpngzWGAQYZLpLY4BkyZ4bSxd6xKOAhHJd/1EFIr
	7+fjSF5Q2p+P4ky6wlhgNFa60uCy+T4c9OJANXj7Ute+QjYh9VU7SxSio3yttc0T3Zta
	1UDQ==
X-Gm-Message-State: AHPjjUi0vTxKLTk1WfDbFar+P4+9VoI+cjASTu3qIf81Ed3wtgY6iPLt
	MmH5SHB36/Dnhr5rOi7RD2voF6NJd4b38JvGCpCpmQ==
X-Google-Smtp-Source: AOwi7QAcsRMuenzM7jC4Xa+XrGCrI+WgpIQwJgeBFi0lHb/qs7My0TcyVwNhCvg1FqISM7Pk684JrmyMQbHQZfEvpNI=
X-Received: by 10.46.101.208 with SMTP id e77mr4115091ljf.52.1506726984371;
	Fri, 29 Sep 2017 16:16:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.74.21 with HTTP; Fri, 29 Sep 2017 16:16:23 -0700 (PDT)
In-Reply-To: <20170929182625.GB3112@bill-the-cat>
References: <CAAqcGHk4xEzrbMxZtree8EGCAZ2mBX6X=h5w4aD2ZvQJ14=XJw@mail.gmail.com>
	<20170929182625.GB3112@bill-the-cat>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Sat, 30 Sep 2017 02:16:23 +0300
Message-ID: <CAAqcGHkJrJ76dENopHQCmbvWCELNn-Q5mLgXYk=etQwCSfCdmA@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: "cross-distro@lists.linaro.org" <cross-distro@lists.linaro.org>,
	arm@gentoo.org, opensuse-arm@opensuse.org,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	debian-arm@lists.debian.org, arm@lists.fedoraproject.org,
	linux-arm@lists.infradead.org
Subject: Re: SFO17 Cross-Distro meeting notes
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
X-List-Received-Date: Fri, 29 Sep 2017 23:16:24 -0000
Content-Type: text/plain; charset="UTF-8"

On 29 September 2017 at 21:26, Tom Rini <trini@konsulko.com> wrote:
> On Fri, Sep 29, 2017 at 02:06:21AM +0300, Riku Voipio wrote:
>
> [snip]
>> On arm64, Kernel doesn't self-decompress. The bootloaders are stringly
>> recommended to support decompressing kernel images. It's optional in
>> grub, make sure your grub does. At least iPXE and u-boot don't support
>> booting Image.gz on arm64, and should be fixed.
>
> Not strictly true.  We do expect that if you're loading in a
> compressed something that you uncompress it then boot it.  I assume part
> of the reason that Linux didn't go for self-decompression this time is
> the "my goodness, it's tricky to get here's where we are, here's what
> else is in the system, lets not stomp anything and get ourself to where
> we need to be" is in fact tricky.

Thanks for the clarification. The kernel
Documentation/arm64/booting.txt is vague in reasoning, but you are
right it's tricky. Kernel developers  assume the bootloader is better
equipped to know where in memory to decompress than a early kernel
decompress loop.

> That said, patches to check for ${VALID_COMPRESSION_HEADER}, uncompress
> a chunk, confirm valid Image header, and uncompress to where it needs to
> reside would be welcome.

While the unzip command hint is good, from cross-distro PoV I think
this kind of transparent decompression is needed to make the syslinux
bootmenu command "just work".

Riku

