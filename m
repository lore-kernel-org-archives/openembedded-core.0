Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RGwGK-0006or-7E
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 19:18:36 +0200
Received: from mail-pz0-f44.google.com ([209.85.210.44])
	by mga14.intel.com with ESMTP/TLS/RC4-MD5; 20 Oct 2011 10:12:22 -0700
Received: by pzk4 with SMTP id 4so16275478pzk.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 10:12:22 -0700 (PDT)
Received: by 10.68.13.35 with SMTP id e3mr21411486pbc.31.1319130741859;
	Thu, 20 Oct 2011 10:12:21 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id g1sm8181690pbv.2.2011.10.20.10.12.20
	(version=SSLv3 cipher=OTHER); Thu, 20 Oct 2011 10:12:21 -0700 (PDT)
Message-ID: <4EA05671.9060304@intel.com>
Date: Thu, 20 Oct 2011 10:12:17 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1318984111.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1318984111.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 0/6] recipe upgrades + some fixes
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
X-List-Received-Date: Thu, 20 Oct 2011 17:18:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/2011 05:30 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> More information in the commit log bellow.
> Thanks,
> Nitin
>
> The following changes since commit b4757833c3548b5ee3a1cce58e2f059b3f63cb09:
>
>    fontconfig: fix fix-pkgconfig.patch (2011-10-18 18:18:36 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib nitin/upgrades
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/upgrades
>
> Nitin A Kamble (6):
>    x86 tune files: set baselib for x32 tune as libx32
>    gmp: also generate the libgmpcxx library
>    python-scons: upgrade from 2.0.1 to 2.1.0
>    python-dbus: upgrade from 0.83.2 to 0.84.0
>    libxml-parser-perl: upgrade from 2.40 to 2.41
>    distro-tracking: update data for some toolchain recipes
>
>   .../conf/distro/include/distro_tracking_fields.inc |   42 ++++++++++++--------
>   meta/conf/machine/include/ia32/arch-ia32.inc       |    2 +-
>   meta/conf/machine/include/tune-core2.inc           |    2 +-
>   ...ser-perl_2.40.bb =>  libxml-parser-perl_2.41.bb} |    6 +-
>   ...python-dbus_0.83.2.bb =>  python-dbus_0.84.0.bb} |    4 +-
>   ...ative_2.0.1.bb =>  python-scons-native_2.1.0.bb} |    3 +-
>   ...python-scons_2.0.1.bb =>  python-scons_2.1.0.bb} |    6 +-
>   meta/recipes-support/gmp/gmp.inc                   |    2 +
>   meta/recipes-support/gmp/gmp_4.2.1.bb              |    2 +-
>   meta/recipes-support/gmp/gmp_5.0.2.bb              |    2 +-
>   10 files changed, 40 insertions(+), 31 deletions(-)
>   rename meta/recipes-devtools/perl/{libxml-parser-perl_2.40.bb =>  libxml-parser-perl_2.41.bb} (82%)
>   rename meta/recipes-devtools/python/{python-dbus_0.83.2.bb =>  python-dbus_0.84.0.bb} (83%)
>   rename meta/recipes-devtools/python/{python-scons-native_2.0.1.bb =>  python-scons-native_2.1.0.bb} (89%)
>   rename meta/recipes-devtools/python/{python-scons_2.0.1.bb =>  python-scons_2.1.0.bb} (51%)
>

Nitin,

We merged 5 of the 6 patches above, as noted in the thread, there is a 
problem with the gmp packaging.  Please review that and try to resolve it.

Thanks
	Sau!



