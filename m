Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0A06E71AD9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 18:37:10 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id t8so17003917vke.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2017 10:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ypCL3Jbc7xtzvqZn+pdCyYcPXv9aIqeXrC2qoA/3pa0=;
	b=fEaDHLuO4ZvjQVYL90ZpIX7rrXbJqajVa6wmQcUKmnJDbK8jnR34sMd3y7PmEBti3E
	2BkV7Rdc5vhnnRktpvuPbytzlTe2AXAyQ7baSB1uCjmR2LWEkJl/OmWt4zhGVa/D/+9I
	/SJXkc02rXdgtapkextxOgvv9vj+bgUtQciFFRJqBmxU2Z6hzzhvy6E34rwidROOlq50
	2ph4VAXGkmH+kKnYfqEiNnQmljnCo8lKEYvxX54prsCCt1/X0dA3mPDplCBi9oKdCCpY
	VM0jNNAwR4BtuS4ragAvWUbgYCDUPLTDKeAZ3WOjHzPBf6rBXht5oK6aX9t478PBr0dZ
	2nzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ypCL3Jbc7xtzvqZn+pdCyYcPXv9aIqeXrC2qoA/3pa0=;
	b=Zy6DZgFpA70iqPfS+DLIJG4kIC3BNfrWYmrKQdk/xXbHw7NbwiIhEWb1FGp6OuWc9h
	EP65xVkjt0TU5AWPVWsG+hfRSWbyu+F0oGwvTze/EWaKcf3m6tKFKZGD64sPAuVz65AE
	Ow0TUNmjaqH3hi1wSkbHjBm1O636NKP/yLyV+j94s9VZWK+oJyQDVrSYdZ0lhhdjMBC7
	gtwLm6Yp8FfCcW2JbDKFe5jGP8fEQcqtqdS5hxCZ4s3YSZy6NOhhIEIdEfJAOOz+qnPU
	Gh02JhqW48ytvI9UVxrNNd7o3Q1tY78T1JbDbzqFAd3NZkmSvi/nBG5+qS3TGkED76Ft
	PlnQ==
X-Gm-Message-State: AIkVDXJCbzVqlwfkuNN6qwAzQ7p2vZzoiTL2CmpQ1mzxrK93UH8fyCH+IEuemT9iBFD7szsobY8uQq4D1sVyRg==
X-Received: by 10.31.108.149 with SMTP id j21mr3898092vki.93.1486060630856;
	Thu, 02 Feb 2017 10:37:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Thu, 2 Feb 2017 10:36:40 -0800 (PST)
In-Reply-To: <20170202104105.yl4nrp3wbym7ahhf@ad.chargestorm.se>
References: <cover.1485846907.git.anders@chargestorm.se>
	<6f44da9601d2ae87573905ca1b7fa30cf5043100.1485846907.git.anders@chargestorm.se>
	<385d3282-7a91-7d60-cd6a-393ada75bd09@gmail.com>
	<20170202104105.yl4nrp3wbym7ahhf@ad.chargestorm.se>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Feb 2017 10:36:40 -0800
Message-ID: <CAMKF1sptX0x3-WDdu5vgXiKcd4DWTWSZCePvy__DkOA=GWzzOQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/7] python3-manifest: move htlm.py to python3-html
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
X-List-Received-Date: Thu, 02 Feb 2017 18:37:11 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 2, 2017 at 2:41 AM, Anders Darander <anders@chargestorm.se> wrote:
> * Khem Raj <raj.khem@gmail.com> [170201 17:52]:
>
>> On 1/30/17 11:18 PM, Anders Darander wrote:
>> > This allows us to use html.py without importing misc.
>
>> html.py is provided by many packages. Does is make more sense to package
>> html.py on a package of its own ?
>
> Hm, I had another look at this. On my build:
>
> $ du -sh python3-html/
> 140K    python3-html/
>
> $ du -sh python3-html/usr/lib/python3.5/html/
> 108K    python3-html/usr/lib/python3.5/html/
>
> Thus, the major part, 77%, of python3-html is related to my change.
> Thus, I'm not sure that it makes sense to put html in it's own
> package...
>
> I'm not going to add a new package for html for the moment.
>

OK, I guess we have to address is when we have more occurances of
packages providing html.py show up

