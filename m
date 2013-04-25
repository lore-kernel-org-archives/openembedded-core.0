Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UVPt4-0000GU-So
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 19:23:22 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 25 Apr 2013 10:05:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,551,1363158000"; d="scan'208";a="232450273"
Received: from unknown (HELO helios.localnet) ([10.255.12.123])
	by AZSMGA002.ch.intel.com with ESMTP; 25 Apr 2013 10:05:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2013 18:05:21 +0100
Message-ID: <2617360.KvDFvdIEGN@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <CAP9ODKra5FDPMw9AnGhxVijp43_0SnVZVxhfPGwnBpeEaaWUaw@mail.gmail.com>
References: <AAE0766F5AF36B46BAB7E0EFB927320630E4A540CC@GBTWK10E001.Technology.local>
	<AAE0766F5AF36B46BAB7E0EFB927320630E4A540D1@GBTWK10E001.Technology.local>
	<CAP9ODKra5FDPMw9AnGhxVijp43_0SnVZVxhfPGwnBpeEaaWUaw@mail.gmail.com>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: Problems with PACKAGE_CLASSES = "package_tar"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Apr 2013 17:23:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 25 April 2013 09:00:55 Otavio Salvador wrote:
> On Thu, Apr 25, 2013 at 7:21 AM, Lewis, Nick <nick.lewis@usa.g4s.com> wrote:
> > I have tried cherry picking from Dylan but it also seems to be missing
> > populate_sdk_tar.bbclass and rootfs_tar.bbclass Does Dylan support
> > PACKAGE_CLASSES = "package_tar" without these classes?
>
> As it seems you're early in the release cycle of the product, dylan
> would be a better base for your work 

Definitely agreed, however

> as danny maintenance should end when 1.5 is released.

This is not correct. We've continued maintenance of denzil (the previous 
stable release) up to this point, and the community is free to continue that 
maintenance almost indefinitely; the same should be applicable to danny.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


