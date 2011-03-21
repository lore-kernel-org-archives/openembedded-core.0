Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q1h9x-0003om-AY for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 16:36:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2LFYujn024056
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2011 15:34:56 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23806-05 for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2011 15:34:52 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2LFYo46024050
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2011 15:34:50 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4D86C98C.9060008@intel.com>
References: <71E89804-8B25-4810-95EE-C9B1880C0103@dominion.thruhere.net>
	<4D86C98C.9060008@intel.com>
Date: Mon, 21 Mar 2011 15:34:26 +0000
Message-ID: <1300721666.30423.3714.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Qemu-native requires alsa-libs-native
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
X-List-Received-Date: Mon, 21 Mar 2011 15:36:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-03-21 at 11:44 +0800, Zhai, Edwin wrote:
> Koen,
> We enabled alsa in configure for the feature of receiving sound from 
> guest. It is assumed that audio system on host is already enabled.
> 
> I'm not sure if we need add alsa native, given that they are host 
> specific. Besides alsa, we also need sound card driver on host, which is 
> beyond the scope of our build system.
> Maybe, we can check alsa lib first, and enabled "--audio-drv-list=alsa" 
> after finding it. Or we can document alsa as build prerequisite?

If we need a dependency, it needs to either be listed in ASSUME_PROVIDED
or built. In this case we can general the needed alsa library easily so
I've merged Koen's patches.

Cheers,

Richard



