Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id D5F2D7C93F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 11:17:38 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id p17so6704901iol.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2019 03:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sfTdbE6IHUHNmY4+OuYVPrJQeNuHtY7dLrn6P+89uHY=;
	b=fehL1/SP0ORdiUkSJE9X0R6gNmmhPVYBQUlYawzBJh6s2LdRmiVvCNv7w4v40Bd210
	ckN+5n4KQH4V+xeuIGCqb9Xa9Bi0tQPInaGUD7qJrhTxNrcTI6pJhiwz+EEH+0KKeqbX
	zpnNktFqizov1Cy4H4oOj+uDCUQI0xDq/4r8XsG1rPddycGZ4dshcegxz06HeqsoNhh+
	2Wcq3M0hEJWt81WWXAu56nb74OD2kdzIdRSf/6U6rYK+xpel6gP+SAqXyfbiqR2LpPtE
	nkZjo3lNk7s2vrGkI4LQoWvJMzhlNbIkLmntqLKTHN+uiGyMsdXf8HigUkwrZdHza1Z+
	L5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sfTdbE6IHUHNmY4+OuYVPrJQeNuHtY7dLrn6P+89uHY=;
	b=b0KmYnr4j1ywkK9rdKFLeF2evW3Tus7mE8Ut/AitL60vBOM786SWwtlGkgUAdIGH9m
	LvLMn0YRYxYmESNzO4MVVBErSgEblvcRMVQQrdk7SCScU2Cp5tWYB7r7EtILwbjF8CCS
	Z71UPXMPg6pxHy03R/cxn7OFGmH6okEPNQWhn9440nYROp5ifui/rZIBSgWfT3bUERuf
	xfbHE40GamSAiuh0TOJpMkXSp2AVy5Z6CojoPPNyfzVcyIvV6hxX+9t/uZWDTjgnil4f
	ooXQzN/HRtV7weXSEQ4/1oHLjUCapHOFa8eMyMYbevDT6GjL37Fs9/upk8rc4ZpZak0J
	QqCA==
X-Gm-Message-State: APjAAAWQ4R5S4VW/J3CWRudpGJ14HSZiFfhtZBiV9SJ3DlxrJTPdgGOe
	a9lmqZRbFrQGwpwxyKysZhfxkXwo+CS3ZGxhV6mmmQ==
X-Google-Smtp-Source: APXvYqzY9MWCg2jT2ux5SJyXNY4ZsduvmWnCxztiSfvP/PtIhzxKxFhnY9d0upj66Yht9vIO/R4vCsoBrsMOwUCLBS0=
X-Received: by 2002:a5d:818d:: with SMTP id u13mr12143581ion.20.1551784659818; 
	Tue, 05 Mar 2019 03:17:39 -0800 (PST)
MIME-Version: 1.0
References: <CAPybu_1GLgMMBysaCD0GDiPSmJr6jEqVptzX6+DQmU7ZBOigMA@mail.gmail.com>
	<CAJTo0LYEFB4GyiyP=JK3vj2vFqzT1tzJiERKqezb9BO3N_K25g@mail.gmail.com>
	<CAPybu_2fbDkuM_kpX4ZbyPw8B8QfS2FEoCXSg1z7gFvfF=gyBg@mail.gmail.com>
	<CAJTo0LbXz_d+oNrHxrE2M3nOKeZh0C7-bz76OqHS0_zgkTHk6w@mail.gmail.com>
	<CAPybu_1hQXii8eaLk2fEhVaE7vbAQFBowBXtCjy+jKoNEYcmcQ@mail.gmail.com>
In-Reply-To: <CAPybu_1hQXii8eaLk2fEhVaE7vbAQFBowBXtCjy+jKoNEYcmcQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Mar 2019 11:17:28 +0000
Message-ID: <CAJTo0LYeACMpm83O82qgKju4SB_GrbxWYjc_szuRpt5cXCgi3A@mail.gmail.com>
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
X-List-Received-Date: Tue, 05 Mar 2019 11:17:39 -0000
Content-Type: text/plain; charset="UTF-8"

Isn't this something that https://github.com/madisongh/meta-tegra already does?

Ross

On Tue, 5 Mar 2019 at 11:10, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
>
> This is my approach (which is not more than a horrible hack)
>
> DESCRIPTION = "Tegra replacements for mesa libraries"
> require recipes-bsp/tegra-binaries/tegra-glvnd.inc
> RDEPENDS_libgl-mesa = "tegra-lib-common libegl-mesa libxcb-glx
> libxxf86vm libxdamage libxcb-xfixes"
> RDEPENDS_libegl-mesa = "zlib libxcb-xfixes libxcb-present libdrm
> libxshmfence libxcb-sync libglapi expat libxcb-dri2 libgbm libxcb-dri3
> libx11 libx11-xcb"
> RDEPENDS_libgles2-mesa = "libdrm libglapi"
> RDEPENDS_libgles1-mesa = "libdrm libglapi"
> RPROVIDES_libgl-mesa += "gl-proprietary libgl"
> RPROVIDES_libegl-mesa += "libegl"
> RPROVIDES_libgles2-mesa += "libgles2"
> RPROVIDES_libgles1-mesa += "libgles1"
> PV = "${L4T_RELEASE}"
> PE = "5"
> PACKAGES = "libgl-mesa libegl-mesa libgles2-mesa libgles1-mesa"
> L4T_GLVND_DIR = "${WORKDIR}/Linux_for_Tegra/libglvnd"
> L4T_GL_LIBRARIES = "${L4T_GLVND_DIR}/usr/lib/aarch64-linux-gnu/tegra"
> L4T_EGL_LIBRARIES = "${L4T_GLVND_DIR}/usr/lib/aarch64-linux-gnu/tegra-egl"
> do_unpack_append() {
>     bb.build.exec_func("unpack_l4t_tar", d)
> }
> unpack_l4t_tar() {
>     install -d ${L4T_GLVND_DIR}
>     tar -C ${L4T_GLVND_DIR} -x -f \
>     ${WORKDIR}/Linux_for_Tegra/nv_tegra/nvidia_drivers.tbz2 \
>     usr/lib/aarch64-linux-gnu/tegra \
>     usr/lib/aarch64-linux-gnu/tegra-egl
> }
> do_compile[noexec] = "1"
> PACKAGEFUNCS_append = " rm_pkgdata_runtime"
> rm_pkgdata_runtime() {
> rm -rf ${WORKDIR}/pkgdata/runtime/*
> rm -rf ${WORKDIR}/pkgdata/shlibs2/*
> }
> do_install() {
>     install -d ${D}${libdir}
>     # Install NVIDIA mesa libraries (libglvnd)
>     install -m755 ${L4T_GL_LIBRARIES}/libGL.so.1 ${D}${libdir}/libGL.so.1.2.0
>     install -m755 ${L4T_EGL_LIBRARIES}/libEGL.so.1 ${D}${libdir}/libEGL.so.1.0.0
>     install -m755 ${L4T_EGL_LIBRARIES}/libGLESv1_CM.so.1
> ${D}${libdir}/libGLESv1_CM.so.1.1.0
>     install -m755 ${L4T_EGL_LIBRARIES}/libGLESv2.so.2
> ${D}${libdir}/libGLESv2.so.2.0.0
>     ln -sf libGL.so.1.2.0 ${D}${libdir}/libGL.so.1
>     ln -sf libEGL.so.1.0.0 ${D}${libdir}/libEGL.so.1
>     ln -sf libGLESv1_CM.so.1.1.0 ${D}${libdir}/libGLESv1_CM.so.1
>     ln -sf libGLESv1_CM.so.1.1.0 ${D}${libdir}/libGLESv1_CM.so
>     ln -sf libGLESv2.so.2.0.0 ${D}${libdir}/libGLESv2.so.2
>     # Install extra NVIDIA libglvnd libraries
>     install -m755 ${L4T_GL_LIBRARIES}/libGLX.so.0 ${D}${libdir}/
>     install -m755 ${L4T_GL_LIBRARIES}/libGLdispatch.so.0 ${D}${libdir}/
>     ln -sf libGLX.so.0 ${D}${libdir}/libGLX.so
>     ln -sf libGLdispatch.so.0 ${D}${libdir}/libGLdispatch.so
>     # Install extra EGL NVIDIA libraries
>     install -m755 ${L4T_EGL_LIBRARIES}/libGLESv1_CM_nvidia.so.1 ${D}${libdir}/
>     install -m755 ${L4T_EGL_LIBRARIES}/libGLESv1_CM.so.1 ${D}${libdir}/
>     install -m755 ${L4T_EGL_LIBRARIES}/libGLESv2_nvidia.so.2 ${D}${libdir}/
>     # Install extra GL NVIDIA libraries
>     install -m755 ${L4T_GL_LIBRARIES}/libGLX_nvidia.so.0 ${D}${libdir}/
>     # Install libraries dependent on libglvnd libs
>     install -m755 ${L4T_EGL_LIBRARIES}/libEGL_nvidia.so.0 ${D}${libdir}/
>     install -m755 ${L4T_GL_LIBRARIES}/libnvidia-glsi.so.28.2.1 ${D}${libdir}/
>     install -m755 ${L4T_GL_LIBRARIES}/libnvbuf_utils.so.1.0.0 ${D}${libdir}/
>     ln -sf libnvbuf_utils.so.1.0.0 ${D}${libdir}/libnvbuf_utils.so.1
>     ln -sf libnvbuf_utils.so.1.0.0 ${D}${libdir}/libnvbuf_utils.so
>     install -m755 ${L4T_GL_LIBRARIES}/libnvddk_vic.so ${D}${libdir}/
>     install -m755 ${L4T_GL_LIBRARIES}/libnvddk_2d_v2.so ${D}${libdir}/
>     # nvcamera_daemon and argus_daemon have hard-coded path for this
>     install -d ${D}${nonarch_libdir}/aarch64-linux-gnu/tegra-egl
>     ln -sf ${libdir}/libEGL.so.1.0.0
> ${D}${nonarch_libdir}/aarch64-linux-gnu/tegra-egl/libEGL.so
> }
> PACKAGE_ARCH = "${MACHINE_ARCH}"
> FILES_libgles1-mesa += "\
>     ${libdir}/libGLESv1* \
> "
> FILES_libgles2-mesa += "\
>     ${libdir}/libGLESv2* \
> "
> FILES_libegl-mesa += "\
>     ${libdir}/libEGL* \
>     ${nonarch_libdir}/aarch64-linux-gnu/tegra-egl/libEGL.so \
> "
> FILES_libgl-mesa += "\
>     ${libdir}/libGL.* \
>     ${libdir}/libGLX* \
>     ${libdir}/libGLdispatch.so* \
>     ${libdir}/libnvidia-glsi.so.28.2.1 \
>     ${libdir}/libnvbuf_utils.so* \
>     ${libdir}/libnvddk_vic.so  \
>     ${libdir}/libnvddk_2d_v2.so \
> "
> INSANE_SKIP_${PN} = "already-stripped"
> INSANE_SKIP_libegl-mesa = "ldflags dev-so"
> INSANE_SKIP_libgles1-mesa = "ldflags dev-so"
> INSANE_SKIP_libgles2-mesa = "ldflags"
> INSANE_SKIP_libgl-mesa = "ldflags dev-so textrel"
> PRIVATE_LIBS = "libGL.so.1 libEGL.so.1 libGLESv2.so.2 libGLESv1_CM.so.1"
> read_subpackage_metadata () {
> }
>
>
> This is as Richard suggested:
>
> DESCRIPTION = "Tegra replacements for mesa libraries"
>
> require recipes-bsp/tegra-binaries/tegra-glvnd.inc
>
> RDEPENDS_libgl-tegra = "tegra-lib-common libegl-tegra libxcb-glx
> libxxf86vm libxdamage libxcb-xfixes"
> RDEPENDS_libegl-tegra = "zlib libxcb-xfixes libxcb-present libdrm
> libxshmfence libxcb-sync libglapi expat libxcb-dri2 libgbm libxcb-dri3
> libx11 libx11-xcb"
> RDEPENDS_libgles2-tegra = "libdrm libglapi"
> RDEPENDS_libgles1-tegra = "libdrm libglapi"
>
> PV = "${L4T_RELEASE}"
> PE = "5"
>
> PACKAGES = "libgl-tegra libegl-tegra libgles2-tegra libgles1-tegra"
>
> L4T_GLVND_DIR = "${WORKDIR}/Linux_for_Tegra/libglvnd"
> L4T_GL_LIBRARIES = "${L4T_GLVND_DIR}/usr/lib/aarch64-linux-gnu/tegra"
> L4T_EGL_LIBRARIES = "${L4T_GLVND_DIR}/usr/lib/aarch64-linux-gnu/tegra-egl"
>
> do_unpack_append() {
>     bb.build.exec_func("unpack_l4t_tar", d)
> }
>
> unpack_l4t_tar() {
>     install -d ${L4T_GLVND_DIR}
>     tar -C ${L4T_GLVND_DIR} -x -f \
>     ${WORKDIR}/Linux_for_Tegra/nv_tegra/nvidia_drivers.tbz2 \
>     usr/lib/aarch64-linux-gnu/tegra \
>     usr/lib/aarch64-linux-gnu/tegra-egl
> }
>
> do_compile[noexec] = "1"
>
> do_install() {
>     install -d ${D}${libdir}
>     # Install NVIDIA mesa libraries (libglvnd)
>     install -m755 ${L4T_GL_LIBRARIES}/libGL.so.1 ${D}${libdir}/libGL.so.1.2.0
>     install -m755 ${L4T_EGL_LIBRARIES}/libEGL.so.1 ${D}${libdir}/libEGL.so.1.0.0
>     install -m755 ${L4T_EGL_LIBRARIES}/libGLESv1_CM.so.1
> ${D}${libdir}/libGLESv1_CM.so.1.1.0
>     install -m755 ${L4T_EGL_LIBRARIES}/libGLESv2.so.2
> ${D}${libdir}/libGLESv2.so.2.0.0
>     ln -sf libGL.so.1.2.0 ${D}${libdir}/libGL.so.1
>     ln -sf libEGL.so.1.0.0 ${D}${libdir}/libEGL.so.1
>     ln -sf libGLESv1_CM.so.1.1.0 ${D}${libdir}/libGLESv1_CM.so.1
>     ln -sf libGLESv1_CM.so.1.1.0 ${D}${libdir}/libGLESv1_CM.so
>     ln -sf libGLESv2.so.2.0.0 ${D}${libdir}/libGLESv2.so.2
>
>     # Install extra NVIDIA libglvnd libraries
>     install -m755 ${L4T_GL_LIBRARIES}/libGLX.so.0 ${D}${libdir}/
>     install -m755 ${L4T_GL_LIBRARIES}/libGLdispatch.so.0 ${D}${libdir}/
>     ln -sf libGLX.so.0 ${D}${libdir}/libGLX.so
>     ln -sf libGLdispatch.so.0 ${D}${libdir}/libGLdispatch.so
>
>     # Install extra EGL NVIDIA libraries
>     install -m755 ${L4T_EGL_LIBRARIES}/libGLESv1_CM_nvidia.so.1 ${D}${libdir}/
>     install -m755 ${L4T_EGL_LIBRARIES}/libGLESv1_CM.so.1 ${D}${libdir}/
>     install -m755 ${L4T_EGL_LIBRARIES}/libGLESv2_nvidia.so.2 ${D}${libdir}/
>
>     # Install extra GL NVIDIA libraries
>     install -m755 ${L4T_GL_LIBRARIES}/libGLX_nvidia.so.0 ${D}${libdir}/
>
>     # Install libraries dependent on libglvnd libs
>     install -m755 ${L4T_EGL_LIBRARIES}/libEGL_nvidia.so.0 ${D}${libdir}/
>
>     install -m755 ${L4T_GL_LIBRARIES}/libnvidia-glsi.so.28.2.1 ${D}${libdir}/
>
>     install -m755 ${L4T_GL_LIBRARIES}/libnvbuf_utils.so.1.0.0 ${D}${libdir}/
>     ln -sf libnvbuf_utils.so.1.0.0 ${D}${libdir}/libnvbuf_utils.so.1
>     ln -sf libnvbuf_utils.so.1.0.0 ${D}${libdir}/libnvbuf_utils.so
>
>     install -m755 ${L4T_GL_LIBRARIES}/libnvddk_vic.so ${D}${libdir}/
>     install -m755 ${L4T_GL_LIBRARIES}/libnvddk_2d_v2.so ${D}${libdir}/
>
>     # nvcamera_daemon and argus_daemon have hard-coded path for this
>     install -d ${D}${nonarch_libdir}/aarch64-linux-gnu/tegra-egl
>     ln -sf ${libdir}/libEGL.so.1.0.0
> ${D}${nonarch_libdir}/aarch64-linux-gnu/tegra-egl/libEGL.so
> }
>
> PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> FILES_libgles1-tegra += "\
>     ${libdir}/libGLESv1* \
> "
>
> FILES_libgles2-tegra += "\
>     ${libdir}/libGLESv2* \
> "
>
> FILES_libegl-tegra += "\
>     ${libdir}/libEGL* \
>     ${nonarch_libdir}/aarch64-linux-gnu/tegra-egl/libEGL.so \
> "
>
> FILES_libgl-tegra += "\
>     ${libdir}/libGL.* \
>     ${libdir}/libGLX* \
>     ${libdir}/libGLdispatch.so* \
>     ${libdir}/libnvidia-glsi.so.28.2.1 \
>     ${libdir}/libnvbuf_utils.so* \
>     ${libdir}/libnvddk_vic.so  \
>     ${libdir}/libnvddk_2d_v2.so \
> "
>
> INSANE_SKIP_${PN} = "already-stripped"
> INSANE_SKIP_libegl-tegra = "ldflags dev-so"
> INSANE_SKIP_libgles1-tegra = "ldflags dev-so"
> INSANE_SKIP_libgles2-tegra = "ldflags"
> INSANE_SKIP_libgl-tegra = "ldflags dev-so textrel"
>
> RREPLACES_libgl-tegra = "libgl-mesa"
> RREPLACES_libegl-tegra = "libegl-mesa"
> RREPLACES_libgles1-tegra = "libgles1-mesa"
> RREPLACES_libgles2-tegra = "libgles2-mesa"
>
> RCONFLICTS_libgl-tegra = "libgl-mesa"
> RCONFLICTS_libegl-tegra = "libegl-mesa"
> RCONFLICTS_libgles1-tegra = "libgles1-mesa"
> RCONFLICTS_libgles2-tegra = "libgles2-mesa"
>
> RPROVIDES_libgl-tegra += "gl-proprietary libgl libgl-mesa"
> RPROVIDES_libegl-tegra += "libegl libegl-mesa"
> RPROVIDES_libgles2-tegra += "libgles2 libgles2-tegra"
> RPROVIDES_libgles1-tegra += "libgles1 libgles1-tegra"
>
>
> PRIVATE_LIBS = "libGL.so.1 libEGL.so.1 libGLESv2.so.2 libGLESv1_CM.so.1"
>
> On Tue, Mar 5, 2019 at 12:06 PM Burton, Ross <ross.burton@intel.com> wrote:
> >
> > That is horrible and they should be ashamed.  Can you share the
> > complete recipe, as this *should* be a fairly trivial switcharoony.
> >
> > Ross
> >
> > On Tue, 5 Mar 2019 at 11:00, Ricardo Ribalda Delgado
> > <ricardo.ribalda@gmail.com> wrote:
> > >
> > > HI Ross
> > > On Tue, Mar 5, 2019 at 11:58 AM Burton, Ross <ross.burton@intel.com> wrote:
> > > >
> > > > Does they literally just provide a libgl.so and no headers, etc?
> > >
> > > It provides:
> > >
> > > /usr/lib/libGL.so.1.2.0
> > > /usr/lib/libGL.so.1
> > >
> > >
> > > >
> > > > Ross
> > > >
> > > > On Fri, 1 Mar 2019 at 11:29, Ricardo Ribalda Delgado
> > > > <ricardo.ribalda@gmail.com> wrote:
> > > > >
> > > > > Hello
> > > > >
> > > > > I have a build system that supports some aarch64 machines. For most of
> > > > > the them, the only difference is the kernel configuration, kernel
> > > > > version.
> > > > >
> > > > > I am using multiconfig on my build server and the build goes really
> > > > > fast thanks to all the shared binaries/artifacts.
> > > > >
> > > > > But I have a problem adding a new machine. This machine is also
> > > > > aarch64, with a special kernel (nothing new here), but in this case
> > > > > the vendor provides a binary .so for libgl that is required to get
> > > > > hardware acceleation.
> > > > >
> > > > > I could .bbappend mesa and on the installation part replace libgl with
> > > > > the new .so. But then everything that depends on mesa needs to be
> > > > > rebuilt for that machine and I could not use multiconfig.
> > > > >
> > > > > Instead I have created a new recipe: mesa-gl-replace.bb that has the
> > > > > file. This breakes completely the design of OE, but works.
> > > > >
> > > > > Some snipsets of the "magic" to make it work:
> > > > >
> > > > > #Force that the version is allways higher than the one from mesa:
> > > > > PE = "5"
> > > > >
> > > > > #Rprovide the same as mesa
> > > > > RPROVIDES_libgl-mesa += "libgl"
> > > > >
> > > > > #Do not overwrite pkgdata of mesa
> > > > > PACKAGEFUNCS_append = " rm_pkgdata_runtime"
> > > > > rm_pkgdata_runtime() {
> > > > > rm -rf ${WORKDIR}/pkgdata/runtime/*
> > > > > rm -rf ${WORKDIR}/pkgdata/shlibs2/*
> > > > > }
> > > > >
> > > > > #Keep this on machine
> > > > > PACKAGE_ARCH = "${MACHINE_ARCH}"
> > > > >
> > > > > #Make sure we are not saved as providers for libgl
> > > > > PRIVATE_LIBS = "libGL.so.1"
> > > > >
> > > > > #Avoid sanity checks
> > > > > read_subpackage_metadata () {
> > > > > }
> > > > >
> > > > >
> > > > > If your eyes have not fallen as this point, this means you have a lot
> > > > > of tolerance for crappy code, congrats :)
> > > > >
> > > > > Now the question. Is there a better way to do this?
> > > > >
> > > > > PS: I already tried and failed with update_alternatives
> > > > >
> > > > >
> > > > > Best regards!
> > > > >
> > > > >
> > > > > --
> > > > > Ricardo Ribalda
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-core mailing list
> > > > > Openembedded-core@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >
> > >
> > >
> > > --
> > > Ricardo Ribalda
>
>
>
> --
> Ricardo Ribalda

