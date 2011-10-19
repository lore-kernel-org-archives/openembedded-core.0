Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RGMES-0000m9-A6
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 04:50:16 +0200
Received: from mail-bw0-f52.google.com ([209.85.214.52])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 18 Oct 2011 19:44:24 -0700
Received: by bkbzs2 with SMTP id zs2so1542244bkb.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2011 19:44:23 -0700 (PDT)
Received: by 10.223.5.3 with SMTP id 3mr8123546fat.4.1318992262935;
	Tue, 18 Oct 2011 19:44:22 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id m26sm7061824fac.6.2011.10.18.19.44.20
	(version=SSLv3 cipher=OTHER); Tue, 18 Oct 2011 19:44:22 -0700 (PDT)
Message-ID: <4E9E3983.4070008@intel.com>
Date: Tue, 18 Oct 2011 19:44:19 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1318991782.git.kai.kang@windriver.com>
In-Reply-To: <cover.1318991782.git.kai.kang@windriver.com>
Subject: Re: [PATCH 0/5] Update packages V2
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
X-List-Received-Date: Wed, 19 Oct 2011 02:50:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/2011 07:42 PM, Kang Kai wrote:
> Hi All,
>
> Please omit the previous letter, send by mistake. Sorry!
>
> Version 2: only add libsdl update
>
> Update ghostscript, xdg-utils, libxml-sax-perl and liburi-perl to latest version.
>
How about updates to the distro_tracking_fields also?  Version, and 
Dates, please ensure you use MMM DD, YYYY for all date related fields.

Thanks
	Sau!

> Regards,
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
>    xdg-utils: update to 1.1.0 rc1
>    libxml-sax-perl: update to 0.96
>    liburi-perl: update to 1.59
>    libsdl: update to 1.2.14
>
>   .../{liburi-perl_1.58.bb =>  liburi-perl_1.59.bb}   |    6 +-
>   .../ghostscript-9.02-prevent_recompiling.patch     |   74 +++---
>   .../{ghostscript_9.02.bb =>  ghostscript_9.04.bb}   |   24 +-
>   ...ml-sax-perl_0.96.bb =>  libxml-sax-perl_0.99.bb} |    7 +-
>   .../{xdg-utils_1.0.2.bb =>  xdg-utils_1.1.0rc1.bb}  |   20 +-
>   .../libsdl/files/configure_tweak.patch             |  281 +++++++++-----------
>   .../libsdl/{libsdl_1.2.11.bb =>  libsdl_1.2.14.bb}  |   17 +-
>   7 files changed, 206 insertions(+), 223 deletions(-)
>   rename meta/recipes-devtools/perl/{liburi-perl_1.58.bb =>  liburi-perl_1.59.bb} (81%)
>   rename meta/recipes-extended/ghostscript/{ghostscript_9.02.bb =>  ghostscript_9.04.bb} (81%)
>   rename meta/recipes-extended/perl/{libxml-sax-perl_0.96.bb =>  libxml-sax-perl_0.99.bb} (85%)
>   rename meta/recipes-extended/xdg-utils/{xdg-utils_1.0.2.bb =>  xdg-utils_1.1.0rc1.bb} (57%)
>   rename meta/recipes-graphics/libsdl/{libsdl_1.2.11.bb =>  libsdl_1.2.14.bb} (81%)
>



