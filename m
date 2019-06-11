Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id AE2297E4F9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 14:57:33 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id r135so5254052ith.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 07:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=f8qVNoL5KjUhmZNCD5CJkfne7PIhiqdRq3t0dUPsTG4=;
	b=TNhfqyZRq09TuESkWuqc6Nh/5ZMMrUwOzWwOQs3b/3EXuWhD8Kcf17aDeSmetoP2Nx
	iZ5PTjYwcRhDLUzLriZyixTcJj428mZDKoCnmId/g7q2aXVZp/M6guC2mYDyzDlP8kwv
	3oxNHxta5nUkS5FAbpdW/cB21/wAkKzfw/JqhE7FX2K51QjonWl/233Trf2W1dNhOG0B
	zD6p/kLKigiPpogijV7/EVUoRhhizE/ekD+DmJk1WWwpvF99v6JhqQNhkhXBIy0TFFFS
	rI69QSO2Bb7Q2JxjtudZ0nQse8uUwnrY9+uHNXbSoWrxqZw/PdS/N16KDo2F22mE3D79
	/QFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=f8qVNoL5KjUhmZNCD5CJkfne7PIhiqdRq3t0dUPsTG4=;
	b=ALyfz/JlfleyTov7mu+sbKzXtFKlA3mzs1FCsu9PYltNM2+M+lswEHpPLT9htLzsOe
	POl+KkbViP+IwizY8ArlF6q3E4YUSM0hFMXS5+FtwU1Xdkal050EDH1zl0PJ3UyJCqmm
	atQauVw0wly814/T6w2KgPkNfOxS+wnKxLoP9dOKHKghUyE1LICdhFyeY7w3f+iG+3OM
	M7f9I9JZGY63GfPdGMWGXeEoekLGOUQ9jXDVIJih3BDvYMLcdy3cK4Ym3p1KfhZkefwD
	naUGpNecOYkpEE4YNMgRXvYob/xAqLbA35FRiIWTXiJbZT1FRWuG383PC/dPMzXoVhrJ
	p5EQ==
X-Gm-Message-State: APjAAAXRD0BuJI86fWtuNHSz/DD0fybgnE10WdbF4XDL6M6iE7csB9MK
	SVIJaQ3FY3z/pzrvp2cWbaat8qSR8x4cMQmC8qfGZg==
X-Google-Smtp-Source: APXvYqz7BpeQpoUeVV1KuUCS3Qyq1O5jDoxNe5yf9xle9LY6CLY9SVGNcu8Agsalo3qutpfurKuBlwI2jmIuhpXaq8Y=
X-Received: by 2002:a24:edc1:: with SMTP id
	r184mr17464302ith.133.1560265054799; 
	Tue, 11 Jun 2019 07:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190611142607.18038-1-quentin.schulz@streamunlimited.com>
	<20190611142607.18038-2-quentin.schulz@streamunlimited.com>
	<CAJTo0Lb2E-yTtJaWE5ezF-jTNpVXKyWD0i5xhJY8rrnzxfrjhw@mail.gmail.com>
	<20190611145216.2766qintxmm3pkwr@qschulz>
	<20190611145605.ncwvewkse7cutcuu@qschulz>
In-Reply-To: <20190611145605.ncwvewkse7cutcuu@qschulz>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Jun 2019 15:57:23 +0100
Message-ID: <CAJTo0LYXr0VSCAVCKLfGpzFkUWiJ0fRgCgr2CJQg4D8mXx51qw@mail.gmail.com>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	andriy.danylovskyy@streamunlimited.com, Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH v4 2/2] selftests: add tests for INCOMPATIBLE_LICENSE
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
X-List-Received-Date: Tue, 11 Jun 2019 14:57:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Jun 2019 at 15:56, Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
> Also, I factored out everything into a function that shouldn't be run as
> a test but when doing:
> oe-selftest --run-tests incompatible_lic.IncompatibleLicenseTests
> it tries to run the function and thus fails the test. Is that okay? if
> not, how do you usually proceed?

So Python unittest's behaviour is that any function called test_*() is
a test case and is executed, so just don't name any helper functions
like this test_*.

Ross

