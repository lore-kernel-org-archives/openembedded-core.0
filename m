Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RILKf-0001Rq-N9 for openembedded-core@lists.openembedded.org;
	Mon, 24 Oct 2011 16:16:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9OEArxZ029554
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 15:10:53 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29045-06 for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 15:10:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9OEAjQg029548
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2011 15:10:46 +0100
Message-ID: <1319465445.25011.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 24 Oct 2011 15:10:45 +0100
In-Reply-To: <3D2F5FE5-B1DC-44C4-8A5A-E81C41F00125@dominion.thruhere.net>
References: <cover.1319394187.git.sgw@linux.intel.com>
	<d546fdc94cb627040c657facc23f00406967c838.1319394187.git.sgw@linux.intel.com>
	<1319463290.25011.10.camel@ted>
	<3D2F5FE5-B1DC-44C4-8A5A-E81C41F00125@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 20/27] libtool: Upgrade from 2.4 -> 2.4.2
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
X-List-Received-Date: Mon, 24 Oct 2011 14:16:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-10-24 at 15:37 +0200, Koen Kooi wrote:
> Op 24 okt. 2011, om 15:34 heeft Richard Purdie het volgende geschreven:
> 
> > On Sun, 2011-10-23 at 11:26 -0700, Saul Wold wrote:
> >> From: Khem Raj <raj.khem@gmail.com>
> >> 
> >> Adjust prefix.patch and delete resolve-sysroot.patch
> >> since its already applied upstream
> >> 
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >> .../libtool/{libtool.inc => libtool-2.4.2.inc}     |   26 +++++++++---
> >> meta/recipes-devtools/libtool/libtool-2.4.inc      |   13 ------
> >> ...libtool-cross_2.4.bb => libtool-cross_2.4.2.bb} |    2 +-
> >> ...btool-native_2.4.bb => libtool-native_2.4.2.bb} |    2 +-
> >> ...nativesdk_2.4.bb => libtool-nativesdk_2.4.2.bb} |    2 +-
> >> meta/recipes-devtools/libtool/libtool/prefix.patch |   46 ++++++++++----------
> >> .../libtool/libtool/resolve-sysroot.patch          |   42 ------------------
> >> .../libtool/{libtool_2.4.bb => libtool_2.4.2.bb}   |    2 +-
> >> 8 files changed, 47 insertions(+), 88 deletions(-)
> >> rename meta/recipes-devtools/libtool/{libtool.inc => libtool-2.4.2.inc} (57%)
> >> delete mode 100644 meta/recipes-devtools/libtool/libtool-2.4.inc
> >> rename meta/recipes-devtools/libtool/{libtool-cross_2.4.bb => libtool-cross_2.4.2.bb} (98%)
> >> rename meta/recipes-devtools/libtool/{libtool-native_2.4.bb => libtool-native_2.4.2.bb} (96%)
> >> rename meta/recipes-devtools/libtool/{libtool-nativesdk_2.4.bb => libtool-nativesdk_2.4.2.bb} (97%)
> >> delete mode 100644 meta/recipes-devtools/libtool/libtool/resolve-sysroot.patch
> >> rename meta/recipes-devtools/libtool/{libtool_2.4.bb => libtool_2.4.2.bb} (94%)
> >> 
> >> diff --git a/meta/recipes-devtools/libtool/libtool.inc b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> >> similarity index 57%
> >> rename from meta/recipes-devtools/libtool/libtool.inc
> >> rename to meta/recipes-devtools/libtool/libtool-2.4.2.inc
> >> index ef9095b..1f652ef 100644
> >> --- a/meta/recipes-devtools/libtool/libtool.inc
> >> +++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
> >> @@ -1,4 +1,3 @@
> >> -SUMMARY = "Generic library support script"
> > 
> > Why drop the SUMMARY field?
> 
> What's the difference between SUMMARY and DESCRIPTION? And what happens if both are set?

SUMMARY is a one line 74? character summary of the package, DESCRIPTION
is a multiple line stream of text containing a more verbose description.
What happens to the data is package backend specific, I know RPM has
uses for both. There was definitely discussion about this on the mailing
list at the time, I'm not sure what if anything made it into the manuals
but if its not there it should be added.

Cheers,

Richard



