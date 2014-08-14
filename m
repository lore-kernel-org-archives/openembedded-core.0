Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 45A9C60438
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 13:53:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7EDrA3L012020
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 06:53:10 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Thu, 14 Aug 2014 06:53:09 -0700
Message-ID: <53ECBF45.2000809@windriver.com>
Date: Thu, 14 Aug 2014 08:53:09 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1408023326.22187.105.camel@ted>
In-Reply-To: <1408023326.22187.105.camel@ted>
Subject: Re: [PATCH] buildtools-tarball: Add nativesdk-pseudo to buildtools
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
X-List-Received-Date: Thu, 14 Aug 2014 13:53:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/14, 8:35 AM, Richard Purdie wrote:
> I was pointing someone at this as a way to get pseudo, only to find it
> isn't there. Its a useful tool to have in a standalone environment with
> little overhead so lets add it.

This will only add one version of the pseudo wrapper libraries.  If the system 
runnings the SDK is a different native word size (i.e. 32-bit SDK, 64-bit system 
userspace) or the target system has both wordsizes installed, pseudo will not be 
able to intercept calls for the non-SDK word size.

--Mark

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
> index c54d9e8..6807db3 100644
> --- a/meta/recipes-core/meta/buildtools-tarball.bb
> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
> @@ -42,6 +42,7 @@ TOOLCHAIN_HOST_TASK ?= "\
>       nativesdk-pigz \
>       nativesdk-make \
>       nativesdk-wget \
> +    nativesdk-pseudo \
>       "
>
>   TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-buildtools-nativesdk-standalone-${DISTRO_VERSION}"
>
>


