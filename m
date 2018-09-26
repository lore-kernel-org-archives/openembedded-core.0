Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
	[209.85.210.47])
	by mail.openembedded.org (Postfix) with ESMTP id E1D8A79653
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 11:55:07 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id c13-v6so10086571otf.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 04:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rnoBO00Oxqe5w42o60Jqv1euW8pzJ1hmAGK6XyLO9Z4=;
	b=i7Xk1mV4l/seVjJot34xYQdciLtGvs/QY66tb9GTWX+gBeGymEWLURuXcvIeIFktQk
	fXr3QfUx9RqanWxBIPqZ2BXGZc+HiIL59Y4ifuX8HMSNx3SoB5kjBXAOGKCBLh2aYcy2
	ddPMSAQYKBdXlhbwqJp2wnSMV+m76LeTNwG77RTJS9m/5/fndl8RG+96Qb4ARlVV7wkn
	OegAolu5ldOE0081/yCrwSkcdsXF3VchMaDOorDFLSe1IAQhAK5xS0L3c8cv4TZh3BWU
	AAAbmUblX6YP8xMlWgE59D1+yWkfy2dz7Mc6UMg9JEmvfbkx/KLGvv+mkNeMJWDJKoSj
	V+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rnoBO00Oxqe5w42o60Jqv1euW8pzJ1hmAGK6XyLO9Z4=;
	b=ZGz99T1h/rGKqiEPg31JAlFjPwGD2k+CGNc/5gO7+Ng5lIM2ghLZ1EM4ASxcUdwwTD
	Pzqij+htL6RfaDGWemGs7RxKQd04UOIoX6edHebt8l0ma80TmvN7jTPI1F5qsOQuu4Tb
	ytG6fq0KV0h2t9Yg1sU8IcQArW/Tam1GeU+Tezcdip6nXRXxSEMxJ4/a8RB/ZYXulq+J
	GZ1+YUcqS0SgnBN+CzdqOVpxRMFvQRjLinJA3AoQdhGxHPf7n1cZRQd8xnxshcNmFFW0
	JfHZgCaU2bO6UHg/jcSghAkS2YKJeWv1f3QuFXwRUJiivPNfH3N3zjz0yP6JeRx1WDhL
	ymow==
X-Gm-Message-State: ABuFfoixabkOuKeUZdBUCjD9Pf85zcA9KKKKQkkuJx5IXOl7JyTEHnT1
	S4rMkhoau2jEeOinG+qTSdMQ88+pk9z2t02AmZDbhw==
X-Google-Smtp-Source: ACcGV60i0IQqkCedWiWQMA7MkXWCYWoQR7gQ7x2CqMC4wGx8YmXnaAaNb0KQYD1l+K76G16g1NIm1NUouYmmUiu15ls=
X-Received: by 2002:a9d:48f9:: with SMTP id
	a54-v6mr3929630otj.343.1537962908929; 
	Wed, 26 Sep 2018 04:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <1b958e43-01e8-c958-7c5e-1f5f3aca227e@victronenergy.com>
	<b34c562c-b738-4817-8241-f2b02d00827c@xilinx.com>
	<0311dc58-8a9f-4773-abf3-bfa90a3cfc0f@victronenergy.com>
In-Reply-To: <0311dc58-8a9f-4773-abf3-bfa90a3cfc0f@victronenergy.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Sep 2018 12:54:57 +0100
Message-ID: <CAJTo0LbtyKnZNrwX7j0n_uVk158EVT_8EU_TPDKg6iXLFtQZvg@mail.gmail.com>
To: jhofstee@victronenergy.com
Cc: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: python-sqlite3 packaging
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Sep 2018 11:55:08 -0000
Content-Type: text/plain; charset="UTF-8"

Patch on the list now

Ross
On Wed, 26 Sep 2018 at 10:23, Jeroen Hofstee <jhofstee@victronenergy.com> wrote:
>
> Hello Alejandro,
>
>
> On 09/25/2018 05:08 PM, Alejandro Hernandez wrote:
> > Hey Jeroen,
> >
> > On 9/24/2018 12:22 PM, Jeroen Hofstee wrote:
> >> Hello,
> >>
> >> Not sure where to report this, so trying here. It seems the
> >> /usr/lib/python2.7/sqlite3 ends up in the python-misc and not
> >> in python-sqlite3.
> >>
> >> This causes statements like:
> >>
> >> import sqlite3
> >>
> >> To error with ImportError: No module named sqlite3, when
> >> python-misc is not installed.
> >>
> >> It looks like the python2-manifest should at least include the
> >> __init__.py, but the logs suggest the manifest is generated.
> >>
> >> Perhaps it is easier if someone who knows more about this
> >> looks into it..
> >
> > Yes, this sure looks like a bug, can you please file it on
> > https://bugzilla.yoctoproject.org/enter_bug.cgi?product=OE-Core so we
> > can keep track of it?
>
> Thanks, done https://bugzilla.yoctoproject.org/show_bug.cgi?id=12933
>
> Regards,
> Jeroen
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

