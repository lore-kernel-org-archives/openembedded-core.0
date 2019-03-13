Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 17B7B7C6B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 22:47:49 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 484D9184016;
	Wed, 13 Mar 2019 18:47:50 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id IO560Taidn5K; Wed, 13 Mar 2019 18:47:50 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id ED6F3184013;
	Wed, 13 Mar 2019 18:47:49 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com ED6F3184013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1552517270;
	bh=869uO21WZarW1C33B7ihYW8bnKGBVnyuXWYVEyvmU6w=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=DqHW2XIPkIsCw3Hz0QPRsxLvSHHpThibtaKNaGn0/GxYOpZkw4ZFax1cFg3Xe+RHM
	qWHXgV8E6i4BIMpdbz4MxJvT2i3NAmieQKm8WbPrmI4CWMna0RzWxFXthOEI81/op9
	5urSma4b7T+fai7uFHTymNzyWpKVj0aMCrnt4G3lTrd1WY90iXA81KM3OhfplmPy9+
	Kt/ZFxxsCNR1BxWbbV11XmfqhETMXls2lU4Tag4u0dAWKtUgR2ciPQTw5zrOyA4Yr0
	oiln+71JXa3+R7R6xVMIjuNoeuBtp1haBWM9Jlo7ZxL6bzp0rl0tIvkf1f1o1Ewrwj
	y3hUL6e2GTE1w==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id q5LaRlY3xQnH; Wed, 13 Mar 2019 18:47:49 -0400 (EDT)
Received: from joraj-alpa (unknown [107.159.43.215])
	by mail.efficios.com (Postfix) with ESMTPSA id C498B18400E;
	Wed, 13 Mar 2019 18:47:49 -0400 (EDT)
Date: Wed, 13 Mar 2019 18:47:49 -0400
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20190313224749.GC14253@joraj-alpa>
References: <20190313205555.10007-1-jonathan.rajotte-julien@efficios.com>
MIME-Version: 1.0
In-Reply-To: <20190313205555.10007-1-jonathan.rajotte-julien@efficios.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Subject: Re: [Thud][PATCH 1/3] lttng-ust: update to 2.10.3
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
X-List-Received-Date: Wed, 13 Mar 2019 22:47:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Disregard this series. It does not follow the project guideline regarding recipe
update for stable release.

Thanks

On Wed, Mar 13, 2019 at 08:55:53PM +0000, Jonathan Rajotte wrote:
> Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
> ---
>  .../lttng/{lttng-ust_2.10.1.bb => lttng-ust_2.10.3.bb}        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-kernel/lttng/{lttng-ust_2.10.1.bb => lttng-ust_2.10.3.bb} (90%)
> 
> diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
> similarity index 90%
> rename from meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb
> rename to meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
> index d79a47931c..b5c43200d6 100644
> --- a/meta/recipes-kernel/lttng/lttng-ust_2.10.1.bb
> +++ b/meta/recipes-kernel/lttng/lttng-ust_2.10.3.bb
> @@ -23,8 +23,8 @@ PE = "2"
>  SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
>             file://lttng-ust-doc-examples-disable.patch \
>            "
> -SRC_URI[md5sum] = "4863cc2f9f0a070b42438bb646bbba06"
> -SRC_URI[sha256sum] = "07cc3c0b71e7b77f1913d5b7f340a78a9af414440e4662712aef2d635b88ee9d"
> +SRC_URI[md5sum] = "ffcfa8c1ba9a52f002d240e936e9afa2"
> +SRC_URI[sha256sum] = "9e8420f90d5f963f7aa32bc6d44adc1e491136f687c69ffb7a3075d33b40852b"
>  
>  CVE_PRODUCT = "ust"
>  
> -- 
> 2.17.1
> 

-- 
Jonathan Rajotte-Julien
EfficiOS

