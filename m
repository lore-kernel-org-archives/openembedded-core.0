Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 652ECC433EF
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 08:35:03 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.24919.1653294898906697008
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 01:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NzpKMNz6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id
 r6-20020a1c2b06000000b00396fee5ebc9so8050168wmr.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 01:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=zq9+cOagbKJNS6AQuxSMwqCJZOY7Hsi6JZYojBmku2A=;
        b=NzpKMNz6kR0Vhk1yNfyZ0ZekY92EDpCV0JSo9t/xCg8T58p8WT/FhSTRBJbv9TXzXO
         3LQHk26yAijR1Myev3E12NyC8MlHIl4BQ8X9xsMwYrx3JeSq23qiY+lEDWZIWxUXycoY
         zySc53Rp1VBNXfT8/lKDlRbdSQ3vB+9xGd0rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=zq9+cOagbKJNS6AQuxSMwqCJZOY7Hsi6JZYojBmku2A=;
        b=ZoHBNU57GzIiIz5QCYx67pK8cqK4orXiBQls/NIVnYhLNsZcd8o/TzGqAwtpbZtvUq
         YbKfhAe/hGfW1Jxo8Zv5A7zcS/UXlc2mTW32oKCOS1WVcwt62phfM1Ybxx9S4HXjVnb5
         Tln1uPY7mheNge7/n7M4HR03z+DnSSOI9PGCFKTwroAj8OaK6k0jIztIe3pP+CSCzC5u
         G2cQqcpiMcbtkow0ppCzV176+IqgRML91/d5cDo+eUYVEUmuCilKjsIODVp60Zm2/ufo
         uM+LIhVKxsUGv9QsXJn5ofkuoeQmfebU8JNN+bB8Qowjez+tJQ7GT3RY7Vw443EXHS9X
         tgYw==
X-Gm-Message-State: AOAM533mRNG4K7F7BfDkMY359fPigjpS72N8g6/t2y85HtUVnrkmLjpe
	qqaHJO93Yyc1xg2x2Iz53Od1beMAcyv89smF
X-Google-Smtp-Source: 
 ABdhPJyiTvdOmpPnbiowfNmXp5MBLY6CshbPbDBvD8CHuqPb1zNh1D0ZWJw2dsqaWcvLyvrLRHTefQ==
X-Received: by 2002:a05:600c:4ec9:b0:394:7d73:325e with SMTP id
 g9-20020a05600c4ec900b003947d73325emr19077109wmq.61.1653294897003;
        Mon, 23 May 2022 01:34:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2491:f5e:6dc4:bd24?
 ([2001:8b0:aba:5f3c:2491:f5e:6dc4:bd24])
        by smtp.gmail.com with ESMTPSA id
 m10-20020adfc58a000000b0020e63ab5d78sm9385672wrg.26.2022.05.23.01.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 01:34:56 -0700 (PDT)
Message-ID: 
 <4ab9e2ceb453f6389bd3731296fa36de88231461.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] layer.conf: Avoid indirect help2man-native
 dependencies
From: richard.purdie@linuxfoundation.org
To: Changqing Li <changqing.li@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2022 09:34:53 +0100
In-Reply-To: <20220520015315.3139735-1-changqing.li@windriver.com>
References: <20220520015315.3139735-1-changqing.li@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 08:35:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166003

On Fri, 2022-05-20 at 09:53 +0800, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>=20
> When DISTRO_FEATURES efi-secure-boot and ima is enabled, all the target
> will depend on help2man-native. During build time,some recipes will run
> target_binary --help when help2man exist, which may cause run target
> binary on build host, which will cause error.
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/conf/layer.conf | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index a5d727ef5b..f2989ef81d 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -107,6 +107,7 @@ SSTATE_EXCLUDEDEPS_SYSROOT +=3D "\
>      .*->texinfo-native \
>      .*->perlcross-native \
>      libarchive-native->e2fsprogs-native \
> +    .*->help2man-native \
>  "
>  # Nothing needs to depend on libc-initial
>  # base-passwd/shadow-sysroot don't need their dependencies

Thanks, our patches have overlapped and mine added this in a slightly
different place so they both "apply" but the effect is the same. Should
be a good fix to reduce the number of files in the sysroots!

Cheers,

Richard


