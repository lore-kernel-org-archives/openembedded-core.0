Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RkgwJ-0008SM-LX for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 20:00:56 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0AIrQht013774
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 18:53:26 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13053-07 for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 18:53:22 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0AIrI89013768
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 18:53:19 GMT
Message-ID: <1326221600.23315.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jan 2012 18:53:20 +0000
In-Reply-To: <1326219470.12160.107.camel@phil-desktop>
References: <cover.1326174744.git.sgw@linux.intel.com>
	<1326218233.23315.6.camel@ted>
	<1326219470.12160.107.camel@phil-desktop>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/22] Patches and Updates for M2
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
X-List-Received-Date: Tue, 10 Jan 2012 19:00:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-01-10 at 18:17 +0000, Phil Blundell wrote:
> On Tue, 2012-01-10 at 17:57 +0000, Richard Purdie wrote:
> > > Khem Raj (8):
> > >   site/common-uclibc: Cache gl_cv_func_wcwidth_works
> >
> > I merged these apart from:
> >    default-distrovars: Define DISTRO_FEATURES_LIBC for uclibc
> 
> I think the consensus on that common-uclibc patch (see previous
> discussion on this list) was that it oughtn't to be merged.  Certainly
> not if:
> 
> >   uclibc: Configure UCLIBC_HAS_WCHAR based on libc-posix-clang-wchar
> >     distro feature
> 
> is in, since the latter will make the value in the site file wrong.

Indeed, sorry. I've reverted the former change.

Cheers,

Richard



