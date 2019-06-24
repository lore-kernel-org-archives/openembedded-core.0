Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
	[209.85.166.49])
	by mail.openembedded.org (Postfix) with ESMTP id D32DC7D71B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 16:27:52 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id e5so2211311iok.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 09:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=43uF4EBq2ymv95yzFc7eHs5XvE5vSsgupZxioPGLaqM=;
	b=Yg0uR+G8oOrWuA+YgnyA8iQt7liNJdwpx66pOB4nQJxUyrcyKPTJnxIid5/YGvBsvD
	oVi83WBHsxMi55by+LRHkREl+zE47i0jE/7RtNa7BXR8rY4X9gp1E38bf4edmDpSD9qw
	Wgi/Kc3k6gOxnu+NSjLPCy9XZwtZQVfUFvXrttjH6sLyL6jLMuk/BkS6dsyHu2Ze+LF9
	DkfKu2AN8+0mDxcOh5SkkJmFl4pZTVtyKQT+3QbEZgAJfj2CTgvcZxNuJHs79FVa599m
	gTFgQjcFB7sVA22EHJr/O3FUjNHl3PKhE2mo4dD7DgZZfc1SMggfA61Fo7EfpBgwuJEF
	j9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=43uF4EBq2ymv95yzFc7eHs5XvE5vSsgupZxioPGLaqM=;
	b=mW3Uoc0iseMoZLQw2dBqa0nKrrccpUi0ynR6ExpsuSnjWJPA4UP+JbCCVpG4FIyS1H
	aLU0zsUpYOg+TTpylm/q4ccxFYlbK7OPE7Px0wJWeDyucWRW8E7erOww7GAUehtdsmej
	GXvg+Qg6MuqkJbIsWg8fyHJ76yDIQMcmtuNRt8JhPH5FXJV3KiPvrqldbCwtfKt9MqtJ
	6t71PHnuTbEEtcFZSXC8aTusuzWYIcA2m3jWouMOH6xXDdpTtWXwVWq9ddJZJGOAQemg
	n47v72oL4959y6BhsaqDFTH0yZbi4+1IJxh0ZC5EcM7tQkiWqwr1EhsHsFG1GWzzcon0
	hnfQ==
X-Gm-Message-State: APjAAAWXjPLvuZG/ickeZvtm9UNq+figOFriI29epBW96vN5Q4tzGgLO
	FU0YXdYFGcZf+xhcdj+RgCY6YIYte7pfXtPDcGrIKw==
X-Google-Smtp-Source: APXvYqzmz8X2zli0IPvsKwPo6sCnW3daafmeZuO9fQmTmlFa1tA0itJ9BE+gyFpi3oCh2lkHfNbJoJUJ3VuIx/nn9FQ=
X-Received: by 2002:a6b:6611:: with SMTP id a17mr34406635ioc.179.1561393673944;
	Mon, 24 Jun 2019 09:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190624111324.8921-1-ross.burton@intel.com>
	<20190624111324.8921-2-ross.burton@intel.com>
	<f3e5e0a4cfa0892ce122342361f9ab881ba68287.camel@linuxfoundation.org>
	<CAJTo0LbjqwN689jCZS6uG96E_vDVNCtYU8dJwC5PKzX1Z2rwGg@mail.gmail.com>
	<5512c7f141dc10c8db23cd68fc2250f6f9043eb7.camel@linuxfoundation.org>
In-Reply-To: <5512c7f141dc10c8db23cd68fc2250f6f9043eb7.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Jun 2019 17:27:43 +0100
Message-ID: <CAJTo0LY56sDT1yTb50E8ka3ud1M0kQCRhPNwbXQNrxZb4405DQ@mail.gmail.com>
To: "Purdie, Richard" <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] oeqa/buildoptions: check that Fortran code actually cross-compiles
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
X-List-Received-Date: Mon, 24 Jun 2019 16:27:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Jun 2019 at 17:25, <richard.purdie@linuxfoundation.org> wrote:

> That maybe but I'd still like to test that it builds given it was added
> due to problems where it stopped building and people got upset...

v2 sent.

Ross

