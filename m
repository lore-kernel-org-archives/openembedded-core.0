Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB64CCD185
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 12:41:16 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.7910.1760100069403900139
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 05:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZxpTMqCz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3f42b54d1b9so1744391f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 05:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760100068; x=1760704868; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YE5KRIfzAJdCcav6Uw+/rixom4aRqN8HRZFHddGM8h4=;
        b=ZxpTMqCzg/UYtHY4GeERTMzxuP7F1w5bctLjWYluZWalV80ripIOfJIqo7/xKqgAlu
         zxOlZzhUPc+lB2v782irLap9Xx+YFtc/qOJUctBPGD5/EC8EgCeLW01zSI5wwyhbWZKV
         fdYIfdM6wDsoxg+shy2AIcwgrszcKoDaMaHGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760100068; x=1760704868;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YE5KRIfzAJdCcav6Uw+/rixom4aRqN8HRZFHddGM8h4=;
        b=PmrQXr0v4edCd1R9RxOnZigXt307nIUckfD86arXJ0+ji6LaUb/0gOX1s4MswzHGia
         ibsXszUM5383R9crChEEUK7JJ/wn5b2ldPg9261i427nz7P/vJF2VGasDfZr+9Cm7bh1
         NZTQqe/qAmmEJb6zU9KNFl32CB7wksqQRWiLiJUarTVe6kD0SVMcsM4DeHyB+b+BJP0s
         fdsTPD4uNNnJI1mIgOpZHVjWhX/PBbkx23VrIzzlbzFVEtzTyVLKy33mTv4nQh96I9/c
         SupynuyKmvN0RuUOdgCFlbq/r7IYMASp7Q2RzqR90aF6MRXXYyx0PiyRHvefwhneCL+H
         A8TA==
X-Forwarded-Encrypted: i=1; AJvYcCVpIoTTWYYH+Jn0p5tvfN7OjwlqrQXfaFu/lNjajncfylqe03oc6nRaSyM6bO11zCuuUENU1vqWglLIT3g5mVjamw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyuCTVzXEaar5//QpN9/uNz83BZJFTDkS8F96zowRG/H55feRBO
	f/CciWwcMmwT7hefk7At60/75ZWGn03uIxfOEQCk2e7FWgt/0n6qeLAxRgYLoGRxOQE=
X-Gm-Gg: ASbGnctpO6WMrD1uvJJxIjHKTe+pThxIHxSLlHIskcY0W68R/VT3ybA+RmgRkLQl/LW
	3TYUSNUtb/divGgksf8luPezQNJdc4PYjKfxvfCG0oNr+Z9mlzJbH+kjDAx6qNBi+G20k1NJaUg
	sG6K8NWL5sazXKKWL4/E9sM+JOc7bzUnB+IzEnGV9u00/2MO6m+ofNRs3f/6A8Z6PXBKi6ZdU2R
	Hnh3jGxCc7KMArGfCcMYCFqKEHMw6G32tkoz+IxStpBIh5URSDrKlNCDFqj1cblptWxpWe6IQuz
	RLAyVhyF02se4O7PX8klM9TQfa2vWyr3/oqHawVWKsdBV73t/MzyGgSPvFAhMsh4RM1XGW24if7
	mOhoWvRMAqeqHhIbaEebAC4W9CQH0mNml1bfV6E+POSi1WxK8wyf1Pdoa0Rmq5H+lGHutrEID+7
	9uVDMMuzidQ5va1g3sTiQpB6aVtoBlSw==
X-Google-Smtp-Source: AGHT+IG8CBn1RPWsqdJjuaiLaYMNGByEGwt5k2wO/97jYHXa3WoEF23a+VDQqkmaCgVEOENQWB6wGg==
X-Received: by 2002:a5d:588b:0:b0:425:86c2:7b4a with SMTP id ffacd0b85a97d-4266d0da0a8mr6935006f8f.24.1760100067714;
        Fri, 10 Oct 2025 05:41:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3d6b:fc42:c556:a557? ([2001:8b0:aba:5f3c:3d6b:fc42:c556:a557])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d49bsm4294759f8f.10.2025.10.10.05.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 05:41:06 -0700 (PDT)
Message-ID: <e2a50b481dbe839275260c02142298bd7df6404f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky][scarthgap][PATCH 23/23] bitbake: fetch2/git:
 Add multiple revision support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Akash Hadke <akash.hadke27@gmail.com>, openembedded-core
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Oct 2025 13:41:06 +0100
In-Reply-To: <10458.1760096658331781386@lists.openembedded.org>
References: 
	 	<CANNYZj_cgBmsnSyHohxhBFyAUfocnuZLZvBiYLhby2w4-2dFww@mail.gmail.com>
		 <10458.1760096658331781386@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 12:41:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224685

On Fri, 2025-10-10 at 04:44 -0700, akash hadke via
lists.openembedded.org wrote:
> On Mon, Aug 11, 2025 at 01:53 PM, Alexander Kanavin wrote:
> =C2=A0
> I know this patchset is bringing new changes but there is issue with
> gitsm in scarthgap and in order to fix we need these changes and all
> are taken from master branch.
> =C2=A0
> The last commit is not there in master because later in master branch
> some more changes are introduced which are not necessary and which
> are dependent on more change set, hence those were not taken instead
> added this extra commit to complete this patch set.

Fixing a bug doesn't automatically mean something should be accepted.
We have to consider the risks of other issues the change introduces
too, along with whether it fits with general direction. Backporting
feature is specifically not allowed without an exception being made.

In this case you're talking about something we specifically removed in
master, so adding it to the LTS release seems like a backwards step, at
least from where I see this having not looked into it all in detail.

Cheers,

Richard

