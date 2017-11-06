Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id 053C86FF80
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Nov 2017 23:27:06 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id k61so4387911wrc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Nov 2017 15:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FM4lmVs/oFeytjE3xnkWPccoNwqoiHA+rJHbp+spOO4=;
	b=kezU/kxdMRNrU3yIi14LRMc38kqUWvyYSiL0xnIq/5DhKhZ7tU+nOTNNx/6HzqEBfN
	6Dqy1wa3cv5d7fRSTGGf3ZuCUBRidGbj4R6hkEBuIHcdnNjBHVa/No3ZZuXUYFzFK7os
	fYKERSzb9L3ytt7999cmjN38Nx+/+XvUgUH696zB9KDIASRwpss+8Dmf00uxQNN/NhFl
	xaRkt9MrBwmWKmshjllpUGrfwy1lFrLuoLb3AT0tgjn065ixtGQTjZd9fcoPx+E+kZaR
	V03E9oLJxf76hXIJACLfzSAoQBof4P5VFuA8N+O776+IpkASAKPAA62UQm7cBPTk5Oos
	go2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FM4lmVs/oFeytjE3xnkWPccoNwqoiHA+rJHbp+spOO4=;
	b=Ws/OeilOmJTVwcz+vbY126spVRXlyFj/O8GPKKyDHG8dEaoNdkJ3XL3pRr1RJLPRV7
	zDaWnDTgo7fK3flsphqGHC8EywR9d5LBo7wbJAP4ycju5rNOlEElM9Sy+aAMis11RCtV
	4gXXoInlXyN2qp/SSogsHvTksVCYLCF0B8h8k+S6WzshR4wNuQUHXt+r39xWXlH3yb3N
	G0Meh0hPYqnGTQlh1eyypeewaLfqFNtkQ0RGbb7XWth79wUErvPLEokbICxBvNdfd8p/
	COVVZnsrOGJ5CF89SetgOVqaalNdYPZYYtF8ZEPGySE8VcqF4OfroMGeB+IkRjWS4kQO
	jUrA==
X-Gm-Message-State: AJaThX6m5XGkBpFkX2ME35mIh6nsrUC3p/4SuBxlZp/1pQnRIr3xlua8
	mmsmyUD5r0YXGCDjTtPq2UwziVeAosuVMstsDUs=
X-Google-Smtp-Source: ABhQp+SErgx57uiHX4SFbq9rWakDeSrtmyolJV3c+QxLWbOOd9nY/uTaDLA0pbM++Xd2Iuu8JKn7A9KPYUr5u5KLbYU=
X-Received: by 10.223.151.197 with SMTP id t5mr539044wrb.263.1510010827577;
	Mon, 06 Nov 2017 15:27:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.199.140 with HTTP; Mon, 6 Nov 2017 15:27:07 -0800 (PST)
In-Reply-To: <5121452.M8NYrTEKNB@peggleto-mobl.ger.corp.intel.com>
References: <CAEg-Je9nrUypvdDyTXMDTqgv9qBB_R0VSA_hzs6pswkzPJgr7Q@mail.gmail.com>
	<CAJTo0La7eK950Up4033qmX_1PQnS5nJJt4zb_P7uJn1Y8eO0QQ@mail.gmail.com>
	<CAJ86T=VN8PDUWrNAuW=y_RpUEoOtGa-TyufyGwbZT6APPMsm9A@mail.gmail.com>
	<5121452.M8NYrTEKNB@peggleto-mobl.ger.corp.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 6 Nov 2017 15:27:07 -0800
Message-ID: <CAJ86T=V5NqFrFr-dBQsOrJuz_Oewbfd-9RQdyM93UBDOqU+32A@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Releases of BitBake to package for Fedora?
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
X-List-Received-Date: Mon, 06 Nov 2017 23:27:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 6, 2017 at 11:18 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Tuesday, 7 November 2017 8:16:06 AM NZDT Andre McCurdy wrote:
>> On Mon, Nov 6, 2017 at 3:33 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> > The bitbake API isn't really stable and has a reasonable amount of change,
>> > so if you were to package it then there's a good chance it would be out of
>> > date within six months and people who wanted to use the latest oe-core
>> > release against the packaged bitbake would hit API version errors.  The
>> > recommended usage is to bundle in some way bitbake and the metadata
>> > (combo-layer, submodules, repo, whatever).
>> >
>> > As such there are no tarballs.  There are branches for each version and
>> > commits where the version is bumped, if you're really determined to
>> > package a snapshot.
>>
>> If there's no realistic hope of (or need for) using bitbake standalone
>> then maybe it's time to move bitbake into oe-core?
>
> Well, there are folks out there using bitbake with their own (non-OE)
> metadata,

Are any of those projects public? I'd be interested to see how that's
being done.

> and that is absolutely supported, so even in the absence of stable
> releases of BitBake that distros could pick up the separation does still have
> a purpose.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre

