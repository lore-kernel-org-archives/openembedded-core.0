Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B208EB64D7
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 21:24:31 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.2841.1686691464342872160
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 14:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=E/MGHOqw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f8d17639feso244645e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 14:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686691463; x=1689283463;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TBKN98MdmOLAj9fMOi0ifEUh7w4kefdPXhI9kxOK99o=;
        b=E/MGHOqwMCfhdRGXb+TennkK3ha2TwFpsUd3q4h3vn4lcEL+7Rzu6yUPhsSsTyzTHi
         Pk+i9Y/EC/VR2R/45GSsRCWA4agFitLxcrJC4wlvZ82rKB22CGy4kZmZ2IgWdHeLR/pR
         5vPppOH0p2dXiPKHOB9qHev4zdFnKQxFrmuME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686691463; x=1689283463;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TBKN98MdmOLAj9fMOi0ifEUh7w4kefdPXhI9kxOK99o=;
        b=YZA0S+NvSS+PliAWzaMGV5huBoTWewzqL489RsqmTzE8wCP7PZSwsheg9QLG8xmgIB
         bNWtbbkLslrIOos7iMOZUYsuGhX1U/lbri1PlDeMMxU6JsnuRhIZUeBPbco+xNwP1UQN
         2atEFvVRO7Qt2QrancHSytMdzPrBcHnIZueLRG0Lw2xw1NGMbhUR3J7TtUwlSHfCPxZ6
         DYD/oQi5XfaAck5tLTqRreSbqzd5xv9qRbrKLbkPkf01q2gYIj0HBrpeCNyCDLlY1o25
         maLl4+k8EFa12Cst63vRMLFaGy2teZFddrG8HtP6E8t2TASz3sfG9IWv6OlIpUDb3Mzi
         8mww==
X-Gm-Message-State: AC+VfDxKIOJw+sMXcRY1/DdHSokWw+/qI9rd74yY4ssyMO2ihFZdOo3H
	2TxbjsE3BGjKOdZwHEKL3GNr6g==
X-Google-Smtp-Source: ACHHUZ7pTC1/TcSQo7SaZVxJpR0NqSWmkBo3h0fLmx32H0YcoDtDgYUG9nCbQHGh999iIrMUriM7fg==
X-Received: by 2002:a7b:cb0e:0:b0:3f4:2ae5:b35d with SMTP id u14-20020a7bcb0e000000b003f42ae5b35dmr10223437wmj.40.1686691462774;
        Tue, 13 Jun 2023 14:24:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5d56:2e19:9720:bd3b? ([2001:8b0:aba:5f3c:5d56:2e19:9720:bd3b])
        by smtp.gmail.com with ESMTPSA id c12-20020a05600c0acc00b003f195d540d9sm15420343wmr.14.2023.06.13.14.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 14:24:22 -0700 (PDT)
Message-ID: <345f887bd5106191de487035800018c318ce227e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/selftest/bbtests: add unexisting
 prefile/postfile tests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Fabien Mahot <fabien.mahot@smile.fr>, 
	openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 13 Jun 2023 22:24:21 +0100
In-Reply-To: <20230612084423.13122-1-fabien.mahot@smile.fr>
References: <20230612084423.13122-1-fabien.mahot@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 21:24:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182727

On Mon, 2023-06-12 at 10:44 +0200, Fabien Mahot wrote:
> Fixes [YOCTO #10725]
>=20
> Signed-off-by: Fabien Mahot <fabien.mahot@smile.fr>
> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta/lib/oeqa/selftest/cases/bbtests.py | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/self=
test/cases/bbtests.py
> index 1dd2839c8d..7ca1c306bb 100644
> --- a/meta/lib/oeqa/selftest/cases/bbtests.py
> +++ b/meta/lib/oeqa/selftest/cases/bbtests.py
> @@ -188,6 +188,10 @@ SSTATE_DIR =3D \"${TOPDIR}/download-selftest\"
>          self.assertTrue(find, "No version returned for searched recipe. =
bitbake output: %s" % result.output)
> =20
>      def test_prefile(self):
> +        # Test when the prefile does not exist
> +        result =3D runCmd('bitbake -r conf/prefile.conf', ignore_status=
=3DTrue)
> +        self.assertEqual(1, result.status, "bitbake with unexisting pref=
ile didn't run as expected:: %s" % result.output)
> +        # Test when the prefile exists
>          preconf =3D os.path.join(self.builddir, 'conf/prefile.conf')
>          self.track_for_cleanup(preconf)
>          ftools.write_file(preconf ,"TEST_PREFILE=3D\"prefile\"")

That patch itself looks good, thanks for working on this.=C2=A0

One small tweak is needed as "unexisting" isn't really a word that
sounds correct to a native English reader although they would be able
to understand the intent. "non-existent" is probably the closest word.

I'd probably phrase that message as:

"bitbake didn't error and should have when a specified prefile didn't
exist: %s"

as I'm a big fan of really clear test failure messages where we can!

Could you update the patch with a v2 and tweak the messages please,
then we should be able to test and merge if successful.

Cheers,

Richard

> @@ -198,6 +202,10 @@ SSTATE_DIR =3D \"${TOPDIR}/download-selftest\"
>          self.assertIn('localconf', result.output)
> =20
>      def test_postfile(self):
> +        # Test when the postfile does not exist
> +        result =3D runCmd('bitbake -R conf/postfile.conf', ignore_status=
=3DTrue)
> +        self.assertEqual(1, result.status, "bitbake with unexisting post=
file didn't run as expected: %s" % result.output)
> +        # Test when the postfile exists
>          postconf =3D os.path.join(self.builddir, 'conf/postfile.conf')
>          self.track_for_cleanup(postconf)
>          ftools.write_file(postconf , "TEST_POSTFILE=3D\"postfile\"")
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182656): https://lists.openembedded.org/g/openembedde=
d-core/message/182656
> Mute This Topic: https://lists.openembedded.org/mt/99478990/1686473
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ri=
chard.purdie@linuxfoundation.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


