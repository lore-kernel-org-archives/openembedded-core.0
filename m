Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UYIJb-0003nF-6a for openembedded-core@lists.openembedded.org;
	Fri, 03 May 2013 17:54:32 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r43FcMMj006746; Fri, 3 May 2013 16:38:22 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3FAgb6Sg6S06; Fri,  3 May 2013 16:38:22 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r43FcFkZ006739
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 3 May 2013 16:38:17 +0100
Message-ID: <1367595374.27116.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 03 May 2013 16:36:14 +0100
In-Reply-To: <20130502164613.GE3206@jama>
References: <1367506593-11381-1-git-send-email-jukka.rissanen@linux.intel.com>
	<1367506593-11381-3-git-send-email-jukka.rissanen@linux.intel.com>
	<20130502153930.GD3206@jama>
	<CAJTo0LZrk_JYXV8EQbJ9T__L6qBGHQfO5mNvZmUJtYTEas9x7g@mail.gmail.com>
	<20130502164613.GE3206@jama>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/3] neard: Use SRCREV instead of SRCPV
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
X-List-Received-Date: Fri, 03 May 2013 15:54:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-05-02 at 18:46 +0200, Martin Jansa wrote:
> On Thu, May 02, 2013 at 05:11:28PM +0100, Burton, Ross wrote:
> > On 2 May 2013 16:39, Martin Jansa <martin.jansa@gmail.com> wrote:
> > >> -PV = "0.10+git${SRCPV}"
> > >> +PV = "0.10+git${SRCREV}"
> > 
> > As the git revision is the 0.10 tag, wouldn't it be clearer to not set
> > PV as the git revision is a detail of the fetcher - this *is* 0.10.
> 
> That's fine too as long as nobody bumps SRCREV without updating PV or
> uses AUTOREV from some .inc or local.conf.

Agreed, regardless, SRCREV in PV is not correct, we shouldn't do that
and we have SRCPV for a reason.

Cheers,

Richard



