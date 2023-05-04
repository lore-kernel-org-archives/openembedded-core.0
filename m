Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4909BC7EE26
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 15:07:27 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.52230.1683212837961144646
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 08:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=Rgs906uV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f315712406so68127655e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 08:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683212836; x=1685804836;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a0XpOJTfAVg5pFEP3oIzYx1jxT5K6Bpcnawuwj5pvJI=;
        b=Rgs906uV3uRCmODSkBgaEL5hS6izuC2WLGBS5wLWuLUhIAD5onebteeXJrA/+8NDlx
         RrUt2dJ9lQtAgJomszxb+BrcnRdrPCyADR1OJ8ul9GVzDGHmmJ0GPAeUgYcSB8+acgg7
         ivXDborLECbUa9puc+giDxDaam4vrIWxDiNqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683212836; x=1685804836;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a0XpOJTfAVg5pFEP3oIzYx1jxT5K6Bpcnawuwj5pvJI=;
        b=HRSGI7FSKDWYbcjFhZKCk3KlWxzJvqlf8KROs1iv4M6mfjoQiMKGJ/I7asXnk5fMxg
         qh6mqrhDjspV3I9lYJ6NCbmxmKGWbFH3qD7RxZ3w1P3lXuXnSBIafQahfZCvFC1tvfGv
         ejZyPVZYYLa88N3yd9n+/NJDDXxy/ZNpx597Ryn5Z7lFQ/Gfj+0aFIhR3tqd0XILFo78
         hgIyV2xzwA7CC32HsuHiYkteWSYc9d5slNKsz3d1BJzb4nmE18Rszk3WXt5jzOJHo3bA
         CnOORDjZgIdHrF6RcHTQQMlRXJtIErgR18avMMSV3TBMed8Fo/58iI+M4YolJOlgWckx
         SHEg==
X-Gm-Message-State: AC+VfDwjrU1WdqCeiP14P/b2hnZJl1Oc7yoDzIhvjprnijpLeUIVfiTE
	ReXPuq6R55XKDBt3+NbwWKU6aw==
X-Google-Smtp-Source: ACHHUZ5jH7gl3sLxW498j66bDR3VROWIy2uCFwwV3Sm0Gv4oXQbvE/vzoBxKIRs8X10+sOhTxocxeg==
X-Received: by 2002:a5d:660d:0:b0:2da:3ef5:5a39 with SMTP id n13-20020a5d660d000000b002da3ef55a39mr2794410wru.14.1683212835737;
        Thu, 04 May 2023 08:07:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6749:5fda:5dc0:e535? ([2001:8b0:aba:5f3c:6749:5fda:5dc0:e535])
        by smtp.gmail.com with ESMTPSA id t15-20020adfe10f000000b00304832cd960sm27184631wrz.10.2023.05.04.08.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 08:07:15 -0700 (PDT)
Message-ID: <de0cbb7c94bb9af021f090b684eee4c6b5bb187e.camel@linuxfoundation.org>
Subject: Re: Yocto Project Community Manager updates
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <ndec13@gmail.com>, yocto@lists.yoctoproject.org, 
	yocto-advocacy@lists.yoctoproject.org, openembedded-core
	 <openembedded-core@lists.openembedded.org>
Cc: Josef Holzmayr <jester@theyoctojester.info>
Date: Thu, 04 May 2023 16:07:14 +0100
In-Reply-To: <CAOT3mi+DorC4uSqCwO7HmmFVuXX3BLFWJNp_o-NH4OmqP=6ZSg@mail.gmail.com>
References: 
	<CAOT3mi+DorC4uSqCwO7HmmFVuXX3BLFWJNp_o-NH4OmqP=6ZSg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 15:07:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180879

On Thu, 2023-05-04 at 16:40 +0200, Nicolas Dechesne wrote:
> After five years, I have decided to resign from my position as the
> Yocto Project Community Manager. I joined the OpenEmbedded community
> around 2008. I have fond memories of my early days, and still
> remember some of my first interactions on IRC and mailing lists! This
> is a very welcoming community, always helping new people with
> patience and kindness. Serving the project during the last five years
> is something I am very proud of, and I will be forever grateful to
> all of you for accepting me!

I know we've talked but I did want to publicly say thanks for
everything you've done in the role!=C2=A0

We've had some good times and overcome some challenges in the last few
years, the project has definitely benefited from your involvement and
you'll be sorely missed.

Welcome to the role Josef, no pressure! :)

Cheers,

Richard

