Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C62026C42C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 01:52:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x311qNpb001193
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 31 Mar 2019 18:52:23 -0700 (PDT)
Received: from [128.224.162.190] (128.224.162.190) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Sun, 31 Mar 2019 18:52:23 -0700
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>,
	<openembedded-core@lists.openembedded.org>
References: <20190401014426.7094-1-zangrc.fnst@cn.fujitsu.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <031dce18-a00a-4271-221f-f8acbaec1958@windriver.com>
Date: Mon, 1 Apr 2019 10:02:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20190401014426.7094-1-zangrc.fnst@cn.fujitsu.com>
X-Originating-IP: [128.224.162.190]
Subject: Re: [PATCH] libatomic-ops:upgrade 7.6.8 -> 7.6.10
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
X-List-Received-Date: Mon, 01 Apr 2019 01:52:26 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

It seems that you didn't remove the old version.

Best Regards,
Chen Qi

On 04/01/2019 09:44 AM, Zang Ruochen wrote:
> -Upgrade from libatomic-ops_7.6.8.bb to libatomic-ops_7.6.10.bb.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>   .../libatomic-ops/libatomic-ops_7.6.10.bb     | 22 +++++++++++++++++++
>   1 file changed, 22 insertions(+)
>   create mode 100644 meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb
>
> diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb
> new file mode 100644
> index 0000000000..7628eedb1b
> --- /dev/null
> +++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "A library for atomic integer operations"
> +HOMEPAGE = "https://github.com/ivmai/libatomic_ops/"
> +SECTION = "optional"
> +PROVIDES += "libatomics-ops"
> +LICENSE = "GPLv2 & MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +                    file://doc/LICENSING.txt;md5=e00dd5c8ac03a14c5ae5225a4525fa2d \
> +                    "
> +
> +SRC_URI = "https://github.com/ivmai/libatomic_ops/releases/download/v${PV}/libatomic_ops-${PV}.tar.gz"
> +UPSTREAM_CHECK_URI = "https://github.com/ivmai/libatomic_ops/releases"
> +
> +SRC_URI[md5sum] = "90a78a84d9c28ce11f331c25289bfbd0"
> +SRC_URI[sha256sum] = "587edf60817f56daf1e1ab38a4b3c729b8e846ff67b4f62a6157183708f099af"
> +
> +S = "${WORKDIR}/libatomic_ops-${PV}"
> +
> +ALLOW_EMPTY_${PN} = "1"
> +
> +inherit autotools pkgconfig
> +
> +BBCLASSEXTEND = "native nativesdk"



