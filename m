Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TszVw-0002Pt-EZ for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 18:32:42 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r09HHIR3002707;
	Wed, 9 Jan 2013 17:17:18 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23407-08; Wed,  9 Jan 2013 17:17:14 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r09HHCBb002701
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 9 Jan 2013 17:17:13 GMT
Message-ID: <1357751835.13022.103.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Date: Wed, 09 Jan 2013 17:17:15 +0000
In-Reply-To: <CACW_hTbcpzGuQw3HfNc1bL+a7L6oGcJWfhE5=YKyXR6fwQeVfg@mail.gmail.com>
References: <CACW_hTbcpzGuQw3HfNc1bL+a7L6oGcJWfhE5=YKyXR6fwQeVfg@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: split mtd-utils
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
X-List-Received-Date: Wed, 09 Jan 2013 17:32:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-01-09 at 17:12 +0100, Frans Meulenbroeks wrote:
> As I am involved in embedded systems where flash is somewhat sparse
> I'm always eager to save a few bytes where possible.
>
> Today I noticed that mtd-utils (1.5.0 from danny) generates for my
> architecture (powerpc) roughly 780k of binaries in usr/sbin. 423k of
> it is due to ubifs related files.
>
> Would it be desired to put this in a separate package?
>
> e.g. mtd-utils-ubi and mtd-utils-nonubi with mtd-utils itself being
> empty but rdepend on those two?
> that way mtd-utils will still give all packages but those only wanting
> the non ubi stuff can limit themselves to that.
>
> If desired I can give this a stab.

Sounds like a sensible split to me...

Cheers,

Richard




