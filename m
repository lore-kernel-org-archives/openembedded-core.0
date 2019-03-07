Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id A401D7CE65
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 23:39:44 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id v83so18757769itf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 15:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MXdWAf6NtZR9OyQ70cvX1XMEqcgRIE3LowS4y9ecnF8=;
	b=RPiRYyrBmoXZpe4LyYfuNtONslYYufYBkb3xywaR4j+fIJSzfQQirzJTq3nSPRn5zr
	MtAajmAnD4Y0MGTqUxnev+WUNRLA81L4A9BsoZJ2Sj/6X9EI6vWcP5IvgSacy4fQUUG0
	cUKbNYOEjapmBQG+9u76+n9zujgu4FNnvTUD2g8b5hOvCeBWSwmDNTDcOkzrudhsWP9b
	ELPjCVVslrsE6au0D3/pb7xnxRWMIlnzv6VgM7eVThIhSxn3L8dJ65AqKSq7OdK1R6XU
	uEMO2tiOwVZ116dZUMhHbE8GkfuFh66PeWp2oCRC0FKwdyy5HKZMFq0kJEMo1Mj8pyWI
	D1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MXdWAf6NtZR9OyQ70cvX1XMEqcgRIE3LowS4y9ecnF8=;
	b=fiwIf6HMeQNDD/tF/k9QYVv4lJSGl2rTUTuRySMOPUDQGemukZjWqFFVHXwb+024Fk
	s8YJEn0LSJKJZgzfA8+3n1KKi5c43LGnxSmPRbqQvdRpzo92BLHVgzfvxWKyCEr/Q9Eu
	uujQ0q0jEpvn+bRQkE2sQkgwxSj4Auy9mWVrtbQmz6pmyV2tgDrusgcM99M26G+SNrio
	VSVgOIDX8eoEoX+LREhUfE1NB/lJ3vLrzXgiRvdmnfc48XIH7nufzK0eNNbg1X+su2hf
	ArBw4p4kXaeLUq10xy/MuVGikmvBFEU8wzd+iUO92dD+8hLjQHXq3842/IlE6747DAaX
	YdAg==
X-Gm-Message-State: APjAAAUypx30Kh5BWQDB+FeBw/uDTwYebXGIEnUPo+8gjhSJ+Oqar1Ke
	EBDgUMGTIOOCesguk56wJfiUItM/0QQ1XfVCLJKm6g==
X-Google-Smtp-Source: APXvYqwdPpNtdCb6DZ1C7Epj0gCLjS7F4xTqF9zHUxSWJKJhAj6Q/7ONRwo3Gw52CYTQnMibbGzkQbX4D3ByhWuopDk=
X-Received: by 2002:a05:6638:348:: with SMTP id
	x8mr9296319jap.79.1552001985686; 
	Thu, 07 Mar 2019 15:39:45 -0800 (PST)
MIME-Version: 1.0
References: <20190307214242.37072-1-raj.khem@gmail.com>
	<20190307214242.37072-2-raj.khem@gmail.com>
In-Reply-To: <20190307214242.37072-2-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Mar 2019 23:39:34 +0000
Message-ID: <CAJTo0Lb_+fBDemU8g935piNkVg1BXcSZC0D4i33zqCxES45pqQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Rob Pike <r@golang.org>, Avelino <t@avelino.xxx>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 2/2] go-1.9: Drop the recipes
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
X-List-Received-Date: Thu, 07 Mar 2019 23:39:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Mar 2019 at 21:43, Khem Raj <raj.khem@gmail.com> wrote:
>  .../0001-make.bash-quote-CC_FOR_TARGET.patch  |  32 -----
>  ...d-CXX-environment-variable-construct.patch |  67 -----------
>  ...tter-separate-host-and-target-builds.patch |  92 ---------------
>  ...OOLDIR-to-be-overridden-in-the-envir.patch |  68 -----------
>  ...d-go-make-GOROOT-precious-by-default.patch |  41 -------
>  ...TOOLDIR_BOOTSTRAP-environment-variab.patch |  36 ------
>  ...7-ld-add-soname-to-shareable-objects.patch |  46 --------
>  ...HOSTxx-indirection-for-cross-canadia.patch |  33 ------
>  ...-pie-forces-external-linking-mode-on.patch |  47 --------
>  ...de-CC-when-building-dist-and-go_boot.patch |  43 -------
>  ...011-use-GOBUILDMODE-to-set-buildmode.patch |  40 -------
>  .../go/go-1.9/set-external-linker.patch       | 111 ------------------
>  12 files changed, 656 deletions(-)

You forgot to remove the recipe.

Ross

