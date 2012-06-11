Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Se1xu-0002SB-8X
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 12:35:18 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Jun 2012 03:24:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="164088824"
Received: from unknown (HELO helios.localnet) ([10.252.120.119])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jun 2012 03:24:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jun 2012 11:24:42 +0100
Message-ID: <2537506.sJK0eATnrm@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-24-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <20120611094548.GA6900@ad.chargestorm.se>
References: <cover.1339405061.git.lianhao.lu@intel.com>
	<ebe46107b8bcc9637bf93b125fa5f9b0a0a045bd.1339405061.git.lianhao.lu@intel.com>
	<20120611094548.GA6900@ad.chargestorm.se>
MIME-Version: 1.0
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [PATCH 1/3] openssh: Allow empty passwords login.
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
X-List-Received-Date: Mon, 11 Jun 2012 10:35:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 11 June 2012 11:45:49 Anders Darander wrote:
> * Lianhao Lu <lianhao.lu@intel.com> [120611 11:03]:
> > Allow empty passwords login so that the default root user can login in
> > through openssh.
> 
> NAK, this isn't a sane default for a OpenSSH-recipe...

I agree, however more below...

> What's your use-case? Is it for automatic testing/development? If so,
> can't you either set the password, or change the config using some other
> means, e.g. a post rootfs installation script? (And make sure that this
> is only run for the image in question, _not_ for all images).

I don't think we want this to be image-specific. FWIW, we do already have a 
mechanism to handle this for the dropbear recipe - debug-tweaks in 
IMAGE_FEATURES. I don't particularly like it however since IMAGE_FEATURES 
should not be influencing non-image recipes. This has bothered me for a while 
and I think we ought to change to some other mechanism (perhaps make it a 
separate variable) and then make the OpenSSH recipe use that.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


