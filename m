Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7B1D860EFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 15:48:49 +0000 (UTC)
Received: by mail-qc0-f181.google.com with SMTP id x13so3038194qcv.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 08:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5OhNcmgXccAf+eJnyZiDsw1trCj05m65oyvOCnaPQkE=;
	b=TAjVuozyLtsTD2OzCuIf4ts5ve0NBslgEFTBEHKAdoUuvwTlIWUHblEXGf1djPCgBk
	AUc6m7LgzOw1/DqGvTUcSWGk2JbUPcd41USnXUkjELNazexSuXiDWikVTOOkOgggPbaa
	rPlcYYdCJ3Tl0BpGsJ4eLTXeo1/KV+60nd4U2aixmYdsPVN7ud1+du7Xei2X3RYaSCGD
	mUe/NBjS1A5jZIehoXBOB3LEqghKty95oaEGJv4OsZpnWFPCfJEgAAah7vQgF1MKHHGL
	hRhU9dacUd1/WTBVgvuogKR+2MIvWAvoypdze/x5NKkZHxXi8sx652vleN09ik5vAIy6
	59/Q==
X-Gm-Message-State: ALoCoQl1eLnMcHkhCijsptZEdGqg87PNMrbi8vpcHt59JPcrIFvck4QN+9g3ZsBXaQDrMmbtoU6P
X-Received: by 10.140.42.10 with SMTP id b10mr7650560qga.82.1407858530467;
	Tue, 12 Aug 2014 08:48:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.95.235 with HTTP; Tue, 12 Aug 2014 08:48:30 -0700 (PDT)
In-Reply-To: <CAOMwXhOxf8x7ty2M4fnBN6yEbmVPbpwWZCeR-1BsEsH=Z9dX+w@mail.gmail.com>
References: <CAOMwXhMSMY6Bxzn7Qwmz-kUnFez_LkhSU7FArsoo0rdz6ZVifw@mail.gmail.com>
	<CAJTo0LYEYgWqTW7mmeonf=JVbH8hXrKhtBTsy_LfSRpuVZQ_tA@mail.gmail.com>
	<CAOMwXhOxf8x7ty2M4fnBN6yEbmVPbpwWZCeR-1BsEsH=Z9dX+w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Aug 2014 16:48:30 +0100
Message-ID: <CAJTo0Lazj1tj11_56hnuryzuKCszJqiSkK5TUXYof=YNdnG4Bg@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Adding cgdb to meta
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
X-List-Received-Date: Tue, 12 Aug 2014 15:48:52 -0000
Content-Type: text/plain; charset=UTF-8

On 12 August 2014 16:46, Laszlo Papp <lpapp@kde.org> wrote:
> That layer is too big. It is nearly everything that is rejected from meta;
> ok there are some dedicated layers, like meta-networking, but it feels like
> the last resort shelter where everything can just be thrown at.
>
> I do not think it is just us who do not wanna pull it into their project.
> Never mind, it remains to be a feature in our layer, which is closed source,
> then. It is a pity, but I will move along.

People who think its too big are welcome to copy recipes out of it and
sync them manually - that's still better than not sharing the recipe.

Ross

