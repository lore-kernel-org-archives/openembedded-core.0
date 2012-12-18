Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Tl1GI-0008FG-CX for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 18:47:31 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qBIHWfoX029711;
	Tue, 18 Dec 2012 17:32:41 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28789-07; Tue, 18 Dec 2012 17:32:37 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qBIHWXsv029704
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 18 Dec 2012 17:32:34 GMT
Message-ID: <1355851953.18874.45.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 18 Dec 2012 17:32:33 +0000
In-Reply-To: <CADkTA4OAKuK6Sk0=vSnr6P+M8_svdZ2VNEbH18HZNbWt_LpzuQ@mail.gmail.com>
References: <1355220771-32095-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<CADkTA4NLkvWThY4fzqzqDc5FO+U+CMJGEjOD9oJsLXDidfoapg@mail.gmail.com>
	<1355828839.18874.8.camel@ted>
	<CADkTA4Nwm2VxcAfrX7p0qy6CVYHMpH+WKbwv4Mr6BkGaJ3+WFw@mail.gmail.com>
	<50D0729C.2090703@linaro.org>
	<CADkTA4OAKuK6Sk0=vSnr6P+M8_svdZ2VNEbH18HZNbWt_LpzuQ@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches, discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Add 3.7 version of linux-libc-headers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Dec 2012 17:47:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-12-18 at 08:56 -0500, Bruce Ashfield wrote:

> On Tue, Dec 18, 2012 at 8:41 AM, Marcin Juszkiewicz
> <marcin.juszkiewicz@linaro.org> wrote:
>         W dniu 18.12.2012 14:32, Bruce Ashfield pisze:
>         > On Tue, Dec 18, 2012 at 6:07 AM, Richard Purdie On Tue,
>         2012-12-11 

>         > If we bring this in, I'd prefer to completely drop the 3.4
>         kernel
>         > headers, since having just one recipe in the tree make
>         sense, and it
>         > won't tempt us to start having a trail of one libc-header
>         per kernel
>         > version (since there's always a layer somewhere that's using
>         a given
>         > version).
>         
>         > What about a middle ground ? I can pull this into my tree,
>         since I'm
>         > doing some 3.8 and 3.4-stable work at the moment, I'll
>         remove the 3.4
>         > kernel headers and then submit it again as part of my queue
>         with some
>         > extra tests run ?
>         
>         
>         I am fine with it.
> 
> Thanks, I'll pull this in if Richard agrees.
> 

Sounds like a plan to me.

Cheers,

Richard




