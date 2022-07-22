Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6AAC43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 16:47:07 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web12.9988.1658508419545805250
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 09:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=juw/VzD2;
 spf=pass (domain: gmail.com, ip: 209.85.160.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id a9so3897324qtw.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 09:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+hDbJgwTf7g9lBKNO6RgzJbw0BfL24aZ5OXt42vMub4=;
        b=juw/VzD2xP0UNn1y1VX8u+AzA8lrb8CR6+LcOA6tNpCrfetdP5dUz0C2AQhoRzedJ7
         UHVZdrTeekaBPGC4ltGWD+wJ3+kfLNtyJm/juzpmmaZOrl3oIkrgbfPOQBzISEFDtCBa
         Nqi8XSngJNiI5tDcvryxXIRl/zZmLeT+fPjWFJBKT+KQRDY4UYMKwGhKGHtMcDbEzaDn
         /EEAC04OT+Sj3GiTgvSIYe9C4oF60vn3P5QJpSkH+7DUS1MdwNKxdnSLQRmQv5v9IVjX
         F1/hYN4Jo3BWYXjYGHzPM6x0F5DhJv6x/FydVkq+HAffSYHsVwNwg/ZkI7hX04Swu7RS
         oEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+hDbJgwTf7g9lBKNO6RgzJbw0BfL24aZ5OXt42vMub4=;
        b=3QNp+QsBa9zVNINR1wGIpuTC5hleaG7Ek8YQ+bYxBWxzl18Une6ptk89pQxlmTG3sl
         PyglXZSAbQjdO8xDxqUs5H7LGu3jJPCzNnPR1AWDpAB+yzybVYJm+OFH9k6yJCVtBfak
         zBzd4o3GGSuI17N3XC8WTCRYmsbcna6NLMPsY+maR/iKUUvJgANyiSCAjGOx22FhMeKW
         BOate9quOAZvfqqYQPf/bfiXUfoyuRfXluVuvPeVql94j+rnAu4F/qmj+NzQuVU7k4H6
         FbUE8uOomJzDh7HTpIX4+TRlITb4bvkKhnat9VOmkPEak7E4mCfBQ3NQJ8eaE75OiLsC
         EdiA==
X-Gm-Message-State: AJIora9E9LF9uZH7o4Gp4w91jLq6yTNKQwONvXFchIkWp/1GZPyXRVEh
	WXkiCEKQ74b+tLoMmu9vwKrDcAYVf7sKPzWx3WQ=
X-Google-Smtp-Source: 
 AGRyM1tLeh5hb2XvWSRZVJOuP0dAfSuvByY2Atm5RJnx1zID9peoytHcqNR0IWxP0ZpbQf2gs8xAccp91UUgxf0ZnaY=
X-Received: by 2002:a05:622a:386:b0:31f:b1c:5017 with SMTP id
 j6-20020a05622a038600b0031f0b1c5017mr899962qtx.532.1658508418395; Fri, 22 Jul
 2022 09:46:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220722111336.2143770-1-ross.burton@arm.com>
 <CAMKF1sqpH1MfeVVuY_GDegP8wNnKsXJNEfsaFdU2oxboZhT0Fg@mail.gmail.com>
 <93D9E7BB-46A6-465B-84DC-A9EBD7FBCDC6@arm.com>
In-Reply-To: <93D9E7BB-46A6-465B-84DC-A9EBD7FBCDC6@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jul 2022 12:46:32 -0400
Message-ID: 
 <CAMKF1spJ_6JxHD6dvf4DPyZt7q_4JRdXLrtfiy46vM-0M_PwBw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] zstd: do verbose builds
To: Ross Burton <Ross.Burton@arm.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Jul 2022 16:47:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168416

On Fri, Jul 22, 2022 at 12:17 PM Ross Burton <Ross.Burton@arm.com> wrote:
>
>
>
> > On 22 Jul 2022, at 15:54, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > On Fri, Jul 22, 2022 at 7:13 AM Ross Burton <ross.burton@arm.com> wrote=
:
> >>
> >> Set V=3D1 so that the compile log is useful when things go wrong.
> >>
> >
> > verbose logs do add to build time, usually when build fails the error
> > parts are good with dumping error and
> > compiler cmdline, is that not the case here ?
>
> It doesn=E2=80=99t dump the command that failed, just the errors.  There =
is no meaningful increase in build time.
>

OK. Perhaps because its not a big component.

> Ross

