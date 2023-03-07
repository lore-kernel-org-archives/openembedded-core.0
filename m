Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC98C678D5
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 09:34:23 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.10694.1678181660416283820
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 01:34:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZjefGqYd;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id bi9so16288206lfb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 01:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678181658;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g0ibawE/WyTuNN0eR0ZPwijX1tWPzXVSV19qmW/SRKg=;
        b=ZjefGqYdwOLiOHKlacgyFrLeZJjpciSsGmZfLyYVLMsWFx4oyvmWwhaoxQjMKSYFE5
         rxQ3O8y1C6FJQdkw5zbijOmFdLrPFxh0gRZw+8D90kUjFrZ5oc6W6uF+JXon24rYUxfU
         wI8VSd4hFpfYgKjWLEfsfXpvOkkk/wOuJqzB3pAqTAAAOylvRHgWmJFWO6qtyMQdTh8Y
         hdjxRxdaGgFPU5l0Cqr6OlccPjPuJb8kiHw19OvXbJ1GhTcGXFKL+TxBrJJQOGx1sk5m
         Scird7EYLi8OnLtnPOYcrkdWWojcCBIlwURMHsrTOH4OVs35E/+ALp4hFN3uZjFGTaro
         kf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678181658;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g0ibawE/WyTuNN0eR0ZPwijX1tWPzXVSV19qmW/SRKg=;
        b=2c5P5T8h9GBeExftwB39fLszm7QlTYPY6DbR6SaFPXWEUT5slVC/MeywSO8YNMD3C0
         A53sw/pRjdSI1deDT9Bh5A1J8FXLaLr4DGrmOoOAQ5t0PLMEOm9708xhUj0XB6LA7qMd
         mqAp/1Ku5XvRsKvis0dUyV4HIDnEhnFZEFfG2CvkOGhtOR2m+AiKWFmcXgxc9vmR2Jhm
         YLy8gUY50JXuXyunAgWWvCQnR9ZxQoHODtzmR7l06h8Dihs/9xNM1vgWtb7DgIatQEkI
         vuQZbA5OXLw5vysV3Zpb3dfQuNLs2DSJC9x/dTxv7Npb1kLn7tFcg53ueDKe4ucmBCBQ
         kgEg==
X-Gm-Message-State: AO0yUKVIQ8lSd4EEdcDEBxmH6DFI8Z3YBac0CQMBDJ6Hyfjyxe+hFwRJ
	7ftglGAetDHLUb6tvlMgNoLqMsF2X8SiGGt+4k0=
X-Google-Smtp-Source: AK7set+I7o7TCcM3XDSenkLDFcULUGFdS1Bg7VDfd4I1nh9GFXtkRHeerngBHnTM9kX4OViBOwLQeduiZGDcWeCQHFw=
X-Received: by 2002:ac2:46db:0:b0:4e1:d025:789e with SMTP id
 p27-20020ac246db000000b004e1d025789emr4306300lfo.13.1678181658495; Tue, 07
 Mar 2023 01:34:18 -0800 (PST)
MIME-Version: 1.0
References: <ccf5bc6b01e8cb93f5357bd2eabcec32af5bfdb9.camel@siemens.com>
 <CANNYZj-Ov6Qswejusp=7F7PJ2cBJ9k119uq5SmTUd5=0-fog1Q@mail.gmail.com> <a5271b388e09d6338da258fb97e256e54958b0d1.camel@siemens.com>
In-Reply-To: <a5271b388e09d6338da258fb97e256e54958b0d1.camel@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 Mar 2023 10:34:07 +0100
Message-ID: <CANNYZj-0ESxC8=fT1JJZ2+4gZiHfXvceB3QsS_Ner7UYsNYw+g@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] Google go CVEs
To: "Valek, Andrej" <andrej.valek@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Freihofer, Adrian" <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 09:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178097

If you understand the code well, and can be confident that your
backports address the issue correctly and do not introduce new issues,
then by all means go ahead.

My personal position should be known: I see the whole 'CVE
backporting' industry as a colossal waste. We need to learn to update
to supported upstream versions, and not be scared of breaking
production with that.

Alex

On Tue, 7 Mar 2023 at 10:05, Valek, Andrej <andrej.valek@siemens.com> wrote:
>
> Hello Alex,
>
> Yes, that would an option, but afaik it wasn't working quite well. So I
> would still prefer a straight forward solution.
>
> Should I spend some time for creating such patches? Means if there will
> be a potential option for being accepted?
>
> Andrej
>
> On Tue, 2023-03-07 at 07:37 +0100, Alexander Kanavin wrote:
> > You probably should make a kirkstone mixin layer like we did for
> > dunfell.
> > https://git.yoctoproject.org/meta-lts-mixins/
> >
> > Alex
> >
> > On Tue, 7 Mar 2023 at 07:32, Andrej Valek <andrej.valek@siemens.com>
> > wrote:
> > >
> > > Hello everyone,
> > >
> > > I would like to ask you how to proceed with multiple CVEs for
> > > Google Go
> > > component in kirkstone branch.
> > >
> > > CVEs in current version 1.17.13:
> > > - CVE-2022-41722
> > > - CVE-2022-41725
> > > - CVE-2022-41724
> > > - CVE-2022-41723
> > >
> > > They are fixed in 1.19.6/1.20.1 branches, but a fixing patches are
> > > available for all of them too. Unfortunately there is more then
> > > ~1000
> > > changed LOC. So not sure if this is the right approach to apply
> > > them.
> > > Not sure if the upgrade is acceptable.
> > >
> > > So how to proceed with this?
> > >
> > > I know, that they aren't a critical one, but would be nice to have
> > > them
> > > fixed.
> > >
> > > Regards,
> > > Andrej
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#178089):
> > > https://lists.openembedded.org/g/openembedded-core/message/178089
> > > Mute This Topic: https://lists.openembedded.org/mt/97444547/1686489
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe:
> > > https://lists.openembedded.org/g/openembedded-core/unsub [
> > > alex.kanavin@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
>

