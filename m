Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1RE4VW-0002CY-IN
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 21:30:26 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id C21C3799089; Wed, 12 Oct 2011 21:24:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from [192.168.178.21] (dslb-088-071-249-031.pools.arcor-ip.net
	[88.71.249.31]) by gravedo.de (Postfix) with ESMTPSA id 0AFF3799087
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 21:24:44 +0200 (CEST)
Message-ID: <4E95E97B.10707@gravedo.de>
Date: Wed, 12 Oct 2011 21:24:43 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1318405370.git.Martin.Jansa@gmail.com>
	<49a800f40bd08aa23d227dccafd34b3e59a7ccb5.1318405370.git.Martin.Jansa@gmail.com>
	<4E954984.7020202@eukrea.com> <4E95D811.7090105@gravedo.de>
	<1E1E70C9-6B15-497F-8571-78D2EF0CD081@dominion.thruhere.net>
	<4E95DDD0.7020302@gravedo.de>
	<E575A7CF-9F72-418C-8143-9BA2701599BC@dominion.thruhere.net>
In-Reply-To: <E575A7CF-9F72-418C-8143-9BA2701599BC@dominion.thruhere.net>
Subject: Re: [oe-core 1/4] qt4-embedded: remove dependency on tslib and use std. linux input
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Oct 2011 19:30:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12.10.2011 21:09, Koen Kooi wrote:
>> What is breaking qt:e in this case? For me it's just a feature reduction
>> and not a break (as qt:e still works fine with the linux input interface).
> 
> When your TS is suddenly uncalibrated and jittery, it's a breakage, not a feature reduction.

You're talking here about one case where tslib is needed to get a
working touchscreen. But there are even cases where tslib is not needed
to get a working touchscreen.

qt:e does not strongly depends on tslib, it can work without. So if you
need it you should add it to your machine layer as it is really machine
specific if you need tslib or not.

regards,
Simon

-- 
Simon Busch - http://mm.gravedo.de/blog/


