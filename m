Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RSZBr-00061n-RU for openembedded-core@lists.openembedded.org;
	Mon, 21 Nov 2011 20:06:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pALIxTbr011162
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2011 18:59:29 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10678-05 for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2011 18:59:25 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pALIxLlx011156
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2011 18:59:22 GMT
Message-ID: <1321901967.18926.48.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 21 Nov 2011 18:59:27 +0000
In-Reply-To: <134351F4-81FC-4E78-8075-96C092AEE63E@dominion.thruhere.net>
References: <d06edef859ff936294d76bc07523f50eaaa5baf4.1321811216.git.raj.khem@gmail.com>
	<1eb02b430c12807824427da5cb5abb586a5be8cb.1321811216.git.raj.khem@gmail.com>
	<134351F4-81FC-4E78-8075-96C092AEE63E@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 4/5] netbase: Update recipe 4.46 -> 4.47
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
X-List-Received-Date: Mon, 21 Nov 2011 19:06:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-11-21 at 18:53 +0100, Koen Kooi wrote:
> Some warning (or an ETA at least) before this went in would have been
> appreciated by a lot of BSP maintainers...

Yes, it broke meta-yocto too FWIW :(

We need to find a better way to handle this, ideally with the layers
being a little less fragile on these version changes...

Cheers,

Richard




