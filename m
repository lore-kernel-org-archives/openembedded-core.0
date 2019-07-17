Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C891E7EC66
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 08:20:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6H8JWva014382
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Jul 2019 01:20:33 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 17 Jul 2019 01:19:25 -0700
To: Adrian Ratiu <adrian.ratiu@collabora.com>,
	<openembedded-core@lists.openembedded.org>
References: <20190717074836.27002-1-adrian.ratiu@collabora.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <a1a87489-5023-2ac9-59ee-996725d08a72@windriver.com>
Date: Wed, 17 Jul 2019 16:18:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190717074836.27002-1-adrian.ratiu@collabora.com>
Subject: Re: [PATCH] cogl-1.0.inc: set RDEPENDS_${PN}-dev = ""
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
X-List-Received-Date: Wed, 17 Jul 2019 08:20:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/7/17 下午3:48, Adrian Ratiu wrote:
> ${PN}-dev by default depends on ${PN} but in this case ${PN} is empty
> by design (FILES_${PN} = "") and is not created, leading to
> installation dependency errors like the following:
>
> Collected errors:
>   * Solver encountered 1 problem(s):
>   * Problem 1/1:
>   *   - nothing provides cogl-1.0 = 1.22.2-r0 needed by cogl-1.0-dev-1.22.2-r0.armv7at2hf-neon-imx
>   *
>   * Solution 1:
>   *   - do not ask to install a package providing cogl-1.0-dev


I think what you need is

ALLOW_EMPTY_${PN} = "1"


Regards,
Kai


>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> ---
>   meta/recipes-graphics/cogl/cogl-1.0.inc | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
> index 3e392fa5ec..a388023a03 100644
> --- a/meta/recipes-graphics/cogl/cogl-1.0.inc
> +++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
> @@ -75,4 +75,6 @@ RPROVIDES_libcogl = "cogl-1.0"
>   RCONFLICTS_libcogl = "cogl-1.0"
>   RREPLACES_libcogl = "cogl-1.0"
>   
> +RDEPENDS_${PN}-dev = ""
> +
>   COMPATIBLE_HOST_armv4 = 'null'


-- 
Kai Kang


