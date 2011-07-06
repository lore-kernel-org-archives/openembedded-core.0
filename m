Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QePN7-0007We-8n for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 12:30:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p66AQVeV012979
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jul 2011 11:26:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12580-08 for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2011 11:26:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p66AQPuk012973
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jul 2011 11:26:26 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309943840.6337.7.camel@phil-desktop>
References: <696f00b67217242f3a372d070c2473f8ced639ed.1309906154.git.richard.purdie@linuxfoundation.org>
	<1e134055b8c00dd2f93a40a50cf69377c7b325c0.1309906154.git.richard.purdie@linuxfoundation.org>
	<1309943840.6337.7.camel@phil-desktop>
Date: Wed, 06 Jul 2011 11:25:51 +0100
Message-ID: <1309947952.20015.768.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 13/17] apt: Package unpackaged files
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
X-List-Received-Date: Wed, 06 Jul 2011 10:30:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-06 at 10:17 +0100, Phil Blundell wrote:
> On Tue, 2011-07-05 at 23:51 +0100, Richard Purdie wrote:
> > -FILES_${PN}-dev = "${libdir}/libapt*.so"
> > +FILES_${PN}-dev = "${libdir}/libapt*.so ${includedir}"
> 
> Is there a reason why the default FILES from bitbake.conf wouldn't work
> there?  It looks like both the above would be included.

The rest of apt's packaging its horrible and its unclear if there are
other things in the default -dev FILES expression which the apt
packaging wouldn't take well to or not. Really the whole thing needs
rewriting but I wasn't quite in the mood for it ;-).

Cheers,

Richard



