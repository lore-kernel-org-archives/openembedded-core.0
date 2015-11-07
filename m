Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id BFC8775E2D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Nov 2015 10:36:51 +0000 (UTC)
Received: by wiva10 with SMTP id a10so8879760wiv.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Nov 2015 02:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=T9m1NvbjSlzoUq9Bp+CZOZYkg9bur+cyZexkwGgTaKY=;
	b=FNBc26501AZkcqd1eRLVVz9zFGeqt7jtS+RG3iX5ZprTGnqw5OBx26iDLc9R0C3kul
	FyUKLakwdGtvK9I9bSpV8wFtECPtdN1ZaYqOG3FvAFsz3DPuoHYZ4ZVl95nI0cmny+6x
	6oUL1vvz3T81NKSAHvtHJSTjMW5IBhRnzwBk/uxMp6G065n7Md4pFMe8CwrgOdnh+c6K
	k9WgIoAxm2xaRpGfuYSlmZYQz1Kd8+WL2mJKBeEYqjQMBJg3NYGsqncglzMkeLYpSKwz
	PKUYOcF7tnSvL+CB8Bc7bVwQkycBcVqXYCpk9zat/2f2ZdVvDb3J8r/VXqXAIGvhvoII
	Sn4w==
X-Received: by 10.194.9.4 with SMTP id v4mr21657820wja.142.1446892610975;
	Sat, 07 Nov 2015 02:36:50 -0800 (PST)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	m143sm3357949wmb.1.2015.11.07.02.36.50
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 07 Nov 2015 02:36:50 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <CAJTo0Lb7w0XAJ-H-T2Uz-mdmjUZGFX9wQyzCUJ_4bU8re9rswQ@mail.gmail.com>
Date: Sat, 7 Nov 2015 11:36:49 +0100
Message-Id: <A2AEDEA2-FB1D-4D6F-8B2F-F420AC123C9B@gmail.com>
References: <6A0E85DF-31B7-4955-B4A2-0F3E099FCF99@gmail.com>
	<CAJTo0Lb7w0XAJ-H-T2Uz-mdmjUZGFX9wQyzCUJ_4bU8re9rswQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Update libusb1 from 1.0.19 to 1.0.20
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
X-List-Received-Date: Sat, 07 Nov 2015 10:36:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 06.11.2015 um 11:36 schrieb Burton, Ross <ross.burton@intel.com>:
>=20
>=20
> On 8 October 2015 at 15:36, Jens Rehsack <rehsack@gmail.com> wrote:
> This updates libusb1 from 1.0.19 to 1.0.20
>=20
> 2015-09-13: v1.0.20
> * Add Haiku support
> * Fix multiple memory and resource leaks (#16, #52, #76, #81)
> * Fix possible deadlock when executing transfer callback
> * New libusb_free_pollfds() API
> * Darwin: Fix devices not being detected on OS X 10.8 (#48)
> * Linux: Allow larger isochronous transfer submission (#23)
> * Windows: Fix broken builds Cygwin/MinGW builds and compiler warnings
> * Windows: Fix broken bus number lookup
> * Windows: Improve submission of control requests for composite =
devices
> * Examples: Add two-stage load support to fxload (#12)
> * Correctly report cancellations due to timeouts
> * Improve efficiency of event handling
> * Improve speed of transfer submission in multi-threaded environments
> * Various other bug fixes and improvements
> The (#xx) numbers are libusb issue numbers, see ie:
> https://github.com/libusb/libusb/issues/16
>=20
> And apparently introduces a parallel make race :(
>=20
> mv: cannot stat `libusb_1_0_la-sync.loT': No such file or directory
> mv: cannot stat `libusb_1_0_la-descriptor.loT': No such file or =
directory
> mv: cannot stat `libusb_1_0_la-core.loT': No such file or directory
> mv: cannot stat `libusb_1_0_la-hotplug.loT': No such file or directory
> mv: cannot stat `libusb_1_0_la-io.loT': No such file or directory
> i686-poky-linux-libtool:   error: 'os/libusb_1_0_la-linux_usbfs.lo' is =
not a valid libtool object
> make[3]: *** [libusb-1.0.la] Error 1
> make[3]: Leaving directory =
`/home/pokybuild/yocto-autobuilder/yocto-worker/ptest-x86/build/build/tmp/=
work/core2-32-poky-linux/libusb1/1.0.20-r0/build/libusb'
> make[2]: *** [all-recursive] Error 1
>=20
> (full log at http://errors.yoctoproject.org/Errors/Details/21443/)

I look into it and send a v2, if necessary

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


