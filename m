Return-Path: <denis@denix.org>
X-Greylist: delayed 3618 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 04 May 2015 19:51:08 UTC
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id 64ED37169F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 19:51:08 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NNU00N8J9NU11J0@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 04 May 2015 13:50:18 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=B/MOC1ok c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10	a=1yfBGR3XrjCUK_X99y0A:9
	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 03EF2200EC; Mon,
	4 May 2015 14:50:17 -0400 (EDT)
Date: Mon, 04 May 2015 14:50:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Message-id: <20150504185017.GB5885@denix.org>
References: <20150501160602.GA5885@denix.org> <5543FA71.9060903@ni.com>
MIME-version: 1.0
In-reply-to: <5543FA71.9060903@ni.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: opkg_install_pkg: Package <name> md5sum mismatch. Either the opkg or the package index are corrupt.
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
X-List-Received-Date: Mon, 04 May 2015 19:51:10 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, May 01, 2015 at 05:13:05PM -0500, Alejandro del Castillo wrote:
> 
> 
> On 05/01/2015 11:06 AM, Denys Dmytriyenko wrote:
> > Hi,
> >
> > Has anyone ever seen this message during <image>.do_rootfs task?
> >
> > Collected errors:
> >  * opkg_install_pkg: Package <package> md5sum mismatch. Either the opkg or the package index are corrupt. Try 'opkg update'.
> >  * opkg_install_cmd: Cannot install package <package>.
> >
> > We started seeing it on random packages inside the <image> few weeks ago on 
> > different machines. At the time we had switched to bitbake 1.26. But even 
> > trying different bitbake versions still occasionally caused the same error, so 
> > the culprit is still unknwon. Using oe-core/daisy for now.
> >
> > Any comments or suggestions to where start looking would be appreciated! 
> > Thanks.

> The error is saying that there is a mismatch between the registered package 
> mds5sum and the actual md5sum of the package. On your log.do_rootfs log file 
> you should find the opkg-cl command being called, which has an opkg.conf 
> file as parameter. Inside the conf file, you will see the paths to the local 
> repos being used to build your image.  Can you confirm that the registered 
> md5sum for one of the problematic packages on the Package file on the repo 
> doesn't match the actual package md5sum?

Yes, md5sum of the package doesn't match the one recorded in the Packages file 
of the local feed.

BTW, this seems to only happen to arch-less packages from the "all" feed, 
mainly packagegroups...

-- 
Denys

