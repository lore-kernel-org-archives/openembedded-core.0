Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id A50DE79549
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 09:38:56 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id b15-v6so20569898oib.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 02:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0IDotOVCE1KbTtL9MFvBW62qade7nSArxux3mDlUrc8=;
	b=fOruWQrypUk/j45X3ANcHe9iqM9lDJ9Q+z/1+/vUidLx+e0iDprk/NaP3FpCnTw/lC
	oy5QGcdfkiLfMXwfLI1bIrnr68YScCavjXxKiQ5CZwctCQi+2jh4xFkH5B6Al3p39W1x
	lSQYphBAboI4OBjhD4MKC4C+iy6J6bUm1xDlQLaiWaO7XTb5xIFh8PiwrWiJzcAK5b4j
	vaD0/uyE+8baRcD4RLRV5NOqy+fnPWZR4GMIrhdn8APresOcqG6J+zKdDio2nrxjz6kZ
	r5X0ku/98hiL6YCdXuCPcUO1bOjQI5GLkRS1e6Lq2ma2gLc3cB628g6QYrTYfKsUPgz+
	oaNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0IDotOVCE1KbTtL9MFvBW62qade7nSArxux3mDlUrc8=;
	b=nGt7I7pg6IlV1qr5W+PxTqAPbSd+p5sPMZbwNA4CejhnXudHvnJIj6ORKfofssf7Kd
	Nb3Eg/Cp/UjxDuHzDJr1P46yF2cmUWHDJ2pX8dDsof4u4AZyvwL3mc9sSAWARpLcX74y
	D9zpCJpoOjuEZzgi6/e1qsq85QJpLAtwewwy0VaTOgt5PRpG0IYSSVHcT7D/YmOpmmrv
	OI+mEoXQ+KcbzVzILzUIF4qMo/ucZbMRgRQ+P+ui11umb9+fiZrSHLY0wyVfq0Xz3r8/
	fDln1RtS+zoOMKrqXS9T8AljbU4ds2CPomxItcU4HNoCcVfFf78wCqVgrUvQHTd3o2Cj
	vibQ==
X-Gm-Message-State: APzg51BNCSANIudpQ/kZCu4mSx7YVK0bUkdgQEQo9hckvhjNLV3JfcKx
	zItaDlrG+C3CisGbBG6T/i5M5RkRPOK8mpPAB8k=
X-Google-Smtp-Source: ANB0VdZXCBxOF7MojrWGCtSV2yuedRTAe9J51dJHysjBGMaBiBshH2PcRzukv+qhlzGA5GyqrdfMhHxwQ1hEE49leww=
X-Received: by 2002:aca:a8c1:: with SMTP id
	r184-v6mr6562914oie.215.1535708337565; 
	Fri, 31 Aug 2018 02:38:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:1645:0:0:0:0:0 with HTTP; Fri, 31 Aug 2018 02:38:57
	-0700 (PDT)
In-Reply-To: <CANNYZj8JTkt2z056YRKpOzV+BkcjOkk6-w5R5mrp_EM1MWATFg@mail.gmail.com>
References: <cover.1535451643.git.alex.kanavin@gmail.com>
	<CAMKF1sqLt9FpEhhL977egq7DjKJDj7PvBV6MJ-jszjfzHgTyrA@mail.gmail.com>
	<CANNYZj8JTkt2z056YRKpOzV+BkcjOkk6-w5R5mrp_EM1MWATFg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 31 Aug 2018 11:38:57 +0200
Message-ID: <CANNYZj_xGCEFTAWJLr2Hc5A7DFKYFB=9s7Uz7AusOtD3wW-+gw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Fri, 31 Aug 2018 09:38:56 -0000
Content-Type: text/plain; charset="UTF-8"

I just did a quick musl build for qemux86, and " -DOPENSSL_NO_ASYNC"
is there as expected. Something in your setup overrides it maybe? What
does bitbake -e openssl say?


Alex

2018-08-31 11:30 GMT+02:00 Alexander Kanavin <alex.kanavin@gmail.com>:
> The recipe has a guard for this, but maybe it stopped working, I'll take a look:
>
> #| ./libcrypto.so: undefined reference to `getcontext'
> #| ./libcrypto.so: undefined reference to `setcontext'
> #| ./libcrypto.so: undefined reference to `makecontext'
> CPPFLAGS_append_libc-musl = " -DOPENSSL_NO_ASYNC"
>
> Alex
>
>
> 2018-08-31 8:22 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
>> musl/mips seems to fail due to this see
>>
>> http://errors.yoctoproject.org/Errors/Details/188615/
>> On Tue, Aug 28, 2018 at 3:23 AM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>>>
>>> This patch series updates openssl to the soon-to-be released 1.1.1 version
>>> (latest news is 11 September), sets it as default, and removes dependencies
>>> on openssl 1.0 entirely from oe-core. openssl 1.0 remains available as openssl10
>>> recipe.
>>>
>>> The following changes since commit a8368651ffed1bd6c4715a37dfe9f40c48ca23c4:
>>>
>>>   bitbake: fetcher: Fixed remote removal not throwing exception. (2018-08-28 10:32:08 +0100)
>>>
>>> are available in the git repository at:
>>>
>>>   git://push.yoctoproject.org/poky-contrib akanavin/openssl-1.1.1
>>>
>>> Alexander Kanavin (6):
>>>   openssl: rename openssl 1.0.x to openssl10 and make openssl 1.1.x the
>>>     default version
>>>   cryptodev-tests: port to openssl 1.1
>>>   openssl: update to 1.1.1
>>>   libressl: add a recipe to support openssh
>>>   openssh: depend on libressl
>>>   ca-certificates: update to 20180409
>>>
>>>  meta/conf/distro/include/default-versions.inc      |   3 -
>>>  meta/conf/distro/include/maintainers.inc           |   2 +
>>>  ...c-libraries-with-their-library-dependenci.patch |  73 +++++++++++++++
>>>  .../libressl/libressl_2.8.0.bb                     |  35 +++++++
>>>  meta/recipes-connectivity/openssh/openssh_7.7p1.bb |   2 +-
>>>  .../{openssl => files}/environment.d-openssl.sh    |   0
>>>  ...1-Take-linking-flags-from-LDFLAGS-env-var.patch |  43 ---------
>>>  ...SLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch |  39 --------
>>>  ...build-with-clang-using-external-assembler.patch |   0
>>>  .../0001-allow-manpages-to-be-disabled.patch       |   0
>>>  ...penssl-force-soft-link-to-avoid-rare-race.patch |   0
>>>  .../Makefiles-ptest.patch                          |   0
>>>  .../Use-SHA256-not-MD5-as-default-digest.patch     |   0
>>>  .../configure-musl-target.patch                    |   0
>>>  .../configure-targets.patch                        |   0
>>>  .../debian/c_rehash-compat.patch                   |   0
>>>  .../debian/debian-targets.patch                    |   0
>>>  .../debian/man-dir.patch                           |   0
>>>  .../debian/man-section.patch                       |   0
>>>  .../debian/no-rpath.patch                          |   0
>>>  .../debian/no-symbolic.patch                       |   0
>>>  .../{openssl-1.0.2p => openssl10}/debian/pic.patch |   0
>>>  .../debian1.0.2/block_digicert_malaysia.patch      |   0
>>>  .../debian1.0.2/block_diginotar.patch              |   0
>>>  .../debian1.0.2/soname.patch                       |   0
>>>  .../debian1.0.2/version-script.patch               |   0
>>>  .../engines-install-in-libdir-ssl.patch            |   0
>>>  .../{openssl-1.0.2p => openssl10}/oe-ldflags.patch |   0
>>>  .../openssl-c_rehash.sh                            |   0
>>>  .../openssl-fix-des.pod-error.patch                |   0
>>>  .../openssl_fix_for_x32.patch                      |   0
>>>  .../{openssl-1.0.2p => openssl10}/parallel.patch   |   0
>>>  .../{openssl-1.0.2p => openssl10}/ptest-deps.patch |   0
>>>  .../ptest_makefile_deps.patch                      |   0
>>>  .../reproducible-cflags.patch                      |   0
>>>  .../reproducible-mkbuildinf.patch                  |   0
>>>  .../{openssl-1.0.2p => openssl10}/run-ptest        |   0
>>>  .../shared-libs.patch                              |   0
>>>  .../{openssl_1.0.2p.bb => openssl10_1.0.2p.bb}     |  31 +++++--
>>>  .../{openssl_1.1.0i.bb => openssl_1.1.1-pre9.bb}   |  23 +++--
>>>  .../cryptodev/cryptodev-tests_1.9.bb               |   3 +-
>>>  .../files/0001-Port-tests-to-openssl-1.1.patch     | 103 +++++++++++++++++++++
>>>  ...tes_20170717.bb => ca-certificates_20180409.bb} |   4 +-
>>>  43 files changed, 255 insertions(+), 106 deletions(-)
>>>  create mode 100644 meta/recipes-connectivity/libressl/libressl/0001-Link-dynamic-libraries-with-their-library-dependenci.patch
>>>  create mode 100644 meta/recipes-connectivity/libressl/libressl_2.8.0.bb
>>>  rename meta/recipes-connectivity/openssl/{openssl => files}/environment.d-openssl.sh (100%)
>>>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch
>>>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-allow-OPENSSLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/0001-Fix-build-with-clang-using-external-assembler.patch (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/0001-allow-manpages-to-be-disabled.patch (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/0001-openssl-force-soft-link-to-avoid-rare-race.patch (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/Makefiles-ptest.patch (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/Use-SHA256-not-MD5-as-default-digest.patch (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/configure-musl-target.patch (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/configure-targets.patch (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/c_rehash-compat.patch (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/debian-targets.patch (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/man-dir.patch (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/man-section.patch (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/no-rpath.patch (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/no-symbolic.patch (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/pic.patch (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian1.0.2/block_digicert_malaysia.patch (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian1.0.2/block_diginotar.patch (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian1.0.2/soname.patch (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian1.0.2/version-script.patch (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/engines-install-in-libdir-ssl.patch (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/oe-ldflags.patch (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/openssl-c_rehash.sh (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/openssl-fix-des.pod-error.patch (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/openssl_fix_for_x32.patch (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/parallel.patch (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/ptest-deps.patch (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/ptest_makefile_deps.patch (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/reproducible-cflags.patch (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/reproducible-mkbuildinf.patch (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/run-ptest (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/shared-libs.patch (100%)
>>>  rename meta/recipes-connectivity/openssl/{openssl_1.0.2p.bb => openssl10_1.0.2p.bb} (91%)
>>>  rename meta/recipes-connectivity/openssl/{openssl_1.1.0i.bb => openssl_1.1.1-pre9.bb} (83%)
>>>  create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Port-tests-to-openssl-1.1.patch
>>>  rename meta/recipes-support/ca-certificates/{ca-certificates_20170717.bb => ca-certificates_20180409.bb} (95%)
>>>
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

