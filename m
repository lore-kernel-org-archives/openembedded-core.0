Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id DD65C60125
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 00:13:13 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b189so6165082wmd.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 16:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7W5KYv7MDUcAEnkCcs8s2FhaPoLBEJeEhQhcIsgc2Yc=;
	b=GATGeXbxYY3bO3jOn5n0smd0hfM4HnAktm6kOFr4v2ZrhrBknPS+9wwTvpJ5nPxIWU
	Iapl4ovxgpfNRd4QruRNcnEBXqN4g+FMMidh5xOpkpwXN9JLz2nEa2MOInnphnFBT8/d
	oTTnNealdNgpxrEqFaRFaiNN2+xxVMKLw2XkTbzQIApXGWCFrAJ8dTIXsTbO8bd0KXEZ
	cxT9tBYogziJeHrBdGpTbzIS54moqHcbUwlHBIrKSwx1gkpuyqOuTJnKJtKNKVkl17QO
	2aY5GyNB503qF2nLbUhUX3pIBKfy4e7ZYglVhjp1uYPcLHR/Lao43jjcZq0XMDStiPvv
	DGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7W5KYv7MDUcAEnkCcs8s2FhaPoLBEJeEhQhcIsgc2Yc=;
	b=V3DdQ3bFhATaGKexCygjerbNlkYednfZemfwXJrtHGxNkMSsVv0F2F+QLQkXtkuQSW
	otKkWiV+RUFUDDHVQVpcaU6562CJubYEK0ffxO9/olws/tKf041EZlUpNEGtPnltOV7H
	r9Y1bNfwtQtkj3lPBEQRY8xIQm4EP8xUMMD0i93RiugmwuePm+Oy8Q81KMEns6HAs7FT
	kdKx/7ipu8UlkLJuzxuHkOvYNQagVnHkIeRReIjn9bbjw2nRZZXIz8OfO3877lVsV75f
	HY0C3q/vzZjqPhtPGP4loa0WCnS5zCe+xs1iy05fbHqRjizpILxfK6hirwNJyo3g5Wrx
	eLxA==
X-Gm-Message-State: AJaThX420dfaDp9JFg792E2gMeFVGiRxnNEDA2ueqocVTiAyaQ3bLCSB
	+xQNVYlFf6CBUXISLHbwyqhhevGhren1CZLg8w0=
X-Google-Smtp-Source: AGs4zMZ+JRuz9RFSavMAcSdUGh6cKf0jFyPGYRhh/TXejmHTxuVJWtesg3gwcMCGnm/9MKe5mCxIAFmZMfFCT4WGetU=
X-Received: by 10.28.127.197 with SMTP id a188mr107697wmd.138.1510791194592;
	Wed, 15 Nov 2017 16:13:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.133.99 with HTTP; Wed, 15 Nov 2017 16:13:13 -0800 (PST)
In-Reply-To: <ef6cb9de-02fd-06f2-3f75-57875aeac3a0@windriver.com>
References: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
	<8d1c4aacc60173f9db4809d23303d4825cc0090d.1509094533.git.markus.lehtonen@linux.intel.com>
	<9fb0243b-5fef-e5c3-1175-3af8c3f3db7d@windriver.com>
	<0973040A-9027-4FEF-A333-5350D48E02E7@linux.intel.com>
	<8083f668-b00f-1772-805f-eb96a6d69c97@windriver.com>
	<E8F574EB-8489-49D9-8202-7DD5A77875D8@linux.intel.com>
	<ed3ef63c-70e9-71d9-c068-509f462e7f95@windriver.com>
	<9CB13C08-90ED-4213-98B1-81DD4223E5CC@linux.intel.com>
	<ef6cb9de-02fd-06f2-3f75-57875aeac3a0@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 15 Nov 2017 16:13:13 -0800
Message-ID: <CAJ86T=UFFjfti4Ej9Or-3FUUudkN3XYzeitrjJnFAF-CV65uQQ@mail.gmail.com>
To: Konrad Scherer <Konrad.Scherer@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 05/10] bitbake.conf: add ip and scp to HOSTTOOLS unconditionally
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
X-List-Received-Date: Thu, 16 Nov 2017 00:13:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 1, 2017 at 8:35 AM, Konrad Scherer
<Konrad.Scherer@windriver.com> wrote:
> On 10/31/2017 03:15 AM, Markus Lehtonen wrote:
>> Please see the 6th patch ("devtools/images: add python-pgo-image") in my
>> patchset for python-pgo-image.
>>
>> I'd like the profiling to work out-of-the-box, without requiring some
>> strange-ish (i.e. modification of HOSTTOOLS) changes in local.conf.
>> The required utilities, ip and scp, are rather standard tools,
>> anyway. And, they used to be in HOSTTOOLS, unconditionally, before.
>
> ip and scp are not needed for a normal build so it doesn't make sense to
> make them mandatory.

Shouldn't the preferred approach be to use -native tools whenever
possible? It solves the problem of needing to add obscure tools into
HOSTTOOLS and also makes tests more reproducible by ensuring that they
always run with a known version of a particular tool, not something
which may be host specific.

> Including them unconditionally caused build failures
> for us because the docker images we use for coverage builds did not include
> those binaries. I realize that doing builds in minimal containers is rare
> today, but I expect it to become more common.

It's not so uncommon, even now.

> Since the recipe uses the oeqa helpers, is there a way to setup the
> conditional inclusion to detect this and include the required binaries in
> HOSTTOOLS? Or have the oeqa helper modify the HOSTTOOLS before they are
> used?
>
>
> --
> Konrad Scherer, MTS, Linux Products Group, Wind River
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

