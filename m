Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2E7576AC1E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 23:48:33 +0000 (UTC)
Received: by iodb91 with SMTP id b91so167240629iod.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 16:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ScOG3vgW9qDHiA4UaOLsYhgTx80rVzFdXdQNNjprLB0=;
	b=yjIamSFblF0RNF8Eh/MIoeuB+rBDJ5XhOQhwNkQm91h6ai7y7wr1fWaKZXaZITfp3x
	96bBOXbpT942VgptGBAqgHNgHfAKU18L6WKs7ciFt7quf6NWk5TsyIk5KjYkt5Snkt/J
	va+kl/bCOsw5oiMHVMJ0HaRuv7PlM/HiGASWHZyrV7FEeAfHCGJtT5zh/M4pcYmM1SJh
	GKUEl+iqFSwS3x673skJJp2O7/AzE2Zr1+AH3B4s9SM3d3WAmUU1pt9ruf6E9IIhgFua
	XwUfBKmAszbSW/0WPQxZ7S83eOVLTP6VopYJwseuT5VYqCsZ+8CZR9Pr6+faFXO+Dvft
	Rj6w==
X-Received: by 10.107.168.214 with SMTP id e83mr20055942ioj.112.1440460113355; 
	Mon, 24 Aug 2015 16:48:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.3.135 with HTTP; Mon, 24 Aug 2015 16:48:03 -0700 (PDT)
In-Reply-To: <55DBA060.5070109@windriver.com>
References: <CAJ86T=U8Gw5RcJz8RNzH=8MNbxHVHGJgdZd3N+pvdLCVdH+yXw@mail.gmail.com>
	<55DBA060.5070109@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Aug 2015 16:48:03 -0700
Message-ID: <CAMKF1sro4HvFwcG=LQNB0MXRLaHmzRquh8UrxPgCTcMmSGXfSw@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 v2] libcap-ng: add package 0.7.7
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
X-List-Received-Date: Mon, 24 Aug 2015 23:48:40 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 24, 2015 at 3:53 PM, Randy MacLeod
<randy.macleod@windriver.com> wrote:
> Parsing time and probably memory used scale ~ linearly with the number
> of recipes, so that's a *bit* of a concern especially since it's
>  > 500 additional recipes or an increase of > 25% for our distro
> but it's not the top issue.
>
>  > there another reason why I wouldn't want to include them all?
>
> As Mark said, it's a business decision.
>
> There are (probably more than linear) engineering costs to
> adding a recipe to a distribution. That's why we were using
> the meta-FOO-subset approach.
>
> Of course, personally I'd like to provide the full set of
> meta-openembedded layers and more! We might be able to support
> all of meta-openembedded at some point but I don't think it's
> the right decision now.

Its fine, and you are free to do whatever you wish to  in your fork.
Its when these policies start to shape up layers, that's when we have
to be vigilant
and thats the point I have been raising.

