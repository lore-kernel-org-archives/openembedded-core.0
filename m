Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 98E7D7C85C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 15:08:49 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id r21so7716065qkl.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 07:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PHQbKNC+ib4tqXa9iicqRgh42C3a4B8rxq9k2X2DE98=;
	b=ZeoVVFppUjAQhJGCYhKAfC90HaKVYr4wn1ZGoa8WP4KRleaYwMDcBRvU1+K66ZnzB6
	1N+5acQn6oFKTg+w7WEsmehKSdaXKtf4cpBK4Sb2xBO9vEStX3cLJ376t9eHn2ALknyc
	OXJoS6HwLNWdVse2fPImK0fYgW3++Io7POBucKM3oBwHLPbGweQR6rmWjysx9rHRBc3f
	woL/Jlmy7zVJNXAuKXQGwTF5h0sMv6yTnwJDF2pVHufZ6E7QZp03LqiZz/UL0ApN0k5l
	gutB3vXwfPE5hr3p5btrfOHsTB3WzH4RVS7Qm2VWkL1ReCrORBSh3Sozn9q/sN5rhsU/
	52bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PHQbKNC+ib4tqXa9iicqRgh42C3a4B8rxq9k2X2DE98=;
	b=KUzlDPBT0/s5m/0nw/DavlkE5wDPYpD4ANchg6ftnfT3yRUCHySRXAqWJxXJcmfeX2
	WpLxihVIupEGdt5Xdqmpb7WKs8i3ZOM5nTESNw+AIjfWlNhDb22cncgs0pnJJR9pHMME
	Lc8LmhKf15X0aN8ns6ie24N+Qw0MQCDlPRCB87Rzqx32SFGCGCJzEb2eOpvP3KIAuuh3
	itEdnbFdXHqQf6bsSgUvr000LnJNQHv0EHCpwugDjuZKbgK4O/4NvAUquQbj0LWdXmMx
	zR6Wb0vrIV9aenHlXhmrBDI1gOItUWZV8BOOBT4F5wHdvMhtXJ6lszjyMBzhrfuyetc7
	ERIA==
X-Gm-Message-State: AHQUAubNJksuRQrzvLZBrumDf6cTVKLlWAFTmIogiXV3SVSBuFuXobi9
	CXCXKluyFEbg/zO1JI/b8sMefmjLyyw1ogdqr5Q=
X-Google-Smtp-Source: AHgI3IYkfb2KJI7a7ZfQkMrssDmHJhaZVEYwjTy9UH3/dHXUz0ELp11pEK9/+5V8979xdOSoUtQRHeWlnKxLxgbzxNE=
X-Received: by 2002:a37:3d6:: with SMTP id 205mr16960192qkd.223.1551193730273; 
	Tue, 26 Feb 2019 07:08:50 -0800 (PST)
MIME-Version: 1.0
References: <20190222142333.9780-1-fabio.berton@ossystems.com.br>
	<CAJTo0LbhhwpyLh9wP+JswymO+T9CRJ64w8hw6g8HsxUSLg9jOw@mail.gmail.com>
	<CAJTo0LaugPSscMvBwJz+ezbp7DMF9rs59Svkr8WnFb3+oM-KwQ@mail.gmail.com>
	<CAJTo0Lah677v4+3Q+acN8WEOF-r9bopn0OVw+icfCX5Jy7pxvQ@mail.gmail.com>
	<CAJTo0LZsdUCjKe9nR4ypj3x_ddR7XPBEvduUHDiE9esWa=X-jg@mail.gmail.com>
	<CAP9ODKqXDQkV8xHmTTmvs6GWUWNJrWB5XSnb37B=6-JjCci37Q@mail.gmail.com>
In-Reply-To: <CAP9ODKqXDQkV8xHmTTmvs6GWUWNJrWB5XSnb37B=6-JjCci37Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Feb 2019 07:08:22 -0800
Message-ID: <CAMKF1sqynSYK=u_qTXkteuSk1s951JAXucnN9r=8=CVOCUD=SA@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH v4] mesa: Convert recipe to use meson build system
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
X-List-Received-Date: Tue, 26 Feb 2019 15:08:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 26, 2019 at 4:26 AM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> On Tue, Feb 26, 2019 at 8:58 AM Burton, Ross <ross.burton@intel.com> wrote:
> >
> > Patch has been accepted, so we need to cherry-pick the patch I mentioned.
>
> We will wait for 19.0.1 to be out to go to meson, so it will be
> applied there for sure.
>

I am still seeing fredreno build failure with master-next
https://errors.yoctoproject.org/Errors/Details/230466/

> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

