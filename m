Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RXwFN-0001k2-8K for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 15:43:53 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB6Eb46Z004020
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Dec 2011 14:37:04 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03337-06 for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2011 14:36:59 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB6Eat0e004014
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Dec 2011 14:36:56 GMT
Message-ID: <1323182226.19363.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 06 Dec 2011 14:37:06 +0000
In-Reply-To: <cover.1323148566.git.raj.khem@gmail.com>
References: <cover.1323148566.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/6] Enable cloog/ppl when compiling gcc
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
X-List-Received-Date: Tue, 06 Dec 2011 14:43:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-12-05 at 21:21 -0800, Khem Raj wrote:
> This patchset contains
> 
> Changes to gcc where now it will be compiled with cloog/ppl support
> and we have corresponding libraries build as -native and -nativesdk
> recipes

This gives a hit to the build time of the toolchain and I'm not sure
what benefits its buying us, particularly if we don't enable the
optimisations that cloog/ppl is used for.

Whilst this looks nice for experimentation, are there documented
benefits for a system compiled with this?

Cheers,

Richard



