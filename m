Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UBZuq-0002rh-2x for openembedded-core@lists.openembedded.org;
	Sat, 02 Mar 2013 01:03:08 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r21Ns37V025840; Fri, 1 Mar 2013 23:54:03 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gUWrCaflznW6; Fri,  1 Mar 2013 23:54:03 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r21NrtZq025836
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 1 Mar 2013 23:53:58 GMT
Message-ID: <1362181576.11004.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 01 Mar 2013 23:46:16 +0000
In-Reply-To: <CA+chaQewTJogM92pDtzTgQqz6f90U_F_57t8bQ0MfZx-J9h1rQ@mail.gmail.com>
References: <1362140387-5761-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
	<1362141704.1055.56.camel@ted> <5130FD69.1020804@linux.intel.com>
	<CA+chaQewTJogM92pDtzTgQqz6f90U_F_57t8bQ0MfZx-J9h1rQ@mail.gmail.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: oe-core layer <openembedded-core@lists.openembedded.org>, Patches
Subject: Re: [PATCH v2] btrfs-tools: added PV to git package recipe
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
X-List-Received-Date: Sat, 02 Mar 2013 00:03:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-03-01 at 20:24 +0100, Martin Jansa wrote:
> I don't think 0.20~rc1 sorts lower then 0.20 at least in opkg world:
> 
> 
> OE @ ~/projects/opkg-utils $ ./opkg-compare-versions 0.20~rc1 '<='
> 0.20 && echo "Y"
> OE @ ~/projects/opkg-utils $ ./opkg-compare-versions 0.20-rc1 '<='
> 0.20 && echo "Y"
> OE @ ~/projects/opkg-utils $ ./opkg-compare-versions 0.19+0.20~rc1
> '<=' 0.20 && echo "Y"
> Y
> OE @ ~/projects/opkg-utils $ ./opkg-compare-versions 0.19+0.20-rc1
> '<=' 0.20 && echo "Y"
> Y

Just to follow up, I added this support to opkg itself back in 2008:

http://code.google.com/p/opkg/source/detail?spec=svn40&r=40

It would be nice to finally be able to start using it!

Cheers,

Richard




