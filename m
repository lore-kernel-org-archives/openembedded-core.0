Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TJXWZ-0000zm-6V for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 00:34:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q93MLaoU032273;
	Wed, 3 Oct 2012 23:21:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31844-03; Wed,  3 Oct 2012 23:21:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q93MLQqk032266
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 3 Oct 2012 23:21:27 +0100
Message-ID: <1349302889.18301.61.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Scott Garman <scott.a.garman@intel.com>
Date: Wed, 03 Oct 2012 23:21:29 +0100
In-Reply-To: <506C7341.4010305@intel.com>
References: <1349213410-14141-1-git-send-email-Chase.Maupin@ti.com>
	<506C7341.4010305@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [for-denzil][PATCH] libtool: Add missing DEPENDS on libtool-cross
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
X-List-Received-Date: Wed, 03 Oct 2012 22:34:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-10-03 at 10:17 -0700, Scott Garman wrote:
> On 10/02/2012 02:30 PM, Chase Maupin wrote:
> > * When building with 24 bitbake threads on my system I observed
> >    errors like the following:
> >      | configure.ac:199: error: LT_LANG: unsupported language: "Go"
> >      | <tmpdir>/work/armv7a-vfp-neon-oe-linux-gnueabi/libtool-2.4.2-r3.0/libtool-2.4.2/aclocal-copy/libtool.m4:768: LT_LANG is expanded from...
> >      | configure.ac:199: the top level
> >      | autom4te: m4 failed with exit status: 1
> > * This could be found by doing a clean build.  If a build had
> >    already been performed then often just cleaning the libtool
> >    package and rebuilding it would resolve the issue.
> > * Adding a DEPENDS on libtool-cross resolves this issue with a
> >    clean build.
> > * Bump the PR
> >
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> 
> Thanks for this, I've merged it into my sgarman/denzil-next testing 
> branches.

This isn't even in master yet and I have some concerns about why its
necessary. I've not had a chance to look into it properly yet though :/.

Cheers,

Richard



