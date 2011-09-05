Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R0cQL-0007Vh-9Q for openembedded-core@lists.openembedded.org;
	Mon, 05 Sep 2011 18:53:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p85GmT8J032525
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Sep 2011 17:48:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29957-03 for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2011 17:48:25 +0100 (BST)
Received: from [192.168.1.40] (dynamic10.rpnet.com [192.168.1.40])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p85GmJUD032519
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Sep 2011 17:48:22 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1315159086.2896.0.camel@lenovo.internal.reciva.com>
References: <cover.1315109841.git.sgw@linux.intel.com>
	<9f4240fffc8748f28e2d4ce6a6c88dee30ab9ddd.1315109841.git.sgw@linux.intel.com>
	<1315159086.2896.0.camel@lenovo.internal.reciva.com>
Date: Mon, 05 Sep 2011 17:48:18 +0100
Message-ID: <1315241298.1243.1.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/2] groff: Fix sstate relocation issue
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
X-List-Received-Date: Mon, 05 Sep 2011 16:53:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-09-04 at 18:58 +0100, Phil Blundell wrote:
> On Sat, 2011-09-03 at 21:19 -0700, Saul Wold wrote:
> > +	create_cmdline_wrapper ${D}/${bindir}/groff \
> > +		-F${STAGING_DIR_NATIVE}/usr/share/groff/${PV}/font \
> > +		-M${STAGING_DIR_NATIVE}/usr/share/groff/${PV}/tmac
> > +}
> 
> Shouldn't that be ${datadir}?

or datadir_native :)

I'll pull and amend the patch with that change.

Cheers,

Richard



