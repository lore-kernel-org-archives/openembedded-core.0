Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 601EB73D94
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 14:42:18 +0000 (UTC)
Received: by wgso17 with SMTP id o17so14181523wgs.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 May 2015 07:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=TQmMNrEzeRglDdrN7fY5yYRJCsgHMhtlnHzP2QuelWU=;
	b=tj2FRx/B/dczvjFjC3R+Dz2Lk6SutcTZTUo/6SaIPE5YjxsmOzgq3ZaE3S8jLfwL84
	lskl+u3mn0oDQziZBPaKEb51Nx2QLelMelUixFjOzYPK91AsKHEVFYp1lqU9FjGhXNqD
	sE714t5PvfgJ9O6GyU+D0o86tpWEnXM9P1QwZR6pRbPk8yOO9+i65hhy4uGtQfidEXoX
	fkZJghweoz7BUT0DnUM1UgFM6ldndaDJ1kWl6tFF3/MqLHp7aEYroAeE6sn9FMws8wuO
	2nZj2m1Jje8sRCCAdjv23Lt+VqjK2hN2Lv16yL8DQheZppvQPNWVGTRya/DRoirBfePv
	RjKw==
X-Received: by 10.194.78.49 with SMTP id y17mr63449601wjw.131.1430923339240;
	Wed, 06 May 2015 07:42:19 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id di7sm2471828wib.23.2015.05.06.07.42.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 May 2015 07:42:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 6 May 2015 16:42:41 +0200
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20150506144241.GA2067@jama>
References: <cover.1430443583.git.bruce.ashfield@windriver.com>
	<1430521154.18360.28.camel@linuxfoundation.org>
	<55440C90.5060605@windriver.com> <20150502081346.GD2366@jama>
	<55458D0D.6070904@windriver.com>
MIME-Version: 1.0
In-Reply-To: <55458D0D.6070904@windriver.com>
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
X-List-Received-Date: Wed, 06 May 2015 14:42:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 02, 2015 at 10:50:53PM -0400, Bruce Ashfield wrote:
> On 2015-05-02 4:13 AM, Martin Jansa wrote:
> > On Fri, May 01, 2015 at 07:30:24PM -0400, Bruce Ashfield wrote:
> >> On 2015-05-01 6:59 PM, Richard Purdie wrote:
> >>> On Thu, 2015-04-30 at 21:34 -0400, Bruce Ashfield wrote:
> >>>> Here is the latest consolidated pull request for the supported linux=
-yocto
> >>>> kernels.
> >>>>
> >>>>    - We have a refresh of the 3.14-rt support
> >>>>    - bluetooh configuration changes for common-pc/qemux86
> >>>>    - braswell BSP features and fixes
> >>>>    - Introduction of the 4.1-rc1 -dev kernel (and associated perf fi=
x).
> >>>> I've built and booted these on my local machines and qemu, and
> >>>> everything was sane.
> >
> > Does it fix the issue I've reported few days ago?
> > http://lists.openembedded.org/pipermail/openembedded-core/2015-April/10=
4344.html
>=20
> Nope. But one config warning is far down on the list when I'm
> trying to introduce new -stable's and an entire -dev kernel.
>=20
> I didn't forget about it, it'll just get done in priority order.

OK, now it fails completely in default qemux86 builds:

ERROR: Function failed: do_kernel_configme (log file is located at /home/je=
nkins/oe/world/shr-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/3.19.5+=
gitAUTOINC+7215fe4313_d5d30ba4d2-r0/temp/log.do_kernel_configme.1159)
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/qemux86-oe-linux/linux-yocto/3.19.5+gitAUTOINC+7215fe4313_d5d30ba4=
d2-r0/temp/log.do_kernel_configme.1159
Log data follows:
| DEBUG: Executing shell function do_kernel_configme
| NOTE: kernel configme
| [INFO] Configuring target/machine combo: "standard/qemux86"
| [INFO] collecting configs in .meta/meta-series
| [ERROR] frag /home/jenkins/oe/world/shr-core/tmp-glibc/work-shared/qemux8=
6/kernel-source/.meta/cfg/kernel-cache/bsp/common-pc/common-pc-drivers-32.c=
fg does not exist
| Error running the meta series for collecting config data
| config of "standard/qemux86" failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_kernel_configme (log file is located at /home/=
jenkins/oe/world/shr-core/tmp-glibc/work/qemux86-oe-linux/linux-yocto/3.19.=
5+gitAUTOINC+7215fe4313_d5d30ba4d2-r0/temp/log.do_kernel_configme.1159)
NOTE: recipe linux-yocto-3.19.5+gitAUTOINC+7215fe4313_d5d30ba4d2-r0: task d=
o_kernel_configme: Failed
ERROR: Task 30162 (/home/jenkins/oe/world/shr-core/openembedded-core/meta/r=
ecipes-kernel/linux/linux-yocto_3.19.bb, do_kernel_configme) failed with ex=
it code '1'

http://errors.yoctoproject.org/Errors/Details/10481/

> >>>> The -dev kernel obviously isn't something for deployment yet, but
> >>>> it builds, and forms the base for follow up config changes, features
> >>>> and development work. I built and booted core-image-kernel dev with
> >>>> the 4.1 changes in place.
> >>>
> >>> The autobuilder showed up this for an x32 build :/.
> >>
> >> Can one of the intel folks have a look at this ? I won't be able to get
> >> to it until Tuesday at the earliest.
> >>
> >> Bruce
> >>
> >>>
> >>> https://autobuilder.yoctoproject.org/main/builders/nightly-x32/builds=
/282/steps/BuildImages/logs/stdio
> >>>
> >>> Cheers,
> >>>
> >>> Richard
> >>>
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

