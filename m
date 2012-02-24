Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0yfC-0006GW-O6 for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 18:10:34 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1OH2Cmw009223
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 17:02:12 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08819-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 17:02:08 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1OH258S009217
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 17:02:06 GMT
Message-ID: <1330102926.7512.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 24 Feb 2012 17:02:06 +0000
In-Reply-To: <cover.1330010964.git.paul.eggleton@linux.intel.com>
References: <cover.1330010964.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3] fixes for meta-toolchain without x11
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
X-List-Received-Date: Fri, 24 Feb 2012 17:10:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-02-23 at 15:31 +0000, Paul Eggleton wrote:
> A couple of patches that fix building meta-toolchain with x11 removed
> from DISTRO_FEATURES, and a patch removing QEMU 0.14.0 which is
> obsolete.
> 
> The following changes since commit 55f72b98f606c1554eb6edd151292ffdfddf1384:
> 
>   texi2html: Fix for multilib (2012-02-22 23:01:45 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib paule/meta-toolchain-nox
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/meta-toolchain-nox
> 
> Paul Eggleton (3):
>   qemu: enable building qemu-nativesdk without x11
>   libsdl: allow building without x11
>   qemu: remove version 0.14.0

Merged to master, thanks.

Richard



