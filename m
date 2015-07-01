Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 47F7C65C9D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 03:00:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6130lIQ029026
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 20:00:47 -0700 (PDT)
Received: from [128.224.162.176] (128.224.162.176) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 30 Jun 2015 20:00:48 -0700
Message-ID: <559357DD.1060906@windriver.com>
Date: Wed, 1 Jul 2015 11:00:45 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Li Zhou <li.zhou@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <1430386463-13290-1-git-send-email-li.zhou@windriver.com>
In-Reply-To: <1430386463-13290-1-git-send-email-li.zhou@windriver.com>
Subject: Re: [PATCH] boost & libxslt: nativesdk is missed in bb file and break <make universe>
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
X-List-Received-Date: Wed, 01 Jul 2015 03:00:50 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Ping ...

On 04/30/2015 05:34 PM, Li Zhou wrote:
> When run <make universe.fetchall>, the make will be broken because
> nativesdk-boost and nativesdk-libxslt don't exist.
> nativesdk-boost is depended by nativesdk-curlpp.
> nativesdk-libxslt is depended by nativesdk-python-lxml.
> In condition that meta-openembedded is compiled in.
>
> Add nativesdk building for boost and libxslt.
>
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ---
>   meta/recipes-support/boost/boost.inc           |    2 +-
>   meta/recipes-support/libxslt/libxslt_1.1.28.bb |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
> index 6b42133..7628e37 100644
> --- a/meta/recipes-support/boost/boost.inc
> +++ b/meta/recipes-support/boost/boost.inc
> @@ -181,4 +181,4 @@ do_install() {
>
>   }
>
> -BBCLASSEXTEND = "native"
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-support/libxslt/libxslt_1.1.28.bb b/meta/recipes-support/libxslt/libxslt_1.1.28.bb
> index ded883e..166bcd8 100644
> --- a/meta/recipes-support/libxslt/libxslt_1.1.28.bb
> +++ b/meta/recipes-support/libxslt/libxslt_1.1.28.bb
> @@ -43,4 +43,4 @@ do_install_append_class-native () {
>   FILES_${PN} += "${libdir}/libxslt-plugins"
>   FILES_${PN}-dev += "${libdir}/xsltConf.sh"
>
> -BBCLASSEXTEND = "native"
> +BBCLASSEXTEND = "native nativesdk"
>

