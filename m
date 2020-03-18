Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5D4EE60B14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2020 03:02:17 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id l20so19523073qtp.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 20:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=ZMGTzXKKCA1piMna7V7nTbG4o4ToI6GwbkLNGyjeVP0=;
	b=XW5NbcDXMe3GQcN//ttYN2+8ExDYNxNhWUt/olGJrnQ59hqjGu5oBVFThKIYGuGEjm
	6zwCQiKFZBsecHoNdywzysp+K9VsxeUK9v+XVGnRfYfC9y6XIHBl9t010PjxQdXhBY5I
	V2EEXeBakLQBnbYSzG3EIjcOeJYlPgKL8s3lltQeLFsK22v59aJG2TWqUDdduzUorQpb
	9e21kHJpvMOqPkrpkJAV3MPrbzZ3tKpZgG8b931l9J3yL5TzYqrggvX1vYQu3KDKftaB
	otvpkSTD2oRgi6owi1ia3c7GjX8XQx0LWuCBdZxZMOuHsa9FTlYk1axXL31TSwZr+gBR
	+wQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=ZMGTzXKKCA1piMna7V7nTbG4o4ToI6GwbkLNGyjeVP0=;
	b=GKdHke3e2FnIRz4milKY+Zoh7ix6/Fgz+2BwOiMNTH8Nd85RoFxQ9uI06kQhr/2rnH
	mwVV9dJH35vHZT0BTRgHIeRGqUL2dsnOumaRJvd9LA+CPDq2mynJSX5lV3aP9Uqoq7W0
	vBgI18jsjHe/X0/XvrSzoBd+P1dEf4+qY2wbaHK/75bTCsS/Z95D3UMtHylewDlJQnHM
	/GCVfLCdXRfnj8n+taDNo8Fhwa6P2aifuQdX+h5cdh7l6cLyx6Zi7KrMumJ5+lq84BMg
	XUQt6FF+GRgvnHx3nSgi6v+OhrSuFhwvRVg9Uqw49g8qkwgMXVHV1VB/DoupyVxGjl6N
	/cHA==
X-Gm-Message-State: ANhLgQ0Xx2Z8V2CVcbggZKyO3RG+u6Eg4/o6OZT760c+8maqK3RCCyCy
	GYKMtE9bSqaNHEBESaGSiP6gDJyEledTPw==
X-Google-Smtp-Source: ADFU+vsIr0nAxe3xmf/lvukBPQ5vDW8GQ9v09ToorbygNzxxZUSWtSk4mVNqCpxbck0YgcpNKCSpZA==
X-Received: by 2002:ac8:33cd:: with SMTP id d13mr2325927qtb.265.1584500538510; 
	Tue, 17 Mar 2020 20:02:18 -0700 (PDT)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com.
	[209.85.222.182])
	by smtp.gmail.com with ESMTPSA id u4sm3184485qka.35.2020.03.17.20.02.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 17 Mar 2020 20:02:17 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f182.google.com with SMTP id d8so36429414qka.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 20:02:17 -0700 (PDT)
X-Received: by 2002:a37:9542:: with SMTP id x63mr2151926qkd.82.1584500537143; 
	Tue, 17 Mar 2020 20:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200317152303.4600-1-alex.kiernan@gmail.com>
	<20200317152303.4600-2-alex.kiernan@gmail.com>
In-Reply-To: <20200317152303.4600-2-alex.kiernan@gmail.com>
Date: Wed, 18 Mar 2020 00:02:05 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoAXWCgREiSr2xRkGNNvEEwtz6Mzhqx0gK+0mQu6a+kFw@mail.gmail.com>
Message-ID: <CAP9ODKoAXWCgREiSr2xRkGNNvEEwtz6Mzhqx0gK+0mQu6a+kFw@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 01/11] systemd: Package udev rules explicitly
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
X-List-Received-Date: Wed, 18 Mar 2020 03:02:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 17, 2020 at 12:29 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> udev is packaged before systemd so any wildcard inclusions in FILES will
> override later specifics. List all udev rules explicitly so that the
> systemd specific rules, packaged alongside systemd, appear in the
> correct package.
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>

I believe udev ought to be on PACKAGE_BEFORE_PN so it is still handled
with the wildcard and allow for easier maintenance in future.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

