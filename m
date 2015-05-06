Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id C43D560138
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 15:33:02 +0000 (UTC)
Received: by wgin8 with SMTP id n8so15859337wgi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 May 2015 08:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=z3VrLo/fm59qHFFw3Nm577BuuzEuVabHV/xGBWjuW4o=;
	b=n6Jzy8IPJG0UnGi8Trq/bT7hnWfAZJ3IF1lqM6/569MyIXHabyAH7XeVyN9ltQTJ81
	nZ+aA+Or/iKHd5/dtZBu6B96+AGOvIz+Psw1Sy5N9u2EsTa3Wej8fNe2K58uQ089ImXx
	aTgEodvCI0osIFrQBMyZVNQvDIz4kZOwiqRnXz+r8a5X4L4Mi7WMSotCAAvaT4DQjzU9
	oM/hWGAbxj5uGMgQSVoiWUHX3X6v2u63Z2G/cF42vbG1Oxr2mtMiZwQqqXkH+x0DBSoQ
	44T/lftc6wsIf1M5UVtVPxiPlXUlOZnRyc5n2/U1BAJsdcWN6K2O7uk20IuQyFoWL164
	xEAA==
X-Received: by 10.180.37.3 with SMTP id u3mr6059126wij.43.1430926383226;
	Wed, 06 May 2015 08:33:03 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id fw3sm2703591wib.5.2015.05.06.08.33.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 May 2015 08:33:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 6 May 2015 17:33:25 +0200
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20150506153325.GB2067@jama>
References: <cover.1430443583.git.bruce.ashfield@windriver.com>
	<1430521154.18360.28.camel@linuxfoundation.org>
	<55440C90.5060605@windriver.com> <20150502081346.GD2366@jama>
	<55458D0D.6070904@windriver.com> <20150506144241.GA2067@jama>
	<554A2C1C.5040304@windriver.com>
MIME-Version: 1.0
In-Reply-To: <554A2C1C.5040304@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] linux-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 06 May 2015 15:33:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2015 at 10:58:36AM -0400, Bruce Ashfield wrote:
> On 2015-05-06 10:42 AM, Martin Jansa wrote:
> > On Sat, May 02, 2015 at 10:50:53PM -0400, Bruce Ashfield wrote:
> >> On 2015-05-02 4:13 AM, Martin Jansa wrote:
> >>> On Fri, May 01, 2015 at 07:30:24PM -0400, Bruce Ashfield wrote:
> >>>> On 2015-05-01 6:59 PM, Richard Purdie wrote:
> >>>>> On Thu, 2015-04-30 at 21:34 -0400, Bruce Ashfield wrote:
> >>>>>> Here is the latest consolidated pull request for the supported lin=
ux-yocto
> >>>>>> kernels.
> >>>>>>
> >>>>>>     - We have a refresh of the 3.14-rt support
> >>>>>>     - bluetooh configuration changes for common-pc/qemux86
> >>>>>>     - braswell BSP features and fixes
> >>>>>>     - Introduction of the 4.1-rc1 -dev kernel (and associated perf=
 fix).
> >>>>>> I've built and booted these on my local machines and qemu, and
> >>>>>> everything was sane.
> >>>
> >>> Does it fix the issue I've reported few days ago?
> >>> http://lists.openembedded.org/pipermail/openembedded-core/2015-April/=
104344.html
> >>
> >> Nope. But one config warning is far down on the list when I'm
> >> trying to introduce new -stable's and an entire -dev kernel.
> >>
> >> I didn't forget about it, it'll just get done in priority order.
> >
> > OK, now it fails completely in default qemux86 builds:
> >
>=20
> At this point, all I can say is file a bug. My builds of the same
> board work, and the autobuilder show up green.
>=20
> That screams race condition, so I'll look into it from that angle.

I'm considering providing simple old-style recipes for vanilla kernels
and using them in my jenkins builds instead linux-yocto, because kernel
shouldn't block testing other recipes from meta-oe and other layers as
often as linux-yocto does.

> > ERROR: Function failed: do_kernel_configme (log file is located at /hom=
e/jenkins/oe/world/shr-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/3.1=
9.5+gitAUTOINC+7215fe4313_d5d30ba4d2-r0/temp/log.do_kernel_configme.1159)
> > ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tm=
p-glibc/work/qemux86-oe-linux/linux-yocto/3.19.5+gitAUTOINC+7215fe4313_d5d3=
0ba4d2-r0/temp/log.do_kernel_configme.1159
> > Log data follows:
> > | DEBUG: Executing shell function do_kernel_configme
> > | NOTE: kernel configme
> > | [INFO] Configuring target/machine combo: "standard/qemux86"
> > | [INFO] collecting configs in .meta/meta-series
> > | [ERROR] frag /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qe=
mux86/kernel-source/.meta/cfg/kernel-cache/bsp/common-pc/common-pc-drivers-=
32.cfg does not exist
> > | Error running the meta series for collecting config data
> > | config of "standard/qemux86" failed
> > | WARNING: exit code 1 from a shell command.
> > | ERROR: Function failed: do_kernel_configme (log file is located at /h=
ome/jenkins/oe/world/shr-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/3=
=2E19.5+gitAUTOINC+7215fe4313_d5d30ba4d2-r0/temp/log.do_kernel_configme.115=
9)
> > NOTE: recipe linux-yocto-3.19.5+gitAUTOINC+7215fe4313_d5d30ba4d2-r0: ta=
sk do_kernel_configme: Failed
> > ERROR: Task 30162 (/home/jenkins/oe/world/shr-core/openembedded-core/me=
ta/recipes-kernel/linux/linux-yocto_3.19.bb, do_kernel_configme) failed wit=
h exit code '1'
> >
> > http://errors.yoctoproject.org/Errors/Details/10481/
> >
> >>>>>> The -dev kernel obviously isn't something for deployment yet, but
> >>>>>> it builds, and forms the base for follow up config changes, featur=
es
> >>>>>> and development work. I built and booted core-image-kernel dev with
> >>>>>> the 4.1 changes in place.
> >>>>>
> >>>>> The autobuilder showed up this for an x32 build :/.
> >>>>
> >>>> Can one of the intel folks have a look at this ? I won't be able to =
get
> >>>> to it until Tuesday at the earliest.
> >>>>
> >>>> Bruce
> >>>>
> >>>>>
> >>>>> https://autobuilder.yoctoproject.org/main/builders/nightly-x32/buil=
ds/282/steps/BuildImages/logs/stdio
> >>>>>
> >>>>> Cheers,
> >>>>>
> >>>>> Richard
> >>>>>
> >>>>
> >>>> --
> >>>> _______________________________________________
> >>>> Openembedded-core mailing list
> >>>> Openembedded-core@lists.openembedded.org
> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>>
> >>
> >
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

