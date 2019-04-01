Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2A8EE7D143
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 18:58:17 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id p19so4945761plo.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 11:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=FyLjama0D1w2yubTfjN8CZpD0M00SJgQu4bTGBfzlLw=;
	b=N9QkK5kn5XZf+nlqpM346AOn+Gv4/0mtDM2oDCynVilmroi79QBDnNO2Y7dbgxKNRn
	AFucFztW3mhzICXAxa9rN4IUTmKyy9FkngmvJRADGLMvMhO66mP1/rZGMxqZWbJfMFG6
	8YFYmVdI0G5f48VGp8SF+9Pir/FOksBOR6Giw7HfyBfo8oVrTOZ98u20fWUTzZYeic52
	4rrUgeuS5f+Ip3dSDmKSXoxdR6ObuUkpsE0ujIHejkZnLJdywOao+gfmm2dwvx5xkw5Y
	NBqBVUTjHY3BOcXRK5hZ2wNm4bhW2eZ0M84KhchYO0+B1Rj0TL3dv0PkliYrRZpcVqqN
	meRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=FyLjama0D1w2yubTfjN8CZpD0M00SJgQu4bTGBfzlLw=;
	b=pyEJHfXenJDeNsp1BQb6fyMT7vBvOZyzPU25O9LwZ5xQxnJXLQFsd6CYt8LrCRypAe
	paqWcrgP5+4+VPG2NfcCmQqNuSXo/kT4PWXx+9+ahq+LBeKJC4KR0n1PURDt8k8zggZx
	lNZtFa+lvNoeCaigNqsvYSE/l2c/jQcPyAHDcz72Zk2M73AkYLuwD70ejAf2DZyh5RtP
	QxQWv18L9YasVpyV5Y7PvnBkSTZjIpoViOoOg2llRGlV0LoQxFDzJ2QGj71GWUeVwtBy
	KryEdfZqzdF1rHJhe2wRMdkn2qGFCdhkM65G5xSEWFCdLByApRtBDGma9Rrku3KXkjWd
	ec5A==
X-Gm-Message-State: APjAAAVNgn3vZRAd1w3hDEUpwMy1uKOtgaqY77mQV4LMRJnVqRzsK0rb
	YTr39VOnHBh9cRRsCUlx0LDChxbO
X-Google-Smtp-Source: APXvYqxBqQuJkQHuynPhD4ilviFc/GZQhOeRA0hn/wH/7iELmgKMcuLhmeZ+R8KvwhC1dw/lz2KKTQ==
X-Received: by 2002:a17:902:8a4:: with SMTP id 33mr64605455pll.7.1554145097724;
	Mon, 01 Apr 2019 11:58:17 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:a4c4:70fc:e03a:d20f?
	([2601:202:4180:c33:a4c4:70fc:e03a:d20f])
	by smtp.gmail.com with ESMTPSA id
	13sm13524462pfi.172.2019.04.01.11.58.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 11:58:16 -0700 (PDT)
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	openembedded-core@lists.openembedded.org
References: <20190401184110.11186-1-open.source@oleksandr-kravchuk.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <dcbbfc16-8acd-340c-a905-17c61ad27ad5@gmail.com>
Date: Mon, 1 Apr 2019 11:58:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190401184110.11186-1-open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH v2] cronie: update to 1.5.4
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
X-List-Received-Date: Mon, 01 Apr 2019 18:58:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 4/1/19 11:41 AM, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../cronie/cronie/crond_pam_config.patch         | 16 ++++++++--------
I don't see how this patch is now being applied? Those steps got remove.

>  .../cronie/{cronie_1.5.2.bb => cronie_1.5.4.bb}  | 10 ++++------
>  2 files changed, 12 insertions(+), 14 deletions(-)
>  rename meta/recipes-extended/cronie/{cronie_1.5.2.bb => cronie_1.5.4.bb} (89%)
>
> diff --git a/meta/recipes-extended/cronie/cronie/crond_pam_config.patch b/meta/recipes-extended/cronie/cronie/crond_pam_config.patch
> index 6c928165cd..c374790d1d 100644
> --- a/meta/recipes-extended/cronie/cronie/crond_pam_config.patch
> +++ b/meta/recipes-extended/cronie/cronie/crond_pam_config.patch
> @@ -4,19 +4,19 @@ configure files instead.
>  Upstream-Status: Pending
>  
>  Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> -Index: cronie-1.5.1/pam/crond
> -===================================================================
> ---- cronie-1.5.1.orig/pam/crond
> -+++ cronie-1.5.1/pam/crond
> +diff --git a/pam/crond b/pam/crond
> +index 560529d..95a6457 100644
> +--- a/pam/crond
> ++++ b/pam/crond
>  @@ -4,8 +4,8 @@
>   #
>   # Although no PAM authentication is called, auth modules
>   # are used for credential setting
> --auth       include    password-auth
> +-auth       include    system-auth
>  +auth       include    common-auth
>   account    required   pam_access.so
> --account    include    password-auth
> -+account    include    common-account
> +-account    include    system-auth
> ++account    include    common-auth
>   session    required   pam_loginuid.so
> --session    include    password-auth
> +-session    include    system-auth
>  +session    include    common-session-noninteractive
> diff --git a/meta/recipes-extended/cronie/cronie_1.5.2.bb b/meta/recipes-extended/cronie/cronie_1.5.4.bb
> similarity index 89%
> rename from meta/recipes-extended/cronie/cronie_1.5.2.bb
> rename to meta/recipes-extended/cronie/cronie_1.5.4.bb
> index 3abca7f920..e16b5d49cc 100644
> --- a/meta/recipes-extended/cronie/cronie_1.5.2.bb
> +++ b/meta/recipes-extended/cronie/cronie_1.5.4.bb
> @@ -16,17 +16,15 @@ SECTION = "utils"
>  
>  UPSTREAM_CHECK_URI = "https://github.com/cronie-crond/${BPN}/releases/"
>  
> -SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}/cronie-${PV}.tar.gz \
> +SRC_URI = "https://github.com/cronie-crond/cronie/releases/download/cronie-${PV}-final/cronie-${PV}.tar.gz \
>             file://crond.init \
>             file://crontab \
> -           file://crond.service \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
> +           file://crond.service"
>  
> -PAM_SRC_URI = "file://crond_pam_config.patch"
>  PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
>  
> -SRC_URI[md5sum] = "703314f58a49ea136e9966d3937d9bf4"
> -SRC_URI[sha256sum] = "370bf34641691489330e708bd4cdbd779267296a030668a12f77b7e36872fd75"
> +SRC_URI[md5sum] = "20233b96997e17a142e1fbe0d7ce8223"
> +SRC_URI[sha256sum] = "af8970559cad4262f8ffd7ec72abf682d2dcce04fdfb8f206a71d96566aba882"
>  
>  inherit autotools update-rc.d useradd systemd
>  


