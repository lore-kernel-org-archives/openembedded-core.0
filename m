Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S3CIe-0003Rb-B1 for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 21:08:28 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q21K00lH021782
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Mar 2012 20:00:00 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20680-08 for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2012 19:59:56 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q21JxpIr021776
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Mar 2012 19:59:52 GMT
Message-ID: <1330631993.12133.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Mar 2012 19:59:53 +0000
In-Reply-To: <20120301182546.GK3831@jama.jama.net>
References: <85003f1e060b6a4406bdde5c48fb9a09bea2ee05.1330242184.git.Martin.Jansa@gmail.com>
	<f88bff815fdeb404bb9a51efbf1b03862ef6dda0.1330242184.git.Martin.Jansa@gmail.com>
	<4F4F4011.2080303@gmail.com> <20120301094052.GB3831@jama.jama.net>
	<20120301182546.GK3831@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCHv2 2/5] bitbake.conf: remove TARGET_ARCH from in SDKPATH
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
X-List-Received-Date: Thu, 01 Mar 2012 20:08:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-01 at 19:25 +0100, Martin Jansa wrote:
> On Thu, Mar 01, 2012 at 10:40:52AM +0100, Martin Jansa wrote:
> > On Thu, Mar 01, 2012 at 01:23:29AM -0800, Khem Raj wrote:
> > > On 02/25/2012 11:49 PM, Martin Jansa wrote:
> > > > +SDK_NAME_PREFIX = "oecore"
> > > 
> > > should this be weak assignment
> > 
> > Yeah, probably could be (I'm not overwritting this from my distro conf
> > so I haven't tried), but SDK_NAME assignment also wasn't weak and distros
> > were overwritting it.
> > 
> > Someone with custom SDK_NAME(_PREFIX) please try and send patch.
> 
> And we should change TARGET_ARCH in SDK_NAME to
> PACKAGE_ARCH or TUNE_PKGARCH
> 
> because meta-toolchain-gmae for armv7a ends in
> oecore-i686-arm-toolchain-gmae-20120229.tar.bz2
> and for armv4t with similar name (I was lucky that it took more then day to
> build)
> oecore-i686-arm-toolchain-gmae-20120301.tar.bz2

Agreed...

Cheers,

Richard



