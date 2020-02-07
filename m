Return-Path: <jupiter.hce@gmail.com>
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 481BA60586
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 13:01:17 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id f10so1609768ils.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 05:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4IDpUr8/lBjGDlP6vwyVyMKxwYxAKScLaCcjW3wnWfA=;
	b=biJM5pU/mOOpdic+lsjJl9Fn0v5FjdQZFF+FXHhrc1UuDAW15prA8UMWmaUluq4DB1
	NSIPM2qFURuFTiRk0KkL0vygXJ+RaIbmXDWnWG5s9uPl0kxlicOydTQI9FHk+poC+h3D
	7xGcO7ncGEoaViaTKi4869MUmr++TyBohmRfc5G1l94F5x+ujcP4wrNKGBbGD1R85Na0
	JC4HV9wNSYlz4irdwnhyHfvkIwgJSIjzmXEGC6oOZEl3qK7LjYzYELLVG3YEnDRSuzNy
	2GH3Gp4STZFJZIt0hwX1beiTVaCyMh9BeQnVsOHRmT60RIFii5sdh5QJS3jHFvHDxLrg
	CsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4IDpUr8/lBjGDlP6vwyVyMKxwYxAKScLaCcjW3wnWfA=;
	b=CghLBBjhA8O7jy7pPSafSn08FPDVXCUtcvR9IDaOwtpbVUMA/zatSxY/MGkHaIo04R
	ltxPYynNmtSdUixKbqmdfwS7DE/+71cUTganD1e0jAxMtad4mFP6bvBEW6Mp92ABI+p6
	24wTMimaSfx1ar23FiL1MzCjiUeByeGd2iwY2yzutfvgA1ftNuOUEMYElvJwx2OjM2lb
	ys8MOELuYPJOKFjI1WlqtwPx+wbiyj3XpJbIv3bgHnzz/KOK1CZIn3RebkZKHJlA0IA5
	pUMCAQQj2A8NZnIzvduC4pIdluZucF5RqHnI40EcwWxaoWKSoqgQD/PkSLrF4jtLAk4z
	+rLQ==
X-Gm-Message-State: APjAAAU3fKjFhmE6oZO/xU80Oof5esSzx6iwDt/qLicZfPUlqRYHqQKn
	vPh+wseHXRfc2f9SiwQPWcjJmnhBh+iojUY3fSg=
X-Google-Smtp-Source: APXvYqwNIDHbSYPG5aN+ILU7k3NPOWD84Bm0vb30th4pSY8J48Xu8j7mMYm75hpXiKjGlyQcVs2oVHlK8t3IPQTDHnU=
X-Received: by 2002:a92:5855:: with SMTP id m82mr9072837ilb.302.1581080478082; 
	Fri, 07 Feb 2020 05:01:18 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP;
	Fri, 7 Feb 2020 05:01:17 -0800 (PST)
In-Reply-To: <20200207115521.i7flzwf6e24obq5r@qschulz>
References: <CAA=hcWSCZROrpDBWV5ZAA+LV6j0cjRSKxyjonOfWS4mCZAtdHg@mail.gmail.com>
	<em86bbcd60-f004-4acb-b508-4471dac5c7c1@andys-imac.leeshillfarm.local>
	<CAA=hcWQsP1N58iqrxEggZBdSksgHk+gfuG7yz0+C3G7o0=DzOw@mail.gmail.com>
	<c159fe1d7cc14f5c80878fe81a957bb4@tagmaster.com>
	<CAA=hcWQPrfb3UrYsfyhs4as8wGDf5DsyEtF=cgCo4gJprx=b1Q@mail.gmail.com>
	<20200207115521.i7flzwf6e24obq5r@qschulz>
From: JH <jupiter.hce@gmail.com>
Date: Sat, 8 Feb 2020 00:01:17 +1100
Message-ID: <CAA=hcWR8F_jP5mascw02RnLRi2NkAb2juFhNmEoaeuY5G74HFw@mail.gmail.com>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Andy Pont <andy.pont@sdcsystems.com>,
	Yocto discussion list <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Pelle Windestam <Pelle.Windestam@tagmaster.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Meta Freescale <meta-freescale@yoctoproject.org>
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
X-List-Received-Date: Fri, 07 Feb 2020 13:01:17 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Quentin,

Thanks for your response, so glad you help me here again :-).

On 2/7/20, Quentin Schulz <quentin.schulz@streamunlimited.com> wrote:
>> /build/Installer/sa_platform_build/Source/Yocto/build/tmp-glibc/work/solar-oe-linux-gnueabi/u-boot-imx/2017.03-r0/git/cmd/ubi.c:448:
>> undefined reference to `mtdparts_init'
>
> This function is not defined. So you look it up in the sources, find
> where it's defined.

That is a function call in cmd/ubi.c:

int ubi_detach(void)
{
    if (mtdparts_init() != 0) {
        printf("Error initializing mtdparts!\n");
        return 1;
    }
.....

That function is in cmd/mtdparts.c:
int mtdparts_init(void) {
.......
}

It is in the same source directory, I'll have to look it deep, why it
does not compile cmd/mtdparts.c?


> Is it in a file which is compiled/included somewhere?
> Is it surrounded by #ifdef? And by surrounded, I mean the #ifdef can
> be several thousands of lines above the function definition.

Actually, there is no macros to surround that function.


> In that case, I couldn't find the sources of u-boot-imx (didn't take the
> time) but from upstream:
> https://elixir.bootlin.com/u-boot/v2017.03/source/cmd/nand.c#L35

The meta-freescale downloaded the u-boot source from
https://source.codeaurora.org/external/imx/uboot-imx.git

> It's surrounded by #if defined(CONFIG_CMD_MTDPARTS) so you need
> CMD_MTDPARTS to be enabled. Do the same for all the other calls. There's
> no magic thing, you thus have to look it up yourself most of the time.
> Even though arguably, that's a mistake from upstream (there should be a
> dependency on MTDPARTS in Kconfig, anyway...).

You are right, the CONFIG_CMD_MTDPARTS is defined in many defconfig
except it is not in my mx6ull_14x14_evk_defconfig, there are lots of
definitions are defined in other defconfig, but missing in
mx6ull_14x14_evk_defconfig. When I run make menuconfig, I enabled all
MTD, NAND and UBI parts except UBI Fastmap (Experimental feature) in
menuconfig, but I still could not find CONFIG_CMD_MTDPARTS and other
definitions. Need to look it carefully.

I suspect that to run make menuconfig might not be right command, I
tried bitbake -c menuconfig u-boot:

ERROR: Task do_menuconfig does not exist for target u-boot
(./meta-freescale/recipes-bsp/u-boot/u-boot-imx_2017.03.bb:do_menuconfig).
Close matches:
  do_configure

To run kernel menuconfig, I can add KERNEL_CONFIG_COMMAND =
"oe_runmake_call -C ${S} O=${B} imx_v6_v7_defconfig" to a bbappend
file to run bitbake -c menuconfig kernel. Is there an equivelent
UBOOT_CONFIG_COMMAND to run oe_runmake?

Thank you.

- jh

