Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 535DB65E1A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Nov 2014 15:43:50 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id g10so21503108pdj.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Nov 2014 07:43:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=pfVHmXMBa+zWyzLOXXQwKoPhQHdbPfHCeVDeeFSFY8M=;
	b=bogygTb0IH+WfWFszRJ9Yx1jSBI6JI+AhpAj5y9WcEYoKtkzE3RkFYi7uoMDxkgnwc
	viE4scTqUEhvpwRLjw48wTgYFo/CaZ760OfnCQi9J35XrO2se9az/+2NX2J9HJIDknOd
	2JqJhbmsUSBmxsj6KB4ffdAFhk7f0wDkCOhKN0vmNZBOFOId6rVWniEodQ8MIsdwdcHb
	4/zHjZROuEC3FwnQp3PQyUyBOfU3optBe3pWHMYeH1Y65lPwNIsCRUpuEmWQ3VazL0SD
	fTW7FnjKBAAsGRJr3htZwageOktDonqceN5x3KyR9b+K5JMSfuQNTLY9iLd4nU3hhZZM
	w4vA==
X-Gm-Message-State: ALoCoQmFxzV6Tm/oAfVtU6dYnUFaXY8HCfd/0hKekIxcuxQh9OdHJ8RwrZmJjyfKjqbuLpyB05F8
X-Received: by 10.68.247.168 with SMTP id yf8mr10102057pbc.40.1416239031634;
	Mon, 17 Nov 2014 07:43:51 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:c00e:30e7:fd8c:8f96?
	([2601:c:9380:601:c00e:30e7:fd8c:8f96])
	by mx.google.com with ESMTPSA id ek5sm4990346pbd.4.2014.11.17.07.43.50
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Nov 2014 07:43:50 -0800 (PST)
Message-ID: <546A17B5.6070704@mvista.com>
Date: Mon, 17 Nov 2014 07:43:49 -0800
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
References: <cover.1416213365.git.wenzong.fan@windriver.com>
	<e6e4ba1fd6f31ecd724e7ca035f4cdc45576e0a3.1416213365.git.wenzong.fan@windriver.com>
In-Reply-To: <e6e4ba1fd6f31ecd724e7ca035f4cdc45576e0a3.1416213365.git.wenzong.fan@windriver.com>
Subject: Re: [PATCH 1/1] serf: 1.3.6 -> 1.3.8
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
X-List-Received-Date: Mon, 17 Nov 2014 15:43:57 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Since Dizzy would need the security fix in serf 1.3.7, would  I backport 
1.3.8 to Dizzy from master or do we need a separate 1.3.7 update for Dizzy?

- Armin


On 11/17/2014 12:38 AM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> Release changes:
>
> Serf 1.3.8 [2014-10-20, from /tags/1.3.8, rxxxx]
>    Fix issue #152: CRC calculation error for gzipped http reponses > 4GB.
>    Fix issue #153: SSPI CredHandle not freed when APR pool is destroyed.
>    Fix issue #154: Disable SSLv2 and SSLv3 as both or broken.
>
> Serf 1.3.7 [2014-08-11, from /tags/1.3.7, r2411]
>    Handle NUL bytes in fields of an X.509 certificate. (r2393, r2399)
>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>   .../serf/{serf_1.3.6.bb => serf_1.3.8.bb}          |    6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta/recipes-support/serf/{serf_1.3.6.bb => serf_1.3.8.bb} (74%)
>
> diff --git a/meta/recipes-support/serf/serf_1.3.6.bb b/meta/recipes-support/serf/serf_1.3.8.bb
> similarity index 74%
> rename from meta/recipes-support/serf/serf_1.3.6.bb
> rename to meta/recipes-support/serf/serf_1.3.8.bb
> index 08b04d3..10db122 100644
> --- a/meta/recipes-support/serf/serf_1.3.6.bb
> +++ b/meta/recipes-support/serf/serf_1.3.8.bb
> @@ -1,8 +1,8 @@
>
> -SRC_URI = "http://serf.googlecode.com/svn/src_releases/serf-1.3.6.tar.bz2 \
> +SRC_URI = "http://serf.googlecode.com/svn/src_releases/serf-${PV}.tar.bz2 \
>              file://norpath.patch"
> -SRC_URI[md5sum] = "7fe38fa6eab078e0beabf291d8e4995d"
> -SRC_URI[sha256sum] = "ca637beb0399797d4fc7ffa85e801733cd9c876997fac4a4fd12e9afe86563f2"
> +SRC_URI[md5sum] = "2e4efe57ff28cb3202a112e90f0c2889"
> +SRC_URI[sha256sum] = "e0500be065dbbce490449837bb2ab624e46d64fc0b090474d9acaa87c82b2590"
>
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
>

