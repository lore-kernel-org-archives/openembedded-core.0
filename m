Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sswxp-0004Mu-AD for openembedded-core@lists.openembedded.org;
	Sun, 22 Jul 2012 16:16:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6ME5RUE028757
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 15:05:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27956-02 for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 15:05:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6ME5K58028751
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 15:05:21 +0100
Message-ID: <1342965926.21788.77.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 22 Jul 2012 15:05:26 +0100
In-Reply-To: <alpine.DEB.2.02.1207220828260.17793@oneiric>
References: <alpine.DEB.2.02.1207220828260.17793@oneiric>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: some rather obvious syntax errors just checked into oe-core
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
X-List-Received-Date: Sun, 22 Jul 2012 14:16:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-07-22 at 08:31 -0400, Robert P. J. Day wrote:
> $ bitbake -c fetchall core-image-minimal
> Pseudo is not present but is required, building this first before the main build
> Loading cache: 100% |#######################################################################| ETA:  00:00:00
> Loaded 708 entries from dependency cache.
> ERROR: ParseError at /home/rpjday/oe/oe-core/meta/recipes-devtools/python/python-native_2.7.3.bb:23:
> unparsed line: 'EXTRA_OECONF_append " --bindir=${bindir}/${PN}"'
> 
>   there's a missing "=" here    ^^^^^^^^^ in python-native_2.7.3.bb

Managed to cherry-pick a broken revision :/. Fixed, sorry about that. 

Cheers,

Richard



