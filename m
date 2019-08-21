Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 84CDC7E6AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 16:05:58 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id x3so2238516lfc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 09:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=slXmsyBKbql6gYrMiz3kUZ3dKckmF1goTU3S+kHCGRY=;
	b=PeDoJSvvxREuyZkZQMEFEQ33aV9HLOUG7GrLeCGtbwvlVKZanfZl5tU0dBTwlXpJl1
	VvXoERzK4YmdFa2trAkkPcpJ2u4xy/D+DWUaUPSxZunjVBS7rZPnQHmKT634D7nOgpCN
	U+eSoYWKW2ActMZFabf6wi5hZQkpg5II+yO8pN2+HltDWwB3hqrgWPX1sGL1/geOkHOl
	B4CjZNiJwkbn8lj08ZGnF6tEsraTG8xh2Md5eWcv7jx9fgJWtbdmk9gElUcpwTbjFoFt
	/LLrTUM9ELGsnOXX//9u0+yqhsYNAe7Fvu3m62ZFlAv3j4erZBlCexkbY1AAhMqhcgMd
	2nPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=slXmsyBKbql6gYrMiz3kUZ3dKckmF1goTU3S+kHCGRY=;
	b=n09Oyu5LKkj8zeTLY/wa696YOQ1e3Dxrjln5/ZFqLBWuPHPwon4fdkpk1hF4drF5l8
	yGDbp5VD8mwKVnBb9yvsYUpy3vkNKvdkep0gneS2XaoyDUJVDcV2hcIIQGl6HdaOVLVw
	F0ft+Bnr1BIBdS5ZtxodkBuDXC9v4X3nYdXnDzSavNtUrWrau6RufIW4k852WP/JRPJj
	vlTOMAM5YVpfsaBgKlldInx5Z/zRYjDO/OwNNebNlAUdaKfmQJ0g5iHPi0C6ZT6igFTN
	e+jCX0faG1dpml9RUAXN9eRlL8CbkFZD1JYEvg6iPuTkVxTTpAzzuoRckcPwlIY38L+G
	1zgw==
X-Gm-Message-State: APjAAAXNkABdDAZHDZ2ZwrwiSkB4zYJUR4xnlxz/MOqUwwj8k9JFaa4X
	CPQ0UzPPhV9AKVuk4r4BtKc/AJudDzcTMnmzXs0=
X-Google-Smtp-Source: APXvYqyodYaJis+bwuuYCzWjXQxGuCmBJMyd5ay7JBL22b4Tl2leHS1ZCdUFurt7YnY2dzoPYxvbRoukXtgb+G6v638=
X-Received: by 2002:a19:7709:: with SMTP id s9mr18033536lfc.86.1566403559033; 
	Wed, 21 Aug 2019 09:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190820205917.21297-1-alistair.francis@wdc.com>
	<5b4e3af1-4f54-2b8d-a378-48cca0d98816@intel.com>
	<2f8f87ef44cafa2769c654811bc0416c04acd872.camel@linuxfoundation.org>
In-Reply-To: <2f8f87ef44cafa2769c654811bc0416c04acd872.camel@linuxfoundation.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 21 Aug 2019 09:01:55 -0700
Message-ID: <CAKmqyKPnu9PrM5RxUdQ3932dLFgfijVzQK3Zma3pw7dWQ53Hhg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] qemu: Upgrade to version 4.1
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
X-List-Received-Date: Wed, 21 Aug 2019 16:05:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 21, 2019 at 5:25 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-08-21 at 11:11 +0100, Ross Burton wrote:
> > I think this series is responsible for testimage failing on qemumips:
> >
> > WARNING: core-image-sato-sdk-1.0-r0 do_testimage: Couldn't login
> > into
> > serial console as root using blank password
> > WARNING: core-image-sato-sdk-1.0-r0 do_testimage: The output:
> > root
> >  7

It looks like it is merged now. Let me know if there are still issues
and I'll investigate.

Alistair

>
> Although it passes in my -next build which also contained it so I'm not
> sure about that...
>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

