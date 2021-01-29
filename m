Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.2094.1611953117143190478
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 12:45:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=B8rCsjyq;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.170, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f170.google.com with SMTP id l23so7676574qtq.13
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 12:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vTn/HEN7GBSuZrYwx5WDd00dDkb/VtC6z5IxUrW470A=;
        b=B8rCsjyq2YehT64qmyOgnJ6sAwU8Reczo/20xP8i39PhrsZgOrtEOEqol/bSLHWq+7
         TnJZwIsXboMVe0rBisa2OBwD50vdzDOl5hNFvb/Jb6Cz8+pH6dHJojb0DIHN+xss0/BY
         kzqRc04rw5/kXVR5mehCL4nKnEKsr3jTZnxsU164T9R1xrR3ioIO7dw8HKml8B5/O3Ry
         kdzsb4+3sI+4uVGfozcSSPlac4BqVkfzYCR/DHj7QKY/NluqglYzSrxYXRbX8SSXCrgy
         V0DRI/ONgiEhqwH2bqgOI/cvpXDNHOW/XWA7bbVXa31DpaIsQRUKs1IiaDx4JJqSvF9B
         9wrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vTn/HEN7GBSuZrYwx5WDd00dDkb/VtC6z5IxUrW470A=;
        b=nx8MsZsMg6hxgF1vMsQ4A4rMQi6H5b6mRPFQAudAdW1Sg1iI+zoqN6H+qbUjs/EcI6
         1rvDiz2rljt4fniz5MlltmFewI2p5GL2l/aprsCPcEi60XCvL/O59Mj5mHur4X0MolVS
         cdZliJwyNB6tCC2QKz9biETP7S0kKIwFuOD0SqaZa8N1gEc0RGNZaKWCUr3ZxnIQk/ef
         ZptQmegcjtdm+UbnJx89YUToJpP8M8RFUDvl7SyKnpvxeqRUZSe8waNUBMToAmqo8bFB
         5LBhbJRYxgr/1d211ip8LjyohmneUNqkgFQt4vf90BHjygOUXKXJ1ZPylCNsZAuJU36v
         yLwg==
X-Gm-Message-State: AOAM532nY7QVfSpSSLh/0IlosHProZjmRn32+ak08gtd0+ddN2Z+dqEP
	3ip1QJ4usW+kw04JeNMsCkJeiM+/Jm1dbhBo
X-Google-Smtp-Source: ABdhPJxnufcNq6OXoHg7JB7iqLSARmPhuaYzVaC7cQzm7U+i3bNg1h8zv5d9IQ8n9XOBbmWbG1P57Q==
X-Received: by 2002:aed:2be7:: with SMTP id e94mr5993523qtd.110.1611953116109;
        Fri, 29 Jan 2021 12:45:16 -0800 (PST)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com. [209.85.160.171])
        by smtp.gmail.com with ESMTPSA id k12sm6916315qkj.72.2021.01.29.12.45.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Jan 2021 12:45:15 -0800 (PST)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f171.google.com with SMTP id h16so6602323qth.11
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 12:45:15 -0800 (PST)
X-Received: by 2002:a05:622a:2d4:: with SMTP id a20mr6056890qtx.217.1611953115099;
 Fri, 29 Jan 2021 12:45:15 -0800 (PST)
MIME-Version: 1.0
References: <20210128213504.3821-1-tom.hochstein@nxp.com> <a525b7f9-c4d2-f28d-5be2-4d97590c9730@gmail.com>
 <DB6PR0102MB263003ABFF3E2D9FEE5E378988B99@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
 <CAJ86T=X=GTOM5X4vgZ4ox4_q1Dy-Y4p0Nthy047GrJBdYJ_qcg@mail.gmail.com>
In-Reply-To: <CAJ86T=X=GTOM5X4vgZ4ox4_q1Dy-Y4p0Nthy047GrJBdYJ_qcg@mail.gmail.com>
Date: Fri, 29 Jan 2021 17:45:03 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrVvkYGiJrzjEr9CgzGsGm_Wdk_8+uU=CzX6FUm1OnRHw@mail.gmail.com>
Message-ID: <CAP9ODKrVvkYGiJrzjEr9CgzGsGm_Wdk_8+uU=CzX6FUm1OnRHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] [RFC] openssl: Enable cryptodev-linux by default
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Diego Santa Cruz <diego.santacruz@spinetix.com>, "raj.khem@gmail.com" <raj.khem@gmail.com>, 
	Tom Hochstein <tom.hochstein@nxp.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 29 de jan. de 2021 =C3=A0s 17:39, Andre McCurdy
<armccurdy@gmail.com> escreveu:
>
> If a distro or BSP layer wants to enable cryptodev-linux support in
> openssl they can already do so by creating a .bbappend for openssl
> which adds the PACKAGECONFIG. ie if we decide that the option should
> be left disabled by default but controllable by the distro or BSP
> layer then no further changes are required - we already have a fully
> functional mechanism to do that.


DISTRO yes, BSP is harder. If we enable it, it becomes MACHNE_ARCH as
well as all packages which depends on it.

> Going back to the original question of whether cryptodev-linux should
> be enabled by default, I would say no. It's very much the legacy
> approach and in the absence of benchmarks to prove otherwise I doubt
> it gives any advantage in performance on modern platforms (especially
> CPUs with dedicated crypto instructions).


Tom, this is indeed the most important aspect to discuss. We need to
check if latest openssl with new Linux kernels still require
cryptodev-linux to use the acceleration.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
