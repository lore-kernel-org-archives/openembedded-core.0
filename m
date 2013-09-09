Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f50.google.com (mail-vb0-f50.google.com
	[209.85.212.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1E8E5615F0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 12:12:21 +0000 (UTC)
Received: by mail-vb0-f50.google.com with SMTP id x14so3808353vbb.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2013 05:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=JtWWfrfLZ+8gHt5wSXz1Vt0MEdJsMYup+PILIRR8qgE=;
	b=WYEzygDqw6ZYzk7h4RZuDo5uXFiwPEeZLj95FYmnSJOj8RqBtttA8Rg9+UYRz1vRUf
	M6hhcdKmreWGCJx7fyt3Q0/vRt7qKUF3htLo9SlWqVitMrVdfYJrBTdgWaqzyNqB9hva
	2OjbpztRm4neisOP8xVjGDb3kcXkgSus9C/m/hD9VPgkwO6hCke3pAghMe7egBH20UpI
	Cm4Ulf9mDTzOWyPT28iVQcvWPdFBUJc/L13m6s3ki3asE/aIVvO9HGEZsNSetrXb/KHF
	dS9bnsc13W1j1YalqrQObV4Dy4g7DIr0gxnwjPjp9QYI45SU9I8lh/pyL+CcXZ+qa5EO
	gEwQ==
X-Gm-Message-State: ALoCoQkX6oht21B7gtGXk3qpuc5Amt2LJX31r7KAR9WllD/VyD/qif6C+NJw4ZOx4t4bGG7odcxY
X-Received: by 10.52.164.16 with SMTP id ym16mr25444vdb.32.1378728742891; Mon,
	09 Sep 2013 05:12:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 9 Sep 2013 05:12:02 -0700 (PDT)
In-Reply-To: <20130909120824.GQ11500@jama>
References: <1378721952-10827-1-git-send-email-ross.burton@intel.com>
	<20130909120824.GQ11500@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Sep 2013 13:12:02 +0100
Message-ID: <CAJTo0LaLKDACnUd6BZdUjLR6p87unCaF4pH_g+c3b-5c4w2NLw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] mesa: use distro_features_check to abort build without opengl feature
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
X-List-Received-Date: Mon, 09 Sep 2013 12:12:21 -0000
Content-Type: text/plain; charset=UTF-8

On 9 September 2013 13:08, Martin Jansa <martin.jansa@gmail.com> wrote:
>> +REQUIRED_DISTRO_FEATURES = "opengl"
>
> Is this really needed? I was building mesa in distro without opengl for
> long time and was considering (probably incorrectly) opengl DISTRO_FEATURE more
> like sign of proper hw GL libraries.

I'd always understood the "opengl" DISTRO_FEATURE to mean "give me GL
support".  *What* that means depends on the target hardware, could be
entirely software rendering through Mesa or binary HW drivers.

Ross

