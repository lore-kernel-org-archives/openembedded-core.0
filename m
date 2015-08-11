Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 285DB767F1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 20:46:23 +0000 (UTC)
Received: by iodt126 with SMTP id t126so216070iod.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 13:46:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=Ir+vbsJ4u7pyniQIKajO6krRXHWs3Vny5/VMOZhoMY4=;
	b=SgFSkFufBkVqpnFLTDUCxNiW/FQvF7B9N1nkI9EWxVaA5SPQGTzNvtoIUQIIU/0So1
	KIHda+QBkrTtZe66DMqy/42f6Pz2tAl8GIsnf4dLL/M0ftYoVODBTmkJzo+dsP4QuWJr
	Bl/p4thbN7jxwgVoouVJ1vHtjBW1OubuRKwukJPVRuEE8r7jAgg8wkGdOTHbNMasUxVN
	HDVfPPwL1BppCLP94vDz/jtvGOyxu4SY5zoSNNNQfLQMeoRf7XGPYoKyGWVJwbOwA7YY
	SyZB3jKkgvWYMqKB7uzuPl1qZvaEKfbfBBuSeZ3teGNzDxRG2DHm2qic9PlWfecf74T+
	TDuQ==
X-Gm-Message-State: ALoCoQm2XG9cgw+4Px1tAhWp+hV3TKW3osluAJmBXcnxCA0ZtuS2v08GsFH1xSt7yGjEVb94FYGb
X-Received: by 10.107.130.166 with SMTP id m38mr35141289ioi.77.1439325983198; 
	Tue, 11 Aug 2015 13:46:23 -0700 (PDT)
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com.
	[209.85.223.170]) by smtp.gmail.com with ESMTPSA id
	ii1sm8909159igb.10.2015.08.11.13.46.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Aug 2015 13:46:22 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iodb91 with SMTP id b91so239338iod.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 13:46:21 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.137.31 with SMTP id l31mr2286905iod.37.1439325981866;
	Tue, 11 Aug 2015 13:46:21 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 11 Aug 2015 13:46:21 -0700 (PDT)
In-Reply-To: <CAJTo0LYXHLBF52jmfLF4azE-BSKj2F=9-G=8MXcFo36FgE6+0A@mail.gmail.com>
References: <1436426071-3790-1-git-send-email-leimaohui@cn.fujitsu.com>
	<56502.10.252.20.69.1436441609.squirrel@linux.intel.com>
	<CAP9ODKqHNtENns2SOk-C9S2hh1weyf15=n1V8Rxgs+Rh5rMJGw@mail.gmail.com>
	<CAJTo0Layj-AXfYMmvqjZ-ASSDx_PptbysS7tUiGDLAyPjLGN5A@mail.gmail.com>
	<CAJ86T=WJiNC5fJj+Vgj=4T-dS+E9_CvTw79nFLVuFETxrp1qdw@mail.gmail.com>
	<1436601450.3310.27.camel@linuxfoundation.org>
	<55BA134F.9010908@linux.intel.com>
	<CAJ86T=UHTjTA7S_4EV66VEUoaRhYmaYveVcfxbqzVJsxZ4s6dg@mail.gmail.com>
	<55BB5F06.4010901@linux.intel.com>
	<CAMKF1srWcMoRui4kqRY5vCdLd-SPQ+EMihTci=NUghHsnGiBqQ@mail.gmail.com>
	<55C477AE.8030308@balister.org> <55C4A405.6050209@linux.intel.com>
	<55C637DB.9010106@balister.org> <55C8956D.9080508@linux.intel.com>
	<55C8F83F.4010003@balister.org> <55C9F7F2.2060502@linux.intel.com>
	<CAMKF1soCEwGMkVfHsMzp3Wt49LKQusLC8jTrYygCSsBgjHZQQw@mail.gmail.com>
	<CAJTo0LYXHLBF52jmfLF4azE-BSKj2F=9-G=8MXcFo36FgE6+0A@mail.gmail.com>
Date: Tue, 11 Aug 2015 17:46:21 -0300
Message-ID: <CAP9ODKpXke_FaA_bSUtPSjqMKWtUsyU44qsm73KfZNrajfZrnQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Tue, 11 Aug 2015 20:46:24 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 11, 2015 at 5:36 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 11 August 2015 at 16:46, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> can we freeze this thread please.
>
>
> Or more usefully, reboot it.  Philip, you're turning into Koen!  Alex, if
> someone on this list asks what Poky is, 99% of the time they're trolling.
> :)
>
> The original and unanswered question was "should oe-core continue to
> maintain GPLv2 recipes where upstream has moved to GPLv3 or should those
> recipes move to a standalone layer" with various implied questions:
>
> - If the v2 recipes move to a separate layer, who own/maintains/tests it?
> - Should there be v2 recipes for every recipe that has moved to v3, or only
> (as is now) the "more-core" recipes (currently YP tests that core-image-base
> builds without GPLv3, nothing else more complicated)
> - Should meta-gplv2 only contain recipes from oe-core, or all layers?  If
> other layers decide to hold both v3 and v2 recipes (not that I'm aware any
> have), what makes oe-core special?
>
> I'm torn, Richard is torn.  Neither of those are useful to forming a
> decision.  Does anyone else have any *useful* feedback?

I think it is a matter of resource usage.

Up to now, the GPLv2 maintenance has not been so hard and thus I would
say for us to stay as is for now. We should revisit this for every
release and review if it is time for split it or not.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

