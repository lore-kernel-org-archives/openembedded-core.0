Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BEEF87D674
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 05:43:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45t6pV6Gddz3l;
	Tue, 23 Jul 2019 07:43:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563860611;
	bh=ECrE8cVd8N5YoldEtij7uSqPNFuUtfiBsCTbZREqJlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c73T4i/AoYMcyYmLavto46zP9ALQxdH+N4DinbjTa0zhuQTI9K/K8sblU0p+sHdO9
	n2g3wDCUGy8iiMESi1rH4HkpMIYy0kb3jGjZUp0AsXocoMzG2tBLF1oVW6C6h2WIHC
	qUZMndWG1rJPR2/2A/4xJlPBFllDesO7Y1HI2gWb9nAPEh1BXGsnQqnu03j3QxNS4y
	wbm6kgz8fv9g2GSMMRXG3F5ewZm5WBtMKGzApna30mCEpCOmA75f6Nt4F0SAns8dvL
	RveS+T0ithSgKj6gfLATDBwC4HRdBPMsRB2cZxikIJiylI7rs4w+Y/eypYe6OQwmtO
	tuLXCOvYt7JDA3+52t8PwOKKgtXAkifaA1KAWcs+3XJ5Lswc9CVDTt1QqnCoHF0CMK
	GMtvMgYUrA71LKfQtqfdrHeqP/V9avwlU4Q+YUvnhem0vwgb08oYNlnAQCSDKdqYO/
	HSIgapcAYbPRzn6PRquzA3g0wwMUWA9orThEYf+A4PcWjcHnw+rN2KkKvBftkcUgaF
	8L69vSZ2pLig9q7/WbGXAmw+hZc3GRyCkUutycpOClk4ft0BBQsxkpftSX7dGqo+ei
	U6Qr2RV9Dx0gmnY41vDNe4m9rGGdoBjtQkGpz72DmytsmYc7mC9pJNvdxr1Xqom2CD
	hv00egWKf4cRliviMrp8Uc/s=
Date: Tue, 23 Jul 2019 08:43:28 +0300
From: Adrian Bunk <bunk@stusta.de>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20190723054328.GA27144@localhost>
References: <20190722001812.14947-1-open.source@oleksandr-kravchuk.com>
	<CAJTo0LaVCn47fzpMYcsO9sjwgRpaexGYDRxrrvoWTVny1uVQ_g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaVCn47fzpMYcsO9sjwgRpaexGYDRxrrvoWTVny1uVQ_g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH 1/6] python-scons: update to 3.1.0
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
X-List-Received-Date: Tue, 23 Jul 2019 05:43:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Jul 22, 2019 at 10:51:35AM +0100, Burton, Ross wrote:
> Do we need the Python 2 variation of scons in oe-core, or even at all?

Regarding the latter, do you see what is needed for making gpsd in 
meta-oe working with the Python 3 variant?

Upstream seems to support it, but it fails to build.

I thought I knew what the problem was, but it turned out to be wrong.

> Ross

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


