Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1A1C3DA7A
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 23:19:19 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.7073.1672355953354509062
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 15:19:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f+zDOaO5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id m26-20020a05600c3b1a00b003d9811fcaafso7625639wms.5
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 15:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jzqhmlefk/EX4J9cXMdftP76iDJAj69YGQLc+ryTHBE=;
        b=f+zDOaO5EOcFN2XvkyE+2f8sl/+P5Mq4CY777+gTVGIbCKRtvje3AByYArUEVc0h8K
         kQrvl/rHsJYjc6OyKq4NetBFcHb2eaE7czdO245ikbPIr7Y6s0R1kU6S1g+oD3V3RdL0
         bRC9CiaExBX86fBmuDKj81xzmz21aEdwDBa60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jzqhmlefk/EX4J9cXMdftP76iDJAj69YGQLc+ryTHBE=;
        b=fHIXplsAbxSMRvNh6ovTV3Nk6IAutMpDkkSd+ptNBmiHEl9XtGd3qbb8J0xYIfrQb6
         LIJJhnGlug/dle3YFLeTVrt2gQ3BeahOuQjrokUg1oOSvU8PWVRZGfGdqBKTdteLvK0a
         MswgF0EVABybSFsq2uAKJahm5nDXfMzG6vynkRBny2xlIo1CgpbDdMY65AeVKnBRP7v9
         MosjailOzKv7nFkNdVXOBQPjHbf6KUmEELNTGUgo0TQnaZ+vubKHERmJC0A4jQgnCMng
         XYTqcxY0LIHl6F23J4r82SHePppbFvAnp4sashTs3EZnvhfyUo2fIm3+PgBmD5r2S4ly
         m/wQ==
X-Gm-Message-State: AFqh2koskIm65EdS4+IXlayQbObt1eUwfdnQA+T3+XdYCymtJgc+pBcd
	aPQZF0l36XLccPlgMM2O3wvuUw==
X-Google-Smtp-Source: AMrXdXspRdRGKO6oISNSzsLBdLg6jKBYs3nJDJfTugtkOXYIHWIMHvRMRo8CG9nyvrav93thbMzbQw==
X-Received: by 2002:a05:600c:4fcf:b0:3d1:d396:1ade with SMTP id o15-20020a05600c4fcf00b003d1d3961ademr21187116wmq.9.1672355951840;
        Thu, 29 Dec 2022 15:19:11 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fd62:db1:ca71:a503? ([2001:8b0:aba:5f3c:fd62:db1:ca71:a503])
        by smtp.gmail.com with ESMTPSA id r9-20020a05600c35c900b003d6b71c0c92sm42371741wmq.45.2022.12.29.15.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 15:19:11 -0800 (PST)
Message-ID: <6ea0dc08bc4007911090f49ebf4c9d9dee9579fb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 7/7] qemu: update 7.1.0 -> 7.2.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Thu, 29 Dec 2022 23:19:08 +0000
In-Reply-To: <20221224165943.1324800-7-alex@linutronix.de>
References: <20221224165943.1324800-1-alex@linutronix.de>
	 <20221224165943.1324800-7-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 23:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175133

On Sat, 2022-12-24 at 17:59 +0100, Alexander Kanavin wrote:
> qemu no longer carries libslirp in-tree,
> so enabling slirp requires providing external libslirp.
>=20
> Another noteworthy change is:
>=20
> x86: TCG support for AVX, AVX2, F16C, FMA3 and VAES instructions
>=20
> ... which means both meta-intel and qemu x86 targets can
> now fully utilize Haswell-and-later instruction set with benefits
> for performance in emulation and on silicon.
>=20
> Changelog:
> https://wiki.qemu.org/ChangeLog/7.2
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>

Since I merged this we've been seeing an intermittent qemu ptest
failure on both arm and x86:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/4479/step=
s/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/4273/step=
s/12/logs/stdio

Not sure what the pattern to trigger it is, not looked into it.

Cheers,

Richard

