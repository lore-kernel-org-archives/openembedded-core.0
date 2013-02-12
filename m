Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U5FsR-00038s-6y; Tue, 12 Feb 2013 14:26:45 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1CDG42l022470; Tue, 12 Feb 2013 13:16:13 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id M3rpn0RVxAP0; Tue, 12 Feb 2013 13:16:12 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1CDG4Zs022435
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 12 Feb 2013 13:16:07 GMT
Message-ID: <1360674605.30425.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Tue, 12 Feb 2013 13:10:05 +0000
In-Reply-To: <1687588.iZvXQbhphA@helios>
References: <2760168.9kFd94gL1F@helios> <1360622147.6793.78.camel@ted>
	<1687588.iZvXQbhphA@helios>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: RFC: meta-oe appends and overlayed recipes
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
X-List-Received-Date: Tue, 12 Feb 2013 13:26:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-02-12 at 09:24 +0000, Paul Eggleton wrote:
> On Monday 11 February 2013 22:35:47 Richard Purdie wrote:
> > On Mon, 2013-02-11 at 17:09 +0000, Paul Eggleton wrote:
> > > *
> > > meta-oe/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bbappe
> > > nd This is adding qwt to the qte toolchain. As far as I am concerned this
> > > is a distro policy decision - Qwt is a third-party library that is not
> > > part of Qt. I believe this should be moved to the layers for whichever
> > > distros want this.
> > > 
> > > * meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend
> > > * meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
> > > These two add MySQL and PostgreSQL support to Qt and Qt/Embedded. I see
> > > this as a distro policy decision; these should move to the layers for
> > > whichever distros want this. FWIW, this is particularly egregious if
> > > you've already built Qt, then add meta-oe and find Qt is being
> > > unexpectedly rebuilt.
> > If these were implemented as PACKAGECONFIG options, then distros would
> > just need to set the appropriate PACKAGECONFIG for the package in the
> > distro config and we wouldn't even need the appends...
> 
> The thing is the Qt configure options are a little more complicated - many of 
> them are three-state switches (enable built-in, enable as a plugin or 
> disabled). Thus we've opted to split the configuration options into variables 
> for each type. We don't get PACKAGECONFIG's DEPENDS handling, but if we used 
> PACKAGECONFIG we'd lose some flexibility.

Is there a way we can at least have it behave in a similar way to
PACKAGECONFIG? Can those configuration variables be set from the
distro? 

My main point is that I'd like to not need bbappend files just for
configuration.

Cheers,

Richard




