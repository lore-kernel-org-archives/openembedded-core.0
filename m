Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id C668160602
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Mar 2018 03:14:30 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id z10so4784616pfh.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 19:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=2cEPGBdqVqi+ISImcNMBfbkuPlkDNz2a8CMNHlVzAMA=;
	b=SsWNahh5xlqqfxVia0IzCce0ECwKz5HsvqSnUpFgLnhSJebuKMIFGT9QBHfomCgxuW
	INbeR7L81lyaZkrDvDxLpDIZJGqk19c6/WajEiaiWlcYlTQjvTvbsK2MzJcM46+tjGIz
	5Qwyo6kQBkf4OD/eBs0n5bBtQGWuoR0CaIy+VlUXmlvvZBimDJPlT1MmCqqUEt/2H8Lj
	+hzQ94MwyUMB9ZiYYsnjZdPU+Cy2zdFyURcg+Xgvww6ztefeuGd1vm0qRbU0QXxDJEp5
	TGYmmfA9Uxszm67ZX/I3HzgOM+zkjfJr6Q6D3Vg2tdH1Y6DK1Ul0u0v3uEb48UgfzXCV
	g2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=2cEPGBdqVqi+ISImcNMBfbkuPlkDNz2a8CMNHlVzAMA=;
	b=WbgkmEA4j0letpHsQDWnFDGpZgfwyQCOWB75A8vFT1M5q7qce3bb1OaRl26eBmTheV
	ilFO7XeZhHyMLj451uhYYdAPdlyLoEEaq+jyv2bHYOvjZCls7KKRJApBScTRp13/TYwx
	7z3OQO1Hwh7yjimufvcCp+C7GlY9wg9ruCEDn0x9K80tIsrnaP6KY/fZ1evcLy/KMMDG
	9V6fQUJffdcSlyjs4a+fSmCCGMykoB0f7+p8Q1IfnonQbIe0NG+xZy2rJhxnsQ8++N1y
	zmNgm+PtZ0mDW3y5by9euDYy27HLT8o4IJyFw188MgS+mo/zt42OV3ttiwNOV/fLb4G0
	yFwg==
X-Gm-Message-State: APf1xPArtx2wElAaZnJDvznv/NbA5PIxPVa+KMXnxxxpD4SxBFhXoXwJ
	KqoyBM2G4HOGR8U5hoP6CRkQREDY
X-Google-Smtp-Source: AG47ELuRSVQVo6RYkIZ/MWIIR1FTKs/PhCpdXuSg67O+LTvpYL9h+ppNaFWjU1qh/jewapqe1OYtjA==
X-Received: by 10.99.154.18 with SMTP id o18mr6322812pge.344.1520046871477;
	Fri, 02 Mar 2018 19:14:31 -0800 (PST)
Received: from ?IPv6:2601:646:8880:466c:a564:75fb:6e2a:d708?
	([2601:646:8880:466c:a564:75fb:6e2a:d708])
	by smtp.gmail.com with ESMTPSA id
	r62sm18243023pfi.52.2018.03.02.19.14.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Mar 2018 19:14:30 -0800 (PST)
To: Justin Bronder <jsbronder@cold-front.org>,
	openembedded-core@lists.openembedded.org
References: <20180302220921.21176-1-jsbronder@cold-front.org>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <21925259-562a-78b6-8616-9345bcfee525@gmail.com>
Date: Fri, 2 Mar 2018 19:14:29 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <20180302220921.21176-1-jsbronder@cold-front.org>
Subject: Re: [PATCH v2] ccache: update to 3.4.1
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
X-List-Received-Date: Sat, 03 Mar 2018 03:14:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/2/18 2:09 PM, Justin Bronder wrote:
> https://ccache.samba.org/releasenotes.html#_ccache_3_4_1
> 
> License-Update: copyright years and file paths updated
> 
> Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> ---
>  meta/recipes-devtools/ccache/ccache_3.3.5.bb | 12 ------------
>  meta/recipes-devtools/ccache/ccache_3.4.1.bb | 12 ++++++++++++
>  2 files changed, 12 insertions(+), 12 deletions(-)
>  delete mode 100644 meta/recipes-devtools/ccache/ccache_3.3.5.bb
>  create mode 100644 meta/recipes-devtools/ccache/ccache_3.4.1.bb
> 
> diff --git a/meta/recipes-devtools/ccache/ccache_3.3.5.bb b/meta/recipes-devtools/ccache/ccache_3.3.5.bb
> deleted file mode 100644
> index 929f0f1276..0000000000
> --- a/meta/recipes-devtools/ccache/ccache_3.3.5.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -require ccache.inc
> -
> -LICENSE = "GPLv3+"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=dae379a85bb6e9d594773e0aa64876f6"
> -
> -SRC_URI[md5sum] = "eee58db7cce892febddb989308dc568f"
> -SRC_URI[sha256sum] = "190576a6e938760ec8113523e6fd380141117303e90766cc4802e770422b30c6"
> -
> -SRC_URI += " \
> -            file://0002-dev.mk.in-fix-file-name-too-long.patch \
> -            file://Revert-Create-man-page-in-the-make-install-from-git-.patch \
> -"
> diff --git a/meta/recipes-devtools/ccache/ccache_3.4.1.bb b/meta/recipes-devtools/ccache/ccache_3.4.1.bb
> new file mode 100644
> index 0000000000..e3bf74e9c6
> --- /dev/null
> +++ b/meta/recipes-devtools/ccache/ccache_3.4.1.bb
> @@ -0,0 +1,12 @@
> +require ccache.inc
> +
> +LICENSE = "GPLv3+"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fa0d99234a05c3a32d380379d5d064a"


it seems checksum changed. So please add a short description what
changed in license terms.

Secondly, please use options to detect renames to git format-patch so we
can get better diffs for review

you can make this default behaviour by adding

[diff]
        renames = copies

to ~/.gitconfig

> +
> +SRC_URI[md5sum] = "39492aea565c3e6d5affa633672a93bd"
> +SRC_URI[sha256sum] = "8c2e260d4245e362552e47bec359941210a96419ac5adf582046ceb92489f7de"
> +
> +SRC_URI += " \
> +            file://0002-dev.mk.in-fix-file-name-too-long.patch \
> +            file://Revert-Create-man-page-in-the-make-install-from-git-.patch \
> +"
> 


