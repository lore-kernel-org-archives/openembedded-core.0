Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TmqER-0006i8-Pj for openembedded-core@lists.openembedded.org;
	Sun, 23 Dec 2012 19:25:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qBNIA95f020473;
	Sun, 23 Dec 2012 18:10:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23322-03; Sun, 23 Dec 2012 18:10:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qBNIA2XN020463
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sun, 23 Dec 2012 18:10:04 GMT
Message-ID: <1356286202.21913.21.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Sun, 23 Dec 2012 18:10:02 +0000
In-Reply-To: <alpine.DEB.2.02.1212231020210.32043@oneiric>
References: <alpine.DEB.2.02.1212231020210.32043@oneiric>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: is defining an empty task same as "[noexec]" task flag?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Dec 2012 18:25:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-12-23 at 10:23 -0600, Robert P. J. Day wrote:
> is overriding something like do_compile() like this:
> 
> do_compile() {
>         :
> }

This will get run but does nothing.

> equivalent to:
> 
> do_compile[noexec] = "1"

Bitbake won't even fork() a process to try and execute this so its
marginally more efficient.

Cheers,

Richard



