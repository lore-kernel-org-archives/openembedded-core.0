Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE44FC7EE23
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 12:26:01 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.8353.1685449557710793667
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 05:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=I4cCpmoM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-30959c0dfd6so4427733f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 05:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685449556; x=1688041556;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMwErheTdgaFpuDw5wVioNDfZnGqTE+u1qXXBbhDXb0=;
        b=I4cCpmoMPpR/eSUl8EA2OrR3Hl4sFr5ccWiWwEo3eXjG+HQVJSK0wvapkFNHAYzGUn
         a4KYDnuaA/3y+SKQcUjrC4SMlG61ulDu4FCeb+H7Akr8Nk8pvoAkulw3ZCSkgQDQOHrY
         hXY3WUHVRfIn9Jo2ROKQKZBpoSh+Snqgu7pws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685449556; x=1688041556;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MMwErheTdgaFpuDw5wVioNDfZnGqTE+u1qXXBbhDXb0=;
        b=frvg0nXO1z8xVMtKZxNI0DKgH4TteNIcAWS3eVQtOgZAiB5AgtIeOu/nakljK934zY
         lMGlcrqS+a5xN6cM2L2ClClMUMAtMXjGFdnTboiUEblchPOMAEv0r2FQvIoA+v6zt9Ia
         jr06v2I9fBx+S5zf7vcMluzWPAdjLPvC+mSKWKYwMo0w48+lmGSilRJAzxPXItlZ2tWe
         4oVTsbCAhODO3Wjsgt2+MmMRRKxu+BR+vwuDyXTxq2TT1iwAFUbKK68sVwO2E1/om0ok
         bMF4jaY/sTD1hjYP7KoyllrckkzJqch1QRhvyFcnL2hcVR8XYPulBb6ePpn37kFDCMLv
         G3yA==
X-Gm-Message-State: AC+VfDxDxtshjwpDQTVNq4uDw0rlzEyjtxOGt3BwVn6myuVauQSBgw09
	rwA9AwjFvBGdd4Va0+oN/nMF1g==
X-Google-Smtp-Source: ACHHUZ4i+XrHzzfWosRxPTz3/WY3MNKcWZyQvO7dkGxxMYPMPXNCap/9c2GlBaChX0cqh6iqhle1uQ==
X-Received: by 2002:adf:ec89:0:b0:306:44a9:76a1 with SMTP id z9-20020adfec89000000b0030644a976a1mr1448746wrn.17.1685449556223;
        Tue, 30 May 2023 05:25:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f1a1:bff7:58e4:eab3? ([2001:8b0:aba:5f3c:f1a1:bff7:58e4:eab3])
        by smtp.gmail.com with ESMTPSA id h9-20020adffa89000000b002f6176cc6desm3087380wrr.110.2023.05.30.05.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 05:25:55 -0700 (PDT)
Message-ID: <8efab7e6653575c54e36f50d9ac4f73c5389db3a.camel@linuxfoundation.org>
Subject: Re: FW: [OE-core][PATCH] Revert "sqlite3: update CVE_PRODUCT"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sanjaykumar "kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at
	Cisco)" <schitrod@cisco.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Steve Sakoman
 <steve@sakoman.com>
Date: Tue, 30 May 2023 13:25:54 +0100
In-Reply-To: <SJ0PR11MB6717FA035FCEDBFFD85254B0DC4B9@SJ0PR11MB6717.namprd11.prod.outlook.com>
References: <17633BD1C0C1B26D.6918@lists.openembedded.org>
	 <SJ0PR11MB6717FDF0FA29DCBA25329983DC459@SJ0PR11MB6717.namprd11.prod.outlook.com>
	 <CO6PR11MB5602E50D7AEA18519A55F239ED459@CO6PR11MB5602.namprd11.prod.outlook.com>
	 <SJ0PR11MB6717A6C93932B85EE1CBAEA2DC4A9@SJ0PR11MB6717.namprd11.prod.outlook.com>
	 <SJ0PR11MB6717FA035FCEDBFFD85254B0DC4B9@SJ0PR11MB6717.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 12:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181919

On Tue, 2023-05-30 at 11:39 +0000, Sanjaykumar kantibhai Chitroda -X
(schitrod - E-INFO CHIPS INC at Cisco) wrote:
> Hi team,
>=20
> I had discussion with Chen for this patch, but conversation is not availa=
ble on OE-core patchwork.
> Anyone has any idea, why we can't see our conversation on website.
>=20
> @Steve Sakoman @richard.purdie@linuxfoundation.org
> Please take this conversation in consideration, and help/guide us on how =
to proceed further.

I merged the revert, thanks.

Richard

