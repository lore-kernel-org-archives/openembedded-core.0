Received: from stoexhub02.domain01.net ([83.145.59.143])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1ScWma-0001ts-T3
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jun 2012 09:05:24 +0200
Received: from localhost (193.41.119.134) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.245.1; Thu, 7 Jun 2012
	08:53:52 +0200
Date: Thu, 7 Jun 2012 08:52:53 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20120607065252.GA49212@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <4FCE71F6.3060001@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4FCE71F6.3060001@linux.intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.20 (2009-12-10)
X-GFI-SMTP-Submission: 1
Subject: Re: RFC: Braindump on Bootloaders, Image Types, and Installers
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
X-List-Received-Date: Thu, 07 Jun 2012 07:05:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Darren Hart <dvhart@linux.intel.com> [120605 22:56]:
>   * Initramfs
>     - Linux kernel and initramfs as a single image
>     - this will require some significant workflow changes as images are
>       generated after the kernel and the kernel needs the rootfs to
>       build the combined image.

Here it would also be nice to support an option to combine the kernel
and the initramfs in a post-process stage. Otherwise, there needs to be
some more, possibly complicated, changes to the workflow to make it
possible to build external kernel modules into the initramfs. Or to
explicitly state that this is an unsupported configuration. We're
currently looking into this, but we're currently heading for separate
kernel and initramfs, partly due to this.

Cheers,

/Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


