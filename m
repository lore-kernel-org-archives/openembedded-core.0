Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0EA3C7F302
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 10:47:23 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id x15so77708711wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 03:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=hCYhNacaRyPX6p5lJOr+GG2UONhrl/Rl/02hEqyQe54=;
	b=QhDom4lHtDguxyE8HYXQihayMdO1hptsISceeBgZkP4CNwA+hchQfbIzMCiNJ7pGAr
	beF+971FHEKoEd2iHxai/uuVWr7dxZxYMiwDB4cR8MpUzEENNCWGHlab8wdVXsogXvcr
	XzhVwd/IvOmCaopVrFwRz0AzpbZ6fNoFMic38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=hCYhNacaRyPX6p5lJOr+GG2UONhrl/Rl/02hEqyQe54=;
	b=Pr97vCKZSVUhYWZ1NrsRoC0jwCXiGvBzDJMeOyKpXREdPvgRejwbweMBSCzOGb1agY
	bn+w+N7JD84vvy3twr/dS9XBVHtiqn+XJtNqrk1nOngBBbAaEJwsGjHYWZoxlsIIr1VT
	DejQWVWST51M6lmz9aXxi28+wcPa0PZo5Ld5k6LIVjmPah22tpZgD5AGf+VUtkWlShld
	tf5ZgHmRklOfbRqcBwd8Nr0JVoc75FWbqlh52cQAP9d14tAc0TGP084R07wEn3EaBXdS
	vfsk4QVshGOpjoSCkFBtI7R7AJjIzTcH2H3hMNsQEaJXN33W7bTyWJlfXzspOZzDIgDk
	HUzQ==
X-Gm-Message-State: APjAAAVD65VF/iKS7IylquYZh7d8bkXnXmV69QmSOEMiS+JdiMAVh4xh
	2BRINO1GKy2mSojxrnGp0iD5sE/zcTY=
X-Google-Smtp-Source: APXvYqxAvWAR4/X8MTpmg1E6xgSqTc+yWXhWhNDfylR6ESMpUH3csC8eeTfY45bXJfHq9YiBV8ViOQ==
X-Received: by 2002:a1c:7fc3:: with SMTP id a186mr4305368wmd.151.1565088444537;
	Tue, 06 Aug 2019 03:47:24 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e6sm87751522wrw.23.2019.08.06.03.47.23
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 06 Aug 2019 03:47:23 -0700 (PDT)
Message-ID: <0fb7aa39fdcdc39f8a12149005f9b09d04074778.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Tue, 06 Aug 2019 11:47:22 +0100
In-Reply-To: <1565074499-317606-1-git-send-email-changqing.li@windriver.com>
References: <1565074499-317606-1-git-send-email-changqing.li@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] go/go-runtime: use update-alternative for zdefaultcc.go
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
X-List-Received-Date: Tue, 06 Aug 2019 10:47:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-08-06 at 14:54 +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> fix below error:
> file /usr/lib64/go/src/cmd/cgo/zdefaultcc.go conflicts between
> attempted installs of go-dev-1.12.6-r0.core2_64 and go-runtime-dev-
> 1.12.6-r0.core2_64
> file /usr/lib64/go/src/cmd/go/internal/cfg/zdefaultcc.go conflicts
> between attempted installs of go-dev-1.12.6-r0.core2_64 and go-
> runtime-dev-1.12.6-r0.core2_64
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-devtools/go/go-runtime_1.12.bb | 6 ++++++
>  meta/recipes-devtools/go/go_1.12.bb         | 7 +++++++
>  2 files changed, 13 insertions(+)

It seems odd that both of these packages should provide this, perhaps
one version should just be deleted?

Cheers,

Richard


