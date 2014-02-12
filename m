Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 4EAEA6E8E1;
	Wed, 12 Feb 2014 16:54:07 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1CGs1YG023160; Wed, 12 Feb 2014 16:54:01 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ldPtVRAhGtAh; Wed, 12 Feb 2014 16:54:00 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1CGrt5S023155
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 12 Feb 2014 16:53:57 GMT
Message-ID: <1392224030.14081.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Feb 2014 16:53:50 +0000
In-Reply-To: <1392219682.14081.1.camel@ted>
References: <CAMKF1sptnVxCrjm7PAOCtRWzmSsxPv4nc0nUO82jMPQ+BCz9Hg@mail.gmail.com>
	<1392219682.14081.1.camel@ted>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] eglibc 2.19
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
X-List-Received-Date: Wed, 12 Feb 2014 16:54:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-02-12 at 15:41 +0000, Richard Purdie wrote:
> On Sat, 2014-02-08 at 08:08 -0800, Khem Raj wrote:
> > Hi all
> > 
> > I have staged a branch with eglibc 2.19 upgraded recipes here
> > 
> > http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/eglibc-2.19
> > 
> > These are not final recipes there may be tweaks needed like adjusting SRC_URI
> > later on.
> > 
> > please help testing it out in your environments and machines
> > I would be happy to help out with issues we find
> 
> The autobuilder is still going but it found:
> 
> http://autobuilder.yoctoproject.org/main/builders/nightly-fsl-ppc/builds/25/steps/BuildImages/logs/stdio

the valgrind configure check breaks too:

http://autobuilder.yoctoproject.org/main/builders/minnow/builds/25/steps/BuildImages/logs/stdio

Cheers,

Richard




