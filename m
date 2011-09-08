Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1R1Ys5-0002xZ-Ey
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 09:18:01 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Thu, 8 Sep 2011
	09:12:57 +0200
Date: Thu, 8 Sep 2011 09:13:10 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20110908071310.GB3928@chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1315343093.git.nitin.a.kamble@intel.com>
	<7318770f8b3b34d4ec29ee592971a5be96e53151.1315343093.git.nitin.a.kamble@intel.com>
	<20110907071541.GB4181@chargestorm.se>
	<9DA5872FEF993D41B7173F58FCF6BE94DEFEF755@orsmsx504.amr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94DEFEF755@orsmsx504.amr.corp.intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH 1/1] image-types: add btrfs as a supported fstype
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
X-List-Received-Date: Thu, 08 Sep 2011 07:18:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Kamble, Nitin A <nitin.a.kamble@intel.com> [110907 20:28]:
> > -----Original Message----- From:
> > openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> > Of Anders Darander Sent: Wednesday, September 07, 2011 12:16 AM To:
> > openembedded-core@lists.openembedded.org Subject: Re: [OE-core]
> > [PATCH 1/1] image-types: add btrfs as a supported fstype
> > 
> > As Joshua already replied, this isn't enough.  This raises one
> > question, though. Have you successfully built btrfs-image? If so, I
> > assume that you have more patches locally, otherwise you should
> > resist submitting patches, unless they're clearly marked as RFC
> > (request for comments, and thus not to be applied).
> 
> All these pieces Josh mentioned are already in the tree. I found this
> new line, and saw btrfs was not listed in it so added there also. The
> btrfs support in yocto is working with Linux-yocto 3.x kernel. The
> btrfs kernel config needs to be enabled, I have sent a patch for that
> implementing it as a kernel feature, Once that is there then also need
> to enable the btrfs feature in the Linux-yocto kernel recipe. I will
> send a patch for that too. 

My apologies. 
You're correct in that the pieces mentioned by Josh is already in the
tree.

However, the commit log should probably have included something like
"enabling btrfs support for hob", perhaps worded slightly better. 

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB


