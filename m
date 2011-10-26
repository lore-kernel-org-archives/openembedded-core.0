Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RJ9oL-0003BD-AS
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Oct 2011 22:10:53 +0200
Received: from mail-wy0-f180.google.com ([74.125.82.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 26 Oct 2011 13:04:52 -0700
Received: by wyg24 with SMTP id 24so2082704wyg.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2011 13:04:51 -0700 (PDT)
Received: by 10.227.208.71 with SMTP id gb7mr11657072wbb.7.1319659491082;
	Wed, 26 Oct 2011 13:04:51 -0700 (PDT)
Received: from [10.192.3.184] ([85.13.70.251])
	by mx.google.com with ESMTPS id q30sm5110231wbn.17.2011.10.26.13.04.46
	(version=SSLv3 cipher=OTHER); Wed, 26 Oct 2011 13:04:48 -0700 (PDT)
Message-ID: <4EA867DD.8060108@intel.com>
Date: Wed, 26 Oct 2011 22:04:45 +0200
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1319139126.git.raj.khem@gmail.com>
In-Reply-To: <cover.1319139126.git.raj.khem@gmail.com>
Subject: Re: [PATCH 0/4] Update coreutils, libtool and fixes needed for gold
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
X-List-Received-Date: Wed, 26 Oct 2011 20:10:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/2011 09:35 PM, Khem Raj wrote:
> This patchset does the following
>
> 1. Upgrades coreutils and libtool partially helped with gold
> 2. Fixes a gcc bug thats highlighted by gold when linking connman
> 3. Fixes a DEPENDS problem in xserver-xorg
>
> With these changes I am able to build systemd-gnome-image for angstrom on arm
>
> The following changes since commit 808b43dff8facfddae05ef14b7b7daf5fa993a3d:
>
>    libtool: Upgrade from 2.4 ->  2.4.2 (2011-10-20 12:26:13 -0700)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib kraj/gold-updates
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/gold-updates
>
> Khem Raj (4):
>    xserver-xorg: Add mesa-dri to DEPENDS
>    gcc-4.6: Backport fix for PR32219
>    coreutils: Upgrade recipe 8.12 ->  8.14
These first 3 were pulled into OE-Core

>    libtool: Upgrade from 2.4 ->  2.4.2
>
There was some discussion on the list about this one, I need to confirm 
where we are with it.

Sau!

>   .../remove-usr-local-lib-from-m4.patch             |   18 +++---
>   .../{coreutils_8.12.bb =>  coreutils_8.14.bb}       |   11 ++--
>   meta/recipes-devtools/gcc/gcc-4.6.inc              |    3 +-
>   meta/recipes-devtools/gcc/gcc-4.6/pr32219.patch    |   71 ++++++++++++++++++++
>   .../libtool/{libtool.inc =>  libtool-2.4.2.inc}     |   26 ++++++--
>   meta/recipes-devtools/libtool/libtool-2.4.inc      |   13 ----
>   ...libtool-cross_2.4.bb =>  libtool-cross_2.4.2.bb} |    2 +-
>   ...btool-native_2.4.bb =>  libtool-native_2.4.2.bb} |    2 +-
>   ...nativesdk_2.4.bb =>  libtool-nativesdk_2.4.2.bb} |    2 +-
>   meta/recipes-devtools/libtool/libtool/prefix.patch |   46 ++++++------
>   .../libtool/libtool/resolve-sysroot.patch          |   42 ------------
>   .../libtool/{libtool_2.4.bb =>  libtool_2.4.2.bb}   |    2 +-
>   .../xorg-xserver/xserver-xorg_1.11.1.bb            |    1 +
>   meta/site/common-linux                             |    3 +
>   14 files changed, 139 insertions(+), 103 deletions(-)
>   rename meta/recipes-core/coreutils/{coreutils-8.12 =>  coreutils-8.14}/remove-usr-local-lib-from-m4.patch (65%)
>   rename meta/recipes-core/coreutils/{coreutils_8.12.bb =>  coreutils_8.14.bb} (90%)
>   create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/pr32219.patch
>   rename meta/recipes-devtools/libtool/{libtool.inc =>  libtool-2.4.2.inc} (57%)
>   delete mode 100644 meta/recipes-devtools/libtool/libtool-2.4.inc
>   rename meta/recipes-devtools/libtool/{libtool-cross_2.4.bb =>  libtool-cross_2.4.2.bb} (98%)
>   rename meta/recipes-devtools/libtool/{libtool-native_2.4.bb =>  libtool-native_2.4.2.bb} (96%)
>   rename meta/recipes-devtools/libtool/{libtool-nativesdk_2.4.bb =>  libtool-nativesdk_2.4.2.bb} (97%)
>   delete mode 100644 meta/recipes-devtools/libtool/libtool/resolve-sysroot.patch
>   rename meta/recipes-devtools/libtool/{libtool_2.4.bb =>  libtool_2.4.2.bb} (94%)
>



