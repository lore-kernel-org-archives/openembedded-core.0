Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RGwHA-0002RX-Hj
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 19:19:28 +0200
Received: from mail-qw0-f52.google.com ([209.85.216.52])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 20 Oct 2011 10:13:14 -0700
Received: by qaea17 with SMTP id a17so4817883qae.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 10:13:14 -0700 (PDT)
Received: by 10.68.32.138 with SMTP id j10mr15535481pbi.81.1319130791355;
	Thu, 20 Oct 2011 10:13:11 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id w4sm20786312pbf.6.2011.10.20.10.13.05
	(version=SSLv3 cipher=OTHER); Thu, 20 Oct 2011 10:13:06 -0700 (PDT)
Message-ID: <4EA056A1.6020406@intel.com>
Date: Thu, 20 Oct 2011 10:13:05 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1319090166.git.wenzong.fan@windriver.com>
In-Reply-To: <cover.1319090166.git.wenzong.fan@windriver.com>
Subject: Re: [PATCH 0/3 v2] Update packages
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
X-List-Received-Date: Thu, 20 Oct 2011 17:19:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/2011 11:04 PM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan<wenzong.fan@windriver.com>
>
> v2 add the patch to distro_tracking_fields.inc file.
>
> The following changes since commit b4757833c3548b5ee3a1cce58e2f059b3f63cb09:
>    Martin Jansa (1):
>          fontconfig: fix fix-pkgconfig.patch
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib wenzong/update_pkgs
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/update_pkgs
>
> Wenzong Fan (3):
>    ccache: update to 3.1.6
>    chkconfig: Update to 1.3.55
>    distro_tracking_fields: update packages tracking fields
>
>   .../conf/distro/include/distro_tracking_fields.inc |   12 ++++++++++++
>   .../ccache/{ccache_3.1.5.bb =>  ccache_3.1.6.bb}    |    4 ++--
>   .../{chkconfig_1.3.52.bb =>  chkconfig_1.3.55.bb}   |    6 +++---
>   3 files changed, 17 insertions(+), 5 deletions(-)
>   rename meta/recipes-devtools/ccache/{ccache_3.1.5.bb =>  ccache_3.1.6.bb} (47%)
>   rename meta/recipes-extended/chkconfig/{chkconfig_1.3.52.bb =>  chkconfig_1.3.55.bb} (83%)
>

Merged the updates into OE-Core, but not the distro_tracking since it 
was not correct.

Thanks
	Sau!

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



