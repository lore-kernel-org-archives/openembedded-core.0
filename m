Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RJAtc-0004tb-Hm
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Oct 2011 23:20:25 +0200
Received: from ad.chargestorm.se (85.13.70.251) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server (TLS) id 8.3.137.0;
	Wed, 26 Oct 2011 23:14:24 +0200
Date: Wed, 26 Oct 2011 23:14:40 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20111026211439.GA3851@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1319652972.git.bruce.ashfield@windriver.com>
	<0ec24ded3f71c54e544d953de65d142717f48022.1319652972.git.bruce.ashfield@windriver.com>
	<1319662875.12054.7.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1319662875.12054.7.camel@ted>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH 1/1] linux-libc-headers: provide 3.0.x and 3.1 headers
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
X-List-Received-Date: Wed, 26 Oct 2011 21:20:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Richard Purdie <richard.purdie@linuxfoundation.org> [111026 23:02]:
> On Wed, 2011-10-26 at 14:25 -0400, Bruce Ashfield wrote:
> > This changes makes two different 3.x headers available to the
> > toolchain. The latest 3.0.x and 3.1 tarballs. Compatibility is
> > maintained with older 2.6 headers by creating a new variable
> > that changes the SRC_URI based on the major version number of
> > the kernel.

> > Tested with 2.6.37.2, 3.0.8 and 3.1 builds and boots.

> In answer to your other question, its probably safe to drop the older
> versions and switch to 3.1 at this point unless there are known
> compatibility issues?

Don't we have 2.6-kernel left? If so, I guess that we ought to leave the
2.6 versions of the recipe. At least if I remember correctly in that a
userspace compiled against a certain version of kernel headers should
run OK on a newer kernel, but isn't guarenteed to run OK on an older
kernel. Correct me if I'm wrong...

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


