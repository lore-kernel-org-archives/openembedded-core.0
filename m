Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.54.1614791388471745987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 09:09:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@enlyze-com.20150623.gappssmtp.com header.s=20150623 header.b=0/3ICDv7;
 spf=none, err=permanent DNS error (domain: enlyze.com, ip: 209.85.128.47, mailfrom: c.finck@enlyze.com)
Received: by mail-wm1-f47.google.com with SMTP id w203-20020a1c49d40000b029010c706d0642so3222769wma.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Mar 2021 09:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=enlyze-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=PJTNdHD4suNb9xAChNyDf4rgrSmCYrycHSZhVB37/I8=;
        b=0/3ICDv7cOoaUwi4Sl9+5s08R9d1xYm5aKSnm4Hg85qdDgt52rjuKe6dSptf9bUpts
         AWslLUQw0IgJHDmgA+gnzcfDeLjm3uqJtSmR44yLrXEfV1pJTebkCkSjC81zcmTqvpLL
         Ax9yRi8MgYaGSHJT7ZF+feDLNE9blAUnswH6EKC0cH+7oDQ0u3KeJDnZyxl/3LGyxhsi
         XKju6tyvT6XeIEweg9S6NKKYUPFyjUh5/LAXaXoo9XvVdaPrl4RHMjs5ripXgaFaiJnQ
         jKbD2OWc2uVdq39Z9mUpg3AaxKna0TE8/nyjFO9FSOhdZ93bSHkb+bPaXt7A/CUtD8xK
         f/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=PJTNdHD4suNb9xAChNyDf4rgrSmCYrycHSZhVB37/I8=;
        b=M9100JiXZU00RR1Qu6wyQmUeiJPbiDCTQywtmfgsn4TmFCOoG7FI/3z278s8kVQ7iu
         ToCZTRb3mVgMB4nRssbfjX4/04cJHCsC57eY6qDqB2qaAoQOuynKuDEK3Cpea2Xve8he
         CugbCKFE3vCxBKBiHT3VafhXSEMiVSFSECVYKJeZWQjLpfojqEQ5FlU0H9mRnxDOK8kr
         CwT8wDLmyIaNcbQe1IKMgz9w2UM3RaB8jJ+PQG12hLW0W0kI/FP1W1L4MZd4EU6qYUTA
         oCi88bddrUEvCt891OXXRIjcS59ZLe34Ik4FFZQ5VxLi9cxdhlA4pbY548hwHJ9ZxiLd
         Jp+A==
X-Gm-Message-State: AOAM531YwI0KH4oVEs9dsD/XN0yXragSH7YJo12hC2QCTBOz3X2giGZC
	3UD/Wi1WqWYhYj5JhUiQxBnqXg==
X-Google-Smtp-Source: ABdhPJxt/GWl/yVqSuswG71kSTc91eWr7doOhv6wpu0xmdUpRf9OzUVGg7Vv+ZBwJovTflFWCY5QVg==
X-Received: by 2002:a1c:9d85:: with SMTP id g127mr9861275wme.161.1614791386772;
        Wed, 03 Mar 2021 09:09:46 -0800 (PST)
Return-Path: <c.finck@enlyze.com>
Received: from [10.24.0.160] (xdsl-81-173-161-42.nc.de. [81.173.161.42])
        by smtp.gmail.com with ESMTPSA id a14sm36990885wrg.84.2021.03.03.09.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Mar 2021 09:09:46 -0800 (PST)
Subject: Re: [OE-core] [PATCH 05/24] dosfstools: update 4.1 -> 4.2
To: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>,
 Steve Sakoman <steve@sakoman.com>
References: <CANNYZj8ynCZ5fF4=rzdAkv=yGFyOtF97WD-c5MknNON_9HMxfA@mail.gmail.com>
 <28099.1614691555012100324@lists.openembedded.org>
 <CANNYZj81J+HqeEGRBesa2VW=+UDA6+bpp=0M7=MXjRzGUuwLYw@mail.gmail.com>
 <CA+chaQfg4EKGfTu1d-ZXrfeE=eKwD=YYJFt7ydLP3ANZ7eWStw@mail.gmail.com>
 <CAMKF1soua2c_EkEXDgPOiCaqH0W4+_UKVYjUtu9iXZGMs1pHVQ@mail.gmail.com>
 <20210303165831.vg4rzrxyhzrxpf2l@jama>
From: "Colin Finck" <c.finck@enlyze.com>
Message-ID: <5f90d28a-1670-18e8-7653-cd2f56f5bc65@enlyze.com>
Date: Wed, 3 Mar 2021 18:09:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210303165831.vg4rzrxyhzrxpf2l@jama>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Am 03.03.2021 um 17:58 schrieb Martin Jansa:> If I understood Colin 
correctly, then older dosfstools would break even
> older partitions created by mtools (e.g. if you (let automatically) run fsck.vfat from
> dunfell based image on device with /boot partition originally created with mtools
> from warrior days)

Exactly. Let me quote from the bug I reported to Mender: 
https://tracker.mender.io/browse/MEN-4497

===========================================================================
* Mender is using mcopy from the mtools package to create the boot 
partition for Raspberry Pi and UEFI images: 
https://github.com/mendersoftware/meta-mender/blob/50e8188f6c69d5e16363a37c2bb6e3abf9542bbb/meta-mender-core/classes/mender-bootimg.bbclass#L35
* mtools had a bug until 4.0.20, where it wrote uninitialized bytes into 
newly created entries: 
https://svn.savannah.gnu.org/viewvc/mtools/trunk/direntry.c?r1=363&r2=452
* dosfsck from the dosfstools package had another bug until 4.2, where 
it regarded unexpected bytes in the reserved part of the entry as bad 
and "corrected" this by removing affected directories: 
https://github.com/dosfstools/dosfstools/commit/87a8f29785bb605350821f1638a42e6cf3e49ce3

The combination of all 3 renders devices unbootable once dosfsck is used 
on the boot partition created by an affected mtools version (= created 
by Yocto Warrior and earlier).
This is also a problem for newer Yocto releases, because the boot 
partition stays unchanged when upgrading a Warrior device to Zeus or 
Dunfell.
This problem is especially crucial considering that Mender reenabled 
automatic filesystem repairs in Zeus and Dunfell during boot: 
https://github.com/mendersoftware/meta-mender/commit/0552891c504ecacb0d99f4618694c03f5bc08f83
===========================================================================

The meta-raspberrypi crate you just linked also uses mcopy, so the same 
applies to it.

I have linked some related commits in my bug report, but I cannot and 
will not guarantee that these commits alone fix the problem.
Which is why I still favor a full upgrade to dosfstools 4.2.


Cheers,

Colin
