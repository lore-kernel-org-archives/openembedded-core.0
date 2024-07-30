Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9CFBC3DA7F
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 10:55:59 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.14980.1722336949462275855
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jul 2024 03:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eaWviJA4;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52efa9500e0so5390368e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 03:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722336947; x=1722941747; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmGBLt6TDnYboVwU3woZfGPQweg71qwokKf0ehqhSZo=;
        b=eaWviJA4WffBY8Yab+wSVTBTXCRWuTyam729iSzqPiA797tbpKcIRJsMgatw3w/Ebu
         nhYBXLhz4KJvlSX3tW8wK+gRGrpGEbER4pFqUl5HKRtgo+UQs+5OIR/ub07Yx/eGHW53
         dH8SSYsJbjLH3iyTNgyd29gsHmcgHeJ4RJ/3DMPneEDtzn8Ay4sqqor0tDykV6IYVOFt
         LT8Y52FWkd0mhj32xi16R+Z7optfsxDVEupai5CQZuMePITZBjrs/8Fqk8eD64AGIERw
         IJ8jwZra2sytpy95CBkV5IaYstnKJQ9CBzcLVaY7v2myUbh2JH72bAwK94zcKm9efCR7
         dWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722336947; x=1722941747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zmGBLt6TDnYboVwU3woZfGPQweg71qwokKf0ehqhSZo=;
        b=p6q5+DCDBzUJW40aWjMoc0FPjaZ0eUR6ZEutA/uVgHiqW/SOexbCS1nFGxBIFGc9YB
         Vk45QoK8O9FsKuNNroX4kS3qtsHLpCCA6G/1GjomNMOr7QRxjVMNBy6yDetmO+QupEyg
         iqwuvWW7C1AEE7JiVui03sn/DRneRSDA0Su752yQYilQp6kIVFK3aHPNmB42lILeehxS
         HM8SfRpznyj3SMf4W0jhPVV49NWHVjcnZdakE45ftyGfNKhIT1gQZiSgGPM+emRwgZGa
         RPSxsTGaskIGFVBvRH+LYYtSNwGXhTJCGMiMrCZidYWZoZhD4WASxmMhUbQ8YwJiQjdG
         wdPQ==
X-Gm-Message-State: AOJu0YxYRM69GxPVC6ZtvE8CaXNmupqBEJP3wk5BhQQU5WbAFRP/u6si
	riLrfEgL1NTGzObOexAJxcA2bWACiySdzbXVKzSRj7a5IeZE4vvM/wkcoya25XDVOX58nClVuZt
	BFcpx6+ZmO7csxQII8CoLZzsZFqE=
X-Google-Smtp-Source: AGHT+IF41ogWffVbjkRbQK8KraUzikk3NwV7ME22/WKIVXCB6hsGXx8W6pcW5FVtFSnEN8gkazx9pjrI1ZclShUTdCI=
X-Received: by 2002:a05:6512:1142:b0:52c:def3:44b with SMTP id
 2adb3069b0e04-5309b27d680mr5640912e87.31.1722336947407; Tue, 30 Jul 2024
 03:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <4791.1722292240522892465@lists.openembedded.org> <Groupsio.1.4791.1722292240522892465@lists.openembedded.org>
In-Reply-To: <Groupsio.1.4791.1722292240522892465@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 30 Jul 2024 12:55:35 +0200
Message-ID: <CANNYZj_ax9Gqz4QTLTpscqT5HrHnsC2TWJ+19tG1BpnzQ7XCwQ@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][master] license archiving is failed to tmp/deploy/licenses
To: egyszeregy@freemail.hu
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 10:55:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202672

On Tue, 30 Jul 2024 at 00:35, Livius via lists.openembedded.org
<egyszeregy=3Dfreemail.hu@lists.openembedded.org> wrote:
> No, it is not in my scope. I am not the responsible or mainntainer for it=
, and i do not understand the latest patch what it like to do and what shou=
ld it resolved. I can not solve it, sorry. It was reported a half year ago,=
 it should be resolved by a real maintainer/developer.
>
> Please, if it is not working as before, do not commit it. Rather revert t=
his patch which cause a totally buggy license deploying at the moment in th=
e latest Scarthgap LTS. LTS branch shall not contains this kind of quality,=
 in normally.
>

Calibrating expectations will serve you well.

Yocto is an open source project, and not your commercial supplier. You
can take what there is without any fees whatsoever, put it into a
product, sell the product, and keep all of the income the product
generates. How maintainers and contributors actually make a living and
find time to fulfill their commitments is not your problem.

Here's the other side of the deal: nobody owes you a bugfix for a
problem you're having. Not only that, no one owes you an investigation
into your problem either. We're all volunteers; if your problem isn't
particularly interesting, relevant or common, there are always far
more important issues to us. Especially if you act entitled and
demanding.

If no one reacts to your issues, the correct thing to do is one of these:

- own the problem. Study the code, study the history of changes, ask
questions about those things if you have them. Then work your way
towards a fix and a test for it. This can take significant time, which
is not going towards adding value to your product.

- hire someone to do this for you. You can hire me, for example.

Alex

