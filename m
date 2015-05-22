Return-Path: <anders@chargestorm.se>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 10B21609B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 05:32:22 +0000 (UTC)
Received: by labbd9 with SMTP id bd9so5234286lab.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 22:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:organization:user-agent;
	bh=S9helOz7JSKT4aOFc2daXsytiv3KAK2uL/JdlSgRDew=;
	b=BnP7GBsT2aWrTciMh6l6050vZYD9EmRVhI5Baf6kYUeUNgPaoCi3ADbET+Wexux8E6
	ZEg+i6eu2zCIkVtjcxlMIF78Yx/r7TP5K63o3ivHsRV6Ve66dKhUX7DGjQsXGfDvu/wV
	fUu2CxJ6Y0uNXfGixp3wOvXytUg2VMLUF1LX7/ZH8GusSIMN76y5vSb1uFEq5t8BVzhq
	54vMF7BywK8sLM+Hpz/I2+aywJF0qTX5krg9tZspFeJZNA1GYC+DEOGhfAdgOvbxBWz4
	8t+3yXL850uNssYJxD5COn0lHlHHv/xG1PLF9YzpmbGhK+kXG+iLncxzN2IKu4CCS83I
	/3+g==
X-Gm-Message-State: ALoCoQlkH/aA9xSlugEkd0SXFAHNx9zo2sBSUhD2+/AxUp/13TPYyo8SML1VRr5tnuyznXPj0RYh
X-Received: by 10.112.137.1 with SMTP id qe1mr4901771lbb.22.1432272742063;
	Thu, 21 May 2015 22:32:22 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by mx.google.com with ESMTPSA id o8sm245178lal.2.2015.05.21.22.32.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 May 2015 22:32:21 -0700 (PDT)
Date: Fri, 22 May 2015 07:32:19 +0200
From: Anders Darander <anders@chargestorm.se>
To: Steffen.Pankratz@elektrobit.com
Message-ID: <20150522053219.GA31975@ad.chargestorm.se>
Mail-Followup-To: Steffen.Pankratz@elektrobit.com,
	paul.eggleton@linux.intel.com,
	openembedded-core@lists.openembedded.org
References: <81B0EC78FE09F04E8E0FF9B9C2BF8A3649393797@deeres07.ebgroup.elektrobit.com>
	<1953557.Q3PSlmcSRZ@peggleto-mobl.ger.corp.intel.com>
	<81B0EC78FE09F04E8E0FF9B9C2BF8A36493937C6@deeres07.ebgroup.elektrobit.com>
MIME-Version: 1.0
In-Reply-To: <81B0EC78FE09F04E8E0FF9B9C2BF8A36493937C6@deeres07.ebgroup.elektrobit.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: Problem with module.bbclass
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
X-List-Received-Date: Fri, 22 May 2015 05:32:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Steffen.Pankratz@elektrobit.com <Steffen.Pankratz@elektrobit.com> [150521 16:14]:

> > -----Original Message-----
> > From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
> > Sent: Thursday, May 21, 2015 3:54 PM
> > To: Pankratz, Steffen
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] Problem with module.bbclass

>  HiPaul,

> > > I am using
> > > http://git.openembedded.org/openembedded-
> > core/tree/meta/classes/module
> > > .bbcl ass as a base for my recipe to compile a kernel module outside
> > > of the kernel tree.

> > > This is my recipe:

> > > DESCRIPTION = "Nouveau kernel module"
> > > SECTION = "kernel/modules"
> > > LICENSE = "CLOSED" #fixme
> > > PR = "r0"
> > > SRC_URI =
> > "git://github.com/Gnurou/nouveau;protocol=https;branch=staging"
> > > SRCREV = "c256f9450c613cd5075fc8c4a407686925041487"
> > > S = "${WORKDIR}/git/drm/nouveau"
> > > inherit module

> > > Naively, I hoped that would work out of the box. Of course it did not
> > > :) and
> > every compiler call resulted in an error message like this:
> > > | make: *** [lib/nvif/notify.o] Error 1 In file included from
> > > | ./lib/include/nvif/os.h:32:0,

> > > |                  from ./drm/nouveau/include/nvif/object.h:4,
> > > |                  from ./drm/nouveau/include/nvif/device.h:4,

> > > |                  from drm/nouveau/nvif/device.c:25:
> > > | /home/vagrant/repos/tk1/build/tmp/sysroots/x86_64-
> > linux/usr/lib/arm-
> > > | poky-l
> > > | inux-gnueabi/gcc/arm-poky-linux-gnueabi/4.9.2/include/stdint.h:9:26:
> > > | fatal
> > > | error: stdint.h: No such file or directory|  # include_next
> > > | <stdint.h>

> > > |                           ^

> > > | compilation terminated.

> > > I could resolve that issue by adding the following line to my recipe:

> > > EXTRA_OEMAKE='-C "${STAGING_KERNEL_DIR}"'

> > > And another problem I had faced was that using:

> > > S = "${WORKDIR}/git/drm/nouveau"

> > > Compiled all kernel modules inside the kernel tree, instead only the
> > > nouveau kernel module.

> > > I could solve that as well and finally I ended up with:

> > > EXTRA_OEMAKE='-C "${STAGING_KERNEL_DIR}" M="${S}"/drm/nouveau/'

> > > Now, I am not sure if I am doing something wrong or if there maybe is
> > > a problem with module.bbclass.

> > The original message makes it sound like the makefile for the module isn't
> > using CC but instead calling gcc directly, and thus not getting the --sysroot
> > option passed in - is that possible?

> Not sure, but for me the makefile looks good.
> Here is the code of the nouveau kernel module I am using in my recipe:

> https://github.com/Gnurou/nouveau

Well, after only a quick glance at that repo, it seems that the toplevel
Makefile isn't concerned with building a kernel module. Instead it
builds binaries and libraries (user-space). Thus, module.bbclass isn't
really suited for that part.

OTOH, the kernel module is in the drm directory. However, that Makefile
uses LINUX_DIR to find the kernel's Makefile, and LINUX_DIR isn't
exported by module.bbclass. To build this module, you should ensure that
you cd into the directory, and you also need to set (at least)
EXTRA_OEMAKE += "LINUX_DIR=${STAGING_KERNEL_DIR}"

Cheers,
Anders


-- 
Anders Darander
ChargeStorm AB / eStorm AB

