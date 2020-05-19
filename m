Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.363.1589923292413225801
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 14:21:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=D9oQqWTd;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=ypzx=7b=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49RTMr167Xz4Y;
	Tue, 19 May 2020 23:21:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589923288;
	bh=6Qz68HI+iH8J3cVBemXXMg3HULSENtZvCUOt0BD4OhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D9oQqWTdYSCTU6Oo4VB72SJPH6eyV97NzAdxjh1+CaK+AhC1bvEX56+K7H3Ipd18T
	 XdEuzPb72W0L+yFFXzwNPN4NjJWlXDdiZx0wZP3RDTuDVtxjZVthwi+XGtXacfqWde
	 C4iR/adzySkRS2N4au53756NgrnaM8sR3eAC4UsI15BqR97+Imu28ac0Ggl8ZJ6rCx
	 tw0mr1Lej3k+wnmZMglVROs/34iwRH2sLlS1OM0GWJHpdyejTGbqh4CcRYwzpmRMHV
	 Q0sw7TiFX9qzisDQ+JDFBFyB5YVddWuKzrxHW3Oopp7q+rFGuvdT7/UwRKA+F7fLYf
	 YBvVFT+PP6M0BucPldikEX+qzJm5ZvJmTPrKnA7oJmi+xDH+SfRkuVjRx10gBK/E2f
	 IPQn7V0n1vG4vjY3Wq6qPBy2yET6TU3KG0O0iUBIvWssKgipf/TEyOZrL97tG2erlO
	 XCv45c3Xd2NesBrFVP003n+zcXMiRoGHi888Gf3mCfVA+6/5Sg0vS23bU4OvMAvteu
	 F9eoNBd7e9UkFpJGj2xJIFnUC3GJGhwrv/JodjgNp/A766itQqBZgQSzgQyy89SdzC
	 qwMQZDqu30Xr8vPFOx4VPnu9hHdIL7I6VXuHoy7L+sXVJOwJxGXwZw1T8bDn2qp97p
	 zZEwuhpdUe31TRmGbpBaDjrE=
Date: Wed, 20 May 2020 00:21:20 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Joe Slater <joe.slater@windriver.com>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Subject: Re: [oe-core][PATCH 1/3] squashfs-tools: gcc-10
Message-ID: <20200519212120.GB20250@localhost>
References: <20200519210928.1995-1-joe.slater@windriver.com>
 <20200519210928.1995-2-joe.slater@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20200519210928.1995-2-joe.slater@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, May 19, 2020 at 02:09:27PM -0700, Joe Slater wrote:
> Add -fcommon to CFLAGS to avoid multiple definition errors for uninitialized variables.
>...

The upstream fix is already backported in master.

cu
Adrian
