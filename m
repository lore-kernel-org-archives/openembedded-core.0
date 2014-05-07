Return-Path: <koansoftware@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id D973C60173
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 07:54:44 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id c13so409228eek.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 May 2014 00:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:reply-to:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=MIz85qUmd2pQWpH8q8X1yDtM8QO9faONMnLx4aA5ZJI=;
	b=dk2BLOt0mjmJG91f/YLGMIzWpMylXkZQO8B55o7gPz2xW3yfHWk1Fq4hFFeveKrbY8
	9xo3yBDt7okB8/eVfxiRKS/GPLn3yAb92fOr85I5Jod/F574GQ6BHbkdv2d6xn2C+kUp
	OAmdOD7Y+Kzea5TfKFE0ppGr4mpJTsR5h9l1dbRsKLAutz7gCSPLVkLdBkBtNDeck4Ij
	DZr6J+mC8w56/pYi2St1+aYKSw6O4Ou94MIB9+70WaGxM65vc8LuyE4cHlomzV3a3eGr
	/Pq+Wfqkt+U7V1P9RhdpVw+MLwK3D/6GQ7I60Q8cUqDxbL4XhXALMJei2Kw7FU/b57xB
	gR4A==
X-Received: by 10.15.101.9 with SMTP id bo9mr14560483eeb.75.1399449285041;
	Wed, 07 May 2014 00:54:45 -0700 (PDT)
Received: from [192.168.0.5]
	(host56-7-static.30-87-b.business.telecomitalia.it. [87.30.7.56])
	by mx.google.com with ESMTPSA id x45sm2377667eee.37.2014.05.07.00.54.43
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 07 May 2014 00:54:44 -0700 (PDT)
Message-ID: <5369E6C1.2090907@gmail.com>
Date: Wed, 07 May 2014 09:54:41 +0200
From: Marco <koansoftware@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>
References: <53679D4E.6060202@gmail.com> <20140505152931.GA26865@gmail.com>
In-Reply-To: <20140505152931.GA26865@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Upgrade to a package with all its dependency without network
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: koansoftware@gmail.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 May 2014 07:54:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Il 05/05/2014 17:29, Paul Barker ha scritto:
> On Mon, May 05, 2014 at 04:16:46PM +0200, Marco wrote:
>> Hello,
>> I need to be able to upgrade to a package with all its dependency chain on a
>> target system that does not have access to the network.
>>
>> I'm trying to understand what may be the best and also the simplest
>> solution.
>> Perhaps there is already this functionality in OE/Yocto?
>>
>> I thought to implement a new opkg feture so that I can to generate the list
>> of dependencies of a package and then extract the packages from OE/Yocto
>> using a script or an application.
>
> opkg v0.2.x (the latest release series) doesn't really support this behaviour
> very well. The caching logic just doesn't work. For example, I have a board
> connected at the minute with a feed configured so I tried this:
>
>      opkg install --download-only ncurses-terminfo
>      ifdown eth0
>      opkg install ncurses-terminfo
>
> You'd hope that would pick up the package files from the cache but it doesn't.
> So even if you put the files there yourself, you may no have a simple way to
> install them.
>
> An interim solution I can see is to put all the packages you want in one
> directory then run 'opkg-make-index' from opkg-utils on that directory so that
> it is a complete package feed. Then add that as a source in
> /etc/opkg/base-feeds.conf.
>

Hi Paul,
thank you for answering.

This is exactly the main problem, how to extract all the packages I (or 
I should say the package itself) want, in one directory.
Would be possible to extend opkg with this feature?

Cheers
--
Marco Cavallini | KOAN sas | Bergamo - Italia


