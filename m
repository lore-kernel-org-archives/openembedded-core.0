Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4265D7C690
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 08:27:51 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id d14so6808301ljl.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2019 00:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tNTi7ldIk7yfNU6x4QnCcJeF0yZXyE1+jUkIsNuIO1c=;
	b=S4lGHnonO9aVnkwt1JI863QEg5dge74aPl5K8FMxzLChAeGFXgOyazRHTNpzgZ+u+s
	QPvPJFD3bo4o+DXXLxJ7pXhigkPT92XB6cDcGNCLAP+uEfgPanmQm/9h4hJibTvFmTfK
	5gEvMZYo/PmpaBgDaVcRXzflAetn1iB5evpZAEGB6MUFQh1/B5LzF3uUeaodqWqoNUaG
	hKdQIN+Znb6Dz+fxnLDM8ISgGVhyacBbW7JvutwVlXNBBTV8VO64tlZgzuOucJUcfcav
	xsFHBU3SB8bH8VTq3ihz98J4J5PTsIwrJhOGQLWaVshX7uj8AEKVPG9uzZhptr36jQrq
	AmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tNTi7ldIk7yfNU6x4QnCcJeF0yZXyE1+jUkIsNuIO1c=;
	b=WCLYd3Wd8UNRE5C1cHwh7ywWb0aUNgX86z49MNRSuUF4o5LKpybAr8nacc+P00SUy9
	HIbRv5UWczwhA3ugkSWZkWlwaH+iEI5xFF4GS4Sy03jSuV97R5abCz7JjcelyrA47QVc
	VUlKvmouoMBKngVaN8yzqH5GQGsMSgk59+5OiW4YnMUs8iDGhumFOAaIeeyGYT/F9llC
	96oRA+AZixtw05e0ZBQfVLNi2fAMLIL1xTziGmBUDcBTosMMS4oCA1HoTfR5tawCgRQX
	BHXpCs/WxZBilVWKgjjLTOzZmYO0d9MVWCyS7j/1DKX/cHK+TYXpLy23uwpjRI7el9KP
	YcBQ==
X-Gm-Message-State: APjAAAXrcSWR8MB7KnqIyO6lRl5xfIyaYmEzp5hin9aq9elX6HsY58+7
	gBRCIOzLdD/4gUgWwy9IAa5MgQulJFYzwx9omVc=
X-Google-Smtp-Source: APXvYqwPHIAqxFHEnItodtmEIkuApZEy/IQs+WoQNBBc57GjcO2t1O7bIf/guwjcWHtHk6RTw6hUMJvjxlOhCDTzW3I=
X-Received: by 2002:a2e:9a95:: with SMTP id p21mr12163307lji.127.1551774471416;
	Tue, 05 Mar 2019 00:27:51 -0800 (PST)
MIME-Version: 1.0
References: <CAPybu_1GLgMMBysaCD0GDiPSmJr6jEqVptzX6+DQmU7ZBOigMA@mail.gmail.com>
	<d104283b569d34efec7502fe4ade89c34f2ba3c9.camel@linuxfoundation.org>
In-Reply-To: <d104283b569d34efec7502fe4ade89c34f2ba3c9.camel@linuxfoundation.org>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 5 Mar 2019 09:27:35 +0100
Message-ID: <CAPybu_0YHNMucF1LPdYNRAWdBChAfZHpb1B-PdDRC2enGmGsSw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Daniel Gomez <daniel@qtec.com>,
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
X-List-Received-Date: Tue, 05 Mar 2019 08:27:51 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

Thanks for your reply!

I tried with the following:

INSANE_SKIP_${PN} = "already-stripped"
INSANE_SKIP_libegl-tegra = "ldflags dev-so"
INSANE_SKIP_libgles1-tegra = "ldflags dev-so"
INSANE_SKIP_libgles2-tegra = "ldflags"
INSANE_SKIP_libgl-tegra = "ldflags dev-so textrel"

RREPLACES_libgl-tegra = "libgl-mesa"
RREPLACES_libegl-tegra = "libegl-mesa"
RREPLACES_libgles1-tegra = "libgles1-mesa"
RREPLACES_libgles2-tegra = "libgles2-mesa"

RCONFLICTS_libgl-tegra = "libgl-mesa"
RCONFLICTS_libegl-tegra = "libegl-mesa"
RCONFLICTS_libgles1-tegra = "libgles1-mesa"
RCONFLICTS_libgles2-tegra = "libgles2-mesa"

RPROVIDES_libgl-tegra += "gl-proprietary libgl libgl-mesa"
RPROVIDES_libegl-tegra += "libegl libegl-mesa"
RPROVIDES_libgles2-tegra += "libgles2 libgles2-tegra"
RPROVIDES_libgles1-tegra += "libgles1 libgles1-tegra"

But then do_rootfs fails:

The following packages have unmet dependencies:
 mesa-demos : Depends: libegl-mesa (>= 18.3.4+git0+b26488dead) but it
is not going to be installed
              Depends: libgl-mesa (>= 18.3.4+git0+b26488dead) but it
is not going to be installed
 qv4l2 : Depends: libgl-mesa (>= 18.3.4+git0+b26488dead) but it is not
going to be installed
         Depends: qtbase (>= 5.11.1+git0+74305ba470) but it is not
going to be installed


I am forcing the installation of libgl-tegra by making:

XSERVER += "gl-proprietary"

What am I doing wrong :)

Thanks!

On Sat, Mar 2, 2019 at 1:21 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2019-03-01 at 12:28 +0100, Ricardo Ribalda Delgado wrote:
> > Hello
> >
> > I have a build system that supports some aarch64 machines. For most
> > of
> > the them, the only difference is the kernel configuration, kernel
> > version.
> >
> > I am using multiconfig on my build server and the build goes really
> > fast thanks to all the shared binaries/artifacts.
> >
> > But I have a problem adding a new machine. This machine is also
> > aarch64, with a special kernel (nothing new here), but in this case
> > the vendor provides a binary .so for libgl that is required to get
> > hardware acceleation.
> >
> > I could .bbappend mesa and on the installation part replace libgl
> > with
> > the new .so. But then everything that depends on mesa needs to be
> > rebuilt for that machine and I could not use multiconfig.
> >
> > Instead I have created a new recipe: mesa-gl-replace.bb that has the
> > file. This breakes completely the design of OE, but works.
> >
> > Some snipsets of the "magic" to make it work:
> >
> > #Force that the version is allways higher than the one from mesa:
> > PE = "5"
> >
> > #Rprovide the same as mesa
> > RPROVIDES_libgl-mesa += "libgl"
> >
> > #Do not overwrite pkgdata of mesa
> > PACKAGEFUNCS_append = " rm_pkgdata_runtime"
> > rm_pkgdata_runtime() {
> > rm -rf ${WORKDIR}/pkgdata/runtime/*
> > rm -rf ${WORKDIR}/pkgdata/shlibs2/*
> > }
> >
> > #Keep this on machine
> > PACKAGE_ARCH = "${MACHINE_ARCH}"
> >
> > #Make sure we are not saved as providers for libgl
> > PRIVATE_LIBS = "libGL.so.1"
> >
> > #Avoid sanity checks
> > read_subpackage_metadata () {
> > }
> >
> >
> > If your eyes have not fallen as this point, this means you have a lot
> > of tolerance for crappy code, congrats :)
> >
> > Now the question. Is there a better way to do this?
>
> I'd probably let mesa build as normal but then add a recipe which
> RRPROVIDES, RREPLACES and RCONFLICTS with the specific mesa package you
> want to replace. It would create and equivalent package with the right
> contents and make it machine specific.
>
> There should be more variables like PRIVATE_LIBS which stop you having
> to use the more horrible hacks (INSANE_SKIP_*?).
>
> You might then only have the issue of ensuring this machine specific
> package gets installed into the images which need GL (or just install
> it in all images for that machine).
>
> Cheers,
>
> Richard
>


-- 
Ricardo Ribalda

