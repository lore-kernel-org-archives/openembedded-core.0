Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFBAC433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 08:41:01 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.4849.1652776855881337862
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 01:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Nt+BA03S;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id g17so5553950wrb.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 01:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=U/daxpuYnf0Yk+2FW8lnfg7Hbw7Xxz+N4mu6kqgOICw=;
        b=Nt+BA03S6ZvcD+ICiZx0fWW69Xq3EUxcwKnApbWLNdH/lqV3AGVmJD1yA1jbQObJkT
         L9JRYVi9xAJ3kfqOkio5bImB1IS7qpnPKC3mnFFfUwSwiyLpurfVrRfrbVFydDLhN4d0
         Q4jZ7rmbULE2Xh7zqYk+8qr2m4SxNLE2W4E9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=U/daxpuYnf0Yk+2FW8lnfg7Hbw7Xxz+N4mu6kqgOICw=;
        b=FeKzCxCnBGsQdZDb8vG/oAsGwETzL6naJChA7S1mkNCFT7pWycxAqgKfbKe5RIs2nz
         ulRNVaMzBGjHsk4Yr+lD5IIgimH2xIpTAkN1GwmgqP5BvlvTDR8ieJ+PbirTc8Vc3VMl
         juf1ylb5uJy+FtzW3RQQxT76PJ8B6O2NLye2hS7CvJ6xg9daAfWJ3+MrBZ6EOjpFjtRz
         +v2xAarwxvOICyXmDHKjvJcZyG255t3jEII1RGs5p4Dx5lVp6J9P86vD7KyEXGio1wJy
         uNMRzvJLQgdomSaRraooECm0NevKr/AxER9BmYEFPwhFKN3ztolt/xbLWPfcaP9N/Bwl
         6RIA==
X-Gm-Message-State: AOAM531uXyC77fHihBo4FStDfzhPE8kNgkYa7w2AQ6QutaAH3F3co6AE
	IX/0dRlrLYDgB9CUBqQp09zE2Q==
X-Google-Smtp-Source: 
 ABdhPJw9igdQqHaydJw1oh6NCkPoYqkYHI5b5kbI1yutb4tcqiIo/DtyZduCrm3WBHFqLexCQJIgEA==
X-Received: by 2002:a5d:584a:0:b0:20c:5bad:11c1 with SMTP id
 i10-20020a5d584a000000b0020c5bad11c1mr17829732wrf.62.1652776854365;
        Tue, 17 May 2022 01:40:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9c35:e819:58b3:2e94?
 ([2001:8b0:aba:5f3c:9c35:e819:58b3:2e94])
        by smtp.gmail.com with ESMTPSA id
 l18-20020adfb112000000b0020c5253d8d3sm11474404wra.31.2022.05.17.01.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 01:40:53 -0700 (PDT)
Message-ID: 
 <d037486615787f0c2f53edf1d2e09688ee8a2e62.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/7] python3-cryptography: add
 python3-pytest-benchmark rdepends
From: richard.purdie@linuxfoundation.org
To: "Yu, Mingli" <mingli.yu@windriver.com>,
	openembedded-core@lists.openembedded.org, luca.ceresoli@bootlin.com
Date: Tue, 17 May 2022 09:40:51 +0100
In-Reply-To: <20220517081633.2992360-1-mingli.yu@windriver.com>
References: <20220516104506.3d383183@melee>
	 <20220517081633.2992360-1-mingli.yu@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 08:41:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165720

On Tue, 2022-05-17 at 16:16 +0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>=20
> The new version introduced below change, so add python3-pytest-benchmark
> to rdepends to fix the gap.
> 496703c8 Refs #7079 -- added basic scaffholding for benchmarks (#7087)
>=20
> Fixes:
>   # ./run-ptest
>   Free memory: 31.283 GB
>   ERROR: usage: pytest [options] [file_or_dir] [file_or_dir] [...]
>   pytest: error: unrecognized arguments: --benchmark-disable
>   inifile: /usr/lib/python3-cryptography/ptest/pyproject.toml
>   rootdir: /usr/lib/python3-cryptography/ptest

It sounds like we're disabling the benchmarks anyway? :/

Can we not avoid the dependencies some other way?

The patch series as it stands won't build cleanly as there is no
maintainers entry for the new recipes.

Cheers,

Richard




