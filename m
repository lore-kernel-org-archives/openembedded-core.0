Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f42.google.com (mail-oa0-f42.google.com
	[209.85.219.42])
	by mail.openembedded.org (Postfix) with ESMTP id 78B376ABB2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2013 16:22:12 +0000 (UTC)
Received: by mail-oa0-f42.google.com with SMTP id j6so7428065oag.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2013 09:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=OdN7Yt2PDdNoqkblozgblCzDC5lbjVBkIko7TMbPSzE=;
	b=yuozMDmZpXbdteyUpTu21QVA7K5FS94hCCeHCelESRP4YJKE2QiMgmzIILFIpLfHx0
	Jy4CKKjae69p9Uty2giDXuOIArRgSwZPE91ipPYKPWyGJIYEixSj0qNsdDsmSjXkWuRm
	XYT4a9bqi1bC4h1xNwyZ0gItiwaNBxXZRZcC4SmbQCm6KG0w8hH7DRRBCicpctJ45WVg
	XDAxTi+8VEfhT+QUIVfeyzadsBqGnmgPEkgfqO6nkUx3T6+ah1dh1CuQosQP8DvDyaCs
	wqorRVlGdNGJpDmDPY8XD3T6HmuB0/CxSX/g/ZiPkOGQWtBPjMvst5BRp3Zj8Sn+l6xt
	JTJw==
MIME-Version: 1.0
X-Received: by 10.182.205.138 with SMTP id lg10mr15682677obc.6.1374337332698; 
	Sat, 20 Jul 2013 09:22:12 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.60.166 with HTTP; Sat, 20 Jul 2013 09:22:12 -0700 (PDT)
In-Reply-To: <51EAA660.7080905@linux.intel.com>
References: <51EAA660.7080905@linux.intel.com>
Date: Sat, 20 Jul 2013 13:22:12 -0300
X-Google-Sender-Auth: dfr-89P2acInW3y_tPCLpgvZwFw
Message-ID: <CAP9ODKpvuVXxNMK0KysV-beFy1KxypHVRK2TXq+c5GvsBTj6jw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Mesa issues in Freescale ARM Builds
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
X-List-Received-Date: Sat, 20 Jul 2013 16:22:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jul 20, 2013 at 12:01 PM, Saul Wold <sgw@linux.intel.com> wrote:
>
> Hi Jonathan, Martin, Freescale Folks:
>
> You both have been recently modifying the mesa recipes, it seems to have
> triggered some build failures on the nightly-fsl-arm  builds in master.  I
> am going to build MUT today with Jonathan's change, so we might have
> failures there also.
>
>> ERROR: Multiple .bb files are due to be built which each provide mesa
>> (/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/meta/recipes-graphics/mesa/mesa_git.bb
>> /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/meta/recipes-graphics/mesa/mesa_9.1.3.bb).
>>  This usually means one provides something the other doesn't and should.
>> ERROR: Multiple .bb files are due to be built which each provide
>> virtual/libgles1
>> (/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/meta/recipes-graphics/mesa/mesa_git.bb
>> /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/meta-fsl-arm/recipes-graphics/amd-gpu-x11-bin/amd-gpu-x11-bin-mx51_11.09.01.bb).
>>  This usually means one provides something the other doesn't and should.
>> ERROR: Multiple .bb files are due to be built which each provide
>> virtual/libgles2
>> (/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/meta/recipes-graphics/mesa/mesa_git.bb
>> /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/meta-fsl-arm/recipes-graphics/amd-gpu-x11-bin/amd-gpu-x11-bin-mx51_11.09.01.bb).
>>  This usually means one provides something the other doesn't and should.
>> ERROR: Multiple .bb files are due to be built which each provide
>> virtual/egl
>> (/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/meta/recipes-graphics/mesa/mesa_git.bb
>> /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/meta-fsl-arm/recipes-graphics/amd-gpu-x11-bin/amd-gpu-x11-bin-mx51_11.09.01.bb).
>>  This usually means one provides something the other doesn't and should.
>
>
> and
>
>> NOTE: recipe mesa-2_9.1.3-r0: task do_package_write_ipk: Started
>> NOTE: recipe mesa-2_9.1.3-r0: task do_package_write_rpm: Started
>> NOTE: recipe mesa-2_9.1.3-r0: task do_package_write_deb: Started
>> ERROR: Recipe mesa is trying to change PR from 'r0' to 'r9.0'. This will
>> cause do_package_write_* failures since the incorrect data will be used and
>> they will be unable to find the right workdir.
>> ERROR: Function failed: read_subpackage_metadata
>> ERROR: Recipe mesa is trying to change PR from 'r0' to 'r9.0'. This will
>> cause do_package_write_* failures since the incorrect data will be used and
>> they will be unable to find the right workdir.
>> ERROR: Function failed: read_subpackage_metadata
>> ERROR: Logfile of failure stored in:
>> /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/build/tmp/work/imx53qsb-poky-linux-gnueabi/mesa/2_9.1.3-r0/temp/log.do_package_write_ipk.14976
>> NOTE: recipe mesa-2_9.1.3-r0: task do_package_write_ipk: Failed
>> ERROR: Recipe mesa is trying to change PR from 'r0' to 'r9.0'. This will
>> cause do_package_write_* failures since the incorrect data will be used and
>> they will be unable to find the right workdir.
>> ERROR: Function failed: read_subpackage_metadata
>> ERROR: Logfile of failure stored in:
>> /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/build/tmp/work/imx53qsb-poky-linux-gnueabi/mesa/2_9.1.3-r0/temp/log.do_package_write_rpm.14930
>> NOTE: recipe mesa-2_9.1.3-r0: task do_package_write_rpm: Failed
>> ERROR: Task 3724
>> (/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/meta/recipes-graphics/mesa/mesa_9.1.3.bb,
>> do_package_write_rpm) failed with exit code '1'
>> ERROR: Task 3722
>> (/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/meta/recipes-graphics/mesa/mesa_9.1.3.bb,
>> do_package_write_ipk) failed with exit code '1'
>> ERROR: Logfile of failure stored in:
>> /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/build/tmp/work/imx53qsb-poky-linux-gnueabi/mesa/2_9.1.3-r0/temp/log.do_package_write_deb.14949
>> NOTE: recipe mesa-2_9.1.3-r0: task do_package_write_deb: Failed
>> ERROR: Task 3723
>> (/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-fsl-arm/build/meta/recipes-graphics/mesa/mesa_9.1.3.bb,
>> do_package_write_deb) failed with exit code '1'
>
>
> This is strange since it seems to be picking up the git recipe and the
> version one, maybe due to the above error.

I think I know what is going on.  I will give a try in a fix here and send.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

