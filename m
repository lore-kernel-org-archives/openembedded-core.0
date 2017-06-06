Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id CCD2277F38
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 18:05:08 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id 7so102986015wmo.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jun 2017 11:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=U1i44sXoMvgGurh3m9P6YWpd5O/XuZiSqu+vaTBNlqo=;
	b=uSaNC/zFRG7iKUh7ynxdWooDDJJpNmxLqFDOHO36ET58Mb6OUYH8is6XqbdrZbhzO5
	qQOq8INknp7Tk5LxzooOFUiRz1Xg0K7mrmzZUMMYC54CHEDp69ExF+afZ0TkhOiN55rd
	IDS5OYwJRSW/HFwfA4fnAShtG2RShb03DAmozOnCBmzvwx9PlWo27/Z70N/f6zwVx6TX
	LWtHhvHFBbtSqaYNfGhc8jxMLy5qlxi3I7FES29XPBMWl+Zq6nVXDEQZIvtAvaeneEWl
	BsbLXowqeUs7ou/k3telRGPkKhe8OncpEUtKwhAqRSR/ualmLNJZK48Bo/jh+1eC8vlS
	jjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=U1i44sXoMvgGurh3m9P6YWpd5O/XuZiSqu+vaTBNlqo=;
	b=Gm0P1bHLkuQunSSBBquMXcktEev1oLJ9JGciIHGxqfBiysYTU9Tyz3E9MUiqYe3Kvt
	fMSNiCvC37lkD8zE060EnTv8QNgMuNvTRBcST8U9BYLi/h4RPQNkFb4Mlnqi+ZVNJ/J5
	aM4Wj5gUQ2iWRSfuZG+/bWuhMzy6C8BuCVfNkbWCFwhy9GPFjve4eWBJVut72dyd5/me
	VWza/6m7JYXjSv5QZZlgmDjgUsR7tn0/Aci7bkinLRgz5WJfl4SLba14d5RTl/4+NSRR
	Tf+3yZlc5dEvWiaHVFzvmfmryTRZqiZoyzk+NV21lnZR512Vq0kxTn4oGez3Bt68YYJR
	pnMA==
X-Gm-Message-State: AODbwcBrZkxRF+XoWAsbRRLsxZNuMn3ZJPtA/Wy1MSag2NhRczgsYZjP
	jFJfgb3keJiX3x3fuUJ+pyZJoI5wPw==
X-Received: by 10.80.147.195 with SMTP id o61mr21208242eda.178.1496772309349; 
	Tue, 06 Jun 2017 11:05:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.153.222 with HTTP; Tue, 6 Jun 2017 11:04:38 -0700 (PDT)
In-Reply-To: <CAJTo0Lb30wh5YPhHJcAa3SDE6Aa-RnW=cPk7EWe6XvhNHkdojg@mail.gmail.com>
References: <20170606171346.21413-1-raj.khem@gmail.com>
	<CAJTo0Lad6-=shjk=C9_AJVyYsGP3dJ1dDUXcRH6j=coywGMqMQ@mail.gmail.com>
	<CAMKF1sqWoPwONt_t+Qczw_Sm=CAefOnN82tkneYYZGJ=BekW6g@mail.gmail.com>
	<CAJTo0Lb30wh5YPhHJcAa3SDE6Aa-RnW=cPk7EWe6XvhNHkdojg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Jun 2017 11:04:38 -0700
Message-ID: <CAMKF1sorhsFcph096odk-RdqBv_Pxy3h948cKE2Zz6i5bN=dew@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Add define to indicate missing 64bit atomics on armv5
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
X-List-Received-Date: Tue, 06 Jun 2017 18:05:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 6, 2017 at 11:02 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 6 June 2017 at 18:33, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> yes. and there is such a patch proposed as well to mesa but
>> it has got some feedback so I did not bring that in. This patch
>> instead is surgical.
>
>
> Cool.  Just got to remember to back this out when upstream is fixed.
>

yes, although effects will be same.

> Thanks,
> Ross

