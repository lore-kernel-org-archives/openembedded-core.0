Received: from stoexhub03.domain01.net ([83.145.59.144])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1T1G0D-0000FA-E1
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:13:41 +0200
Received: from localhost (193.41.119.134) by stoexhub03.domain01.net
	(10.12.10.3) with Microsoft SMTP Server id 8.3.245.1; Tue, 14 Aug 2012
	14:01:02 +0200
Date: Tue, 14 Aug 2012 14:01:54 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20120814120153.GB3444@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1344934956-28631-1-git-send-email-radu.moisan@intel.com>
	<20120814112542.GA3444@ad.chargestorm.se>
	<502A3A08.8020506@intel.com>
MIME-Version: 1.0
In-Reply-To: <502A3A08.8020506@intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.20 (2009-12-10)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH] busybox: Upgrade to upstream 1.20.2
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
X-List-Received-Date: Tue, 14 Aug 2012 12:13:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Radu Moisan <radu.moisan@intel.com> [120814 13:42]:


> On 08/14/2012 02:25 PM, Anders Darander wrote:
> > * Radu Moisan <radu.moisan@intel.com> [120814 11:01]:
> >
> >> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> >> ---
> >>   .../B921600.patch                                  |    0
> >>   .../busybox-appletlib-dependency.patch             |    0
> >>   .../busybox-mkfs-minix-tests_bigendian.patch       |    0
> >>   .../busybox-udhcpc-no_deconfig.patch               |   37 +++++++++-----------
> >>   .../{busybox-1.19.4 => busybox-1.20.2}/defconfig   |    0
> > Are there no changes to the configuration file? I.e. new and removed
> > options?
> None that I know about, I've took a quick look over the changelog but 
> nothing cought my eye. I you find anything, just point it out and I'll 
> deep dive on it.

Could you diff the generated .config between 1.19.4 and 1.20.2?

This would allow us to see the differences.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


