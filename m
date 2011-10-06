Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RBvsk-00013w-Qv for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 23:53:35 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p96LsTDg000366 for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Oct 2011 22:54:29 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LxuRZPJEsemr
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2011 22:54:29 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p96LsQVe000362
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Oct 2011 22:54:28 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 06 Oct 2011 22:47:49 +0100
In-Reply-To: <4E8DBF9E.70600@windriver.com>
References: <1317910843.6398.87.camel@ted> <4E8DBF9E.70600@windriver.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317937677.6398.130.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH] native.bbclass: Ensure native recipes have a deterministic baselib value
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
X-List-Received-Date: Thu, 06 Oct 2011 21:53:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-10-06 at 09:47 -0500, Mark Hatle wrote:
> On 10/6/11 9:20 AM, Richard Purdie wrote:
> > Changes to baselib by specific machine configuration were resulting
> > in sstate cache invalidation, particularly in multilib configurations.
> > 
> > This patch ensures this doesn't happen and native sstate cache files
> > are reusable.
> 
> Likely throwing in a can of worms here, but for our existing (non-OE based)
> work, we generally change the baselib to "lib64" on 64-bit machines.  Without
> patching native.bbclass, is it possible to do that?

Yes, you could set this based on the build system architecture no
problem at all.

The reason for this change is to have a single value for native packages
which doesn't change based on MACHINE. That doesn't stop you changing it
based on something specific the native binaries themselves.

The native sysroots are different depending on the build system
architecture anyway so this actually might be a non-issue for you
anyway.

Cheers,

Richard



