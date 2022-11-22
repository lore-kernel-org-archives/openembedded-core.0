Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 829EFC433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 22:16:40 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.5535.1669155395320064558
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 14:16:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SRSYICAo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id t4so11847371wmj.5
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 14:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wyeQBJ2FwGPrmpXUYrrwxgRuwwbQllguoLjmjGT2A78=;
        b=SRSYICAoNj94CTIZG3+5jeNU1yCeXtid5XfRm8SPjIGapZibeLmhYLZj7G164qB+oN
         jIbqIRYiIiqT2FrutyXVoWQ8X/MyytkUsWVpFIBlY3mBDmHPiZtmvIgKm5YB2e+hHHOT
         DbOpvpp0GhopHFpQvmow84km028JnpMAcwxiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wyeQBJ2FwGPrmpXUYrrwxgRuwwbQllguoLjmjGT2A78=;
        b=yTPvtP4/6yUeUnTVDlCsoPilhnGrZFOXbTJIZXN79lzgmwpSqFRTLJp+Ep2g2SjOsO
         GrFCrUG2SQ4zHxE1E9DlU09rCQPDARHeBmldgl1m+k+0CjiaEmlssq6VuINSQS6mFLR/
         amOKyeHRl2yqxHOyiqAOU+VqxoDvmIGuOQke/DeON3aAqGPphMV84PaVILZUPQjVVSo+
         wD4KCNI0wYFoCyBBPScvGmo/OjkGm3Ap5oEYH+sQJbq9AEXHMXbYralWJwSo63KbuIfL
         Rw7NaAAGkfhNIShEWNMgOnGeCSDj89EbYUVbqW5BULMBf/yCe7fT1pIFNce3/9Ib4Cqp
         arnw==
X-Gm-Message-State: ANoB5pl5HFQc2pxqh6iWhQHQgygHMsv1AB6zl8I8uRmaEDocKRMJCTDn
	i/Hwd6QhItcuWNBUUbyH2+aJqQ==
X-Google-Smtp-Source: AA0mqf7ZTD8DrM6aExTeAfprsPql9sDbUnHARw/b5JOPpgV3dAFg2m0Gx1I8TCS84m2TGwW4QmHFmA==
X-Received: by 2002:a7b:ca45:0:b0:3c4:bda1:7c57 with SMTP id m5-20020a7bca45000000b003c4bda17c57mr21740930wml.6.1669155393745;
        Tue, 22 Nov 2022 14:16:33 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:978b:ac21:2786:e95b? ([2001:8b0:aba:5f3c:978b:ac21:2786:e95b])
        by smtp.gmail.com with ESMTPSA id k33-20020a05600c1ca100b003cffd3c3d6csm140046wms.12.2022.11.22.14.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 14:16:33 -0800 (PST)
Message-ID: <6be037fc3360aee5c7f55687a2ed384fd9d7d7bb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 06/17] man-db: update 2.10.2 -> 2.11.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Tue, 22 Nov 2022 22:16:32 +0000
In-Reply-To: <CANNYZj8c5HPpMqTAdbOd8swzF-A0ef7cXfSHaTpVpekT87uF6g@mail.gmail.com>
References: <20221120133122.2464634-1-alex@linutronix.de>
	 <20221120133122.2464634-6-alex@linutronix.de>
	 <66344aa4e79a890e2c9d90af9b712bf432f450dc.camel@linuxfoundation.org>
	 <CANNYZj8c5HPpMqTAdbOd8swzF-A0ef7cXfSHaTpVpekT87uF6g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 22:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173701

On Tue, 2022-11-22 at 21:53 +0100, Alexander Kanavin wrote:
> On Tue, 22 Nov 2022 at 13:31, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > From a quick look at the changes, I'm not sure this is correct. At
> > least some pieces of the codebase are still under GPL-2.0* so at the
> > very least that should still be here even if the output result is 3.0.
> > It may be some of our output packages are also still under the 2.0
> > licenses.
>=20
> README has this to say:
> In addition, man-db incorporates Gnulib, copyrighted by the Free Software
> Foundation and others. Note that much of Gnulib is distributed under the =
GNU
> General Public License version 3 or later. This means that, although
> man-db's own source code is licensed under GPL v2 or later, the work as a
> whole falls under the terms of the GPL v3 or later. Unless you take speci=
al
> pains to remove the GPL v3 portions, you must therefore follow the terms =
and
> conditions of the GPL v3 or later when distributing man-db.
>=20
> I took a look at the log.do_compile. Gnulib is statically linked into
> libman.so, then every executable binary is dynamically linked with
> that. So there does not seem to be any reasonable independent target
> piece that is under gplv2.
>=20
> We can list the license as "gpl2+ & gpl3" with extra clarifications I gue=
ss.

Yes. We don't interpret the overall license, we list the licenses
present and then it is for others to decide the license they use it
under (even if it is fairly clear for this combination).

If it is all under that license that is fair enough, I just wondered
about any sub components.

Cheers,

Richard


