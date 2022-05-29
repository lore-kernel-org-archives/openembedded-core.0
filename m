Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38CFBC433EF
	for <webhook@archiver.kernel.org>; Sun, 29 May 2022 12:20:13 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.24754.1653826804254070422
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 05:20:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W8A+HSVO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 r9-20020a1c4409000000b00397345f2c6fso1410624wma.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 05:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=8p4cs5xq5lLArE00W62aEYhgwF9txeqY2p8aueKaspA=;
        b=W8A+HSVOjPcagvuBavqKOJasok9r2WgZyMcI4e0t0u5YcVq365pceFlsfbxfuJ6n3l
         McTFBh8fHGy3+5GZa23H5Bhd0/zWhzr5lGTxBqGW59+ywKokRYvSCMj/J/BJv87zeMtF
         l4UuKLI9UC1tpDa+Hben8mwv9pjjsfHr1d/Ao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=8p4cs5xq5lLArE00W62aEYhgwF9txeqY2p8aueKaspA=;
        b=MJD/XSrAReIifXerYKNyvi/9jiBSoMprKMh6Iu6qoYV43Agj3SV7B2/c39osI1Hjew
         SohyS8dbOq/RpktVXD8d0UPVugHjif7VevoqbCf5SjNmk53hjap6r3QjblH/3HdXNIhz
         +Z8nlOgIQY3vpEUkNpasT5q7XpyypETaLvL77nXWyoWUCgqDa+oSX+Inl9KMJK85Ed3Q
         4vI3Lnpwfd9q+FiU3gBaXlWBoCw7lyWCMideDEhfYq5K9qPNW5jRTK0CMTdr5hx6WE78
         L2zvcS63CrfCUHPIBML5B6G5Li9EioeZOFi4MAVz4i0q+/j2H/Ib6RG8QSk31Aui8KG8
         TD1A==
X-Gm-Message-State: AOAM532512CxXlPs07Xtyy4RPmJ9lT+8Eb0b0/ottKoOxO0gK6C2yyZ7
	EqoTaMlekS61FhbU7BE1yTGt8jWipXMvIWEn
X-Google-Smtp-Source: 
 ABdhPJwII5HkZB1XyVZBnWf9cz1zoGpttUtjW2U4mUxLvrxNENGU7a7XtlrROpVShD8jNubvSJafkA==
X-Received: by 2002:a05:600c:1906:b0:397:84aa:5598 with SMTP id
 j6-20020a05600c190600b0039784aa5598mr13150374wmq.81.1653826802248;
        Sun, 29 May 2022 05:20:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4777:d166:870b:18dd?
 ([2001:8b0:aba:5f3c:4777:d166:870b:18dd])
        by smtp.gmail.com with ESMTPSA id
 p11-20020a5d4e0b000000b00210320d9fbfsm998791wrt.18.2022.05.29.05.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 05:20:01 -0700 (PDT)
Message-ID: 
 <5d74fc8ce5e01b47368103c7cb017a1d016e6e20.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/selftest/bbtests: Add taskexp_tty UI test
From: richard.purdie@linuxfoundation.org
To: openembedded-core@lists.openembedded.org
Cc: David Reyna <david.reyna@windriver.com>
Date: Sun, 29 May 2022 13:20:01 +0100
In-Reply-To: <16F38C7CB923A434.32574@lists.openembedded.org>
References: <16F38C7CB923A434.32574@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 May 2022 12:20:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166235

Hi David,

On Sun, 2022-05-29 at 11:25 +0100, Richard Purdie via
lists.openembedded.org wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/selftest/cases/bbtests.py | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/self=
test/cases/bbtests.py
> index cfac7afcf49..d222f0fb297 100644
> --- a/meta/lib/oeqa/selftest/cases/bbtests.py
> +++ b/meta/lib/oeqa/selftest/cases/bbtests.py
> @@ -205,6 +205,11 @@ SSTATE_DIR =3D \"${TOPDIR}/download-selftest\"
>          result =3D runCmd('bitbake -R conf/postfile.conf -e | grep TEST_=
POSTFILE=3D')
>          self.assertIn('postfile', result.output)
> =20
> +    def test_taskexp_tty(self):
> +        cmd =3D 'bitbake -g -u taskexp_tty zlib acl'
> +        result =3D runCmd(cmd)
> +        self.assertEqual(0, result.status, "Command %s didn't run as exp=
ected. %s" % (cmd, result.output))
> +
>      def test_checkuri(self):
>          result =3D runCmd('bitbake -c checkuri m4')
>          self.assertEqual(0, result.status, msg =3D "\"checkuri\" task wa=
s not executed. bitbake output: %s" % result.output)


Thanks for the updated bitbake patch. Since I wanted to ensure there
weren't regressions in the future I coded this test into OE-Core to
ensure it was being tested on a regular and ongoing basis.
Unfortunately it failed on the autobuilders:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3646/step=
s/15/logs/stdio

Does that error make any sense to you?

For reference I've not tested locally myself yet, I just coded the test
in to see how things went on the infrastructure.

Cheers,

Richard

