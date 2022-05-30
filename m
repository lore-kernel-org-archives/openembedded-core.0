Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 730FEC433F5
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 09:47:19 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.34994.1653904034852495439
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 02:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z4KTHLBA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id
 67-20020a1c1946000000b00397382b44f4so6100124wmz.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 02:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=wYJEB+yyjtlsh3wfP3DXpsb1yBMpdRBhHvA8Lcqm+CE=;
        b=Z4KTHLBAmmjBKH6lgiaCmXLYJz81DncFjCGrH4PO2Zar/cVLIo5vq3Pi06BU1/bwCJ
         MEI3g/gJNF1/QfRb/1CVt4e2FG69pmGzZjfmyI21BJNSWKVw7m5XxiqUHrrIBAsDk2l9
         f8cfNAWJv3iNab2+V/HwcXVVEU4pQ6p72wDrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=wYJEB+yyjtlsh3wfP3DXpsb1yBMpdRBhHvA8Lcqm+CE=;
        b=o2IXG6qnFoQTCIHum7ExYaon7kOYQUZjKKHkt4jp3V/M99zeIuPyJ6+YKjxHVxzEBu
         ByvvgHrg1hKzzsnJeRtKKHmqqbpSSph/fopKo+VRNIIKIozRCGh8OjQco5I+i7M1o1Kq
         ytr3C8YyLDHh2KeNaH2+9M2clRpINFZrNfKO/UkqnKPeGenUI4GxHjW7MHmfifvMwrpn
         /1Znkb9q0O1zSGQMrXuddHlNLcpbaSZBVK3gsvp2A7hBuefhyrj4GZggly/g7PvjHYp1
         CP6sCSCtUC0D6sQ/aogBRcI9B/bevHPYDgUADENo8sUGU7TcYGFdRAPpEP3h0RxpxG9B
         7WFA==
X-Gm-Message-State: AOAM530JsbFRd+6pOiQTFN4WKAScjVFtit6mSLvDh6tbWz0T2FJ+8Lyf
	Gbop+qmP9JEkHXhaZvZXfP3GNw==
X-Google-Smtp-Source: 
 ABdhPJwRhSyQoKYtRsOwK9t7Vg2TNeLAdaERKzrdcj/xoYvAJTkMEm0zAEQszXHs2yNT4bV+zheJRQ==
X-Received: by 2002:a7b:c1cf:0:b0:397:3a9e:29b8 with SMTP id
 a15-20020a7bc1cf000000b003973a9e29b8mr18787225wmj.158.1653904033002;
        Mon, 30 May 2022 02:47:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4e4c:23fd:74c8:d908?
 ([2001:8b0:aba:5f3c:4e4c:23fd:74c8:d908])
        by smtp.gmail.com with ESMTPSA id
 bg34-20020a05600c3ca200b003974df805c7sm10541326wmb.8.2022.05.30.02.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 02:47:12 -0700 (PDT)
Message-ID: 
 <8111c32edda562be435030a61cc3a123157fd813.camel@linuxfoundation.org>
Subject: Re: [OE-core] OE-core CVE metrics for dunfell on Sun 29 May 2022
 02:30:01 AM HST
From: richard.purdie@linuxfoundation.org
To: Steve Sakoman <steve@sakoman.com>,
	openembedded-core@lists.openembedded.org,
	yocto-security@lists.yoctoproject.org
Date: Mon, 30 May 2022 10:47:11 +0100
In-Reply-To: <20220529123351.B94649626F3@nuc.router0800d9.com>
References: <20220529123351.B94649626F3@nuc.router0800d9.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 09:47:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166277

On Sun, 2022-05-29 at 02:33 -1000, Steve Sakoman wrote:
> Branch: dunfell
>=20
> New this week: 9 CVEs
> CVE-2022-1587 (CVSS3: 9.1 CRITICAL): libpcre2:libpcre2-native https://web=
.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1587 *
> CVE-2022-1674 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln=
/detail?vulnId=3DCVE-2022-1674 *
> CVE-2022-1733 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/d=
etail?vulnId=3DCVE-2022-1733 *
> CVE-2022-1735 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/d=
etail?vulnId=3DCVE-2022-1735 *
> CVE-2022-1769 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/d=
etail?vulnId=3DCVE-2022-1769 *
> CVE-2022-1771 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln=
/detail?vulnId=3DCVE-2022-1771 *
> CVE-2022-1785 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/d=
etail?vulnId=3DCVE-2022-1785 *
> CVE-2022-1796 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/d=
etail?vulnId=3DCVE-2022-1796 *
> CVE-2022-30767 (CVSS3: 9.8 CRITICAL): u-boot https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2022-30767 *
>=20
> Removed this week: 0 CVEs
>=20
> Full list:  Found 95 unpatched CVEs

In case anyone else wonders, this is the breakdown by recipe:

      1 ghostscript
      1 git
      1 libdnf
      1 libpcre2
      1 libsdl2
      1 nasm
      1 ncurses
      1 openssh
      1 subversion
      1 wget
      2 libxslt
      2 ruby
      2 unzip
      3 u-boot
      5 epiphany
      6 grub-efi
      9 vim
     12 webkitgtk
     16 go
     28 qemu-system

Cheers,

Richard

