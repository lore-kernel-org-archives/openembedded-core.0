Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QkHmI-0006Qi-Pg
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 17:36:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Jul 2011 08:32:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,247,1309762800"; d="scan'208";a="30823614"
Received: from unknown (HELO [10.255.14.61]) ([10.255.14.61])
	by orsmga001.jf.intel.com with ESMTP; 22 Jul 2011 08:32:21 -0700
Message-ID: <4E299804.5030706@linux.intel.com>
Date: Fri, 22 Jul 2011 08:32:20 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311195893.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1311195893.git.Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 00/10] Small fixes
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
X-List-Received-Date: Fri, 22 Jul 2011 15:36:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/20/2011 02:06 PM, Martin Jansa wrote:
> Fixes for recipes using intltool, distributions not having locales support in libc and distutils fix
>
> The following changes since commit 0d03800caffc2341b74190d38f7a372223c89f4c:
>
>    lsbsetup_1.0.bb: Change the hardcoded /usr/lib to support multilib (2011-07-20 15:43:43 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib jansa/pull
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull
>
> Martin Jansa (10):
>    tcmode-default: set preferred version also for (e)glibc-locale
>    eglibc-package: don't fail without localedef/gconv
These two were pulled

>    intltool: inherit perlnative
>    polkit: inherit perlnative
>    shared-mime-info: inherit perlnative
>    xkeyboard-config: inherit perlnative
>    avahi: inherit perlnative
>    vte: inherit perlnative
There has been discussion about how to correctly handle this on the list

>    python: save Makefile.sysroot in do_compile
>    python: add patch to fix cross compilation on host with linux-3.0
These two were pulled.

4/10 merged into OE-Core

Thanks
	Sau!

>
>   meta/conf/distro/include/tcmode-default.inc        |    2 ++
>   meta/recipes-connectivity/avahi/avahi.inc          |    2 +-
>   meta/recipes-core/eglibc/eglibc-package.inc        |    8 ++++++--
>   meta/recipes-devtools/intltool/intltool.inc        |    3 +--
>   .../python/python/07-linux3-regen-fix.patch        |   18 ++++++++++++++++++
>   meta/recipes-devtools/python/python_2.6.6.bb       |    8 +++++---
>   meta/recipes-extended/polkit/polkit_0.101.bb       |    2 +-
>   .../xorg-lib/xkeyboard-config_2.1.bb               |    2 +-
>   .../shared-mime-info/shared-mime-info.inc          |    2 +-
>   meta/recipes-support/vte/vte.inc                   |    2 +-
>   10 files changed, 37 insertions(+), 12 deletions(-)
>   create mode 100644 meta/recipes-devtools/python/python/07-linux3-regen-fix.patch
>



