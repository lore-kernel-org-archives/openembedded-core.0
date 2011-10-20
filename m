Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RGwLu-0007HR-H8
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 19:24:22 +0200
Received: from mail-pz0-f44.google.com ([209.85.210.44])
	by mga14.intel.com with ESMTP/TLS/RC4-MD5; 20 Oct 2011 10:18:29 -0700
Received: by pzk4 with SMTP id 4so16299769pzk.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 10:18:29 -0700 (PDT)
Received: by 10.68.15.201 with SMTP id z9mr21713991pbc.36.1319131108228;
	Thu, 20 Oct 2011 10:18:28 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id ki1sm20846636pbb.3.2011.10.20.10.18.25
	(version=SSLv3 cipher=OTHER); Thu, 20 Oct 2011 10:18:25 -0700 (PDT)
Message-ID: <4EA057E0.2080909@intel.com>
Date: Thu, 20 Oct 2011 10:18:24 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1318995438.git.kai.kang@windriver.com>
In-Reply-To: <cover.1318995438.git.kai.kang@windriver.com>
Subject: Re: [PATCH 0/5] Update packages V3
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
X-List-Received-Date: Thu, 20 Oct 2011 17:24:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/2011 10:45 PM, Kang Kai wrote:
> Hi Saul,
>
> Version 3: remove obsolete patches, and add distro tracking information.
>
> Version 2: only add libsdl update
>
> Update ghostscript, libxml-sax-perl and liburi-perl to latest version.
>
> Regards,
>
>
> The following changes since commit 3c517bfe6c6d7781658f65bda4e0fdb499ca2b62:
>
>    bind 9.8.1: fix build after recent update (2011-10-17 16:58:14 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib kangkai/update-pkgs
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/update-pkgs
>
> Kang Kai (5):
>    ghostscript: update to 9.04
>    libxml-sax-perl: update to 0.99
>    liburi-perl: update to 1.59
>    libsdl: update to 1.2.14
>    distro_tracking_fields: update packages tracking fields
>
>   .../conf/distro/include/distro_tracking_fields.inc |   24 ++
>   .../{liburi-perl_1.58.bb =>  liburi-perl_1.59.bb}   |    6 +-
>   .../ghostscript/ghostscript/arm/soobjarch.h        |   40 ---
>   .../ghostscript-9.02-prevent_recompiling.patch     |   74 +++---
>   .../ghostscript/ghostscript/i586/soobjarch.h       |   41 ---
>   .../ghostscript/ghostscript/mips/soobjarch.h       |   40 ---
>   .../ghostscript/ghostscript/powerpc/soobjarch.h    |   40 ---
>   .../ghostscript/ghostscript/powerpc64/soobjarch.h  |   40 ---
>   .../ghostscript/ghostscript/x86_64/soobjarch.h     |   40 ---
>   .../{ghostscript_9.02.bb =>  ghostscript_9.04.bb}   |   24 +-
>   ...ml-sax-perl_0.96.bb =>  libxml-sax-perl_0.99.bb} |    7 +-
>   meta/recipes-graphics/libsdl/files/acinclude.m4    |  189 -------------
>   .../libsdl/files/configure_tweak.patch             |  281 +++++++++-----------
>   .../libsdl/files/kernel-asm-page.patch             |   15 -
>   .../libsdl/{libsdl_1.2.11.bb =>  libsdl_1.2.14.bb}  |   17 +-
>   15 files changed, 219 insertions(+), 659 deletions(-)
>   rename meta/recipes-devtools/perl/{liburi-perl_1.58.bb =>  liburi-perl_1.59.bb} (81%)
>   delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/arm/soobjarch.h
>   delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/i586/soobjarch.h
>   delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/mips/soobjarch.h
>   delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/powerpc/soobjarch.h
>   delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/powerpc64/soobjarch.h
>   delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/x86_64/soobjarch.h
>   rename meta/recipes-extended/ghostscript/{ghostscript_9.02.bb =>  ghostscript_9.04.bb} (81%)
>   rename meta/recipes-extended/perl/{libxml-sax-perl_0.96.bb =>  libxml-sax-perl_0.99.bb} (85%)
>   delete mode 100644 meta/recipes-graphics/libsdl/files/acinclude.m4
>   delete mode 100644 meta/recipes-graphics/libsdl/files/kernel-asm-page.patch
>   rename meta/recipes-graphics/libsdl/{libsdl_1.2.11.bb =>  libsdl_1.2.14.bb} (81%)
>

Merged into OE-Core

Thanks
	Sau!



