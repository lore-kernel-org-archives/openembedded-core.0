Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SSD33-00020C-Oq for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 21:59:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q49JnrMJ025650
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 20:49:53 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23717-08 for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2012 20:49:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q49JnO37025642
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 20:49:25 +0100
Message-ID: <1336592963.2494.69.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 09 May 2012 20:49:23 +0100
In-Reply-To: <20120509142007.528ca609@wrlaptop>
References: <20120509142007.528ca609@wrlaptop>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Protection against ever-more-talented fools...
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
X-List-Received-Date: Wed, 09 May 2012 19:59:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-09 at 14:20 -0500, Peter Seebach wrote:
> Time for some shell trivia!
> 
> Trivia point:  PATH=:/usr/bin and PATH=.:/usr/bin are equivalent.
> Trivia point:  So are PATH=/bin::/usr/bin and PATH=/bin:.:/usr/bin
> Trivia point:  People love to write stuff like:
>   PATH=$(THAT_DIRECTORY):$PATH
> Trivia point:  The shell expands undefined variables to empty strings.
> 
> Which is to say:

I like the patch and I can live with the commit message but could we
have the right subject line and a signed-off-by please? :)

Cheers,

Richard



