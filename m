Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 084B4784F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 23:21:46 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id j16so13748137pga.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 16:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=768H5bNqiK69CzEvHdE5CrEFbk2qHC1J2SAhb7CoMng=;
	b=Q3RPWL3dPkkltIHppvaOX5fsEeupzdCUj7rqwIq0LxCz3Qs0wCnKAe7NqP7KchFsU9
	blUk43mZehMJ1WldXqjMmWT0UnPWXYhUdZx5o1Dw4CuPQdIaCnHKAeA1JdpnzHr7lGGu
	tdbMqzY4nrhzUjXxHnhVqOwr7pHiORSlp969gpBCdJIOU1uOJFtHnj1ujM+F5AYnJXrQ
	QjjCZiUoAyEcxzKt3BRxHclKouCpUAeACtIi/O1/AXBKLgjp75qnP1zMsF9wHZjGalSf
	I8iWsVUpHFWU0tiLmST1bz75/DM17MFU9114dXrTHFIKumm9ZZQu9QeHcMto8G6niksI
	dOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=768H5bNqiK69CzEvHdE5CrEFbk2qHC1J2SAhb7CoMng=;
	b=eNY8NT0OfASSCPMAMM3DCM/2BcMGTBrq4hpusuXbBBYqdtIHRCvoJ82Uha1kiUiCDu
	yu3KkXN/Bf6zhX9GAJKolQC01IO1ayAN0QBQ3r6imnmTPfbGyFXF2ylN7yvnr11kRJiv
	thfotSBUAO1mHVmB3hMc4dEGBNfmlcRs17+nF2l+QqWt6gvtKlIYt8o/kwhMBfbeuwjY
	XJjEuWuizcw8FJyCXuz1SXADww0hB93OojCLqqyhHagQkEcrD7MKlTHQI2zHOYZ0Mv7K
	ymRo1omNg127fui/jrO2SYQhiGFs20vxAv36h3C4tE6eNWzXnOds5LQCiCJnODGr7tNp
	MmVQ==
X-Gm-Message-State: AHPjjUjE+RVEY18Bp97qRdOAr1DkKwaNOBuJhKOtonukx7hxqshnjJoc
	j/sNGGnCVCoJERuRzjBqNz0ubRsN3G0xw+4mJEA=
X-Google-Smtp-Source: ADKCNb6wMKm6/llBmV57Ivzk5P3lMnyDBlWrsLJNlVUi7f4taXMcdvb8nz78Qdie+9tjh/5+keM/YTLDIcHnzyWo914=
X-Received: by 10.84.177.129 with SMTP id x1mr19041275plb.161.1505258507996;
	Tue, 12 Sep 2017 16:21:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.189.8 with HTTP; Tue, 12 Sep 2017 16:21:17 -0700 (PDT)
In-Reply-To: <CAJTo0LaqHGMPDF=JHGw5NcBzvTkFbP2bQfmgcG8o-Zx0hTeD3g@mail.gmail.com>
References: <20170910131446.4555-0-nathan@nathanrossi.com>
	<CAJTo0LaqHGMPDF=JHGw5NcBzvTkFbP2bQfmgcG8o-Zx0hTeD3g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Sep 2017 16:21:17 -0700
Message-ID: <CAMKF1sp1R_wnW6Zkh96WWJKgC9zzgtbO-__JvqgEYWp_B6whzw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Recipes for Open Source Verilog and Lattice iCE40 FPGAs tools
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
X-List-Received-Date: Tue, 12 Sep 2017 23:21:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 11, 2017 at 1:58 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 10 September 2017 at 14:14, Nathan Rossi <nathan@nathanrossi.com> wrote:
>>
>> Please note whilst this series is sent for oe-core it may be better
>> located in another layer? (e.g. meta-oe). However since the recipes and
>> the tools they build are not specific to a single BSP it did not make
>> sense to keep in a BSP specific layer.
>
>
> Sounds like a dedicated FPGA layer would be ideal.
>

I think a layer for 2 recipes might be too much. Put it under recipes-devtools
in meta-oe for now.

> Ross
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

