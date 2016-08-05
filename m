Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1E50673281
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 02:15:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u752Fa7B006781
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Aug 2016 19:15:36 -0700 (PDT)
Received: from [128.224.163.140] (128.224.163.140) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Thu, 4 Aug 2016 19:15:36 -0700
To: <openembedded-core@lists.openembedded.org>
References: <1469068840-17081-1-git-send-email-mingli.yu@windriver.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <57A3F61E.9070009@windriver.com>
Date: Fri, 5 Aug 2016 10:12:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1469068840-17081-1-git-send-email-mingli.yu@windriver.com>
X-Originating-IP: [128.224.163.140]
Subject: Re: [PATCH] at: add libselinux to PACKAGECONFIG
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
X-List-Received-Date: Fri, 05 Aug 2016 02:15:41 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

//ping

Thanks,
Grace

On 2016年07月21日 10:40, mingli.yu@windriver.com wrote:
> * add libselinux to PACKAGECONFIG for at
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   meta/recipes-extended/at/at_3.1.20.bb | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/meta/recipes-extended/at/at_3.1.20.bb b/meta/recipes-extended/at/at_3.1.20.bb
> index 1c3eefc..ce5ff53 100644
> --- a/meta/recipes-extended/at/at_3.1.20.bb
> +++ b/meta/recipes-extended/at/at_3.1.20.bb
> @@ -7,6 +7,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
>   DEPENDS = "flex flex-native \
>              ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>
> +PACKAGECONFIG ?= "\
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
> +"
> +
> +PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux,"
> +
>   RDEPENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '', d)} \
>   "
>
>

