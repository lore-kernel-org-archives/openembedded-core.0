Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QfEmR-0004eA-A1 for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 19:23:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68HK226022370
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 18:20:02 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22113-04 for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2011 18:19:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68HJtqu022358
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 18:19:56 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94DE226629@orsmsx504.amr.corp.intel.com>
References: <1310139697.6337.134.camel@phil-desktop>
	<1310143750.20015.911.camel@rex>
	<9DA5872FEF993D41B7173F58FCF6BE94DE226629@orsmsx504.amr.corp.intel.com>
Date: Fri, 08 Jul 2011 18:19:17 +0100
Message-ID: <1310145557.20015.914.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: eglibc issuettes continued
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
X-List-Received-Date: Fri, 08 Jul 2011 17:23:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-08 at 09:59 -0700, Kamble, Nitin A wrote:
> I sent a patch to fix /etc/localtime & /etc/rpc files. Other than that I am not seeing any issues for the eglibc recipe packaging.

I pushed:

http://git.openembedded.net/cgit.cgi/openembedded-core/commit/?id=93ce74a299832ca7f24b4ce1b951abffa0232612

to fix one of those. If there is still the localtime issue, we probably
need a patch for that one...

Cheers,

Richard



