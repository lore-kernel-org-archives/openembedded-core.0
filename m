Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CCDAC43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 09:12:42 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web09.4117.1657098753198487376
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 02:12:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bKukvW7n;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.160.176,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-qt1-f176.google.com with SMTP id h19so17360459qtp.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 02:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=4vAYCp3PcCGkljtswg+PDB9smNBjVn+J0Fz1YOSEoVw=;
        b=bKukvW7nBI3hGFhTHcCcqTkh7f82sDohLXLOo9airVw+3LDuuJDskWGNVNkdvusjaj
         pAWF3BCYVbHxIUTrbQgyZuGDzsptIpEM5HKMSXhBDS0iL2AFA92G6AUuYpoz7Gk3v3HK
         NbufHXswnNMbUq/ACT0/yjco581AveSXDzUhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=4vAYCp3PcCGkljtswg+PDB9smNBjVn+J0Fz1YOSEoVw=;
        b=2rQ+BfAuMv6KBzBGAxA/njDDx5gal1cIy7MKUAPu1TViPHgTy7PQyrd2kRBm4NWNDj
         mMsWfJnfFAGhlEOlVWgTjBgBNCz3yo6Ufgje7UtWn8y/OvBrWkbbUuoHzqKC7iEjhiF/
         CYeEHP4t3aD5e4WM7YEAbvbnebCVSiYrFdgdNN4Iz//BE1EU0zl9HBOkUwjfmPb78MyW
         w8YLFuneHExrxEhcElvtOULF4OnFSEWnmw+ehu86HWrlsBlItwJRf3fXZbqV9iRpEkzX
         8WfBcy01+9LwAJNrBrDpEEi8IV58svOYlRgUj49ojUCoJNdZiDA1ebtLKwudKxMuYpbv
         tFiw==
X-Gm-Message-State: AJIora8dkmz7eS7mIqzSroq3PBAhREGMyjWjXogU1QxfphLJgZ9ShE3p
	pB7F2nO26tGBlK/6M2pXgsT1Mw==
X-Google-Smtp-Source: 
 AGRyM1tf8z+v89zW+7CNia9veYGpKk2zCTqiJcLHOrgf55Iyyfc9o7Md09BtUnWBWOAyqJVWGwDjEg==
X-Received: by 2002:a05:6214:c4b:b0:470:8a1a:fed0 with SMTP id
 r11-20020a0562140c4b00b004708a1afed0mr36746490qvj.125.1657098752203;
        Wed, 06 Jul 2022 02:12:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9b71:63f4:5737:a5c8?
 ([2001:8b0:aba:5f3c:9b71:63f4:5737:a5c8])
        by smtp.gmail.com with ESMTPSA id
 h2-20020ac85482000000b00317cd3edab4sm22851187qtq.11.2022.07.06.02.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 02:12:31 -0700 (PDT)
Message-ID: 
 <8b13b18a7aa7568fc234d58e5871cf9adb3debd5.camel@linuxfoundation.org>
Subject: Re: Question about nativesdk-qemuwrapper-cross
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>,
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 06 Jul 2022 10:12:29 +0100
In-Reply-To: 
 <OS0PR01MB6178C500A5157ED31549D49DA0809@OS0PR01MB6178.jpnprd01.prod.outlook.com>
References: 
	<OS0PR01MB6178C500A5157ED31549D49DA0809@OS0PR01MB6178.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 09:12:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167715

On Wed, 2022-07-06 at 03:31 +0000, leimaohui@fujitsu.com wrote:
> Hi, Richard
>=20
> I added nativesdk- qemuwrapper-cross into my meta-toolchain, and found th=
e content of nativesdk-qemuwrapper script is like the following:=20
> ------------------------------------------------------------------
> # cat /opt/poky/4.1+snapshot/sysroots/x86_64-pokysdk-linux/usr/bin/crosss=
cripts/nativesdk-qemuwrapper
> #!/bin/sh
> # Wrapper script to run binaries under qemu user-mode emulation
> set -x
>=20
> if [ True =3D False -a "nativesdk-qemuwrapper-cross" !=3D "nativesdk-qemu=
wrapper-cross" ]; then
>         echo "qemuwrapper: qemu usermode is not supported"
>         exit 1
> fi
>=20
>=20
> qemu-x86_64 -r 3.2.0  -E LD_LIBRARY_PATH=3D$D/opt/poky/4.1+snapshot/sysro=
ots/x86_64-pokysdk-linux/usr/lib:$D/opt/poky/4.1+snapshot/sysroots/x86_64-p=
okysdk-linux/lib "$@"
> ------------------------------------------------------------------
>=20
> Reference to qemuwrapper-cross, it seems that nativesdk qemuwrapper-cross=
 is not correct.
> Why the "qemu_binary " is " qemu-x86_64"? Shouldn't it be "qemu-aarch64 "=
?
> Is it better to change nativesdk qemuwrapper-cross to qemuwrapper-cross-c=
anadian-${MACHINE}?


A nativesdk-qemuwrapper-cross would run binaries from the SDK under
qemu, so if SDKMACHINE was x86-64, that would be correct.

It sounds like you want a qemuwrapper-cross-canadian-${MACHINE} which
is something different.

Cheers,

Richard


