Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.2807.1601084701905409744
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 18:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=nS1HOlme;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.65, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f65.google.com with SMTP id z18so2429248qvp.6
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2020 18:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=B4DI/y1aJbHIzkGiiAXnotxJJgLfXpwiNcpydXzEfIo=;
        b=nS1HOlmeuJ3mEOOOGKN3uf5uZYPlGZF6XrqmCyqWbyRbKa629cRTLCbRWI5W4B2xOc
         soVrar67CaKgRFWJYVxRLZk+bf80XrWlG1Nx4JYP7lP5bxD4k9sPVacrXYfDG/kyOwjH
         X7fvRHObrYzYO1sZFVckwg7yrdsv95kRaIU5tNCwZ1cTdI74eyZqTXNAJwdbmcKBqxNE
         yEoS+nEjo0QgRNQC797lGXm3pf+c5E6dCLtW6bWLa8qY9LANXrGUS+zNfkc1V0p5f9j5
         KHXuzJcymPUF+ndcjsR1/L8FDWGn0KxlGbMRw2eD1amMXz83fcClCfMnkFuaogTSLDr6
         10yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=B4DI/y1aJbHIzkGiiAXnotxJJgLfXpwiNcpydXzEfIo=;
        b=YKW8sVqWy+5nmSvyiYRWWkM36A8e5YdJAbIzvZswbG3dGj6x3/xgQnsCucCAz2njV+
         ctDts6W6MCM6t+UBdU0QrdPCMJAseox2fpuRlXLZe/9jJNvfS16PIEf+dI7tqU3C5t9v
         lLrQDltdcqz4sUIog6wIM6Rz6FQJ5ZpqdZLRZdaf0msP5XOAPv1ksnkunU5001joShwh
         cizADXwjMVkG5FsW4AlCRTdGdbuqbmq3SW9wNGDRwXmYSTP6qqeVTVL2A+bzVCNNloQn
         UKP4crSxbbXEFBriNnE1IDgH/P/9kdn6jbwClSSsbl8NXt1iHg2xNQPDPqhjDQyHSzaT
         Rqng==
X-Gm-Message-State: AOAM531y7r8KjmQOHR54dZuh7UdmXOIcMhlxb/106NK11s3/mbGR2xUP
	N/dgJfJ76HVZc066W+jxCUxXNiHMz6OEOFq4
X-Google-Smtp-Source: ABdhPJwPJc82Ts7zO2uX2w9REvd/9k9OSjUt9XwfrKa05hP8rtigNGp0Tz5HfUYHJM2zeIfTaAZsAw==
X-Received: by 2002:a0c:b308:: with SMTP id s8mr1637874qve.31.1601084700686;
        Fri, 25 Sep 2020 18:45:00 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id z9sm3086243qta.95.2020.09.25.18.44.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2020 18:44:59 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f50.google.com with SMTP id q10so2453508qvs.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2020 18:44:59 -0700 (PDT)
X-Received: by 2002:a0c:f843:: with SMTP id g3mr1609601qvo.1.1601084699372;
 Fri, 25 Sep 2020 18:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200925233040.2649208-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200925233040.2649208-1-richard.purdie@linuxfoundation.org>
Date: Fri, 25 Sep 2020 22:44:47 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrd5=5GH5VSsp-zM55TZX8xstd+_Qsipav7NJ5UzCbarw@mail.gmail.com>
Message-ID: <CAP9ODKrd5=5GH5VSsp-zM55TZX8xstd+_Qsipav7NJ5UzCbarw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] base: Rework and improve do_unpack WORKDIR cleanup from previous builds
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 25 de set. de 2020 =C3=A0s 20:30, Richard Purdie
<richard.purdie@linuxfoundation.org> escreveu:
>
> We have multiple bugs ocurring because when do_unpack reruns, it just
> dumps the data base into WORKDIR. This means if a file was removed from
> a directory in a file://subdir/ url, that file would be left in the
> build confusing users.
>
> Also if files are entirely removed from SRC_URI, they would still exist
> in WORKDIR. Read the shadow recipe and the /etc/pam.d/ conditionals
> for an example of how this can break in interesting ways.
>
> To work around these issues, improve the cleaning code to remove anything
> except temp/ since it contains logs of the currently running task and
> *recipe-sysroot* since do_fetch and do_unpack have dependencies which may
> be added there already. That directory is setup to look after itself.
>
> We also have to create ${S} since that is a side effect of the current
> [cleandirs] which is no longer needed after this change.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Cool; this seems to address some annoying corner cases :-)


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
