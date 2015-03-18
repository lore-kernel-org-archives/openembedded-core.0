Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 798CC60034
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 23:37:28 +0000 (UTC)
Received: by igbud6 with SMTP id ud6so8504801igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 16:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=EyBDYDU1PFNgG/xxjjksB01a+68OAlzFoBw8OkCKFBA=;
	b=lhyhWJXfWaQ/lQGeKENoy0IWdOcbZrzztm1U/rFZtf9kq0FZav1XURq4cKDKHc8eq8
	qnwT86RX3gfQPcbEpCchRF2Yaaz7FwbkBLffrVW46ioAgg7v/HBpAd0uCpLIVRrWDJxA
	k8WyHPJ8p5mAmaXGqvyt8if0danlQnLuVBz1MeGcMivC6lrz/0Re/j80835DsJ3ZHZHM
	js0E+1h0SFhNnmwUZT2i4NNq2aRIji+agVcyDz5f2NFVGEoO1DPaTDOeN6fpN6wAeVwX
	eiCL447QxaDyUG4jOldoH8P0bfHZwhETRsKlUTAEC+f0fzL+FtuxeATSk/c9vX58ytyQ
	VhTw==
X-Received: by 10.107.6.212 with SMTP id f81mr129960177ioi.37.1426721850123;
	Wed, 18 Mar 2015 16:37:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Wed, 18 Mar 2015 16:36:59 -0700 (PDT)
In-Reply-To: <1426718042-18369-1-git-send-email-jslater@windriver.com>
References: <1426718042-18369-1-git-send-email-jslater@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Mar 2015 16:36:59 -0700
Message-ID: <CAMKF1so99EyEXQhDT9kp+NPp1Zu0HHWMov6-wJU3MV5bUksnxg@mail.gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ltp: find all .debug directories
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
X-List-Received-Date: Wed, 18 Mar 2015 23:37:29 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 18, 2015 at 3:34 PM, Joe Slater <jslater@windriver.com> wrote:
>  INHIBIT_PACKAGE_STRIP = "1"
> +# However, test_arch_stripped is already stripped, so...
> +INSANE_SKIP_${PN} += "already-stripped"
> +

Can this be avoided in the component make system instead

