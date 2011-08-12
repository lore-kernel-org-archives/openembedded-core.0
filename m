Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QruNo-0007mY-Mw for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 18:14:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7CGAKee013596
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 17:10:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12915-08 for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 17:10:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7CGAB0s013590
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2011 17:10:12 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <37738c9649d8a17c9f99713d9cbc4a93c803f977.1313134270.git.sgw@linux.intel.com>
References: <cover.1313134270.git.sgw@linux.intel.com>
	<37738c9649d8a17c9f99713d9cbc4a93c803f977.1313134270.git.sgw@linux.intel.com>
Date: Fri, 12 Aug 2011 17:09:30 +0100
Message-ID: <1313165371.14274.509.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 17/25] meta-rt: rt-tests v0.73 instead of AUTOREV
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
X-List-Received-Date: Fri, 12 Aug 2011 16:14:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-12 at 00:50 -0700, Saul Wold wrote:
> From: Darren Hart <dvhart@linux.intel.com>
> 
> AUTOREV is handy is a development aid, but it really shouldn't be used as a
> default as it breaks the consistency and repeatability of a build. It also
> causes additional fetches which may not be desired or expected.
> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> ---
>  .../{rt-tests_git.bb => rt-tests_0.73.bb}          |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>  rename meta-rt/recipes-tests/{rt-tests_git.bb => rt-tests_0.73.bb} (97%)
> 
> diff --git a/meta-rt/recipes-tests/rt-tests_git.bb b/meta-rt/recipes-tests/rt-tests_0.73.bb
> similarity index 97%
> rename from meta-rt/recipes-tests/rt-tests_git.bb
> rename to meta-rt/recipes-tests/rt-tests_0.73.bb
> index 35af022..6334bcd 100644
> --- a/meta-rt/recipes-tests/rt-tests_git.bb
> +++ b/meta-rt/recipes-tests/rt-tests_0.73.bb
> @@ -6,7 +6,7 @@ LICENSE = "GPLv2 & GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
>                      file://src/cyclictest/cyclictest.c;beginline=7;endline=9;md5=ce162fe491d19d2ec67dff6dbc938d50 \
>                      file://src/pi_tests/pi_stress.c;beginline=6;endline=19;md5=bd426a634a43ec612e9fbf125dfcc949"
> -SRCREV = ${AUTOREV}
> +SRCREV = v0.73
>  PV = "git${SRCPV}"
>  PR = "r0"

Sorry, but this is nearly as bad as the system has to hit the network to
resolve "v0.73" into a revision. Please can you do something like:

# This revision is v0.73
SRCREV = "xxx"

which I appreciate is ugly but there is no nice way to do this (and
support offline builds).

Cheers,

Richard




