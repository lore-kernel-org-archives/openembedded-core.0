Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f169.google.com (mail-it1-f169.google.com
	[209.85.166.169])
	by mail.openembedded.org (Postfix) with ESMTP id BFF2B7DE3F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 May 2019 17:34:15 +0000 (UTC)
Received: by mail-it1-f169.google.com with SMTP id q65so8949268itg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 May 2019 10:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9Oezh/W7dC3SlwyBaoKuzalXtSVIZcPKlx2Hwu85Xkw=;
	b=c8IojuhSxRwuKz4NJr8YxHYclOUynLP8Wi4thxB1YveUAabI8Sr+kxJ4M2RjGKgScp
	1i1fCrVzEvbvhOa+xiC+xdeaNzD50Cn8+7fDAIvmYKsv5+dLkZXBuF1vjJveKFSumIn/
	PvBLQRhfnGWCesW4rjO7+N/sy3q6SVQcwvL52cwW3x4wyvBtLCRzsxA70z0zJvTWTcid
	9kgEv/fUtEwCQtc42v9UzWg8feooJh9DdsxhYHrtrAqHjU9hebtnaKhs4nG8eXKpVupK
	yEQn0ktyeBbG+dTl/fJjZJROIDWV/nM5zxRbpCX+fXyn0zHd9kkt7OSZ2u489YZb2YWr
	gf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9Oezh/W7dC3SlwyBaoKuzalXtSVIZcPKlx2Hwu85Xkw=;
	b=RTRruaudttPSbleY0SuE+0qI5ZbSEwzPFUetUO/498fxhz7n61tcFAzNY/729NSRId
	5iPzdx+8zlqNWH6puJM5haxKZlBOrgRckS4ffLUCJnmFRpJJaiTZdi1Q9S+ubB72L0MX
	q/jCe1KqTUg0/gvdcrH540lHtXztUkoJGi1qjLP+3eVGfIPzcXy5TcklXSIMrP8Snbfu
	sMdBZk4ZX2zqutkOLtj6mgtA498n04q/XxfSSg423Z09m9+Ze+HNbf0u6aa/hFIQibMK
	VcJnHkidtZectcme16MmvN10TTcZniRtPvA9IGYawFcMYAsaGMatj/gCKdkL9alNnDpx
	EG/Q==
X-Gm-Message-State: APjAAAWBWPsy6ZSIMlDlpKnycqH4jejvsr8/9jEKp2l/o3rekFLJaNXL
	8RadysKDveps4AqwS91GA7PEzpsomxsV6en8fZdLtw==
X-Google-Smtp-Source: APXvYqzWjxfqxvb2hX2Zmc7VqTf6hZytxTA16wd8/phqwEQaVbc6nbK5gUcyCyuoHr0c1O//65kSDWFxycYR7G6heLw=
X-Received: by 2002:a24:4145:: with SMTP id x66mr8246248ita.130.1556904856683; 
	Fri, 03 May 2019 10:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190503164734.130778-1-alex.kiernan@gmail.com>
In-Reply-To: <20190503164734.130778-1-alex.kiernan@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 3 May 2019 18:34:05 +0100
Message-ID: <CAJTo0La=VGkcFe+EZ49ki9Bb2-z7kVoOGDN7i8wcVcc6iVitMg@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bmap-tools: Add RDEPENDS on python3-misc
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
X-List-Received-Date: Fri, 03 May 2019 17:34:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 May 2019 at 17:48, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> The newer python3 recipe no longer includes python3-misc in target by
> default, leading to failures:
>
>   Traceback (most recent call last):
>     File "/usr/bin/bmaptool", line 6, in <module>
>       from pkg_resources import load_entry_point
>     File "/usr/lib/python3.7/site-packages/pkg_resources/__init__.py", line 42, in <module>
>       import ntpath
>   ModuleNotFoundError: No module named 'ntpath'

Looks like ntpath should be in a different package if pkg_resources
won't run without it.

>  RDEPENDS_${PN} = "python3-core python3-compression python3-mmap python3-setuptools python3-fcntl python3-six"
> +RDEPENDS_${PN}_append_class-target = " python3-misc"

Why class-target only?

Ross

