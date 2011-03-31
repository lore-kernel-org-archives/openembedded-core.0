Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q5FKr-0001jN-4K for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 12:42:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2VAefW9023908
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 11:40:41 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23688-04 for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 11:40:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2VAeYRN023902
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 11:40:35 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <A1E6FA6F-3108-4E38-8E8F-2F231E6E1685@windriver.com>
References: <1301496447.24596.100.camel@rex> <4D934FBC.40802@windriver.com>
	<9DA5872FEF993D41B7173F58FCF6BE94510B849E@orsmsx504.amr.corp.intel.com>
	<9DA5872FEF993D41B7173F58FCF6BE94510B84A7@orsmsx504.amr.corp.intel.com>
	,
	<9DA5872FEF993D41B7173F58FCF6BE94510B84B1@orsmsx504.amr.corp.intel.com>
	<A1E6FA6F-3108-4E38-8E8F-2F231E6E1685@windriver.com>
Date: Thu, 31 Mar 2011 11:40:31 +0100
Message-ID: <1301568031.24596.104.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: lconfig-native is not endian safe
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
X-List-Received-Date: Thu, 31 Mar 2011 10:42:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-31 at 09:02 +0000, Hatle, Mark wrote:
> My opinion is to avoid it vs run in a qemu shell.  I really don't like
> being forced to have qemu to run a build of any type.

Agreed, I think we can avoid this.

For reference, I have half he endian problem resolved with:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/gcc-sharedwork&id=0711c7c065c6e1caa04f452069d08a056c3caabe

which handles reading in the data from the elf files in an endian safe
way. Someone needs to go through and change the dl cache file handling
code to be endian safe though, then compare the result with a file
generated on a target device.

Cheers,

Richard




