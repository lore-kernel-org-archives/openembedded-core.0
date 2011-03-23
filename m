Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q2N9N-0000AI-40 for openembedded-core@lists.openembedded.org;
	Wed, 23 Mar 2011 13:26:57 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2NCP6DA028084
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 12:25:06 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26487-08 for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 12:25:02 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2NCP17Q028064
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 12:25:01 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <6CA3B184-AD05-4A9B-90CE-25AE38DECA39@dominion.thruhere.net>
References: <6CA3B184-AD05-4A9B-90CE-25AE38DECA39@dominion.thruhere.net>
Date: Wed, 23 Mar 2011 12:24:59 +0000
Message-ID: <1300883099.3018.2.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] recipes-efl inside meta-oe or meta-efl next to meta-oe?
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
X-List-Received-Date: Wed, 23 Mar 2011 12:26:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-03-23 at 12:49 +0100, Koen Kooi wrote:
> I'd like to import the EFL recipes Martin did from meta-shr into the meta-openembedded repo. Before I go bothering Martin about it, what would be the best place to put them?
> 
> Inside meta-oe:
> 
> meta-openembedded/
> 	meta-oe/
> 		recipes-efl
> 
> or next to it?
> 
> meta-openembedded/
> 	meta-oe/
> 	meta-efl/

I think the latter might be better in this case. A lot depends on who is
going to maintain them and what the maintainer model is going to be. I
think keeping things we can logically separate from meta-oe separate is
a good thing though in general. We need people to start thinking more in
terms of layers.

Cheers,

Richard



