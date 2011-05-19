Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QN4sp-0002Zv-7w for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 17:11:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JF8WBx009451;
	Thu, 19 May 2011 16:08:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08978-07; Thu, 19 May 2011 16:08:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JF8RfA009445
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 19 May 2011 16:08:28 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <pb@pbcl.net>
In-Reply-To: <1305817446.18415.193.camel@lenovo.internal.reciva.com>
References: <1305640549.2429.226.camel@phil-desktop>
	<1305642273.3424.244.camel@rex>
	<1305643833.2429.264.camel@phil-desktop>
	<1305649331.3424.259.camel@rex>
	<1305733061.18415.98.camel@lenovo.internal.reciva.com>
	<1305800103.3424.464.camel@rex>
	<1305801068.18415.179.camel@lenovo.internal.reciva.com>
	<1305804109.3424.475.camel@rex>
	<1305805268.18415.185.camel@lenovo.internal.reciva.com>
	<1305807396.3424.510.camel@rex>
	<1305817446.18415.193.camel@lenovo.internal.reciva.com>
Date: Thu, 19 May 2011 16:08:24 +0100
Message-ID: <1305817704.3424.531.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rootfs_ipk: respect ONLINE_PACKAGE_MANAGEMENT
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
X-List-Received-Date: Thu, 19 May 2011 15:11:40 -0000
X-List-Received-Date: Thu, 19 May 2011 15:11:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-19 at 16:04 +0100, Phil Blundell wrote:
> On Thu, 2011-05-19 at 13:16 +0100, Richard Purdie wrote:
> > So if we:
> > 
> > a) Only add ROOTFS_PKGMANAGE_BOOTSTRAP if postinstalls were present
> > b) Add the read-only-rootfs option we discussed which errors if 
> >    postinstalls are present
> > 
> > we end up a lot closer to where you want to be.
> 
> Yes, sounds reasonable.  And I think we could then eliminate
> remove_packaging_data_files() altogether, in favour of having the right
> thing happen automatically during rootfs construction, which would
> probably be a good thing too.

Agreed, I think we have a plan :)

Cheers,

Richard



