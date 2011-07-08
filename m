Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QfDkk-000346-7F for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 18:18:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68FPb5H021268
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 16:25:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20388-06 for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2011 16:25:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68FPSMP021262
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 16:25:29 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <A64F9A3E-6359-4C99-B332-378FFE4F644C@gmail.com>
References: <cover.1310070283.git.nitin.a.kamble@intel.com>
	<629561972efd884a87edc521d0430af83511ae58.1310070283.git.nitin.a.kamble@intel.com>
	<CAMKF1srHWhp36iNaMPKBbkBNBQSSWCb7fbULP9efAsg3r29J=A@mail.gmail.com>
	<1310080368.20015.855.camel@rex>
	<A64F9A3E-6359-4C99-B332-378FFE4F644C@gmail.com>
Date: Fri, 08 Jul 2011 16:24:50 +0100
Message-ID: <1310138690.20015.878.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/7] binutils: upgrade from 2.21 to 2.21.1
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
X-List-Received-Date: Fri, 08 Jul 2011 16:18:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-07 at 17:42 -0700, Khem Raj wrote:
> 
> On Jul 7, 2011, at 4:12 PM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> 
> > On Thu, 2011-07-07 at 14:39 -0700, Khem Raj wrote:
> >> On Thu, Jul 7, 2011 at 1:25 PM,  <nitin.a.kamble@intel.com> wrote:
> >>> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >>> 
> >>> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> >>> ---
> >>> ...n_2.21.bb => binutils-cross-canadian_2.21.1.bb} |    0
> >>> ...tils-cross_2.21.bb => binutils-cross_2.21.1.bb} |    0
> >>> ...rosssdk_2.21.bb => binutils-crosssdk_2.21.1.bb} |    0
> >>> .../110-arm-eabi-conf.patch                        |    0
> >>> .../binutils-2.19.1-ld-sysroot.patch               |    0
> >>> .../binutils-poison.patch                          |    0
> >>> .../binutils-pr12366.patch                         |    0
> >>> .../binutils-uclibc-100-uclibc-conf.patch          |    0
> >>> ...binutils-uclibc-300-001_ld_makefile_patch.patch |    0
> >>> ...binutils-uclibc-300-006_better_file_error.patch |    0
> >>> ...ils-uclibc-300-012_check_ldrunpath_length.patch |    0
> >>> .../binutils-uclibc-gas-needs-libm.patch           |    0
> >>> .../binutils-x86_64_i386_biarch.patch              |    0
> >>> .../libiberty_path_fix.patch                       |    0
> >>> .../libtool-2.4-update.patch                       | 1725 ++++++++++----------
> >>> .../libtool-rpath-fix.patch                        |    0
> >>> .../{binutils_2.21.bb => binutils_2.21.1.bb}       |    7 +-
> >>> 17 files changed, 871 insertions(+), 861 deletions(-)
> >>> rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.21.bb => binutils-cross-canadian_2.21.1.bb} (100%)
> >>> rename meta/recipes-devtools/binutils/{binutils-cross_2.21.bb => binutils-cross_2.21.1.bb} (100%)
> >>> rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.21.bb => binutils-crosssdk_2.21.1.bb} (100%)
> >>> rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/110-arm-eabi-conf.patch (100%)
> >>> rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/binutils-2.19.1-ld-sysroot.patch (100%)
> >>> rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/binutils-poison.patch (100%)
> >>> rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/binutils-pr12366.patch (100%)
> >>> rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/binutils-uclibc-100-uclibc-conf.patch (100%)
> >>> rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/binutils-uclibc-300-001_ld_makefile_patch.patch (100%)
> >>> rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/binutils-uclibc-300-006_better_file_error.patch (100%)
> >>> rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/binutils-uclibc-300-012_check_ldrunpath_length.patch (100%)
> >>> rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/binutils-uclibc-gas-needs-libm.patch (100%)
> >>> rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/binutils-x86_64_i386_biarch.patch (100%)
> >>> rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/libiberty_path_fix.patch (100%)
> >>> rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/libtool-2.4-update.patch (94%)
> >>> rename meta/recipes-devtools/binutils/{binutils-2.21 => binutils}/libtool-rpath-fix.patch (100%)
> >>> rename meta/recipes-devtools/binutils/{binutils_2.21.bb => binutils_2.21.1.bb} (87%)
> >>> 
> >> 
> >> How about changing the recipe to fetch from binutils-2_21-branch and
> >> call it binutils 2.21 as it is
> > 
> > I don't really see the benefits in fetching this from the SCM?
> 
> Not much yes however
> 
> Releases happen not so frequently but bug fixes go into the branch and
> it makes it easier to upgrade may be same as adding patches to
> metadata but we don't need to keep them local in metadata
> 
> It will match the process we do for other toolchain components

I have a dislike for depending on what are usually slow SCMs for
components of the system. I've been convinced we need to do it for gcc
but I think that is the exception to the rule and we don't have a
seriously large number of patches queued against binutils...

I've therefore taken the patch.

Cheers,

Richard



