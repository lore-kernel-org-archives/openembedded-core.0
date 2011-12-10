Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RZKHn-00035N-8W for openembedded-core@lists.openembedded.org;
	Sat, 10 Dec 2011 11:36:07 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBAATFuS011747
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2011 10:29:15 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08969-08 for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2011 10:29:11 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBAAT62u011741
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2011 10:29:08 GMT
Message-ID: <1323512958.5309.211.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 10 Dec 2011 10:29:18 +0000
In-Reply-To: <FB606EB2-C1A7-4264-ACEF-543155D48AF7@dominion.thruhere.net>
References: <cover.1323286080.git.elizabeth.flanagan@intel.com>
	<b3e01cfa4f1561a77b07e3365459e9498d8c4585.1323286080.git.elizabeth.flanagan@intel.com>
	<1323437428.5309.154.camel@ted>
	<CAMKF1sp3MfaSGpAQMiafWxJw8VEv9_BNNVEpzzYcBQbsxpihdg@mail.gmail.com>
	<FB606EB2-C1A7-4264-ACEF-543155D48AF7@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 6/8] [YOCTO #1776] license: manifest and license path
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
X-List-Received-Date: Sat, 10 Dec 2011 10:36:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-12-10 at 09:16 +0100, Koen Kooi wrote:
> Op 9 dec. 2011, om 20:57 heeft Khem Raj het volgende geschreven:
> 
> > On Fri, Dec 9, 2011 at 5:30 AM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >> 
> >> The above line is a bashism and is breaking builds with dash
> >> as /bin/sh :(
> > 
> > I thought bashism was too deep in oe. I can certainly revert to using dash if
> > thats no longer the case.
> 
> We try to keep OE itself free of bashisms. The biggest problem is
> package authors using them like the libtool/gtk bashism interaction.

There is a patch merged which should sort out most of the libtool issues
at least. libtool continues to use bash but it references it
as /bin/bash, not /bin/sh.

Cheers,

Richard




