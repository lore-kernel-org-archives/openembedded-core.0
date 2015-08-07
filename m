Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 227907671F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 06:13:12 +0000 (UTC)
Received: by igk11 with SMTP id 11so25827472igk.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Aug 2015 23:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=e5cVi5KQO3QgvUY9h01qVeI67tOrvr48yWK4kGxs4XA=;
	b=k84SE8esmFg6SBm+Ft8cLPeZZWjG1LppUTnpFuACY1VE4OuhWhsTWBHp5zahEgUyF1
	Mh8m+ingwzTSEyxvUuGvsbkUDynsNA52riMYgQLCveCCXGDOKNVQcNuvtdc7JBgh817V
	bCvtpClpEj3VlMxQleJKEp+rthhdriNS3khOXBjXZj4TrVYRyb7IAwkndlMB3VVEOSbP
	7GHs3mrc7+RGd6rc+iEEerDJlo25mOD79IIAzYgEdu1K5eN19pdtRGqft65CJOcGmBIi
	IgpTVVjjCFlU8tZ6hvxWk2XW2+tHxb9LIZrUYoZazFJX1qt+WQ3IC+m1b/qWE+TCUcxR
	ALLA==
X-Received: by 10.50.39.17 with SMTP id l17mr1062622igk.75.1438927992836; Thu,
	06 Aug 2015 23:13:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Thu, 6 Aug 2015 23:12:43 -0700 (PDT)
In-Reply-To: <55BB5F06.4010901@linux.intel.com>
References: <1436426071-3790-1-git-send-email-leimaohui@cn.fujitsu.com>
	<56502.10.252.20.69.1436441609.squirrel@linux.intel.com>
	<CAP9ODKqHNtENns2SOk-C9S2hh1weyf15=n1V8Rxgs+Rh5rMJGw@mail.gmail.com>
	<CAJTo0Layj-AXfYMmvqjZ-ASSDx_PptbysS7tUiGDLAyPjLGN5A@mail.gmail.com>
	<CAJ86T=WJiNC5fJj+Vgj=4T-dS+E9_CvTw79nFLVuFETxrp1qdw@mail.gmail.com>
	<1436601450.3310.27.camel@linuxfoundation.org>
	<55BA134F.9010908@linux.intel.com>
	<CAJ86T=UHTjTA7S_4EV66VEUoaRhYmaYveVcfxbqzVJsxZ4s6dg@mail.gmail.com>
	<55BB5F06.4010901@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Aug 2015 23:12:43 -0700
Message-ID: <CAMKF1srWcMoRui4kqRY5vCdLd-SPQ+EMihTci=NUghHsnGiBqQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: meta-gplv2? [Was Re: parted_1.8.6.bb: add parted that not GPLv3]
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
X-List-Received-Date: Fri, 07 Aug 2015 06:13:18 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 31, 2015 at 4:41 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> My issue here is quality control. Someone still has to review the work of
> those volunteer developers, and take action when they fail to take action.
> Yocto at the moment does not have such a self-sustaining community process -
> it all still goes through 'core' oe-core developers, and those developers
> can't have any more workload.

its a delicate balance of usability of target audience as well. If you
make it high quality but ignore real use case of end users you lose
and you lose otherway around too.

