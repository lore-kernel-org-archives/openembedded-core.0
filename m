Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TvRxt-0000KR-0q for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 13:19:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0GC4BOf023872;
	Wed, 16 Jan 2013 12:04:11 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23524-03; Wed, 16 Jan 2013 12:04:07 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0GC438E023866
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 16 Jan 2013 12:04:04 GMT
Message-ID: <1358337843.8129.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jaap de Jong <jaap.dejong@nedap.com>
Date: Wed, 16 Jan 2013 12:04:03 +0000
In-Reply-To: <50F5699A.207@nedap.com>
References: <50F5699A.207@nedap.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: signing ipk packages
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
X-List-Received-Date: Wed, 16 Jan 2013 12:19:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-01-15 at 15:37 +0100, Jaap de Jong wrote:
> Hi All,
> is it possible to sign ipk packages?
> I've seen that it is possible to add a file called '_signature' to a 
> package.
> No idea how the process looks.
> Anyone an idea or perhaps a pointer where to look?

Look at opkg and its gpg support. We don't enable it by default as
nobody was using it and it causes unnecessary dependencies. I think
Steve Sakoman may have posted something in the archives about his
experiences but I'm not 100% sure.

Cheers,

Richard



