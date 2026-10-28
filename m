Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39599.1793183344605426923
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 03:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=KmPR1JtL;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5365f9a04c5so13607291cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 03:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793183343; cv=none;
        d=google.com; s=arc-20260327;
        b=j6DwBGj0O7aURiLQCZi+/zXWfLdiknR4R8mSWdTHoznLfzEtIQN15tRKuU7PDO/wFP
         f5CJWjyL4qr7t/XklFpdzIZ/za4zVdzjXQmXXedKdLvAm4BJnOoi2oP3iFbpQ6+tdWYl
         dO9yNUZydCdQcMj29jVL49k05C0uqiXv67P/Du3b6U4iihLCoSOGzq3Lrkrm52XgDk1/
         OnR5s3Me5KfRbyYEVrgxK/uB3pHhFsAgY1YvgMocbxNfe88377K1CYRblOENhlBy4Ukt
         6rH+bR8HBwxcLUqOG3l97GtzMhxNJyhJd+ocnjo6zWAvE5Ty/vHYuLCGMtXjY+BWPLdX
         glyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qm+SzqPz+PRJzLp3lYVLY7HpbJlzPgGQ646EyxBoW+0=;
        fh=Qdz0xdskMtkKGCkoiHzHItxfqyRi1RgU725OHa45E9g=;
        b=Rq1At5TWBCq1yyuh6siaHxZ+2mXuifQWzMJb3wqpdV8NZhDUWpjSjJNI6luwrE4v+a
         m+tRo1Ay922xItpeC0b1ALQCz2MqTGxkP7/dfriUdXXDgOsjIz4R4kegrcb3yyoxC/+3
         F7FClAgSOyoOnHzzWO2eBWA6GNztkpzpoTKaZRARlYaZfGBT715ynLQ6u0QQF+b5VSIt
         Yrc1kpHPa4m6dNZPb+bHmcrU6mzJOOTXhWodksLxoeFOpnhkG9rTFVySLQpHKPPmnjdJ
         KQcNM302yyuNzLhmjiiVfzGvdvhHH5rQeW+K+z6WrdXVcHxr8JrAkelYF3elJ98UL+XN
         LCMQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793183343; x=1793788143; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qm+SzqPz+PRJzLp3lYVLY7HpbJlzPgGQ646EyxBoW+0=;
        b=KmPR1JtL03y1KCdmBiFYKDqu86M7lzPNkZEiJaBZVs3KCZ42CU4tra0KPe4RJl9GWu
         2luPtacV1J+jnSh8ZdCk/r21i0jpDxwOHMqYU7i4k5BNimdflEyN+CHqCsO9PFZB0WB1
         xVGrNx9hM56E+9VPPiRqBd5jYt/ux4Rq5clgjyGVC6cZKbNUcyEbwshyNXm0AQLVlrYx
         4AanToVkoir6x+3hGzsIfN2e8Ea2tCzO2MzQ9TcgdzJBbm5GFZTx+TThSy06nrYEv579
         hH9wlU9vC+0WxZueuyIlkKznHWHuByi3E0aIJV4gJ2iLYf0e4HvdxebpamEmTuQgSPq+
         8WPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183343; x=1793788143;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qm+SzqPz+PRJzLp3lYVLY7HpbJlzPgGQ646EyxBoW+0=;
        b=UKYm0O8RfxxIkZAXe420KFj7zVnuEBKo1nrg4xuA8XAdVc3nYRcBOFSZQyFh7hsmpd
         zeUaalwxww2bLyD0xFC1fpVATzpWGtP55bpC7y5a6SlTrg/FHL788784iJffG2stkOz0
         u63wkY1wFBLf1Lxh74n8s3rtWvHIG1jVYyp5IoXpTzeHz+Jff9bmADs4LdxiG7wV+kGH
         Hhbb0QmRcP00FqbDKrWScHvD9js8U9F7si0Hzwqydshi/j/tkh2gEdLjr5lceQxxQKGa
         MOnIOuaHgqZgK2IZ0aEHh1cBXEI49Ig/Zkn7iCOj8WtfcBdiACvQR7qO21O/S5XfFAkE
         0DlQ==
X-Gm-Message-State: AFq9FYKt3nKcZPCJ0cL99avdKNQOAoiUs4P1qN/wQDQDfd0dOsg45/G7
	ej7nTQufvuVVerYs3UxQgnhIp25F1SlCXXLpI5AKKMw4wwdKpeNJNh54QIrZVSnTznTRVDF5XKK
	gLMOn9EE6AaJqlTN9rtM0j6L4o/Rq9O4=
X-Gm-Gg: AYBFou1tKpud6c2Ct1k39tIcbDby/Lwhn2OtfcmgsR6gdd5ZCmrVS7A+Ip8E7FWY/yS
	J38MtsySJZcim30htambqXQE5GlLKQYT1yoeAPuQ03XAqrdmJWHgKKmZk2uQC49JE6jq/KwJdDr
	dtSfjPhqSW2Spogpp5kMp68bzY38zof9j94YGCJfLU/t/RWDUWTxcZ+P2sA3RJtZvmxggKLYuhJ
	EBsn4u7e/GmGeBVU1QAbe5KV/eR6D3ahyGYJrcDx6W+yvjmFeuZHR70z6HU6IbSUTOoTNxjyUkl
	ME3NlFT5hnAi8q9XXlhlw967b+jaE17JfyFnrlNv7ohqrYEzTaHdBdpEINLdNgcG7H//XDYpDfq
	mG/K0eCc6z9qLhQahR1utN/OZaLoyjQQ7hU7aGQiZSblzr2GQV1WSpEJ+sSMGTbbVhJ7ivzbhE/
	8THJIbiGGGyxNVj6V5
X-Received: by 2002:ac8:5f13:0:b0:531:2243:436a with SMTP id
 d75a77b69052e-53fcc0d8088mr30787011cf.55.1793183343364; Wed, 28 Oct 2026
 03:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20261028101022.3308-2-jose.quaresma@oss.qualcomm.com>
In-Reply-To: <20261028101022.3308-2-jose.quaresma@oss.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Oct 2026 11:28:51 +0100
X-Gm-Features: AclHuK9wNwmE4GQuD--KdtcBQPQq59GDP9kx5vT9Rezxm6hEN8vMCLjcLlW3RHU
Message-ID: <CANNYZj-Z99z6A=p8XHinkOFC86L7EMWUxNfJdd_39Op5N=AfGg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] igt-gpu-tools: fix build on non-x86 platforms
To: jose.quaresma@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="00000000000032cf03065ee408d2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 10:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248806

--00000000000032cf03065ee408d2
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Oct 2026 at 11:11, Jose Quaresma via lists.openembedded.org
<jose.quaresma=oss.qualcomm.com@lists.openembedded.org> wrote:

> +From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> +Date: Fri, 26 Jun 2026 22:34:06 +0300
> +Subject: [PATCH] lib/amdgpu: insert pause mnemonic only on x86 / x86_64
> + platforms
> +
> +The "pause" assembly mnemonic is only available on IA-32 platforms,
> +breaking e.g. debug IGT builds on ARM / AArch64. Guard this inline
> +assembly with the preprocessor checks, making sure that other platforms
> +don't see the invalid assembly.
> +
> +FAILED: [code=1] tests/amdgpu/amd_basic.p/amd_basic.c.o
> +Assembler messages:
> +{standard input}:3702: Error: unknown mnemonic `pause' -- `pause'
> +
> +Upstream-Status: Pending [for internal clearance]


So what's taking so long with this 'internal clearance'? Will it be
cleared, and why does it need clearance for upstream submission, but not
for oe-core submission?

Alex

--00000000000032cf03065ee408d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, 28 Oct 2026 at 11:11, Jose Quaresma v=
ia <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt=
;jose.quaresma=3D<a href=3D"mailto:oss.qualcomm.com@lists.openembedded.org"=
>oss.qualcomm.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">+From: Dmitry Baryshkov &lt;<a href=
=3D"mailto:dmitry.baryshkov@oss.qualcomm.com" target=3D"_blank">dmitry.bary=
shkov@oss.qualcomm.com</a>&gt;<br>
+Date: Fri, 26 Jun 2026 22:34:06 +0300<br>
+Subject: [PATCH] lib/amdgpu: insert pause mnemonic only on x86 / x86_64<br=
>
+ platforms<br>
+<br>
+The &quot;pause&quot; assembly mnemonic is only available on IA-32 platfor=
ms,<br>
+breaking e.g. debug IGT builds on ARM / AArch64. Guard this inline<br>
+assembly with the preprocessor checks, making sure that other platforms<br=
>
+don&#39;t see the invalid assembly.<br>
+<br>
+FAILED: [code=3D1] tests/amdgpu/amd_basic.p/amd_basic.c.o<br>
+Assembler messages:<br>
+{standard input}:3702: Error: unknown mnemonic `pause&#39; -- `pause&#39;<=
br>
+<br>
+Upstream-Status: Pending [for internal clearance]</blockquote><div><br></d=
iv><div>So what&#39;s taking so long with this &#39;internal clearance&#39;=
? Will it be cleared, and why does it need clearance for upstream submissio=
n, but not for oe-core submission?</div><div><br></div><div>Alex=C2=A0</div=
></div></div>

--00000000000032cf03065ee408d2--
