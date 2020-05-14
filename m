Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.161.1589480368693264071
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 11:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=FRW9SDZm;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=glre=64=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49NKYy6FrZzP7;
	Thu, 14 May 2020 20:19:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589480359;
	bh=+Fg/435N0y873ZagBObt0EK4ih7jxiq9/yFAcTTTzBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FRW9SDZm+Dt86GjpBFExmBwrX7jMmrcsspXTXwkeugbMgXKP/8T41UUUrhfMHN0FO
	 kGzD2PmCUME+8cRR7wxDDpWwHdAGfqA3ti1YSdcauirYsmykbcZmVLuEDMtGOkzzfF
	 4Rx9R6Ont/ma7ZMDaUqiDONgyOUlEIvLpBGEe2oArCylJeQhHG1asba1CJnYXk1P1B
	 cnd6L9/y0i74snzjQegfjS0K+LR3hs8fNqqlKHM3HfOaoqQ/7MM6nDo2aXaK7vHwXB
	 q99jX7/k4bKXVJHzYoDiqGPfAR7gKu1ZMxw/fwYNVmkIihGPRKFzvxi79kZfLci34D
	 mQT2Ig56/3Lfi3fUbsNcfTE87N0xFVxn3iKT9E0ERpWuNmFMloDPVjcgArcS3uMDEB
	 bjpn/9J1aUF9Zu2wG3JEcOuvnjK81pXY7gkU3xjQojCkLx8hir5IzULI3U/R7+ebTZ
	 SRjNPSnKpZZsy7Nhst2DK3yE7fLkdgtADcburxITRAbyaTbe1/Miy38fBPtwczamb8
	 ix1k3bywo9MbPbQwj82xsbAEgAbbfND+Tyj7oQCQR6OqAZfWlm7wHYrPWJ/0rZjLdE
	 6wHg8fDwJShfYsj4My1j7ol9KxaiAYCNvJbhmKhSgvyv6mYVcD9qsjIHfi/9UiniQ5
	 u6Wdu7DLIlEupXIXIrgKLsaY=
Date: Thu, 14 May 2020 21:19:17 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH V3 3/3] gcc10: Revert using __getauxval in libgcc
Message-ID: <20200514181917.GA28774@localhost>
References: <20200511182812.441561-1-raj.khem@gmail.com>
 <20200511182812.441561-3-raj.khem@gmail.com>
 <20200514152934.GC21399@localhost>
 <7111a5b8-12b5-d683-eb39-6661223697ad@gmail.com>
MIME-Version: 1.0
In-Reply-To: <7111a5b8-12b5-d683-eb39-6661223697ad@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 14, 2020 at 10:18:53AM -0700, Khem Raj wrote:
> On 5/14/20 8:29 AM, Adrian Bunk wrote:
> > Disabling -moutline-atomics would also workaround this issue.
> 
> I think this is a good suggestion and I do not like to revert gcc patches if
> we can avoid doing that. I will propose a fix to disable outline-atomics for
> valgrind on aarch64
>...

Not just for valgrind, globally.

The main effect in Yocto distributions is (slightly) slower and larger code.

cu
Adrian
