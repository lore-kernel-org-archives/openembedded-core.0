Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QpMjB-0002VA-SW for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 17:54:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75Fo2eV013544
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 16:50:02 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13123-04 for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2011 16:49:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75Fntqp013532
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 16:49:56 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94DE85F584@orsmsx504.amr.corp.intel.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<03d062a7104f31d03893833485ec3836c07e8f90.1312469790.git.nitin.a.kamble@intel.com>
	<1312494646.3169.2.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94DE85F4C1@orsmsx504.amr.corp.intel.com>
	<1312495815.3169.9.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94DE85F563@orsmsx504.amr.corp.intel.com>
	<CA+M6bXmzQdpJfADuj65emFTfED=o-HhF7QufdVtMTJCbcCgGGQ@mail.gmail.com>
	<9DA5872FEF993D41B7173F58FCF6BE94DE85F584@orsmsx504.amr.corp.intel.com>
Date: Fri, 05 Aug 2011 16:49:31 +0100
Message-ID: <1312559371.14274.116.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 04/10] glibc: bring back the needed support for glibc recipes
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
X-List-Received-Date: Fri, 05 Aug 2011 15:54:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-04 at 15:57 -0700, Kamble, Nitin A wrote:
> > > It can go in the meta-x32 layer, but I think better place for this
> > support file is in the meta layer. It would help avoid duplication of
> > the code in multiple layers.
> > 
> > Part of the answer here is that obsolete / etc things don't belong in
> > the core, but in other layers that need them.  My read on things is
> > that we've removed glibc in favor of eglibc...
> 
> With high demand I will move the glibc file in the meta-x32 layer. I
> was trying to do what felt right at 1st, but I wasn't aware that
> eglibc is favored so much over glibc.

Please just place that file in the x32 layer. If you need the
PREFERRED_VERSION config, please also place that there.

Cheers,

Richard



