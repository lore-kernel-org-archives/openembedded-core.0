Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1T3hKH-0004Pe-0x
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 07:48:29 +0200
Received: from localhost (193.41.119.134) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.245.1; Tue, 21 Aug 2012
	07:35:38 +0200
Date: Tue, 21 Aug 2012 07:36:42 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20120821053641.GB9188@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1345471653-4604-1-git-send-email-radu.moisan@intel.com>
	<2290927.ckQsIm3pt4@helios>
MIME-Version: 1.0
In-Reply-To: <2290927.ckQsIm3pt4@helios>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.20 (2009-12-10)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH v3] busybox: Upgrade to upstream 1.20.2
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
X-List-Received-Date: Tue, 21 Aug 2012 05:48:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Paul Eggleton <paul.eggleton@linux.intel.com> [120820 16:18]:

> On Monday 20 August 2012 17:07:33 Radu Moisan wrote:
> > +CONFIG_CROSS_COMPILER_PREFIX="i586-poky-linux-"

> I think we probably want to clear this value as it was before - just for 
> stylistic reasons, it won't make any actual difference to the output.

Yes, we want to do that. Just as we want to also clear
CONFIG_EXTRA_CFLAGS using the same reasoning.

See the extracted part of the patch below.

Cheers
/Anders

-CONFIG_CROSS_COMPILER_PREFIX=""
-CONFIG_EXTRA_CFLAGS=""
+CONFIG_CROSS_COMPILER_PREFIX="i586-poky-linux-"
+CONFIG_SYSROOT=""
+CONFIG_EXTRA_CFLAGS=" -O2 -pipe -g -feliminate-unused-debug-types"
+CONFIG_EXTRA_LDFLAGS=""
+CONFIG_EXTRA_LDLIBS=""



> Cheers,
> Paul
-- 
Anders Darander
ChargeStorm AB / eStorm AB


