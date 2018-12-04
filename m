Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
	[209.85.161.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5F0256B463
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Dec 2018 08:49:15 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id r130so6623212ywg.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2018 00:49:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=+spnjTd3JUV9Qo1KFb+MPoqJfbbowQQHjoZWm69+w98=;
	b=Veup9QyqLL8zMA3w4uWsWIzRujcvgHZlEEqTto6z60K2ScL3f6UHsIc0b+yflAZgzt
	abgDL95EhcR1QdZEbaaob7cUaKEnBO2OVxmRkd79qqUzqYydLfJ4cD9qP/28o4NZCU5s
	RL85+PY1EdKcJ9waVLyeWd4ATeXHMh9KmY+cpvC9lEcaVq9rAIax2AqVLF9dMovV7VSc
	JfTPx77LYbyTE8yMrNB8VZ2DV8Jb7n2+bfW12UOOC/HkKVhxcQJcQwXgfEnvbt2FiCAz
	v4/3tlJPkVQ8r0xQGlnKeXXLqMDv/jc7bVPX6oyW37nbk8JpeLxi8zQAf/VeJxEmCWG5
	7G3g==
X-Gm-Message-State: AA+aEWaXeaq1AN5zAscajteg29D5MhGzThlrHVvwmk/tYx1tgfsZ+R6r
	Fk3NndcEIzBliaElBir+cdw=
X-Google-Smtp-Source: AFSGD/WvKCILN1fn+2HuLkb9vn+YA70ZlGT2/IeZff9PoGSPESiRdc1gBpN3YNU4LIXwnNooYDAeqA==
X-Received: by 2002:a81:378b:: with SMTP id e133mr18814533ywa.79.1543913356121;
	Tue, 04 Dec 2018 00:49:16 -0800 (PST)
Received: from bluvision ([77.107.218.170]) by smtp.gmail.com with ESMTPSA id
	m66sm4985338ywc.37.2018.12.04.00.49.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 04 Dec 2018 00:49:15 -0800 (PST)
Message-ID: <df4c8f584913808f38116e52eb9fc9d53b9ba971.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: ChenQi <Qi.Chen@windriver.com>, "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 04 Dec 2018 08:49:13 +0000
In-Reply-To: <17942ed5-f221-9a69-62f8-828a44e097a9@windriver.com>
References: <20181203152815.6623-1-git@andred.net>
	<CAJTo0LYwiZ57t7zZBSYO51Tn2AwObKYJ6xqBExDCKr7LLssdqg@mail.gmail.com>
	<17942ed5-f221-9a69-62f8-828a44e097a9@windriver.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: split out blkdiscard into its own package
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
X-List-Received-Date: Tue, 04 Dec 2018 08:49:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

I'd be happy to work on that, but I won't have time to do so until sometime
early next year...

Can this patch be applied in the meantime nevertheless please?


Cheers,
Andre'


On Tue, 2018-12-04 at 10:04 +0800, ChenQi wrote:
> I think this is a good idea. I opened a new bug in bugzilla to track it, 
> and assigned it to myself.
> Ross, please check the bug description to see if that's what you want.
> Andre, if you want to work on it, take the bug and let me know.
> 
> Best Regards,
> Chen Qi
> 
> On 12/04/2018 12:40 AM, Burton, Ross wrote:
> > When do we just programatically split instead of doing it piece by
> > piece? :)
> > 
> > Ross
> > On Mon, 3 Dec 2018 at 15:28, André Draszik <git@andred.net> wrote:
> > > From: André Draszik <andre.draszik@jci.com>
> > > 
> > > For systems that don't otherwise depend on the full
> > > util-linux package, blkdiscard is a mere 18k (on
> > > cortexa7t2hf-neon).
> > > 
> > > Signed-off-by: André Draszik <andre.draszik@jci.com>
> > > ---
> > >   meta/recipes-core/util-linux/util-linux.inc | 5 +++--
> > >   1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/meta/recipes-core/util-linux/util-linux.inc
> > > b/meta/recipes-core/util-linux/util-linux.inc
> > > index a05c1cabbe..b5f77f7b6b 100644
> > > --- a/meta/recipes-core/util-linux/util-linux.inc
> > > +++ b/meta/recipes-core/util-linux/util-linux.inc
> > > @@ -27,7 +27,7 @@ DEPENDS_append_class-nativesdk = " lzo-native"
> > >   SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-
> > > linux/v${MAJOR_VERSION}/util-linux-${PV}.tar.xz \
> > >              "
> > > 
> > > -PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk
> > > util-linux-sfdisk \
> > > +PACKAGES =+ "util-linux-agetty util-linux-blkdiscard util-linux-fdisk 
> > > util-linux-cfdisk util-linux-sfdisk \
> > >                util-linux-swaponoff util-linux-losetup util-linux-
> > > umount \
> > >                util-linux-mount util-linux-readprofile util-linux-
> > > uuidd \
> > >                util-linux-uuidgen util-linux-lscpu util-linux-
> > > fsck.cramfs util-linux-fsck \
> > > @@ -74,6 +74,7 @@ FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
> > >   FILES_${PN}-dev +=
> > > "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.la"
> > > 
> > >   FILES_util-linux-agetty = "${base_sbindir}/agetty"
> > > +FILES_util-linux-blkdiscard = "${sbindir}/blkdiscard"
> > >   FILES_util-linux-fdisk = "${base_sbindir}/fdisk.${BPN}"
> > >   FILES_util-linux-fstrim = "${base_sbindir}/fstrim.${BPN}"
> > >   FILES_util-linux-cfdisk = "${base_sbindir}/cfdisk"
> > > @@ -126,7 +127,7 @@ RDEPENDS_util-linux-su += "libpam"
> > >   RDEPENDS_${PN} = "util-linux-umount util-linux-swaponoff util-linux-
> > > losetup util-linux-sulogin util-linux-lsblk"
> > >   RDEPENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam',
> > > 'util-linux-runuser util-linux-su', '', d)}"
> > > 
> > > -RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-
> > > sfdisk util-linux-mount util-linux-readprofile util-linux-mkfs util-
> > > linux-mountpoint util-linux-prlimit util-linux-ionice util-linux-
> > > switch-root"
> > > +RRECOMMENDS_${PN} = "util-linux-blkdiscard util-linux-fdisk util-
> > > linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile 
> > > util-linux-mkfs util-linux-mountpoint util-linux-prlimit util-linux-
> > > ionice util-linux-switch-root"
> > > 
> > >   RRECOMMENDS_${PN}_class-native = ""
> > >   RRECOMMENDS_${PN}_class-nativesdk = ""
> > > --
> > > 2.20.0.rc1
> > > 
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 


