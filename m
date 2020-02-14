Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0EC39610AB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 14:42:38 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id d9so7054138qte.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 06:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5kTinWdukA/TWuS85ScVECsC065OlAx6Ncug0KC9TPw=;
	b=u7wJ0fVDXexDcbdi81Pt/NfnASzK/WVb2lvCPOjTx+/PuxEawSJAMuQCYS2frMRRsX
	mR/o6qY/eFfNIku7L6pldfLO5KGERXpkeRLT2ZcpvVWkSjVjySzxQ7Kx25QhVmki4njq
	GGHlYm6/kMQlqayrwFcpOpgf9L1qgnybWrFlaardDMLWh243hoasUfp7NPTIDQXqUs2s
	T3j0zapNFO7VAUgukB9SydqcZy2Wct3Gb8bMHLP6fPJhWl25LbXSIsVA0RDV0QCykstR
	x8G71jTwdnsPmsEB+KvNEsWkSerbo0HKOoXV2WEh+CYlkHZ/fFBnZqJLh+DW7e5r+xf9
	bdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5kTinWdukA/TWuS85ScVECsC065OlAx6Ncug0KC9TPw=;
	b=rIsiL8bNSKC/foJVVQ1IWxzVLpujXj9q0ELUQTN5YAcL8cFfzRQj8B2jh9Jpp9ADPu
	4fbJFeZaZ0y1hMh8aNhz2PHr3ApuliXlbHW49l26OQn4xzcUlNZQMd96csTVJ7IIIVVI
	6zaxrIng+w0xZCQ4nR4WoJozYPRsQMT5bIQVfuawRW6/KawWoIt9a7jDeUwie+FWnqDL
	L2vFMgx3sE9YxBcgOBf//u4nMZqq8Dr9iiRx2JsH7c1MyXxo36bqMLzlugEFCAlXafkZ
	B4+k1AmCD/XcZteW7AquSFFFy/oO3WDga/BsGHeL9NaA6QvLgqRFq2F/qJdkAjNIUnDf
	yY0w==
X-Gm-Message-State: APjAAAWOTeTCBNrlbiTAtZ6NwOa5bJvP4Akl0scmjsfkVLhYbnskgHiI
	D10tszXSHbglschPRS7OW6HpT98MN1GkG7DAghWxExuoMpM=
X-Google-Smtp-Source: APXvYqyoQEF8QbRTELm0zhul9wDVSX1JK1RivMFAKZTNQEto+9sVWm4oPQL0bRjNem2v8aUXarbrx6bsS2QpDIznB0k=
X-Received: by 2002:ac8:1a30:: with SMTP id v45mr2749682qtj.80.1581691359669; 
	Fri, 14 Feb 2020 06:42:39 -0800 (PST)
MIME-Version: 1.0
References: <20200214070352.1206450-1-raj.khem@gmail.com>
	<20200214143525.GA31591@localhost>
In-Reply-To: <20200214143525.GA31591@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Feb 2020 06:42:12 -0800
Message-ID: <CAMKF1srgk=M8AV2oeyyvYTJGUffS3P7+W0U6VqGZ3GYFfXau6Q@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] swuashfs-tools: Enable on musl
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
X-List-Received-Date: Fri, 14 Feb 2020 14:42:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 14, 2020 at 6:35 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Thu, Feb 13, 2020 at 11:03:52PM -0800, Khem Raj wrote:
> > Upstream has a patch [1] to fix musl builds, Prior to this it would not
> > build on musl due to missing GNU extentions for fnmatch
> >
> > [1] https://github.com/plougher/squashfs-tools/commit/4280e74de14070869787a9166242f9ce2dafd82e
> >...
>
> I did already remove a similar bogus squashfs-tools change from OE,
> with similar FNM_EXTMATCH "fixes" in ifupdown and elfutils
> also resulting in the expected runtime misbehaviour.
>

I think it would be better to use gnulib implementation for these
packages you point out
and those patches will be upstream worthy and make them portable
as well.
At least it is calling out bad elements.

> I am not a fan of this musl way of fixing build failures by turning them
> into runtime breakages.

