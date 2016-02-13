Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id DF6BB738AE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 15:44:22 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id 14so7496650qgg.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 07:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=d+OrOuxJ8mRIkesynnKteuYVGMa4Iozk+wwlTqZ0JR0=;
	b=Wp3Y2rEuM9mGJ0jggR058IB8FBp6SuN/U93eDwoBxIZihfmRaEEbF4L+0xn/Kd5mtW
	Acx/jRc/izCDq8sO9M8ABAJ8HqT+7kdVvgt9uhBC7991ueXIUjkefOGeFg5L4GOZyA/S
	HL66cDuDZfZPmd+k8T6380cxjoMEGWwGzSnEBrrlsS9HQankDfrkrb6RNkPhhw9+d5Xw
	lUgxfeuztaZbtF0dDdmejGB4epXLM8woKLF3SvGxxfcxKXq/TyWCYmI52OSeXfz+kj06
	iTg2jFLM5UksD4xp5VUB92nG88jsQt7LAa77ppJdVOwVVwe19psRb4VXTTlh0rmlBFWa
	wdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=d+OrOuxJ8mRIkesynnKteuYVGMa4Iozk+wwlTqZ0JR0=;
	b=UH4d4xt8Av0FAx6mVCPeEI2kuGEEP4k3w7zPohB21WwK6/LYVkGkugBDW1HRYOy+7E
	BpH2QFlpDkn3sSrJy/BK6P2s2fNFDaSzb8mIpAdI2z7AQyfp+vKy0e8UrK5ywy+ZwcB3
	ifrdR1B2lWeaXp0APLH0zPvPK0tficoiun+7At8YAU9HUihTsTFmCllVz5fMk3oPzXUc
	UJmptnCHDDO8EWfsd/MqotpFd/q3KivxwFJ/GXgNhrTjROOBWuF67VAoDha1p1M5Y6lN
	d8ZwcHiIvrcGRhtuq6iHIr6bcP4RetUp1zZ4qOuLPuh+oCF/eU/chr4A1sA98Bt5Yact
	bUIA==
X-Gm-Message-State: AG10YOQmbO3ZgcW6ThbU5fuS9V30MSYpHA/q7vzS+ESvnfJR4Ip/nMxlxKH+ShMWyLHbgrJLiD1qBXOLSC+gOQ==
X-Received: by 10.140.167.86 with SMTP id n83mr9617178qhn.41.1455378263025;
	Sat, 13 Feb 2016 07:44:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Sat, 13 Feb 2016 07:43:53 -0800 (PST)
In-Reply-To: <1455351819.16142.341.camel@linuxfoundation.org>
References: <cover.1455126045.git.raj.khem@gmail.com>
	<1455351819.16142.341.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 13 Feb 2016 07:43:53 -0800
Message-ID: <CAMKF1soSVe_BtxSmgkKumrFv0KVoC=fo1FArh249Y_jCz0HM0w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] Upgrade uclibc/musl to latest
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
X-List-Received-Date: Sat, 13 Feb 2016 15:44:23 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Feb 13, 2016 at 12:23 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2016-02-10 at 17:43 +0000, Khem Raj wrote:
>> ltp upgrade is prerequisite for glibc 2.23
>> patches to fix more musl recipes
>> distutils patch to let pythonic recipes work with devtool
>
> FWIW I tried running the nightly-musl target on the autobuilder. The
> intent is to start running this automatically when we get the current
> errors fixed and it passes.
>
> There are only two issues there:
>
> rpm fails to compile

yes, Ross mentioned that too. rpm needs fixing.

> binutils has a QA warning/error about RPATHs
>

my local builders shows this too. Need to investigate.

> https://autobuilder.yoctoproject.org/main/builders/nightly-musl/builds/
> 2/steps/BuildImages/logs/stdio



>
> Cheers,
>
> Richard
>

