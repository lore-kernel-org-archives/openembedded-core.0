Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qf6bP-0005aE-Hz
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 10:39:59 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Jul 2011 01:36:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,498,1304319600"; d="scan'208";a="25337154"
Received: from unknown (HELO helios.localnet) ([10.255.17.130])
	by fmsmga002.fm.intel.com with ESMTP; 08 Jul 2011 01:36:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 8 Jul 2011 09:36:04 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1310079506.git.andrea.adami@gmail.com>
	<CAAQYJAuSgb=pK1ZgpEtymW7skVbcBejqy4DY6-em8-GD2Uridw@mail.gmail.com>
	<BAE51988-281C-4135-A796-75ABE2667937@gmail.com>
In-Reply-To: <BAE51988-281C-4135-A796-75ABE2667937@gmail.com>
MIME-Version: 1.0
Message-Id: <201107080936.04874.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/2] kernel.bbclass: handle embedding of initramfs images
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
X-List-Received-Date: Fri, 08 Jul 2011 08:39:59 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 08 July 2011 01:53:38 Khem Raj wrote:
> > On Fri, Jul 8, 2011 at 1:11 AM, Andrea Adami <andrea.adami@gmail.com> > >> 
> >> +    image = bb.data.getVar('INITRAMFS_IMAGE', d, True)
> >> +    if image != '' and image is not None:
>                         ^^^
> Is this ok ?

Probably "if image:" would be better.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


