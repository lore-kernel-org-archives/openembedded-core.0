Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QRY4L-0008Tc-0v for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 01:10:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4VN4OBW022753
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Jun 2011 00:04:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22737-01 for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2011 00:04:20 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4VN4JsL022747
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Jun 2011 00:04:19 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306371583.27470.96.camel@rex>
References: <1306342881.2525.258.camel@phil-desktop>
	<1306364520.27470.81.camel@rex> <1306368023.27470.91.camel@rex>
	<BANLkTimYeFSAq30E3hC3HdJ9r81WyOD0bw@mail.gmail.com>
	<1306371583.27470.96.camel@rex>
Date: Wed, 01 Jun 2011 00:04:03 +0100
Message-ID: <1306883043.27470.403.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: RDEPENDS_${PN} and virtclass-native
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
X-List-Received-Date: Tue, 31 May 2011 23:10:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-26 at 01:59 +0100, Richard Purdie wrote:
> Of course its not that simple. I just discovered:
> 
> OVERRIDES = "z"
> DEPENDS_prepend = "a "
> DEPENDS = "b"
> DEPENDS_z = "c"
> 
> d.update_data()
> d.getVar("DEPENDS") gives "a c"
> d.update_data()
> d.getVar("DEPENDS") gives "c"
> 
> since the _prepend is lost after the update_data(), the _z override is
> not and so the second call overwrites all of DEPENDS.
> 
> We've talked before how overrides should really renameVar, not just copy
> contents. Obviously there are a lot of subtleties to this though and we
> can't just switch due to backwards compatibility :/
> 
> Depending on the number of update_data() calls is truly horrible
> behaviour though :(

I've looked into this and started an RFC thread over on the
bitbake-devel list:

http://lists.linuxtogo.org/pipermail/bitbake-devel/2011-June/000903.html

Cheers,

Richard



