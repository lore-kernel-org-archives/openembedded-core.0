Return-Path: <jupiter.hce@gmail.com>
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
	[209.85.166.47])
	by mail.openembedded.org (Postfix) with ESMTP id 146067FDBE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 12:22:11 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id z8so2786995ioh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 04:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1fK60DJEZ0hOzjRlXbRXM/bcTWqpbDemkTD8QvKBdec=;
	b=kLeT9BtS9qRKUwBrsvXkHTEXLabHYKFGJTJC2Y3ZWeEwWmW3DnV/lVo/D88lt+OZoU
	61rJ3I8BDIKV+hyOcfH6Unu9r/SxdYGerVzIN0du7ElWU/7IxSvJyEYf9XXINtHQO45Z
	GyQAW2rL5MufJx3nGiZLXbNug90s54zcTFz1xepcl9Gz0Klui/tv+eCVhb2/0XANxSbv
	gRc7pcig2RszENUSxSWYEN9bP/6Kx2QcwvESOEAmbrz6NcPV6l7ZqEBWfIRFQ33stvzP
	Xuu+skQBG4ZMh2LoAc23PnDtFoORAp7Sg5aLz0Z1T3BSAIB0J/X7R4k11ke9wGlYAbED
	9Q3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1fK60DJEZ0hOzjRlXbRXM/bcTWqpbDemkTD8QvKBdec=;
	b=MrrWQojDOGkX5bEArffiyWtC2Mh8L70eevPyC+6Zu96nN0nhF3w2ZgcSq1fCOxjuWh
	dOf0rOyDNt5If6KsQKtbCIm9fNlza1x3wPKbLhr5nbkfazNDZCeGyU/jxHocbkeU30Jw
	kQz7d0pknbKNcwSosiC8S/F/agtt0DoFZ3z9HyLlHB1gmiPvT8NgosN9UjRYW1QPAELT
	zxdzOrgP0iRIZcSrhc5o9Fy5ValDX9NB3ZsAQrlUrpGjyTVeAeDWis0FON1kR13Q2H7P
	Myp9/EF2iR8gZCwMcESre0YHc3OQRS4vI9zPuUJfL93mBvnGqjlhc17DFvf36HoOZx6O
	sX/g==
X-Gm-Message-State: APjAAAVTLnxr4Xd+RHnGJq1Vh8YibFhQxB3TkHOcLDHCiryX6/IKKqYg
	FTo+3x2BocXCh2BLBRM0ODYdMDEPoCA68GHzIS0=
X-Google-Smtp-Source: APXvYqwNZ5GEVS0gsQLPEKGIAmZQPlK2riHI88W0dwxDQWUt8HpXrQATOZfYOvO+OkTh5v7Ft7fnTRsy53iE+xXNIlw=
X-Received: by 2002:a6b:d912:: with SMTP id r18mr10425376ioc.306.1579782133148;
	Thu, 23 Jan 2020 04:22:13 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac0:e345:0:0:0:0:0 with HTTP; Thu, 23 Jan 2020 04:22:12
	-0800 (PST)
In-Reply-To: <c6deb6ed-c9b6-36f5-4ada-bd29bc3783ee@intel.com>
References: <CAA=hcWS5w_QTmUMZBBMpj-H+iyBcqc=6h3RoZwdpVYU7gpyaMw@mail.gmail.com>
	<c6deb6ed-c9b6-36f5-4ada-bd29bc3783ee@intel.com>
From: JH <jupiter.hce@gmail.com>
Date: Thu, 23 Jan 2020 23:22:12 +1100
Message-ID: <CAA=hcWTj07+TQM3SmaLnCZFGzG5W0qVv1SVpRWRz2F756_irVQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Could oe-core be infected by virus?
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
X-List-Received-Date: Thu, 23 Jan 2020 12:22:12 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Ross,

On 1/23/20, Ross Burton <ross.burton@intel.com> wrote:
> On 21/01/2020 11:21, JH wrote:
>> The wired
>> thing was that image injected so many new messages, including "Welcome
>> to OpenEmbedded nodistro.0!" I have never seen in previous built image
>> boot.
>
> If you've never seen that before, but now you do, then the problem is
> that you're not setting DISTRO in your build as 'nodistro' is the default.

I do have a DISTRO defined in local.conf, and I do have a distro file
as follows since day one to use OE / Yocto to build the imx6 image, I
have never changed it:

$ cat build/conf/local.conf
.......
DISTRO = "solar"
........

$ cat conf/distro/solar.conf

#TCLIBC = "musl"

DISTRO_FEATURES = "largefile 3g wifi usbhost systemd xattr ext2 ipv4
${DISTRO_FEATURES_LIBC}"

DISTRO_FEATURES_BACKFILL_CONSIDERED = "pulseaudio sysvinit bluez5
gobject-introspection-data"

# Drop WiSPR support from connman to drop GnuTLS dependency
#PACKAGECONFIG_pn-connman = "systemd iptables"
# Use OpenSSL instead of GnuTLS
PACKAGECONFIG_pn-wpa-supplicant = "openssl"

VIRTUAL-RUNTIME_init_manager = "systemd"
VIRTUAL-RUNTIME_initscripts = ""

# If we don't want to build all locales we can select the ones we want here...
# just comment this out in order to build all locales.  These are not
# automatically installed into the image, that is selected elsewhere.
GLIBC_GENERATE_LOCALES = "en_US.UTF-8"

Are there any issues in my distro file?

So my root is root@solar as well, I did not see nodistro.0 before. Let
me further clarify it, in my build system, the source of oe-core,
bitbake, meta-freescal and all configure files are all stored in a
persistent local repository, it has not been changed for a year, the
only changes are those packages downloaded from remote URLs.

This is why I am very concerned, how could the boot sequence and
messages changed dramatically where the source and configure files
have not been changed for a year. But I am more worried that the boot
caused error after 2 - 3 good cycles of booting. Why wasn't the boot
broken in the first boot cycle, only broken after 2 - 3 good bootings?
I cannot comprehend it, appreciate your explanation.

Thank you very much Ross.

Kind regards,

- jh

