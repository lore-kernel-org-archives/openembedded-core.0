Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RB3kk-0002vs-S0 for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 14:05:43 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p94C6cgt030951 for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Oct 2011 13:06:38 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6-+hqKMv2Jhl
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2011 13:06:37 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p94C6XAo030920
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Oct 2011 13:06:35 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 04 Oct 2011 13:00:03 +0100
In-Reply-To: <20111003150904.GR7364@jama.jama.net>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
	<3ffacbd5138165278774387c51b4bd3bb625eaff.1317648041.git.Martin.Jansa@gmail.com>
	<1317654131.13337.6.camel@phil-desktop>
	<20111003150904.GR7364@jama.jama.net>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317729612.14671.34.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCHv2 26/30] glx-use-tls: add from meta-oe layer
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
X-List-Received-Date: Tue, 04 Oct 2011 12:05:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-10-03 at 17:09 +0200, Martin Jansa wrote:
> On Mon, Oct 03, 2011 at 04:02:10PM +0100, Phil Blundell wrote:
> > Can you add some commentary explaining why this is necessary -- i.e.
> > what exactly is lacking in uClibc to mean it doesn't have "prober TLS
> > support"?
> 
> I'm not using uClibc myself and tracking original bbclass in OE-classic
> leads to this commit
> http://git.openembedded.org/cgit.cgi/openembedded/commit/packages/mesa/mesa-tls.inc?id=b527d8f723c98c77f2f5c5358062e5348493d767
> 
> So I'm CCing woglinde and he will probably explain it.

At the very least this should become an include file in the mesa
directory. Its not sufficiently generally used at this point to become a
bbclass file...

Cheers,

Richard



