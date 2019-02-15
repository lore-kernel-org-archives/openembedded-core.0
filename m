Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id F039E7C761
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 19:58:34 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id y195so6425040qka.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 11:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BrDMeVzqcg7IEkBnvNDiOoD7RTGeULPOB9qRhDGlVAc=;
	b=buDaN+l5RDmZjiz3knN9kj1gbOb7fCtGrnTNHOqG08WTqFSD1Wj20phpB7/Mar3Ayu
	Tx4qMbJcIDH1vxZfUqBgyMKPZipdfdCjTLxaVBoBnNle6dd/+xpYjphI1+7gnRUeOpZd
	hC2SDCI+NJrsabbCM+pey0bsodY2Qy41aopiCA42Scr+BBHNac0s6aYxRGuqMi3Vbbob
	Rqwqcd5qrVSKINfhIN7O7LOliWgvkAmBVbrhhVdTxd96/+wbxzSdq10xUlVrWxLgvd2/
	xCavqjHsPnpsQoPbycatKzxCHdmX1cH9zxwQWrr/Jk8deUfkrqC4VUoPekGv/QabAW1W
	fZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BrDMeVzqcg7IEkBnvNDiOoD7RTGeULPOB9qRhDGlVAc=;
	b=lCMCY2miULb/bmrdfEcHODunPqO1eBH5mL+3bR+2dF7bZCz3xd02XYlm4Rr1eiPb1P
	lBagLN2Waa8R+bPNNU8ny6iGwEpOzhuiDEtzE54WcdmCr3vl8jW9Jds9RDQLlRjDjlAP
	NTtUsFFFx2dpDxzYRnc2+o610ivwC0FLOE1dwlcrWLmkJBcKn+nR5fSJtOENO7A2NMcA
	dQicsu2wEgRdLEutglGKl7PhA3Ffc4GgiR/8zys+PETDuYXcF6Qo6EKQsCXgnPbPXQ9S
	Y3NJPUZ4ZLm5El5aBrsDIoPX367mIC+EJcORI2MsrfNiwHdbptZopchcV0DccacRgFwZ
	ZD0A==
X-Gm-Message-State: AHQUAub5wvs6cNPSC8n3cZ9urCaQcNw8TsLJurIlePoX5INzWw1+ohxz
	PO/T4RAXCWMdoJx4WWuc45V/yEelIY0JMAvHJYjWdA==
X-Google-Smtp-Source: AHgI3IYX6jqoRZ+z+VQOuxfgYIF3ALH01qH8QXf0YL802M2UsIbWcGUOwWWHc3Nt2y2ktTmnsoz6Am+5S1PW/Z4L0S4=
X-Received: by 2002:a37:9585:: with SMTP id x127mr8355288qkd.315.1550260715616;
	Fri, 15 Feb 2019 11:58:35 -0800 (PST)
MIME-Version: 1.0
References: <20190212054754.2801-1-raj.khem@gmail.com>
	<20190212054754.2801-3-raj.khem@gmail.com>
	<CAP9ODKoZoL7avYWkVTihunZXdZ5AJ9NPv6N3nL=Uk1geN+Vr4g@mail.gmail.com>
In-Reply-To: <CAP9ODKoZoL7avYWkVTihunZXdZ5AJ9NPv6N3nL=Uk1geN+Vr4g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Feb 2019 11:58:09 -0800
Message-ID: <CAMKF1sr9j-chtC1n4x-LYwXdoSo+Hdxg2i6K1JmcWis2b2Lp5A@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 3/3] image_types.bbclass: Set memory usage limit and CPU threads for xz
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
X-List-Received-Date: Fri, 15 Feb 2019 19:58:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 15, 2019 at 5:44 AM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> On Tue, Feb 12, 2019 at 3:48 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > when building with opkg backend and huge packages e.g. chromium/llvm all
> > going in parallel, memory pressure causes xz to catapult with
> >
> > do_package_write_ipk: Failed to create package, opkg-build failed with: xz: (stdin): Cannot allocate memory
> >
> > since there are many tasks going on in parallel, xz adds to memory pressure
> > and it wants it all, put an upper limit for memory xz can use
> >
> > We add a variable XZ_MAXRAM with 30% of RAM limit and can be customized
> > if builders have more memory one can set it like
>
> The commit log refers to the wrong variable name, it seems.
>

I think thats a good point. but we should submit right names for documentation

>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

