Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC7FAC43334
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 13:36:08 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.41733.1656336961244921636
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 06:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xw7tnpPI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id o16so13127365wra.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 06:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=+O/Wwd/ponhD9mR+/Mv1VfxTY328kNDJ6yIRcfNEZOM=;
        b=Xw7tnpPIWvzvw7vwgs0JUXJB8UzHgJg5BoTwLvEdV6Tq873CKt/W5UhsX7NNJVxsPU
         cy+AejIrXOdaALKss1H7L12Afc5yHh/mC3DTcm6pI/HlnG+Bk5qJ76GmBO4cImePVufK
         PS29SUeYJQoaehtzBoMEhL9h16zKvJe9ITCvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=+O/Wwd/ponhD9mR+/Mv1VfxTY328kNDJ6yIRcfNEZOM=;
        b=NI6WaywMQ7S3zYul9oU8i9Kj9gNqizl0dPcOlRsb8Ayx4sojsVVKBHN2Ed5TUf7954
         evx4W3wOVYlKtBCP70hOSXVpT93VvhUf+uvoJx/hTRwSXJzd+fu4jL2etfDO6B3G2xgU
         yMA5hljFWgl8UIjtPqlbxi7nHt5JxbwdJhVKCT+UfvimJ8HCJ/J9T0NHBBOCiYfuia2/
         vmR2n1gSDM5tK9q+O+DflRa7JpOVkeB+U1tU8WQTz40xI2oRakRRwyUKlErBjXJMnECR
         MMQjiS2SqIRt4JqZsPwfeK5SteDDOl+YOFRNGqW5xn4W6uamAEFnT2prjuJINWazOfIJ
         Nh9g==
X-Gm-Message-State: AJIora9zb06pEJEos8tdZV0sEP+LL0jGdq9nXMz2yAHrO++pJg8rvplE
	/0z6NxvYfAjJ6ojLHXIKRCIb/Q==
X-Google-Smtp-Source: 
 AGRyM1tV0adnf0CbXErRc2579d+H0X2g3rGZRy3277bfqwpeyEDKb+tAS9p/qMnw777wyb2wCx5KLw==
X-Received: by 2002:adf:f6d0:0:b0:21b:c3f8:6230 with SMTP id
 y16-20020adff6d0000000b0021bc3f86230mr9691211wrp.116.1656336959471;
        Mon, 27 Jun 2022 06:35:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8950:ad6c:6fd6:5033?
 ([2001:8b0:aba:5f3c:8950:ad6c:6fd6:5033])
        by smtp.gmail.com with ESMTPSA id
 id18-20020a05600ca19200b0039c871d3191sm9491757wmb.3.2022.06.27.06.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 06:35:59 -0700 (PDT)
Message-ID: 
 <cc2e9dad3bcab4cd3e0d11c65241476142324c8b.camel@linuxfoundation.org>
Subject: Re: eSDK dependencies
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Valek, Andrej" <andrej.valek@siemens.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, "Marko, Peter"
 <Peter.Marko@siemens.com>, "Freihofer, Adrian"
 <adrian.freihofer@siemens.com>
Date: Mon, 27 Jun 2022 14:35:58 +0100
In-Reply-To: <57e72a0fe687a49a7efcffa167adab843305b612.camel@siemens.com>
References: <57e72a0fe687a49a7efcffa167adab843305b612.camel@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jun 2022 13:36:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167321

On Mon, 2022-06-27 at 12:32 +0000, Valek, Andrej wrote:
> I have a question related to eSDK dependencies. We're using the dunfell
> branch were everything related to this eSDK topic works fine. Now we're
> in the transition phase to new LTS branch, where were we found one big
> difference between eSDKs.
>=20
> The old variant (dunfell) includes all application build dependencies,
> but the new variant (kirkstone/master) doesn't. Means if I installed
> the eSDK and used "devtool modify my-app" (application installed on the
> image) it works without any additional build deps recompilation.
> But now, if I do the same on the newer version it always recompile all
> build deps.
> I was already looked, what could be changed, but I didn't find so far
> something suspicious. So the question is, what has been changed, and
> how to bring the old variant back?

Guessing is hard. Since you're asking me to guess:

https://git.yoctoproject.org/poky/commit/?id=3D568f62214bca3ac6d35eef8d9f45=
62596fb4c9ab

which was partially reverted here:

https://git.yoctoproject.org/poky/commit/?id=3Df22e1fbdf7bed111e080d176fe5a=
39c5139308ed

maybe? It could be something else. It wasn't a specific change to
remove such dependencies but I suspect it could have happened as an
unforeseen side effect of something else.

You may need to come up with a simple test case and then bisect between
the two releases to see which change it was. Once we understand what
change caused it, working out a solution would be easier, it is
premature to even try without knowing the cause.

Cheers,

Richard





