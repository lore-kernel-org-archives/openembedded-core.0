Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A60EB64D8
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 09:07:05 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.6632.1687338419191916292
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 02:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=P/r5iVEL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f8fe9dc27aso42917955e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 02:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687338417; x=1689930417;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=esZ6Sl0WwDzy3BFVEirrrc7Sb0Az52xMtikTCZetD2E=;
        b=P/r5iVELGqUoa5kwdWK4ovjOWjiwQZfJ9glpyXBhdfv20io/923CZSDv0WlukSTFwT
         txKFS0FjB2sRMEDnvkqv7qxvsZ+X4LqZs9xkolclpAx4hxYZtd4Gy6Gj/aLRm1jIqcHt
         SB+zs0Af/hJmLn0GT+37WJ2ntJpB85PA0rHos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687338417; x=1689930417;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=esZ6Sl0WwDzy3BFVEirrrc7Sb0Az52xMtikTCZetD2E=;
        b=Wp4eJrsLAt6cS4yA4tDevNRqzmwWCmI+up3d+QIvmvDcKIZqoyxAR/7ZY5GeAfqyg+
         zv7ZebLdxtdOnHn6HRRs9zJGGF53s6g0Akhviaq1WoiPRFK2rIgM5fzjbFTkBtzGZPC+
         S7Z9I6X/i0kX8XBt5xFb6hTvLbHFXsTB5IrYZUOShVTN27ImoiJZO1YYcUoWtvZIZuS4
         +vtBt0TSQV+aprha+QnHg9S2oSnqRdc7fW0w1GWH3sHvrKjw+iI/x5wxdIFZ9dN1o6Qm
         TkRnF34WzQSn+ziKYf8nKtYvA2iAP2i6qxXv4Fu+2BpFKhhstjy7qdrU5R4dXLPFIYMl
         BZIg==
X-Gm-Message-State: AC+VfDwZ+C1sfWsF/F0KdMKqNaSDpCDpeggbUYJvuQxr5og/ZK7l6BFi
	NpLah5n/1BBDcISRuOnJe5VnqQ==
X-Google-Smtp-Source: ACHHUZ75Oo/883U39gvEMl5sLfbtN7AAwqx5ikI9h075Mrk+1VvTUnkEeYN//MlZ0EWQuSfzU6LAwQ==
X-Received: by 2002:a05:600c:d7:b0:3f9:b1e7:8a47 with SMTP id u23-20020a05600c00d700b003f9b1e78a47mr5247193wmm.1.1687338417490;
        Wed, 21 Jun 2023 02:06:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1417:9a5:3a38:428a? ([2001:8b0:aba:5f3c:1417:9a5:3a38:428a])
        by smtp.gmail.com with ESMTPSA id m4-20020a5d56c4000000b003078354f774sm3900257wrw.36.2023.06.21.02.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 02:06:57 -0700 (PDT)
Message-ID: <91fe8cff8d11c0b241a0364a524c28ecdffc4afa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] insane: Improve patch-status layer
 filtering
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 21 Jun 2023 10:06:56 +0100
In-Reply-To: <CA+chaQeWv30wOP01eMRYybHZo90eQf7uPO0pXWLYcwy80YKvvQ@mail.gmail.com>
References: <20230619140602.2669368-1-richard.purdie@linuxfoundation.org>
	 <20230619140602.2669368-2-richard.purdie@linuxfoundation.org>
	 <20230620221604.751c44f4@booty>
	 <364ea28638465e51a624b33e7944d659dce9f3a0.camel@linuxfoundation.org>
	 <CA+chaQeWv30wOP01eMRYybHZo90eQf7uPO0pXWLYcwy80YKvvQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 09:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183178

On Wed, 2023-06-21 at 10:58 +0200, Martin Jansa wrote:
> There is maybe unexpected change in behavior caused by this.
>=20
> Before it was triggering error only for .patch files in oe-core,
> while now it seems to apply for all recipes from oe-core layer
> (independently from where the .patch file was added), so e.g. meta-
> raspberrypi is now causing bluez5 do_patch to fail:
>=20
> bluez5-5.66: Missing Upstream-Status in patch
> meta-raspberrypi/recipes-connectivity/bluez5/bluez5/0001-bcm43xx-Add-bcm4=
3xx-3wire-variant.patch
> Please add according to https://www.openembedded.org/wiki/Commit_Patch_Me=
ssage_Guidelines#Patch_Header_Recommendations:_Upstream-Status . [patch-sta=
tus]
> bluez5-5.66: Missing Upstream-Status in patch
> meta-raspberrypi/recipes-connectivity/bluez5/bluez5/0002-bcm43xx-The-UART=
-speed-must-be-reset-after-the-firmw.patch
> Please add according to https://www.openembedded.org/wiki/Commit_Patch_Me=
ssage_Guidelines#Patch_Header_Recommendations:_Upstream-Status . [patch-sta=
tus]
> bluez5-5.66: Missing Upstream-Status in patch
> meta-raspberrypi/recipes-connectivity/bluez5/bluez5/0003-Increase-firmwar=
e-load-timeout-to-30s.patch
> Please add according to https://www.openembedded.org/wiki/Commit_Patch_Me=
ssage_Guidelines#Patch_Header_Recommendations:_Upstream-Status . [patch-sta=
tus]
> bluez5-5.66: Missing Upstream-Status in patch
> meta-raspberrypi/recipes-connectivity/bluez5/bluez5/0004-Move-the-hciatta=
ch-firmware-into-lib-firmware.patch
> Please add according to https://www.openembedded.org/wiki/Commit_Patch_Me=
ssage_Guidelines#Patch_Header_Recommendations:_Upstream-Status . [patch-sta=
tus]

I did mention this in the docs update patch to the migration guide I
sent yesterday. It wasn't entirely expected but is a side effect from
the way the layer override works as it is based on the recipe itself,
not where the patches may reside. We noticed it on the autobuilder for
meta-agl for example and it also broke from of the selftests.

Overall, I don't think this should be a huge issue once we update the
hopefully small number of patches to core recipes in layers and the
layer mechanism is an overall win in the end?

You could work around this with things like:

ERROR_QA:remove:pn-bluez =3D "patch-status"

to, not that I'd recommend it.

Cheers,

Richard



