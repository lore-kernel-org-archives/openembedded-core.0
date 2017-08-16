Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id CA6D46FFC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 05:18:36 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id l64so18099978pge.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 22:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=GtxCdlR5WIdqDOsrqGFLRcFyplrdKDGv3mqoCjSzDO0=;
	b=dAVxARp4k7WIiaz2Q8PBrqyGEEDUr6LrIjP8akyFo2xVtkpw17mwqEIPWD5aKzLIl0
	wOJSTzJJqX509a9Avt5dl5Amjapk8OreeHAfnND+0FBerE8+Cf453tiV7ml0IPXC6CU9
	YGqpmDIZKKD2AlIAS3G2CpE9cGOV6caxQOSr3r86NZQjqCw+kAWM60KMjUiAN1Wm43pc
	zikDZxsIGtum0gpfgBgY2X/9v2YyXbWLjBwAFqqToP9VOVokzV3EvmITkoaTP27/RxSt
	fnQjaICA+nB+N13rJGc8thqcf3QE7f8TlAkuJosXX3Ubr1YhTUFzr/RfEiv18IJKhOsJ
	6SRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=GtxCdlR5WIdqDOsrqGFLRcFyplrdKDGv3mqoCjSzDO0=;
	b=pQGhyY6gtQSjPKgtYpE1gWUnSTBfRDip3zCgKFK26oPiGBfGqcPmiZ6jnvDwc/XSOw
	4MqFFynZu8vqO+4+Cs8wFMcQogJ1SXhwtx9L18z4sR9Hj2nLeYPK64x8bSp4/YEIGsaI
	TeeOuRphqBDtZYi8wDDzMSDguX5XCxmqOlXo+wFVwzr29zwj8JS4/NyTEB3CEH0fthND
	SdIfKDHXdGk+4ylkTrZ/9rI+2tsSFpjs+QKmXeG+0n1ZwdQlG6gMpwbeLsg0o5cV+yUP
	2k1jhDL/9ygYBXSKeomgDTohXdHcVyHkiG4ez971vtkhQFX2UtwJMtzUGlkcPEbeipnQ
	uY6w==
X-Gm-Message-State: AHYfb5hxXPVo7jDwchBG0/RF58jNe67RDuwXA8mpmYjZbBhR5wisAxSZ
	8uhr4HrZYwb6E3kZ
X-Received: by 10.99.126.85 with SMTP id o21mr482797pgn.57.1502860717980;
	Tue, 15 Aug 2017 22:18:37 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:9b7:5cee:9e0b:bac6?
	([2601:202:4001:9ea0:9b7:5cee:9e0b:bac6])
	by smtp.gmail.com with ESMTPSA id u186sm73692pfu.82.2017.08.15.22.18.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Aug 2017 22:18:37 -0700 (PDT)
To: =?UTF-8?Q?Richard_R=c3=b6jfors?= <richard.rojfors@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1502086865.13610.1.camel@gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <98330a2f-176a-fe69-c2a5-bcf414c4fa3b@gmail.com>
Date: Tue, 15 Aug 2017 22:18:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1502086865.13610.1.camel@gmail.com>
Subject: Re: [pyro][PATCH] package_manager: Fix support for NO_RECOMMENDATONS
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
X-List-Received-Date: Wed, 16 Aug 2017 05:18:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 08/06/2017 11:21 PM, Richard Röjfors wrote:
> When support for dnf was introduced the check of the
> no NO_RECOMMENDATIONS variable got broken.
>
> This fixes the issue by compairing to the string "1"
> rather than the number 1.

merged to stagging.
Thanks,
Armin
>
> Signed-off-by: Richard Röjfors <richard@puffinpack.se>
> ---
>   meta/lib/oe/package_manager.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index 93d079d73d..28c6b2aec2 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -585,7 +585,7 @@ class RpmPM(PackageManager):
>   
>           output = self._invoke_dnf((["--skip-broken"] if attempt_only else []) +
>                            (["-x", ",".join(exclude_pkgs)] if len(exclude_pkgs) > 0 else []) +
> -                         (["--setopt=install_weak_deps=False"] if self.d.getVar('NO_RECOMMENDATIONS') == 1 else []) +
> +                         (["--setopt=install_weak_deps=False"] if self.d.getVar('NO_RECOMMENDATIONS') == "1" else []) +
>                            (["--nogpgcheck"] if self.d.getVar('RPM_SIGN_PACKAGES') != '1' else ["--setopt=gpgcheck=True"]) +
>                            ["install"] +
>                            pkgs)
> -- 
> 2.11.0


