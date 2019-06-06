Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id BE41B7C4DB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 15:29:52 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id x22so610648itl.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2019 08:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=U+vgZ1DkDLugCFZwVgsiudtdd28qga5CwNU1GQ9Xbds=;
	b=y3Au6bZ/CM2TmyjqQDjrXqH62lggnbrLFfV9Dplj93l1BB7D2zNtVNTJ2qfem9UpXd
	cgzKZPexTPumSgW1BmQEQ/x+QQeAX/u1GOsPTXKqe+3fDYDf0fbA2/fI+lHcMIbmGBCB
	vTBUHNe9oeeL071pnm9aLPQqtNMgi0XDEW9J6ON+CYILnhBv9ouTtGDZN2Na4CFnpj06
	atThm85tAop/6s/xt325lCTrmFmh8MV4lzZH4nvvAyTwsvcb7i4IGqq/lMSMGhNIsg/z
	y4GDksurQ+jSt7r/pKdRGPESHFUiO6aVWuX3mAstXTD4yDdoygs3xmXM/vJWENBOZBmF
	ofkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=U+vgZ1DkDLugCFZwVgsiudtdd28qga5CwNU1GQ9Xbds=;
	b=TgXGTjq0kOIq30bIZgcwfeG4t6T86tbGPTqCGkQLGCS4GJaB5bbPu00VNz5Tt0OYz6
	gjtqiZy1pR1KwgUE7bd4CjppNJ1LcOhNu6LZpOAYHxuV7EShIDm5gU47nRQK2XQIAZu1
	0FFyJ15+y/0GEmgY1n6GHzw6g077yfGekefv7M8l8Uwg2kGQHUYVUa/xEyb8bK5UraV3
	Q1pgZUcrGxfScTmCvdlXI7QYce2f2XMzYPUz8yXYCpQaf7yKtEHN+Ek5UZk3uN0XPH2D
	OJCAqhc5IwOe7A4IDi2yLy7ac2cabAUF4gQityF5y5y4vhYs0nHB7VcRyyiCEdH+pAIq
	g61Q==
X-Gm-Message-State: APjAAAX4TVkKnLoP74vsZsJSSQfl3rWh1VWY32BkmplI9d4gh3zZQLy9
	vRZ1m/fPae6bZEZhx/2dHnAOiItGxFgsXqcdem9vAQ==
X-Google-Smtp-Source: APXvYqysiJhdidgjRfs3oy+eAui7HiWSnF/zp2TeocmkOIus7/u2LOXNnftGiwxULW3mayDn7DrnuY35SUFVBM77t3Q=
X-Received: by 2002:a02:81:: with SMTP id 123mr13144269jaa.105.1559834993686; 
	Thu, 06 Jun 2019 08:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190606151357.21453-1-matthias.schoepfer@ithinx.io>
In-Reply-To: <20190606151357.21453-1-matthias.schoepfer@ithinx.io>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Jun 2019 16:29:41 +0100
Message-ID: <CAJTo0La-MG7hctC+qAfJtNQ=T5grgVt7U8aQhPLKN+tahARBng@mail.gmail.com>
To: Matthias Schoepfer <matthias.schoepfer@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] fixing python3 build for mips softfloat targets
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
X-List-Received-Date: Thu, 06 Jun 2019 15:29:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Jun 2019 at 16:15, Matthias Schoepfer via Openembedded-core
<openembedded-core@lists.openembedded.org> wrote:

The shortlog should be "python3: fix build on softfloat mips".

> Applied / backported patch from upstream (pending review)

Is this patch backported, or is it still in review?

> +From 7535c39951b9d15dd64c4669092a8582ba555466 Mon Sep 17 00:00:00 2001
> +From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
> +Date: Fri, 31 May 2019 15:34:34 +0200
> +Subject: [PATCH] bpo-36852: proper detection of mips architecture for soft
> + float
> +
> +When (cross) compiling for softfloat mips, __mips_hard_float will not be
> +defined and detection of OS triplet in configure.ac / configure will fail.
> +
> +This also has to do with the custom detection of the build triplet. Trying
> +to do this in a more autoconf/autotools manner.

The patch should have your Signed-off-by, and an Upstream-Status
(Submitted or Backport in this case).

Ross

