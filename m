Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3F12D6E717
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 12:49:26 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id vb8so6830262obc.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 04:49:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jeNThopbEQbsYFf0XKSU4Pdxr68R2/HmLXywHOSWuNs=;
	b=T+mIlXkeXAOm3hO3TBCxpO630PnhYW4poriqbzrQbHS+/s/KGm8h+Mm0CM+58YwFto
	nXSrnRYg9NFpRWPW8l9692yCZOekrP5VOpqqj4Gd5Z1cuG1KS/jQ0ttJj26R9xcjWIk3
	O9e3c0zk6ILxRjRCuV9856VeU5xXqsPLUkoOJE7xviImwpkCuOOF2FRh2xIB789k1okP
	mivMdwWiuCZAGNc5ZP87hHTymCR+7pVZGmuifA2NE/AbDyFOx4OYynGGzlO1w/0qfQwN
	Z12+xjFPdXDaojb0u6j92f41o1OKANBgf9j0xsDW6ab9qz7MPc6JYWPeGjfxm3WuQljN
	f8yQ==
X-Gm-Message-State: ALoCoQmm+oSOL0t6aYkPhm4lcneqsePysAyofxclZLm2ibVT6PDw6+qp81gvReEQ9uM6SCEO7A1j
X-Received: by 10.60.123.74 with SMTP id ly10mr2406283oeb.14.1393246167109;
	Mon, 24 Feb 2014 04:49:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.182.99 with HTTP; Mon, 24 Feb 2014 04:49:07 -0800 (PST)
In-Reply-To: <CAOMwXhMz+_KcMzY1Stwi2g8EyFg+8BVajqrrvAX7Xd02qVNG9g@mail.gmail.com>
References: <CAOMwXhNMs7top-CBCDf8Hgsxxz7=oBocF6YjbC_PhH1PDgYG0Q@mail.gmail.com>
	<CAP71Wjy4kX15uoz=_42+zRKS7i91TYnGM=2u35+tNXf7CFoaww@mail.gmail.com>
	<CAOMwXhMxcr_EVZx4uVnnpGvcq2MrMchHVUL5ApBdC+4bH7q_Yg@mail.gmail.com>
	<CAP71WjwR9Lrb1QeHPEXLGnPe+vcEnYtgMDoQZW-eNayOMubbKQ@mail.gmail.com>
	<CAOMwXhMz+_KcMzY1Stwi2g8EyFg+8BVajqrrvAX7Xd02qVNG9g@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 24 Feb 2014 13:49:07 +0100
Message-ID: <CAP71WjxHc6+9DDGeQsuAc3Cv7qN+bfPgNT-ju01z6pje3Q2qEg@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Conf notes
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
X-List-Received-Date: Mon, 24 Feb 2014 12:49:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 24, 2014 at 12:47 PM, Laszlo Papp <lpapp@kde.org> wrote:
>> hmm. do you get any error message?
>
> Nope, I have been using this construction for several weeks now. The
> local and bblayer samples have been extracted properly into the build
> folder, so in that sense, there is no infrastructural change
> introduced in here, just yet another file added in the folder.

well, i don't see what can possibly go wrong then... especially if
layers.conf.sample and bblayer sample files work fine... maybe adding
"set -x" in the script would reveal something..

nico

