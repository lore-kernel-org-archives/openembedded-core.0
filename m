Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84474C433EF
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 12:49:47 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.48764.1654001385987139254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 05:49:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WQleODtz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id
 r123-20020a1c2b81000000b0039c1439c33cso1133630wmr.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 05:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=xjZWDLArtP+LVd3HQkKVp/jVPwRfu8B6B8gdCQ/RQFg=;
        b=WQleODtzNujgvjThcJqJEgAqetBDDIv3GQk9+jKnMfFfIhN0w4/cs08invf8KtDJqV
         sCpolksaNTfIEXXvpOckuNVloroSZl4IMio0+hYRxIWe9df/nPAmeTERQigbVNXAMUnc
         B3+cI7OtM5jXsBp1WFskNpAb/5fLapKboZ14g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=xjZWDLArtP+LVd3HQkKVp/jVPwRfu8B6B8gdCQ/RQFg=;
        b=bimLqSjk3LaM9CwXijQBiUC7O9oh5JERX+0Ye0ieNoMRGxeWR1Y+r3s3wcGqRz2HVr
         JCEAI/eomLDelidz2VQh87Ax9pEdMrnaOPwjBzzV73gpeKMwUYj5f1oAZIrWJ4WH8UeJ
         zT4yisXuRR6wZ2euKVZ55v+sp0GjGCdHnn8gX0NGjL/h0M66cu0x8jJ3SvJIaBBfRX05
         Hrvztpad7woyRS375b4VrznAkpIXLnf7XQuBWsCUBiDga5tvXDD+qsioFebaCm0ePYAv
         UOK5eYpHCd3i+MYZm5ucGKtawCTWkbxAyCR3+JH9YNBlhWNflgzHrIDIxvsfWoWL7GhT
         f0tQ==
X-Gm-Message-State: AOAM533lVG2Et21UnioCKrfOb8FFr90SDn+aP/jgIbFYat6BlI3B5qCU
	WqSOMq6c9UjXRuWarLUAAp6xtg==
X-Google-Smtp-Source: 
 ABdhPJz9fP3/XPIVQdj+e1vGqGEuBHQ3+N7Uc2GJRiShMxr+0zW78bs8CaBANqKh/lNpIunTk8XWeg==
X-Received: by 2002:a05:600c:1547:b0:394:882a:3b5 with SMTP id
 f7-20020a05600c154700b00394882a03b5mr23633479wmg.97.1654001384448;
        Tue, 31 May 2022 05:49:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d16:2159:4370:b82e?
 ([2001:8b0:aba:5f3c:d16:2159:4370:b82e])
        by smtp.gmail.com with ESMTPSA id
 h205-20020a1c21d6000000b0039740903c39sm2020384wmh.7.2022.05.31.05.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 05:49:43 -0700 (PDT)
Message-ID: 
 <facb4fed242ccf7370e8b370ca3b83096e4a90f2.camel@linuxfoundation.org>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 29 May
 2022 02:00:01 AM HST
From: richard.purdie@linuxfoundation.org
To: Steve Sakoman <steve@sakoman.com>,
	openembedded-core@lists.openembedded.org,
	yocto-security@lists.yoctoproject.org
Date: Tue, 31 May 2022 13:49:43 +0100
In-Reply-To: <20220529120232.DC8419626F3@nuc.router0800d9.com>
References: <20220529120232.DC8419626F3@nuc.router0800d9.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 12:49:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166309

On Sun, 2022-05-29 at 02:02 -1000, Steve Sakoman wrote:
> Full list:  Found 6 unpatched CVEs
> CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native h=
ttps://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-12067 *
> CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.go=
v/view/vuln/detail?vulnId=3DCVE-2020-18974 *
> CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native h=
ttps://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-20255 *
> CVE-2022-0529 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2022-0529 *
> CVE-2022-0530 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2022-0530 *

For CVE-2022-0530 I noticed discussion of:

https://bugs.debian.org/cgi-bin/bugreport.cgi?att=3D1;bug=3D1010355;filenam=
e=3DCVE-2022-0530.patch;msg=3D20

Not sure if someone wants to test that?

Cheers,

Richard


