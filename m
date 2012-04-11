Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SHxYH-0002Zq-Lh
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 15:25:37 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 Apr 2012 06:16:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="87808739"
Received: from unknown (HELO helios.localnet) ([10.252.120.50])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Apr 2012 06:16:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Apr 2012 14:15:57 +0100
Message-ID: <1487451.qaDevSNUCm@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.0.0-17-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <CAAQYJAsGkFkBnFXfWzcx6UTm12SY39=VU6SFKT_iTsxH6=wmtg@mail.gmail.com>
References: <1333402513-26781-1-git-send-email-andrea.adami@gmail.com>
	<6585414.f7e2xNFMXD@helios>
	<CAAQYJAsGkFkBnFXfWzcx6UTm12SY39=VU6SFKT_iTsxH6=wmtg@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] udev: generalize the check in touchscreen rule
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
X-List-Received-Date: Wed, 11 Apr 2012 13:25:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 11 April 2012 15:09:10 Andrea Adami wrote:
> On Wed, Apr 11, 2012 at 2:55 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > On Wednesday 11 April 2012 13:57:29 Andrea Adami wrote:
> >> Finally, bluelightning reported that on ipaq h1940 the rule did not
> >> match and added a .bbappend in meta-handheld.
> > 
> > FYI this is because pressure support was removed from the driver. I don't
> > know if there's ever hope of it coming back.
> 
> Well, there was a NACKed patch:
> 
> https://lkml.org/lkml/2011/6/23/817
> 
> Mark Brown:
> "It seems much more sane to fix this in tslib, the kernel is not actually
> reporting pressure meaningfully here and there's already BTN_TOUCH to
> report if the pen is down."

Interesting. FWIW, I can report that with a patch to the rule such as this one 
at least on h1940 the touchscreen works fine, and there was no need to 
additionally fix anything in tslib.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


