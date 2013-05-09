Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UaYdY-0006Fy-Fi
	for Openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 23:44:31 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 8F1DDD22DE; Thu,  9 May 2013 23:25:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id A2C8BD20DD;
	Thu,  9 May 2013 23:25:11 +0200 (CEST)
Message-ID: <518C1454.4030701@linaro.org>
Date: Thu, 09 May 2013 23:25:40 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Trevor Woerner <twoerner@gmail.com>
References: <518BD58B.1030307@linaro.org>
	<CAHUNapTEOfwR9OATGGKOtrpHWwisVh0xXm5P2jKUgEitznpxNw@mail.gmail.com>
In-Reply-To: <CAHUNapTEOfwR9OATGGKOtrpHWwisVh0xXm5P2jKUgEitznpxNw@mail.gmail.com>
X-Enigmail-Version: 1.4.6
Cc: Lists Linaro-dev <linaro-dev@lists.linaro.org>,
	Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: Re: Changes in Linaro layers for OpenEmbedded
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
X-List-Received-Date: Thu, 09 May 2013 21:44:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 09.05.2013 20:42, Trevor Woerner pisze:
> On Thu, May 9, 2013 at 12:57 PM, Marcin Juszkiewicz 
> <marcin.juszkiewicz@linaro.org> wrote:
>> Who will maintain those layers after my leave? This was not decided
>> yet. There are few guys at Linaro who know how to use OpenEmbedded
>> but most of them is outside of Builds and Baselines team.


> To me this implies that these layers and this effort of yours isn't 
> part of any "official" Linaro build process/procedure. Would this 
> assumption be correct?

No.

First Linaro layer for OpenEmbedded was created by Ken Werner from
Toolchain Working Group as they considered OE as a test tool. Then
AArch64 bootstrap was needed so I stepped in and took maintenance of it
(Ken was not at Linaro at that time), added meta-aarch64, cleaned up etc.

Those layers are used as part of official Linaro build process. All
AArch64 rootfs images are built using OpenEmbedded. Note that this
excludes kernels which (for some reasons) were cross built as Ubuntu
packages.

At Linaro we have many teams and some of them are using OpenEmbedded or
will do it soon. One of reasons is lack of ARM big-endian distributions
on a market.

Look at numbers from "git shortlog":

Marcin Juszkiewicz (341):
Ken Werner (28):
Riku Voipio (17):
Khem Raj (7):
Ricardo Salveti de Araujo (5):
Fathi Boudra (2):

Ken is not at Linaro, Khem never was and those commits are fixes from
him, Ricardo is back at Canonical. Riku has OE knowledge but also lot of
other duties.

And so far only OpenSUSE has packages for AArch64 mass built while all
Linaro tools were made for Ubuntu repositories...


