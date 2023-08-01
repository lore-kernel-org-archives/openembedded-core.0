Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F8B2C04A6A
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 21:45:04 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.788.1690926300209310825
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 14:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cOw3fzOK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3175d5ca8dbso5468166f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 14:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690926298; x=1691531098;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PYYlv9bOXpH79q2ORVNSTQgJXwXzx+nCKkc+2Y8oOUk=;
        b=cOw3fzOKb9myehnNOPE/TnUrjEhrlc62jKnPJ041EZftDLD3ME7e82yGQwk7WriQ6n
         bbc1unSNVvu2CuMaLbOWVDlgZesG7qqjKeQvTdVms0/3CSDaqVWjoLHleytNDuihIoET
         1tXYydK0+unY+MP1YOtEHZ5oPU0lZbQBDTE90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690926298; x=1691531098;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PYYlv9bOXpH79q2ORVNSTQgJXwXzx+nCKkc+2Y8oOUk=;
        b=CrsT7O4Oa4p6ac8U6el8V6WguLWdudN73xmKAJmHyazEiG7wP2taL26GX1M3qtXVNt
         5cFGeXWZdCJOPxM15E+6WtHP/QFSY5ajN8YFZ+Emx27fPMlw6AvNXmcjaXL2DPWbpFQ5
         c307iSn2RPIVxZPEI9ZNacCxquQ1FFG2olEipI7crBae1x++Z7FuD6RHzkh44zzZ7bHh
         rKkxrfHTgGRDlhE2yHebtUh7I+w+h/7sFm32AllDPbOMAdxoh2hSWZW6EboAm0xVdEsS
         SgTp65IryDsETgJeOycHfY71og9qj2epbNw3i510OQcO2RAryjJyqyzUaQkjfxG4PV9I
         O+BQ==
X-Gm-Message-State: ABy/qLZuwQLc8alcCTff2hUJ3ptsaMPgPQB59eP0AN99J1OIMOJI2rvs
	bbXCF9nN40hGlqyBZ8V2G7rGRw==
X-Google-Smtp-Source: APBJJlHc7MxZWHjKpeGsl6705l0GRZn0hsY2x/iILKWpToE1RK0w5t6mXqaTpXXS4EMV6diBi1dH5w==
X-Received: by 2002:a5d:4b89:0:b0:314:38e4:259f with SMTP id b9-20020a5d4b89000000b0031438e4259fmr3516196wrt.37.1690926298617;
        Tue, 01 Aug 2023 14:44:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3071:b645:70ce:e3e7? ([2001:8b0:aba:5f3c:3071:b645:70ce:e3e7])
        by smtp.gmail.com with ESMTPSA id s6-20020a5d6a86000000b003143add4396sm17070784wru.22.2023.08.01.14.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 14:44:58 -0700 (PDT)
Message-ID: <e42eca0666115dacee9f9e89f1b9cfd28b44723f.camel@linuxfoundation.org>
Subject: Re: [OE-core] eSDK is missing native cross-compiler toolchain and
 compiled target libs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@arm.com>, "chris.sutton@l3harris.com"
	 <chris.sutton@l3harris.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 01 Aug 2023 22:44:57 +0100
In-Reply-To: <0D714194-137D-47CB-9401-C7B2DAB33FA7@arm.com>
References: <KF92.1690198680497382322.XSbE@lists.openembedded.org>
	 <0D714194-137D-47CB-9401-C7B2DAB33FA7@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 21:45:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185363

On Tue, 2023-08-01 at 18:50 +0000, Ross Burton wrote:
> On 24 Jul 2023, at 12:38, Sutton, Chris (FP) - IC via lists.openembedded.=
org <chris.sutton=3Dl3harris.com@lists.openembedded.org> wrote:
> >  I=E2=80=99ve built the eSDK for poky honister. However, it DOES NOT co=
ntain the cross-compiler toolchain/compiled target libs.
> > I build the standard SDK and it DOES contain the cross-compiler toolcha=
in/compiled target libs but of course has no built-in QEMU.
>=20
> I can=E2=80=99t see any reason why you can=E2=80=99t just add nativesdk-q=
emu to your standard SDK.
>=20
> > I am confused by this. I thought the eSDK came with a toolchain, but it=
 seems not.
> >  I need both the cross-compiler toolchain/compiled target libs and QEMU=
.
> > How can I include the cross-compiler toolchain/compiled target libs in =
the eSDK build?
>=20
> eSDKs are pretty minimal out of the box, you need to use =E2=80=98devtool=
 sdk-install=E2=80=99 to install tools.  =E2=80=98devtool sdk-install gcc-c=
ross-aarch64=E2=80=99 or similar should work I believe.

A lot depends which eSDK we're talking about too. I'd have expected
most images to have basic target libs so the eSDK built against them
should have it too.

Is this a minimal eSDK or an eSDK including all the sstate artefacts?
That might also make a difference...

Cheers,

Richard

