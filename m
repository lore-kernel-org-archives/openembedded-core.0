Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id DC0366B898
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 17:22:30 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2SHMM6h028864; Fri, 28 Mar 2014 17:22:23 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id R49HGheamWXO; Fri, 28 Mar 2014 17:22:22 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2SHMJlu028859
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 28 Mar 2014 17:22:21 GMT
Message-ID: <1396027334.14790.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>
Date: Fri, 28 Mar 2014 17:22:14 +0000
In-Reply-To: <20140328171338.GI3370@denix.org>
References: <cover.1395825881.git.kai.kang@windriver.com>
	<CAP9ODKpRZXUxM=QGOBR4xmh=vBWBd6VOqYK0AZwvon_MG4pQGA@mail.gmail.com>
	<20140328171338.GI3370@denix.org>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Replace ocf-linux with cryptodev-linux
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Mar 2014 17:22:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-03-28 at 13:13 -0400, Denys Dmytriyenko wrote:
> On Wed, Mar 26, 2014 at 11:42:39AM -0300, Otavio Salvador wrote:
> > Hello Kai,
> > 
> > On Wed, Mar 26, 2014 at 7:15 AM, Kai Kang <kai.kang@windriver.com> wrote:
> > > Replace ocf-linux with cryptodev-linux because linux-yocto use cryptodev-linux to implement /dev/crypto.
> > 
> > Thanks for handling it; I was going to address same issue this week so
> > we could have it upstreamed and drop the Freescale bbappends for it.
> 
> So, we also have a recipe of cryptodev for TI builds. But it's not just a 
> header file and we need the actual module to be built and packaged...
> 
> I'm rather surprised it was merged so quickly w/o further discussion... :(

From my perspective, the ocf version looked dead and I had several
people saying this was the right thing to do with nobody saying
otherwise, both here on list and in some conversations I had with
people. With the release approaching, it was kind of late to do it
equally, it did appear to be the right thing to switch to so I got on
and tested and then merged it.

I don't consider things "set in stone", I think we can build upon this
incrementally.

Cheers,

Richard


