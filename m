Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
	[209.85.219.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2A5917F99E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 01:32:11 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id o18so2328153qvf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 17:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1LVH2VKLym+1HCdUsG0lDGiKJSLx8Vus9ua6hET72ng=;
	b=rz5wEtECECFIBKVmnJhmWgM0QiwEil1ysHp8VDDPnSiCeh8IJAiQxCRuZ/9ljPZqCa
	TtiY2GaVA1XHhrxrEEC0LdGmLOpZaM2q9KEYvrAYcm2aj1a+KGSF+oysd9yCOM7ZIcTd
	1FIiaPHjzuKBPIRNSX5v6m9JP5+S6ZbzapbOhv5eRCPUT/0qEVbMMtFiqGwPohF7Owwg
	rGg/vAF7aBtQ0uaeqPOeUaflR6VFgLo+XtMskJLRFgz0jlh7hd3AhMLnho/Q3AAKynzi
	csztuin81hJuG7VD9lvvxQoy/njm+BmL6jPBs/Z0q8IqXKKiuBEDQeo5ykS/1yy7ZP+O
	DDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1LVH2VKLym+1HCdUsG0lDGiKJSLx8Vus9ua6hET72ng=;
	b=F2FmDqgjiNtdvj45wpgkQmwTZaZqDJVBuw8jXqtNGGdQM5rlmOaOX2ZkXLWNNzTP81
	LLQyTCic4sq3VMz0dT1pnDP6g/iPME5W8wndiDN9BSWr8iA0YmBF57F3eqNjlE+85RS4
	D3LGmTSP3xfsHdNYDQGeBy7HO+1e0HPIs60HcrvbimfKYkDXwQMOuyihsA3Jnz+CZf+/
	ezFQYkGmTDPxkmQa866e70A5yvBCQbK3hbSaaDu4MWJYnZnO2n+re+9ZjwqJrfrgKadd
	9XKHrHO7hLyBl1pppclWe6dg4hL8bK0ry2dkCG0hwsWwSqK6u+DImXlh4Fh5d1eMVYPM
	c5yg==
X-Gm-Message-State: APjAAAW2UCH+6+CDSYieYrf7HJe0QAzK0efqPd6TfcmTlUjZuv6QQ7lw
	DNbuNvgAHjy5g/ArUpViycX6P/n39w434OR2DUw=
X-Google-Smtp-Source: APXvYqxqipPZ/Z7c/eRQBcTmouu0DKAxQW2bl6daLbOpWalZKYOX6t+3cUPd9/fEiSgzIw/Dm3Y2ovfkj5bMyccrTko=
X-Received: by 2002:ad4:4389:: with SMTP id s9mr6464847qvr.99.1578533531888;
	Wed, 08 Jan 2020 17:32:11 -0800 (PST)
MIME-Version: 1.0
References: <20200108132759.95603-1-alex.kanavin@gmail.com>
	<20200108132759.95603-14-alex.kanavin@gmail.com>
	<2fc677f1e980e80cd75d8b2e3c926556be06a8ef.camel@linuxfoundation.org>
In-Reply-To: <2fc677f1e980e80cd75d8b2e3c926556be06a8ef.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Jan 2020 17:31:45 -0800
Message-ID: <CAMKF1sp2+x5P0368UKgZr6DuFPy-0k1=fR3tnUwSwFdmyiWHqg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/28] libcap: update to 2.30
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
X-List-Received-Date: Thu, 09 Jan 2020 01:32:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 8, 2020 at 1:22 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2020-01-08 at 14:27 +0100, Alexander Kanavin wrote:
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  ...-tests-do-not-run-target-executables.patch | 33
> > +++++++++++++++++++
> >  .../libcap/{libcap_2.27.bb => libcap_2.30.bb} |  5 +--
> >  2 files changed, 36 insertions(+), 2 deletions(-)
> >  create mode 100644 meta/recipes-support/libcap/files/0002-tests-do-
> > not-run-target-executables.patch
> >  rename meta/recipes-support/libcap/{libcap_2.27.bb =>
> > libcap_2.30.bb} (90%)
>
> I think this causes iputils to fail to build:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/331

also
https://errors.yoctoproject.org/Errors/Details/305696/

>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

