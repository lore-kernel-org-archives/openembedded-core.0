Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80CC6EB64D7
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 07:43:36 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.7146.1688111008157180249
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jun 2023 00:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=XQh8/Ipi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3fbc6ab5ff5so4127815e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 00:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1688111006; x=1690703006;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhfheJfakhAy129+AmQh8k4Rl4zhMo8qldCTQA+0wTM=;
        b=XQh8/Ipiq+wKlu6oAd1CyH7l0otQKsaDr5yJcrMJB5MZFxeTo/z2MrN+VhCIDaupkL
         Du0xgNjUtpfC8UhmuwCui7A+rntTNUykQcC751B2onVu8pMah7QSNe/xmtclIN2I40b8
         V8O8KTpLYakVE4bzypvLA43O5MUOaLKXLFbRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688111006; x=1690703006;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fhfheJfakhAy129+AmQh8k4Rl4zhMo8qldCTQA+0wTM=;
        b=Ha2I2hFnjOxBJk4AH1gv0wWh2WdIGAen9I1PJzIf90PFqg451ny9l9IYMOc0x7PdSe
         BCOuuCk4YvxO/q97ZpnzS3b+QRVVHQ9gSgRfwl1skkhgElyuUjJeNXzazaTegcAL1rE+
         rFKh4NvBGgzCg5fGKgYcI9GLLIew/Fsw52H1dX9u9hd0wEHruTaJmaYYBdsGfwT2gxfx
         wOzg4B7t74uK3YqOtEW1P+4ubMEf/G4Yzhpp8Sw3AQshD7UC7XwBmvZQjG93HVYAR3xY
         Uldp1edQV7cP9hrz/gorFltKoeYAnu98OU/b8mIBLlvp+k6IcundyaNOteOxmATxEPx/
         i7Gg==
X-Gm-Message-State: AC+VfDyQ2iRbRivewFNcTpLN2Iv9tM7w+DYkDOlyDeacyFbhsvW9COHA
	7t8I+/aZm2l+D1AZXzajQTwASw==
X-Google-Smtp-Source: ACHHUZ4OZNWuB/p3Ar8OfOtuQD7USzMd+/1XvuilIomtukd7v+/6CbxrqNaMVt7VQlm5r7OijKlWRw==
X-Received: by 2002:a1c:7706:0:b0:3fb:b61f:c719 with SMTP id t6-20020a1c7706000000b003fbb61fc719mr1281037wmi.33.1688111006387;
        Fri, 30 Jun 2023 00:43:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:dd8:5bad:5828:567? ([2001:8b0:aba:5f3c:dd8:5bad:5828:567])
        by smtp.gmail.com with ESMTPSA id v10-20020a5d590a000000b002fda1b12a0bsm17817878wrd.2.2023.06.30.00.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 00:43:25 -0700 (PDT)
Message-ID: <b87132e89e3e63e4f42bd82fe250ee65c8500ba9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH] uninative-tarball.xz -
 reproducibility fix
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: robert.berger@reliableembeddedsystems.com, Robert Berger
	 <oecore.mailinglist@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 30 Jun 2023 08:43:24 +0100
In-Reply-To: <51f1cfe2-e2a6-4b7f-f640-85567342e798@reliableembeddedsystems.com>
References: 
	<20230629140258.5635-1-Robert.Berger@ReliableEmbeddedSystems.com>
	 <36bd8483782bbbdf9a24c3f5fe9f1ccabf25554f.camel@linuxfoundation.org>
	 <51f1cfe2-e2a6-4b7f-f640-85567342e798@reliableembeddedsystems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 07:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183684

On Fri, 2023-06-30 at 09:03 +0200, Robert Berger wrote:
> Hi,
>=20
> My comments are inline
>=20
> On 29/06/2023 16:07, Richard Purdie wrote:
> > > +SDKTAROPTS_ADDON ?=3D "--clamp-mtime --mtime=3D@${SOURCE_DATE_EPOCH}=
"
> > >  =20
> >=20
> > Thanks, looks good. I did wonder if we could just put this in
> > SDKTAROPTS though? Do we really need to add a new variable?
> >=20
>=20
> Functionality-wise it's fine to add it to SDKTAROPTS. The default value=
=20
> I added would give people the chance to experiment with different=20
> options as well.
>=20
> If you want me to "hard code" it I'll create a v2.
>=20
> Just let me know.


Lets just add to the existing variable, I don't think we need another
one for this.

Cheers,

Richard

