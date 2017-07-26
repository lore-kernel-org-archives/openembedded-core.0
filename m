Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9EEC7780B4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 18:45:01 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y25so8713015pfk.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 11:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=Ox26bxZyoLMVpwjHThtR5s1NfmtjGJ9wqeejtHUuheU=;
	b=YsabxCgB66wJM0Uz+0TKt1YUjduoTDSrPZdgxdyogIgSm9pGGvTadzBKcmHAVXQ09m
	eMhrY1aOeMm0q9XHLf6rE1H/dclu8nuu7Wgsn0RvFptiVfFIBN7EMyi92iCrujPB80YK
	ArY60G67q5uCbzniAGdZ+VRlSl1O0XgNEi8safLpv8mPGxU6qYDTK0cUGxkoGOcWvDn/
	SaxbhF9k0JRF8SZYWVA/70gNKzWSGG5vda4FUZ06NvncvWm99+0YyGQ4DgMs7w1QslHD
	LxBwkNNFD0ZP2syjsxu0PqVbsznHNbxRHWMA1Rk1zoTZg+bT1IHrV8NZubMohc75uN6U
	IM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Ox26bxZyoLMVpwjHThtR5s1NfmtjGJ9wqeejtHUuheU=;
	b=b1VP2gpbXwrhBLlDgsiE3Z3DGnaEaGDNtZTwIfe9de/oXsC0Ixlj2gnVTdWckseVMP
	B0mgTwLRfFXYlv9d01VdYC5N/cuCNPd24ZnX4xjK0+0r3BWoSFUOcVApWVZSqMQmDqq1
	qGTkzvkyt4ipWGqZUUKjA4NwyqGqe29NUEZpP9HTo63EAL6n/6iPrxRVYOlrmPeAx2Xs
	qXghoeTQvRJZECSfNZ2uYcotA/1zn/LPWxHjpLxzzSqVq9+J8gVEbGvT14ifCVXtZtPN
	InT1Gmq5qPGGYqX07a1dAtZdQKPkHaaFD4k8/uYzj2rbVDQrrPCceyR9jtYdgA4g18+5
	FXtA==
X-Gm-Message-State: AIVw112LmR+niir3fevChBYJ1WgWeDau996mdBiItpI/JRECn2lEUDeC
	TAWEX2bd2q3Il99mW0w=
X-Received: by 10.84.167.2 with SMTP id c2mr1885023plb.370.1501094702611;
	Wed, 26 Jul 2017 11:45:02 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:b5b0:8ed1:85d1:9699?
	([2601:202:4001:9ea0:b5b0:8ed1:85d1:9699])
	by smtp.gmail.com with ESMTPSA id
	j1sm29494187pgs.77.2017.07.26.11.45.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 11:45:02 -0700 (PDT)
To: Nikolay Merinov <n.merinov@inango-systems.com>,
	openembedded-core@lists.openembedded.org
References: <20170726080508.12586-1-n.merinov@inango-systems.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <f9a707d8-a768-2c2e-1339-6d9d239953fc@gmail.com>
Date: Wed, 26 Jul 2017 11:45:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170726080508.12586-1-n.merinov@inango-systems.com>
Subject: Re: [meta-oe][krogoth][morty][PATCH] systemd: Disable DefaultDependencies for sysv scripts on rcS runlevel
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
X-List-Received-Date: Wed, 26 Jul 2017 18:45:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


Nikolay,

On 07/26/2017 01:05 AM, Nikolay Merinov wrote:
> systemd-sysv-generator translate sysv services on rcS runlevel to
> services that starts before sysinit.target. This behavour conflict
> with default dependency on same tartget.
>
> String that define "DefaultDependency=no" was lost from patch for
> sysv generator during porting patches to systemd 229 in commit
> 64ab17b707dc431aaed880d6d8615971243f46f8.

is Master or Pyro affected?

- armin
>
> Current commit returns changes required for services that work on
> rcS runlevel.
>
> Signed-off-by: Nikolay Merinov <n.merinov@inango-systems.com>
> ---
>   ...nerator-add-support-for-executing-scripts-und.patch | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-executing-scripts-und.patch b/meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-executing-scripts-und.patch
> index ac67f65685..5736f57814 100644
> --- a/meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-executing-scripts-und.patch
> +++ b/meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-executing-scripts-und.patch
> @@ -57,7 +57,17 @@ index b5925a4..ea06d6a 100644
>    } SysvStub;
>    
>    static void free_sysvstub(SysvStub *s) {
> -@@ -711,17 +717,31 @@ static int fix_order(SysvStub *s, Hashmap *all_services) {
> +@@ -194,6 +198,9 @@ static int generate_unit_file(SysvStub *s) {
> +         if (s->description)
> +                 fprintf(f, "Description=%s\n", s->description);
> +
> ++        if (!s->default_dependencies)
> ++                fprintf(f, "DefaultDependencies=no\n");
> ++
> +         STRV_FOREACH(p, s->before)
> +                 fprintf(f, "Before=%s\n", *p);
> +         STRV_FOREACH(p, s->after)
> +@@ -711,17 +720,31 @@ static int fix_order(SysvStub *s, Hashmap *all_services) {
>                    if (s->has_lsb && other->has_lsb)
>                            continue;
>    
> @@ -95,7 +105,7 @@ index b5925a4..ea06d6a 100644
>    
>                    /* FIXME: Maybe we should compare the name here lexicographically? */
>            }
> -@@ -788,6 +808,8 @@ static int enumerate_sysv(const LookupPaths *lp, Hashmap *all_services) {
> +@@ -788,6 +811,8 @@ static int enumerate_sysv(const LookupPaths *lp, Hashmap *all_services) {
>                                    return log_oom();
>    
>                            service->sysv_start_priority = -1;
> @@ -104,7 +114,7 @@ index b5925a4..ea06d6a 100644
>                            service->name = name;
>                            service->path = fpath;
>                            name = fpath = NULL;
> -@@ -871,9 +893,11 @@ static int set_dependencies_from_rcnd(const LookupPaths *lp, Hashmap *all_servic
> +@@ -871,9 +896,11 @@ static int set_dependencies_from_rcnd(const LookupPaths *lp, Hashmap *all_servic
>    
>                                    if (de->d_name[0] == 'S')  {
>    
> @@ -118,7 +128,7 @@ index b5925a4..ea06d6a 100644
>                                            r = set_ensure_allocated(&runlevel_services[i], NULL);
>                                            if (r < 0) {
>                                                    log_oom();
> -@@ -887,7 +911,8 @@ static int set_dependencies_from_rcnd(const LookupPaths *lp, Hashmap *all_servic
> +@@ -887,7 +914,8 @@ static int set_dependencies_from_rcnd(const LookupPaths *lp, Hashmap *all_servic
>                                            }
>    
>                                    } else if (de->d_name[0] == 'K' &&


