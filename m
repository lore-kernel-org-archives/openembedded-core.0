Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0EpX-0006cM-O4 for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 17:14:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1MG5p6W030639
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 16:05:51 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30565-01 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 16:05:47 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1MG5fmV030632
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 16:05:42 GMT
Message-ID: <1329926741.20261.164.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 22 Feb 2012 16:05:41 +0000
In-Reply-To: <AB7E7710-28E1-4A2E-8822-CB710F839D7C@dominion.thruhere.net>
References: <cover.1329916583.git.liezhi.yang@windriver.com>
	<287F5295-D8E2-4540-A20D-28D934EAEA88@dominion.thruhere.net>
	<1329920131.20261.148.camel@ted>
	<9FF37BD6-73C7-4056-B38F-BCC8740C5A95@dominion.thruhere.net>
	<1329923198.20261.160.camel@ted>
	<AB7E7710-28E1-4A2E-8822-CB710F839D7C@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] A script to clean obsolete sstate cache files
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
X-List-Received-Date: Wed, 22 Feb 2012 16:14:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-02-22 at 16:11 +0100, Koen Kooi wrote:
> Op 22 feb. 2012, om 16:06 heeft Richard Purdie het volgende geschreven:
> 
> > On Wed, 2012-02-22 at 15:32 +0100, Koen Kooi wrote:
> >> Op 22 feb. 2012, om 15:15 heeft Richard Purdie het volgende geschreven:
> >> 
> >>> On Wed, 2012-02-22 at 14:42 +0100, Koen Kooi wrote:
> >>>> Op 22 feb. 2012, om 14:27 heeft Robert Yang het volgende geschreven:
> >>>> 
> >>>>> Here is the testing result:
> >>>>> 
> >>>>> $ ./poky/scripts/sstate-cache-management.sh --cache-dir=sstate-cache.bak/ --remove-duplicated
> >>>>> Figuring out the archs in the sstate cache dir ...
> >>>>> The following archs have been found in the sstate cache dir:
> >>>>> i586 ppc603e x86_64 qemux86 qemuppc
> >>>>> Removing the sstate-xxx_deploy-rpm.tgz ... (3034 files)
> >>>>> Removing the sstate-xxx_deploy-ipk.tgz ... (0 files)
> >>>>> Removing the sstate-xxx_deploy-deb.tgz ... (0 files)
> >>>>> Removing the sstate-xxx_deploy.tgz ... (8 files)
> >>>>> Removing the sstate-xxx_package.tgz ... (3282 files)
> >>>>> Removing the sstate-xxx_populate-lic.tgz ... (2482 files)
> >>>>> Removing the sstate-xxx_populate-sysroot.tgz ... (3282 files)
> >>>>> 12088 files have been removed
> >>>>> 
> >>>>> // Robert
> >>>>> 
> >>>>> The following changes since commit 87e32edb88c30ac116fa396148ac26357051f93a:
> >>>>> 
> >>>>> iputils: Add base_libdir to VPATH in order to find the crypto library (2012-02-21 17:59:40 +0000)
> >>>>> 
> >>>>> are available in the git repository at:
> >>>>> git://git.pokylinux.org/poky-contrib robert/remove-sstate
> >>>>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/remove-sstate
> >>>> 
> >>>> Do you have a patch against oe-core instead of poky??!?
> >>> 
> >>> Does this really need as many question and exclamation marks???!!!!????!
> >>> 
> >>> ;-)
> >>> 
> >>> Its not hard to manipulate the patches around from one tree to the
> >>> other.
> >> 
> >> That's good to know, so why wasn't it manipulated to work on oe-core when being sent to the oe-core list?
> > 
> > Or why can't people just cherry-pick the patch in, or apply the patch
> > manually? 
> 
> Personally, I'm too lazy for that. If someone sends a pull request to
> oe-core I kinda assume it's for oe-core. I tried to pull it in for
> testing and it blew up.

So I think its reasonable for people to indicate which tree the pull
request is based off and I'll suggest people do this in future.

If its not indicated, oe-core is a reasonable assumption but providing a
poky tree for convenience shouldn't cause quite as much friction as it
does since it is better than no tree at all and some of us can manage
them fine.

Cheers,

Richard



