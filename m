Received: from mail-da0-f48.google.com ([209.85.210.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UBKPS-00056H-QP
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 08:29:43 +0100
Received: by mail-da0-f48.google.com with SMTP id w4so1254881dam.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2013 23:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Vs2yuP+zPVMJD/Nn97Q3Ws9GGyfbYP69bqh80NX5zpI=;
	b=iHV15XTEJyKU47GFxS2++fD9ofw7cgSCTSfawAWzHpYbO5EaE0CDWuTrPHSEjJfcs8
	AINGBgeDH8H7aycUmcLOHCZADiNnP4qEkSLOrIcCNiuyAJ3OikjMarzdjdLohIdrIFNE
	KZBSTl1/BCP350cydq+Kp641+C8EB0+4sAFnQDmyToffjFQ2yeb+0TK/btUYNeJbP7xF
	PrwS7ImQiBgwTf0yYAXkfHspFSn0s/4yNXhvMiDnxNi1TGYSJCBGYJwogY9bRjy4OUxc
	kYikX/av/PLkyD72gxaLBsHJXKhb7NgSna6DMLH/lpnxQwqDPNEvu6FWgeHnDwK+zupl
	CcyA==
X-Received: by 10.66.227.169 with SMTP id sb9mr17495720pac.185.1362121995072; 
	Thu, 28 Feb 2013 23:13:15 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id f9sm12104657paz.12.2013.02.28.23.13.13
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 28 Feb 2013 23:13:14 -0800 (PST)
Date: Thu, 28 Feb 2013 23:12:58 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Jeffrey Honig <jeffrey.honig@windriver.com>
Message-ID: <20130301071228.GA2908@sakrah.homelinux.org>
Mail-Followup-To: Jeffrey Honig <jeffrey.honig@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <3796.1362104349@schlepp.honig.net>
MIME-Version: 1.0
In-Reply-To: <3796.1362104349@schlepp.honig.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] [PATCH]: Resolve sysvinit and util-linux conflicting man pages.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Mar 2013 07:29:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (28/02/13 21:19), Jeffrey Honig wrote:
> From: Jeffrey C Honig <jeffrey.honig@windriver.com>
> 
> [ CQID: WIND00404316 ]

except above. Patch looks ok. 

> 
> Use alternatives mechanism to prevent sysvlinux and util-linux
> man pages from causing conflicts.
> 
> Signed-off-by: Jeffrey C Honig <jeffrey.honig@windriver.com>
> ---
>  meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb    |   11 ++++++++++-
>  meta/recipes-core/util-linux/util-linux.inc       |    9 +++++++++
>  meta/recipes-core/util-linux/util-linux_2.22.2.bb |    2 +-
>  3 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> index 0a11139..e64b67a 100644
> --- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> @@ -5,7 +5,7 @@ SECTION = "base"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
>                      file://COPYRIGHT;endline=15;md5=349c872e0066155e1818b786938876a4"
> -PR = "r10"
> +PR = "r11"
>  
>  RDEPENDS_${PN} = "${PN}-inittab"
>  
> @@ -45,6 +45,15 @@ ALTERNATIVE_LINK_NAME[poweroff] = "${base_sbindir}/poweroff"
>  ALTERNATIVE_${PN}-pidof = "pidof"
>  ALTERNATIVE_LINK_NAME[pidof] = "${base_bindir}/pidof"
>  
> +ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 mesg.1 wall.1 sulogin.8 utmpdump.1"
> +
> +ALTERNATIVE_LINK_NAME[last.1] = "${mandir}/man1/last.1"
> +ALTERNATIVE_LINK_NAME[mesg.1] = "${mandir}/man1/mesg.1"
> +ALTERNATIVE_LINK_NAME[mountpoint.1] = "${mandir}/man1/mountpoint.1"
> +ALTERNATIVE_LINK_NAME[sulogin.8] = "${mandir}/man8/sulogin.8"
> +ALTERNATIVE_LINK_NAME[utmpdump.1] = "${mandir}/man1/utmpdump.1"
> +ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
> +
>  PACKAGES =+ "sysvinit-pidof sysvinit-sulogin"
>  FILES_${PN} += "${base_sbindir}/* ${base_bindir}/*"
>  FILES_sysvinit-pidof = "${base_bindir}/pidof.sysvinit ${base_sbindir}/killall5"
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index 10439c0..c91f4a3 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -154,6 +154,15 @@ ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
>  ALTERNATIVE_LINK_NAME[mkfs.minix] = "${base_sbindir}/mkfs.minix"
>  ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
>  
> +ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 mesg.1 wall.1 sulogin.8 utmpdump.1"
> +
> +ALTERNATIVE_LINK_NAME[last.1] = "${mandir}/man1/last.1"
> +ALTERNATIVE_LINK_NAME[mesg.1] = "${mandir}/man1/mesg.1"
> +ALTERNATIVE_LINK_NAME[mountpoint.1] = "${mandir}/man1/mountpoint.1"
> +ALTERNATIVE_LINK_NAME[sulogin.8] = "${mandir}/man8/sulogin.8"
> +ALTERNATIVE_LINK_NAME[utmpdump.1] = "${mandir}/man1/utmpdump.1"
> +ALTERNATIVE_LINK_NAME[wall.1] = "${mandir}/man1/wall.1"
> +
>  # There seems to be problem, atleast on nslu2, with these, untill they are
>  # fixed the busybox ones have higher priority
>  ALTERNATIVE_PRIORITY[hwclock] = "10"
> diff --git a/meta/recipes-core/util-linux/util-linux_2.22.2.bb b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
> index dd95573..f91784b 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.22.2.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
> @@ -1,5 +1,5 @@
>  MAJOR_VERSION = "2.22"
> -PR = "r0"
> +PR = "r1"
>  require util-linux.inc
>  
>  # note that `lscpu' is under GPLv3+
> -- 
> 1.7.9.5
> 
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


