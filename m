Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 746B5C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 17:29:02 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.1382.1659979737521765577
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 10:28:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dHLGpYwD;
 spf=pass (domain: gmail.com, ip: 209.85.208.169,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id bx38so10518245ljb.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 10:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QfpeSY+ih58VA1Yz/8IuNeunHHYfCBDRlV7kYR/WngI=;
        b=dHLGpYwDKw2CuHaiYq69f9XFSVJhT5L3ljjg/MZVk6xxjK3+duol2RWR4uSY+hGWsn
         k4d6tA9JJw+n0bzuMW7I5t8iw2Y+oQY/GNau99Bk7Sva18M6m1fXjGzDgTKk7Edef7HE
         8bGjGYulo04OpRibu/Y0WJu+hYccFwUcRC3E773qZ0Z0asL+Nni2a36uhCwvPUBLOR9z
         Z50hA0kawfFjS3BFvYEI5/U8XFjuyMxkR3YTPMW9igF295sMIAlnC05eSB4HPfrpNifK
         wJnn52npDP2sQ8AwkAIHfKIn8rpDnrYdC0bklvotxfw9ekfaCOKivZ6xk0ifoqfY4y+b
         zv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QfpeSY+ih58VA1Yz/8IuNeunHHYfCBDRlV7kYR/WngI=;
        b=rz2qaFwYZc/LBbOubu9IlTw37ApjlqswfsvxbjXuV5kFuJ2yf6O+zB205QMHLlQQY2
         ClUWuWIu9tBvAGESuUMEQhUxhlHrfJdshoT/h8rY37uDwBaF2qP2b10jUBLULC+iuM2P
         Rqcm1rvFw1wxCiN369H/1lDeP9gq4/wtB50KdviYnNjEyuyKBuzQEyY/8UzdWUPb6txz
         iOCkoEM3GBIlbYeUlK/uCgBx7ocdmYLV+wKq/20huxfEqi4pXKNQz7cnrYJ8XYJ47P9p
         Y5YFiBDsBycTJ76Rfv2e8tNOBIVchE6KTFdZOZQwN4QG/viDcNliE8RNCC7t89Fq3iNr
         EuUQ==
X-Gm-Message-State: ACgBeo1OvtME7OHRESUZZHaUJUyF1Z6yMbq0HqFzz63vlydUwLqY7WQP
	1KDlIz18bA/J0hqoaMQLXHjTjQ4BDTrHO4DNtNU=
X-Google-Smtp-Source: 
 AA6agR5796HjUmZGMC4NTHYgG3BvaqJZyOhUjEVcET9UAJc43PsVrp5EW6kpIwIUXBzk2bP/lYf9MvSHtvNrrCu1dWM=
X-Received: by 2002:a2e:3a09:0:b0:25e:4212:5628 with SMTP id
 h9-20020a2e3a09000000b0025e42125628mr5761779lja.68.1659979735474; Mon, 08 Aug
 2022 10:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220808064237.3975347-1-alex@linutronix.de>
 <20220808064237.3975347-8-alex@linutronix.de>
 <328c024f-cf34-d63b-3b39-275ce75c7cec@gmail.com>
In-Reply-To: <328c024f-cf34-d63b-3b39-275ce75c7cec@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 8 Aug 2022 19:28:43 +0200
Message-ID: 
 <CANNYZj88Y9pysxv8NSEQvwesSwgX5jWj8UmeybBRC_zi8P+jVA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 08/44] patchelf: update 0.14.5 -> 0.15.0
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 17:29:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169109

On Mon, 8 Aug 2022 at 19:07, Khem Raj <raj.khem@gmail.com> wrote:
> > Drop handle-read-only-files.patch: read only files should
> > be handled by making them writeable explicitly. See
> > the upstream discussion:
> > https://github.com/NixOS/patchelf/pull/89
>
> I agree with this. However, we have been carrying this for a while and
> there is a usecase which is addressed, maybe that is no longer a problem
> any more but needs to be checked
>
> see
> https://git.openembedded.org/openembedded-core/commit/?id=18efcbcb896239c64fedd009ce57f3f0c668cbc0
>
>        * Add patch handle-read-only-files.patch to fix error when
> building eSKD, the following error appears on task do_testsdkext

Thanks, I did not see this. I suppose we can change the patch into a
tweak to uninative.bbclass where patchelf is invoked, as there's no
indication there is any other use case. The complication is in having
to produce new uninative to test any such changes, as RP mentioned.

Alex

