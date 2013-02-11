Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U52ES-0007ny-M7; Mon, 11 Feb 2013 23:52:23 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1BMeg7X004713; Mon, 11 Feb 2013 22:41:51 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Oj97irsEX4eV; Mon, 11 Feb 2013 22:41:50 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1BMfgUo004922
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 11 Feb 2013 22:41:46 GMT
Message-ID: <1360622147.6793.78.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Mon, 11 Feb 2013 22:35:47 +0000
In-Reply-To: <2760168.9kFd94gL1F@helios>
References: <2760168.9kFd94gL1F@helios>
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
X-List-Received-Date: Mon, 11 Feb 2013 22:52:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-02-11 at 17:09 +0000, Paul Eggleton wrote:
> * meta-oe/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bbappend
> This is adding qwt to the qte toolchain. As far as I am concerned this is a 
> distro policy decision - Qwt is a third-party library that is not part of Qt. 
> I believe this should be moved to the layers for whichever distros want this.
> 
> * meta-oe/recipes-qt/qt4/qt4-x11-free_4.8.4.bbappend
> * meta-oe/recipes-qt/qt4/qt4-embedded_4.8.4.bbappend
> These two add MySQL and PostgreSQL support to Qt and Qt/Embedded. I see this 
> as a distro policy decision; these should move to the layers for whichever 
> distros want this. FWIW, this is particularly egregious if you've already 
> built Qt, then add meta-oe and find Qt is being unexpectedly rebuilt.

If these were implemented as PACKAGECONFIG options, then distros would
just need to set the appropriate PACKAGECONFIG for the package in the
distro config and we wouldn't even need the appends...

Cheers,

Richard



