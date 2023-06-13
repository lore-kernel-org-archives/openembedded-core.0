Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A18C88CB4
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 11:33:16 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.10834.1686655985983043364
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 04:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=X9aBfnfI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-30c4775d05bso3785916f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 04:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686655984; x=1689247984;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FjGws7qV69aLtOGx49dWPBYU+YL1fono584wBGflKSQ=;
        b=X9aBfnfIGfdyRcMkgJTIJYtXshBX20kCeQxI5EulmgNlIgUuN7V4I+73nV9GzkTv3I
         rpEytqFNtDEWmD+AaRSy6y+5qzbA7WqBMOK2TWv6odrJRxS7IyleB5bAQwCUxZydYQvO
         jyAFyJR+TgYJ2H7O8ZVSjZuu5uBP9Ppb95m/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686655984; x=1689247984;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FjGws7qV69aLtOGx49dWPBYU+YL1fono584wBGflKSQ=;
        b=WvkEEznL6r8MqW3bk46RbyQLy1oPOIwADpsXIlTqXMPLk0DtXJpjpfBUFXEAmAftME
         m3YizYaTwE9lgDoFyfO/AYbZhj+b8t5cnzVu4tAmBRpt1lvlOZSTOSFvUJd/AJIJ72zg
         btf0S7V627Hz/6/gAj+SU7hsrE5H52h04W+CxDxVbcK0zqmw+L2FJxhhf9eebXRiy2Ot
         hMhbCQOftcveRM0N+6xgIaNluQQVBi/gqKCFbd+vYunB/0lXc4jOgesWxaGaMO/tdZvF
         Tt9fXa62TWes9h00c6Qt2uc6spMFgYwDNnrH1GykIlDVGEN5iMvf2Giyo9IxWflK8OhK
         /kyQ==
X-Gm-Message-State: AC+VfDyetRbykGka/ihl5kqLdIQpdmZSrdGYkY1v7jwEB2fbFkVzxoNj
	VWb1LBIoAbU/zOsnI9rm0APPQg==
X-Google-Smtp-Source: ACHHUZ6DDfu3gVct9gfJiw5CwYnveE0/rHQBb07tyP2aQjh4PFpf/tUXgh1XbPal/evx4pQ7d4P7QQ==
X-Received: by 2002:a5d:570e:0:b0:30f:c764:189a with SMTP id a14-20020a5d570e000000b0030fc764189amr2739561wrv.39.1686655984499;
        Tue, 13 Jun 2023 04:33:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9a70:bab1:9f22:b535? ([2001:8b0:aba:5f3c:9a70:bab1:9f22:b535])
        by smtp.gmail.com with ESMTPSA id y14-20020a5d620e000000b0030ae4350212sm15216621wru.66.2023.06.13.04.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 04:33:04 -0700 (PDT)
Message-ID: <b4852d5295cc250431cf375ba4677c9cc5cbbfc1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rootfs-postcommands: Set vardeps for
 write_image_test_data
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Hoyes <peter.hoyes@arm.com>, Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Jun 2023 12:33:03 +0100
In-Reply-To: <a87d5dd9-4128-6d02-eda2-c0c15f5a52fc@arm.com>
References: <20230517162906.2395999-1-peter.hoyes@arm.com>
	 <F3C8EF1B-E5EA-4357-8977-1FCC0F5E553D@arm.com>
	 <a87d5dd9-4128-6d02-eda2-c0c15f5a52fc@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 11:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182712

On Tue, 2023-06-13 at 10:55 +0100, Peter Hoyes wrote:
> On 23/05/2023 18:06, Ross Burton wrote:
> > On 17 May 2023, at 17:29, Peter Hoyes via lists.openembedded.org
> > <peter.hoyes=3Darm.com@lists.openembedded.org> wrote:
> > > The testdata.json file generated as part of the rootfs
> > > postprocess
> > > commands contains almost all Bitbake variables and is used by
> > > OEQA test
> > > cases to inspect the build environment. However it is only
> > > regenerated
> > > when the rootfs task is otherwise retriggered, complicating the
> > > process
> > > of developing OEQA test cases.
> > I=E2=80=99m about to run for dinner, but would it make more sense for t=
his
> > function to be a separate task inside testimage.bbclass that
> > happens after rootfs?  This will stop the explosion of variable
> > dependencies causing rootfs to re-run.
> >=20
> > Ross
>=20
> Thanks for the suggestion - I have implemented this for consideration
> in=20
> https://lists.openembedded.org/g/openembedded-core/topic/patch_1_2/995017=
85

Making it a separate task is fine, the challenge is that it needs to
run at the same time as image processing so that DATE/TIME are
consistent and the image names are correct.

That implies that it has to be before do_image_complete which means any
change in variables will retrigger the image creation :(.

I think we need to try and fix this differently and stop exporting
every variable.

Cheers,

Richard


