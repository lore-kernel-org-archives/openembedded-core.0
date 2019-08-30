Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C94F57ECF9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 05:01:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46KS4j4tkDz28;
	Fri, 30 Aug 2019 07:01:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567141301;
	bh=964fnVfEYpEL3dwD8bHt3rilFmp32ak7a3LYfb1N7NE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GvLU0p4o362p6PyH+cb5SjCS69bCs/xgfIkTsdCIYEUxtSIgKvvUbFDHNtU757uDZ
	5+EXZ8CHYYLCtTjGFa1wAp+P2k9S6+CbJhOFa1Dpo8OWhXYU2PpTPupluvZTe6k4OG
	2eMe7ReLRvgT8mnO0bnlAjNS20gISm5RdiMhCM6ms3PKC+DXisw9384HY/MszVjTEw
	g2EawfF82J4y1TOJQSWeOyfCfJqc+zSjn3fniHZvJyKmcvEVJ1lrqyBC+oCs53t38y
	ohZAcg4HKivEy/vWtUawyR/M7M2w9U9Y1pfXRr2LlvQbRjaLyYnzXL0qS/FMYHUlEg
	PdnrcE1WXTkTw0EPLpXiq61KZ64MsFLPGgXEaxIcsydJ6hPZYnHoQhEu4jeqsucBrW
	9z8yz8YT01KgsruZg4ZXf0pCTMPWc0wHYvK4rbicnYhIGFIflkkTHbQLnTuKL9qm3l
	UrC63oV0Vs9uybWBqw28skwIpkAfslYJlU5cDrLa52xCRq4h6Zq8G6ornEsndUH5g6
	3j8mQM4kL24tliE/EYVnWz15Lofx7mvgUec8I4NuFeN/WXxdl2uX1cnngS/gditE6p
	vqWuDsMBH1BRyvitcUmrInhGL5SZT1RLjSoJ1FYBh/KcVOjeZ9kBWb/35YfBaaOjsc
	zoYMStfwNKsnQnscck/tMv8o=
Date: Fri, 30 Aug 2019 08:01:38 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20190830050138.GE24691@localhost>
References: <20190825172116.23759-2-bunk@stusta.de>
	<3023c089-61bf-dfc0-bc7e-1a5864febcb9@windriver.com>
MIME-Version: 1.0
In-Reply-To: <3023c089-61bf-dfc0-bc7e-1a5864febcb9@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Remove LSB support
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
X-List-Received-Date: Fri, 30 Aug 2019 05:01:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Aug 30, 2019 at 11:04:52AM +0800, Robert Yang wrote:
> Hi Adrian,

Hi Robert,

> On 8/26/19 1:21 AM, Adrian Bunk wrote:
> > The only part with some (marginal) usage is lsb_release,
> > which is split from the lsb package into an own lsb-release
> > package.
> >
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > ---
> > https://github.com/AdrianBunk/meta-lsb contains a preliminary
>
> Do you have a plan to move it to git.yoctoproject.org or
> git.openembedded.org, please?
>
> // Robert
>
> > meta-lsb layer, looking for a maintainer.
>...                ^^^^^^^^^^^^^^^^^^^^^^^^

I am hoping that someone who has an actual interest in LSB will
adopt it, and then it's not up to me where it will be hosted.

If you are interested, feel free to adopt it and host it
wherever you want.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


