Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web08.19043.1607871351977039510
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 06:55:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=l/nYwGBS;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.68, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f68.google.com with SMTP id bd6so6630299qvb.9
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Dec 2020 06:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UXRK2EbmfYJx292gMQMB+00m5JeSJls7wCDf0SSgwSM=;
        b=l/nYwGBS8YlZ1HA6SpYRakfqpwIuCF2oG9ASPEb3nExLrhDpmaoSFssYSIeGpUgc4E
         5dj4DuZSWlsxv1YUhQbnm3mc96S+kFGRkW1eL5ZVEKIEOXAEbqUn8usxMj0RqygisBC7
         LvaIzjkkHTSpusn3z6a0s46ntMHIZpocFmF0M7D+5g9sLKCGul6hmHq5bKPckqw5GdJl
         15woeujysdc7Atty7Ue9iMlz3eCsJ1PX7CYpq5NMRx/cr6j+QmP5Jpu107EGzCpcSISo
         lvahF2k8K4yfQR0b8FpYeRVVNRPLrJj6innCpuRPqs+kgGWywGcieg5Y2s4aRptl0c8n
         /vHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UXRK2EbmfYJx292gMQMB+00m5JeSJls7wCDf0SSgwSM=;
        b=tv4+aeOphf0SWJekVkdtYeAdqr9XofPM0icbQO3+QghiEBjzjfem4EFyTjw1stIr9g
         zg+/5vb+VOlUXBBLVdVyOtWrw8Bct2Ptuw8FS65ErvLSBpusGw3vg+L3Nsf7umL10QET
         a2Ik1+t94yHHwBAk7CTF8m10RJciIkQ7JbZ8xdBFG7ChYj3HCfun5wfubV9r/8K41qw2
         /vXsnou5BY7anVv80WvPCGubyvp+WcmlqRJLUARHrgjrMSAIos33o/O4/ZkKWIn3vO5E
         0SFeWrQsfWwHFRO3D+g57fzcsig0VnCbfrjorbtqEwcwwYVmCYuMaZf6FJaLNl/hvTWP
         Q8aQ==
X-Gm-Message-State: AOAM533BxAAYYTu8a5MDRg/E10Zlx5dPAWWd59OxHPWO83FQ6STtUdax
	TOEeCFV6sWfeDZUiYNRB7aGLsrye2Lp5pFrR
X-Google-Smtp-Source: ABdhPJyLOw1glhW8Vg4qFBaQpjLFNl1W5jiVXl/JYWYc9mXUMEbimNiTLh9aT74oyUV9mUiLC1N4TQ==
X-Received: by 2002:a0c:f00e:: with SMTP id z14mr7107585qvk.25.1607871351065;
        Sun, 13 Dec 2020 06:55:51 -0800 (PST)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id z186sm12998877qke.100.2020.12.13.06.55.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Dec 2020 06:55:50 -0800 (PST)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f172.google.com with SMTP id c14so10154029qtn.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Dec 2020 06:55:50 -0800 (PST)
X-Received: by 2002:ac8:690f:: with SMTP id e15mr25688026qtr.100.1607871350392;
 Sun, 13 Dec 2020 06:55:50 -0800 (PST)
MIME-Version: 1.0
References: <1607777301-27257-1-git-send-email-akash.hadke@kpit.com>
In-Reply-To: <1607777301-27257-1-git-send-email-akash.hadke@kpit.com>
Date: Sun, 13 Dec 2020 11:55:38 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrSynVtbMOgtKN3rnJzVOs9aZ1CFGsSz61eoA_yENPTdw@mail.gmail.com>
Message-ID: <CAP9ODKrSynVtbMOgtKN3rnJzVOs9aZ1CFGsSz61eoA_yENPTdw@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] busybox: Implement dd iflag/oflag=direct
To: akash hadke <akash.hadke@kpit.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, anuj.chougule@kpit.com, 
	aditya.tayade@kpit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Em s=C3=A1b., 12 de dez. de 2020 =C3=A0s 09:49, akash hadke
<akash.hadke@kpit.com> escreveu:
> This implementation assumes that iflag/oflag=3Ddirect will be used only
> on block devices and files that are multiples of pagesize, and makes
> no effort to solve issues with unaligned or partial reads (unlike gnu
> coreutils dd)
>
> Signed-off-by: akash hadke <akash.hadke@kpit.com>

Has this been sent upstream?

In any case, this must be sent to master as for older branches we
accept only backports.


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
