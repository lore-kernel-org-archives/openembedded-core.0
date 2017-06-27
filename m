Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 62A1377FDE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 10:38:29 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id h64so15101424iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 03:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=AsqZWDFqmhSvy3XMRQGTHa2MaeEFZH/AV778ErDhMUI=;
	b=VnopQK4lZFpPEyxgRAAl94IwgbZY82OZFK0TRGPTZt/xcTxHeUj63ATK7/TmpU0pPn
	ZkMQLBIg3CaeoW/KDOzD0Rw5kHeBdtCo399yw0IEhsHywNNSj/VfX2PPQUG/ofOuIwJK
	/nDB3yPIDGjVSFKcEJMtJRznn/nVD0NWUBLz4Pd/oeYkjSvSYbrrl0IcPy2cKd7hMtRF
	gMa53480FdkR08f1tv/1RHKvvLUQMopfZCz0d80dRYp0+Hg6srompE1Yv6Q4jQy2wAYA
	W6MjW13TlMRKZLyC2oEs9PKsz4QkvPhtJRSTI12K5neJCYIhj6x1NkgiG0gLhn5UxUK7
	/veg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=AsqZWDFqmhSvy3XMRQGTHa2MaeEFZH/AV778ErDhMUI=;
	b=LgBpwSTcDjfYocOpIHca4MsNH2dAJvpcSra+UHNJY4q0pCTgaxKmUjzlONWlGB3TVR
	0AlnvBAwcYEgZDxGNa0h8lpMx1Eg1KKYgKEDo8esFjPqceZdKmCuzJCZQe2oHVwpPbJI
	KBdjmpA2vkhYkeEZJMcYVoEVg1uRU/cHr3BIYmAm1jCBa49arrVewkA4jrEqwyjUGATR
	z2M5YEymj35frwRQmA2HBofclt4W4tgHAG/wr2Xkz/kye7xTF3A3V4b/vFQXaPYsc2eW
	G1VCY8CSyc2CJvZfuhnQF1vUbIBfw11/abwnPUqywexVgSPw7I2WPipY1BGFJhLvw8sW
	iaIA==
X-Gm-Message-State: AKS2vOzdzsYzcMDwRV1IR7HGlYSmfHaJqxjFnJkQerVn15wodrxIhy2N
	SnaKpV6j+2+DWAyCnl8=
X-Received: by 10.107.134.168 with SMTP id q40mr5663574ioi.149.1498559911181; 
	Tue, 27 Jun 2017 03:38:31 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8FB9F.dip0.t-ipconnect.de. [93.232.251.159])
	by smtp.gmail.com with ESMTPSA id 73sm1359648ion.11.2017.06.27.03.38.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 03:38:30 -0700 (PDT)
Message-ID: <1498559907.7464.42.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Jonathan Liu <net147@gmail.com>
Date: Tue, 27 Jun 2017 12:38:27 +0200
In-Reply-To: <CANwerB3jfo=r=xcHdn8+yU1=r9JmK0_3MCnQWdf8uDh=Tn1AGA@mail.gmail.com>
References: <20170601121552.27868-1-net147@gmail.com>
	<1498554326.7464.33.camel@intel.com>
	<1498558903.7464.37.camel@intel.com>
	<CANwerB3jfo=r=xcHdn8+yU1=r9JmK0_3MCnQWdf8uDh=Tn1AGA@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] bitbake.conf: Add sdl-config to HOSTTOOLS if using host SDL
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
X-List-Received-Date: Tue, 27 Jun 2017 10:38:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-06-27 at 20:24 +1000, Jonathan Liu wrote:
> Hi Patrick,
> 
> The original problem was that bitbake would print out the error:
> "libsdl-native is set to be ASSUME_PROVIDED but sdl-config can't be
> found in PATH. Please either install it, or configure qemu not to
> require sdl.", if "libsdl-native" was in ASSUME_PROVIDED even if the
> host has sdl-config in its PATH.
> 
> This occurred really early for a clean build and bitbake would bail
> out. The sanity check is in meta/classes/sanity.bbclass.

I've not hit that problem, probably because the sanity check was not run
again when I changed ASSUME_PROVIDED. I can reproduce it in a clean
build directory without conf/sanity_info.

I think extending HOSTTOOLS merely to satisfy sanity.bbclass is the
wrong solution to the problem. It makes sdl-config available to all
recipes, which is unnecessary and potentially introduces back host
contamination.

It is unnecessary because the qemu recipe has special code that enables
the use of the host SDL when told to do so via ASSUME_PROVIDED.

Can you come up with a better solution, probably by patching
sanity.bbclass?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




