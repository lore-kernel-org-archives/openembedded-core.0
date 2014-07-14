Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id D3E51701A9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 10:29:53 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id r5so2502008qcx.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 03:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=C0HDRzKkpOsg+JiRxmQ9P3ptMeO1mdRNScJpDcwpMWY=;
	b=IQdTWgJeEbfEpY4NW8hMdxEj64oXOzrbo7j1xcrT+1uTNy1rUcJdgj1ekBT+B0zEle
	xslxcbNxfmYrqq3YhjxJCgVCK5FNMkz6Q3AyZmBu3/NV/te1+gsGcyVr2ok7W5iwxQou
	GwgcRYqMNeEuVYnk4/B2+qrIQGuuPCyOEKyKqDWEAdMoRCu51zr0O+DvvomTYyNsQkvv
	F38THL3+jShgU6i16zWbP8TJ1JHd+KSnO42CnvlngytzkWSnFClsDiSVXU+rM7TGgBTu
	sbYtbQuO4bRU5ci1zxcWyuFxNocEamBTK0d+koZCxd9dAQNQUJ4ddCjPt5H+Z8+MSe+r
	10xQ==
X-Gm-Message-State: ALoCoQnCPRGlHzxGJHriddWUu27LaCDFnl7Aa2CYplcNY+4Ms+GP6UmlV2XcHlx92+VtCoAE4GpS
X-Received: by 10.229.13.134 with SMTP id c6mr23366696qca.13.1405333794699;
	Mon, 14 Jul 2014 03:29:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Mon, 14 Jul 2014 03:29:34 -0700 (PDT)
In-Reply-To: <965b510cf2d609b1fac50901312b3372d4e063a5.1405330780.git.liezhi.yang@windriver.com>
References: <cover.1405330780.git.liezhi.yang@windriver.com>
	<965b510cf2d609b1fac50901312b3372d4e063a5.1405330780.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Jul 2014 11:29:34 +0100
Message-ID: <CAJTo0LYg5msYt02t9a6xaOtW0opqvgrC1YZesCb3FjOL7WSFDA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] package.bbclass: convert file depends into pkg depends
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
X-List-Received-Date: Mon, 14 Jul 2014 10:29:56 -0000
Content-Type: text/plain; charset=UTF-8

On 14 July 2014 10:41, Robert Yang <liezhi.yang@windriver.com> wrote:
> +    prog_maps = {"/bin/bash": "bash", "/usr/bin/perl": "perl", "/usr/bin/python": "python"}

Use something like d.expand("${bindir}/perl") instead of hard-coding paths.

Ross

