Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5141.1794351476192350559
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 14:57:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=KQ+WcDzr;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so23962045e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 14:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794351474; x=1794956274; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XUVvJsjAYyTMxV/oW+dO27jTyFMDxTEK4cGOG1upMLM=;
        b=KQ+WcDzrsdLA1CDJLat4HVfDA0KpWXDyzDwFxP3MywkubyfCwI6u+GETS8xZ5yxbfk
         lo6vFtiCANlsAC2IYwDlAKA0qMg5752qQ2kcJ60tlv7EeIQQfl0MfRcgPtpm6485LC7p
         Q++deH0FqlMYbXJzd+tOondA7VabuCgztWUKCIuvPAWUA3Rc1d1oB1nJE2KjJN5f2dII
         ivjcRPOT+O2loVBKeXWDxcp7JAerrc7aZNO5nt2MJL8nVTXOUCRxF2PZKjN1NIG/qhH0
         1SWnuCTEqe0fqFynFa6AMCMY+fxdzb+dDdmUnH8+CIWtpi9AqJGlPoij7XEdyHBLQdLC
         WKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794351474; x=1794956274;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XUVvJsjAYyTMxV/oW+dO27jTyFMDxTEK4cGOG1upMLM=;
        b=ho/OBepmfxfuafpYM3TRoAGoRY1/KJfyAVCsgvoUxBVAb/5xoSTRcaZ9ZtpuXqnCf/
         XXCL2eUGqEkGb1f3b4tcjvXLXoYIyHrbsfQsnPZgVNbtQVKIBtSpFPEL0DFZ8Rsi+C3X
         nnJPHhLktrsQn4+T0HP5Y/0tYL9jgpUi8QGKIxvLmsQQinY/nIoaRLJInakGH+Gj9jsx
         yjDqpG4Wl2FqJsip+BeAZMQcTXWY2E6REqgXHS/zuscm0k3tDJWc74uzU4IXcXBaZB50
         kKhP8Z3qvFqV/A+I3FpSDcjW4mQhyFAcR4OG4iJrqdbrPpcUoBztEpxH/Q8AaRyqYj4q
         IGig==
X-Forwarded-Encrypted: i=1; AL+hErFnia66O+9SrV2t4D0q+gqcXjrHZ0MhulWvL0O9/07Hej/Gw7E0dQRJdBLZBMo7DT1xXjHmDUk+YIibZoFZk0KXqA==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9mz8QCVU5l/eSUf7MCif5ymiZ1/Tq6O0YuyQok9asWvfdSDQv1
	YSWiQfobWJ7GCqwebMsqrxKkCor7KKwy45PY0O3CqdbCVTlB5Gs2dEoPdYJnEU+LLdw=
X-Gm-Gg: AYBFou0sqkllfaoS2aKQmeGjniwZZzJh56ggii6koNfkZVxqtevmXdzf8vQr3O0DMay
	Mc/LB8XvwGGgKxFQL9XEWJeuMXIlWm8NP7RFMPKlFOBrtPTXOCMzUASnrOP8CWnVcpYtSqoELdk
	+7NqBrTjC6xsTV/jDgLWH/SqB661PEmjYsj9j/bikKBzt7fSYgUAmgdKQNlBWJ0mX+bcW71mALv
	04SIqH4EiAjXb2PMtQ0zTukBVy6OxVJ/WS31spB94lKD/QTcgkUnbTDRxmN8YP7wkCiAeF1trza
	wirDdIEM7TJ+seMsXMm1LHUuW4fqGnmipXRFo8Aot8IWlIVVu7DfJP78wVmphIzJe8vazrfM+0I
	e/oES0Tq2hU8psOcenPabykF9mpUCqBPWgnLfGvZkQU5CUZPhCc/WjH6SpHI7BGKqXUi2s/svz3
	LaSX7Am4z4nR9tBOx//nXNgjs0yHaWVad8UMYkqS7gyS9fi/ii2qpa7zr/9gdHLhRqijC22X3Lx
	EhV0X2bSsAyIpYHGu9gAiXVmCB/7l0TUTH/yTUoxjhG3NZu9t3igGA5MKXqc2JSQL+qcR58q0YC
	Toi/FrP1TokAJP61+2QrLKY9Ict4tFE2ubreoABIbO325kI/blxZt6nJe0B2r147R8kzU2bOzcj
	tcdxR9NTqIjlRwWC3NScgqjIH7MgrYU9aKhfNpQ==
X-Received: by 2002:a05:600c:81c5:b0:4a1:efbe:529c with SMTP id 5b1f17b1804b1-4ba09375bffmr8114575e9.12.1794351474264;
        Tue, 10 Nov 2026 14:57:54 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba020433casm89348455e9.7.2026.11.10.14.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 14:57:53 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Nov 2026 23:57:53 +0100
Message-Id: <DMRWIF70HREY.3QS47OLJ62J68@smile.fr>
To: <rybczynska@gmail.com>, <yocto-security@lists.yoctoproject.org>,
 "OE-core" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Yocto Project Security Advisory: CVE-2026-123158
 (openssh with musl)
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <CAApg2=RBygWWkQi9HtLHAbzdyTJGb7SLo=RJn8tcFyve21LdRA@mail.gmail.com>
In-Reply-To: <CAApg2=RBygWWkQi9HtLHAbzdyTJGb7SLo=RJn8tcFyve21LdRA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 22:58:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249938

On Mon Nov 9, 2026 at 4:50 PM CET, Marta Rybczynska via openembedded-core w=
rote:
> Yocto Project Security Advisory:  CVE-2026-123158 (openssh with musl)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>
> Published: 2026-11-09
> Version: 1.0
> CVE: CVE-2026-123158
> Severity: High
> Affected component: openembedded-core
>
> Description
> =3D=3D=3D=3D=3D=3D=3D=3D
> In OpenSSH before 10.6p2 with musl, in some specific configuration
> with pam disabled and password authentication enabled, password
> set as '*' (disabled), any password between 256 and 1024 characters
> succeeds.
>
> The issue affects systems running openssh with musl, and PAM disabled
> in the openssh configuration. Therefore, the issue does not affect the
> default OpenEmbedded configuration that
> uses glibc and not musl.
>
> The vulnerability of a system depends on the user configuration of
> system users. Accounts present by default have a configuration
> not allowing a remote login (except the root). The root account access
> is not affected if the default 'PermitRootLogin=3Dprohibit-password' stay=
s
> set. However, in the default configuration, PAM is disabled by default
> and password login is enabled by default.
>
> Affected releases
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - master, before commit 5247d0d8862c3402ac061fede5844da4d5c4be4c
> - blacksail, before commit 3bbd2a4f81f368ae7eac580949e4717f7aeb4f06
> (6.x up to 6.1 included)
> - wrynose, before commit 2285da08068a6d1b4a64c9a52d85a58be50e4679
> (6.0.x up to 6.0.4 included)
> - scarthgap (fix in progress)

Hello,

We just merged the fix for scarthgap[0].
Affected scarthgap releases are:
before commit fc4316861becc9f0d41857b49f6438929ab4c291
(5.0.x up to 5.0.21 included)

[0]: https://git.openembedded.org/openembedded-core/commit/?h=3Dscarthgap&i=
d=3Dfc4316861becc9f0d41857b49f6438929ab4c291

Regards,

>
> Mitigation
> =3D=3D=3D=3D=3D=3D=3D
> The recommended solution is to update (see the section above)
>
> If an update is not possible, and you are running a potentially affected
> system, follow one or more of those mitigations:
> - Make sure that for all accounts that have passwords disabled (* in
>   /etc/shadow), home directory and shell are set to values not allowing
>   system access even if a password were set, for example
>   :/nonexistent:/usr/sbin/nologin
> - Disable password authentication (key authentication is not affected)
> - Switch your ssh server temporarily to dropbear
> - Manually update openssh to v10.6p2 or later, or manually backport the
>    patch linked below.
>
> References:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> - CVE entry: https://github.com/CVEProject/cvelistV5/blob/main/cves/2026/=
123xxx/CVE-2026-123158.json
> - Fix commit in openssh:
> https://github.com/openssh/openssh-portable/commit/4353fdc43ef646c43a8dda=
7025cc1a898caf1482
>
> Security contact: security@yoctoproject.org
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D
> 1.0 - initial advisory

--=20
Yoann Congal
Smile ECS

