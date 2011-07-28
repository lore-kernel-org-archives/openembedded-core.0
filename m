Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QmEjZ-00067M-29
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 02:45:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Jul 2011 17:41:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,279,1309762800"; d="scan'208";a="32883105"
Received: from unknown (HELO [10.255.14.61]) ([10.255.14.61])
	by orsmga001.jf.intel.com with ESMTP; 27 Jul 2011 17:41:37 -0700
Message-ID: <4E30B041.7060801@linux.intel.com>
Date: Wed, 27 Jul 2011 17:41:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311715727.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1311715727.git.mark.hatle@windriver.com>
Subject: Re: [v2 PATCH 0/8] Number of multilib related fixes
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
X-List-Received-Date: Thu, 28 Jul 2011 00:45:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/26/2011 02:31 PM, Mark Hatle wrote:
> Fix a number of multilib issues include IA32 eglibc header generation,
> misc header conflicts and ncurses man page collisions.
>
> This is v2 of the patch set, original was sent by Richard.
>
> The following changes since commit dad2169cfb331b7af5c6d380347ea279a59bd716:
>
>    classes/image_types: IMAGE_TYPES was missing some entries (2011-07-26 15:52:40 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib mhatle/ml_fixes
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/ml_fixes
>
> Mark Hatle (8):
>    multilib_header.bbclass: Add oe_multilib_header wrapper
>    binutils: Fix multilib header conflict - bfd.h
>    apr: Fix multilib header conflict - apr.h
>    beecrypt: Fix multilib header conflict - beecrypt/gnu.h
>    linux-libc-headers: Fix file conflict -- ..install.cmd
>    eglibc_2.13: Resolve multilib header conflicts
>    ncurses: Resolve header and man page multilib conflicts
>    package.bbclass: fixup_perms - change symlink processing
>
>   meta/classes/multilib_header.bbclass               |   29 ++++++
>   meta/classes/package.bbclass                       |   10 +-
>   meta/recipes-core/eglibc/eglibc-package.inc        |    4 +-
>   meta/recipes-core/eglibc/eglibc_2.13.bb            |   91 ++++++++++++++++++++
>   meta/recipes-core/ncurses/ncurses.inc              |    7 +-
>   meta/recipes-devtools/binutils/binutils.inc        |    4 +-
>   meta/recipes-devtools/binutils/binutils_2.21.1.bb  |    2 +-
>   .../linux-libc-headers-yocto_git.bb                |    5 +-
>   .../linux-libc-headers_2.6.37.2.bb                 |    5 +-
>   .../linux-libc-headers_2.6.39.bb                   |    5 +
>   meta/recipes-support/apr/apr_1.4.2.bb              |    8 ++-
>   meta/recipes-support/beecrypt/beecrypt_4.2.1.bb    |    8 ++-
>   scripts/multilib_header_wrapper.h                  |   55 ++++++++++++
>   13 files changed, 217 insertions(+), 16 deletions(-)
>   create mode 100644 meta/classes/multilib_header.bbclass
>   create mode 100644 scripts/multilib_header_wrapper.h
>

Merged into OE-Core

Thanks
	Sau!


