Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2AC987957B;
	Sat,  1 Sep 2018 08:21:06 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id 89-v6so2900452qkp.2;
	Sat, 01 Sep 2018 01:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZMsIoQ8b7Z3Pw/rBT4gvt1Z6wnEiy57lhU4yxy4KJf0=;
	b=CpBKFBFA8AB07o1saFYuAtgdGcxOBs6ARjWX/PRKEtt/nQYMv/CD7oo2ddUsYldTF1
	3fZCLo828HDBCcm5F5eRTA9JGkf2eWXgBD8nSXPUSzvuGk3oJx9bTk3xoVBNckqKduU+
	m2KywVUzzGMtgmGCAwhKvjxwojqLKjno0PVdXjupAUOf9u20eoGu2CO159Zh4sZhQXO/
	54oHWtl7V8na2Q8DUmBACFVjJgDmHG2ToXW/YNQJQ4K1TsW/+5DAS7jgc5uzxl0JPJfq
	/Psn/nU9LQNnz6V/nENxBR6ZQhYImE0LA/0ILyJBpLK8YLhXJqbe0CxM3X86Gw63CvAA
	XWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZMsIoQ8b7Z3Pw/rBT4gvt1Z6wnEiy57lhU4yxy4KJf0=;
	b=Rm+R+7v7BwgZri+l/6O2ROA4amXaYM6AZteV2mncZJwMHYRuMZ2SL1NKie1iSKLdpx
	n5mzl6f474KA9xt+ftI+owaqTpFnMfQowiJb7FqEhbQmEKZ7My4ErLhDQrCJQVvdMuLE
	0LCWiTKpLyosCtOqd5ICyH9HO/59UEkG6ReFbehCvEdXojkY/m6i0TkOwgqeb42G5tWw
	kRWOc0j4kdImwssKYT88dvpltJPi1bWl0qt/yy5gwthLY8Mtt1O8ExE4aR2ZmQr12yr/
	OMp/2nnG+hKVmcVSN2SHnYIiseSn4VyzDMa+3yQ+ew2HWx2mbqIdqbGZk0jYXJengEdW
	nmIA==
X-Gm-Message-State: APzg51Cbeqhve78+0Q/cIVdkFKJxhTEpgvldbXIruGhAqwQk95jlX+uA
	xxjf9VYwzHwtOwUTGjVi15uyrqGmoIaqEC6uVQpa3EW0
X-Google-Smtp-Source: ANB0VdbAO6i7gR5BZsOlSrOj7RLxLKzSWNKo9aCht4t+YDfoN9psOSh0Sa+8Oa0iXPF2nPBI51FJYpQYLCHBIONu0Dg=
X-Received: by 2002:a37:c04f:: with SMTP id
	o76-v6mr18280160qki.315.1535790067833; 
	Sat, 01 Sep 2018 01:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1535451643.git.alex.kanavin@gmail.com>
In-Reply-To: <cover.1535451643.git.alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 1 Sep 2018 01:20:42 -0700
Message-ID: <CAMKF1spZJAUDAReUiBu=KB6bJj1M-s1xeK21St92v3Brbwi+sQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Sat, 01 Sep 2018 08:21:07 -0000
Content-Type: text/plain; charset="UTF-8"

+OE-devel

On Tue, Aug 28, 2018 at 3:23 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> This patch series updates openssl to the soon-to-be released 1.1.1 version
> (latest news is 11 September), sets it as default, and removes dependencies
> on openssl 1.0 entirely from oe-core. openssl 1.0 remains available as openssl10
> recipe.
>
> The following changes since commit a8368651ffed1bd6c4715a37dfe9f40c48ca23c4:
>
>   bitbake: fetcher: Fixed remote removal not throwing exception. (2018-08-28 10:32:08 +0100)
>
> are available in the git repository at:
>
>   git://push.yoctoproject.org/poky-contrib akanavin/openssl-1.1.1
>
> Alexander Kanavin (6):
>   openssl: rename openssl 1.0.x to openssl10 and make openssl 1.1.x the
>     default version

This change is going to require some changes en-mass in meta-openembedded repos

see the failures

http://errors.yoctoproject.org/Errors/Build/67403/

Feel free to send patches to meta-openembedded.

>   cryptodev-tests: port to openssl 1.1
>   openssl: update to 1.1.1
>   libressl: add a recipe to support openssh
>   openssh: depend on libressl
>   ca-certificates: update to 20180409
>
>  meta/conf/distro/include/default-versions.inc      |   3 -
>  meta/conf/distro/include/maintainers.inc           |   2 +
>  ...c-libraries-with-their-library-dependenci.patch |  73 +++++++++++++++
>  .../libressl/libressl_2.8.0.bb                     |  35 +++++++
>  meta/recipes-connectivity/openssh/openssh_7.7p1.bb |   2 +-
>  .../{openssl => files}/environment.d-openssl.sh    |   0
>  ...1-Take-linking-flags-from-LDFLAGS-env-var.patch |  43 ---------
>  ...SLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch |  39 --------
>  ...build-with-clang-using-external-assembler.patch |   0
>  .../0001-allow-manpages-to-be-disabled.patch       |   0
>  ...penssl-force-soft-link-to-avoid-rare-race.patch |   0
>  .../Makefiles-ptest.patch                          |   0
>  .../Use-SHA256-not-MD5-as-default-digest.patch     |   0
>  .../configure-musl-target.patch                    |   0
>  .../configure-targets.patch                        |   0
>  .../debian/c_rehash-compat.patch                   |   0
>  .../debian/debian-targets.patch                    |   0
>  .../debian/man-dir.patch                           |   0
>  .../debian/man-section.patch                       |   0
>  .../debian/no-rpath.patch                          |   0
>  .../debian/no-symbolic.patch                       |   0
>  .../{openssl-1.0.2p => openssl10}/debian/pic.patch |   0
>  .../debian1.0.2/block_digicert_malaysia.patch      |   0
>  .../debian1.0.2/block_diginotar.patch              |   0
>  .../debian1.0.2/soname.patch                       |   0
>  .../debian1.0.2/version-script.patch               |   0
>  .../engines-install-in-libdir-ssl.patch            |   0
>  .../{openssl-1.0.2p => openssl10}/oe-ldflags.patch |   0
>  .../openssl-c_rehash.sh                            |   0
>  .../openssl-fix-des.pod-error.patch                |   0
>  .../openssl_fix_for_x32.patch                      |   0
>  .../{openssl-1.0.2p => openssl10}/parallel.patch   |   0
>  .../{openssl-1.0.2p => openssl10}/ptest-deps.patch |   0
>  .../ptest_makefile_deps.patch                      |   0
>  .../reproducible-cflags.patch                      |   0
>  .../reproducible-mkbuildinf.patch                  |   0
>  .../{openssl-1.0.2p => openssl10}/run-ptest        |   0
>  .../shared-libs.patch                              |   0
>  .../{openssl_1.0.2p.bb => openssl10_1.0.2p.bb}     |  31 +++++--
>  .../{openssl_1.1.0i.bb => openssl_1.1.1-pre9.bb}   |  23 +++--
>  .../cryptodev/cryptodev-tests_1.9.bb               |   3 +-
>  .../files/0001-Port-tests-to-openssl-1.1.patch     | 103 +++++++++++++++++++++
>  ...tes_20170717.bb => ca-certificates_20180409.bb} |   4 +-
>  43 files changed, 255 insertions(+), 106 deletions(-)
>  create mode 100644 meta/recipes-connectivity/libressl/libressl/0001-Link-dynamic-libraries-with-their-library-dependenci.patch
>  create mode 100644 meta/recipes-connectivity/libressl/libressl_2.8.0.bb
>  rename meta/recipes-connectivity/openssl/{openssl => files}/environment.d-openssl.sh (100%)
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-allow-OPENSSLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/0001-Fix-build-with-clang-using-external-assembler.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/0001-allow-manpages-to-be-disabled.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/0001-openssl-force-soft-link-to-avoid-rare-race.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/Makefiles-ptest.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/Use-SHA256-not-MD5-as-default-digest.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/configure-musl-target.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/configure-targets.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/c_rehash-compat.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/debian-targets.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/man-dir.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/man-section.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/no-rpath.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/no-symbolic.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian/pic.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian1.0.2/block_digicert_malaysia.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian1.0.2/block_diginotar.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian1.0.2/soname.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/debian1.0.2/version-script.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/engines-install-in-libdir-ssl.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/oe-ldflags.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/openssl-c_rehash.sh (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/openssl-fix-des.pod-error.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/openssl_fix_for_x32.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/parallel.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/ptest-deps.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/ptest_makefile_deps.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/reproducible-cflags.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/reproducible-mkbuildinf.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/run-ptest (100%)
>  rename meta/recipes-connectivity/openssl/{openssl-1.0.2p => openssl10}/shared-libs.patch (100%)
>  rename meta/recipes-connectivity/openssl/{openssl_1.0.2p.bb => openssl10_1.0.2p.bb} (91%)
>  rename meta/recipes-connectivity/openssl/{openssl_1.1.0i.bb => openssl_1.1.1-pre9.bb} (83%)
>  create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Port-tests-to-openssl-1.1.patch
>  rename meta/recipes-support/ca-certificates/{ca-certificates_20170717.bb => ca-certificates_20180409.bb} (95%)
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

