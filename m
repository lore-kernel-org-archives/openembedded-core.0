Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sn4V8-0001Qn-3k for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 11:06:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q668tsqZ008109
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jul 2012 09:55:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07892-02 for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2012 09:55:50 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q668tiUk008103
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jul 2012 09:55:45 +0100
Message-ID: <1341564942.3104.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 06 Jul 2012 09:55:42 +0100
In-Reply-To: <4FF5F32C.7080905@gmail.com>
References: <CAJ2CSBsPhAtmpoTpBRzfqghV6tnRQXmjpcY415h=XfXtHxQzHQ@mail.gmail.com>
	<4FF453EC.8030007@linux.intel.com> <1341413143.3906.31.camel@ted>
	<CAJ2CSBuRsmRDCaj5oY8xToURc3GkCJzRj8y6auzTUxA32AZBMQ@mail.gmail.com>
	<1341414137.3906.33.camel@ted>
	<CAJ2CSBtESa4NVB1YF_VSN3BOj-n8NipPN7krkuLHH-nRdEVfcg@mail.gmail.com>
	<20120704152111.GB15100@jama.jama.net>
	<CAJ2CSBvQJtFPBXf-QEVm7bO84W4_K2ziYAOR=1kiQfENyK_D_Q@mail.gmail.com>
	<4FF5F32C.7080905@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: gcc errors while building core-image-sato-sdk
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
X-List-Received-Date: Fri, 06 Jul 2012 09:06:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-07-05 at 13:03 -0700, Khem Raj wrote:
> On 7/4/2012 11:51 PM, Damian, Alexandru wrote:
> > I guess the root of the problem is when the autotools start up -
> > we're having autoconf 2.68, which is not liked by gcc 4.7.1
> > 
> 
> thats a red herring. You should instead find out why is it trying to
> autoreconf
> 
> > configure.ac:33: error: Please use exactly Autoconf 2.64 instead of
> > 2.68. config/override.m4:12: _GCC_AUTOCONF_VERSION_CHECK is
> > expanded from... configure.ac:33: the top level autom4te: m4 failed
> > with exit status: 1
> > 
> > 
> > I'm gonna downgrade to autoconf 2.64 and see what happens.
> > 
> 
> it wont help.

I merged a couple of gcc changes fairly quickly to address a variety of
problems people started hitting (including the autobuilder). The svn
nature of the recipe is causing a few issues with the subversion 1.7
change. I am wondering if we should just point it to the svn checkout
tarball by default and leave the svn url for use when updating only and
populating the mirror?

Cheers,

Richard



