Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3F97B6059F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 20:16:20 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id j6so3706038pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 13:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IsG+lYhwLhoDZZ1GfD3X7kPzCXFaLFm0tPiSoiO9wEg=;
	b=C0E/2a4YsriKAf0tGOd6U7PziOF+oIcHPLBkGbwmESkmDZdPf1WRFPm/9h+RAfgyiz
	fFm2N1yNr44FsNnaQ3dL0UbVL9LfRK7a3NHM38qdbUYw7xY5WScvxxtv5z4rGwC8VXh0
	JokW9SB+VpiTCdwC5EJ07VY9unw8zPAra2ORmqYGMe6vmPh4oill+PqtkTbiPn+ICIRF
	HbZonSfAFz5xvmJJ1sNJW7xbY3q5w6OCIHqXG2ZHwILicgC4l7GS5JxPpR9JPzXEx9zn
	NdK7dv+FqDIp94/Ap9eKPj2QV8CTIJS4YXx8g61qRGZujR9v31n+arJ8JXV7/tqHkMPR
	yinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IsG+lYhwLhoDZZ1GfD3X7kPzCXFaLFm0tPiSoiO9wEg=;
	b=GJUKuPWI+xIi6NgyxEBhiCC+vqR2VPwZjplen3ppUkU8znkpDPaVIC11NV5qavRbja
	LFtHB7evLsE9cfP9fm1lkgL5jwK5Bz8xgMh7ZhoDdUsaGzNp5+wsVVGpFJ8yOSzJFZhn
	kHuHblo68EmOYdLuMyomntZwLtyJNYvFkk25ivKm72ApWmuapA5twTl4iLwLhmQCARDv
	/9AUZrHq4aYVI4gzzeNkLe11dcLXRC0BhEt5TKZ5RylTDhAdEavHsKC+oHvruCcGOQJc
	6701w5f893557VI95ORWXHphMUhWegVkmyfVJ5X5s+EP9SQGj7QqY/L9cKuGzYshEf3B
	NS4g==
X-Gm-Message-State: AHPjjUhT2YgUwPFBjD2DCpQmXixC5hqvY49X5dwKmcBere8cHV91iuos
	Ogx9GhO3qB345EZPWoc2ctXn4C7uTA==
X-Google-Smtp-Source: ADKCNb6PPvWnDQUH1aaX6PvTDitS2sv2316P3uDuQzGpJphiV6e85fBEo4F5QXhvr38CcxHWxn8O2y17k8CKN19ZvJw=
X-Received: by 10.99.51.15 with SMTP id z15mr1515026pgz.287.1504556182412;
	Mon, 04 Sep 2017 13:16:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Mon, 4 Sep 2017 13:15:51 -0700 (PDT)
In-Reply-To: <CAJTo0LZ8UWNkC6td+UYbwB6RENqLx6JFZEakzfWHt6esRGwOyA@mail.gmail.com>
References: <20170904051224.37668-1-jose.alarcon@ge.com>
	<20170904051224.37668-2-jose.alarcon@ge.com>
	<CAMKF1srd9CWxX7gxAUfNxjw6kkk_bcLoVr6UZqGeD8v7FWaTQQ@mail.gmail.com>
	<CAJTo0LZ8UWNkC6td+UYbwB6RENqLx6JFZEakzfWHt6esRGwOyA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Sep 2017 13:15:51 -0700
Message-ID: <CAMKF1srBZ9R9OG0+ApeMu1iAawyZ81iqmWfAS5QdbuJeP9kkeg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] rootfs-postcommands: add test for unsatisfied RRECOMMENDS
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
X-List-Received-Date: Mon, 04 Sep 2017 20:16:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 4, 2017 at 1:12 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 4 September 2017 at 21:10, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Sun, Sep 3, 2017 at 10:12 PM, Jose Alarcon <jose.alarcon@ge.com> wrote:
>> > The do_rootfs log contains a number of unsatisfied package
>> > recommendations. At the moment those are only visible when
>> > reviewing the rootfs log.
>> >
>> > This patch adds an extra check to surface any unsatisfied
>> > recommendation  as WARNINGS to the build output.
>> >
>>
>> I think a note is more appropriate here.
>
>
> As it's opt-in, I agree that warning is relevant.  If the user didn't care
> for this, they wouldn't have opted in.

yes I forgot that its an opt-in and was thinking its another set of warnings
with opt-in it should be ok.

>
> Ross

