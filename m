Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 22ED771482
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 07:07:34 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id eu11so869457pac.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 00:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=QdVICsm7LEcH4wOm2FViKILpmTLvA6fj9RsZzLpaxmw=;
	b=CrpedlAFRjAi75Wkpb5WmNI1Q//QdZA0OhD6jeQVa3ppEHoOkgQcuBxpKEuXKLWRsO
	it+Xu0jDd0ESZ7AZJyd1mH5lnd0i3qsdmq607iJOLHhccA1LYMT1D1RVHZ83KEKPQxXM
	qD7RZ/hthFhaQ9BzUD5fFO8wntQEwU9VUsWIK2vWJaRZpP/R0wBOEDNWYLcGXUXH3lMB
	0QTk9746tGZEK/VrvoYVKA3z3K4pcX3zOE2vS36KHzUXl0DGS+1SWM2WiYAAjbGMJR/w
	rNL59SOf3FmHeFzOeipRevWUlheAKy475qw+ZXy3V+qinU5TBMAM3FPXL2IrIzKUO9Yg
	qrdw==
X-Received: by 10.68.238.137 with SMTP id vk9mr1708162pbc.165.1411024055878;
	Thu, 18 Sep 2014 00:07:35 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:9:3580:7a5:c0c6:c4a3:f3e7:1968])
	by mx.google.com with ESMTPSA id p3sm18810078pde.35.2014.09.18.00.07.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Sep 2014 00:07:35 -0700 (PDT)
Message-ID: <541A84B5.7020606@gmail.com>
Date: Thu, 18 Sep 2014 00:07:33 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1410879378.git.kai.kang@windriver.com>
	<21ec391160434407e70d89fe334515ede221d354.1410879378.git.kai.kang@windriver.com>
In-Reply-To: <21ec391160434407e70d89fe334515ede221d354.1410879378.git.kai.kang@windriver.com>
Subject: Re: [PATCH 9/9] perf: disable libunwind support for aarch64
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
X-List-Received-Date: Thu, 18 Sep 2014 07:07:35 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



On 9/16/14 8:06 AM, Kai Kang wrote:
> Disable libunwind support of perl for aarch aarch64 that libunwind
> doesn't support aarch64.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-kernel/perf/perf-features.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-kernel/perf/perf-features.inc b/meta/recipes-kernel/perf/perf-features.inc
> index 2dbbb47..1782ae6 100644
> --- a/meta/recipes-kernel/perf/perf-features.inc
> +++ b/meta/recipes-kernel/perf/perf-features.inc
> @@ -1,4 +1,5 @@
>  PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui perf-libunwind"
> +PERF_FEATURES_ENABLE_aarch64 ?= "perf-scripting perf-tui"
>  

you could also say PERF_FEATURES_ENABLE_remove_aarch64 = "perf-libunwind"

>  def perf_feature_enabled(feature, trueval, falseval, d):
>      """
> 

- -- 
- -Khem
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.22 (Darwin)
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlQahLUACgkQuwUzVZGdMxRUTgCbB9mselfaJ3OdHJTFnZp34n15
OacAni2H6G+Mri1zW7+W5OCHBbgzfE5L
=lgJC
-----END PGP SIGNATURE-----

