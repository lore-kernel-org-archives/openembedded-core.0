Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3E775795D2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Sep 2018 08:16:51 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id d15-v6so2902745qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Sep 2018 01:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=t3gRmByAIMR25OH8cqgg1Izze4ccJ3ifKqjTJz75eAw=;
	b=pJ3mosogjMey/8jNxNZ0OcPJNTcuJngWcODOWQ3hNJHWMd+s5gMEClJDXJjepsAIzx
	Zo1ixl53bWEuAPi32YLGjXMFXoKAD00Sj3tTGdfoeQ/mds5OyWVITVfT5V920K/dJ9/5
	R4hmeHYmRZp5MX5VjOBiX5IOX5NADYLfK9lzyVFdYvboQrlwi/oqQ0E3AC5Uy0iPF9pJ
	oCMQ3BqaIx2Y9AiBAoQnhKdJA1K2gJFFWE3CRExVzNAX26jZkMe5gzev7KhlNDFKXHW+
	PjZ4rCmIoyErCAtgCKHD4AMubec5HNC5ipGh1sbqx4lYogUbSsveN+90Ii9WJtIFTubM
	LKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=t3gRmByAIMR25OH8cqgg1Izze4ccJ3ifKqjTJz75eAw=;
	b=QHMTQDF8wTcsi0uUA2qSZSKc+pfH1cJ0i0y7oPFL5y6+z9mrBVI8A1BoqBkRVSQCfF
	zVMK/nwWz5dwzo3AiTVx53yKOUu1pSJjugOiqaEGFDjR61H44o55IVkhO8q+2SGvQOKa
	irFRsgotGac80jevHGvc47bmgHJOYP+gvOvJemuKzAqL7hodv4aPhsZ9c3E0U5V8Iis7
	rb6mtv1ejZ25TAuAXvimvc22NSUWO9miaG5Gu5kV8zgoXi5CJT0FHtOlktPPSwjSSsVY
	uaUtypx8TDT3q4wAj5I7oL2WdVzzMas0UkkWvl15YxeNPYkPTuVOREqZSC43NdFEECeR
	ax6A==
X-Gm-Message-State: APzg51CrC86n8A/W3whWzgIjoMvQObkeWxOjHdotFBLwnUanPTXE+cg/
	nkzHYCoEB8bTUSgjnkm+NzPYmLn7skTZ8nUUkd8=
X-Google-Smtp-Source: ANB0Vdb7AS7R63Fr8QT06ggRTKykXNPPPy7fLur34y8FmqZrJUsHic17FfwzpFNFN5pfpp/MqxAvnwLc0KILDuAwUHY=
X-Received: by 2002:a37:c5d2:: with SMTP id
	k79-v6mr14853828qkl.206.1535789811967; 
	Sat, 01 Sep 2018 01:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1535451643.git.alex.kanavin@gmail.com>
	<CAMKF1sqLt9FpEhhL977egq7DjKJDj7PvBV6MJ-jszjfzHgTyrA@mail.gmail.com>
	<CANNYZj8JTkt2z056YRKpOzV+BkcjOkk6-w5R5mrp_EM1MWATFg@mail.gmail.com>
	<CANNYZj_xGCEFTAWJLr2Hc5A7DFKYFB=9s7Uz7AusOtD3wW-+gw@mail.gmail.com>
In-Reply-To: <CANNYZj_xGCEFTAWJLr2Hc5A7DFKYFB=9s7Uz7AusOtD3wW-+gw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 1 Sep 2018 01:16:26 -0700
Message-ID: <CAMKF1sorX_p-x6KyYu_XBTKvMPDNxb-fUOwLNDGreXfz41_2-g@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 0/6] openssl 1.1.1 update
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
X-List-Received-Date: Sat, 01 Sep 2018 08:16:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 31, 2018 at 2:38 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> I just did a quick musl build for qemux86, and " -DOPENSSL_NO_ASYNC"
> is there as expected. Something in your setup overrides it maybe? What
> does bitbake -e openssl say?
>

its failing in tests so may be ptests enabled build will get you to problem.

>
> Alex
>
> 2018-08-31 11:30 GMT+02:00 Alexander Kanavin <alex.kanavin@gmail.com>:
> > The recipe has a guard for this, but maybe it stopped working, I'll take a look:
> >
> > #| ./libcrypto.so: undefined reference to `getcontext'
> > #| ./libcrypto.so: undefined reference to `setcontext'
> > #| ./libcrypto.so: undefined reference to `makecontext'
> > CPPFLAGS_append_libc-musl = " -DOPENSSL_NO_ASYNC"
> >
> > Alex
> >
> >
> > 2018-08-31 8:22 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
> >> musl/mips seems to fail due to this see
> >>
> >> http://errors.yoctoproject.org/Errors/Details/188615/
> >> On Tue, Aug 28, 2018 at 3:23 AM Alexander Kanavin
> >> <alex.kanavin@gmail.com> wrote:
> >>>
> >>> This patch series updates openssl to the soon-to-be released 1.1.1 version
> >>> (latest news is 11 September), sets it as default, and removes dependencies
> >>> on openssl 1.0 entirely from oe-core. openssl 1.0 remains available as openssl10
> >>> recipe.
> >>>
> >>> The following changes since commit a8368651ffed1bd6c4715a37dfe9f40c48ca23c4:
> >>>
> >>>   bitbake: fetcher: Fixed remote removal not throwing exception. (2018-08-28 10:32:08 +0100)
> >>>
> >>> are available in the git repository at:
> >>>
> >>>   git://push.yoctoproject.org/poky-contrib akanavin/openssl-1.1.1
> >>>
> >>> Alexander Kanavin (6):
> >>>   openssl: rename openssl 1.0.x to openssl10 and make openssl 1.1.x the
> >>>     default version
> >>>   cryptodev-tests: port to openssl 1.1
> >>>   openssl: update to 1.1.1
> >>>   libressl: add a recipe to support openssh
> >>>   openssh: depend on libressl
> >>>   ca-certificates: update to 20180409
> >>>
> >>>  meta/conf/distro/include/default-versions.inc      |   3 -
> >>>  meta/conf/distro/include/maintainers.inc           |   2 +
> >>>  ...c-libraries-with-their-library-dependenci.patch |  73 +++++++++++++++
> >>>  .../libressl/libressl_2.8.0.bb                     |  35 +++++++
> >>>  meta/recipes-connectivity/openssh/openssh_7.7p1.bb |   2 +-
> >>>  .../{openssl => files}/environment.d-openssl.sh    |   0
> >>>  ...1-Take-linking-flags-from-LDFLAGS-env-var.patch |  43 ---------
> >>>  ...SLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch |  39 --------
> >>>  ...build-with-clang-using-external-assembler.patch |   0
> >>>  .../0001-allow-manpages-to-be-disabled.patch       |   0
> >>>  ...penssl-force-soft-link-to-avoid-rare-race.patch |   0
> >>>  .../Makefiles-ptest.patch                          |   0
> >>>  .../Use-SHA256-not-MD5-as-default-digest.patch     |   0
> >>>  .../configure-musl-target.patch                    |   0
> >>>  .../configure-targets.patch                        |   0
> >>>  .../debian/c_rehash-compat.patch                   |   0
> >>>  .../debian/debian-targets.patch                    |   0
> >>>  .../debian/man-dir.patch                           |   0
> >>>  .../debian/man-section.patch                       |   0
> >>>  .../debian/no-rpath.patch                          |   0
> >>>  .../debian/no-symbolic.patch                       |   0
> >>>  .../{openssl-1.0.2p => openssl10}/debian/pic.patch |   0
> >>>  .../debian1.0.2/block_digicert_malaysia.patch      |   0
> >>>  .../debian1.0.2/block_diginotar.patch              |   0
> >>>  .../debian1.0.2/soname.patch                       |   0
> >>>  .../debian1.0.2/version-script.patch               |   0
> >>>  .../engines-install-in-libdir-ssl.patch            |   0
> >>>  .../{openssl-1.0.2p => openssl10}/oe-ldflags.patch |   0
> >>>  .../openssl-c_rehash.sh                            |   0
> >>>  .../openssl-fix-des.pod-error.patch                |   0
> >>>  .../openssl_fix_for_x32.patch                      |   0
> >>>  .../{openssl-1.0.2p => openssl10}/parallel.patch   |   0
> >>>  .../{openssl-1.0.2p => openssl10}/ptest-deps.patch |   0
> >>>  .../ptest_makefile_deps.patch                      |   0
> >>>  .../reproducible-cflags.patch                      |   0
> >>>  .../reproducible-mkbuildinf.patch                  |   0
> >>>  .../{openssl-1.0.2p => openssl10}/run-ptest        |   0
> >>>  .../shared-libs.patch                              |   0
> >>>  .../{openssl_1.0.2p.bb => openssl10_1.0.2p.bb}     |  31 +++++--
> >>>  .../{openssl_1.1.0i.bb => openssl_1.1.1-pre9.bb}   |  23 +++--
> >>>  .../cryptodev/cryptodev-tests_1.9.bb               |   3 +-
> >>>  .../files/0001-Port-tests-to-openssl-1.1.patch     | 103 +++++++++++++++++++++
> >>>  ...tes_20170717.bb => ca-certificates_20180409.bb} |   4 +-
> >>>  43 files changed, 255 insertions(+), 106 deletions(-)
> >>>  create mode 100644 meta/recipes-connectivity/libressl/libressl/0001-Link-dynamic-libraries-with-their-library-dependenci.patch
> >>>  create mode 100644 meta/recipes-connectivity/libressl/libressl_2.8.0.bb
> >>>  rename meta/recipes-connectivity/openssl/{openssl => files}/environment.d-openssl.sh (100%)
> >>>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch
> >>>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-allow-OPENSSLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/0001-Fix-build-with-clang-using-external-assembler.patch (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/0001-allow-manpages-to-be-disabled.patch (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/0001-openssl-force-soft-link-to-avoid-rare-race.patch (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/Makefiles-ptest.patch (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/Use-SHA256-not-MD5-as-default-digest.patch (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/configure-musl-target.patch (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/configure-targets.patch (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/c_rehash-compat.patch (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/debian-targets.patch (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/man-dir.patch (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/man-section.patch (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/no-rpath.patch (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/no-symbolic.patch (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/pic.patch (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian1.0.2/block_digicert_malaysia.patch (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian1.0.2/block_diginotar.patch (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian1.0.2/soname.patch (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian1.0.2/version-script.patch (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/engines-install-in-libdir-ssl.patch (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/oe-ldflags.patch (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/openssl-c_rehash.sh (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/openssl-fix-des.pod-error.patch (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/openssl_fix_for_x32.patch (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/parallel.patch (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/ptest-deps.patch (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/ptest_makefile_deps.patch (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/reproducible-cflags.patch (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/reproducible-mkbuildinf.patch (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/run-ptest (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/shared-libs.patch (100%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl_1.0.2p.bb => openssl10_1.0.2p.bb} (91%)
> >>>  rename meta/recipes-connectivity/openssl/{openssl_1.1.0i.bb => openssl_1.1.1-pre9.bb} (83%)
> >>>  create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Port-tests-to-openssl-1.1.patch
> >>>  rename meta/recipes-support/ca-certificates/{ca-certificates_20170717.bb => ca-certificates_20180409.bb} (95%)
> >>>
> >>> --
> >>> 2.7.4
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

