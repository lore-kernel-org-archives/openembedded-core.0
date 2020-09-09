Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.6737.1599626887728288696
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2020 21:48:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uxXQ4+H1;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id s2so719166pjr.4
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2020 21:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:references:to:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=IJ6HMQkGHzvhYDDrdSK/QUN12bzsw7nfypPWT5vQ35E=;
        b=uxXQ4+H128+E89r6we6/HJTOUv7SaafJEt7KI6boM7kLCXBBMzQD3kEeci3UlPIUxY
         ilAvc6jrIa/OqPcDarQn2q0DzwZHH9AJ/iHeUukvgnPd4K9Vo32O/HqIV1VlVMlocG9e
         IUs6Qn0iFk3VvfRvgR3whLj37kCqWMXSoR8WJNCCg6wUyI3hk0Ozz08VclqKAhh7K39O
         av+Xx+a1h4Mx07CggqFHW7XRdxCpGUj/FXVCjxZRQh4DrGLOwECu4WCBlEXlhfgY6uSD
         UoRDlV9ut2bZ0Mp5vb/7+yup6iJ7KlmEKS+Lzlb2TjqrCGwGOhtVV3z8F7PEGAqs4bB6
         v+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:references:to:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=IJ6HMQkGHzvhYDDrdSK/QUN12bzsw7nfypPWT5vQ35E=;
        b=ZU0/fs2BDHor8kvYZ09RxyUcOzKHWZW2UZAL2k2Rwq4d+VVW4OslCwe5szK/AJvLjQ
         3r5KrMvY1r45hRjBBrw4dozSyT0NMtrSUr/f0kMmou+RXVMAnJ3Fm/wvcWixBiKOLmaO
         Q3r2nTClBZtfsz/ttnzH4rxV0BENwzbyBqgy403Vq0OYQiRKDWQPCq9HjZM0Nk0dxA8x
         qOLy6vmDdM6vz7suL3e8+eKC03Jy3zCa26jaOMU8KU2jAdlCNIuTDDa54IluLZgt4S8X
         033mHOpr07rONLmWm3jqhnrxF7aifj7ZkdeJrGW/lQqeTXf8sJguxtoBVvA0lQTl+Vwe
         QzoA==
X-Gm-Message-State: AOAM530kWKTArLhBeDCIa5Wk0Jc/jS+OWS/JJ1BfSV883KU3G/uAqxUm
	5DAFfGi7u+fvwSpdLOGPch0bierFYfM=
X-Google-Smtp-Source: ABdhPJzFGwCQUoaX69+uY6/8Sp2H5LXV9UPZ0iEHLoUuak09jKD72MQbVPSo57AcI4sqjaMVI3p+zg==
X-Received: by 2002:a17:90a:8d85:: with SMTP id d5mr1874454pjo.45.1599626887002;
        Tue, 08 Sep 2020 21:48:07 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:812e:2d2f:a669:186f? ([2601:202:4180:a5c0:812e:2d2f:a669:186f])
        by smtp.gmail.com with ESMTPSA id p29sm771608pgl.34.2020.09.08.21.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2020 21:48:06 -0700 (PDT)
Subject: [yocto] Warrior and Thud stable branches
References: <163303B5AC80ABDA.6229@lists.yoctoproject.org>
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
X-Forwarded-Message-Id: <163303B5AC80ABDA.6229@lists.yoctoproject.org>
Message-ID: <3fa28ecd-8696-ca8f-f47f-99696917d0a2@gmail.com>
Date: Tue, 8 Sep 2020 21:48:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <163303B5AC80ABDA.6229@lists.yoctoproject.org>
X-Groupsio-MsgNum: 142280
Content-Type: multipart/mixed;
 boundary="------------476902608704D7F4E8AFE132"
Content-Language: en-US

--------------476902608704D7F4E8AFE132
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit


Sorry. still have the old email address in my contacts.

re-sending.

-------- Forwarded Message --------
Subject: 	[yocto] Warrior and Thud stable branches
Date: 	Tue, 8 Sep 2020 21:39:28 -0700
From: 	akuster via lists.yoctoproject.org
<akuster808=gmail.com@lists.yoctoproject.org>
Reply-To: 	akuster808@gmail.com
To: 	openembedded-core@openembedded.org
<openembedded-core@openembedded.org>, yocto@yoctoproject.org
<yocto@yoctoproject.org>, OpenEmbedded Devel List
<openembedded-devel@lists.openembedded.org>,
bitbake-devel@lists.openembedded.org <bitbake-devel@lists.openembedded.org>



Hello,

A few words regarding the older stable releases, Thud and Warrior.

Thud no longer has an active Community Maintainer so this release with
be move to the  EOL state.  Warrior did have a volunteer but no activity
to date and this branch will also move to the EOL state. This will take
affect tomorrow (Wednesday PST).

regards,
Armin



--------------476902608704D7F4E8AFE132
Content-Type: text/plain; charset=UTF-8;
 name="Attached Message Part"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="Attached Message Part"

LT0tPS09LT0tPS09LT0tPS09LT0tPS0KTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBz
ZW50IHRvIHRoaXMgZ3JvdXAuCgpWaWV3L1JlcGx5IE9ubGluZSAoIzUwNTIxKTogaHR0cHM6Ly9s
aXN0cy55b2N0b3Byb2plY3Qub3JnL2cveW9jdG8vbWVzc2FnZS81MDUyMQpNdXRlIFRoaXMgVG9w
aWM6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9tdC83NjcyNjM4OS8zNjE2Njk4Ckdy
b3VwIE93bmVyOiB5b2N0bytvd25lckBsaXN0cy55b2N0b3Byb2plY3Qub3JnClVuc3Vic2NyaWJl
OiBodHRwczovL2xpc3RzLnlvY3RvcHJvamVjdC5vcmcvZy95b2N0by91bnN1YiAgW2FrdXN0ZXI4
MDhAZ21haWwuY29tXQotPS09LT0tPS09LT0tPS09LT0tPS09LQoK

--------------476902608704D7F4E8AFE132--
