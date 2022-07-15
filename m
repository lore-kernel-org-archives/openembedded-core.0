Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC1EEC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 20:42:27 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.1875.1657917743342102300
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 13:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QkwesmD4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id
 j29-20020a05600c1c1d00b003a2fdafdefbso3746583wms.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 13:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=T4kxz8We8rvDOHHvINvM3rMpM5KDyOgfwoPAsXgKe88=;
        b=QkwesmD4kEL10PWAmV+Y52D960mFePXVbheDoxFtFzHuFJgdPfF+xe20Xzd/TKIBWg
         oeLnZrgiESe7dYQM9li4npzOZ/IUC/llXeYXtOAsZ84hMq+A4eXINPJ7ChdsqwLjQN1F
         RaY9XvKsL/QYRR42sTgdvgmevEmrdRF1AxGnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=T4kxz8We8rvDOHHvINvM3rMpM5KDyOgfwoPAsXgKe88=;
        b=OvJmgO+ygQsvYZ0OTlX5Oo5k8S5Zg/jA4g+45LtJWm7+cwx0fSnXeB7e8spsQUILeh
         i5SX+hHnoPFOtylTfieyGdD2QTao+uT3SLAGXPzSzWr6siH2Hq9sR63KYLSj/FFryxyz
         8swXY7UP9r+XRa9lCWQMlPve583MBpLcRLNrPeCH/QDFA7acGuGOVyCgkbPMBQFGP9Gi
         jhrr0IpMklWIuSqjCx8S95kfUdgjkFtcO3APhWb7c48Wm+cEKXjJSgXlXZ9rnzeN3TQB
         vIinJ5IgfEJbY6uSiHsBrzgGHZRiwJxqZvrsjZmWF54XZllymnLCxFhClbWkYNFxKs3D
         yF9w==
X-Gm-Message-State: AJIora9ihkjZyE9oH5DSzfz8LZ04ccdaQJHTcf640mO/iezZTPxUDlQ/
	06WH807Fomf15hJrr+O8xaxyTg==
X-Google-Smtp-Source: 
 AGRyM1umkHifwXO3JaCa84W+QezD+tEelufQ0Kr5ZA24xstpaP1bo9Jk3c11P+4kdMN1e+T9vItkJw==
X-Received: by 2002:a05:600c:a41:b0:39c:1512:98bd with SMTP id
 c1-20020a05600c0a4100b0039c151298bdmr22521742wmq.88.1657917741608;
        Fri, 15 Jul 2022 13:42:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1063:9d94:8410:9c6d?
 ([2001:8b0:aba:5f3c:1063:9d94:8410:9c6d])
        by smtp.gmail.com with ESMTPSA id
 3-20020a05600c024300b003a1a02c6d7bsm10018530wmj.35.2022.07.15.13.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 13:42:21 -0700 (PDT)
Message-ID: 
 <17b18a74f7af9e01bd16c029063f41ce56029466.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] selftest/runtime_test/virgl: Disable for all
 almalinux
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jul 2022 21:42:17 +0100
In-Reply-To: 
 <CANNYZj8FT-H9-0qB+9VrAiiKjEQ=jj3aG0GB1MFJU67umQpqpg@mail.gmail.com>
References: <20220715155859.665686-1-richard.purdie@linuxfoundation.org>
	 <CANNYZj8FT-H9-0qB+9VrAiiKjEQ=jj3aG0GB1MFJU67umQpqpg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 20:42:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168137

On Fri, 2022-07-15 at 18:13 +0200, Alexander Kanavin wrote:
> On Fri, 15 Jul 2022 at 17:59, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > -        if distro and distro in ['debian-9', 'debian-10', 'centos-7', =
'centos-8', 'ubuntu-16.04', 'ubuntu-18.04', 'almalinux-8.5', 'almalinux-8.6=
']:
> > +        if distro and (distro in ['debian-9', 'debian-10', 'centos-7',=
 'centos-8', 'ubuntu-16.04', 'ubuntu-18.04'] or distro.startswith('almalinu=
x')):
>=20
> I guess almalinux-9 has also shown the same problem as 8? Should this
> be 'or distro.startswith('almalinux-8') or
> distro.startswith('almalinux-9') rather? It will be a while before 10
> is available , and that should be evaluated on its own.

Michael basically said that we were unlikely ever to get vgem working
with Alma. It was almalinux-9 that I was adding but I think we wait and
evaluate the situation with 10 and then someone can send a patch if we
can add it.

Cheers,

Richard



