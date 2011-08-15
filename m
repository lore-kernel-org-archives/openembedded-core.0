Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QsyH3-00023F-1P for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 16:36:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7FEVfH1017697
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 15:31:41 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17567-02 for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 15:31:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7FEVXFO017691
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 15:31:33 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E450925.7060101@windriver.com>
References: <4E450925.7060101@windriver.com>
Date: Mon, 15 Aug 2011 15:31:31 +0100
Message-ID: <1313418691.14274.591.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] Performance Issue: Build time increases
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
X-List-Received-Date: Mon, 15 Aug 2011 14:36:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-12 at 19:06 +0800, Robert Yang wrote:
> Hi folks,
> 
> The build time of core-image-sato increases about 5 ~ 10 minutes than
> the following commit:
> 
> commit 5af197b55a4b779f1ec93186f0723026949ba2b5
> Author: Liping Ke <liping.ke@intel.com>
> Date:   Fri Jun 3 08:22:40 2011 +0800
> 
>      cache: Implement multiple extra cache fields request support
> 
> On my host,
> 1) the build time of 5af197b55a4b779f1ec93186f0723026949ba2b5 is:
> 
> real    208m26.133s
> user    241m29.280s
> sys     47m0.630s
> 
> 2) and: 068839698fe192d8846c0ed4db65861448e8e524 is:
> 
> real    217m39.687s
> user    255m34.150s
> sys     48m21.510s
> 
> 
> I use the bisect build method to find out which patch causes the time
> increases, but the build time is not stable on my host(Ubuntu 11.04 64bit),
> e.g., the build time of 1) is 208m at the first build, then "git co 
> other_commit" and build it, after about 10 builds, then go back to build
> 5af197b55a4b779f1ec, the build time will increases about 8 minutes, I have
> stopped the X and cron, at. This may have relationship with the linux
> distribution and disk.
> 
> So I have to restart the build, reboot the machine by two days, and go on the
> build. It would be better if anyone has other good method.
> 
> I think that for the next release(e.g., yocto 1.2), we can find a clean and
> stable machine(for the distribution, maybe RHEL is more stable than Ubuntu)
> to check the build time weekly, so that we can notice the performance issue
> early.

I think we really need to get to the bottom of why the build times are
so variable. Do we need to start doing these on a clean distro install?
is a fresh boot good enough? is there a way we can clear out the VM
caches and get reproducible times? reformat the build partition?

If that really is just because of the nature of a chaotic system, can we
get some better representation of build time to use as a benchmark? We
could really do with finding a faster test (which would hopefully still
be representative)...

Cheers,

Richard








