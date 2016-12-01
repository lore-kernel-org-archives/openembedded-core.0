Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6568E71A22
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 22:22:17 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id p9so11651632vkd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2016 14:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lQ944CYpdfWHtunf3fmOhfH2zl8FFZTGvt0t667L6Kg=;
	b=0QrFIpYEePzCH5Fc+IMUK1LHWBTfrf1WaojrHwM9yrBV03ZpXB0fVMiWIaJJlALk/D
	w8OWorvW/S/yzH15Q+Zvf2SXuo1sm5sHoOQuL5tzmRel7FnStDq+A1Axw2+fljz6HmBn
	f2mmxgho0goIHVwyK6ZTVGIcQdUKgIYpsIHlRnG/WNT+DExSOwEyhHMFCpRN3gng4bzE
	taoiryZYinbWsoaTfUFIW66dK2GOu8Mu1jJ/umwS+8+urgOBerzdFZyBIc1tsr4Y77Q4
	85rWYZdipDn92H8vMfkDmthcQ3ptsn25RN0VkTSC/RVWeRqK0j0d4iRIHZBTZLVvdgSo
	MjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lQ944CYpdfWHtunf3fmOhfH2zl8FFZTGvt0t667L6Kg=;
	b=DQZCZrbE9FvaeRNSZyAgA3yFvbUBNYIcKkystgmEWJER74F2SmWLmas/HC05OwP3Kh
	CSWtMelAMNj6igrOjWa1mMVhkoDzcJ5i1alzli4sxIareWyBucM2jTPHd6Uj/FYUlsju
	InQGOkWzM8Hp4l0J5hwn0hYzdRooW0djzGDKRjCc4O5GfvcJbIxhdZzVCO7+Pxm5us0/
	LBUz2vte8q3Ua6cn4bJIOJ0YTsu6OdX9aAWfhO7Y7vleP+yxyEV+yUmk6seZWLFSA+v7
	9xeiUOgCGd6TnKdXvClw3KTsCqu7fn+q6sljG74PnihyrPau+jKG0Qhbf9wEuxBAPCKM
	gibw==
X-Gm-Message-State: AKaTC02jb+wPpUGggpKZ9zrO4Rb+xlWU6E+JG5AgzKYM96kmfgUyEuyyUH05n2DqP6L77jVATiTtundRbK5bWg==
X-Received: by 10.31.197.195 with SMTP id v186mr15222645vkf.84.1480630939064; 
	Thu, 01 Dec 2016 14:22:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Thu, 1 Dec 2016 14:21:48 -0800 (PST)
In-Reply-To: <CAJTo0LY4K4mRh6_jCJj1pEGHRvx67kZuQ0DbNtkA_EOkP7GyRw@mail.gmail.com>
References: <20161128212606.26139-1-raj.khem@gmail.com>
	<CAJTo0LY4K4mRh6_jCJj1pEGHRvx67kZuQ0DbNtkA_EOkP7GyRw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Dec 2016 14:21:48 -0800
Message-ID: <CAMKF1sqkMeeJJGK37ktnAXdsrfufwFGDoJcw4ma076SgGacQfw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 V5] systemd: Upgrade to 232
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
X-List-Received-Date: Thu, 01 Dec 2016 22:22:18 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 1, 2016 at 12:22 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 28 November 2016 at 21:26, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> -PV = "230+git${SRCPV}"
>
>
> packages/corei7-64-intel-common-poky-linux/systemd-boot/systemd-boot-dev:
> PKGV changed from 230+git0+3a74d4fc90 to 1.0 [default]
>
> I'm starting to wonder if systemd and systemd-boot sharing a .inc is a good
> idea!

I think its fine. We should consolidate all systemd related recipes in
one place may
be under

recipes-systemd/
or recipes-core/systemd

currently we have

./recipes-devtools/systemd-bootchart/systemd-bootchart_230.bb
./recipes-bsp/systemd-boot/systemd-boot.bb
./recipes-core/systemd/systemd_232.bb
./recipes-core/systemd/systemd-serialgetty.bb
./recipes-core/systemd/systemd.inc
./recipes-core/systemd/systemd-compat-units.bb
./recipes-core/systemd/systemd-systemctl-native.bb



>
> Ross

