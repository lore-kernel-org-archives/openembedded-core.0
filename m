Return-Path: <ulfalizer@gmail.com>
Received: from mail-ua0-f178.google.com (mail-ua0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 460EA71998
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 11:26:15 +0000 (UTC)
Received: by mail-ua0-f178.google.com with SMTP id u14so11828560uau.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 04:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iNjaDp1NXzePpB/fHFiMMhv6QEMG8fA9p3rZyrPVrLs=;
	b=E+nk/OkIgtxaWABpK7l3hKcAxpsF/tThNB7NQBEqcToa8fxD0K98JvZIyVQCdlM3ZB
	ZKE26NlktFDnVxFFT+gkckFy8GDlJrwlgPPutKjylotVNNHcJ3zLU+u0QU+FFWQnmkrw
	q5lmGPOwHIT1ANxv2liqvDZ9/klHXbIfhdxz58cNgwa5AictS2vYfFs6Wjfxl1WNeTtC
	ZekoD1N87bKSrnmvEpOdnCYUIUte8Agwk3ydK7envx1ty3QXyQBjQRpWatsw1fQP4L+a
	Pk6La4B/8QDaCZjSPGRZRiUYHzlcm5x4lS9lwwKSdp8i3NgeOnxm4zA/PDvBRYCu52pt
	xcOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iNjaDp1NXzePpB/fHFiMMhv6QEMG8fA9p3rZyrPVrLs=;
	b=ZeVrrVAHedS5cG1E8wT2GVXgu8TKD8P6YGrR6nDzQXYRbguQV6uNndW253HA/XgAOs
	BkhTEvx2aDm82Ac3eohZs7wlLsg9Q2+U4J1xIeTVu/wt6b+/aAnR8LlmjLeDgR6gpDar
	OGyzK4ujjada32lg7QY+RFhzbDPR30ndyuP3qC4IT5X5ECXOWCt3ZPoc/aC2ThVMc4KB
	g+Cdf4wtNDwglmB11icpng5R9nems2dOEfRsYXo+Aw383KwQJ7pAByT697ckMokLgzLN
	HFoj6q6EDUuAnXhBlEXpjlDQ5wGDkZrFeuQovR2BKr00+IVTHuwpNTqEy5thD9CJH8J1
	s5cQ==
X-Gm-Message-State: ABUngvfL4y2FygFGFmwFFSVNH07drcmoUadN4aPDt7AdnZmKF+2dx3VQl03VNMnN9xtpQyR0qIqNpMjnP4kUPQ==
X-Received: by 10.159.36.112 with SMTP id 103mr13491128uaq.17.1477394776855;
	Tue, 25 Oct 2016 04:26:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.153.194 with HTTP; Tue, 25 Oct 2016 04:26:16 -0700 (PDT)
In-Reply-To: <1477393407.20929.2.camel@ts.fujitsu.com>
References: <1477387924.20929.1.camel@ts.fujitsu.com>
	<CAHiDW_HLiPEOXC6FgaenUr1s0sByoG6Zn1X-u6Q2D439A8rOXg@mail.gmail.com>
	<1477393407.20929.2.camel@ts.fujitsu.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Tue, 25 Oct 2016 13:26:16 +0200
Message-ID: <CAFkk2KQ2xEcx1aCzVqK5z=hGFpFGYttE5HgNWymgadEFLa_1Kw@mail.gmail.com>
To: "thilo.cestonaro@ts.fujitsu.com" <thilo.cestonaro@ts.fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Howto find the providing recipe for a specific package?
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
X-List-Received-Date: Tue, 25 Oct 2016 11:26:17 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 25, 2016 at 1:03 PM, thilo.cestonaro@ts.fujitsu.com
<thilo.cestonaro@ts.fujitsu.com> wrote:
>
>> $ oe-pkgdata-util lookup-recipe kernel-module-xfrm6-mode-transport
>>
> Thanks! That is what I was looking for!
>
> Cheers,
> Thilo
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

Hello,

oe-pkgdata-util has some newly added documentation in the 2.2 version
of the reference manual by the way:
http://www.yoctoproject.org/docs/2.2/ref-manual/ref-manual.html#viewing-package-information-with-oe-pkgdata-util

Cheers,
Ulf

