Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RGtXi-00088l-IH for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 16:24:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9KEIV5a018423
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 15:18:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17824-06 for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 15:18:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9KEIKBu018417
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 15:18:21 +0100
Message-ID: <1319120298.2410.28.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 20 Oct 2011 15:18:18 +0100
In-Reply-To: <cover.1319096633.git.sgw@linux.intel.com>
References: <cover.1319096633.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL - v2 00/26] More Updates and Fixes
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
X-List-Received-Date: Thu, 20 Oct 2011 14:24:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-10-20 at 00:50 -0700, Saul Wold wrote:
> Richard,
> 
> This adds on to yesterday's Consolidated Pull with more patches for
> both updates and fixes.
> 
> a couple of note:  Anders' module.bbclass change
>                    Otavio's distubute_src, this change looks good, 
>                             but needs your eyes.
> 
> The rest are mostly straight forward updates, I held off Nitin's gmp change 
> on this round do to a failure I was seeing when images failed to work.
> 
> Sau!
> 
> 
> The following changes since commit e31dd9b65f3b03f79cabab25eca157532de3bd9c:
> 
>   fontconfig: fix fix-pkgconfig.patch (2011-10-18 18:13:47 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage2
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage2
> 
> Anders Darander (1):
>   module.bbclass: add lock to prevent error bulding ext modules
> 
> Darren Hart (1):
>   insane.bbclass: print full path on invalid LICENSE_FILES_CHKSUM
> 
> Joshua Lock (5):
>   gst-plugins-good: update to 0.10.30
>   tzdata: updated SRC_URI and update to 2011k
>   tzcode-native: update SRC_URI to new IANA location
>   gst-plugins-good: correctly handle gconf schema
>   distro-tracking-fields: update fields for tzdata and gst-plugins-good
> 
> Kang Kai (5):
>   ghostscript: update to 9.04
>   libxml-sax-perl: update to 0.99
>   liburi-perl: update to 1.59
>   libsdl: update to 1.2.14
>   distro_tracking_fields: update packages tracking fields
> 
> Khem Raj (3):
>   bluez4: Add glib-2.0 to DEPENDS
>   gcc-4.6: Upgrade SRCREV to latest FSF 4.6 branch
>   gcc-4.6: Backport PR46934 fix
> 
> Lauri Hintsala (1):
>   poky: fix broken ubifs link in deploy folder
> 
> Nitin A Kamble (5):
>   x86 tune files: set baselib for x32 tune as libx32
>   python-scons: upgrade from 2.0.1 to 2.1.0
>   python-dbus: upgrade from 0.83.2 to 0.84.0
>   libxml-parser-perl: upgrade from 2.40 to 2.41
>   distro-tracking: update data for some toolchain recipes
> 
> Otavio Salvador (1):
>   src_distribute.bbclass, src_distribute_local.bbclass: mostly
>     rewritten
> 
> Saul Wold (2):
>   ghostscript: Disable parallel make due to install issues
>   ghostscript: renamed x86_64 to x86-64 for patch to work
> 
> Wenzong Fan (2):
>   ccache: update to 3.1.6
>   chkconfig: Update to 1.3.55

I merged these apart from the second gst-good-plugin patch from Joshua
which Koen had feedback about. I tweaked the message for Nitin's x32
commit.

Cheers,

Richard



