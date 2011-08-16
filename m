Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QtL0x-0003kR-9R
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 16:53:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7GEmV0G022083
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 07:48:31 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 16 Aug 2011 07:48:31 -0700
Message-ID: <4E4A833E.6010605@windriver.com>
Date: Tue, 16 Aug 2011 09:48:30 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1313482889.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1313482889.git.dongxiao.xu@intel.com>
Subject: Re: [PATCH 0/4 v2][PULL] multilib: RPM rootfs related fixes.
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
X-List-Received-Date: Tue, 16 Aug 2011 14:53:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 8/16/11 3:33 AM, Dongxiao Xu wrote:
> Hi Richard and Mark,
> 
> This pull request fixes some multilib issues related with RPM rootfs. Please help to review and pull.
> 
> Changes from v1:
> 1) Remove the original patch "multilib: remove MULTILIB_PACKAGE_ARCHS variable".
> 2) Add a new patch "rootfs_rpm: Fix DEFAULTTUNE setting in multilib case"
> 3) For the two package_rpm related patches, The first patch is to change
>    strip_multilib functionality, and the second patch is to handle the package
>    rename issue in multilib.
> 4) Add a new patch "gtk-icon-cache: Adding MLPREFIX when dynamically set
>    RDEPENDS" to fix the dynamic setting of RDEPENDS in multilib case.
> 
> [YOCTO #1368]

I assume this has been tests...

It looks fine here..

Acked-by: Mark Hatle <mark.hatle@windriver.com>

> Thanks,
> Dongxiao
> 
> The following changes since commit 13db5f420ca9bff98561f80d78958278734ad1f4:
> 
>   distro-tracking: Update info for gpgme, libassuan, apr... after last upgrade. (2011-08-15 15:26:04 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib dxu4/ml
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/ml
> 
> Dongxiao Xu (4):
>   rootfs_rpm: Fix DEFAULTTUNE setting in multilib case
>   package_rpm: enhance strip_multilib function
>   package_rpm: Fix package rename issue in multilib case
>   gtk-icon-cache: Adding MLPREFIX when dynamically set RDEPENDS
> 
>  meta/classes/gtk-icon-cache.bbclass |    2 +-
>  meta/classes/package_rpm.bbclass    |   22 +++++++++++-----------
>  meta/classes/rootfs_rpm.bbclass     |    4 ----
>  3 files changed, 12 insertions(+), 16 deletions(-)
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



