Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QNOBi-0002oN-Ax for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 13:48:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4KBjJdl024659
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 12:45:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24051-10 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 12:45:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4KBj9RX024650
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 12:45:10 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1305874831.git.sgw@linux.intel.com>
References: <cover.1305874831.git.sgw@linux.intel.com>
Date: Fri, 20 May 2011 12:45:03 +0100
Message-ID: <1305891903.3424.592.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 00/12] 20-May-2011 Consolidated Pull
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
X-List-Received-Date: Fri, 20 May 2011 11:48:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-20 at 00:06 -0700, Saul Wold wrote:
> This is building green on x86 and ARM.
> 
> This contains updated pull requests from Khem and Dexuan.  I have some
> non-gplv3 fixes along with a fix to the u-boot patch due to a bad checksum.
> 
> I have again included the gcc 4.6 enabler for x86 and arm, the kernel 
> updates are in place. Feel free to remove it, but I think we get a good QA
> pass and move forward, if not we fall back to gcc 4.5.x for RC2.
> 
> Thanks for your considersation

I've merged some of this but I do have some concerns with a few of the
patches:

> Khem Raj (6):
>   conf: Create distro overridable IMAGE varibales

Phil had concerns about this and to be honest I agree with him. More
thought is needed with this, we need more of an overall plan.

>   distcc_2.18.3.bb: Fix compilation on uclibc

I think Phil's comment on this is valid and needs to be addressed.

>   opkg_svn.bb: Install rcS.d into ${D} instead of ${IMAGE_ROOTFS}

Should be using $D, *not* ${D}.

Cheers,

Richard





