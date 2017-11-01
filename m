Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id C5A816011A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Nov 2017 08:35:17 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id n14so1406675pfh.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Nov 2017 01:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wrmJZmTEk0HqXr4SzIkIdVGM2vPhFrR7hoEnOGEDLAw=;
	b=h3nIRTVsscZ7nhw7zeOtr4eNR/MV9L6xj0UtG7UGyR/iUSg2CW6UpPVhrmk2HI60zC
	jSH9R3jYOwFekimmK/7qOV2L/xRexNUdzac9qpY/htvKSlmRRo1fElUyQinKu+xJaoMV
	KmfslLpdyOp8r+mDLdcF9574aDgzZ5ty6BgXtkgSAiv7ckdJB00JCviG+pG30ZlUYo2Q
	HRqXCDPoyIrMB4zE9l0Y1RnK/c01O7uxqCpwf44a/V00ypWSaxwlqftAFIA20rXaFoGm
	VbDk3rwNZKNzWWwLQqtrKLrwYsm0TU5h/CtnPXfJHF9/HqsKW6xZvi7m8yMPOSKZQnpl
	ts1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wrmJZmTEk0HqXr4SzIkIdVGM2vPhFrR7hoEnOGEDLAw=;
	b=dLnB7DrLkmuSQcP0ykF5ses90WnagWHWS01FrDEE4pdh0Rf2/KsHu1ODBiiLXv8VE+
	o4xuOH5fv+0Nd+svYRqtFqyQ4WJIwRo1M7QMR3UCOYdzybbB4ackDR8DMTf6OxNp65b1
	KEnFUOcsRnEP2rNrhArM6fX5qyNGX9jysQzjpWziuOWGkh8Y4+CtEl49l4dOtTRQi2ll
	g7msoKMl/IrAqxB6ckTorT15LT2cJVUrdJtzPMJSdVivS0Xcm75WoAgTD7ruQF6L0nyz
	Df/jcObNM8T5tkGJHHaxJes4EbRfcMw4oBHwWGiZsz3lBaFYi4chzLrIwhV4Qc1EL9fX
	HRUw==
X-Gm-Message-State: AMCzsaVIplzF7g/8UHfyJfzVOVzr0P0GYgKnN7EgPTxk33GmoxNru0j8
	MWtCpTgztIMV9YvcBISuQJJWhtnxoR7JRuNjxPk=
X-Google-Smtp-Source: ABhQp+RsqUXnOI9T1tkT8u/AxpmHC7hnqNyxE10GrNrzIk1VH/zFj0oqCwDgwqa4oh32sfAVMXf3cb1ax+jxrrh9CEE=
X-Received: by 10.99.154.66 with SMTP id e2mr3432942pgo.287.1509525318803;
	Wed, 01 Nov 2017 01:35:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Wed, 1 Nov 2017 01:34:47 -0700 (PDT)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA014B8FD2A2@ALA-MBC.corp.ad.wrs.com>
References: <cover.1509434339.git.jackie.huang@windriver.com>
	<c9abce5faf047aedd2560cb54b3807aebf5193b5.1509434339.git.jackie.huang@windriver.com>
	<CAMKF1sqmihKMW4qA9Xzu9xDq6KNna1TNyjDmWTYbdYWpu08ieA@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA014B8FD2A2@ALA-MBC.corp.ad.wrs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Nov 2017 01:34:47 -0700
Message-ID: <CAMKF1srYqLqx6nJhDstCtL4Wq+fntEZpYa_SKYwvtsEQLxWCFQ@mail.gmail.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
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
X-List-Received-Date: Wed, 01 Nov 2017 08:35:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 31, 2017 at 7:03 PM, Huang, Jie (Jackie)
<Jackie.Huang@windriver.com> wrote:
>
>
>> -----Original Message-----
>> From: Khem Raj [mailto:raj.khem@gmail.com]
>> Sent: Wednesday, November 01, 2017 03:40
>> To: Huang, Jie (Jackie)
>> Cc: Patches and discussions about the oe-core layer
>> Subject: Re: [OE-core] [PATCH 1/2] glibc: re-package for libnss-db
>>
>> On Tue, Oct 31, 2017 at 12:20 AM,  <jackie.huang@windriver.com> wrote:
>> > From: Jackie Huang <jackie.huang@windriver.com>
>> >
>> > On other distros like ubuntu/centos, libnss-db usually provides:
>> > - The libraries
>> > - The Makefile to create database
>> >   (in /var/db for centos, /var/lib/misc/ for ubuntu)
>> > - The makedb command (it's in glibc-common for centos7)
>> >
>> > What we had is:
>> > - The libraries are in glibc-extra-nss
>> > - The Makefile is removed
>> > - The makedb command is in glibc-utils (lack of dependency)
>> >
>> > So when glibc-extra-nss is installed but glibc-utils is not,
>> > we see error like:
>> > nscd[165]: 165 checking for monitored file `/var/db/group.db': No such file or
>> directory
>> > nscd[165]: 165 checking for monitored file `/var/db/passwd.db': No such file
>> or directory
>> >
>> > And there is not an easy way to create these databases.
>> >
>> > To fix the issue:
>> > - Re-package the libraries into libnss-db
>> > - Don't remove the Makefile and add it in libnss-db
>> > - Add RDEPENDS for libnss-db on glibc-utils and make
>> >
>>
>> this looks ok although, changing glibc packaging is a bit thorny for
>> external toolchains and
>> other libraries. Would be better if this was added to commit saying
>> that they have yet another
>> package that they need to provide if replacing glibc from core.
>
> Sorry I'm not sure I understand correctly, did you mean I just need to add
> words in the commit message like the following?
>
> "For external toolchain, an extra package 'libnss-db' need to be provided If replacing glibc from core."
>

yes, someway for folks to notice the change for external layer maintainers.

> Thanks,
> Jackie
>
>>
>> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> > ---
>> >  meta/recipes-core/glibc/glibc-package.inc | 5 +++--
>> >  1 file changed, 3 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-
>> core/glibc/glibc-package.inc
>> > index df3db2cc45..1c3782dbb0 100644
>> > --- a/meta/recipes-core/glibc/glibc-package.inc
>> > +++ b/meta/recipes-core/glibc/glibc-package.inc
>> > @@ -1,6 +1,6 @@
>> >  INHIBIT_SYSROOT_STRIP = "1"
>> >
>> > -PACKAGES = "${PN}-dbg catchsegv sln nscd ldd tzcode glibc-thread-db ${PN}-
>> pic libcidn libmemusage libsegfault ${PN}-pcprofile libsotruss ${PN} ${PN}-utils
>> glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc"
>> > +PACKAGES = "${PN}-dbg catchsegv sln nscd ldd tzcode glibc-thread-db ${PN}-
>> pic libcidn libmemusage libnss-db libsegfault ${PN}-pcprofile libsotruss ${PN}
>> ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc"
>> >
>> >  # The ld.so in this glibc supports the GNU_HASH
>> >  RPROVIDES_${PN} = "eglibc rtld(GNU_HASH)"
>> > @@ -23,6 +23,8 @@ FILES_ldd = "${bindir}/ldd"
>> >  FILES_libsegfault = "${base_libdir}/libSegFault*"
>> >  FILES_libcidn = "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so.*"
>> >  FILES_libmemusage = "${base_libdir}/libmemusage.so"
>> > +FILES_libnss-db = "${base_libdir}/libnss_db.so.* ${base_libdir}/libnss_db-*.so
>> ${localstatedir}/db/Makefile"
>> > +RDEPENDS_libnss-db = "${PN}-utils make"
>> >  FILES_glibc-extra-nss = "${base_libdir}/libnss_*-*.so
>> ${base_libdir}/libnss_*.so.*"
>> >  FILES_sln = "${base_sbindir}/sln"
>> >  FILES_${PN}-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/*.o"
>> > @@ -59,7 +61,6 @@ inherit libc-common multilib_header
>> >
>> >  do_install_append () {
>> >         rm -f ${D}${sysconfdir}/localtime
>> > -       rm -rf ${D}${localstatedir}
>> >
>> >         # remove empty glibc dir
>> >         if [ -d ${D}${libexecdir} ]; then
>> > --
>> > 2.11.0
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

