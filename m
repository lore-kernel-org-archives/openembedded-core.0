Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 147AB60939
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 14:35:51 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id f144so53375100pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 06:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=pUZiJ5/GLudbMxigqj2h+6XPa7w3AE3aGC4Xm8HV098=;
	b=TOGVvbZ+lcy6ouqmSXT5LHGuJeJ15NbdpbKRSbhXS6a/Z1x32B1Xih7oSlKnnwoZLr
	D1A8deu5nXSqlHn9jGn5IOjZ71I1YeHTEDHGYapc4siSchrVe/iI0gYRm1v6IgZ1fdDy
	G1l2L0xJqFtDl1sN1b2X6RuLQ7pe+ARl9rNcs/RAG3x70rFJvYYLfVJn1HkgiQJ4TjNq
	FNOn4z+OxYsmJoE3riR0uQ6XvCojJZt/BZeVF2qBlow28y5zPSNe9HNvr8Ia3YylPe1p
	Va3N+KkGOrbgbYajZgpDFhQdCKgVYXG/rzRErG5bkTiFS36t60s/d8CpMK6bnFGCpK/t
	9Zsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=pUZiJ5/GLudbMxigqj2h+6XPa7w3AE3aGC4Xm8HV098=;
	b=ZC5wIgEKRwRXFIunyMq1rzo50VF+gTSCAhLDXdgHXncrGXz79y+DY7zOmj+7CjCGhp
	a6f1vTP4dvPh/UbnEd6bJa7jQags1yhuo4Vy8fjt8Dr1mOaYbsR4NbncQ2lZQPoZnDky
	nCoxZM9uh3tB1ebDAq4h3jfauAXomMh3/q4HYmW0FYk0LE95AW69w4yyFRt6hr1KkwEL
	/WSTRROnlkSahJDTxv04nmJvyRf+gxb5Qm+dmtyCDlkLMSweHJ6KcojmIO/jeOSEnBlg
	ANgFOvnk+LMRT5h6b1odeWSKVfpFEIDfVDDV6kJjxNqsjDWZaxbb87jmhGodyY4OVu6T
	4KBA==
X-Gm-Message-State: AIkVDXIbvnf4PKQ8bLFBkn9UgTsx2Veq2OrgAn5NV/cscH4F1593TNMQz15c/XKNYYOjTA==
X-Received: by 10.84.232.201 with SMTP id x9mr13813477plm.102.1484145351799;
	Wed, 11 Jan 2017 06:35:51 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:ea2a:eaff:fe0e:629e?
	([2601:202:4001:9ea0:ea2a:eaff:fe0e:629e])
	by smtp.gmail.com with ESMTPSA id
	s65sm14528193pgb.25.2017.01.11.06.35.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Jan 2017 06:35:51 -0800 (PST)
To: Sona Sarmadi <sona.sarmadi@enea.com>,
	openembedded-core@lists.openembedded.org
References: <1484046651-61364-1-git-send-email-sona.sarmadi@enea.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <e5f879c8-8ea6-d2a6-0e4f-9da16d838f6b@gmail.com>
Date: Wed, 11 Jan 2017 06:35:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1484046651-61364-1-git-send-email-sona.sarmadi@enea.com>
Subject: Re: [PATCH][morty] libxtst: 1.2.2 -> 1.2.3
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
X-List-Received-Date: Wed, 11 Jan 2017 14:35:54 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 01/10/2017 03:10 AM, Sona Sarmadi wrote:
> Upgrade libxtst from 1.2.2 to 1.2.3 to address:
What else changed in this update?
- armin
> Out of Bounds Write Denial of Service Vulnerability, CVE-2016-7951
>
> References:
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-7951
> https://cgit.freedesktop.org/xorg/lib/libXtst/commit/?id=9556ad67af3129ec4a7a4f4b54a0d59701beeae3
>
> Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> ---
>   meta/recipes-graphics/xorg-lib/{libxtst_1.2.2.bb => libxtst_1.2.3.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-graphics/xorg-lib/{libxtst_1.2.2.bb => libxtst_1.2.3.bb} (78%)
>
> diff --git a/meta/recipes-graphics/xorg-lib/libxtst_1.2.2.bb b/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb
> similarity index 78%
> rename from meta/recipes-graphics/xorg-lib/libxtst_1.2.2.bb
> rename to meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb
> index 1b0bcf3..31ea439 100644
> --- a/meta/recipes-graphics/xorg-lib/libxtst_1.2.2.bb
> +++ b/meta/recipes-graphics/xorg-lib/libxtst_1.2.3.bb
> @@ -16,5 +16,5 @@ PE = "1"
>   
>   XORG_PN = "libXtst"
>   
> -SRC_URI[md5sum] = "25c6b366ac3dc7a12c5d79816ce96a59"
> -SRC_URI[sha256sum] = "ef0a7ffd577e5f1a25b1663b375679529663a1880151beaa73e9186c8309f6d9"
> +SRC_URI[md5sum] = "ef8c2c1d16a00bd95b9fdcef63b8a2ca"
> +SRC_URI[sha256sum] = "4655498a1b8e844e3d6f21f3b2c4e2b571effb5fd83199d428a6ba7ea4bf5204"


