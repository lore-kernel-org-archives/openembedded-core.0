Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 49E6178220
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 19:40:56 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id z11so81295pfk.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 12:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lAuP74SnbJO3+6lBlmUSF6j8jRHo0GRzOabbmJ5xeWs=;
	b=izmvxNJK5dxvBc9YxRL6nuqWKC298eGww/NCXwAy+7IdYsEru50sXOHvL8QlYGQJ/K
	7rIQAxhO3kjtw9p6ZdyEBg2U33pXVmuBRHtQQLD924/+R7fGMPQgLaIyof/sDDuV4LhY
	CBr2IEB7wMr7UGQbjqiPy4BEPhFqbh7u3km8Zyoq9auCV1oukPW8tHuLWr/8n5cIAsLy
	HqFW0eBdV6ONyc9QRE5t5G8CJG3U+jeut8P7opPAUgvc/PnGwtADEOJnSwer7E0uNAeP
	nVDHSHjnF0eqSivh9U62VbIWsD2nq3FWoV+CJ6a56NRFO0OvEgugLTgoKNd2wi3d+VTG
	hBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lAuP74SnbJO3+6lBlmUSF6j8jRHo0GRzOabbmJ5xeWs=;
	b=r+sPYMZRxFoe2sz1eiCoh+7CKc0kdI7dK7JeG2STbVhkkSlUTXzfSiSdgKNBLNUL77
	utkGDVsTdc2fjsqgjqHPWrhGFgf7wizkDDkh/KJVFpzXiZhUdjEb0C6+D/jNs4aWDkv8
	NbiO0SICyiJBjFIfl6jz8TD4iw9Zpf4sUiWnov5rWY0xpyMff1dzMOexyRDgJJDvu5Ly
	JzYvUvD4Uwr8Ouq723/Bl0XbqFUMbwAS4OihkiQTZtyVwbWyk3b93Be8NQZhp5nlhp8n
	SazK1hCeMmzsUBjWFvtOmgI709K4XwktpdPTj3PS/tunGJ1BXRrSiggPHm2E28JRXe2/
	v8mg==
X-Gm-Message-State: AMCzsaWzVECJ8emPA2mrS0XAOcTBGdjQ8LJ3Qx/cHt5oKL8FD+kdIomK
	DF7dVKCEC7tyBRDby8forCmdxji5FFi0/0pUPAg=
X-Google-Smtp-Source: ABhQp+Sv7Zn/kk7qU/a4p8o0bjuxialulAmlchI3XsuPswIQxx/pGnoQXfwo0PsECHtxvO0cV3eoa/hbF2ZX7xPvWDQ=
X-Received: by 10.98.150.149 with SMTP id s21mr3170278pfk.151.1509478857532;
	Tue, 31 Oct 2017 12:40:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Tue, 31 Oct 2017 12:40:27 -0700 (PDT)
In-Reply-To: <c9abce5faf047aedd2560cb54b3807aebf5193b5.1509434339.git.jackie.huang@windriver.com>
References: <cover.1509434339.git.jackie.huang@windriver.com>
	<c9abce5faf047aedd2560cb54b3807aebf5193b5.1509434339.git.jackie.huang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 Oct 2017 12:40:27 -0700
Message-ID: <CAMKF1sqmihKMW4qA9Xzu9xDq6KNna1TNyjDmWTYbdYWpu08ieA@mail.gmail.com>
To: jhuang0 <jackie.huang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] glibc: re-package for libnss-db
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
X-List-Received-Date: Tue, 31 Oct 2017 19:40:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 31, 2017 at 12:20 AM,  <jackie.huang@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> On other distros like ubuntu/centos, libnss-db usually provides:
> - The libraries
> - The Makefile to create database
>   (in /var/db for centos, /var/lib/misc/ for ubuntu)
> - The makedb command (it's in glibc-common for centos7)
>
> What we had is:
> - The libraries are in glibc-extra-nss
> - The Makefile is removed
> - The makedb command is in glibc-utils (lack of dependency)
>
> So when glibc-extra-nss is installed but glibc-utils is not,
> we see error like:
> nscd[165]: 165 checking for monitored file `/var/db/group.db': No such file or directory
> nscd[165]: 165 checking for monitored file `/var/db/passwd.db': No such file or directory
>
> And there is not an easy way to create these databases.
>
> To fix the issue:
> - Re-package the libraries into libnss-db
> - Don't remove the Makefile and add it in libnss-db
> - Add RDEPENDS for libnss-db on glibc-utils and make
>

this looks ok although, changing glibc packaging is a bit thorny for
external toolchains and
other libraries. Would be better if this was added to commit saying
that they have yet another
package that they need to provide if replacing glibc from core.

> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc-package.inc | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
> index df3db2cc45..1c3782dbb0 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -1,6 +1,6 @@
>  INHIBIT_SYSROOT_STRIP = "1"
>
> -PACKAGES = "${PN}-dbg catchsegv sln nscd ldd tzcode glibc-thread-db ${PN}-pic libcidn libmemusage libsegfault ${PN}-pcprofile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc"
> +PACKAGES = "${PN}-dbg catchsegv sln nscd ldd tzcode glibc-thread-db ${PN}-pic libcidn libmemusage libnss-db libsegfault ${PN}-pcprofile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc"
>
>  # The ld.so in this glibc supports the GNU_HASH
>  RPROVIDES_${PN} = "eglibc rtld(GNU_HASH)"
> @@ -23,6 +23,8 @@ FILES_ldd = "${bindir}/ldd"
>  FILES_libsegfault = "${base_libdir}/libSegFault*"
>  FILES_libcidn = "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so.*"
>  FILES_libmemusage = "${base_libdir}/libmemusage.so"
> +FILES_libnss-db = "${base_libdir}/libnss_db.so.* ${base_libdir}/libnss_db-*.so ${localstatedir}/db/Makefile"
> +RDEPENDS_libnss-db = "${PN}-utils make"
>  FILES_glibc-extra-nss = "${base_libdir}/libnss_*-*.so ${base_libdir}/libnss_*.so.*"
>  FILES_sln = "${base_sbindir}/sln"
>  FILES_${PN}-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/*.o"
> @@ -59,7 +61,6 @@ inherit libc-common multilib_header
>
>  do_install_append () {
>         rm -f ${D}${sysconfdir}/localtime
> -       rm -rf ${D}${localstatedir}
>
>         # remove empty glibc dir
>         if [ -d ${D}${libexecdir} ]; then
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

