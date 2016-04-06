Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B145077100
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 04:49:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u364nmiS011122
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Apr 2016 21:49:48 -0700 (PDT)
Received: from [128.224.162.149] (128.224.162.149) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 5 Apr 2016 21:49:47 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1459917622.git.dengke.du@windriver.com>
	<39560f98b94a3d0d24c44c7ff139aa1c605a8498.1459917622.git.dengke.du@windriver.com>
From: "dengke.du@windriver.com" <dengke.du@windriver.com>
Message-ID: <57049570.6080000@windriver.com>
Date: Wed, 6 Apr 2016 12:49:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <39560f98b94a3d0d24c44c7ff139aa1c605a8498.1459917622.git.dengke.du@windriver.com>
Subject: Re: [PATCH 1/1] coreutils: correct the case for class-native
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
X-List-Received-Date: Wed, 06 Apr 2016 04:49:49 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Sorry, my email has some problem that it send twice. I will fix it as 
soon as.

//dengke

On 2016年04月06日 12:45, Dengke Du wrote:
> The function of do_install_append_class-native for class-native
> had alread exist,so exclude the class-native in function
> do_install_append.
>
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>   meta/recipes-core/coreutils/coreutils_8.25.bb | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-core/coreutils/coreutils_8.25.bb b/meta/recipes-core/coreutils/coreutils_8.25.bb
> index 419a693..e8e269a 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.25.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.25.bb
> @@ -70,6 +70,10 @@ do_compile_prepend () {
>   }
>   
>   do_install_append() {
> +	if [ "${CLASSOVERRIDE}" = "class-native" ]; then
> +		return
> +	fi
> +
>   	for i in df mktemp base64; do mv ${D}${bindir}/$i ${D}${bindir}/$i.${BPN}; done
>   
>   	install -d ${D}${base_bindir}


