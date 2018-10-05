Return-Path: <ross.burton@intel.com>
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
	[209.85.167.182])
	by mail.openembedded.org (Postfix) with ESMTP id 76C8674F09
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 21:22:38 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id s69-v6so11514674oie.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Oct 2018 14:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uyE9B1ufHa4fgeZ/rm8zfVWXZyW6oNyh2TpsEK+FYZg=;
	b=t7P2BOQrLy0+Xkw3YtQdZ7ZCeS0E9yQLSIiKi3pUdkU1t8hRaE0Ae9NA8gTpjggIrh
	47ZAmildYwchU5V2Z9hVvZJXnnWP//sjQCfI4j2qbIps9IqDEzMgXRmSvqYnioLWW54S
	yQh3KwtD0qqCSqFY70lGlqhLa1nBFnhgxCoJaZ2bU+MxHvlb5WmharVv+2gJNFxm4cz5
	19gdwdoLhaDffvA6e3VZOPinkHG/wqrpyQ74E8AN2Nao21NIFWWZAYviREnewS7SCMY3
	/fPlpWJtdG+b+xUlemHOa2Y6Xwj36jDmssmblEtAbAU0blT6inRLqjI2atdc39IYJr+q
	SwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uyE9B1ufHa4fgeZ/rm8zfVWXZyW6oNyh2TpsEK+FYZg=;
	b=Eg3dbZZknFtZMg/OIirxIcqq63EberGONhf1Vs7mHxMCvbTkRpn0cQHH0/KDICpvqX
	hpLw9s3DTnh7E0Zkf0gzaLjkNlxwBE6U700MrKY26rRoH1XG7G50Vq14ftyoRJoI7E+0
	+ePUfJvdabNpDze0cNOTC8GqTZvsP2RkciayC5Cr5pgADaBzD+VNMuSuQ65WgWii/2kk
	M4/V6UZ7ohhhaC8jtbWmXU4oO022ltfQzwm6jMV5YMStAgPKhHsAX17lDEzj/TrAgO/q
	DA5fmpznsWYRU6FgOzA6FYmGP1pMvzTqnBlX+tRH0qnbtrdynft9SceOx/gEfE4KL+aI
	rkfA==
X-Gm-Message-State: ABuFfojTQ6PasiYwgD9q2tdzzSxEmBpvhudEuLncu0PduVl4qXoOjIWf
	MugKJc9ALAE/SuQdSn14I/sOpVyJt4kEXIG3xrTD5Qyg
X-Google-Smtp-Source: ACcGV63drlN6RfTbTxYxAVCu8bHx6sAkcS/ebryPe9T33mvxzyh0xXKj6DyP2h7gjkhXPrSkAogUE5Or9xITBQ4fBM8=
X-Received: by 2002:aca:ce4c:: with SMTP id
	e73-v6mr338604oig.225.1538774559387; 
	Fri, 05 Oct 2018 14:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAMRMzCDLn8_0sh+PqoC=FnpspLm4o3gx=UULsRZiExOL7_YhMQ@mail.gmail.com>
In-Reply-To: <CAMRMzCDLn8_0sh+PqoC=FnpspLm4o3gx=UULsRZiExOL7_YhMQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Oct 2018 22:22:27 +0100
Message-ID: <CAJTo0LaopKzbbnUDR5fixoiE4pt=9S8T-f3JMCa6NL9U1kf5uQ@mail.gmail.com>
To: Marc Ferland <ferlandm@amotus.ca>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Python3 and HTTPS issue
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
X-List-Received-Date: Fri, 05 Oct 2018 21:22:38 -0000
Content-Type: text/plain; charset="UTF-8"

Did you install ca-certificates?

Ross
On Fri, 5 Oct 2018 at 15:49, Marc Ferland <ferlandm@amotus.ca> wrote:
>
> Hi everyone,
>
> I'm currently having a strange issue with python3 and https (using
> sumo branch, commit 161eaa28ed16f93d57f3d1c4be84f894e99ab72e). Whenever
> I try to connect to an https server I get:
>
> ssl.SSLError: [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify
> failed (_ssl.c:719)
>
> The following python script reproduces the issue:
>
> >>> import http.client
> >>> conn = http.client.HTTPSConnection('www.python.org')
> >>> conn.request('GET', '/')
>
> Any idea? python3-certifi is correctly installed.
>
> Marc
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

