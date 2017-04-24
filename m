Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B27AB77ACB;
	Mon, 24 Apr 2017 16:10:41 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id y10so7382225wmh.0;
	Mon, 24 Apr 2017 09:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3lTFvUMUkRxYYPIvTjWkm5ncz01s6svRETXIlx9LZvE=;
	b=sbd1zSqvGMU0230B3GbDzDuJMGpbLhSrLGyoopjgc+m48TY7oioOzOj9ODzRsqsPh+
	OIslTXTxWbEoLRsUZKkTREMzN7IZcBVtVAHzsddg5u5Ree6gbLIcD76XIyeArzaXZvpE
	/okzz5++R4Jb8vRF5p5+HFEasl4NBc9ZFNPt/D8h1yT1VGu97rSFYT7ZODg9Y1qi4Uvt
	emqjJ2fzHWlUUM7D+dJhL5W2QCqtxTos4nbVC+AD7vYNn6Sl6AyvkkdKV9diyEZQPfPS
	5Eu1ynOlTMKuG971EZ31ZMnHRScZBmE6URX8xqYJ7I+/WO+r1uyIK2Fvf6pw5acKtgnL
	kp6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3lTFvUMUkRxYYPIvTjWkm5ncz01s6svRETXIlx9LZvE=;
	b=rGOvq93oJ2H2B2h/mEjUCY70uLNa1Gd0oElNFZE4Vs5pYqUiJvwE27aRTx06inENCt
	C54gFQ6Z5cVY0DqspZkNQvDfinL6/x6yilxmJOiAVJASFMLbIDdc5Gj1Zvb6NWpvVsAx
	YvyPmhEt7nSMFkYYCTxbLqVqFy2YYr27EPKidAPUpgZXlG0ApZFFuY3wuZoO8AG/oFz5
	hOyYmsiXMxqWWP3t1y311tiRB4TFMUIdhAjSJmtxnedI+qRpPqgwT7O3VyzABshRMvh6
	h8igcsf7OqGNxltLAP/G4appPuR2gBPEsghdANxJ91w3EHb375+NRwR9fDTJXeA1VBjl
	gvjg==
X-Gm-Message-State: AN3rC/52SZVJKKqJ4tb79hrhCJvx9ind6hhOjsTidnVK1214NnS5M6/n
	YfBwzLGH5ezMI9nt/EcWLEbsknsFsQ==
X-Received: by 10.80.178.228 with SMTP id p91mr1654343edd.131.1493050242763;
	Mon, 24 Apr 2017 09:10:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.141 with HTTP; Mon, 24 Apr 2017 09:10:12 -0700 (PDT)
In-Reply-To: <CAJTo0LZJSZ-UJc7zTyYNf3YYKFD3mu=-zprQroZwxB1SZBQ+Bg@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CAMKF1sqfvtQPWN5Yuz3RPYkXpneS+XWcYmit_=bcvKGo3_hx8w@mail.gmail.com>
	<CAJTo0LakaSZhJodT2KQx6u0TEaBL5Ruig3oOdfrtCzQUf1cxXg@mail.gmail.com>
	<CAJTo0LaWkRxjaF4j1HHhUqFDYYTmGADTuiLo8zqPwR+wKSbY2A@mail.gmail.com>
	<CAJTo0LZJSZ-UJc7zTyYNf3YYKFD3mu=-zprQroZwxB1SZBQ+Bg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Apr 2017 09:10:12 -0700
Message-ID: <CAMKF1spRYm9yYhOVzOcA+5BPjATW_gLZfKmBCkZgj0MKZX=YmA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] gcc7 and glibc-2.26 recipes
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
X-List-Received-Date: Mon, 24 Apr 2017 16:10:50 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 24, 2017 at 8:54 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 24 April 2017 at 10:47, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> The updated glibc recipe doesn't appear to be very happy:
>> https://autobuilder.yocto.io/builders/buildtools/builds/240/steps/BuildImages/logs/stdio
>
>
> Note that every nativesdk-glibc build is failing like this, so that's SDKs
> broken.

thanks, yes I haven't been testing SDK yet, whats the gcc version on
your build host ?

>
> Ross

