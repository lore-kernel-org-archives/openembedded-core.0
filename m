Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6B2E17C8CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 07:04:18 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id f196so11427805qke.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 23:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4P1MOtEs1RUcwxSiAkmvA9NmuGiImn1i0V9JlCdp7ZU=;
	b=Z+TpG5CV4uWGx13Jz2GpxiEp15rWUFrrfHEfYqCXqkMdnbcxxc+0OjGgYlDAFLh8Xa
	PhUluQ8+PezOuvQ4OceDIhjJDxaK/LUKRVLpQhg7SS7xymuRxPQfEPfM0AxGmY6HLERJ
	X9ITb0zRvUnclvZtjcJ7B3xguQfl8lMpJCQFnPLMrrv2fWtqRvD0Dt9zU8Jo5BryMhXD
	hzVzM/vNyznq7Sd7GDYM09NJ8Ch+fI88/+PyfUMAaQ8l1UvMyPgRNGNxFy7zVbrK5eyH
	5wDzNGeAmZluCBkpYBxUgeEx7e1zQ/hpm3wYJQcQPDcnOfv17uWgwzg2u2tleQH5JblW
	TyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4P1MOtEs1RUcwxSiAkmvA9NmuGiImn1i0V9JlCdp7ZU=;
	b=ALst122tAb/vVZr1hsbb3AfOOJgXXEW14BMF+jD1e6X1evigTRU5mnscp93ICJX93/
	EkjZ4snscedigMz17tlG6EULgHP5O5qG5iKu4u5uyJE7zfdmljEYys2wjg7f+3E9ykgz
	acPu8xTPO2zW8/KTDS9Yzc/GXQ5GtHP1P/UpvF4AKptRf8sJYx5meHU2SnM6te6E4bHC
	lsd9KJE3FeeyC4XlNblz5H1ZUblWTUjWf4iw9wyfkGZekNUB0ZDT8e+CsucIZlwYSHMN
	No9TjyFJYvtsrjwjifZAgoeXdH9MT4S7WoOyUTNUGmvt2BkU03TzKCcipAGmEkdQpubJ
	oMfg==
X-Gm-Message-State: AHQUAub7VXhKJSc2cn9/MxlYBVnXwuQeEsKyfSinVnfzshDdSeS3EOPg
	Z8POGui3XN19WFgLzPmwf5sCe1GXJKwhs1EM6B4=
X-Google-Smtp-Source: AHgI3IYaPAU1s59j1VkXrLU9R2iOIS81FhgCY+GyzJkB0u1FyeCcChlh2MT6EVfaLK0kli0kQBwvwxfdJog4P1lLQ3Q=
X-Received: by 2002:a37:a7ca:: with SMTP id
	q193mr19740414qke.102.1550559859181; 
	Mon, 18 Feb 2019 23:04:19 -0800 (PST)
MIME-Version: 1.0
References: <20190217145107.2796-1-pkj@axis.com>
	<eb8026185baf26c376b24633aae735c8f2076602.camel@linuxfoundation.org>
In-Reply-To: <eb8026185baf26c376b24633aae735c8f2076602.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Feb 2019 23:03:53 -0800
Message-ID: <CAMKF1so2Pd8cVg0BQPt7Jsg7ZYWPjjerqS=uqCXeHqr-pci_LQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] libc-package.bbclass: Correct a few paths for when usrmerge is used
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
X-List-Received-Date: Tue, 19 Feb 2019 07:04:18 -0000
Content-Type: text/plain; charset="UTF-8"

I am seeing locale packaging errors too
https://errors.yoctoproject.org/Errors/Build/76954/

On Sun, Feb 17, 2019 at 2:53 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2019-02-17 at 15:51 +0100, Peter Kjellerstedt wrote:
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >  meta/classes/libc-package.bbclass | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
>
> I included this patchset in a run on the autobuilder and its failing:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/66
>
> I know the resulttool failures are my fault but the glibc-locale ones
> aren't. I'll abort the build as there are enough failures to know its
> doomed and I need a results set for other testing.
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

