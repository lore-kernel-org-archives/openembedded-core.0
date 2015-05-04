Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 40F4B72120
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 23:07:14 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so176152162pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 May 2015 16:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=wpMNDv8GQxi4m77uaJEOh+UCIQo17wXijfbSIH7SMxU=;
	b=S+wFk0qtg7eBNdP5YRkj/bb+LlD94cZE90LIfL/I4gMCjDFVkjha03EqjqInR3rEZ0
	Z1GTfXxMcyDPVEOnOySbZqiVI/pVehpQ82/uzWmwGnSe9XCVvMKBX21Svf8JhZ7l60ug
	9HdklmPLceDd8vgJdDxYgC253/j9VFrptNV8R1d10bpnFVZ8t7sFZNOv4fji8YwVcbaA
	KHduWYMtfagp2347BoZJvONeqFL73p2qrPb4L+QARoxdN/uG82HKWCQnpfx2RQ3WY2Ol
	+bDyE3Ydj75PqZJ9TSMWfP1axmD/g8HctK0CHLGzpyMea4EeKFRSUdIrHjPwa0Yn/UUI
	7gvA==
X-Received: by 10.70.93.36 with SMTP id cr4mr45593941pdb.68.1430780835996;
	Mon, 04 May 2015 16:07:15 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:382f:4bd0:54be:1ddc?
	([2601:c:a700:3ba7:382f:4bd0:54be:1ddc])
	by mx.google.com with ESMTPSA id
	df7sm13868692pdb.32.2015.05.04.16.07.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 May 2015 16:07:14 -0700 (PDT)
Message-ID: <5547FB9B.5080102@gmail.com>
Date: Mon, 04 May 2015 16:07:07 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1430502462-26698-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1430502462-26698-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [dizzy][PATCH] mesa: update --with-llvm-shared-libs configure option
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
X-List-Received-Date: Mon, 04 May 2015 23:07:15 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

merged to staging.
- armin

On 05/01/2015 10:47 AM, Martin Jansa wrote:
> From: Andre McCurdy <armccurdy@gmail.com>
>
> As per the Mesa 10.2 release notes, "--with-llvm-shared-libs"
> has been renamed to "--enable-llvm-shared-libs".
>
>    http://www.mesa3d.org/relnotes/10.2.html
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-graphics/mesa/mesa.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 1857f3c..658bd3a 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -62,7 +62,7 @@ PACKAGECONFIG[gallium]      = "--with-gallium-drivers=${GALLIUMDRIVERS}, --witho
>   PACKAGECONFIG[gallium-egl]  = "--enable-gallium-egl, --disable-gallium-egl"
>   PACKAGECONFIG[gallium-gbm]  = "--enable-gallium-gbm, --disable-gallium-gbm"
>   MESA_LLVM_RELEASE ?= "3.3"
> -PACKAGECONFIG[gallium-llvm] = "--enable-gallium-llvm --with-llvm-shared-libs, --disable-gallium-llvm, llvm${MESA_LLVM_RELEASE} \
> +PACKAGECONFIG[gallium-llvm] = "--enable-gallium-llvm --enable-llvm-shared-libs, --disable-gallium-llvm, llvm${MESA_LLVM_RELEASE} \
>                                  ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
>   export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
>
>

