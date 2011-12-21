Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RdPkE-0007WX-GE for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 18:14:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBLH7HcT011580
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 17:07:17 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10835-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 17:07:09 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBLH72J0011538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 17:07:04 GMT
Message-ID: <1324487225.18348.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 21 Dec 2011 17:07:05 +0000
In-Reply-To: <CA452391058F6D4E9715FB2C29D9312A010B9EEF@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1324289521-10140-1-git-send-email-b19537@freescale.com>
	<C27D8181-0988-4BF7-A858-BC873D7C47F8@dominion.thruhere.net>
	<CA452391058F6D4E9715FB2C29D9312A010B915F@039-SN2MPN1-023.039d.mgd.msft.net>
	<1324297600.4568.170.camel@ted>
	<CA452391058F6D4E9715FB2C29D9312A010B9EEF@039-SN2MPN1-023.039d.mgd.msft.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH oe-core] valgrind: add powerpc into the compatible host list
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
X-List-Received-Date: Wed, 21 Dec 2011 17:14:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-21 at 06:21 +0000, Luo Zhenhua-B19537 wrote:
> Since nobody confirm that it works on mips, I will create a new patch to define COMPATIBLE_HOST as following, does it make sense?
> 	COMPATIBLE_HOST = '(i.86|x86_64|powerpc|powerpc64|ppc|ppc64|arm).*-linux'

Sounds good to me.

Cheers,

Richard



