Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.35043.1611180002237468762
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jan 2021 14:00:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=CJ5vOxrG;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.176, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f176.google.com with SMTP id c1so196089qtc.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Jan 2021 14:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xKYyFiLwilijhXJz8Kh1cA2b4ZCfZ2BKKbB20hkmvig=;
        b=CJ5vOxrGl3U+oqrw9x5eA2iyRM38WbNC08J1IyCNbf6DIu6hPGmf5Gx2zD3Q+E0mby
         wvQIxENFcY3L2Z0IgZ3YEO30o0tMtuYKQjv6ZwLoZ/kQcPKH7O1+D2DEI2uBdqm9n87U
         W2DWtycSiIGR2bM8bGXs0NIaEx+jx7najEyCFxdQP98z+8Z0t0GS7kmLWlPKZ2M5INT/
         XcsAFU4q4GdiTjQMiojvMDrPVAzLvXYmekVKiRZ2cymj1GVRJvD9n/JQUWJIeRXa2HH+
         9+zIGKWK8zb6TNXYvOUod2VJ+JySOxrS2F74mYjwK0VqMNMKHCjgecVY5Y/9lOvhy2dh
         yIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xKYyFiLwilijhXJz8Kh1cA2b4ZCfZ2BKKbB20hkmvig=;
        b=MeDbvm/uhluBt+X5v/LOKpMz7odVclJmGgaROUhJiqkXWP/EU5Q7KbbekAkG1wLJGT
         3xzFHRvnzuSBow4rABLxDc72Ke1z2AIEYM7wvR7baJzITJBF81+40JoEPVw67xoFIZWF
         Qqn+OOBZrNfubFHIr6SDe0LEz17QnvyzUEmMkUjShUAwL7CfUxBgBHNgYAfMcilS5Mq1
         9wLXC77o7fdtSlt8xij6BDORFqOYOMdoNFmBFDXWpUrPtIfFLgivtINsn85K7u1ZT7ZQ
         6G20WmfVBnnz7p+LunG4lK31pPWThcgeX74iBglHgMgis060dTFFk1bBVc8/DcxHniLt
         m0rg==
X-Gm-Message-State: AOAM531z49eisUWMtbRaWCT2/paP8ufbMW7iKEVwU6xzYJYzT7qhyw0j
	Qg98OyY9ngWY/Bcjlnb/ujukY7JW9EADpqN8
X-Google-Smtp-Source: ABdhPJwDOLXgRjZrKKFPmcKRg+4W7WWC5NUV6Z/9VmTjTqQTaVSI5o43dKddmezIIFONxAvLeJS6gA==
X-Received: by 2002:ac8:564b:: with SMTP id 11mr10948973qtt.119.1611180001206;
        Wed, 20 Jan 2021 14:00:01 -0800 (PST)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id h22sm1986842qth.55.2021.01.20.14.00.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jan 2021 14:00:00 -0800 (PST)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f179.google.com with SMTP id o18so152932qtp.10
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Jan 2021 14:00:00 -0800 (PST)
X-Received: by 2002:a05:622a:2d4:: with SMTP id a20mr5735211qtx.217.1611180000168;
 Wed, 20 Jan 2021 14:00:00 -0800 (PST)
MIME-Version: 1.0
References: <20210120182001.20523-1-oobitots@cisco.com>
In-Reply-To: <20210120182001.20523-1-oobitots@cisco.com>
Date: Wed, 20 Jan 2021 18:59:48 -0300
X-Gmail-Original-Message-ID: <CAP9ODKok0YUiD2rgJfZYFS0-oP1w-GS8s-KeuV2HUG2skSSKnA@mail.gmail.com>
Message-ID: <CAP9ODKok0YUiD2rgJfZYFS0-oP1w-GS8s-KeuV2HUG2skSSKnA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] dtc: improve reproducibility
To: oobitots@cisco.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Em qua., 20 de jan. de 2021 =C3=A0s 15:20, Oleksiy Obitotskyy via
lists.openembedded.org <oobitots=3Dcisco.com@lists.openembedded.org>
escreveu:
>
> Makefile override CFLAGS, so -fmacro/debug-prefix-map
> optiions was omitted and binaries contains absolute
> patch to sources.
>
> Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
> ---
>  meta/recipes-kernel/dtc/dtc.inc               | 10 +++++-
>  ...-Makefile-to-add-CFLAGS-not-override.patch | 36 +++++++++++++++++++
> ...

The patch can be applied unconditionally as it essentially allow new
flags to be added and should not harm. In fact, applying it seems to
be the correct fix IMO.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
