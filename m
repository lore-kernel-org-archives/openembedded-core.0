Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0AF287C93F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 10:58:31 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id k21so6663207ior.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2019 02:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=w/KVZsSOfcnqcPvP2at3b6M0PuxRB23GoMCd2BK+f8g=;
	b=KAR3DRmA1D9vPCZAFk+Fac5WCvilGnFYw0/7MQ5Ko15KZq4gMzOszJ9eFANsR4OQsT
	Mycmtn2xC0xw7RDMWzesvGbmrP9aNJK9jVya02MNyjmzvkwSot+qLQgM9LHtNyTgAs69
	bjrmlH3dSu36UVVEzIab4/K89hdBRPrRYw7xELfGnit2mmUIxvzIHuTIiQtoQxZAXTVK
	Q5mI8tvSg/BMYj6Buqsl2ei1PZS5ns1yT38wKILcCVO9iRGQgn/so3fVuki8ffOYLMEn
	18oDhrtFtrQnhTlaK3IbgLOBqtoXdKSZykPeaoi3Hs9OnaeACBinNO0MFBU3dToyrQSv
	ZLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=w/KVZsSOfcnqcPvP2at3b6M0PuxRB23GoMCd2BK+f8g=;
	b=tJc3a6FHKECryUin3YFmWVAYQhFUeUulo/ffUKan3zST0QQmJl9v4nWpgHjS/UeTtU
	nRO4XNBabdOsocJf8M2DNPC+pziLakxP7+Yk9AEjcoNRrWq91Lqu4w6VtV1EBTLO3qxB
	D3wngCqlF/SzaC9HvWgm65J0W/WZJovaj5p/SnWZ5ATIOgUDP++EpSngeAbLGlSLiBvE
	ilkWgnku3yLibjxEbD9RTmZdN8A/BJ+kx5w6QeE6MjfN6Jgt7X+9ErP7XKURiFGxaAzZ
	49cDctDfwKvVahqMh8+OoDZikZR4JXVj/DKiVRFjgdst4y7v+DtZ9h7/bQoeQ+ka2EDC
	h67g==
X-Gm-Message-State: APjAAAW/RveAL3kt65d97FffYetf/Wlv494q0YpzaYHwnVrVRw9sNdCE
	FmPs45MB4njOLsRLF5d11TNVvXyqU47mIwNSQSmcCg==
X-Google-Smtp-Source: APXvYqzIFAMbdOZad9dKo59NbWIsKxsH/j1NE0vSSGoWxWgJ+SyJX3NmTLAnW8PgHLExk9fXlAGaP0sun8xSkOBHdYc=
X-Received: by 2002:a5d:818d:: with SMTP id u13mr12103150ion.20.1551783513020; 
	Tue, 05 Mar 2019 02:58:33 -0800 (PST)
MIME-Version: 1.0
References: <CAPybu_1GLgMMBysaCD0GDiPSmJr6jEqVptzX6+DQmU7ZBOigMA@mail.gmail.com>
In-Reply-To: <CAPybu_1GLgMMBysaCD0GDiPSmJr6jEqVptzX6+DQmU7ZBOigMA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Mar 2019 10:58:21 +0000
Message-ID: <CAJTo0LYEFB4GyiyP=JK3vj2vFqzT1tzJiERKqezb9BO3N_K25g@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Daniel Gomez <daniel@qtec.com>,
	bitbake-devel <bitbake-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Two recipes providing the same .so... How it should not be done :)
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
X-List-Received-Date: Tue, 05 Mar 2019 10:58:32 -0000
Content-Type: text/plain; charset="UTF-8"

Does they literally just provide a libgl.so and no headers, etc?

Ross

On Fri, 1 Mar 2019 at 11:29, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
>
> Hello
>
> I have a build system that supports some aarch64 machines. For most of
> the them, the only difference is the kernel configuration, kernel
> version.
>
> I am using multiconfig on my build server and the build goes really
> fast thanks to all the shared binaries/artifacts.
>
> But I have a problem adding a new machine. This machine is also
> aarch64, with a special kernel (nothing new here), but in this case
> the vendor provides a binary .so for libgl that is required to get
> hardware acceleation.
>
> I could .bbappend mesa and on the installation part replace libgl with
> the new .so. But then everything that depends on mesa needs to be
> rebuilt for that machine and I could not use multiconfig.
>
> Instead I have created a new recipe: mesa-gl-replace.bb that has the
> file. This breakes completely the design of OE, but works.
>
> Some snipsets of the "magic" to make it work:
>
> #Force that the version is allways higher than the one from mesa:
> PE = "5"
>
> #Rprovide the same as mesa
> RPROVIDES_libgl-mesa += "libgl"
>
> #Do not overwrite pkgdata of mesa
> PACKAGEFUNCS_append = " rm_pkgdata_runtime"
> rm_pkgdata_runtime() {
> rm -rf ${WORKDIR}/pkgdata/runtime/*
> rm -rf ${WORKDIR}/pkgdata/shlibs2/*
> }
>
> #Keep this on machine
> PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> #Make sure we are not saved as providers for libgl
> PRIVATE_LIBS = "libGL.so.1"
>
> #Avoid sanity checks
> read_subpackage_metadata () {
> }
>
>
> If your eyes have not fallen as this point, this means you have a lot
> of tolerance for crappy code, congrats :)
>
> Now the question. Is there a better way to do this?
>
> PS: I already tried and failed with update_alternatives
>
>
> Best regards!
>
>
> --
> Ricardo Ribalda
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

