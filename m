Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40567CD4F21
	for <webhook@archiver.kernel.org>; Sat, 16 May 2026 07:01:51 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1919.1778914901111976332
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 May 2026 00:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IiGZoQ/X;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-44c350a5b87so223297f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 16 May 2026 00:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778914899; x=1779519699; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G9qr5CDMq1QLVVdeeDU81MEfZShPuSGKSJ/BZs0/T+c=;
        b=IiGZoQ/XK71Xez9ozqC9/K271Ok14uoDcqCHQfE7LBT2Tjs10XJ7OYj5ESQujO78W2
         ueuVLpKdbItI+5NGIdfkKH5GqcxhA3inJeUCHMYMVmBI9Eaws7O7vR6iZLMifL1gNvVK
         pIWUBL/7Rw+rYvmXDfC7SMgLpEbXItkDtmlVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778914899; x=1779519699;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G9qr5CDMq1QLVVdeeDU81MEfZShPuSGKSJ/BZs0/T+c=;
        b=OHfel2OYtxOhicaxf4VSyirKobDCcroRDZKj/oQeVvzU2TtIulWMi7vHcsGxUirBMt
         D2uMAJkFTIHAbROn2i4JDIys2W0VQAF31QyDMhE0/B36bPqBqAqMIrtSaoZMcUBAmdj2
         Q0OOhrNuYgtOocVSYuxIgirv3C3vpB+AtB3yRqD2+94J2DqMdJjXks+xhBZ3HA+gB9G7
         rF4+cgFkxrdwUrrjg8mTeG/pB3d9HAi8QBBd5S0sBF362QMmprCl60IJ8sdXJlFmsL1b
         l2fIIS5T/aWvFdOs6aJw0/zFiXObOWjwcBJXGj6Bd6u6e/qln0mggtSgX466dpehRItZ
         bGYA==
X-Forwarded-Encrypted: i=1; AFNElJ8EDsUtC6BsVV2aK9DKrgFbB7jRkKvJaXD4cGQvpyHYewLNqkYEkb+Nyp0mj4ZjpmU2yEY/9oMOXlp/q+bujEqgjQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxuZUbNVlnoZfHyb1LVCh6dXO3aMCnOECoFaQpr0Of06nHt7qt7
	N7ClF4AAngTnMmjRqz6qLx89TL8GQV/BBhR6EJfHc98IhSfSwrPYtEoJhEHbJVbdiJc=
X-Gm-Gg: Acq92OEBQ6MXXEuWosKXCC/pLkFplYaXJcuoiTWa3d/ZFcCmhd4mZSarDUObTOKQtxz
	PwDurkFPl8OA9pLFDbJE8QZOe6b2Sq8aChqay03xzjLlMZ6Uu3cFR/A9FGOEsR5VTU+EZGQIaXb
	u2B3AJBxaOeeiVIgeRV2V6/aOFYIAalRMModfWbLmPELTqsEKY1HXPhZOaEqVbfCBWnZTmtSNgT
	jZHEHJ8Eb4H+ueubSj1vIclWXsK4zXh/fBprdZY0b4EvY6CfMEYqlm37WROOCYz95EbwuRrii0Z
	I6e53/+SPEHXi33U+cptnyyZ5r94EBQbv5e9BLKoM5EjEXSccNIMo6CHrHuNSac8RFB8TrtyH7O
	F9+fjt5B6VR3ChuXJ7sqG/a2AZwRuk2QAWz5yPDo14SRcIXWP+7rMh2mgk3fphuRZKsW7+pm80o
	8ON65pYY9q3bN0NwMStZQGMBbMQIMeN6wvRbWRDSN2n0LnTPxghesHQO/GKkWW6wM0/tfQrOGwl
	Ar1lOScCeQHxA==
X-Received: by 2002:a5d:5847:0:b0:45d:b14b:2402 with SMTP id ffacd0b85a97d-45e5c5af3d6mr10145030f8f.11.1778914899285;
        Sat, 16 May 2026 00:01:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:352c:7135:a073:c09? ([2001:8b0:aba:5f3c:352c:7135:a073:c09])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3ac86sm20319500f8f.14.2026.05.16.00.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 00:01:38 -0700 (PDT)
Message-ID: <faa3919e8145fdb9f49b9e360d6aca83abae43dd.camel@linuxfoundation.org>
Subject: Re: [OE-core] adding WXwindows-exception-3.1 license?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jan.vermaete@gmail.com, OE-core
 <openembedded-core@lists.openembedded.org>,  Joshua Watt
 <JPEWhacker@gmail.com>
Cc: Rob Woolley <rob.woolleywr@gmail.com>
Date: Sat, 16 May 2026 08:01:38 +0100
In-Reply-To: <CABF_=ygrm+zsyehypM_iRpdfdnH8DSTCMK-Dtt=OQsy3aFtYPw@mail.gmail.com>
References: 
	<CABF_=ygrm+zsyehypM_iRpdfdnH8DSTCMK-Dtt=OQsy3aFtYPw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 May 2026 07:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237186

On Fri, 2026-05-15 at 19:12 +0200, Jan Vermaete via
lists.openembedded.org wrote:
> The WXwindows-exception-3.1 license is a valid SPDX license [1].
> And used in the `openscenegraph` recipe of meta-ros [2].
> Generating the spdx (do_create_spdx) is now failing for this recipe.
>=20
> Could this license be added to the `spdx-licenses.json` file?
>=20
>=20
> [1]: https://spdx.org/licenses/WxWindows-exception-3.1.html
> [2]: https://layers.openembedded.org/layerindex/recipe/438736/

That file is generated from the the scripts/update-sdpx-licenses.py
update script. I did just run an update so we can pull in recent
changes however that license isn't among them.

I therefore checked and it is because it is a license exception, not a
full license.

Copying Joshua, I'm not sure how we want to handle the exceptions.

Cheers,

Richard

