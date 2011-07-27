Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qm0Wh-0004ei-MW for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 11:35:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6R9VG0Q028889
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 10:31:16 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27332-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 10:31:12 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6R9V8vD028883
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 10:31:08 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <704B147D-6F12-4534-9C34-01AE69290717@dominion.thruhere.net>
References: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<992efbf4ec3d7c55346953dbe82f9745590e64bf.1311683981.git.richard.purdie@linuxfoundation.org>
	<969FA904-0086-42FA-B605-07B74FB728B4@kernel.crashing.org>
	<1311688752.2344.238.camel@rex>
	<627CF4AB-F07D-4285-B31C-3C5631270420@kernel.crashing.org>
	<1311697113.2344.268.camel@rex>
	<7B0836D8-31B6-407E-848E-FED9C5BFE78A@kernel.crashing.org>
	<1311720776.2344.319.camel@rex>
	<9A300C7A-E352-4566-AB92-88DF3CF743D7@kernel.crashing.org>
	<1311755778.2344.325.camel@rex>
	<704B147D-6F12-4534-9C34-01AE69290717@dominion.thruhere.net>
Date: Wed, 27 Jul 2011 10:30:58 +0100
Message-ID: <1311759058.2344.344.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/3] Add basic PowerPC core tune config
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
X-List-Received-Date: Wed, 27 Jul 2011 09:35:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-27 at 10:44 +0200, Koen Kooi wrote:
> Op 27 jul. 2011, om 10:36 heeft Richard Purdie het volgende geschreven:
> 
> > [..]
> 
> > We could also put:
> > 
> > GLIBC_EXTRA_OECONF = "--with-cpu=e500"
> > 
> > in the machine config files.
> 
> Note that that will make glibc 'machine' specific and by association
> all userspace. So if you're going that route, you need to touch
> TUNE_PKGARCH as well.

Right, I am making the assumption here that the optimisation chosen
would be appropriate to the TUNE_PKGARCH which is set. Certainly on PPC
there are some machines where this is already the case so it isn't a big
deal from what I've see of the tune files.

Cheers,

Richard



