Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SoG6H-0005ui-Ol
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 17:42:13 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 Jul 2012 08:30:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="165804832"
Received: from unknown (HELO helios.localnet) ([10.252.120.244])
	by azsmga001.ch.intel.com with ESMTP; 09 Jul 2012 08:30:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 09 Jul 2012 16:30:41 +0100
Message-ID: <1803032.sCdKSRoOHk@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1207091120520.1353@oneiric>
References: <alpine.DEB.2.02.1207071435090.25344@oneiric>
	<CAK18fxFo2YtoGNQEtLNh8cVPvxKebGYYKQSEVCPxXmWsTfU3Gg@mail.gmail.com>
	<alpine.DEB.2.02.1207091120520.1353@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: setting EXTRA_IMAGE_FEATURES explicitly in .bb file can screw things up
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
X-List-Received-Date: Mon, 09 Jul 2012 15:42:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 09 July 2012 11:24:27 Robert P. J. Day wrote:
> On Mon, 9 Jul 2012, Andrei Gherzan wrote:
> > So IMHO the EXTRA_IMAGE_FEATURES variable in the image should be
> > merged in the IMAGE_FEATURES above. I don't see the meaning of it. 
> 
>   yup, that was precisely the point i was making.  so given the
> potential for confusion, what should be the "best practise" here?
> based on my sketchy understanding, it seems the proper approach would
> be to let recipe files use IMAGE_FEATURES exclusively, while
> specifically reserving EXTRA_IMAGE_FEATURES for the developer's
> local.conf file, and avoid the current unpleasant mixing.

Sounds like a good idea to me.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


