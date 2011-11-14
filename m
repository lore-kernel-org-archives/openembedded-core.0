Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RQ3QA-0008DE-8Y for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 21:46:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAEKe1oN016067
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2011 20:40:01 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15395-07 for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2011 20:39:57 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAEKdrBA016057
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2011 20:39:54 GMT
Message-ID: <1321303197.26881.74.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 14 Nov 2011 20:39:57 +0000
In-Reply-To: <E3435B57-20F8-421E-8E1B-966A1B95CC8F@dominion.thruhere.net>
References: <cover.1321296476.git.paul.eggleton@linux.intel.com>
	<2ffb85152b2b9356efeb008891d8ed29f1f35cef.1321296476.git.paul.eggleton@linux.intel.com>
	<E3435B57-20F8-421E-8E1B-966A1B95CC8F@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/4] distcc: make distccmon-gnome optional and default to off
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
X-List-Received-Date: Mon, 14 Nov 2011 20:46:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-11-14 at 20:17 +0100, Koen Kooi wrote:
> Op 14 nov. 2011, om 19:54 heeft Paul Eggleton het volgende geschreven:
> 
> > Most people building distcc will not need the distccmon-gnome GUI to be
> > built, so make it optional via the new PACKAGECONFIG functionality and
> > default it to disabled. (This also removes the need to disable it for
> > uclibc.)
> > 
> > Part of the fix for [YOCTO #1690].
> 
> I think splitting distccmon-gnome into a seperate recipe is a better idea.

I think that makes sense in some cases but I'd hate for it to become the
default approach for issues like this as the duplication of code,
parsing and build time etc. grate on me. Do we really need separate
recipes?

I'll probably take this patch as it improves the situation IMO (and is
easy to change the configuration from a distro config if anyone does
have an issue with it being disabled).

Cheers,

Richard



