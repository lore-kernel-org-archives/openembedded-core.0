Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UQlpf-0003Rf-BN for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 23:48:32 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3CLUvFL000710; Fri, 12 Apr 2013 22:30:57 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RssuVZqxZFCR; Fri, 12 Apr 2013 22:30:57 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3CLUphO000703
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 12 Apr 2013 22:30:53 +0100
Message-ID: <1365802242.16702.71.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 12 Apr 2013 22:30:42 +0100
In-Reply-To: <20130412211005.GY2477@jama>
References: <cover.1365797632.git.paul.eggleton@linux.intel.com>
	<30edf2f0744b6ce209455d2c5c63015e06f09265.1365797632.git.paul.eggleton@linux.intel.com>
	<20130412211005.GY2477@jama>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] classes/sanity: fix handling of bblayers.conf updating
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
X-List-Received-Date: Fri, 12 Apr 2013 21:48:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-04-12 at 23:10 +0200, Martin Jansa wrote:
> On Fri, Apr 12, 2013 at 09:16:51PM +0100, Paul Eggleton wrote:
> > Fix the fairly long-standing problem of treating a newer bblayers.conf
> > in the same manner as an older one (reporting that it had been updated
> > even if nothing was done). The recent work to do a reparse without
> > having to manually re-run bitbake turned this from an annoyance into an
> > endless loop, so it had to be fixed.
> 
> Is this endless loop, bitbake hanging forever while parsing or was it
> showing something or failing soon with endless loop detected by python?

You'd see nothing at all, you'd run "bitbake X" and it would just sit
there indefinitely in a loop.

It could be triggered by including meta-yocto but not setting
DISTRO=poky* in a build dir where DISTRO=poky* has previously been used.

Cheers,

Richard



