Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0D2236FF73
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Nov 2017 02:23:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vA22N4UM022612
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Nov 2017 19:23:05 -0700
Received: from [128.224.163.189] (128.224.163.189) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 1 Nov 2017 19:23:04 -0700
To: <wenzong.fan@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1509516068.git.wenzong.fan@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <1c9a7ded-4644-96ad-2e66-bfe592119a72@windriver.com>
Date: Thu, 2 Nov 2017 10:24:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <cover.1509516068.git.wenzong.fan@windriver.com>
X-Originating-IP: [128.224.163.189]
Subject: Re: [PATCH 0/3] initscripts: fixes for booting with busybox init
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Nov 2017 02:23:04 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

busybox init is not intended to be used with initscripts, which is for 
sysvinit.
Please check packagegroup-core-boot.bb for more info.

Best Regards,
Chen Qi

On 11/01/2017 02:04 PM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> * check for the existence of /etc/default/rcS
> * minor fixes to checkroot.sh
> * disable mountall.sh for busybox init
>
> The following changes since commit 5dacc5516718efdf0a470e074a5c05b1ecf8cc15:
>
>    bitbake: main: Give a user readable error if we can't locate topdir (2017-10-31 09:09:21 +0000)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib wenzong/initscripts
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/initscripts
>
> Wenzong Fan (3):
>    initscripts: Check for the existence of /etc/default/rcS
>    initscripts: minor fixes to checkroot.sh
>    initscripts: disable mountall.sh for busybox init
>
>   meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh     |  2 +-
>   meta/recipes-core/initscripts/initscripts-1.0/checkfs.sh      |  2 +-
>   meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh    |  6 +++---
>   meta/recipes-core/initscripts/initscripts-1.0/mountall.sh     |  2 +-
>   .../initscripts/initscripts-1.0/read-only-rootfs-hook.sh      |  2 +-
>   meta/recipes-core/initscripts/initscripts-1.0/urandom         |  2 +-
>   meta/recipes-core/initscripts/initscripts_1.0.bb              | 11 ++++++++---
>   7 files changed, 16 insertions(+), 11 deletions(-)
>


