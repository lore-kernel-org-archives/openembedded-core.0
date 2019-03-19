Return-Path: <sean@geanix.com>
X-Greylist: delayed 537 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 19 Mar 2019 14:21:26 UTC
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 192216BCA9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 14:21:26 +0000 (UTC)
Received: from [192.168.100.161] (unknown [95.138.208.137])
	by mail.hundeboll.net (Postfix) with ESMTPSA id 69D311C46BB;
	Tue, 19 Mar 2019 15:12:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com;
	s=hundeboll; t=1553004749;
	bh=GRwISpSMo3snAy0JA9ymQazkQ77KgBK5m1nZxN2t+3U=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To;
	b=aStraQY8wSHmxykeDb7403jwWcnvkLIwfcjNBLPBNjm5EK2hHkxqgfotQ6K9B37hA
	HGroYlcop7cwYslfFtrxuTt3OSCMJXPkj/Wmgzsbm6A19rcXIC8V2QlxHeRRKn2fnO
	/pH0t+UepmtuwW9Iaz4fy1lq0UbHNJ8d+8To0cF43ewUr6CSx0fEwMTf5bed8xLsad
	58T26uGd3nEeYwi8Iqks4nrg5oRmlRYqpdnV3W+zB0A2zLHgmOHPacua05Zd/PrCOk
	vI/KHEJ3OYcGml15NtaZkAtVhp9zQ9lAzu9rGHLEaEOkIdd35ffBdX9gvm0hSQnpvl
	A0o9PFrhyNh4g==
To: openembedded-core@lists.openembedded.org
References: <20190309185007.1568-1-max.krummenacher@toradex.com>
From: Sean Nyekjaer <sean@geanix.com>
Message-ID: <f709adf9-c012-2513-6738-a3c13b5847ae@geanix.com>
Date: Tue, 19 Mar 2019 15:12:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <20190309185007.1568-1-max.krummenacher@toradex.com>
Subject: Re: [thud][PATCH] target-sdk-provides-dummy: Extend to -dev and -src packages
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
X-List-Received-Date: Tue, 19 Mar 2019 14:21:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit

kind ping

BR
/Sean

On 09/03/2019 19.50, Max Krummenacher wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> This avoids errors when running populate_sdk under opkg:
> 
>   * Problem 1/1:
>   *   - package busybox-dev-1.30.1-r0.core2-64 requires busybox = 1.30.1-r0, but none of the providers can be installed
>   *
>   * Solution 1:
>   *   - allow deinstallation of target-sdk-provides-dummy-1.0-r0.sdk-provides-dummy-target
> 
>   * Solution 2:
>   *   - do not ask to install a package providing busybox-dev
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 33d2cde3be4d25389cbea07064ffbc7b2f74273e)
> ---
>   meta/recipes-core/meta/target-sdk-provides-dummy.bb | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> index edf07c4a23..e7bf2ac632 100644
> --- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> +++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> @@ -2,9 +2,17 @@ DUMMYARCH = "sdk-provides-dummy-target"
>   
>   DUMMYPROVIDES = "\
>       busybox \
> +    busybox-dev \
> +    busybox-src \
>       coreutils \
> +    coreutils-dev \
> +    coreutils-src \
>       bash \
> +    bash-dev \
> +    bash-src \
>       perl \
> +    perl-dev \
> +    perl-src \
>       perl-module-re \
>       perl-module-strict \
>       perl-module-vars \
> @@ -33,6 +41,8 @@ DUMMYPROVIDES = "\
>       /usr/bin/env \
>       /usr/bin/perl \
>       pkgconfig \
> +    pkgconfig-dev \
> +    pkgconfig-src \
>   "
>   
>   require dummy-sdk-package.inc
> 


