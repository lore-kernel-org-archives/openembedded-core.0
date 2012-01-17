Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RnAlx-0000Zn-N9 for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 16:16:29 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0HF8qZo006043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 15:08:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05849-03 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 15:08:48 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0HF8iJe006037
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 15:08:45 GMT
Message-ID: <1326812930.2933.76.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 17 Jan 2012 15:08:50 +0000
In-Reply-To: <cover.1326797712.git.Martin.Jansa@gmail.com>
References: <cover.1326797712.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/2] gnutls fixes
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
X-List-Received-Date: Tue, 17 Jan 2012 15:16:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-01-17 at 11:57 +0100, Martin Jansa wrote:
> Hi,
> 
> nobody likes when it's trying to use host's libraries and even worse 
> when it succeeds and pulls them to rest of OE builds through .la files.
> 
> The following changes since commit 91e17c0c0ac2330f826b95e762542cd0d0c82385:
> 
>   pango: Use gnomebase class, not gnome (2012-01-16 18:01:31 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib jansa/gnutls
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/gnutls
> 
> Martin Jansa (2):
>   gnutls: add readline to DEPENDS and add --with-libreadline-prefix
>   gnutls.inc: set libz prefix

Merged to master, thanks.

Richard



