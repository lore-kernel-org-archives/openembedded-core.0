Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
	[209.85.166.45])
	by mail.openembedded.org (Postfix) with ESMTP id 970EC79E9E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Nov 2018 16:52:25 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id o19-v6so12689935iod.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Nov 2018 09:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Av1H0Q3Bsd3xS78h1q4eXIWMatvvuiH4u+ujlc+FLAo=;
	b=RrybFO0+JuXMMqv4ED6nzK/qmYT7/CUK06MBMdrupwjEOVYmli1j6CnDZt5EevUe/V
	mNS7N5SElXTb6E52oz+yuzzzbggDa29hKOGY1MHtJ/fS+7kwqwK0ldvohOYGq6xB0FLq
	sb8MsvtnIb+sKf2xk0dLBts3yIxSsFpHua2IoajX45ro6yD5KREIacgg6xcEUtRh1+jD
	UJaepRy+4A3DxG1bMHVdi4KjssGoXZDqgpMFJERPaf5AIxPxkkveUlXZzUf24dbXK6gf
	9KUjuv7DjWRWSGXYg3gGSRd+fCvyBuvBAi7i53dWozT2FtaSRuu53HvcUgvzHclgADYt
	Mlyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Av1H0Q3Bsd3xS78h1q4eXIWMatvvuiH4u+ujlc+FLAo=;
	b=bVftY2SKCAUMKFrIqu/qPSI8jVl0/N5fV5sQWuyVeslhS9Ob8BdrJCrOxPFKnaXkln
	YNi8W3LRwiKcf8fmdAa8cShGJNnlno446aBz9Dmfcx2q4C8ePtTNSg/lJHNIVSFpFHjw
	kxMJUqZTSPhuuo++VQCceV7KS4nNiC6IALwL2VOSh0Ru5fNIy1hGf0dnNTh7dtyJYjlw
	h2bK0Eyf1BDg24L5cVvhEe9PaGHm45wC9+MpcW7h0hL+fGto7QowIGgn2bipzhzNgEr6
	2mKjXOAGVadpEzJIRCoSIia1n1x9E/+nACTLrtiKKQSDpVEOs4CloyvyCpW18RWnaNSQ
	GGyg==
X-Gm-Message-State: AGRZ1gJ98/mchTt3MBXdb4KA/cSooJvu+Cr5fcJVqEcEIbFrcPnJ9t3A
	qGTgtRIzFDLVJEif2XMQ4cTrMRa+UFlAj3FJo0tkQw==
X-Google-Smtp-Source: AJdET5fJJhkHcccEsbYKxLxIv7/yE0m0c8Dwm8SkjHfPPPzEWrBXGyTjbfbPQY6cooF8qNWlbwPnTSMB3ujmPJVcBLA=
X-Received: by 2002:a6b:1602:: with SMTP id 2-v6mr220827iow.201.1541091146750; 
	Thu, 01 Nov 2018 09:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <1541090053-1643-1-git-send-email-serhe.popovych@gmail.com>
In-Reply-To: <1541090053-1643-1-git-send-email-serhe.popovych@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 1 Nov 2018 16:52:14 +0000
Message-ID: <CAJTo0Lb4AMdRUv8JqOkPZQnerrgnHYREdFChb0wBavCH6A0WpQ@mail.gmail.com>
To: serhe.popovych@gmail.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [[PATCH] libgpg-error: Support build for native on ppc64/ppc64le hosts
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
X-List-Received-Date: Thu, 01 Nov 2018 16:52:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Nov 2018 at 16:35, Serhey Popovych <serhe.popovych@gmail.com> wrote:
> +         ppc64*)     TUPLE=powerpc${TARGET_ARCH#ppc}-unknown-linux-gnu ;;

I agree with Khem: clever, but explicit wins here.

Ross

