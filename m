Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QV4ho-00006F-PW for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 18:37:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5AGXmkO028881
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2011 17:33:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28367-08 for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2011 17:33:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5AGXdsU028875
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2011 17:33:41 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1307686598.git.sgw@linux.intel.com>
References: <cover.1307686598.git.sgw@linux.intel.com>
Date: Fri, 10 Jun 2011 17:33:26 +0100
Message-ID: <1307723606.15712.213.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 0/4] 10-June
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
X-List-Received-Date: Fri, 10 Jun 2011 16:37:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-09 at 23:26 -0700, Saul Wold wrote:
> Kang Kai (1):
>   ghostscript: update SRC_URI
> 
> Nitin A Kamble (1):
>   gcc: rebase the patch to avoid patch rejection

This was a disaster. It breaks the build and is huge, thereby clogging
up the source control system web interface etc.

I applied it, then had to revert it. Please test things like this more
carefully in future.

I also think we need to put these kind of patches on the website or in a
repo, we shouldn't be carrying them around in the main repo.

> Phil Blundell (1):
>   busybox: backport distro-features handling from oe master
> 
> Saul Wold (1):
>   multiple recipes converted to -staticdev packages

I'm with Phil on this one, needs more work.

I haven't got to the other two since the gcc issue distracted me :/.

Cheers,

Richard



