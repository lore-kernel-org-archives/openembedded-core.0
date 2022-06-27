Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77350C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 16:47:59 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.44334.1656348475505102085
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 09:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GFiRuCbO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id i1so9409906wrb.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 09:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=rG4E/6WbNEwuZDhctaf0Mp5SkLtUYFGP3Pz8O3xS554=;
        b=GFiRuCbOtwiDIYzkPk6mwytCnNqJtGylrjZZvTZ3+2T3LN4nMMvtgLgESOYI4rlExk
         Apd1As6kkQmJGZB/JeiNzrdAdrtZkByF/ZXa7zfTV01x6zIiPogjI+ZQnoMoRmoiilJl
         SDqriV94DPXtY+AZFIoeHJmJ8yPr6LUoVAysE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=rG4E/6WbNEwuZDhctaf0Mp5SkLtUYFGP3Pz8O3xS554=;
        b=BhLqSsR7TQUauzAeIpo1H+XEUquvA+FX7o/R6UJpNKkg0S2y779IxaZ1Dp2S0UfXkW
         PsRLnhHzbfIayd280g2sdiv4W9QXzQG8diejqxtp3kCMxSl+bSLaLyOcoGoJ0EqtnmOb
         rdv12KarUIxx5lzjDlg76H5Jcoi47SfCSFZ+68Jl8iXmfPVLS7JlojBXJZLocXRHZ2uo
         bj5A2h7uYPrSafrX/GAGaaYyojl7OKuw50ZFfFPiCnFVCpE5eYGClFQraMjpmJYbqalD
         RO9kbssqsZMiCnRecM+mY2xYbb8oaA/Q2wEUHOnqFHJk0DESq/gBxNo69ObBT7nX8zyC
         zt5w==
X-Gm-Message-State: AJIora+UQddOuOowZKcZMvm1/liprMl+4N59Vvf5yu3HieOxPjxXsqIq
	99jKSgOuTiJi8GqtTMf7V6BpjQ==
X-Google-Smtp-Source: 
 AGRyM1tJcEC9ae2MEC7keimefkoaR10VoLT62zJd2FBnrDZNUVCPpsSszVPv3fsHlHkiuw5KcWhOMw==
X-Received: by 2002:a5d:64cf:0:b0:21b:9416:f9c6 with SMTP id
 f15-20020a5d64cf000000b0021b9416f9c6mr13713428wri.599.1656348473973;
        Mon, 27 Jun 2022 09:47:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8950:ad6c:6fd6:5033?
 ([2001:8b0:aba:5f3c:8950:ad6c:6fd6:5033])
        by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c485600b0039aef592ca0sm13996576wmo.35.2022.06.27.09.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 09:47:53 -0700 (PDT)
Message-ID: 
 <488fac057190a6378b550763fbcd1faaa9b22cce.camel@linuxfoundation.org>
Subject: Re: [OE-core] Error building an npm package: npmignore: not found
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: enrico.scholz@sigma-chemnitz.de, "Michael Opdenacker via
 lists.openembedded.org"
 <michael.opdenacker=bootlin.com@lists.openembedded.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	michael.opdenacker@bootlin.com
Date: Mon, 27 Jun 2022 17:47:52 +0100
In-Reply-To: <lyo7yef4fu.fsf@ensc-pc.intern.sigma-chemnitz.de>
References: <d5e6b77b-096d-3dd8-8c42-18c7adbb9fb2@bootlin.com>
	 <lyo7yef4fu.fsf@ensc-pc.intern.sigma-chemnitz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jun 2022 16:47:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167328

On Mon, 2022-06-27 at 18:37 +0200, Enrico Scholz via
lists.openembedded.org wrote:
> "Michael Opdenacker via lists.openembedded.org"
> <michael.opdenacker=3Dbootlin.com@lists.openembedded.org> writes:
>=20
> > I'm testing the Yocto Project Documentation for creating NPM packages
>=20
> npm is broken since kirkstone; see
> https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D4303 fo=
r
> patches.
>=20

Thanks for the reminder, we should probably test and merge these. I was
hoping we'd get some review from someone else but it seems not many
people are using those code paths :/.

Cheers,

Richard

