Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SluW2-0006zu-TG
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 06:15:07 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jul 2012 21:04:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172780459"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jul 2012 21:04:04 -0700
Message-ID: <4FF26F33.2090508@linux.intel.com>
Date: Mon, 02 Jul 2012 21:04:03 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Kang Kai <Kai.Kang@windriver.com>
References: <cover.1340873279.git.kai.kang@windriver.com>
	<4FF24E07.7010905@windriver.com>
In-Reply-To: <4FF24E07.7010905@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Fix lsbinitscripts link problem
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
X-List-Received-Date: Tue, 03 Jul 2012 04:15:07 -0000
X-Groupsio-MsgNum: 24508
Content-Type: multipart/mixed; boundary="------------070202030007000608020007"

--------------070202030007000608020007
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/02/2012 06:42 PM, Kang Kai wrote:
> On 2012年06月28日 17:35, Kang Kai wrote:
>> Hi Saul,
>>
>> I update the initscripts to use update alternative way to install file
>> functions.
>> That make file functions provided by lsbinitscripts will be used
>> instead of initscripts.
>
> Could anyone give comments of these two patches?

Kai,

I commented on this patch already on 6/27, please see attached email

Sau!

> Thanks.
>
> Regards,
> Kai
>
>>
>> Regards,
>> Kai
>>
>> The following changes since commit
>> 8ce8d25bcda0e2e0b62204d5ca5875dedcaacf7d:
>>
>> sanity.bbclass: Increase LAYER_CONF_VERSION to match bblayers change
>> (2012-06-25 17:20:54 +0100)
>>
>> are available in the git repository at:
>> git://git.pokylinux.org/poky-contrib kangkai/distro
>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/distro
>>
>> Kang Kai (1):
>> initscripts: use update-alternative to handle file functions
>>
>> Xiaofeng Yan (1):
>> lsbinitscripts: Add a linking for functions.lsbinitscripts
>>
>> meta/recipes-core/initscripts/initscripts_1.0.bb | 10 ++++++++--
>> meta/recipes-extended/lsb/lsbinitscripts_9.03.bb | 6 +++---
>> 2 files changed, 11 insertions(+), 5 deletions(-)
>>
>
>
>

--------------070202030007000608020007
Content-Type: message/rfc822;
 name="Attached Message"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="Attached Message"

X-Mozilla-Keys: pull bb                                                                         
Return-Path: <sgw@linux.intel.com>
X-Original-To: sgw@linux.intel.com
Delivered-To: sgw@linux.intel.com
Received: from orsmga002.jf.intel.com (orsmga002.jf.intel.com [10.7.209.21])
	by linux.intel.com (Postfix) with ESMTP id 2FA126A4007
	for <sgw@linux.intel.com>; Wed, 27 Jun 2012 09:53:18 -0700 (PDT)
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; 
   d="scan'208";a="163520252"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
  by orsmga002.jf.intel.com with ESMTP; 27 Jun 2012 09:53:15 -0700
Message-ID: <4FEB3A7B.2030605@linux.intel.com>
Date: Wed, 27 Jun 2012 09:53:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
CC: Kang Kai <kai.kang@windriver.com>, Zhenfeng.Zhao@windriver.com
Subject: Re: [OE-core] [PATCH 1/1] lsbinitscripts: Add a linking for functions.lsbinitscripts
References: <cover.1340776826.git.kai.kang@windriver.com> <70f42c05e9e15f403cccc16c92fb14d0675c0c7d.1340776826.git.kai.kang@windriver.com>
In-Reply-To: <70f42c05e9e15f403cccc16c92fb14d0675c0c7d.1340776826.git.kai.kang@windriver.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/26/2012 11:04 PM, Kang Kai wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> The linking will fail when an original file "functions" exists.
> So using the new linking replace the previous "functions".
>
> [YOCTO #2133]
>
> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>   meta/recipes-extended/lsb/lsbinitscripts_9.03.bb |   11 ++++-------
>   1 files changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
> index dd92a92..990da2e 100644
> --- a/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
> +++ b/meta/recipes-extended/lsb/lsbinitscripts_9.03.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "SysV init scripts which only is used in an LSB image"
>   SECTION = "base"
>   LICENSE = "GPLv2"
>   DEPENDS = "popt"
> -PR = "r0"
> +PR = "r1"
>
>   LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
>
> @@ -13,15 +13,12 @@ SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-${PV}
>
>   SRC_URI[md5sum] = "668fa2762b57ef75436303857847bba3"
>   SRC_URI[sha256sum] = "d56547a68ce223a7413b2676650b042125f047c8d6d139c5b970e118b3dc958a"
> -inherit update-alternatives
> -
> -ALTERNATIVE_PRIORITY = "10"
> -ALTERNATIVE_${PN} = "functions"
> -ALTERNATIVE_LINK_NAME[functions] = "${sysconfdir}/init.d/functions"
>
>   do_configure[noexec] = "1"
>
>   do_install(){
>   	install -d ${D}/etc/init.d/
> -	install -m 0755 ${S}/rc.d/init.d/functions ${D}/etc/init.d/functions
> +	install -m 0755 ${S}/rc.d/init.d/functions ${D}/etc/init.d/functions.lsbinitscripts
> +        cd ${D}/etc/init.d/
> +        ln -sf functions.lsbinitscripts functions
>   }

This is still not correct, you are disabling the usage update 
ALTERNATIVE here.  What you should really be doing is adding that 
support to the original initscripts_1.0.bb recipes for the function file 
and give this a higher ALTERNATIVE_PRIORITY, so that when it is 
installed it will do the right thing (tm) via the update alternative 
functionality.

Sau!



--------------070202030007000608020007--
