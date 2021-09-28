Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D9D7C433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 18:41:09 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web09.698.1632854468202861437
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 11:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f1FxR2hg;
 spf=pass (domain: gmail.com, ip: 209.85.222.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id c7so41882040qka.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 11:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=i1U5u7yWgZJqgCGg4zjpeNGPcGe1nzDcLn6PxneYbnU=;
        b=f1FxR2hgLi631ym4b9TIuswR+7l9wwI5hapQy6iUhQSd8xGbvc0G9Z/4Ua9YmA8aZF
         tk68P1adOartzdVlVO2uj9PUDo4rcXk+CcIVIt2+oejZtu2YMTdsL/2xJISDuwMb5udu
         Muua7PuOoZp+sxZQqMX0+T4ciAfZdWymQ6YOcY21A9CXb13ZS5nMACaytRq4j7NdEro6
         y4W0HoQCPPa7k4HM4F78Pqim+ybrpADqqAItcwTrR5uwebQIGlYV4P/0Klba4r0i/izD
         0hNtiEap6tYsEeMSwJZHsuezKqqjAag70FkYF5czi0MY+h2T6vqeOqG8lyWvBjeWGBsR
         dVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=i1U5u7yWgZJqgCGg4zjpeNGPcGe1nzDcLn6PxneYbnU=;
        b=MMPJ1MD76QcXUcr5uDRDYbq7qmAdOKQqw5+qRd2gl8nmmS+3sw1VKLUPwz7/ljjfjB
         KiFJMR/kRKJIMHHV3oaD6XKQ/nkh65+ohNpx4XoWKFAlFbLJ7FnibWm/uoTrzTxEAA5Y
         VI3jF03Pe2n2nyzV6y1MP4m8hNylQeWhcT6QzWPvst+/CruMmI/4NcIMQgQVfT61fSP/
         JeD6+9Wsu+LQtq6HpiZ752enFxz2aW26qRIcdD03iTpzLfwzYxx+fPs6SGv4ZPNDhD6B
         cia4vVnbDOV44xQ0zYZgKuTwqXYHoa7ATItBgVia/O8BhnnWjRpfGpDzS6dmSlR8cHCO
         A0Qg==
X-Gm-Message-State: AOAM530wxl6bH40+U5KZmKqd99MINmx2vyaIm8z0BrTPwAG+ejb8ynqV
	MaK7YH9j6aly1c81cBH/zEL7ZUAf9RG03+O4tOE=
X-Google-Smtp-Source: 
 ABdhPJyNbjHwzbkM4MWjL/U9bfMvjRtzNHqaVRLtzDaKrNDBU4SQhRb2BqWTFlj1+WQi6eaSlQq7zF7GTr02kp5SfHI=
X-Received: by 2002:a37:9c46:: with SMTP id f67mr1511939qke.98.1632854467142;
 Tue, 28 Sep 2021 11:41:07 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CH0PR20MB3948E4BB526801B6B1E0B7F6BBA89@CH0PR20MB3948.namprd20.prod.outlook.com>
In-Reply-To: 
 <CH0PR20MB3948E4BB526801B6B1E0B7F6BBA89@CH0PR20MB3948.namprd20.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Sep 2021 11:40:41 -0700
Message-ID: 
 <CAMKF1srwXtLOz8HSKraL1C=2M61Mqu5AX7-J6OLGRtK_AQRHbw@mail.gmail.com>
Subject: Re: [OE-core] binutils: compilation error 'unknown pseudo-op: `.l`'
To: Bryan Evenson <bevenson@melinkcorp.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Sep 2021 18:41:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156428

On Tue, Sep 28, 2021 at 8:11 AM Bryan Evenson <bevenson@melinkcorp.com> wro=
te:
>
> All,
>
> I have a AT91SAM9G25 based system that has been built and works using yoc=
to-2.2 (morty).  I am in the process of upgrading my build tools to the lat=
est.  The build image is a custom image that is based off of core-image-min=
imal with a few additional packages.  I'm using Ubuntu 18.04.06 LTS for my =
host environment.  I'm up to yocto-2.7.4 (warrior) and I hit some build iss=
ues that I'm looking for some help in solving.
>
> Here is some build configuration details (with details I don't want sprea=
d over the internet removed):
> Build Configuration:
> BB_VERSION           =3D "1.42.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "arm-poky-linux-gnueabi"
> MACHINE              =3D "at91sam9x5ek"
> DISTRO_VERSION       =3D "2.7.4"
> TUNE_FEATURES        =3D "arm armv5 thumb dsp"
> TARGET_FPU           =3D "soft"
> meta-bacnet          =3D "master:49ebde9269e8533a8e4ce9c335addced6bfb79b6=
"
> meta-atmel           =3D "warrior:102d92bfc7bd772387ea89c149d33cc5ebf9179=
c"
> meta-qt5             =3D "warrior:6310c5c17380ad5e3bdaf1938e025d713066e7e=
e"
> meta
> meta-poky
> meta-yocto-bsp       =3D "warrior:eb163bd6aa0911a9541702cd12a3df684fe5fbb=
1"
> meta-oe
> meta-networking
> meta-python          =3D "warrior:a24acf94d48d635eca668ea34598c6e5c857e3f=
8"
>
> I'm getting following error when the system is compiling binutils:
>
> In file included from ../../gold/powerpc.cc:43:
> ../../gold/gc.h:375:1: note: parameter passing for argument of type 'std:=
:vector<long long unsigned int>::iterator' {aka '__gnu_cxx::__normal_iterat=
or<long long unsigned int*, std::vector<long long unsigned int> >'} changed=
 in GCC 7.1
>  }
>  ^
> ../../gold/gc.h:375:1: note: parameter passing for argument of type 'std:=
:vector<long long unsigned int>::iterator' {aka '__gnu_cxx::__normal_iterat=
or<long long unsigned int*, std::vector<long long unsigned int> >'} changed=
 in GCC 7.1
> {standard input}: Assembler messages:
> {standard input}:347600: Warning: end of file not at end of a line; newli=
ne inserted
> {standard input}:347687: Error: unknown pseudo-op: `.l'
> {standard input}: Error: open CFI at the end of file; missing .cfi_endpro=
c directive
> arm-poky-linux-gnueabi-g++: fatal error: Killed signal terminated program=
 cc1plus
> compilation terminated.
> Makefile:1137: recipe for target 'powerpc.o' failed
>
> I have looked through the Git log for meta/recipes-devtools/binutils up t=
hrough master HEAD, and I don't see any references to a problem similar to =
this one.  Has anyone seen a problem like this before?  If so, does anyone =
know how to fix it?
>

it seems compiler is out of memory.

> Thanks,
> Bryan
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156424): https://lists.openembedded.org/g/openembedde=
d-core/message/156424
> Mute This Topic: https://lists.openembedded.org/mt/85926755/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

