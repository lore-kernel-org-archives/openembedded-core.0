Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792D4EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 22:27:19 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.3311.1687300037390362466
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 15:27:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=LbhoOHd6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4f8735ac3e3so3726069e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 15:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687300035; x=1689892035;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XATnqODBfktbo1CVNLiKJIrQJJpAZWnTAtVZy7nWGNQ=;
        b=LbhoOHd6SpwL+Bf+HEkRjFylpujsG8/vv1kP44SpsC6U66pDdLP5uzkzsYJuoarAC8
         sConi7Ng4Y23XJAEBXlls13O6rYxFfoaRLVrQBrGHGqUqozyRnlpkOjH+QdrYFGnCqbU
         CDNx5x2gQ6SwXFGsWwBK3BCvAKPvKUVucbbmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687300035; x=1689892035;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XATnqODBfktbo1CVNLiKJIrQJJpAZWnTAtVZy7nWGNQ=;
        b=mFxqbeLhZXQvaVavyNwehFPo5D31iomj6EaTP12m0QQWrtsGBaruluNyu4d9LgtipI
         G460679CGYAqRbw1NXIxoHU/jKbel/IYP9juMI0DawjLlIZCjvm/+ibvbeBTUM5Tk9Ns
         zxHYtDVczPJdMDTgtnuC390iZWlOJS4u6wBxNtofRhaTMileOvIKoqrFTyh+oJEVQ3uk
         zT3p9B1sACqHAzrCtGtAHMBCTxEhrh8AcrhHu0JMhBNhSiO50Rm6vpz1jHufGvetfV2C
         QQepJHoQ4ncotN9B6bVhts61Lmxrg9raPRcQrxeea/ha9jgB70YPwZQKg+2jePIpVNJY
         Zocw==
X-Gm-Message-State: AC+VfDwAPxiq1+PLye1ZsMWSQa4Bf+AbpVnneXepjGqpr610Ss99KmTk
	qqXii4ghqU8J/K4npH5ayFXDpR6kK9Y9lnyhw0w=
X-Google-Smtp-Source: ACHHUZ47cfuEMXHzpmrvT8z3kWS3/VNNmSLlRMhU+xFItwg6cOoTiwPCUD6/tK2k7OCqWHmlyVQCJw==
X-Received: by 2002:a19:f201:0:b0:4f6:25ca:f147 with SMTP id q1-20020a19f201000000b004f625caf147mr7118632lfh.63.1687300035392;
        Tue, 20 Jun 2023 15:27:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1417:9a5:3a38:428a? ([2001:8b0:aba:5f3c:1417:9a5:3a38:428a])
        by smtp.gmail.com with ESMTPSA id p2-20020a7bcc82000000b003f9bcba3839sm444195wma.12.2023.06.20.15.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 15:27:14 -0700 (PDT)
Message-ID: <364ea28638465e51a624b33e7944d659dce9f3a0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] insane: Improve patch-status layer
 filtering
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 20 Jun 2023 23:27:12 +0100
In-Reply-To: <20230620221604.751c44f4@booty>
References: <20230619140602.2669368-1-richard.purdie@linuxfoundation.org>
	 <20230619140602.2669368-2-richard.purdie@linuxfoundation.org>
	 <20230620221604.751c44f4@booty>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 22:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183161

On Tue, 2023-06-20 at 22:16 +0200, Luca Ceresoli wrote:
> Hi Richard,
>=20
> On Mon, 19 Jun 2023 15:06:02 +0100
> "Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:
>=20
> > Now that we have layer overrides, we can easily enable patch-status in
> > ERROR_QA without the hardcoded code making it easier for other layers
> > to opt into the checks.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> I love the cleanup this patch introduces, however I'm afraid it seems
> to be causing some failures on selftest:
>=20
> AssertionError: Command 'bitbake  dos2unix -c patch' returned non-zero ex=
it status 1:
> ...
> ERROR: dos2unix-7.5.0-r0 do_patch: QA Issue: Missing Upstream-Status in p=
atch
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5367/st=
eps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5402/st=
eps/15/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5325/st=
eps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5375/st=
eps/15/logs/stdio
>=20
> Luca
>=20
> PS: I noticed you seems to already have a fix under test on
> origin/master-next!

Thanks! As you noticed, I did have a fix I was testing and I did run a
test build of that just of oe-selftest. I've squashed a couple of
selftest fixes into the commit and merged it.

Cheers,

Richard


