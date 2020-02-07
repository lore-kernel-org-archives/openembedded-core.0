Return-Path: <jupiter.hce@gmail.com>
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
	[209.85.166.49])
	by mail.openembedded.org (Postfix) with ESMTP id 21AA760CE2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 01:55:17 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id z16so389674iod.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 17:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gWXpsCAek7kmCzvTTk1+/UC7yRhP+6C/rAkRgxRI50g=;
	b=gRGGUyInkUaCRn6Yf7AHoidDKdT2uRi1KBuDn6DIBiPEfAkQcPfGz+epFq+tWDQZ3v
	0EaxfQod5rASwEv1jWVQbgc01/fEL4iSeLAy6H47tk8J9DZgLEwZL1mcb2Lqy9QbeHNt
	cZKG3adF1EhvVxF/pcWMwXb5CB8433mNbjtRDK9EmKpj37qUPBqufwbfbziSoNxSrlX9
	tytKe9aVd3aix28vbsMrFolD73sD2cUPo4PPmj9rUuPSSSgzaBBzj96pZd9kW7h1EhkI
	M0YvhaANif8z/sb6D6RlqYI817DxzBZO8MTBR+OcWE0t6Cn5EAVDmaYe4sV2AKbAJNg8
	lMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gWXpsCAek7kmCzvTTk1+/UC7yRhP+6C/rAkRgxRI50g=;
	b=FDMTcB2NeAmfWXGRYX1Li7qQMXwOoyu+DI1whnkcAuyff6HwnDM5JiCWmldyRXoZNy
	d6Gi0s7YiXSkUN1rj78dJphokJOacTmKKhwGrk0bhidaIxhqhmO9NN/uJwBnXaQ2binP
	svcypxyTZddpC84rAfN4g4dDv+K4EHSGmiZyCmOoreO2CMon069XTN5zCA06nk9++zm7
	s0QQavGThiCqlm57/YW4cJF81dG+9gb2DpKLD1p6teK7SkoywSpmV3Qfuz5cj175jQFv
	qmcWIftoV3P49/632h/lCkg5ehlvsfkO7bmmsv+fEo0x/IaVQUELtpSX6PEaqYuCwMUU
	ahlA==
X-Gm-Message-State: APjAAAXZkqSKfz+mCSBUEA7kjUjBTXnzjFFhk7AIcL7SQD1qQt21+lLD
	YAmkfbm6GK6ePk38dZ/7p+QDg9AOExkjQ8ma92A=
X-Google-Smtp-Source: APXvYqzNnmbIKj9/1ea4/6D0eJE0mrN9hKAPqYazSKVSK7oI4guzIoyjbCqPYcuu4+6paN0Zj98FjmD0uJ1niF5Wbn8=
X-Received: by 2002:a92:390d:: with SMTP id g13mr6929563ila.53.1581040519087; 
	Thu, 06 Feb 2020 17:55:19 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP;
	Thu, 6 Feb 2020 17:55:18 -0800 (PST)
In-Reply-To: <CAAx3WaAhLo1wbfsUdwdoNrYyEkJ38AgyFO0H+ckLyyqSgc3bOA@mail.gmail.com>
References: <CAA=hcWSCZROrpDBWV5ZAA+LV6j0cjRSKxyjonOfWS4mCZAtdHg@mail.gmail.com>
	<CAAx3WaDGin=NcQk3X4=MTK8RfTrNO=LvrG+LbAyrWFUnWgU9aQ@mail.gmail.com>
	<CAA=hcWSAbcf9GchJN_+-DzMDYJQfMKBGYHmJzRNwY5P_szMvOg@mail.gmail.com>
	<CAAx3WaAhLo1wbfsUdwdoNrYyEkJ38AgyFO0H+ckLyyqSgc3bOA@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Fri, 7 Feb 2020 12:55:18 +1100
Message-ID: <CAA=hcWQL8se7RR9bfuBsS0xpof0Y7vwEyQ5Zg_hm+Vq0FwjTPg@mail.gmail.com>
To: Gabriele Zampieri <gabbla.malist@gmail.com>
Cc: Meta Freescale <meta-freescale@yoctoproject.org>,
	Yocto discussion list <yocto@yoctoproject.org>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Support UBI u-boot
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
X-List-Received-Date: Fri, 07 Feb 2020 01:55:19 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Gabriele,

On 2/6/20, Gabriele Zampieri <gabbla.malist@gmail.com> wrote:
> As far as I know uboot (usually virtual/bootloader) does not have a task to
> run menuconfig directly from bitbake.
> I usually have a local clone of uboot and I simply run `make [...]
> menuconfig|savedefconfig` , then I create a patch
> to add my defconfig (custom_defconfig) to configs/ and specify
> UBOOT_MACHINE = "custom_defconfig"

Are there any document to use cross compiler tools to build u-boot-imx
on Ubuntu 18 host machine? It seems that build environment will not be
the same as the Yocto build environment I am currently running on
Ubuntu 18 host.

Thank you Gabriele for great helps.

Kind regards,

- jh

