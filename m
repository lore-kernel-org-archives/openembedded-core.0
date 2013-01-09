Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Tsw0C-00015M-LV for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 14:47:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r09DWGRA001112;
	Wed, 9 Jan 2013 13:32:16 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23407-05; Wed,  9 Jan 2013 13:32:12 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r09DW54T001096
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 9 Jan 2013 13:32:07 GMT
Message-ID: <1357738328.13022.76.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Wed, 09 Jan 2013 13:32:08 +0000
In-Reply-To: <alpine.DEB.2.02.1301090656070.14444@oneiric>
References: <alpine.DEB.2.02.1301090656070.14444@oneiric>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: should SRC_URI for mpfr be switched to ftp.gnu.org?
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
X-List-Received-Date: Wed, 09 Jan 2013 13:47:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-01-09 at 06:58 -0500, Robert P. J. Day wrote:
> currently, fetching from mpfr's official SRC_URI,
> http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.bz2, is failing, and i
> can't even browse there.  however, mpfr seems well supported here:
> 
>   http://ftp.gnu.org/gnu/mpfr/
> 
> is there any incentive to switch SRC_URI, or is mpfr.org the official
> download site and this is just a temporary glitch of some kind?

It should probably get listed as a mirror assuming the mpfr site will
come back...

Cheers,

Richard



