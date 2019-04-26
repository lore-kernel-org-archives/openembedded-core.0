Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2ECB67CF88
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 05:12:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44r2H61hlYz4R;
	Fri, 26 Apr 2019 07:12:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1556255538;
	bh=nP/WU+O9NvBRfc4WTbeBGD/ZpXmc4eTAlkgwU8JP9as=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uFtTm7nQkKZnUjJlZiworEIUFVKB/4DWMAMVVFRVdK1bjDLTt5xQhLr0GHWJkJivS
	xd0GAbIZt4xyztVo0NirT8o473RJ4uh8D0a1yAewaDe0lN8H0dEEojviaJiyiLrYiQ
	k75CCrv/buFOeASWe28ccl8dDFdx5vPQgVhlTVLMdRNI5T1VW4cj95MrZqxP00KXjy
	1Tz1ROPJYOoS2D0v8/QNB/d5Q5bqsKaLlr8btN4Y9mY6myzEUoh1+1rDIUiibFHyUQ
	xnllCeEiraChTj3n/WlIjEdEPG2MDhk7OGFVbwGtWagGk1QZzVfBqNsxtVDfUXyYop
	MA+4KP7j/Dq+qSJzXabzjxhVPeetPO7R3P3vkRq66zhO0AucrS79ptsmRFOwpNuvct
	EkCLfD/u8gU7RNDbkIj2zny+vgpWeG6k2SUW/hkmyX7S1FiAxmvSfTZe6EEjfEDsOi
	eE2nDnuI0TyvgqHdzSL/KaPvTCYTkSQPoJYp8GoA9OBgDBwXDNNkA8XPOaasy1fPl/
	U+U0G6lOz5KFtbUw8EvQZAfGJsBkUlI/0O3qoTGxTzlOWhKl0fXPGJ5LVAvI5XKHYR
	Umn0H2TELVnJiZ3moMoPc9EOnneIA0N+mjjB11lJ23ijU8xPs8njYJCR/If88YM0WS
	vC+5f0JDltSwc0gLECk7LLVY=
Date: Fri, 26 Apr 2019 08:12:15 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20190426051215.GA26023@localhost>
References: <20190308184939.22937-1-bunk@stusta.de>
	<CANNYZj-c+H9zqsj640ef+evBNQbi+6M1XAqJHaqu-_i5dHaxnA@mail.gmail.com>
	<20190308193841.GA13393@localhost>
	<E3B36DFB-0727-41ED-9494-3997E768A865@gmail.com>
	<20190308203904.GA19247@localhost>
	<20190425192846.GA8813@localhost>
	<bf9d998e-487b-32a0-7879-9f0694a835ee@windriver.com>
MIME-Version: 1.0
In-Reply-To: <bf9d998e-487b-32a0-7879-9f0694a835ee@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][RFC][PATCH] Remove openssl10
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
X-List-Received-Date: Fri, 26 Apr 2019 05:12:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Apr 25, 2019 at 03:18:47PM -0500, Mark Hatle wrote:
> On 4/25/19 2:28 PM, Adrian Bunk wrote:
> > Would you consider this patch appropriate now that warrior has branched?
> 
> The use of OpenSSL10 as a 'second library' is likely no longer needed.  But
> OpenSSL 1.0 (as an alternative version) to OpenSSL 1.1 is still needed in some
> cases.. (FIPS-140-2)

Is anyone actually security-maintaining OpenSSL in OE?

The just released sumo has both versions of OpenSSL not touched since 
August, despite just upgrading to the latest versions would fix CVEs.

> So removal of openssl10 is fine, but if there are patches for support of both
> versions (old/new) of OpenSSL they will be needed at least through the end of
> this year for many users.

This is now for Yocto 2.8, which will be released October/November
this year.

> --Mark

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


