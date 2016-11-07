Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1C5EB700F3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 17:30:23 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 144so8282325pfv.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2016 09:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=gESFI0ItvxmLtGm/xkHb8NXefE5ldTbvcsTFxCW25Ig=;
	b=aatdEDGHEHBkbXYoVaxFzrE8kmfRm6b/0DRaZ/wqOZ3/XcnCzmsWqV+t958HAZJ0Bm
	qYpvxt0CPjrhPCXFKDN2uWuhibW/auiS0xVR1v2EwvpHo0lp3a5zp9CH9dree3MzQYAS
	mciJC+jM9NXOO4Se5lD3Bic6wTJ1WVfOEQHQbJim/zQSm6HnO9hKDsOXtm4hcQpZtxxD
	6savkuuA/9aa26S2QNJi/CSZ60RYitC8JIaztzAVUQuLifrOqCv8bj1pvup3JRzvHgO+
	qv4093GXxZwJQuELEvXfNkGDeQHC0LjaVEU8JYSxUXcRqZh1IFvKpFG07YRj3mzqqBcT
	yJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=gESFI0ItvxmLtGm/xkHb8NXefE5ldTbvcsTFxCW25Ig=;
	b=RRFLWkzhtX8/ARcsnzgL0LRijFmFArpx896Sxus0Glbh3l74wM/WbLBYYqYkEfOn/Z
	LrZRt2RbXJiViPVzq8k1USv1zfXymL/pyxsaHmPbwfWT0rGKiyym4cRM7flonUVaMfLz
	WvBrfQh/0AofcxazbrLeabisDu+2cAYoDb0hlYefr8YhX/3lZbZJUy32gtYLn9SniCdO
	UR5a4TQizfQYToUOkyLOWljzcDrcufU5XzECpydmQs/gjZbcbyM4bCGLtncbYqlMIvpC
	m4pBNQTUqtbA72wHw+FovYmQo3TEIjfoBZYYPliYXOi+VJDyUoLgAYHP7OA+tZDdjwDX
	qQ0A==
X-Gm-Message-State: ABUngvc1D0yTYQ/s2GmY2FgpVekCWZoGjryGJzck9gyszcaTHwux3c1OaKXYw8KNlx6GLw==
X-Received: by 10.98.72.81 with SMTP id v78mr15463520pfa.104.1478539825152;
	Mon, 07 Nov 2016 09:30:25 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:d844:e9e6:5f6d:525])
	by smtp.gmail.com with ESMTPSA id
	u127sm41923650pfu.21.2016.11.07.09.30.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Nov 2016 09:30:24 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <20161107150135.40266-1-Zubair.Kakakhel@imgtec.com>
	<20161107150135.40266-2-Zubair.Kakakhel@imgtec.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <dfeea628-1c1b-1e1e-b015-aa4cd5b9b42c@gmail.com>
Date: Mon, 7 Nov 2016 09:30:22 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161107150135.40266-2-Zubair.Kakakhel@imgtec.com>
Subject: Re: [Patch 01/13] arch-mips: Add MACHINEOVERRIDES variables to reduce duplication
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
X-List-Received-Date: Mon, 07 Nov 2016 17:30:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 11/7/16 7:01 AM, Zubair Lutfullah Kakakhel wrote:
> In some cases, each MIPS variant in a recipe requires a duplicate
> line. Even if the passed flag is the same.
> 
> Add global MACHINEOVERRIDES variables for the following
>  * mipsarch		: All MIPS
>  * mipsarchr6		: All MIPS R6
>  * mipsarcho32{el}	: All MIPS o32
>  * mipsarchn32{el}	: All MIPS n32
>  * mipsarchn64{el}	: All MIPS n64
> 
> This is intended to reduce duplications in recipes
> 
> [YOCTO #10404]
> 
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> ---
>  meta/conf/machine/include/mips/arch-mips.inc | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
> index 6069ca1..5b42841 100644
> --- a/meta/conf/machine/include/mips/arch-mips.inc
> +++ b/meta/conf/machine/include/mips/arch-mips.inc
> @@ -50,6 +50,13 @@ MIPSPKGSFX_32R6 = "${@bb.utils.contains('TUNE_FEATURES', 'mipsisa32r6', 'isa32',
>  TUNE_ARCH = "mips${MIPSPKGSFX_32R6}${MIPSPKGSFX_64R6}${MIPSPKGSFX_BYTE}${MIPSPKGSFX_R6}${MIPSPKGSFX_ENDIAN}"
>  TUNE_PKGARCH = "${MIPSPKGSFX_VARIANT_tune-${DEFAULTTUNE}}${MIPSPKGSFX_FPU}${MIPSPKGSFX_ABI}"
>  
> +# Various Global Machine Overrides
> +MACHINEOVERRIDES =. "mipsarch:"
> +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'r6', 'mipsarchr6:', '' ,d)}"
> +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'n32', 'mipsarchn32${MIPSPKGSFX_ENDIAN}:', '' ,d)}"
> +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'o32', 'mipsarcho32${MIPSPKGSFX_ENDIAN}:', '' ,d)}"
> +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'n64', 'mipsarch64${MIPSPKGSFX_ENDIAN}:', '' ,d)}"

how about mips16 ?

> +
>  # Base tunes
>  AVAILTUNES += "mips mips64-n32 mips64 mipsel mips64el-n32 mips64el mips-nf mips64-nf-n32 mips64-nf mipsel-nf mips64el-nf-n32 mips64el-nf"
>  TUNE_FEATURES_tune-mips = "o32 bigendian fpu-hard"
> 

