Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RXU7c-0007bh-Lc for openembedded-core@lists.openembedded.org;
	Mon, 05 Dec 2011 09:42:00 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB58ZC6S020829;
	Mon, 5 Dec 2011 08:35:12 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20709-02; Mon,  5 Dec 2011 08:35:08 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB58Z4eh020820
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 5 Dec 2011 08:35:05 GMT
Message-ID: <1323074115.25960.88.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 05 Dec 2011 08:35:15 +0000
In-Reply-To: <CAEsOVNceh3VcNJ9P=mhFnwOPn_w=QrRMPNTZkdnwf5dsapFfaA@mail.gmail.com>
References: <CAEsOVNceh3VcNJ9P=mhFnwOPn_w=QrRMPNTZkdnwf5dsapFfaA@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: do_populate_lic_setscene when building LSB on edison
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
X-List-Received-Date: Mon, 05 Dec 2011 08:42:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-12-04 at 18:44 +0000, McClintock Matthew-B29882 wrote:
> Can anyone comment if this issue has been resolved on master? It's
> very random which package it occurs on, it only seems to happen when
> building the LSB target, and it also appears to happen on my CentOS 5
> box and not my Ubuntu box (at least less often)... sometimes it
> happens only on one package in a build, sometimes it's 5-10
> packages...
> 
> ERROR: Task 3209
> (/opt/yocto/cache-test/p2041rdb/meta/recipes-graphics/freetype/freetype_2.4.6.bb,
> do_populate_lic_setscene) failed with exit code '1'

What do the logfiles in the workdir/temp directories say for these
tasks?

Cheers,

Richard



