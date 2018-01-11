Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7FC04605BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 20:15:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w0BKFhVm002211
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 12:15:43 -0800 (PST)
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 11 Jan 2018 12:15:42 -0800
To: <jackie.huang@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <20180111030706.18174-1-jackie.huang@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <fa40b5ce-5334-0f34-785d-d6ad8e978f15@windriver.com>
Date: Thu, 11 Jan 2018 15:15:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20180111030706.18174-1-jackie.huang@windriver.com>
X-Originating-IP: [172.25.44.3]
Subject: Re: [PATCH] systemd: add RDEPENDS on util-linux-getopt
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
X-List-Received-Date: Thu, 11 Jan 2018 20:15:42 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2018-01-10 10:07 PM, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> 'getopt' is needed by systemd-sysv-install, or it fails with:
> | kdump.service is not a native service, redirecting to systemd-sysv-install.
> | Executing: /lib/systemd/systemd-sysv-install enable kdump
> | /lib/systemd/systemd-sysv-install: line 15: getopt: command not found
> 
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>   meta/recipes-core/systemd/systemd_234.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
> index 4132cdf40f..5a0e4c2247 100644
> --- a/meta/recipes-core/systemd/systemd_234.bb
> +++ b/meta/recipes-core/systemd/systemd_234.bb
> @@ -521,7 +521,7 @@ FILES_${PN} = " ${base_bindir}/* \
>   
>   FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
>   
> -RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV}) util-linux-agetty"
> +RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV}) util-linux-agetty util-linux-getopt"

It would be nice to make the dependency conditional on systemd being 
configured to support sysvinit scripts.

../Randy

>   RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', '', 'systemd-serialgetty', d)}"
>   RDEPENDS_${PN} += "volatile-binds update-rc.d"
>   
> 


-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

