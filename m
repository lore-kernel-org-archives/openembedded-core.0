Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SEp71-0003ni-L1
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Apr 2012 23:48:31 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Apr 2012 14:39:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="126281220"
Received: from unknown (HELO helios.localnet) ([10.252.120.26])
	by azsmga001.ch.intel.com with ESMTP; 02 Apr 2012 14:39:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 02 Apr 2012 22:39:20 +0100
Message-ID: <1695746.vzEQQB1zRy@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-17-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1204021730530.6159@oneiric>
References: <alpine.DEB.2.02.1204021730530.6159@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: should all class files be inherited by *something*?
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
X-List-Received-Date: Mon, 02 Apr 2012 21:48:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 02 April 2012 17:34:26 Robert P. J. Day wrote:
>   poking around the meta/classes/*.bbclass files and one looked a bit
> odd -- scons.bbclass.  i was under the impression that class files
> were supposed represent a *general* kind of functionality so i was
> curious as to what this file represented.
>
>   more to the point, it doesn't look like anything in oe-core inherits
> that class.  so what exactly is its purpose?

I believe it's for supporting the scons build system. scons isn't hugely 
popular though so I guess it's not surprising that nothing in OE-Core uses it.

>   and following up on that, another example of that kind of file is
> oelint.bbclass -- again, i don't see anything in oe-core that inherits
> it.

I think oelint.bbclass is a really out-of-date recipe lint checking tool. I 
wonder if anyone has used it lately. There could be value in bringing it up-
to-date though.

It's worth noting that we may have a number of classes that are supposed to be 
generally useful in OE-Core that aren't used within OE-Core itself. This is a 
good idea because it reduces the proliferation of different versions of such 
classes in multiple layers.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


