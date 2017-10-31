Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6072F7821B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 21:35:11 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id r68so1531871wmr.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 14:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=mTXhMlrlfo9VSs0F4wC6SfSEdvsfXDL3FIii3H2h0dI=;
	b=XxXzivI3giJ+DAYnOniyfv1KMxDVNT05lAJX5Sl7OzguJe1yJx10M1gktzIFl3mz50
	7VebkWXrXEDS6hXpEyqwSGVfblHau8mYlBdKK/vhlpN3I5RCMZxIzOYKrKnzVlSXMUoM
	YBivQ3kq8sLHpKFU0ncbMb0zM9Do5CSYvmBd/FY1daHfrNQPa2wmRqMzoPI6TZGs7ENs
	gr2R7Zh9hJFAbiSBXUy7kVLjeCutB9MHaC9zKdXW2SYJnAEgFefmEa3muErnhn3swNUc
	bHlLMU43YY1cp6pZFQr5CCdTiZ0+Ek19LQGCVGjShqChPkxL+lD0B7mgcpGxDsgtlc96
	R9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=mTXhMlrlfo9VSs0F4wC6SfSEdvsfXDL3FIii3H2h0dI=;
	b=LCWrkD092ebG9Kyl3m2CXjqj89I5SQrRZh4l7kxCQZF0CyynLuULZ4SQ+H2+FQLyTh
	bgEjWWF1cpJBL8nvfhtvaQortr2B0H9dRUBlvERJ9xLnCdmB6vdjZ8IOKjgI2hic96mb
	31D2eZag7hvWeAq+Tyfm7sAk6bD28TYkGGlxwm6+jlc1KAn2NSn0jXYEJmK+9KWjuXeH
	mDGM79jPruts7eWv6QGEKgDB0Lhfw3/WmNGKcL3xegAF+ntHv2V1bmjb+ymqsoJvIgtr
	+817AD/4D+FR2d6JW4gw0R+KvlQHHTcSGaTLeOXVTQuYGGtcdUJD+4XVnSUsnZQrYyAH
	aKjw==
X-Gm-Message-State: AMCzsaVETL2DYAYYirVR552u5J503UqlGrnLT7YLc5dHcQgEWotlTG7C
	1452VLcz/UoyAQRDdJud2dbA7bsR2DphpZXCkFW8mg==
X-Google-Smtp-Source: ABhQp+TDgwnM6E+ikFXNDvTjdHjisC8unslKtZcvJlsGoX4AghOFWHTpdTxZBWl7zmBnfCk+PkaxWMzXedUYhN2CVAw=
X-Received: by 10.28.167.130 with SMTP id q124mr2807834wme.136.1509485711851; 
	Tue, 31 Oct 2017 14:35:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.166.19 with HTTP; Tue, 31 Oct 2017 14:35:11 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 31 Oct 2017 14:35:11 -0700
Message-ID: <CAJ86T=WwqN3H-KR5TYnvjG37XNvRVqdWug2o6dR5wiKEzygQ2Q@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: linux-firmware fetcher warnings
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
X-List-Received-Date: Tue, 31 Oct 2017 21:35:11 -0000
Content-Type: text/plain; charset="UTF-8"

The linux-firmware recipe is currently trying to fetch
iwlwifi-8000C-19.ucode which according to:

  https://bugs.launchpad.net/ubuntu/+source/linux-firmware/+bug/1579281

is an unreleased firmware image from a unofficial fork of the main
linux-firmware repo. The "iwlwifi-8000C-19.ucode" file isn't found in
the current master branch of the iwlwifi linux-firmware repo (and
doesn't seem to be there in the history either...).

The mystery firmware image was added to the linux-firmware recipe by:

  http://git.openembedded.org/openembedded-core/commit/?id=8b3d3ac84f787bf4ecccdcbcb97f2dac56acd45c

Is this firmware still required? If so, should SRC_URI be updated to
fetch it directly from downloads.yoctoproject.org?

