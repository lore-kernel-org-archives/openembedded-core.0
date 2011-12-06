Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RY3XE-0005cF-Hv for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 23:30:48 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB6MO0mA008312
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Dec 2011 22:24:00 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07721-02 for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2011 22:23:56 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB6MNpmO008306
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Dec 2011 22:23:53 GMT
Message-ID: <1323210242.19363.46.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 06 Dec 2011 22:24:02 +0000
In-Reply-To: <20111206172306.GC5456@jama.jama.net>
References: <1323163736-18065-1-git-send-email-Martin.Jansa@gmail.com>
	<CABcZANk4oH-dDHDZHW+ioRi13AXCS3rBNiUeUZGRZisg56fQfw@mail.gmail.com>
	<20111206172306.GC5456@jama.jama.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] bitbake.conf: change APACHE_MIRROR to use archive site
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
X-List-Received-Date: Tue, 06 Dec 2011 22:30:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-12-06 at 18:23 +0100, Martin Jansa wrote:
> On Tue, Dec 06, 2011 at 07:15:57AM -0700, Chris Larson wrote:
> > On Tue, Dec 6, 2011 at 2:28 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> > > * there are newest as well as older releases, so the SRC_URIs are valid longer
> > > * someone with fast line should try to redownload world to see if the
> > >  structure is the same for all projects (checked for subversion)
> > 
> > Would it not be better to do what we do for other projects, and add
> > the archive URI to either the global MIRRORS for fallback, or prepend
> > to MIRRORS in the appropriate .inc?
> 
> You're right, it's even there already (I didn't know).. but it didn't work for me with subversion...
> 
> somehow it managed to append subversion-1.7.1.tar.bz2 twice

Try:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=rpurdie/useradd4&id=1b4003386bb1849d115f9b2f90594a60fbbf56cc

We really need a regression test for that function, its horrible...

Cheers,

Richard



