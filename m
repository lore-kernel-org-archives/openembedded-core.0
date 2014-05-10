Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (unknown [209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0C7AD60167
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 May 2014 07:21:39 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id e16so5705232qcx.27
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 May 2014 00:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=uW9+upETZ/A1h/RITW6O6FBb0eHCVL25zbS5OdYqLgs=;
	b=bADq/li0qp/ELKu3WKoY3fTIblJEpeCOIT7lIitt35sIOXcNwGt1qbh42SxcUFUB5v
	gKpsZqhfjAUGvuYPCgSJ5JtwiX4ujvFENLeZO75tbGJhYkA1tfyrf6AnHT13epLB6os5
	0ytJerx4yzhd0hjr4UWQzEZjGWjnXRVnfds2HPAkiLomybjPReTEEta1qVG1dFGz743V
	AHk9TJO5iiZYtn2bgARzoVmrHj07YWMKlfO2DSTAS4BR9Qw2RCijbwsgIJ3bc2FmJIa+
	Do3DurtjjiCI7jdarlcsRBTm7v/qcCd7zdZ9EihpruRSqzMQcm8KNJIqX3HzUfPT0/7S
	TzGw==
X-Gm-Message-State: ALoCoQlRl158i4xioS1Q7X+mycJJb2sx7C8Tf1UIiFMiZ1hTOUJ3A//7oejeWi9gmP5xEl3bFQba
X-Received: by 10.140.48.161 with SMTP id o30mr20300888qga.68.1399706500290;
	Sat, 10 May 2014 00:21:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Sat, 10 May 2014 00:21:20 -0700 (PDT)
In-Reply-To: <20140509222915.GC22774@jama>
References: <1399645908-14499-1-git-send-email-ticotimo@gmail.com>
	<CAJTo0LYCdUJMPN8+pZWXrvsRc9fyiq7gm2dOh0N3gRcqWFP1CA@mail.gmail.com>
	<20140509150721.GA22774@jama>
	<CAJTo0LYAv1e0ko7jK6mm9Uz1Hsqvd7rq8dYshogVAE8mCMa=Aw@mail.gmail.com>
	<20140509222915.GC22774@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 10 May 2014 08:21:20 +0100
Message-ID: <CAJTo0LbrxVZkgH4ad=pcNAr4qEp64TOwZbgLOnOrG6TO7DXjsw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston: add lcms, libpoppler-glib dependenies
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
X-List-Received-Date: Sat, 10 May 2014 07:21:41 -0000
Content-Type: text/plain; charset=UTF-8

On 9 May 2014 23:29, Martin Jansa <martin.jansa@gmail.com> wrote:
> Something still links with it as shows in test-dependencies reports:
>
> weston/weston/latest lost dependency on  lcms
> weston/weston-examples/latest lost dependency on  libpoppler-glib

Sorry, I meant weston master, not oe-core master.

Ross

