Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id B2D5971B04
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 06:26:30 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id o5so56401386ith.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 23:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=wATzSaMGXrO935SmIbCuSpaRBnWgUa2kNmEsTSLodqQ=;
	b=kYrE8ExqMNLYPgwsMr97j2fgKUKrPA1oHQNyy6J+eTjk5NMUO74U9JfirvZmPyopHL
	Qb7udBs/ABfwFyT5Iw/f5o/oysBpRjpS+Jml7sgCkokn+GAbW93Nr9PpVa85PTcXmTyy
	S0PidxjRhknSw87L50GTz+igNVjp2l1yipSbenNMlhHHN2w7dNJ5BlmlExstQTQZsHR5
	U1/O6z9u9pCdGIcvlx3aZTsch3jKTfJRKjHsCowYh//l7HmFC8Niy5AiDlqLYJw7OSXs
	F3qIYhoFKK2zfgFhjSExWlEYbiUWLJ1CsPh3VD/CTQmJyBV3dM2Q6bjNLA3fNk0agEao
	qRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=wATzSaMGXrO935SmIbCuSpaRBnWgUa2kNmEsTSLodqQ=;
	b=ZlV+aW3fkKoI+TLw/OpUnYYpigP2UDsMxMODa5CUfGlXP5MTqffdLLhQROdY/L9Soo
	wQLinhtbGe5Wd5E2w2OpmoXDU/P5xcj2rnlurVdgTizMboQ3bPJzGnBry2sYuH2OZqwo
	oDspLzLmHhXGeRfvzQztnD+CAdQ7Qrap7JczuzcK7y1avnTVqXAztuwwPF4iDhIDUkRp
	Qs8umS/ig3119zreZLE6VX+nBuRv+uL/icA+22o1+xCKm2FlZ1Vk9YxSqm6Aer5pU/ZH
	VMM3Mym9Ps7rZK/KOVGrzfFAqgJG182p6TW/T1bJNztrRRSJZiHwYZI9x0ThwsvtUxWL
	csdQ==
X-Gm-Message-State: AODbwcBv0jE58ijoFuZrnBf87wqPygCQKXlsijLRGUFnkN6uByI7frcl
	WorCoTD/ZakqhA4l
X-Received: by 10.36.33.142 with SMTP id e136mr9070540ita.72.1494915991653;
	Mon, 15 May 2017 23:26:31 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8EB79.dip0.t-ipconnect.de. [93.232.235.121])
	by smtp.gmail.com with ESMTPSA id c1sm497048itd.15.2017.05.15.23.26.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 May 2017 23:26:30 -0700 (PDT)
Message-ID: <1494915987.1179.277.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 May 2017 08:26:27 +0200
In-Reply-To: <CAMKF1so9iLoMCs7Z0JtO9FEsg-bGpUUUrUH+FZP7YH+PHBs1qA@mail.gmail.com>
References: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
	<e03ca7d9d2d8b290fe306da077e0fc74a6916efd.1494854721.git-series.patrick.ohly@intel.com>
	<CAMKF1spKnOnZfMoijNz5kQjE2=5OO3k4CUVK5d04id1B42JB2A@mail.gmail.com>
	<1494875908.1179.254.camel@intel.com>
	<CAMKF1srA7qkRJMtDgn6eNT8Fhs2dP6YUhJ3CMiNBFU+6ZdreZg@mail.gmail.com>
	<1494877678.1179.263.camel@intel.com>
	<CAMKF1so9iLoMCs7Z0JtO9FEsg-bGpUUUrUH+FZP7YH+PHBs1qA@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 6/6] local.conf.sample: make debug-tweaks depend on IMAGE_MODE
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
X-List-Received-Date: Tue, 16 May 2017 06:26:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-05-15 at 13:25 -0700, Khem Raj wrote:
> On Mon, May 15, 2017 at 12:47 PM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> > The production image recipe "foobar-image-production.bb" can use
> > IMAGE_MODE_forcevariable = "production"
> > and the development image recipe "foobar-image-development.bb" can use
> > IMAGE_MODE_forcevariable = "development".

I'll probably automate the creation of these extra image variants via
BBCLASSEXTEND in an utility class. This seems to be of general
usefulness: base image with default IMAGE_MODE, one variant per valid
IMAGE_MODE where that mode is selected explicitly.

> > Then whatever the user might configure in local.conf is ignored in favor
> > of the fixed recipe values. If there's a concern about using
> > _forcevariable: that could be addressed by configuring a global
> > IMAGE_MODE_DEFAULT ??= "" and an IMAGE_MODE ??= "${IMAGE_MODE_DEFAULT}"
> > in image-mode.bbclass and changing IMAGE_MODE_DEFAULT in distro or local
> > conf. Then individual recipes can set IMAGE_MODE =
> > "development/production" without having to fall back to _forcevariable.
> >
> > Or do you mean that there's just one image .bb and traditionally
> > IMAGE_FEATURES were changed to switch back and forth? The same works
> > with IMAGE_MODE. The advantage over enabling or disabling dangerous
> > IMAGE_FEATURES is that users of a distro don't need to know about them.
> > They get the guarantee that (for a responsible distro) the dangerous
> > once will not get enabled by default for IMAGE_MODE=development.
> >
> 
> IMAGE_MODE is a distro settings not image setting is that correct ?

No, it is per-image. The code that checks the variable always runs in
individual image recipes.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




