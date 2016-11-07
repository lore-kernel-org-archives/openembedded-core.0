Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0CBCF6FF80
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 17:20:41 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id i88so16631854pfk.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2016 09:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=dXr/WQxruC6n7bmlv15bhT2wFqOHfb9YSDc38Ht4vZU=;
	b=qWgQHcvr9X84hg2vt7VISBQlWWkg1yvNsQBVqk6He7djQl8uTJTfGHW1xgdrMmp6ey
	yHtuyXbqAc4ak4jrN77ZraSbR6WzLWBbDedH+oJWm7PIErFPq6QKhG/3YeIj/OCyUXE0
	sag8B7VFPn521GqRscnNcFvnLhTMdxXmTmP7JnkGovP0LjOba9fgM2Ifv4g4LZjU0fJS
	Me2ReSKF6dkI58s9J2lpR8CyiH3wQuO+kgnC/eXflepTQC2rg+++MAnL4N8dG0yFDFUC
	ygTEFaaAspAnwmu0w2LcFq42AWfDJaXkYnZGe1OVUnG0nZfB0xgPPM3WeFlKlPfiqsDa
	Xxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=dXr/WQxruC6n7bmlv15bhT2wFqOHfb9YSDc38Ht4vZU=;
	b=C9gvbSZ0QzAGm6ARsCyuSVogv/aIcw9H4jfLzw0bTnGBbuWuV0veBBjef2UbZ3pLaP
	GE65YUa1NjPWsErXfxEKE6tiyYpk5LF+DSXyVpahJpw4O5obnxw1s7ag79wLcn1adYcj
	3LkomL0LJMHzXhuvLvqF+0PoNGUYzj8gjDwXfZUisXPJQZ895zkN9XFu+e23JwIfs5Pn
	rxnede1NwSTPVhBRUrTPhNZB9QdVJV0VrtrmnYnLn+2dAFtoHKIblhFPcpcMyUgrYuzU
	X5MYCjuQAlAXCdYDwtYvJzAsrpTqhGeOxuCsyrIAJVhtkT6sApDUGKiIEG9rlPnQBK+E
	X4yQ==
X-Gm-Message-State: ABUngvfVVLqahRG8l15Ia2q+ta1zhNHQdGzRmuaOrVqBp6velsiF+3e0STgkQnPua+9ERg==
X-Received: by 10.98.166.70 with SMTP id t67mr15424476pfe.132.1478539242906;
	Mon, 07 Nov 2016 09:20:42 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:d844:e9e6:5f6d:525])
	by smtp.gmail.com with ESMTPSA id
	yc7sm41985189pab.24.2016.11.07.09.20.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Nov 2016 09:20:42 -0800 (PST)
To: jackie.huang@windriver.com, openembedded-core@lists.openembedded.org
References: <20161107081541.14964-1-jackie.huang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <0e6bb658-91b3-77c1-ab38-13756bc41798@gmail.com>
Date: Mon, 7 Nov 2016 09:20:39 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161107081541.14964-1-jackie.huang@windriver.com>
Subject: Re: [PATCH] packagegroup-core-sdk: Disable sanitizers for mips64el
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
X-List-Received-Date: Mon, 07 Nov 2016 17:20:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 11/7/16 12:15 AM, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> These are not available on mips64el yet, so disable them.

this is ok

> 
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> index aceba78..9c4ea9b 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> @@ -31,6 +31,7 @@ SANITIZERS_aarch64 = ""
>  SANITIZERS_mips = ""
>  SANITIZERS_mipsel = ""
>  SANITIZERS_mips64 = ""
> +SANITIZERS_mips64el = ""
>  SANITIZERS_mips64n32 = ""
>  SANITIZERS_nios2 = ""
>  SANITIZERS_powerpc64 = ""
> 

