Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 89251609AE;
	Sun,  4 May 2014 23:53:43 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id uy17so4052005igb.11
	for <multiple recipients>; Sun, 04 May 2014 16:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=hbP4jRPkCCDyyUOvvCmu3qisodZ8MyF4H7ErIeoVTQ8=;
	b=zJ9tRGfZWuN5tsIPrCLPVFxcuFsgZU6c2rUQheqRP91OqRZ+LKt/KqLwXXS0XA8LBF
	yGRFpN3/QMLXSFv9gouYSlQUAMzJCLHXIFQo2DxFjH67F/oX/0kxAsr/0fYfa7R2DIlZ
	3ANZoCRhcJqTiz3lMAyQ0vkR3zdDuyWxy6m3HwwiH/5CZQrYa/R0aUVR0BeLdGaScElL
	rNzmXCYcM0tm+RoxquvJgSvMXzeYs0WotdyaACvzWaRdz9liIkLmwU6fNjj2URPF/w0Q
	WLKlFWfXrrmrZbshHjoxFuWLEfjOPaIp4Q8XaB2n6q8aDFoIYHhZ2oDNCHRd62BLFlUQ
	kgig==
X-Received: by 10.50.43.136 with SMTP id w8mr19873854igl.20.1399247624174;
	Sun, 04 May 2014 16:53:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.74.228 with HTTP; Sun, 4 May 2014 16:53:14 -0700 (PDT)
In-Reply-To: <20140504145024.GD2486@jama>
References: <20140504111629.5E32A504E8@opal.openembedded.org>
	<20140504145024.GD2486@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 4 May 2014 16:53:14 -0700
Message-ID: <CAMKF1sqAEB77eo6dQzkZgqqk1CQkWoa_YFP4y_ZNwteJoRz7KA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Khem Raj : lttng-modules_2.3.3.bb: Fix build on ARM/gcc-4.9
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
X-List-Received-Date: Sun, 04 May 2014 23:53:51 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, May 4, 2014 at 7:50 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> Update the structure to work with immutable bio_vecs
>
> Is this really 4.9 specific? It's failing with the same error message in
> every qemuarm world build (even with daisy).

its not specific to gcc 4.9, however thats where I discovered it. The
fix although is generic and should work
in any compiler.

