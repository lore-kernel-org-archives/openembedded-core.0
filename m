Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8F2A97E422
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 14:25:52 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id o12so29847763qtf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 07:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zpWCs91BSEYiJMWRcKYf5ksbTS6wRavxL75C4v0+0V4=;
	b=qBAK1mGNUxrLO7A4F0VIPIDLOX7gSzxb0UN9yH9CTt0gtAvylV/6J2fMUO+gi0LePl
	omHSuKwSWkF7YM9qf0N65GdkVZe32J46t1Lvd/tG6t5WGao2ZEml6HljEQqB0oEPow/K
	Muw6ciLBqJoUNAPSONy9LDe5nOM/CM9w0vUY2NM5aowuVhHqi7OPRBe0YvY2YjWwjoye
	q6NFeXL2dx4ViuOrj4kali5MXR091/md3pLD9yVAIdjsEW5IAU03ft7LzJtCtseZkaC4
	Fm03YKvsTY2WRQCYZm4TJpQMxim7UsvNsUw4zqC7v83KZFdKBhg3TtWJwjbEAXOpNk42
	IOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zpWCs91BSEYiJMWRcKYf5ksbTS6wRavxL75C4v0+0V4=;
	b=Lm2aLHAq2vRaDyIIQehmVnyrW4liaQfRu6EWYpHlVMhF5Lp4pzVbAs7eFGTFOkmufk
	XVO863KTuYf5ExQQOusfSiVYn8+iZla35x8x/7CFPPYwhkrsH8N887lq1CIABHxMDDRi
	Xmjs12h0SKessN4P2OdWHylhWGJTknkto/GmShG8MovhdO+MKuZPI+uamsTBTYZIKjxv
	MiNVTYbYzUfTQQ17ToiOjB4EvbbkLiscp758pRpz0koe+Azj5qvyXqA0OQ9juTstdX8N
	YUYD0jGSTAIyY1P3VTMgDqLGTXRvlJvz64E1NhkFoXt/Fj5BcT5n5zuQcCg6Uq3gBHR8
	XWzg==
X-Gm-Message-State: APjAAAX2n5BUOvior/2OiiV11s3JF3p3PZu5bP7c93WGDhW9qQm/zBb/
	9+ISOCGsXvgx2r9o5o1Cvl3ZVGtEQ3wUYaPU7V/c+A==
X-Google-Smtp-Source: APXvYqyVsb9vEEoeX7CH6FpkzFG8wC+j6TwpFR7Cf/2sC/JvpDpfIWs95QHirNl2Bm+N7e5Y35sFbqKvjPZh1frb8TU=
X-Received: by 2002:ad4:4c10:: with SMTP id
	bz16mr25896298qvb.160.1568298353340; 
	Thu, 12 Sep 2019 07:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190906184727.552-1-fabio.berton@ossystems.com.br>
	<CANNYZj8jseQc9Lnt8r1SuDdh4q_xUJy5FkpUukpLzUbVn5vW2g@mail.gmail.com>
	<a74c7fb7-451c-094a-36a3-49b62c66d742@intel.com>
	<CANNYZj-2tw_kkoj7OqwhbBggFE7dvZ7dv0FhmsVuA2vOWQBf-A@mail.gmail.com>
	<ac6643d7-da5a-0ec7-799b-06083b728381@intel.com>
	<CANNYZj_oMcEekZoLJ+2vsGc7UgOETJppY1UZ9jDj8z86PeSnXQ@mail.gmail.com>
	<268869ab-aa03-cf7c-c75d-9aa8dd7fd5ab@intel.com>
In-Reply-To: <268869ab-aa03-cf7c-c75d-9aa8dd7fd5ab@intel.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Thu, 12 Sep 2019 11:25:37 -0300
Message-ID: <CAAPZna0uYixPUVj+CmjT9YGeuR9+Ls3z8d2oskjU9mjk93dhSQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade 19.1.1 -> 19.1.6
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
X-List-Received-Date: Thu, 12 Sep 2019 14:25:52 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Ross!

On Wed, Sep 11, 2019 at 9:35 AM Ross Burton <ross.burton@intel.com> wrote:
>
> On 10/09/2019 11:39, Alexander Kanavin wrote:
> > Yes, if STAGING_LIBDIR is set, via this patch:
> > http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
> >
> > (don't shoot the pianist, it was working like this pre-rewrite as well).
>
> See I knew that but had blocked it out because it's so horrible.
>
> One day we need to sit down with upstream Python and figure out how to
> handle cross-compilation properly.
>
> I finally managed to make my own builds fail (had to turn off Python in
> libxml2) and beat at it to build without a target Python.  Fabio: can
> you try building Mesa with these two patches:

Worked removing python3 from DEPENDS and adding these two patches.

Fabio
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=ross/mut&id=5f3559d8bb61212e0f9a6543f2dce2bdf77c48b5
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=ross/mut&id=4f8995aaa2ec557a0603ddc664d929317b0c0b6e
>
> Cheers,
> Ross

