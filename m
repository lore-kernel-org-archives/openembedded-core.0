Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EB20B71B1D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 00:29:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w850T8du017216
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Sep 2018 17:29:08 -0700
Received: from [128.224.162.137] (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Tue, 4 Sep 2018 17:29:06 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1535349348-19608-1-git-send-email-yi.zhao@windriver.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <a30928e0-2fe9-0beb-f112-7f75b8449d64@windriver.com>
Date: Wed, 5 Sep 2018 08:29:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1535349348-19608-1-git-send-email-yi.zhao@windriver.com>
X-Originating-IP: [128.224.162.137]
Subject: Re: [PATCH] epiphany: upgrade 3.28.1.1 -> 3.28.3.1
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
X-List-Received-Date: Wed, 05 Sep 2018 00:29:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Ping.  This release fixed CVE-2018-11396.


//Yi


在 2018年08月27日 13:55, Yi Zhao 写道:
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>   .../epiphany/{epiphany_3.28.1.1.bb => epiphany_3.28.3.1.bb}           | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-gnome/epiphany/{epiphany_3.28.1.1.bb => epiphany_3.28.3.1.bb} (84%)
>
> diff --git a/meta/recipes-gnome/epiphany/epiphany_3.28.1.1.bb b/meta/recipes-gnome/epiphany/epiphany_3.28.3.1.bb
> similarity index 84%
> rename from meta/recipes-gnome/epiphany/epiphany_3.28.1.1.bb
> rename to meta/recipes-gnome/epiphany/epiphany_3.28.3.1.bb
> index 65e7b45..8837b9c 100644
> --- a/meta/recipes-gnome/epiphany/epiphany_3.28.1.1.bb
> +++ b/meta/recipes-gnome/epiphany/epiphany_3.28.3.1.bb
> @@ -13,8 +13,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
>   SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
>              file://0002-help-meson.build-disable-the-use-of-yelp.patch \
>              "
> -SRC_URI[archive.md5sum] = "9f4c0bf831789638818c23cd555b29d9"
> -SRC_URI[archive.sha256sum] = "99426aa0e386742e924d84b59ec16bf394195fb9fce85d07f72d2cde486ea495"
> +SRC_URI[archive.md5sum] = "31a4a443e8e22f085a10f80b7e41d5f3"
> +SRC_URI[archive.sha256sum] = "690546a701f046c5c2b3a092659589ea6e17cb0f9a81ec3fdb3046b00cede6f7"
>   
>   EXTRA_OEMESON += " -Ddistributor_name=${DISTRO}"
>   


