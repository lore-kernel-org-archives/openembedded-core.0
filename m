Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S9ZUD-0003E0-4R for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 11:06:46 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2J9vqx2029012
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 09:57:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25379-09 for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 09:57:39 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2J9vbKR029006
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2012 09:57:39 GMT
Message-ID: <1332151058.9740.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 19 Mar 2012 09:57:38 +0000
In-Reply-To: <3AB6CE7F274E534CAFD089D127A8A1FC23AEFE56@SHSMSX102.ccr.corp.intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
	<1331917154.18586.207.camel@ted>
	<3AB6CE7F274E534CAFD089D127A8A1FC23AEFE56@SHSMSX102.ccr.corp.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 00/60] Package Upgrade
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
X-List-Received-Date: Mon, 19 Mar 2012 10:06:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-03-19 at 08:42 +0000, Wang, Shane wrote:
> Richard Purdie wrote on 2012-03-17:
> 
> > On Fri, 2012-03-16 at 08:52 +0800, Shane Wang wrote:
> > So far I've noticed a few issues. This log has several of them:
> > 
> > http://autobuilder.yoctoproject.org:8010/builders/nightly-mips/builds/316
> > /ste ps/shell_33/logs/stdio
> > 
> > alsa-utils has patch application issues
> > libxxf86dg won't fetch due to a patch issue
> > libpciaccess won't build on mips.
> > 
> > In my own build logs I also noticed:
> > 
> > WARNING: Missing sha256 SRC_URI checksum for
> > /media/build1/sources/gdk-pixbuf-2.24.1.tar.xz, consider adding to the
> > recipe: SRC_URI[sha256sum] =
> > "da7a3f00db360913716368e19e336402755cafa93769f3cfa28a969303e4bee1 "
> > 
> > Cheers,
> > 
> > Richard
> 
> alsa-utils has patch application issue because Kang Kai upgraded to the latest before me.
> I will address the others issues these days.

Please check Sauls latest branches as I don't know what he's fixed at
this point.

Cheers,

Richard



