Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id EAA397EC65
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 15:03:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46VJn64s1FzQx;
	Fri, 13 Sep 2019 17:03:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1568387035;
	bh=uLR8lZ6Zprjh/VL4j/DAzSwk5nhB2rK5lk7Hb6ZNgyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CwVsj+9K5kuWwe1A8MqVPRyGASalP1OyrnQJvSpkiOyWG6gOaXSvBH9ZHij3mtMtY
	vc71Pna3LEok+5wmOPlktSt+iheNnVL3wDyqT0aSCy6ohJrfuH2sP2El5pWlV8syjK
	q5YS55r0wVusxInCT5fc/hBn/46xMeHGSFpx4wBy9jBnaayvN6T5NavyIqEi5Sda2+
	8IYqywbnZ4eMGAOEG5IbyLzHW95OlWHyztfrOojsWF9ERQuM/Qti57dB+0TdBy3J1W
	+UZ3pJBU9Nd3b37vCGBqx0/YAOhAX4Ot0gRT1xLDaaZmrxfATuMdzytr/zcK9XtVpJ
	w1XiZXCPuqUbdIFVBakb+9MLintu9q3Yb9llfIOadcX2pQwXRazQh/2PnwvRSj9Zq7
	pF/fBG2LXeEn+zSyHrkJsPkFyfwJX7HwgQ/MAx0LgGASc0ZZGXqOlcRrQ4LfJEPZnl
	V13Ml1wKFKBon4h+/1sXiQprBCkVtpxBpjPCmnJ7T09xaEDEgfSET6WdneITo94E1M
	W5uCrlqMNnNn1B1XG+Lg7WkePG5ajrsKXvcsIgg6PUTwia14rytts5ieT9iFDV7hEz
	6/YQbwF12iMTaknefh7+1TP4h81zvUFqQ+ERI/U9Su6fESVwv622VNZeW4hRHW18Dn
	O+4iB4mcyjcfRqzYRi6Z/BaI=
Date: Fri, 13 Sep 2019 18:03:51 +0300
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190913150351.GA5554@localhost>
References: <20190912065221.733-1-zangrc.fnst@cn.fujitsu.com>
	<e91aab69-d7ab-dd80-1671-72e21e85711b@gmail.com>
	<20190912142824.GB5021@localhost>
	<95697dfd-5692-c175-3fd4-0609e3b96310@gmail.com>
MIME-Version: 1.0
In-Reply-To: <95697dfd-5692-c175-3fd4-0609e3b96310@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] timezone:upgrade 2019b -> 2019c
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
X-List-Received-Date: Fri, 13 Sep 2019 15:03:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Sep 12, 2019 at 10:30:30AM -0700, akuster808 wrote:
> On 9/12/19 7:28 AM, Adrian Bunk wrote:
>...
> I applaud those who  take the time and  effort of providing additional
> information in the commit messages.
>...

Blind pasting of the complete upstream changelog is not exactly an 
effort that would warrant applause.

A short summary of the relevant parts might be useful, but when you are 
asking to include details like
  The 1892-05-01 transition in Brussels was at 00:17:30, not at noon.
that's only adding noise in "git log".

> > BTW: How is the legal handling of the metadata, when such lengthy
> >      3rd party texts copyrighted by various people under various 
> >      licences are distributed as part of the git metadata?
> Interesting question. Since I am not a lawyer,

I am also not a lawyer.

> maybe you can help guide
> the community so we do the right thing. Now I am worried about the
> stable branches,
> do backports have  this same issue, are those 3-party texts?

Backporting does not make a difference here,
it is about under what licence the contents of the commit message is.

Pasting texts from elsewhere makes the licencing of the git metadata a 
complete mess, like you cannot claim it is MIT if it contains text from
GPLv3 software.

A person using Signed-off-by also certifies that the whole contribution 
is under an open source license, which would make pasting changelogs from 
components that are not under an open source license clearly off-limits.

Not sure how much actual lawyers care about such issues,
but once something is in the git history it is too late.

> - armin

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


