Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29561C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 09:50:35 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.47360.1720000230104125596
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 02:50:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jxCcFyRZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so62882511fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 02:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720000228; x=1720605028; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=egp8DXb2axha6RhRQhNTGMjkHco59jhzTuRCloxARgY=;
        b=jxCcFyRZBTo4WXd03+2YokZ76kb/icCg5fbOBq5ClsqMbu/2e4eeBShABGRSRuF0q7
         Gw7Pd2XYyz88kFjWLnM8qo58jXF1zRTcPVrbAsXwuxGmXOk0yPR/nRRcVZNO2pdsbWNT
         PY8QXPUEMyrZfax/Pe/+FHG/sBkB2ByUzh9x4eJF8S0mVlqd/lELWYQm+CpyJ2qrUnZr
         SRJURu4rQhJEVuV4YN6DUXP3L1/0G16ePubVAZPv1QCsSHme4vh0kkK5TAvqtrPJz+bp
         Qv3fOYPmSVt7ro9/31Ou9vjB4mamytooGo7Nwh29pnmyH9nyqt2I93k5qtA+CWu0qckN
         +Mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000228; x=1720605028;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=egp8DXb2axha6RhRQhNTGMjkHco59jhzTuRCloxARgY=;
        b=SNpyvlrdNpztPAtMAGrnqsQm10KWhfmeS00U8o4/yl2TOGOQhz37lxBSihX0tEZEnQ
         8xEnnMkSla9ELDh+ZqLPTxz9OSzJkAODUjXazhYSc/flUEdoYiM56RM+Jfx6MwjtTZEr
         G6RtWN3NXVj5iXkQ3qTRRb7nHXuX18OBYiM6VpFh5T3DFH/rVQAB5wQF3EJ353RSTeus
         C2HiXo7bLTkrW/W0VK7s2/BWyZsUghjF+aQvrYdL1AGRMBrxic+i7cH+vH5XUB/LQ9pM
         azVvQph08s8UfaQ2wGtWu7xL2GPEs4EPeRkw5kt5NB6gEvh46/+ohvjnSCshH1yj2Wuj
         Mk0g==
X-Gm-Message-State: AOJu0YzaJ+sfzVZUUmCDP7+pfsjU/KDoyxxiCuSPLkS+NZoI9yJ4PUxz
	+O69NeL8mbuaBpjcL/faNoohVxEzcKp/r2vRVAb0kVaPCuMEs4lCfPNkIQfD5Z7kvXpkGHo3PU8
	BpfPWTKGDoTj9XyawoZUns57VMVs=
X-Google-Smtp-Source: AGHT+IEfPpBDRwRNIxhqSP3JBS56PrpjNmFOD3z0TS8XDI3lOnyOvxCnAge08wUINL9sFnzy5ulBBWdWNt+Aer+c5NI=
X-Received: by 2002:a2e:96c6:0:b0:2ec:5933:a624 with SMTP id
 38308e7fff4ca-2ee5e380907mr68136291fa.25.1720000228058; Wed, 03 Jul 2024
 02:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj_dpbyeJ1_gq2qziTuf6XuGHA5tBJfs=ukMq28uJdXbcA@mail.gmail.com>
 <28357.1719955699818752317@lists.openembedded.org> <17DEAACE58F9A7B5.14163@lists.openembedded.org>
In-Reply-To: <17DEAACE58F9A7B5.14163@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 Jul 2024 11:50:16 +0200
Message-ID: <CANNYZj8r_+RCZBUbvgOH4hCteo9N4Tk8az8BD5Rq8yMhQ2Aznw@mail.gmail.com>
Subject: Re: [OE-core] mc: broken source link
To: egyszeregy@freemail.hu
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 09:50:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201465

On Wed, 3 Jul 2024 at 11:45, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> There are two kinds of github archives, manually created and uploaded
> release artefacts (those are stable), and automatically generated tag
> archives (those are not). What you see at
> https://github.com/MidnightCommander/mc/releases/tag/4.8.31 are the
> latter kind.

By 'unstable' I mean that their checksums can change randomly as
github re-generates them with different compressor settings etc.

There was a LWN article on the subject:
https://lwn.net/Articles/921787/ - we weren't hit by the issue
precisely because we don't use them, and have a qa test that prevents
their accidental introduction.

Alex

