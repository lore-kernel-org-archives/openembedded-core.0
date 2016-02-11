Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id EF9D373212
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 19:08:03 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id c10so2915578pfc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 11:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=oul1HGMnucU9rX3BmlxqLx+xEWromXs7jljIFlGpdRk=;
	b=FvXQ+fBY+WRhk8uYzEXcPSqneFzgnQ9/Z77xaFc+5CmaQcFRNvW9CdXIOkhJiSchXv
	t336Eh2UJLOig4Hhz7kkQvgeefGH2S0a1hJB9GSpIj3vxFx9kXOEHbPd9lSTJG7HACxy
	/3fWvrfa3TfakqPBWDCc/6+MJqihQjQoUmgSgj6viDrrRF6fEZQMepBGunlLHWkO6982
	XW9+jjnvi7/tntqESAA3fTyvFwwM9KjTZy3zA3NpM6mZ9NnaWJFoKX/EFT4qkiJMbgrk
	0X1x9TfTmA8sFIMWfgMMpYrr7YznO3dtEQdtF8oQHgBFpYc3zdQnbQ+YvxdTXS98EI9H
	OQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=oul1HGMnucU9rX3BmlxqLx+xEWromXs7jljIFlGpdRk=;
	b=VRZu5kay5gcaNEMCdBw4yqnfyrb48QbvCqnaHQPswQYhfb4Kt3xU4bLRF1tyuaWUUq
	UkC9Fj6d48CmezN04hP5M90jAcexNkVFgAZotJwijzlH95hYvmm5Yep5JLeB0I4g8Vy7
	JAZFzpFJVaY1zcGb1mw44G9MEdL5kts+qE6HQZhnkz8MjrMJnsKyAmXrjO8knXOlStP9
	aFXKzhz4zKLZeo1GxfvYnS5X4Rmv8TWRrVNfrYcVX47znOhvdrGX4emcHHS/xi4NGMt7
	C7k6qUVcR0IL+4bd2CYxN9JN0JIWTsaQefo712mBqM7q+WIwr3uQdmek7UohFAG/Xh9d
	rVdg==
X-Gm-Message-State: AG10YOQUIZ2YZ7BGKSGrpdM0TZvUDmCigpGL/az/mVPY0cwnqVN4t+zeVnC0Mg4emAXvWQ==
X-Received: by 10.98.89.215 with SMTP id k84mr69257382pfj.66.1455217684326;
	Thu, 11 Feb 2016 11:08:04 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:2cc3:4239:40ed:fb52?
	([2601:202:4000:1239:2cc3:4239:40ed:fb52])
	by smtp.googlemail.com with ESMTPSA id
	t87sm14033893pfa.14.2016.02.11.11.08.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Feb 2016 11:08:02 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
	<6ebf64ba55b2abcb17cfaf487d412a7072d9034b.1455107972.git.alexander.kanavin@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56BCDC10.8050901@gmail.com>
Date: Thu, 11 Feb 2016 11:08:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <6ebf64ba55b2abcb17cfaf487d412a7072d9034b.1455107972.git.alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 6/7] webkitgtk: update to 2.10.7
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
X-List-Received-Date: Thu, 11 Feb 2016 19:08:04 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

this update includes:


CVE-2015-7096
    Versions affected: WebKitGTK+ before 2.10.5.

CVE-2015-7098
    Versions affected: WebKitGTK+ before 2.10.5.


http://webkitgtk.org/security.html


On 02/10/2016 04:42 AM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-sato/webkit/{webkitgtk_2.10.5.bb => webkitgtk_2.10.7.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-sato/webkit/{webkitgtk_2.10.5.bb => webkitgtk_2.10.7.bb} (96%)
> 
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.10.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
> similarity index 96%
> rename from meta/recipes-sato/webkit/webkitgtk_2.10.5.bb
> rename to meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
> index fba3108..8812967 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.10.5.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
> @@ -16,8 +16,8 @@ SRC_URI = "\
>    file://0001-Enable-backtrace-on-linux-when-using-glibc.patch \
>    file://0001-Fix-build-with-non-glibc-libraries-on-linux.patch \
>    "
> -SRC_URI[md5sum] = "bb3bd727960630bb4cbaddf8b1632d18"
> -SRC_URI[sha256sum] = "785d5e98eaf07be15fb8891b7d5b13a2df7072c609b3ee631ca07d5dea1d79fa"
> +SRC_URI[md5sum] = "84832b9d8329413b4f1d87df5f7e8efe"
> +SRC_URI[sha256sum] = "990d62c82ed6dede31a6ff0a82d847f16b812842ff3e1093d17113627652864e"
>  
>  inherit cmake lib_package pkgconfig perlnative pythonnative distro_features_check upstream-version-is-even
>  
> 

