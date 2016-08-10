Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7E9BB771E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 02:20:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7A2KcwL010197
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2016 19:20:38 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 9 Aug 2016 19:20:37 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1470635157.git.liezhi.yang@windriver.com>
	<0b7f903f8c74204bb48cc74ce1a6957534ac9ede.1470635157.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <57AA8F74.9000400@windriver.com>
Date: Wed, 10 Aug 2016 10:20:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <0b7f903f8c74204bb48cc74ce1a6957534ac9ede.1470635157.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/1] xmlto: fix depends for native
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
X-List-Received-Date: Wed, 10 Aug 2016 02:20:38 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

After talked with Ming, we should use his patch:
xmlto: adds libxslt to DEPENDS


My patch moved libxslt-bin from RDEPENDS_${PN}_append_class-target to
RDEPENDS_${PN} but renamed to libxslt, which will cause libxslt to
be installed on target but not libxslt-bin.

// Robert

On 08/08/2016 01:46 PM, Robert Yang wrote:
> xmlto-native requires xsltproc which is provided by libxslt to run.
> Fixed:
> xmlto: Can't continue, xsltproc tool not found or not executable.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/recipes-devtools/xmlto/xmlto_0.0.28.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> index 886e7b4..d6f2e92 100644
> --- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> +++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
> @@ -20,9 +20,9 @@ RDEPENDS_${PN} = "docbook-xml-dtd4 \
>                     util-linux \
>                     libxml2 \
>                     bash \
> +                  libxslt \
>   "
>   RDEPENDS_${PN}_append_class-target = " \
> -                  libxslt-bin \
>                     coreutils \
>   "
>   CACHED_CONFIGUREVARS += "ac_cv_path_TAIL=${bindir}/tail"
>

