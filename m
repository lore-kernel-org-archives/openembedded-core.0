Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TJ10w-0000AK-0n for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 13:51:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q92Bcom1015219;
	Tue, 2 Oct 2012 12:38:50 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14190-07; Tue,  2 Oct 2012 12:38:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q92Bcha3015213
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 2 Oct 2012 12:38:44 +0100
Message-ID: <1349177925.15753.140.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Tue, 02 Oct 2012 12:38:45 +0100
In-Reply-To: <1349176541.32611.80.camel@phil-desktop>
References: <1349169606.32611.73.camel@phil-desktop>
	<1349176346.15753.139.camel@ted>
	<1349176541.32611.80.camel@phil-desktop>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rootfs_ipk, image: Add debug capture support
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
X-List-Received-Date: Tue, 02 Oct 2012 11:51:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-10-02 at 12:15 +0100, Phil Blundell wrote:
> On Tue, 2012-10-02 at 12:12 +0100, Richard Purdie wrote:
> > Hasn't Paul added a general mechanism for doing this so we could add
> > this feature a level higher so that it could be used by all packaging
> > formats?
> 
> Ah, possibly.  I'll have a look.  Can you give me a pointer to the
> mechanism you were thinking of?

Something like IMAGE_FEATURES += "dbg-pkgs" should trigger the addition
of dbg packages.

Cheers,

Richard




