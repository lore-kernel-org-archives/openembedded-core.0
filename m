Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10775.1794664130448085364
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 05:48:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=U8+zxe8Z;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dee593f18so2353572f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 05:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794664128; x=1795268928; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cX+wxzKmSR8wZCYlk0NAKJphzLTYY4iFoAAoKr+Dne8=;
        b=U8+zxe8Z+VnMYgi8Qeh3Dy6ig2dqtj0zmYdySkP1I80KxHYN/ZvAJ8BQmG/stJ3bdi
         tU7Gy3NEbO2gH+WMyStL7L0twy7M3YbIMcw4HiCJG7hJQuYHuqttwcRp9u1C35cdxaA2
         K6saGBD7joJpMGXMpWulgfqLxIdVfP/4UNDs8FuIKsLcs9yxKZWhuuRY2WcL9GQI4CSp
         PjR/0Jav4RinTAfov2chMaSsS2EN2pisPHh50ryTZ20Vd1EZYN4+BPbQK2HqHeWL8WHy
         RenFd20oha3RmlmN8rptenBxISy5DUeWyxtVvDf1Rj3Y/3JjdNuLa9L/mTGW44GBHjXy
         qdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794664128; x=1795268928;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cX+wxzKmSR8wZCYlk0NAKJphzLTYY4iFoAAoKr+Dne8=;
        b=bErIRZk1faX8aWHdl2gp6HDoT/YNof2k5j6qtPgdbpyTN80+Ph0R7BmrIkfjwVr0UB
         nj6NSlr7aSMYg490aHkM7A7wF0kjmzBkAqHCqNMUQoFlLF02T1o5ArErA2ePMH8jLyIG
         H1aNpfGXgMl+H2dXTx0KwYMt81I9yzfv7lRnflrXYbvmuvQYIF4OZFEXHRvLg8/aGLI4
         o8qDilJNscA1YtS4Vutulgi3yEnRQBO1NVmbKfkO/JLSSeQXBj2sNUA7s+esq5vpEVGM
         jevW1+Of6mXlrr4fHpriuYsdHjuLKkf8VgeZCb6Moyp2zPftxg9cBAoVW9suD8dJkmIS
         WuRg==
X-Forwarded-Encrypted: i=1; AL+hErHyWLuPRtt6y/rzRIrJ3//XNDlN+xEITItcES9FShNVK7aGbaNRA1+Yzrjn5vbv8tgpSTmnIjrsN7JrLHJN1T7YFQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z80ZJ5lZT95TRi64O838p8zMlwBXsZ84c+UScJAZXYCKyZupobY
	DgU6Qo8RP4sTPCmlwLdDKlqHNMcMMX2xlOosziivk68SNacUmg7MbFbQKGE7zihgaDSzcHgerLZ
	leZu8PK4=
X-Gm-Gg: AYBFou3KEGh+eQuQbuUJ2B6jMtT2ru6Ap/Rh6LeFGVXGGeO7nfUKfC57ng6yKsO8lk+
	u9aSl9k2YVLHK4hg+RnDAQx+j3kPNfPIxTVNcIzLIg+Dsav9ysbJSznFfLBU3z3ztKGziehQTtb
	r1C2ql4QuzqPzNcmQs6/m9zyZPpAFNvfRVipIrtnJzPjlJvPrNkPQQEHpbIZeBUY/dhxbm092RB
	/JOsA2/Gwfh4wzHsTMS7oTntbLk/DWHSY0yeE6XAZgiV/gLOcc2n8cUeAo06hTn0mQ25tmYohqU
	257QpvmXqDjc+JSSEEdAiRsJIAaLW+PPTwdlsmzX5x4jUDbuHSUrOTgtf5vJ3v5rfeHYefpyzvT
	qgsVp/284s7NTd7YUC7n09I8C0o1JQBwZUC3k4gFC6b144ddpHu43vCwgVGSnC6NIMUV+IuYb86
	mS/ZqsVM0w+qyWCvgbBdMuj2pt4haC3FdESRQZpsrfeqY8QOENQSZdlDfsnmO4XMk5vanHlK902
	TgRjLf5iOxm7ZF3kQtMAqkUc3EFqwCn76nAJGVRR3VzsitoG5EGkCwGlc6jGEerkOgLkOKAaPyG
	ghllJ5Xlfdk8WUFEwwm21zxbw9WaV+Pz/LZZuVszEZ5rLzEQXo2ctYHK9pyeTerm3/A+LYP9+fq
	DerWH9llJeEUZM7OP
X-Received: by 2002:a05:6000:98c:b0:491:49c2:3b3 with SMTP id ffacd0b85a97d-49c71d48644mr11412018f8f.51.1794664128503;
        Sat, 14 Nov 2026 05:48:48 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c18b9sm9184957f8f.20.2026.11.14.05.48.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 05:48:48 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 14:48:47 +0100
Message-Id: <DMUZC6JXWO2M.39O0FWABUZ5HY@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH] libsoup: fix CVE-2026-0719
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <Randy.MacLeod@windriver.com>
To: <SaiSireesha.T@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261106160329.86073-1-saisireesha.t@windriver.com>
In-Reply-To: <20261106160329.86073-1-saisireesha.t@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 14 Nov 2026 13:48:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250203

On Fri Nov 6, 2026 at 5:03 PM CET, Sai Sireesha via openembedded-core T wro=
te:
> Stack-based buffer overflow in the NTLM authentication module when
> handling excessively long passwords.
>
> Backport from [1].
>
> [1] https://github.com/GNOME/libsoup/commit/1972635264f1d9ab1823c8b6becf9=
21b4125b513
>
> Signed-off-by: Sai Sireesha T <saisireesha.t@windriver.com>
> ---
>  .../libsoup/libsoup/CVE-2026-0719.patch       | 191 ++++++++++++++++++
>  meta/recipes-support/libsoup/libsoup_3.6.6.bb |   1 +
>  2 files changed, 192 insertions(+)
>  create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2026-0719.pa=
tch

Hello,

I think master is fine for this CVE (3.8.1, with the CVE status you
sent). But blacksail (at 3.6.6, like wrynose) is not fixed and need a
fix as well.

Please add an explanation as to why you think this is the patch to
backport to fix the CVE. Look at a few CVE fixes on the stable branches
to see what I expect.

Thanks!
--=20
Yoann Congal
Smile ECS

