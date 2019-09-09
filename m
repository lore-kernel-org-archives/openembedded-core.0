Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 004697E71B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 01:24:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x891OOr2019102
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 8 Sep 2019 18:24:35 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Sun, 8 Sep 2019 18:24:13 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20190902131659.144977-1-kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <ef56a966-8f31-3f82-f84a-7d9514176748@windriver.com>
Date: Mon, 9 Sep 2019 09:22:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902131659.144977-1-kai.kang@windriver.com>
Subject: Re: [PATCH] systemd: provides ${base_sbindir}/udevadm for backward compatible
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
X-List-Received-Date: Mon, 09 Sep 2019 01:24:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/9/2 下午9:16, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Create link file ${base_sbindir}/udevadm for backward compatible that
> some existing udev rules require it. eudev has the link file already.

Ping.


>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta/recipes-core/systemd/systemd_242.bb | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
> index 6fbb854886..55661cdf7a 100644
> --- a/meta/recipes-core/systemd/systemd_242.bb
> +++ b/meta/recipes-core/systemd/systemd_242.bb
> @@ -281,6 +281,9 @@ do_install() {
>   		fi
>   	fi
>   
> +	# create link for existing udev rules
> +	ln -s ${base_bindir}/udevadm ${D}${base_sbindir}/udevadm
> +
>   	# duplicate udevadm for postinst script
>   	install -d ${D}${libexecdir}
>   	ln ${D}${base_bindir}/udevadm ${D}${libexecdir}/${MLPREFIX}udevadm
> @@ -598,6 +601,7 @@ FILES_udev += "${base_sbindir}/udevd \
>                  ${systemd_unitdir}/system/*udev* \
>                  ${systemd_unitdir}/system/*.wants/*udev* \
>                  ${base_bindir}/udevadm \
> +               ${base_sbindir}/udevadm \
>                  ${libexecdir}/${MLPREFIX}udevadm \
>                  ${datadir}/bash-completion/completions/udevadm \
>                 "


-- 
Kai Kang


