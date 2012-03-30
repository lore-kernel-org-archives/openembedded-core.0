Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SDYKi-0008V1-35 for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 11:41:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2U9WJFR011756
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 10:32:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11041-09 for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 10:32:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2U9WBgg011749
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 10:32:12 +0100
Message-ID: <1333099931.18082.52.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 30 Mar 2012 10:32:11 +0100
In-Reply-To: <CAGiJk9deLrVFhtGF6pAvvWUgyo5kbAE77t9bnWciKtdtC4oD8g@mail.gmail.com>
References: <20120329225332.0e8cc2f4@eb-e6520> <1333058593.18082.40.camel@ted>
	<CADkTA4MvYRmsLQogaQMHwUeP5y7ws5NvmXiBMgvsreiGNQrsJw@mail.gmail.com>
	<CAGiJk9deLrVFhtGF6pAvvWUgyo5kbAE77t9bnWciKtdtC4oD8g@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Fetch time optimization (svn : gcc/eglibc - git : linux-yocto)
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
X-List-Received-Date: Fri, 30 Mar 2012 09:41:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-30 at 08:44 +0200, Samuel Stirtzel wrote:
> this might be a bit off-topic, but another idea would be to add a
> separate threading mechanism for fetching.
> 
> Current threading can help to use the CPU and memory load to it's optimum,
> but sometimes you have to wait for a download to finish..
> Instead there could be a separate set of threads that only download
> the sources and make optimal use of the bandwidth too.
> 
> This would also allow to fetch files when the normal threads are busy
> with configuring/building/packaging recipes.
> 
> 
> The downside would be that it requires some sort of inter process
> communication.
> Or it could be regulated with a simple check if the download is finished..
> 
> How does this idea sound to you?

Its easier than you think to do this, bitbake has a plugable scheduler
implementation so you'd just have to write one which ignores "fetch"
operations from the total thread count.

Sadly this isn't really the place most people have a bottleneck in day
to day usage of the system. People have tried various algorithms for
enhancing the scheduler and as far as I know never found anything that
makes a significant difference, much to everyone's surprise :/.

Cheers,

Richard




