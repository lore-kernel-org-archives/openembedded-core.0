Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id B9E4E746BA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 19:07:57 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id l49so2798998wrl.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 12:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zknSo3vt8bvu+2M0sX0Mptdq/OxGIfgJoCvYAAvV0yg=;
	b=Xn8gHZLSzdlOL4ebu8Q5c/oQ72recUcnfTuzXzKy5t2RjYf+1gdQzT/0KlZtsLtjM7
	Ztkza5Qo8X7TqXtLQjv4ay81cHo3KgffqY6O2plDkdpvhCQuEKfHkRZ2xmCy1tojEN0O
	fGn26SBaz7fRyWx8QTHQvyRxq1veSQiFKwwZMhu1u4DwiYmy2GXsvW5fwbbNGaycr1Kn
	RjFa7B3AgfuOuJg0qo7FYE4jP7+SylmIvmVM+6KajCAMs81QmUsjTAd0B8rNjI4bN15x
	hDi/IrPh5r1ceLQ2ik3b0A4L/Vk9amDcynYcWd7+otWybmSJmeJm8XOm/13PzIVkXJt5
	rILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zknSo3vt8bvu+2M0sX0Mptdq/OxGIfgJoCvYAAvV0yg=;
	b=JYuJ5mUq+hhDExN2cK7zk7hm7bkwNOySrUXbEi04jbTeIoQvj6eS3JRY7G4Fj3rPTi
	EYP5QUBLiitZNI0qDRM81uYGqJ76hseG92/qL5rvJAZysDPEa0SvXbPMI0dJ2eGsOBJ8
	gtyvbdbZU5pyL5cL2GM4y8T62khb7rj7De+S+7UFoqiOXaGoAoFn8LVpntb3nqJQwILw
	oZFV8NapwSY98PIzhb0v7W2y3SJALfRn9TcGwCNO1o88qHSWoCXmQGLihXysk0briF1y
	wtDiGCG7cH1Ko5r2DilW29PP7MfPEGQcqi4KBxserkoGCO2aiI6oekzSMV7ElGre0Dlo
	ZUpQ==
X-Gm-Message-State: ALQs6tCRgX88qaQmBTEufXdRMUlyUeSRd8b3fma67sdmUQP2nSwcpIyC
	M6hcQozBJZXe0SWD0Qzp4nAkUtZJPMPs7wUtaSk=
X-Google-Smtp-Source: AIpwx4/nDREOuz75929Ro2++/NyBVlGkYa0n25VbI15OOLZvGaYlrb5g04ClWbsTg+hvvWDDjSlh6fc89mAjDgJWEmg=
X-Received: by 10.223.175.201 with SMTP id y9mr4211169wrd.107.1523473678174;
	Wed, 11 Apr 2018 12:07:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.99 with HTTP; Wed, 11 Apr 2018 12:07:57 -0700 (PDT)
In-Reply-To: <aeba1934-3675-2229-72c2-71bfa7a39b66@linux.intel.com>
References: <20180410120747.41814-1-alexander.kanavin@linux.intel.com>
	<20180410120747.41814-4-alexander.kanavin@linux.intel.com>
	<CAJ86T=WP5EU59ii41QBJgbnqdAjwTUsz=ZQRi6D_QbCUPXA-gg@mail.gmail.com>
	<aeba1934-3675-2229-72c2-71bfa7a39b66@linux.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 11 Apr 2018 12:07:57 -0700
Message-ID: <CAJ86T=WxJqKSfXWqCdREA+a-E2ue=L4juYVRUDyNb5HLkJBUew@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 4/5] libressl: add a recipe to support openssh
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
X-List-Received-Date: Wed, 11 Apr 2018 19:07:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 11, 2018 at 3:03 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 04/11/2018 11:38 AM, Andre McCurdy wrote:
>>
>> I played around with completely replacing openssl with libressl a year
>> or so ago and it went fairly smoothly (at least as far as I tested).
>> That was with libressl 2.4.2 and my recipe built with autotools rather
>> than cmake though. Did you try to build with autotools? That still
>> appears to be the option mentioned first in the libressl README.
>
> That's not however the options I would take first, as the recipe maintainer
> :) Autotools is horrible in many ways; while cmake is not great, it's
> definitely less horrible.

Well, as you're the one writing the recipe you get to make the choice
:-) But if one "just works" and the other requires patches that might
sway the choice a little. I wasn't sure if you'd even looked at the
autotools build.

Either option is a vast improvement on the openssl build system
though. Libressl seems to have done a lot of valuable cleanup in that
respect.

