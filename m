Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U2VrY-0004y4-C4 for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 00:54:16 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r14NhQEk015317; Mon, 4 Feb 2013 23:43:26 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qjLMx-txyBHp; Mon,  4 Feb 2013 23:43:26 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r14NhHMt015294
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 4 Feb 2013 23:43:19 GMT
Message-ID: <1360021079.14071.174.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Seebach <peter.seebach@windriver.com>
Date: Mon, 04 Feb 2013 23:37:59 +0000
In-Reply-To: <20130204172705.0e18d279@e6410-2>
References: <1359977606-15432-1-git-send-email-constantinx.musca@intel.com>
	<20130204122309.12582d0b@e6410-2> <1360020111.14071.172.camel@ted>
	<20130204172705.0e18d279@e6410-2>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo: fix sqlite path and package missing files
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
X-List-Received-Date: Mon, 04 Feb 2013 23:54:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-02-04 at 17:27 -0600, Peter Seebach wrote:
> On Mon, 4 Feb 2013 23:21:51 +0000
> Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> 
> > I suspect not since we don't always use "lib", we might use something
> > different in various multilib configurations for example. Using
> > ${baselib} in the target configurations will therefore give us less
> > problems.
> 
> Oh, point. Yeah, that's probably true.
> 
> I think the pseudo-itself changes are probably not needed (since they
> are basically the same as the with-static-sqlite), but the recipe
> changes may well be desireable, then. I think my --with-sqlite-lib=lib
> may need to be altered in the case where we're not using "lib". It's
> right for the *normal* bitbake native/sdk case, but possibly not for
> other cases.

Agreed. Can someone send me a patch which makes it all work please? :)

Cheers,

Richard



