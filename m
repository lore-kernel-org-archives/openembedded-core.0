Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id EAB607E799
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 11:16:38 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id j5so22919763ioj.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2019 04:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Aadw4YNZn9yWCNghuNu3+OmBrf75BAlC7ydqKDC2YOk=;
	b=jVAX16K4Y3+OGtSeO053Gm9r6yObyifkgk+jyCLjhDkeaqjwKivU4N2v5uPd4ZF7M/
	i7pRkKJ1tY5kwzwCmBz/3xoQmYWwADp4uuV0pK7rqMhAaCnYoO4YSD+R+3VCHkCx1elb
	GsFtChYyFkS5WysCnziunAge8GujVxxh59gVvwYknPfcso7Hm7JG20e2XXSMcVLpFfOW
	xH/4F2Qz66kYWaK8Y09yltKA/OJhMOfJsfDvwmSz946djMSEEl2uOc3ziwh7DPClV3+9
	NbCc3nCokzlOJi2lXiCD6rQPitdnrckPlZ80QDZt7oNwhhrv9Eit+rUFYt2PLAvKmNxG
	Outg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Aadw4YNZn9yWCNghuNu3+OmBrf75BAlC7ydqKDC2YOk=;
	b=KmTQTX+csinJAvFFjSi7IYJB4t8EUSzT6WvngDk53+gvWNMFGX6SwcD03NTGvlXfvQ
	RAYr4PRSU8r4W2+dXUVd+Yyfq4wpmdPEmtgofAoixtDBD99ISiUyTMYgmGY28uFtbEZh
	8eTEb/3N2valyRbI/I+tm5Pw3/5851YydELKb0rWJUbxSmFCRS5t6eC8sqf+iz9Ts+/l
	rxAmevbJkFOaVPrHqqJo5XNbndxqmB7w7U7tgDCTlCS761g7S19I2aVdnJ3btwrY3+5E
	7aTNlFZG22M5xg7K2Xtf6NSBAj3XG7hD/JUJ15vymNwSHPpdWZ0ixhH5Sx2Fxzvhuq4i
	lE2g==
X-Gm-Message-State: APjAAAUXjsYZQ+T8VRNcvDRH7NrU7Wel06yZWqf2d6A/5lByyEriYK1Y
	3mYAai+TrOS4YvdzrCUGHcZyj5lGkVOkPbBx8Dk+PoM2
X-Google-Smtp-Source: APXvYqyg89RKxiMvwCoHyzKAB2j+Coi6B3Srt5q4+Npc/03gtIwaxAJ+zreXfS3L09RebOALqrTOm2t20dAlJ6awrYI=
X-Received: by 2002:a5e:c744:: with SMTP id g4mr23641376iop.187.1562671000088; 
	Tue, 09 Jul 2019 04:16:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190706113909.11836-1-nathan@nathanrossi.com>
In-Reply-To: <20190706113909.11836-1-nathan@nathanrossi.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Jul 2019 12:16:28 +0100
Message-ID: <CAJTo0LadJjwL+NN+09uWCcgYpGa-2Kggx_wPWkXejA2AmU=B9g@mail.gmail.com>
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] Add gnu testsuite execution for OEQA
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
X-List-Received-Date: Tue, 09 Jul 2019 11:16:39 -0000
Content-Type: text/plain; charset="UTF-8"

This is awesome!

On Sat, 6 Jul 2019 at 12:39, Nathan Rossi <nathan@nathanrossi.com> wrote:
>         | gcc          | g++          | libstdc++   | binutils    | gas         | ld          | glibc
> x86-64  |   589/135169 |   457/131913 |     1/13008 |     0/  236 |     0/ 1256 |   166/ 1975 |  1423/ 5991
> arm     |   469/123905 |   365/128416 |    19/12788 |     0/  191 |     0/  872 |   155/ 1479 |    64/ 5130
> aarch64 |   460/130904 |   364/128977 |     1/12789 |     0/  190 |     0/  442 |   157/ 1474 |    76/ 5882
> powerpc | 18336/116624 |  6747/128636 |    33/12996 |     0/  187 |     1/  265 |   157/ 1352 |  1218/ 5110
> mips64  |  1174/134744 |   401/130195 |    22/12780 |     0/  213 |    43/ 7245 |   803/ 1634 |  2032/ 5847
> riscv64 |   456/106399 |   376/128427 |     1/12748 |     0/  185 |     0/  257 |   152/ 1062 |    88/ 5847

So what I'm really interested in is what those numbers look like for
e.g. x86-64 on real hardware: are the test suites always failing a
bit, or are these indicative of problems we've introduced?

Ross

