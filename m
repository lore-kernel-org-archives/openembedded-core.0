Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1StISV-0005BK-PH; Mon, 23 Jul 2012 15:14:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6ND2VIl016608;
	Mon, 23 Jul 2012 14:02:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04261-07; Mon, 23 Jul 2012 14:02:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6ND28XL016586
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 23 Jul 2012 14:02:18 +0100
Message-ID: <1343048532.21788.95.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 23 Jul 2012 14:02:12 +0100
In-Reply-To: <20120723113712.GE3271@jama.jama.net>
References: <20120722104358.0339C10217@opal>
	<20120723111829.GA20311@jama.jama.net> <1343043175.21788.91.camel@ted>
	<20120723113712.GE3271@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Morgan Little : python: Update for python-native changes
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
X-List-Received-Date: Mon, 23 Jul 2012 13:14:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-07-23 at 13:37 +0200, Martin Jansa wrote:
> On Mon, Jul 23, 2012 at 12:32:55PM +0100, Richard Purdie wrote:
> > On Mon, 2012-07-23 at 13:18 +0200, Martin Jansa wrote:
> > > On Sun, Jul 22, 2012 at 10:43:53AM +0000, git@git.openembedded.org wrote:
> > > > Module: openembedded-core.git
> > > > Branch: master
> > > > Commit: 284a65d55f0ffad0f4f7f32d72da0f9410578643
> > > > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=284a65d55f0ffad0f4f7f32d72da0f9410578643
> > > > 
> > > > Author: Morgan Little <morgan.little@windriver.com>
> > > > Date:   Thu Jul 19 13:46:07 2012 -0400
> > > > 
> > > > python: Update for python-native changes
> > > > 
> > > > Add pythonnative onto the list of inherits and update the paths to the binaries
> > > > referenced in the recipe to the new paths.
> > > > 
> > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > 
> > > 
> > > Any idea why is opkg package-index now failing _sometimes_ ?
> > > 
> > > | + '[' -e /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/ ']'
> > > | + touch /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/Packages
> > > | + flock /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/Packages.flock -c 'opkg-make-index -r /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/Packages -p /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/Packages -m /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/'
> > > | Traceback (most recent call last):
> > > |   File "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/python2.7/site.py", line 569, in <module>
> > > |     main()
> > > |   File "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/python2.7/site.py", line 552, in main
> > > |     known_paths = addsitepackages(known_paths)
> > > |   File "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/python2.7/site.py", line 329, in addsitepackages
> > > |     for sitedir in getsitepackages():
> > > |   File "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/python2.7/site.py", line 303, in getsitepackages
> > > |     sitepackages.append(os.path.join(prefix, sys.lib,
> > > | AttributeError: 'module' object has no attribute 'lib'
> > > | ERROR: Function failed: do_package_index (see /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/package-index-1.0-r0/temp/log.do_package_index.17223 for further information)
> > > NOTE: package package-index-1.0-r0: task do_package_index: Failed
> > 
> > What is the header of opkg-make-index? Is it a path to python or
> > a /usr/bin/env python?
> 
> $ head -n1 jobs/shr-core/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/opkg-make-index
> #!/usr/bin/env python

package-index doesn't inherit pythonnative. The python found from env
would therefore be the host system python but its using files from the
sysroot. Mixing the two is a bad idea.

The question is how is it mixing these up, the host system python
shouldn't be looking there for modules.

So I'm not sure why they're getting mixed up but its likely the problem.
Does anything jump out at you on the machine in question with the above
in mind?

Cheers,

Richard



