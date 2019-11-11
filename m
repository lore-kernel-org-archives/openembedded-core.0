Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id DDD3F7D2AE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 10:42:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47BS9v4Gtxz3L;
	Mon, 11 Nov 2019 11:42:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1573468932;
	bh=spv5u5ifFB5HjwhI9pJWZO+XQ4tQx40aCwsUZGDfNdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rXxt7y+QQqCQrK2JsmoYD7GEXw4BrFwhKjVMgrRxFwpLWG+5WVRMZ6qTngaetA+x4
	ApUefTifK4RA9ZQvxQB6HXiLl9Qlx/mzJROGwSauhhynYmDtPdcRMbflpkUjY+ot4/
	i1gzaiFcQIDl/RJC0jE1+WEkxG2VmERyUd2bO1rLtOUQt++JGkuOi6iSuQLlU28wDe
	KPi9bMCYxXO1aIsaysqAAYHb8Df6cyCB77TpuIiZER0syipnIFNUGFLr90L0IKTXf0
	ZUsiLXjXL6XoJUIBEimhFGJ7ogt5GzLYCs5jaN8zNljRntU/0ExrSfJseCA8rBsK5z
	fFHjkPgBU+xak39eZuLhEQMA0XAIddblz1zWsJ5yImCjf/EqHIEDNPDUvrGYn6aA+7
	Gwum9Ynt+MuI1zH7AbEj3vOHXU9NGAsYb0/JG5JQbhuMmrnutlurCCv061X5C2ut45
	zJt09rvme51XruxlCiA/62RfzQ2t0dICUwJZwdrr222gPSvRKA8flf9SiduiFl0LOO
	XWtSlCuoh7Va+UNm8VZvmh4Mkvj/okgI0Yc1j7/NgoUOHx6IOoxr58Q2m7A9I18P6H
	Cm8oiuFQsgJufGNwJcXy+8DFnO1Djj5twW+ic6IiasqZcQ0mC1vsJdAqDAXLQlep+q
	OwaNKMiBMVymUW0BCHzqdNJ8=
Date: Mon, 11 Nov 2019 12:42:09 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20191111104209.GB28797@localhost>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
	<ec8a8c61-25a0-7e87-efee-b76e6c954d07@gmail.com>
	<717e1439a3c155fc1f506d7a2933b968ee38f9a8.camel@linuxfoundation.org>
	<be45a323-4379-8a13-71c6-21f98e3a0af4@gmail.com>
	<afa8eed45a5acefa38a89e82e5a833f387963a8f.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <afa8eed45a5acefa38a89e82e5a833f387963a8f.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH RFC CFH][sumo 00/47] CVE check backport
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
X-List-Received-Date: Mon, 11 Nov 2019 10:42:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Nov 07, 2019 at 04:32:35PM +0000, Richard Purdie wrote:
> On Thu, 2019-11-07 at 07:55 -0800, akuster808 wrote:
>...
> > Are you taking the other patches also submitted for sumo ?
> 
> I am worried about what the bigger picture for this looks like but we
> could try testing them. I think the TSC needs to discuss this.

How were community supported branches supposed to work?

All branches from 2.1 (sic) are documented as supported in the wiki.

> Cheers,
> 
> Richard

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


