Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.11497.1592930875301764000
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 09:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=aQ+mtAlU;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.182, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f182.google.com with SMTP id 80so7590743qko.7
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 09:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vCEnD933uIFc5f5GXBLDNlry3Zlv0sRRTR9R9OMwxwY=;
        b=aQ+mtAlUXgEJyEU6UmhTfcmyZPZNp9Z4Y2epkg+hJwd6xfIptqfopZQlgu0RA/2qQg
         gsGsKp3gv/0ixg2PEIKJHv5HHcMfqsryDkZmNwhtclTwk6kvQDgTaaT8ayi9p3kwcKNm
         +FIjtJtwjSfZ/+1xh8LgURW5Lmpsp68rVg15dw3s67Dnh2uTVVqk51ErgNI7tkGUJsYF
         NjreJbrO+hRJ37NzpH4P+FyXopQcPmdvaZ99KEgoiONZcSTB05zbUuhqo2vhYnE/k1cU
         llcH9+wjLcnrcKecqpLjO+l2I5BfB3zM2YLyXTZTf59nD4853RQmzUQUixQ9RucUb5RO
         24uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vCEnD933uIFc5f5GXBLDNlry3Zlv0sRRTR9R9OMwxwY=;
        b=CEGFVvFPoHCry8bgks8Kl7BJVK+s8GPEQlRJrXe5nHfbvuRnDN8yeJcmJ1J+ENfsMq
         tkcj/kTBZVpA1l/IjfkokKcIhY0tb66keLy6LbniJ4J6lRMTJod1TiUmM5bpCKtiAhj/
         hzuYCTrIJPs+i+7BwvyJ5icOQNAhUihz9KFA5NIAgJDm8uG3mODfdYWxp4MG1fTTE8RV
         6oS7pTJwTdMUCTrC5AV2kBy+oSrYEbZmMdCmyH/ZeeqVIjzfnDItlG+RgtkfSEZwZ37p
         R9bByRqKLYp5EX7yWZMUxNHteSPc4/r/WDKB/VcTMbtHfyV8Uc4JuDau5CbKZyTmF/QP
         4AdA==
X-Gm-Message-State: AOAM533BzNJ8+EDG54BRF2awa3+gakNW/sGUYtjKC93Ul71L1XbAg6tl
	I1+FeminujRpTupwrUpA905nlRdSihM1sA==
X-Google-Smtp-Source: ABdhPJzL4QljpgxtLCqTYF20s39eJWOY9ikSPJ1JPkHbmuwohBG543qsuPosCPEwPsNXDrIMDeKksA==
X-Received: by 2002:a37:5ac3:: with SMTP id o186mr20255549qkb.272.1592930874046;
        Tue, 23 Jun 2020 09:47:54 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id o21sm1071179qtt.25.2020.06.23.09.47.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2020 09:47:52 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f178.google.com with SMTP id 80so7590620qko.7
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 09:47:52 -0700 (PDT)
X-Received: by 2002:a05:620a:24b:: with SMTP id q11mr21362037qkn.277.1592930872270;
 Tue, 23 Jun 2020 09:47:52 -0700 (PDT)
MIME-Version: 1.0
References: <c207ad43-fba6-d5ff-085a-f6be1231e230@herbrechtsmeier.net>
In-Reply-To: <c207ad43-fba6-d5ff-085a-f6be1231e230@herbrechtsmeier.net>
Date: Tue, 23 Jun 2020 13:47:40 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoR_JOt6UQFTMNJYv_fh4d-vuVyy-5k_cd6ZgjsiLcA0Q@mail.gmail.com>
Message-ID: <CAP9ODKoR_JOt6UQFTMNJYv_fh4d-vuVyy-5k_cd6ZgjsiLcA0Q@mail.gmail.com>
Subject: Re: [OE-core] Status of Go support
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Otavio Salvador <otavio@ossystems.com.br>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Stefan,

Em ter., 23 de jun. de 2020 =C3=A0s 13:37, Stefan Herbrechtsmeier
<stefan@herbrechtsmeier.net> escreveu:
> because of the changes to the 'GO111MODULE' variable in go-dep and
> glide, I wonder if Go is ready for use. I would have expected the
> variable GO111MODULE to be set to 'off' within the go.bbclass because go
> could bypass the fetch task unobserved otherwise.

Is there any known issue?

For me, with those fixes, it is working fine.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
