Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8192B71BEE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 16:26:11 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id w64so84666750wma.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 09:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iPh2V+kouX1C6Ffh6Jjb6xgCtYsFcgnPf3Qh0k0ZULE=;
	b=CTreEIo2kQZPvNVs/auhMQhzwRJCI46gaqHn/ECHArG4c54Hqx0jt17tu0oXx+3lnp
	HEkizc7kDUIYrX6yl5BoB8EWlRztRFyNUIQDSPnc1xNtOYa3Dqk+KAPhgJ13joMHnuZQ
	4q149eLQuRPhnfx0CXDI5/ysSipjjjcIWQLoX+CEkrcibebP1bGflGQQfIoAqTD7bxg2
	HDPKCxdFQhpkmYGmDwTuqI8sp+6kICJRkLvW4YY70cDnHTynGQfosWDbBCndwiU4PXm1
	n4y9HEYdTg8sgKcASz/VjYsoZgYm2iXSyvGwVV022/GujyUnyqbIxsQHdbbU/lLXj8Xj
	+k2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iPh2V+kouX1C6Ffh6Jjb6xgCtYsFcgnPf3Qh0k0ZULE=;
	b=Tc0QbDPanVMW3u1Y+EUwEzIRreVbQmAMKjfwPQFDc/i/nzRL9YRo1WZ2gcoWdjbdfh
	bSCkUNGjiHhthLtPoB7um+nie36m0QWVffhZngLBIiu1EPZBucLZIcfcF0C+Nl8IAkmY
	ioeEp8nN/dObVnpfeTRGwwaueC26goBQydR+DiwBFIX/dellCAjHxtZQBdYTWmHUExud
	k8GBgnGrL2Rh4KhEaSEPcTXf6y0xAuiA7WkjRwKhv/QMI0EHJHWzvHpIl//Wd8LxUVCv
	3teUbnEvmgCT+8U99KwBGR+Cj7U3jN/9tHZFt+UgumDnQot+l6jJTrpAL9fyZs62ou3v
	RnfQ==
X-Gm-Message-State: AN3rC/5t+aCxYzgL3cEgAUNNWL6e03vEsy9ePssB372ouV1ngVBkWFQo
	7ICoxZnPhBpkpfrSaHYlpvKxq+NnQg==
X-Received: by 10.28.87.70 with SMTP id l67mr17632772wmb.37.1492619171827;
	Wed, 19 Apr 2017 09:26:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.141 with HTTP; Wed, 19 Apr 2017 09:25:41 -0700 (PDT)
In-Reply-To: <CAJTo0LandPvX8nK+oPW0vj8DSC+jU7mBEZc+LEE4uq3TmkubHw@mail.gmail.com>
References: <20170419015839.1294-1-raj.khem@gmail.com>
	<20170419015839.1294-2-raj.khem@gmail.com>
	<CAJTo0LandPvX8nK+oPW0vj8DSC+jU7mBEZc+LEE4uq3TmkubHw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Apr 2017 09:25:41 -0700
Message-ID: <CAMKF1spCN1u2cWm9V4VHStu7Btj=34JTSqvTbNWXPsb3r99JBA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] libtirpc: Expose key_secretkey_is_set API
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
X-List-Received-Date: Wed, 19 Apr 2017 16:26:11 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 19, 2017 at 1:52 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 19 April 2017 at 02:58, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> +-    key_secret_is_set;
>> ++    key_secretkey_is_set;
>
>
> This removes key_secret_is_set, was this a typo upstream or a mistake in the
> patch?

key_secret_is_set is a typo in libtirpc map file which is fixed here.

>
> Ross

