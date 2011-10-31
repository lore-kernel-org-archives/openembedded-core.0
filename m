Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RL0tg-0003CL-On for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 00:04:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9VMw0hj022631
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 22:58:00 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21770-10 for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 22:57:56 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9VMvoY0022625
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 22:57:51 GMT
Message-ID: <1320101870.8579.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 31 Oct 2011 22:57:50 +0000
In-Reply-To: <83141bc3f748c34d7f19a03c0517d804fadc6024.1319772853.git.dongxiao.xu@intel.com>
References: <cover.1319772853.git.dongxiao.xu@intel.com>
	<83141bc3f748c34d7f19a03c0517d804fadc6024.1319772853.git.dongxiao.xu@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 09/11] iptables: upgrade to version 1.4.12.1
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
X-List-Received-Date: Mon, 31 Oct 2011 23:04:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-10-28 at 11:35 +0800, Dongxiao Xu wrote:
> Remove the do_configure_prepend() since some m4 files are needed when
> doing configuration.

I think we're going to have to specifically delete the libtool m4 files
here. I know we've had problems with them being present in the past.

Also, there is no mention of the licence change here in the commit
message?

Cheers,

Richard


> Define correct FILE for iptables and iptables-dbg packages.
> 
> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
> ---
>  .../{iptables_1.4.9.bb => iptables_1.4.12.1.bb}    |   16 ++++++----------
>  1 files changed, 6 insertions(+), 10 deletions(-)
>  rename meta/recipes-extended/iptables/{iptables_1.4.9.bb => iptables_1.4.12.1.bb} (69%)
> 
> diff --git a/meta/recipes-extended/iptables/iptables_1.4.9.bb b/meta/recipes-extended/iptables/iptables_1.4.12.1.bb
> similarity index 69%
> rename from meta/recipes-extended/iptables/iptables_1.4.9.bb
> rename to meta/recipes-extended/iptables/iptables_1.4.12.1.bb
> index 7c9fbea..59a1bcb 100644
> --- a/meta/recipes-extended/iptables/iptables_1.4.9.bb
> +++ b/meta/recipes-extended/iptables/iptables_1.4.12.1.bb
> @@ -4,8 +4,8 @@ filtering code in Linux."
>  HOMEPAGE = "http://www.netfilter.org/"
>  BUGTRACKER = "http://bugzilla.netfilter.org/"
>  LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
> -                    file://iptables.c;firstline=13;endline=25;md5=f1028f2401da1c120df27594b2be50ef"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263\
> +                    file://iptables/iptables.c;firstline=13;endline=25;md5=f1028f2401da1c120df27594b2be50ef"
>  
>  PR = "r0"
>  
> @@ -18,19 +18,15 @@ RRECOMMENDS_${PN} = "kernel-module-x-tables \
>                       kernel-module-nf-conntrack-ipv4 \
>                       kernel-module-nf-nat \
>                       kernel-module-ipt-masquerade"
> -FILES_${PN}-dbg =+ "${libexecdir}/xtables/.debug"
> +FILES_${PN} =+ "${libdir}/xtables/"
> +FILES_${PN}-dbg =+ "${libdir}/xtables/.debug"
>  
>  SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2"
>  
> -SRC_URI[md5sum] = "db1312f7ce5a4c11dc981a2ac76b26e8"
> -SRC_URI[sha256sum] = "1ac719d6265cf64220c80c0974ed9d35febdac2986bb96eeaa9c8c7959a1d306"
> +SRC_URI[md5sum] = "b08a1195ec2c1ebeaf072db3c55fdf43"
> +SRC_URI[sha256sum] = "77e6581f21f15946a814fa311236e5f3f7c6593180f9d695cea06aa95e464aba"
>  
>  inherit autotools
>  
>  EXTRA_OECONF = "--with-kernel=${STAGING_INCDIR} \
>                  ${@base_contains('DISTRO_FEATURES', 'ipv6', '', '--disable-ipv6', d)}"
> -
> -do_configure_prepend() {
> -	# they are all libtool m4 files
> -	rm -rf ${S}/m4
> -}




