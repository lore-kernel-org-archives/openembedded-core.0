Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id CF3CF744DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 15:38:49 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id c126-v6so3637896qkd.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 08:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=75nQ8oClDLb2aFpiBV0/x/fyyJC6S4eD2ouj5ra9DhU=;
	b=O/As7/3z1uwKwOBUvn7tKn1xooTcdzDi0eL1y/cH1qFf17VxWiR8Gjlg5fXZmzbtH2
	a3+OyB1tJJ44yDM1d2da6dkVJ85TKizgxP2YJaZw1Si6OUyKhCUPs3uxemtropins33i
	QkcBongnPxAPuqyS4vxAQ1nuMDUS7wI5AupEdrpovZ5O5a56zarg2Qb5pFJ7YVrIFqov
	hHW/XROE0xaf8F/5z2Z3erbtW9nx9eHwYB/bO2vAH8hwDUWwuJf96SHCHgJLrbgrop4c
	//bNvG7RRv/DLA4pkxTUeW6cxOdB2GbLN/uNBFmWBcR9ERkR5YKSm+Wd8XJ2vSgQ1POp
	9aWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=75nQ8oClDLb2aFpiBV0/x/fyyJC6S4eD2ouj5ra9DhU=;
	b=krBsyEG2cg6KsI1NVik2+QLrRp25a7Efnj/fiiRM9JOUwBcOhphWvZAUGnRsgBh3z5
	zxPh8nZHXEGpeeHTBZHrWMtV2YO1PMouucKgtfJVvqx/sFSG2vSfOzK5r5dDyzQ/xDIV
	BdERs1cdRNdyqDmGWlukwlkNpEv2YEo2SWtAZR5BRxNyAHoAL7CI4YNaIszURXn7zuZy
	1cs8EohR4BBAIn3e7N/tpJbPJV97dscs98WGHwXo/BAPPvi7iOuAevfcT3ZkPNTZRRwO
	9j/ZJt+QnBBUt2Uxhqmcqbo6noe17SVbsJPxzzsqT+emHSlFoaxKzHvypQm7ZDkupFCS
	VtOA==
X-Gm-Message-State: APzg51AXt8sEDXF5IGcemCHNoGtdi0uRGh5ct7ubnDZTKWbq3yvvnFfU
	GvPLRFn3TXv7cB931Bp8ZxbbEgfVGrB+waKFy/Q=
X-Google-Smtp-Source: ANB0VdaNNXsCUqJuZ1WAM6FnvDsW5wRIUN/WZooi7XN+JcDNByppn1lkfiup077/2TX7WKbOBvdsqKNfE/SfQMGLm2U=
X-Received: by 2002:a37:2e03:: with SMTP id
	u3-v6mr6821821qkh.223.1535557130507; 
	Wed, 29 Aug 2018 08:38:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1535451643.git.alex.kanavin@gmail.com>
	<c971e5fd32f999781ff4174c7c1ca6d0e54dea65.1535451643.git.alex.kanavin@gmail.com>
	<CAMKF1spm5a-Zsv5ygjAwf5omk4ekK=ek=awe6Q1RdG_bVntuGw@mail.gmail.com>
	<CANNYZj8hsVXLe0q59PvMeuVb5=7DPJsndi1r6EqE8bC8RMc3sA@mail.gmail.com>
In-Reply-To: <CANNYZj8hsVXLe0q59PvMeuVb5=7DPJsndi1r6EqE8bC8RMc3sA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Aug 2018 08:38:24 -0700
Message-ID: <CAMKF1sqNBpbLdnpMOHLG9zf6w2V85_X4L7Hj3OLCr3mmZ+fAvA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 6/6] ca-certificates: update to 20180409
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
X-List-Received-Date: Wed, 29 Aug 2018 15:38:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 29, 2018 at 7:47 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> 2018-08-29 16:30 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
>
> >> -SRCREV = "34b8e19e541b8af4076616b2e170c7a70cdaded0"
> >> +SRCREV = "dbbd11e56af93bb79f21d0ee6059a901f83f70a5"
> >
> > It fails in do_patch for me.
> > Patch 0002-update-ca-certificates-use-SYSROOT.patch does not apply
> > (enforce with -f)
>
> Works for me though. I just did a cleansstate and build to double
> check. Can you try on plain poky master please?

bitbake ca-certificates -ccleanall && bitbake ca-certificates
worked, seems a wrong fetch sometimes, I wish git fetcher has some
sort of checksumming as well.

