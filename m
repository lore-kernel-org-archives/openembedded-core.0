Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B1864766E1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 07:59:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u797wvbW029064
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Aug 2016 00:58:58 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 9 Aug 2016 00:58:56 -0700
To: Ming Liu <liu.ming50@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <1470729188-24979-1-git-send-email-liu.ming50@gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <57A98D3E.70106@windriver.com>
Date: Tue, 9 Aug 2016 15:58:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1470729188-24979-1-git-send-email-liu.ming50@gmail.com>
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: Re: [PATCH] xmlto: adds libxslt to DEPENDS
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
X-List-Received-Date: Tue, 09 Aug 2016 07:59:05 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ming,

I sent a similar patch yesterday:

[OE-core] [PATCH 0/1] xmlto: fix depends for native

http://cgit.openembedded.org/openembedded-core-contrib/commit/?h=rbt/xml&id=0b7f903f8c74204bb48cc74ce1a6957534ac9ede

// Robert

On 08/09/2016 03:53 PM, Ming Liu wrote:
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>
> The native libxslt-bin is needed by xmlto-native, but it's not in either
> DEPENDS or RDEPENDS of native xmlto.
>
> This fixes a following error per test:
> | xmlto: Can't continue, xsltproc tool not found or not executable.
> | make[2]: *** [/mnt/OE/build/tmp-glibc/work/qemux86-oe-linux/perf/1.0-r9/perf-1.0/perf-annotate.1] Error 3
> | make[2]: *** Waiting for unfinished jobs....
>
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>   meta/recipes-devtools/xmlto/xmlto_0.0.28.bb | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> index 886e7b4..cc4bccd 100644
> --- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> +++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> @@ -14,6 +14,9 @@ SRC_URI[sha256sum] = "2f986b7c9a0e9ac6728147668e776d405465284e13c74d4146c9cbc51f
>
>   inherit autotools
>
> +# xmlto-native needs libxslt-native
> +DEPENDS = "libxslt"
> +
>   # xmlto needs getopt/xmllint/xsltproc/bash/tail at runtime
>   RDEPENDS_${PN} = "docbook-xml-dtd4 \
>                     docbook-xsl-stylesheets \
>

