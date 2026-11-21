Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25308.1795300095930770126
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Nov 2026 14:28:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=G/dPbP7t;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491971ac844so1842516f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 14:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795300094; x=1795904894; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRbWJT+nJnZblOhETJzjLXRpuNxc6d59YN3zCIR8etE=;
        b=G/dPbP7tLUPDxLmibpgh+Gqwfbw4XiAQCd9VQpv0lm/lnFdKZghH/Om7TFfRB8LrOg
         M+UsLk294ZtS8hP9KeX39P+IKaqOehEDQDgwhH3DX4RijoTKmEPPqBS7fiFqq7D+Ll1Q
         tmqKCGCImnJTPMg6hful3aDLzcSSfm8D6OzMYjt5muqsZKjlwNzGRhRqKLGV4SY2TA9t
         2ROqvct+UmHXBs+9Mf92LNiYfR2NfP1MZJpRZDU62rWMtcxIqMqecfRz8SJPoEbHkA9n
         1Zhtu/bYfTIySxLfonvfDqwVc1U2VtLihuAMc2C9dAJNwpxxZ90ENQxCeea0wdOmcoLt
         Wf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795300094; x=1795904894;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NRbWJT+nJnZblOhETJzjLXRpuNxc6d59YN3zCIR8etE=;
        b=t7fWig+ZT58jc0wC55TH+WUIh/ZKAtEHkkllLEMqoqEI0EZVBbIzOaFiRnyKVcGwzy
         6QdRB+ya9ZOIyodEs9Ymi3V9/sQQuiZ5UJvCLnQI7qE3NPJWfF9A9R6+K7ml2j3qIfV4
         XZ9WvM9y+JQRnXZd23IcC6upLjk4ToLuFf1T6fm5n0Ndynrm7OuELuAQVFfEQWJcfC8H
         ofaglEt1QfnjHu14naTTi+GDU50bz6VzTwfJMkV37/a6VXnnkTrLuea067OxG0Ox4ATi
         26bLbRkhJEG5wGgB9+TD3gG694ZCM/DdQq3h6b6EwBKXt+D4XFq53uFZiNwcswaCxbrm
         WAyQ==
X-Forwarded-Encrypted: i=1; AL+hErEP+IlYawRbQHIKyrgfFnl2oehrPrEe+tKJCTdZxbHvmfILI4sSWGTF54t7uyj/CNZMLJPbrWZZoyVpjg4G8PPjcg==@lists.openembedded.org
X-Gm-Message-State: APuU4Z+m8vGhfx58Kd9CeF9gUprx8raM2Nuv7whRKshBn45GFX0FaeR6
	sxZc6Oxdkftbkgw4dUU4HC6q1uLME0p7d58Tr7XhCjwQgnz11f7OpRp1LZa5B9nBLWzxjmBj2Lu
	hQ0OqMG4=
X-Gm-Gg: AZFdTZcoDG/F/fDI2J8PBdXU5rN8m1kj6a5hFYO2NplcQPyJEf7nWlSJIxdlJpuJQMM
	hPbQHVSQzrb3wY8YVzaYkMBr3hrwO3LG0Gn90KXzs3bkPHd88FSTVZcvv02+RF+jkmhcPcO0rxG
	g3wK9Db76ZqGQCR1Kw4/Yx3C9hQjLcaLdCQaO7qEgMgK3s8PMtx1MBVfo/KEpEGpqdrCsoHzVL0
	YeBn0T7QWVkf/Fo2zJFExO23bFMIFsFML6eaDMCa68jgn/smeajEIUGhnQtrtTxf2ynZ1p+Onbj
	QVBtAO3faQ1KlXaLBQ0P6ih/MEAq0lpU/yUnJjUuRM7F0CObg/wmN/0EZbVGCeMgIYaHhxe9PAv
	kfXk/Hpg5VatnyaNdg25IL7EHDzRU1wLV6IPU7+4KKDvFibuNb07S5CMGSCfxB+F4iz+Hd8whnR
	JjEu4CHKmKmyGzL5ENJmh7VPfJ27ahxzIWO0s55+wESNicZyUwIeycTyjxcOyumK4OiyhwO1I/a
	hRmG66y2xFqa7Y83oWqxnFiRb30TOWncp50DZXz3UnjmJWPyzxKVqqWejZTy/gWDrDGmh88JA10
	GDoBTGP56kLmP3LlgKwDG5vqsiD3xgbseO7JW0tSL5pEOd6aq8dlq4NjiXARviVIrN9OVPv0TMQ
	/X9ptLA4sCIQN3gow
X-Received: by 2002:a5d:64c8:0:b0:4a6:c5f4:cdf7 with SMTP id ffacd0b85a97d-4abaa976b7fmr13300593f8f.5.1795300093787;
        Sat, 21 Nov 2026 14:28:13 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa0009d38a8173e0a09d.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:9d3:8a81:73e0:a09d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm12632898f8f.26.2026.11.21.14.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 14:28:13 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Nov 2026 23:28:12 +0100
Message-Id: <DN18ROW5HVTW.25YP9YGBIMAZQ@smile.fr>
Subject: Re: [OE-core][scarthgap][patch] systemd: rate-limit tail timestamp
 refresh during iteration
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261116145033.2369325-1-vanusuri@mvista.com>
In-Reply-To: <20261116145033.2369325-1-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 22:28:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250855

On Mon Nov 16, 2026 at 3:50 PM CET, Vijay Anusuri via openembedded-core wro=
te:
> Rate-limit journal tail timestamp refreshes during journal iteration
> to avoid unnecessary volatile mmap reads.
>
> Fixes: https://github.com/systemd/systemd/issues/42521
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  ...limit-tail-timestamp-refresh-during-.patch | 95 +++++++++++++++++++
>  meta/recipes-core/systemd/systemd_255.22.bb   |  1 +
>  2 files changed, 96 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0025-sd-journal-rat=
e-limit-tail-timestamp-refresh-during-.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/0025-sd-journal-rate-limit=
-tail-timestamp-refresh-during-.patch b/meta/recipes-core/systemd/systemd/0=
025-sd-journal-rate-limit-tail-timestamp-refresh-during-.patch
> new file mode 100644
> index 0000000000..0f30978bce
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0025-sd-journal-rate-limit-tail-t=
imestamp-refresh-during-.patch
> @@ -0,0 +1,95 @@
> +From 46e1b78bb2724e9691e4c91b7b4b8559d218fbfc Mon Sep 17 00:00:00 2001
> +From: dongshengyuan <545258830@qq.com>
> +Date: Wed, 24 Jun 2026 13:01:32 +0800
> +Subject: [PATCH] sd-journal: rate-limit tail timestamp refresh during
> + iteration
> +
> +journal_file_read_tail_timestamp() is called unconditionally in
> +next_beyond_location() for every file on every iteration step,
> +resulting in O(N x files) volatile mmap reads. For large queries
> +like 'journalctl -n 1000000' this makes the command unusably slow
> +(~5 minutes on systems with many journal files).
> +
> +Rather than suppressing the call entirely (which would make the
> +inotify path fully load-bearing for cross-boot ordering), rate-limit
> +it to at most once per second per file. This reduces the overhead
> +from O(N x files) to O(T x files) where T is the iteration time in
> +seconds, while still providing periodic refresh as a fallback for
> +any missed inotify events and keeping cross-boot ordering
> +reasonably fresh.
> +
> +Embed a RateLimit struct in JournalFile for this purpose.
> +
> +Measured improvement on a real system: 5:24 -> 2:39 (-51%) for
> +'journalctl -n 1000000'.
> +
> +Fixes: #42521
> +Regression introduced in: #26355 (34af74946e)
> +
> +Signed-off-by: dongshengyuan <dongshengyuan@uniontech.com>
> +(cherry picked from commit 8f8ab4bf98f930fcbbdd7efcbba8577981d31df9)
> +(cherry picked from commit de01a0f78f833208fb9c8eca69bed6420b0e7e65)
> +(cherry picked from commit 578dc90e6c4a87ad77927c462f5c42794c464c4d)
> +(cherry picked from commit c066fab7052e41b2de4893488fdd39a0c3db4fef)
> +
> +Upstream-Status: Backport [https://github.com/systemd/systemd/commit/46e=
1b78bb2724e9691e4c91b7b4b8559d218fbfc]
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + src/libsystemd/sd-journal/journal-file.c | 1 +
> + src/libsystemd/sd-journal/journal-file.h | 2 ++
> + src/libsystemd/sd-journal/sd-journal.c   | 7 ++++++-
> + 3 files changed, 9 insertions(+), 1 deletion(-)

Hello,

As far as I can tell, this commit was backported by systemd upstream in=20
https://github.com/systemd/systemd/commit/c066fab7052e (v259.8)
But current wrynose systemd is 259.5.
Jaipaul sent an upgrade:
  [wrynose][PATCH v3 0/8] Systemd 259.10 upgrade
  https://lore.kernel.org/all/20261117115126.14374-1-jaipaul.cheernam@est.t=
ech/
... but I have yet to review it.

So, this scarthgap patch is blocked until the above upgrade merges. You
can speed up the process by helping review it :)

Thanks!
--=20
Yoann Congal
Smile ECS

