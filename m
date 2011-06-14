Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QWSoz-0004AJ-Ga for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 14:34:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5ECUqbF012529
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 13:30:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12247-06 for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 13:30:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5ECUhBh012523
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 13:30:44 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1308037752.git.sgw@linux.intel.com>
References: <cover.1308037752.git.sgw@linux.intel.com>
Date: Tue, 14 Jun 2011 13:30:23 +0100
Message-ID: <1308054623.15712.329.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/51] 14-June-2011
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
X-List-Received-Date: Tue, 14 Jun 2011 12:34:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Saul,

I did a merge of the "easy" ones in this series. There are some I've
left pending a little further review or feedback.

On Tue, 2011-06-14 at 01:01 -0700, Saul Wold wrote:
> This has number fixes for various issues along with recipe updates.
> While the autobuidler does not look so great, these have built on local 
> machines in a cleaner environment.
> 
> I removed the large patchset for GCC, it can be reviewed at the browse
> URL below

I merged these with the exception of:

> Kang Kai (2):
>   eglibc: migrate configurability from oe

I wanted to read through this one again...

> Khem Raj (6):
>   uclibc.inc: libsegfault is only RPROVIDED by uclibc

I'm not 100% sure this is a good idea for various reasons, I need to
reply about ti.

>   gcc-4.6.0: Bring in patches from FSF 4.6 branch

I suspect using gcc svn might be better at this point so we might as
well skip merging this and switch straight over.

> 
> Koen Kooi (2):
>   qemu.inc: append to IMAGE_FSTYPES instead of weakly assigning them

This needs more discussion as it forces users to build two image types
and I'm not sure that every user will appreciate this.

> Phil Blundell (5):
>   busybox: backport distro-features handling from oe master

I also wanted to read through this one again...

> Saul Wold (8):
>   json-glib: Fix up SRC_URI Checksums

This patch looks like a whitespace change only?

>   alsa-tools: fix Checksums

This patch has something which looks unintended.

Cheers,

Richard



