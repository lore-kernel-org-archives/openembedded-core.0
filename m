Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.1437.1610046444504813981
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 11:07:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=o8T89neQ;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.181, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f181.google.com with SMTP id n142so6463099qkn.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Jan 2021 11:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JD+NnVfoMgJWDpHb9PIu8XsolUGvaqT4wNoZUPmAgj8=;
        b=o8T89neQzdPdIpLZ6/9c1j9Cxz4ruQntdVnsKqZ24fORXHASpGuOYtnklXPdcOzfTp
         9okkBtVm46AMN1qDdGaeIBX5iUNAsuX3vOgwico8ll1MZDiGmgd/ell0p9mF1nOcyPez
         MG4ikRJHqXvz/oeCG9ITm+jTW3zWu1GxjV7Vwhkb/gztr5FwYzkKvHzx+LidqZcii0fS
         e2pKQqMeaOj33m/UO+IsHgm4I4rIOi/0SMDZM860S5i/LmSi6/n1L8OjfZRGbiRBRIBv
         e4vAMygOFCbr0UPCr2+peyu3amCOsEVsPOOexmuGmDTemquLXo/VZIXXstfRqEDKBgzj
         ixqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JD+NnVfoMgJWDpHb9PIu8XsolUGvaqT4wNoZUPmAgj8=;
        b=NzVy3p0/EpKuWNzvrM/06Wem+lFLcGQGUCNWVNfQoSLgMnLWgr4ybNEsUCpR/pkmDl
         vU2OM6KrasSkUWOHhQ3D+llPXFnHdySQVNBICCaUQlI3D3exNvZuKyMXQAAjhZEaWADN
         qXPa/zv4xnWRcR+rrgQg1LUZVE3yPwzCnuds3KvzDKVaTu32vaycK9RE7oaHLdg89xTV
         zrimCnENjkGJb339wi12yUZ/9SsxDUHabl5ThYRTMss7PEGH9SI5XzyCZkCe1FH9S5eV
         iYFcpVbxcYPJ5MqlpOOIftQXR3mrVe3K0ASZ7zOyJ82sqWveA/z7zak0mbETNMDxVFFq
         uTTA==
X-Gm-Message-State: AOAM530QCm4dEjRGuMzK+7WdS/5lPbV2FU6vTq2cPwg4cVT8WHT2ZvWH
	EUAhmYrCtvvtGsPPa4Fh7wYV6rf8xLv3NF0S
X-Google-Smtp-Source: ABdhPJwg5J9DkZIH/iFnPDXVXm0nT45M7PJzmMkl5i+0BcSKPhjy+Y6Y+ohPZ4EnTnDBdDi89/NIpQ==
X-Received: by 2002:a05:620a:5ad:: with SMTP id q13mr362734qkq.135.1610046443264;
        Thu, 07 Jan 2021 11:07:23 -0800 (PST)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com. [209.85.160.181])
        by smtp.gmail.com with ESMTPSA id j124sm3622939qkf.113.2021.01.07.11.07.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jan 2021 11:07:22 -0800 (PST)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f181.google.com with SMTP id g24so4956250qtq.12
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Jan 2021 11:07:22 -0800 (PST)
X-Received: by 2002:ac8:2615:: with SMTP id u21mr16175qtu.233.1610046442483;
 Thu, 07 Jan 2021 11:07:22 -0800 (PST)
MIME-Version: 1.0
References: <20201228200436.78130-1-alex.kanavin@gmail.com>
 <20201228200436.78130-13-alex.kanavin@gmail.com> <1b8809a765eb36211ecc39a9e096ac207178884d.camel@linuxfoundation.org>
 <a75c31fd-9617-1bc0-e895-ac40802245ce@gmail.com>
In-Reply-To: <a75c31fd-9617-1bc0-e895-ac40802245ce@gmail.com>
Date: Thu, 7 Jan 2021 16:07:10 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp_PCYwf8ghCVRCAPVr20i7AfGECSee5WwHi+VhpUKofQ@mail.gmail.com>
Message-ID: <CAP9ODKp_PCYwf8ghCVRCAPVr20i7AfGECSee5WwHi+VhpUKofQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 13/22] bash: update 5.0 -> 5.1
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 7 de jan. de 2021 =C3=A0s 15:43, Joshua Watt
<JPEWhacker@gmail.com> escreveu:
> On 1/7/21 11:57 AM, Richard Purdie wrote:
> bash 5.1 hasn't merged yet and is in master-next.

Also, 4 patchlevel fixes are available[1]. Might be good to apply them as w=
ell.

1. https://ftp.gnu.org/gnu/bash/bash-5.1-patches/

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
