Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web12.9379.1594383115354491315
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 05:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@code-house-org.20150623.gappssmtp.com header.s=20150623 header.b=ZVvKkJeZ;
 spf=none, err=permanent DNS error (domain: code-house.org, ip: 209.85.128.45, mailfrom: luke@code-house.org)
Received: by mail-wm1-f45.google.com with SMTP id f18so5692227wml.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 05:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=code-house-org.20150623.gappssmtp.com; s=20150623;
        h=to:from:subject:autocrypt:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=ptCZ+l5QNQL+PC3aS+VFRA7uDUSFdLKkrWZmBt49IvM=;
        b=ZVvKkJeZ2lM0pf6ZrjyaOPPs9T74UNf7MyIeZNK+FrNhtMkbUNUoTpNSEhZbTmb0IY
         zTHOFKB7HCIxA0AhJe6yIEMcMon3p9HhevOfhdbWd8mqmrSxAwjzFuL0sv9Gphe34WaW
         hhnz4tDDsK9Kxar7K0h0gVfHoHyp32IYoiDNgWK0q8uUEYjgYKX5DaqV3me0uk2171NR
         vihB1rSmFEvEg9zUOa9uZNOgGs46MQ8C7ljCn3Zm1BCLRCyDGPh4UPeCx9SYErf5CuWL
         XlKOU3C3LmHhT/M0Ql+De7/WOs7EOpUR1rkTkC1dZXAXEClxCwg2jlRDy2XMsQVO71LT
         Fv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:autocrypt:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=ptCZ+l5QNQL+PC3aS+VFRA7uDUSFdLKkrWZmBt49IvM=;
        b=M/SoNKIdMtmmdqTKGnzSVa9+awdu3IKPsmCEqSsFlN4GWuB8diq0NYhrZGiBj8cuK3
         67DOpPb+b0fR785cLSAkYpXdo9hfhl63pgNFZ+7LbP5IVVDz3NLYIpaw6em5I7mUnLmN
         mfytPM77H30btCkCkPTePl/lfxBzXgr1Z9KQhOGqRBa+PcnkFrCzl/Sr0fyhR2KiHKgX
         YJHVrBPkk3t4DRQ8fHIAXufytc0tPgr6aAfT5EIJAPJmu/Tp3kcX0m8WTcofSjI4jLZl
         yT8Xsx1dfJA/DYQhHegdE1W/TOKCZnhZ6x3OAiUTPvTfRjjOp0MgFThp70FtbaBz4F4t
         GHWw==
X-Gm-Message-State: AOAM533onHWq5mpIo9puROPucw+5qVbv4qTaw4zof3pyibyvcj1kNRw9
	siHniizu29pp3cdLCBoh4UkprLNvMUFQog==
X-Google-Smtp-Source: ABdhPJxotCXzOf6cASI8JzPuPZzVxHNIy0vg33gim9Vr24HE4JZ8F2/D12qwfL9RbsDCaSgdRj4NFA==
X-Received: by 2002:a7b:c099:: with SMTP id r25mr5204312wmh.159.1594383113261;
        Fri, 10 Jul 2020 05:11:53 -0700 (PDT)
Return-Path: <luke@code-house.org>
Received: from [192.168.2.106] ([185.142.162.13])
        by smtp.gmail.com with ESMTPSA id h5sm11158317wrc.97.2020.07.10.05.11.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2020 05:11:52 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
From: luke@code-house.org
Subject: Wireguard and wg-quick systemd unit location
Autocrypt: addr=luke@code-house.org; prefer-encrypt=mutual; keydata=
 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
 pH+7poausqhBcWxxEgtym5iI
Message-ID: <096144b2-ab6d-9abc-ca9d-0ada7b52237c@code-house.org>
Date: Fri, 10 Jul 2020 14:11:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi all,
I been learning how to run things lately and I think I've found a bug or
at least an unintended trap for new comers.

I've ran into exactly same issue as described here:
https://stackoverflow.com/questions/54197951/yocto-systemd-service-to-install-a-parameterized-service-service

After looking on how to work around the problem I also looked why it
given answer fails and why the heck it works for openvpn. The answer is
simple - wireguard leaves wq-quick@.service in /lib/systemd and not in
/lib/systemd/system. The end result is that any service which uses
SYSTEMD_SERVICE_${PN}=wireguard-tools + wg-quick@aaa.service doesn't work.

I've looked at other distros. In ubuntu and arch unit file is
/usr/lib/systemd/system hence it works as expected there. I've checked
rpm spec and unit is placed in invalid place:
%dir "/lib/systemd"
"/lib/systemd/wg-quick@.service"

I had a look on the wireguard makefile and it seems fine. Can someone
point me where issue comes from and give a tip how to patch this issue?

Kind regards,
Łukasz
