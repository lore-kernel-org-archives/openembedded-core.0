Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17845.1795526606716902207
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 05:23:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=R9CYVKJq;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so48279225e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 05:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795526605; x=1796131405; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KHPvg+9s6XMGaOU8FjoZVXs9pgPFI5XoY0F1KB9qzDI=;
        b=R9CYVKJqENsMTfS+dEgMI3Ymc9OXA+WCcsIieaXABORkoQ8e73UpbWjcKbbMNig7pH
         +I3s9vZMZcnZ1O+uAKUQ6xGC0S5u6aPxHcFjiNbR05TdIuUW3TjMafbYmdFQw0RQTm/k
         m+ZMPjP5RzOBhBn/QTTguaajj7Qy29mg2LuQpvGBe6FwVwlA6DEHalvWBlb4xV20Wh7h
         f+BP7LW+GviaRnDEFDOvsrEAzNx0YvDQ1QrQq+F/P7wiKxmET7Zwz72U2TYtO8f6w9hu
         CCppfH7ewCzsRE9PJKJ4SmBzWgBut+AsSeiJGCAXOh+BKGrJIBXmjokiQwtCNln+IG4r
         JpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526605; x=1796131405;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KHPvg+9s6XMGaOU8FjoZVXs9pgPFI5XoY0F1KB9qzDI=;
        b=SBTdfXbT1q/RhWihf3ajHyHW4Avzi3gazYZh4KpyYiABLzoVLd6fmTSV2oiIYGK+ss
         fqYLu6SJZHrp5/TGZ8mgMX4k2JOr/lZhPQIpn1liooLQl74qkZ5c9YB+qDn+yt3OeFJW
         2L27zKmBiIGfCe0KUUloOin/QrjAbZzrebFQkYDDUDfBQj5xigK8GOwDMvA6qtmnUrtH
         Sjj97fx2qd+dANNE8Wu699XAh0p5DTtNxvGyKsgQLa67NGmycShhSKYVZeAr+JQcipAl
         3x523VBUbY2AMqAVb7PUErhzSgt5PhjsyaVkrnDufMRvAR8mV8xYRxuYhO0wjEGTn9x9
         J2RA==
X-Forwarded-Encrypted: i=1; AL+hErHvhqB/3zXSlPXNtyVMcGSbsdfr9eulmwhHIA3y4gBAGuCLO3ZGZ4V7vUfZ0fnmKbu4KcWH8BeE0/mW915P3cnvLw==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9fEMNRxj3Cqswc4oJJnQrynrwR/A2GFRQ3MsP7WscAFHh/nyam
	+MewSkY1H3mkvJjZWkcufWRP1+V5BtHGMD8/i+dgG27tyb2tylBocSHe3yJJ4NXRRwk=
X-Gm-Gg: AZFdTZeLpWVcCWp93LedoLpZ1de6/BS7wWsBnmdD7j472DDp47qr3lmkU+j11q+8ncV
	MtgDbnLbwcVJp4WjeEe3dBAEuour2c4ShY4DUGxlAth7Us/v3Rj+3vg5OV6nE7LQ+VFvBN3Edwb
	JAyi1dLiz9ns79ebwb6MV5m/W/MYbDsca+zA/E4Ultm5L68XBxYOPiubg9SM/qQ6PkbYpCmHWAW
	nsxecST2QjraGql/q8XiwBTWZXSd5QlYnGCzkZZXZ7+N2EXHYoJEDr8LS9UhtGKP4givbU2TFY/
	nCKCDLAGcxxMU/6NXmGLET21TTMmgXtz+P34ZgK03pSHQ+4MC1pddm4LDmboOyd59g3qSuPNgG1
	dYWSEQs3ENPzH25MJwi/kAmOzFm0F499r88y40LHGbT167qMIT18KsjaMzp240teRcL+Td5bBkb
	pblrmYYhqldMxO94acGlFY5Os3LdInISYmBBYCwU/r3mxape9fpwyXhdunlpx9+BbjNWzSHqr3s
	P3P6B7cA5P59rMofJh4ibtZ69O5QkYRqOOWqMzbQxKAnLwg6V4tnyjN8KqIfbnZgbaAliX4KPGN
	ZjaB23l6TwCz/6vEHBDDmAdenPlWM1QTR8T3VH3wyJYSnGtNkUopzKL9ebSvEh4YYZjXlEp/uoB
	ZhTylDhenSNwsv+QK1qKEecAQ5xsuJyq/+axYlg==
X-Received: by 2002:a05:600c:5246:b0:4bb:6de4:2f7c with SMTP id 5b1f17b1804b1-4bb8881c5bdmr306931205e9.20.1795526604847;
        Tue, 24 Nov 2026 05:23:24 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm488531355e9.10.2026.11.24.05.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 05:23:24 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 14:23:24 +0100
Message-Id: <DN3H26R12AID.GIRHHR4UJ41G@smile.fr>
Subject: Re: [blacksail][PATCH] pseudo: Upgrade 1.9.12+git -> 1.9.13
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261124131836.800875-1-yoann.congal@smile.fr>
In-Reply-To: <20261124131836.800875-1-yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 13:23:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251032

On Tue Nov 24, 2026 at 2:18 PM CET, Yoann Congal wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
>
> Changelog[0]:
> * test: Skip open_tree tests when the function or syscall is unavailable
> * makewrappers: Don't generate unused _int paths with noignore_path
> * ports/linux: Don't require <linux/mount.h>
> * configure: Require GCC 5 or later
> * pseudo_client: serialize path changes across clients
> * ports: hold the path lock in create and metadata wrappers
> * ports: check created files under the path lock before recording them
> * test-parallel-ops: Add a parallel create/rename/link/chmod test
> * README.security: Add information specific to file/process security
> * AGENTS.md: Add to assist future developers
> * Declare 1.9.13 version
>
> [0]: https://git.yoctoproject.org/pseudo/log/?qt=3Drange&q=3De627b0dcb639=
f387db935fae1f9b93b30cded5e1..pseudo-1.9.13
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch | 4 ++--
>  meta/recipes-devtools/pseudo/pseudo_git.bb                   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

I'm sending this to put it in patchwork but it needs a master upgrade
first: above commit fe4e4f0 (AGENTS.md: Add to assist future developers, 20=
26-11-10)

Regards,
--=20
Yoann Congal
Smile ECS

