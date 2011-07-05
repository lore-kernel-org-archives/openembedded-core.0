Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qe5Zm-0005UB-EE for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 15:22:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p65DIIXu031500
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jul 2011 14:18:18 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31042-09 for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jul 2011 14:18:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p65DIDbV031494
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jul 2011 14:18:14 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1309503004.git.sgw@linux.intel.com>
References: <cover.1309503004.git.sgw@linux.intel.com>
Date: Tue, 05 Jul 2011 14:17:42 +0100
Message-ID: <1309871862.20015.702.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Updated [PATCH 0/4] SRC_URI Check Updates with Beagleboard updates
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
X-List-Received-Date: Tue, 05 Jul 2011 13:22:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-30 at 23:54 -0700, Saul Wold wrote:
> Richard,
> 
> This address 2 bugs filed by Darren for the Beagleboard, they build
> correctly.
> 
> It also updates two recipes that Mark Hatle found lacking checksums.
> 
> Thanks
> 	Sau!
> 
> The following changes since commit 40ecaf6a59ba61e72d29d7e677197ef37c998408:
> 
>   uclibc: Add default uClibc.machine files (2011-07-01 00:40:10 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/fix
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix
> 
> Saul Wold (4):
>   x-load: Update to 1.5.0
>   uboot: Update to 2011.06
>   mpeg2dec: add SRC_URI Checksum
>   libmad: add SRC_URI Checksum

I merged these apart from uboot which Koen has valid concerns about. We
may need to preserve the older version for a while and let this trickle
down the tree to the layers...

Cheers,

Richard



