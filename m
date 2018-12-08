Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7A5CE79CBE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Dec 2018 18:17:51 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id n21so8153443qtl.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Dec 2018 10:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6z/S00l6QB4ZzlEe0IPA6/zOPwX+gaXEbMZZZ7NCl+w=;
	b=YGLVcQ2NfehJohjwMdhY+Zf+jfRqQyvd9aL5eeI4pMKUXgOjJkEyP6crjR45oJH+M/
	6DKvMc3v0InH+0+eQe2buLBtqqjNOUrhwqcMxCXidqWttMgmQDhIvYwzqNgf/70Md6Aa
	ExLnE8BvC3l2nNsroR1Ncx+I+edSKr0kKfhyMnqCzu7iycjuMY8W5D6o4DSo/zcksyRZ
	ui1g1mv5qS93fX1RJWlW7bFQr+kmuw1wO1Nln9LhtqUnwFy0AB5sj6dk049erowr5cf1
	zORAXy6E4Kxm7R55knKLNt3c10l0TvtZHO1YaqftThr42zhbshxFVPPBP1Y5zAK6Qit2
	GiJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6z/S00l6QB4ZzlEe0IPA6/zOPwX+gaXEbMZZZ7NCl+w=;
	b=tcP87YaTlgeqkxmbzy2Xlm9J46NNPc4GFM0jeahL5ChO4NTjrzxmfuVpNh34hZYPQQ
	2+CdiB72+aHgdL2+DlA9iREfSNn4ZM239spO7m7QH/3l6/bx4mAAlPAq1GNI746kCacV
	5eXqUYfkCKcihQ1Tz8j9GU4KwapV5N67E5sLMZdXYxV/IL6gpEjb24jczhRcZvrmsD24
	2jvceZgOmwi4XO5R97gMMSEN9MjJd8UXYnUnyPtT+9I6uqJhkHKxwMcyG9EwXv0HrGuW
	9GohfKbwRNJZjR9lUsMPtzbR/dwLRrCKvbcU8hWA/ViRUojOwzzEf3TbpF1arAkylTuV
	UYCA==
X-Gm-Message-State: AA+aEWYMb9W0aBhF84hNdL/kFa3rLF+wqkZYZH8rMWaExyzjhvVhTyqs
	JBbCCT6p2crsC4hcifwINhc6rFtqJkeA0mabasxDmcaR
X-Google-Smtp-Source: AFSGD/W8MDF3Bw63Do9hgid588BsNFf5uuB+dLNaS0W986tZ9pH6Bi6bBQ99WiJWvJsNkm6j+7GfIc1WO+bJTMMF6r8=
X-Received: by 2002:ac8:36ba:: with SMTP id a55mr6387314qtc.236.1544293072150; 
	Sat, 08 Dec 2018 10:17:52 -0800 (PST)
MIME-Version: 1.0
References: <20181208102638.44170-1-raj.khem@gmail.com>
	<e0bd92138fc94749aea670bf00d5b5631c893304.camel@linuxfoundation.org>
In-Reply-To: <e0bd92138fc94749aea670bf00d5b5631c893304.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 8 Dec 2018 10:17:26 -0800
Message-ID: <CAMKF1sqP1m32=r3UjbN90b+TWJH4aRTaGvoHW_0PVhYUdzRjbw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] mdadm: Drop redundant patches and fix build with clang
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
X-List-Received-Date: Sat, 08 Dec 2018 18:17:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 8, 2018 at 3:15 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2018-12-08 at 02:26 -0800, Khem Raj wrote:
> > Several patches were being applied unnecessarily, the purpose they
> > served at one point has either been fixed differently, or accepted
> > upstream.
> >
> > Add a new patch to make clang's diagnostics happy
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Sorry, it doesn't build:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/71/builds/45/steps/7/logs/step1b
>
> (and several other errors)

I could see the same failure on my mips builder. We still need to keep
the ptest patch. I sent a v2 just now.

>
> Cheers,
>
> Richard
>

