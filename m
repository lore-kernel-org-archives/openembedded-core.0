Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8155.1794648587116359683
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 01:29:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=BjXuxMBO;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso9721105e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 01:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794648585; x=1795253385; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZL1R//wSktyklXbVfngB5FNVq1PeXVEC/liY5PeqY0k=;
        b=BjXuxMBOcAAkzydcd0occstuVYXahxb+jDu2RvqqENwy+Y3VwAdIbz4kaqYYvHZoC+
         i0Qr/uiMgGjkUeqwH0JPBfi8MuZZCmWTL4eqW2b74iwFoQiLtlkkLzJrkC0/t8g104Dy
         HIIb06KyBplAeEeP+q1DHjxjtBpxlzESyE7Fmkx0zdigUvU6KkfDiIjmryyozt+4GdPB
         k+UMKmDvQNTLHyKxRiFNyJK5Wryg4qQ5kewEMnr3QJVGhQcs9ZTB+B7NCwfbJ6ry/A3d
         Bb9xam/adKGNLwgDE8ZWk2ww7IysrHxGiroP5y0tm+LppElZQx0h8UE2GnhNA2uWbWOf
         gOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794648585; x=1795253385;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZL1R//wSktyklXbVfngB5FNVq1PeXVEC/liY5PeqY0k=;
        b=HEiAxmagXzsXvH0kKyu4hx4+6zpbKsKnRmHQwBmUK0P4Un4j88Z/DZVk+CJEs3hLc6
         AMZ4xnFTcK/HPvufVNxDgseDhRnbVIxEkSQhoUNUY389iF66D2N+NcYpbwA6LQz3C2q0
         O+MsHy6yQHXXxVzjJpnxz4uBXCQda6alxut1cwhisLlq7BYg/WLhBzUk4Zm7Ok5ZTsDP
         WWY9ZELhgp3ERnuAxkwUx+jwPeybt+WrrwnXI5qpBr97HTgOuYHxezvSLRC2gM4A5lnz
         2fJY5INy1mKauhJhI7zEbzTgsI2JCIye+f0uvesWSdrSKup3kU7aXLbSJxglNit3Gdhq
         g9HA==
X-Forwarded-Encrypted: i=1; AL+hErEh3XeN1wRPD9Oz8yDbtOKHYuiFWDUFG3s3U0vkDY5fOgzMeaR750KpuGfWRafdTszgKn4ld0Fvx8oI79W5SC+y7w==@lists.openembedded.org
X-Gm-Message-State: APuU4Z92bAPJrkIdGdfAastnIqIxMv7vQXCIwCy67gDnVFonK36gPN4/
	v7fltYGEa6EXGaqWydfkLsTUNU2BrKkvx5XrYfXK7U/xvwNo5d6GGwkOHnuj7sS+wBVqfNrtUhV
	Ow7gA+3U=
X-Gm-Gg: AYBFou2OvXXCar3x/ayXqChLTIqy6pWulKiVJ6AjNoqioxLxnZazYr4Xaxj/F7+suFq
	aJ8cdswMdOO/MeJZWgO3KaKUnFpOjUM0ogzi3y3KGBfu++FYl7xuUBWAWUDfQWhRPIfL1eOvrWH
	ab8nKzzDvDywPhNaj6mrfTLT8MD99BRGqAOksO5qKMZk8YoVsM2blks+dLmghxzs4ykGC9+6THJ
	BQZeUicgFP9jjhY6o7vC6yAGsg9Uo8v/lm5YZpRas8UYOqrTPnG9twLDlnQFOPYnh4+0J+Tdi95
	TVurJYktQYuJxeGAZ39HgTs6kIT9NXSl0loOyFkxTtJT0RXZf1S00kMaCotpsKwVWqWt7Kfy5Y0
	KVYkUM7u+dRzwu/k+21YUM01oNe5vFW7y0tGZ1+ka2yBYwT7BzVDyADT/Y2e0fl3AaDpmzEo3qc
	mR0VHVbs5rFe4nHwWE8owAfrl4mG+oVj7lRU5/Tx+eGUqzXgh08oXKJWcuaI9Ih7TMl8eOxDwLh
	lE3pr/1SuPvIMHeAFBmqReCpMp4MsdLZv5wuGk0LLlAzgM4FKfS0rj9YkQp5T2EnhRNhM2wOCqT
	b9YEUTGm1CX9uYf57sYdMJX0GQPYYdhbB8WXtKYcG6H1krwb+3aRVX2U+sN8bXjLkfat6QcbAUD
	LuH45p+uOigrAhSt8dr63adVAHtIjuM1M7lYQ4g0=
X-Received: by 2002:a05:600c:8906:b0:4bb:5f07:10dc with SMTP id 5b1f17b1804b1-4bb5f071358mr47239165e9.22.1794648585123;
        Sat, 14 Nov 2026 01:29:45 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb675200e4sm11973305e9.0.2026.11.14.01.29.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 01:29:44 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 10:29:44 +0100
Message-Id: <DMUTTTXCWG6Y.364L207D2X0YQ@smile.fr>
Subject: Re: [OE-core] [PATCH] libXi: upgrade 1.8.3 -> 1.8.4
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <OmkarAbaji.Patil@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261021065221.2964406-1-OmkarAbaji.Patil@windriver.com>
In-Reply-To: <20261021065221.2964406-1-OmkarAbaji.Patil@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 09:29:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250200

On Wed Oct 21, 2026 at 8:52 AM CEST, Omkar Patil via lists.openembedded.org=
 wrote:
> Security and bug-fix point release;
>
> Fixes the following CVEs:
> *CVE-2026-93541: Out-of-bounds read in libXi's XQueryDeviceState().
> *CVE-2026-93542: Out-of-bounds read in libXi's XI2 class parsing via size=
_classes()
>                  and copy_classes().
> *CVE-2026-93543: Out-of-bounds read in libXi's XI2 class parser.
> *CVE-2026-93544: Out-of-bounds read in libXi's XI2 XIQueryDevice reply pa=
rsing.
> *CVE-2026-93545: Out-of-bounds read in libXi's XListInputDevices().
> *CVE-2026-94281: Out-of-bounds read in libXi's XListInputDevices() class =
parsing.
> *CVE-2026-94282: Out-of-bounds read in libXi's XI2 enter/leave/focus cook=
ie conversion.
> *CVE-2026-109089: libXi XGetDeviceControl Control Type Mismatch Heap Buff=
er Overflow
> *CVE-2026-109090: libXi XGetDeviceControl DEVICE_ENABLE Heap Buffer Overf=
low
>
> Reference:
> https://lists.x.org/archives/xorg-announce/2026-October/003752.html
> https://lists.x.org/archives/xorg-announce/2026-October/003754.html
>
> Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>

Hello,

This is now merged on master, thanks!

But, in the future, use the uncapitalised recipe name: "libxi" not
"libXi" (capital X).

The unexpected capitalisation might hide the commit from tools (mine got
caught)

Thanks!
--=20
Yoann Congal
Smile ECS

