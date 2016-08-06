Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2380C731DD
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Aug 2016 20:21:59 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i5so8742574wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Aug 2016 13:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=V+7C1spF5TIeZGq5UVYWh+/sb0R1cCuRt5lYIAp0TEw=;
	b=pUKUlxQf2t45WRxb2HVflOkd97oDiEMJXR3LcB2QbrosX0MboMFfuIZvy3lSdHf0JP
	Us+HaZASzdKr4HSdBKvAAN8XZn7H7k3xwmgdEPk0XJISJRffEUSqyAfPdbp2sfhFuR1N
	z6A5PZke0yheRUenLrr1UGwhd1pISAUV/t0I5hc9KL8YKiQTW4ZWglLzYAlLMfRG+Z8q
	7Wib2svy3gY532K1v0mY509P2NpMdqgz3jDOoAJAMMkXIKlPC8x9zvyt51ToqY6XLGjq
	bvhHDVZq6hDFF49s8n+/ak+qbu1vKrAP/kVQiZtlXSm1wByt8xXhL7dmb9+bTv9SsMiF
	5OTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=V+7C1spF5TIeZGq5UVYWh+/sb0R1cCuRt5lYIAp0TEw=;
	b=Ih5u32RNXE9fKF+A1jtMwYsCeQwLMDMXoFyQjLXxkUWqN6TvDT54xqQxhHoDjnNgia
	T21qFbiOQnnhQRIve5H/Ox70SgkFtmIoV6qm2Y2DlLidkogK5Hj3SHqAdYL6MHdLsrv1
	zEuOL+OoxScf2wdjcARmsBFecdRewoV9Aos256n7tAobpa5NoqmgUQ9dCdXvA25HDJaz
	V7/Lb5mGzpJnZkh/zBAG+VZt0aggjcqF8y2GlEAfpXQNOXB0Trbt3pMq6tJxqA/4+hE4
	n3xFQ02cYsdkJNq94GYqIlZfvYYl/dKnpDHYVPjVkxLLcxHQGSUvIcvsjqph9KJIutc5
	oGOg==
X-Gm-Message-State: AEkoouu6SRd+9n1ZTlkdPeIFjk/bvbuRe2ZWeqaZuhnj6s0Wl8toKY8JoAgNt8s5ovgtvw==
X-Received: by 10.28.127.209 with SMTP id a200mr8466923wmd.99.1470514919829;
	Sat, 06 Aug 2016 13:21:59 -0700 (PDT)
Received: from Saturn.local.all (212-41-66-28.adsl.solnet.ch. [212.41.66.28])
	by smtp.gmail.com with ESMTPSA id
	va3sm24483397wjb.18.2016.08.06.13.21.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 06 Aug 2016 13:21:59 -0700 (PDT)
Message-ID: <1470514917.2250.23.camel@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, Khem Raj <raj.khem@gmail.com>
Date: Sat, 06 Aug 2016 22:21:57 +0200
In-Reply-To: <alpine.LFD.2.20.1608060722240.30722@localhost.localdomain>
References: <alpine.LFD.2.20.1608051449110.5757@localhost.localdomain>
	<EA1E233F-E790-4830-A15F-D0FCE8E0A418@gmail.com>
	<alpine.LFD.2.20.1608051710350.7122@localhost.localdomain>
	<20160805211836.GA3009@haswell>
	<alpine.LFD.2.20.1608060722240.30722@localhost.localdomain>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what must i supply WRT UBOOT_CONFIG/UBOOT_MACHINE when u-boot isn't in BSP?
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
X-List-Received-Date: Sat, 06 Aug 2016 20:22:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Samstag, den 06.08.2016, 07:26 -0400 schrieb Robert P. J. Day:
> On Fri, 5 Aug 2016, Khem Raj wrote:
> 
> > On 16-08-05 17:11:34, Robert P. J. Day wrote:
> > > On Fri, 5 Aug 2016, Khem Raj wrote:
> > > 
> > > > 
> > > > > On Aug 5, 2016, at 11:52 AM, Robert P. J. Day <
> > > > > rpjday@crashcourse.ca> wrote:
> > > > > 
> > > > > 
> > > > >  i'm in the situation where i want to add the u-boot-fw-utils
> > > > > package
> > > > > to my image, but the corresponding u-boot source for the
> > > > > target is not
> > > > > part of the BSP layer; in fact, it's not part of a layer at
> > > > > all (built
> > > > > manually elsewhere), so it's unsurprising that, if i add that
> > > > > recipe
> > > > > to the image, i get:
> > > > > 
> > > > > ERROR: u-boot-fw-utils was skipped: Either UBOOT_MACHINE or
> > > > > UBOOT_CONFIG must be set in the ... machine configuration.
> > > > > ERROR: u-boot-fw-utils was skipped: Either UBOOT_MACHINE or
> > > > > UBOOT_CONFIG must be set in the ... machine configuration.
> > > > > 
> > > > > is there a short doc that explains what i minimally need to
> > > > > supply to
> > > > > build that package? i've never been in the situation where u
> > > > > -boot
> > > > > wasn't part of the BSP.
> > > > 
> > > > perhaps you need to set UBOOT_MACHINE = "config"
> > > 
> > >   i apologize, but i have no idea what that means. does that mean
> > > i
> > > want to build that package, and it will consult
> > > /etc/fw_env.config
> > > when the executables are run?
> > 
> > well, the errors you reported above are issued when OE is trying to
> > build the u-boot-fw-utils recipe and BSP does not define the
> > UBOOT_MACHINE, I was merely pointing to a possible solution. I do
> > not know your usecase.
> 
>   i'm trying to add the u-boot-fw-utils package to an image for which
> i don't have a u-boot recipe available for the target board, so i
> can't just set UBOOT_MACHINE. i just want to know what i have to
> provide to the u-boot-fw-utils recipe in terms of u-boot config info
> manually to get a build.
> 
>   i have the relevant info for the /etc/fw_env.config file that
> fw_printenv and fw_setenv need to run, i just don't know how to add
> that to the build process.
Hi

The fw-utils are built by

- Getting the U-Boot sources
- Setting CROSS_COMPILE
- Configure U-Boot by: make <one of the filenames in config>
- Compiling: make env

So you must provide the config name you want to be used.
In the absence of a specific U-Boot recipe the one from oe-core
will be taken. This uses the sources from git.denx.de v2016.03.
So take your pick of one of the available machines. Try chose
one which is close to what you actually have, e.g. 
mx6dlsabresd_defconfig should you use an i.MX6 based SOC.
http://git.denx.de/?p=u-boot.git;a=tree;f=configs;h=c386b9a5e747dfc2d00
6265a294890a47647afd6;hb=df61a74e6845ec9bdcdd48d2aff5e9c2c6debeaa
and then as Khem suggested set in local.conf:
UBOOT_MACHINE = "mx6dlsabresd_defconfig"

Note that the default U-Boot environment is compiled into your
fw_getenv, fw_setenv binaries. So if fw_getenv, fw_setenv are not
able to read a valid environment from the location you configure in
fw_env.config then the defaults of your substituted U-Boot machine
will be used.
e.g. 'fw_setenv foo bar' will write the 'wrong' default environment
amended with foo=bar.

Likely a source of surprises.

Regards
Max

> 
> rday
> 
> -- 
> 
> =====================================================================
> ===
> Robert P. J. Day                                 Ottawa, Ontario,
> CANADA
>                         http://crashcourse.ca
> 
> Twitter:                                       
> http://twitter.com/rpjday
> LinkedIn:                               
> http://ca.linkedin.com/in/rpjday
> =====================================================================
> ===
> 

