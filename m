Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFFB4C7EE25
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 06:06:06 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.7023.1686290762768189948
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 23:06:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=A+UIDaoo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-30b023b0068so1043686f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 23:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686290761; x=1688882761;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CwcqaNUhWXayLQB5ZZ8Xm2/JRcOWKK6i+IOL5TvwenY=;
        b=A+UIDaoo0lsAYm4M2NOJRfpZbm0D2ebfp4v6jiYge0XeXkbaSRYdSl33waMwqGQWYp
         F/hmltSis3QM/oL6GGX786xEX4ZFkzT5sqnsAhJDn4LYalPvAR5C+2FEbTzubj4f/k4U
         5NabdPRf2caSt76x0nQXP9blSZh5AWM1v9rLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686290761; x=1688882761;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CwcqaNUhWXayLQB5ZZ8Xm2/JRcOWKK6i+IOL5TvwenY=;
        b=mF6CUlCF9VFNWBR0YxnsbhPLwtB+Pc2/lO/0bOFgjzZhCww2AER1xh8D2UxpfsdZO0
         J42+vXOnVGF1gqcplGpXGRTtKS7q6zbm557mw/vRyCxsl8N6IWj1VRECdxDroFjlEGL+
         opXjFHBQke4UIOPOBQiM3jN+hYvXBCL0vpFumM4LDFvsFAIfSYYU+8hgU7gvd2aI1kdn
         MewSZBCm1DN//MKiXrUYeLDmu53MZEYL6i4ySS9xK1eIWFjxjFPA2asJqICCfTjIjlze
         PbjtMsH+r9rvC+ZcggUMLtjez7HZatRwfoLSaEAoJwnpsB8N5KbgA08SDLJb3xDz49T5
         qtng==
X-Gm-Message-State: AC+VfDxIc9dFcDV7uu0/+dG5e1p1ozI4M4zlM4XGI+njCSJ5jiPGdqsg
	pMZTrhafAD5KRoI3THFGdJjJKg==
X-Google-Smtp-Source: ACHHUZ7V7fO2+8zP15UChBEQagY/6bgJu4unC/WVgl8K/iAUsEKWkgGs80+ZAOj5BNM0jKeNLAEgWQ==
X-Received: by 2002:a5d:42cc:0:b0:30a:aeb3:f3b0 with SMTP id t12-20020a5d42cc000000b0030aaeb3f3b0mr3643001wrr.17.1686290760971;
        Thu, 08 Jun 2023 23:06:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d212:ac52:2ca3:dd2f? ([2001:8b0:aba:5f3c:d212:ac52:2ca3:dd2f])
        by smtp.gmail.com with ESMTPSA id t18-20020adfeb92000000b003093a412310sm3405026wrn.92.2023.06.08.23.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 23:06:00 -0700 (PDT)
Message-ID: <3871317432553f8027c3c0d6aabcc186d6f32b07.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/2] qemux86/conf: TEST ONLY. Drop smp boot
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org, Paul Gortmaker
	 <paul.gortmaker@windriver.com>
Date: Fri, 09 Jun 2023 07:05:59 +0100
In-Reply-To: <20230608193901.363242-1-bruce.ashfield@gmail.com>
References: <20230608193901.363242-1-bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 06:06:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182532

On Thu, 2023-06-08 at 19:39 +0000, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>=20
> We are seeing intermittent boot hangs with x86. Once of the last
> messages in failing logs is secondary cpu startup.
>=20
> Dropping us down to smp for testing to see if the hangs start to
> go away with smp removed.
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/conf/machine/include/x86/qemuboot-x86.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/machine/include/x86/qemuboot-x86.inc b/meta/conf/m=
achine/include/x86/qemuboot-x86.inc
> index 6ae03633ae..54a12119a7 100644
> --- a/meta/conf/machine/include/x86/qemuboot-x86.inc
> +++ b/meta/conf/machine/include/x86/qemuboot-x86.inc
> @@ -1,6 +1,6 @@
>  # For runqemu
>  IMAGE_CLASSES +=3D "qemuboot"
> -QB_SMP ?=3D "-smp 4"
> +QB_SMP ?=3D ""
>  QB_CPU:x86 ?=3D "-cpu IvyBridge -machine q35,i8042=3Doff"
>  QB_CPU_KVM:x86 ?=3D "-cpu IvyBridge -machine q35,i8042=3Doff"
>=20
>=20

FWIW, this patch didn't change much. With it applied we still see:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/5168/step=
s/12/logs/stdio

[    0.634735] Freeing SMP alternatives memory: 52K
[   12.275510] smpboot: CPU0: Intel Xeon E3-12xx v2 (Ivy Bridge) (family: 0=
x6, model: 0x3a, stepping: 0x9)
[274491.955544] cblist_init_generic: Setting adjustable number of callback =
queues.
[274492.008510] cblist_init_generic: Setting shift to 0 and lim to 1.
[279820.791509] cblist_init_generic: Setting shift to 0 and lim to 1.
[282104.735510] cblist_init_generic: Setting shift to 0 and lim to 1.
[386831.154510] Performance Events: unsupported p6 CPU model 58 no PMU driv=
er, software events only.
[386850.632510] rcu: Hierarchical SRCU implementation.
[386850.668510] rcu: 	Max phase no-delay instances is 400.
[386852.898509] smp: Bringing up secondary CPUs ...
[386852.946510] smp: Brought up 1 node, 1 CPU
[386852.992510] smpboot: Max logical packages: 1
[386853.018509] smpboot: Total of 1 processors activated (5199.99 BogoMIPS)
[386855.257509] devtmpfs: initialized
[386857.982509] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffff=
ff, max_idle_ns: 1911260446275000 ns
[386858.041510] futex hash table entries: 256 (order: 2, 16384 bytes, linea=
r)
[386858.691509] pinctrl core: initialized pinctrl subsystem
[386862.836510] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[386864.720510] thermal_sys: Registered thermal governor 'step_wise'
[386864.725509] thermal_sys: Registered thermal governor 'user_space'
[386864.864510] cpuidle: using governor menu
[386865.662509] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xb000000=
0-0xbfffffff] (base 0xb0000000)
[386865.693510] PCI: MMCONFIG at [mem 0xb0000000-0xbfffffff] reserved in E8=
20
[386865.900509] PCI: Using configuration type 1 for base access
[386878.550509] kprobes: kprobe jump-optimization is enabled. All kprobes a=
re optimized if possible.

Cheers,

Richard


