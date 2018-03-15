Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4DB02787FF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 10:51:51 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id k135-v6so8524973ite.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 03:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5npf9nxp0IB6foqE+164YX7eZIcsw6M1h9U3TTBKdZM=;
	b=VmkFLWoun4DACebXgSRYZzZa6cBOHJ4AtikcRnesfmddJtfHr/R7FC9pGUXxawK4BT
	UiVH4kCVQSqMOuc59k1Hnv3QYa/yG/6AkLWUP21FoS2unXg+cNO0SNOFHx0r0mTXtjT1
	t0RFpL+MtYLYiwBTXqc6QzjzJ2Zpo30b4BxgBgHIsEWjULehudfetwjrXiY1y0M+7Rlg
	LbVb3ehpKo2G4mjtQ6c0dCCLm5D/LHb4eqj4u026goUhHsrY8SH7I5xGYI3usEwLpbzl
	H4utgI9SJWlEY0GxkbaMJ3vmQuqWojo/UJSn9j/qXtaoBAJcw80TlINEQXpzHcS3NSOn
	vXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5npf9nxp0IB6foqE+164YX7eZIcsw6M1h9U3TTBKdZM=;
	b=QSx6YWUIUzSb5Og/uTEMWTWxDzjE+Gj+I7sAN9PN7HdQC61e2AMw4Dpg6332kAaD3h
	Kc+Buv3UVHT7naAaZcR1lwv9pb1/CHtBi1vQyGXDLf+fapkAjHfftUQAtelKamumRXSa
	M8i4CLyLL6dm/OjzoYt/nFasd3AxD46kBcrOKjmdhLwPi+d+dTmL42QzSc9rmPeiCvMo
	Ak0SnAhWM4lpy+1mapx+8sUHI7adaHNBpxFjYte2C1DXtQGVtTyi9xFVUuGNkd1ZLZI7
	TgrVJjabxQH4iHHjgRq8ws67Zbq5IM2pgO9A5w+c1aFPJi3+NFIwSuz4dHegYpQxWR9i
	5c/w==
X-Gm-Message-State: AElRT7HiRbmeZu2U8cxqFsjrlLcWD7An5uGuaPlhXV5LwyqjYKqhddqz
	LVpMsOaWreyAjTjRHVU36hccipxPLYY/W7YPv1YlFA==
X-Google-Smtp-Source: AG47ELu75jaXaZEE7sYOcPdDHDpQ143/63Zzg/tuLuO0IyfrcoDxJMvVqXWP5y0xSN+JBviBd+RlIIPdXVqybDA6Zn0=
X-Received: by 2002:a24:c607:: with SMTP id j7-v6mr5570123itg.34.1521111112610;
	Thu, 15 Mar 2018 03:51:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Thu, 15 Mar 2018 03:51:32 -0700 (PDT)
In-Reply-To: <45826bc2-bdf5-4508-1e0f-dc9cb3fcda69@windriver.com>
References: <cover.1520841539.git.Qi.Chen@windriver.com>
	<45826bc2-bdf5-4508-1e0f-dc9cb3fcda69@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Mar 2018 10:51:32 +0000
Message-ID: <CAJTo0LaqzXc4JnXr=XZA_MN49edSGLFSz1ZVNw0_cnq9ME2kFA@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] systemd & systemd-boot: upgrade to 237
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
X-List-Received-Date: Thu, 15 Mar 2018 10:51:53 -0000
Content-Type: multipart/alternative; boundary="000000000000880a390567714759"

--000000000000880a390567714759
Content-Type: text/plain; charset="UTF-8"

Nope it's under review now.

Ross

On 15 March 2018 at 01:59, ChenQi <Qi.Chen@windriver.com> wrote:

> ping
>
> Is there some problem with this patchset?
>
> Regards,
> Chen Qi
>
> On 03/12/2018 04:38 PM, Chen Qi wrote:
>
>> Changes in V2:
>> * Rebase against latest master to resolve conflicts
>>
>>
>> The following changes since commit 5350ee317740751f2417c1794dd39d
>> 3880347dbf:
>>
>>    yocto-uninative: Upgrade to 1.8 version with glibc 2.27 (2018-03-11
>> 06:27:02 -0700)
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib ChenQi/systemd-237
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=C
>> henQi/systemd-237
>>
>> Chen Qi (3):
>>    systemd: upgrade to 237
>>    systemd: fix build failure for qemux86 and qemuppc with musl
>>    systemd-boot: upgrade to 237
>>
>>   .../{systemd-boot_234.bb => systemd-boot_237.bb}   |  31 ++-
>>   meta/recipes-core/systemd/systemd.inc              |   2 +-
>>   ...01-Also-check-i386-i586-and-i686-for-ia32.patch |  28 +++
>>   ...efi_cc-and-efi_ld-correctly-when-cross-co.patch |  62 +++++
>>   ...ck-protector-flags-to-workaround-musl-bui.patch |  33 +++
>>   ...v-when-secure-versions-are-not-available.patch} |  21 +-
>>   ...te-presets-after-generators-have-run-6526.patch |  69 ------
>>   ...any-initialization-steps-when-running-in-.patch | 163 -------------
>>   ...update-header-file-to-detect-memfd_create.patch |  28 ---
>>   ...t-install-dependency-links-at-install-tim.patch |  81 +++++++
>>   ...c-Check-if-memfd_create-is-already-define.patch |  27 ---
>>   .../systemd/0003-fileio-include-sys-mman.h.patch   |  26 --
>>   ...pper-instead-of-looking-for-relative-opti.patch |  64 +++++
>>   ...004-implment-systemd-sysv-install-for-OE.patch} |   8 +-
>>   ...t-install-dependency-links-at-install-tim.patch |  74 ------
>>   ...patch => 0005-rules-whitelist-hd-devices.patch} |   9 +-
>>   ...6-Make-root-s-home-directory-configurable.patch |  78 ++++++
>>   ...vert-rules-remove-firmware-loading-rules.patch} |   8 +-
>>   ...-check-for-missing-canonicalize_file_name.patch |  63 -----
>>   ...pper-instead-of-looking-for-relative-opti.patch |  40 ---
>>   .../systemd/0008-Do-not-enable-nss-tests.patch     |  35 ---
>>   ...remove-userspace-firmware-loading-suppor.patch} | 204
>> +++++++++-------
>>   ...=> 0009-remove-duplicate-include-uchar.h.patch} |  14 +-
>>   .../0010-check-for-uchar.h-in-meson.build.patch    |  45 ++++
>>   ...nes-Build-conditionally-when-HAVE_MYHOSTN.patch |  38 ---
>>   ...l-don-t-fail-if-libc-doesn-t-support-IDN.patch} |  26 +-
>>   ...es-watch-metadata-changes-in-ide-devices.patch} |   8 +-
>>   ...3-Make-root-s-home-directory-configurable.patch | 155 ------------
>>   ...lback-parse_printf_format-implementation.patch} |  86 ++++---
>>   ...sic-missing.h-check-for-missing-strndupa.patch} |  96 ++++----
>>   ...f-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch} |  30 +--
>>   ...ssing.h-check-for-missing-__compar_fn_t-.patch} |  18 +-
>>   ...patch => 0017-Include-netinet-if_ether.h.patch} |  55 +++--
>>   ...-check-for-missing-canonicalize_file_name.patch |  47 ++++
>>   .../0018-check-for-uchar.h-in-configure.patch      |  44 ----
>>   ...le-nss-tests-if-nss-systemd-is-not-enable.patch |  29 +++
>>   ...xdecoct.c-Include-missing.h-for-strndupa.patch} |  15 +-
>>   ...c-Disable-tests-for-missing-typedefs-in-.patch} |  39 ++-
>>   ...=> 0022-don-t-use-glibc-specific-qsort_r.patch} |  26 +-
>>   ...ss-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch} |  22 +-
>>   ...n_t-is-glibc-specific-use-raw-signature-.patch} |  14 +-
>>   ...ATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch} |  16 +-
>>   ...> 0026-Use-uintmax_t-for-handling-rlim_t.patch} |  22 +-
>>   .../0027-remove-nobody-user-group-checking.patch   |  63 +++++
>>   .../0028-add-missing-FTW_-macros-for-musl.patch    |  50 ++++
>>   ...nes-Build-conditionally-when-ENABLE_MYHOS.patch |  43 ++++
>>   ...-of-__register_atfork-for-non-glibc-build.patch |  45 ++++
>>   ...-ULONG_LONG_MAX-definition-in-case-of-mus.patch |  30 +++
>>   meta/recipes-core/systemd/systemd/run-ptest        |   6 -
>>   .../systemd/{systemd_234.bb => systemd_237.bb}     | 270
>> +++++++++------------
>>   50 files changed, 1211 insertions(+), 1295 deletions(-)
>>   rename meta/recipes-core/systemd/{systemd-boot_234.bb =>
>> systemd-boot_237.bb} (58%)
>>   create mode 100644 meta/recipes-core/systemd/syst
>> emd/0001-Also-check-i386-i586-and-i686-for-ia32.patch
>>   create mode 100644 meta/recipes-core/systemd/syst
>> emd/0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch
>>   create mode 100644 meta/recipes-core/systemd/syst
>> emd/0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch
>>   rename meta/recipes-core/systemd/systemd/{0004-Use-getenv-when-secu
>> re-versions-are-not-available.patch => 0001-Use-getenv-when-secure-ve
>> rsions-are-not-available.patch} (53%)
>>   delete mode 100644 meta/recipes-core/systemd/syst
>> emd/0001-core-evaluate-presets-after-generators-have-run-6526.patch
>>   delete mode 100644 meta/recipes-core/systemd/syst
>> emd/0001-main-skip-many-initialization-steps-when-running-in-.patch
>>   delete mode 100644 meta/recipes-core/systemd/syst
>> emd/0001-meson-update-header-file-to-detect-memfd_create.patch
>>   create mode 100644 meta/recipes-core/systemd/syst
>> emd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
>>   delete mode 100644 meta/recipes-core/systemd/syst
>> emd/0002-configure.ac-Check-if-memfd_create-is-already-define.patch
>>   delete mode 100644 meta/recipes-core/systemd/syst
>> emd/0003-fileio-include-sys-mman.h.patch
>>   create mode 100644 meta/recipes-core/systemd/syst
>> emd/0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
>>   rename meta/recipes-core/systemd/systemd/{0010-implment-systemd-sysv-install-for-OE.patch
>> => 0004-implment-systemd-sysv-install-for-OE.patch} (89%)
>>   delete mode 100644 meta/recipes-core/systemd/syst
>> emd/0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch
>>   rename meta/recipes-core/systemd/systemd/{0012-rules-whitelist-hd-devices.patch
>> => 0005-rules-whitelist-hd-devices.patch} (89%)
>>   create mode 100644 meta/recipes-core/systemd/syst
>> emd/0006-Make-root-s-home-directory-configurable.patch
>>   rename meta/recipes-core/systemd/systemd/{0014-Revert-rules-remove-firmware-loading-rules.patch
>> => 0007-Revert-rules-remove-firmware-loading-rules.patch} (81%)
>>   delete mode 100644 meta/recipes-core/systemd/syst
>> emd/0007-check-for-missing-canonicalize_file_name.patch
>>   delete mode 100644 meta/recipes-core/systemd/syst
>> emd/0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
>>   delete mode 100644 meta/recipes-core/systemd/syst
>> emd/0008-Do-not-enable-nss-tests.patch
>>   rename meta/recipes-core/systemd/systemd/{0015-Revert-udev-remove-
>> userspace-firmware-loading-suppor.patch => 0008-Revert-udev-remove-usersp
>> ace-firmware-loading-suppor.patch} (63%)
>>   rename meta/recipes-core/systemd/systemd/{0017-remove-duplicate-include-uchar.h.patch
>> => 0009-remove-duplicate-include-uchar.h.patch} (78%)
>>   create mode 100644 meta/recipes-core/systemd/syst
>> emd/0010-check-for-uchar.h-in-meson.build.patch
>>   delete mode 100644 meta/recipes-core/systemd/syst
>> emd/0011-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
>>   rename meta/recipes-core/systemd/systemd/{0019-socket-util-don-t-
>> fail-if-libc-doesn-t-support-IDN.patch => 0011-socket-util-don-t-fail-if
>> -libc-doesn-t-support-IDN.patch} (58%)
>>   rename meta/recipes-core/systemd/systemd/{0020-rules-watch-metadata-changes-in-ide-devices.patch
>> => 0012-rules-watch-metadata-changes-in-ide-devices.patch} (90%)
>>   delete mode 100644 meta/recipes-core/systemd/syst
>> emd/0013-Make-root-s-home-directory-configurable.patch
>>   rename meta/recipes-core/systemd/systemd/{0001-add-fallback-parse_
>> printf_format-implementation.patch => 0013-add-fallback-parse_printf_format-implementation.patch}
>> (88%)
>>   rename meta/recipes-core/systemd/systemd/{0002-src-basic-missing.h-
>> check-for-missing-strndupa.patch => 0014-src-basic-missing.h-check-for-missing-strndupa.patch}
>> (47%)
>>   rename meta/recipes-core/systemd/systemd/{0003-don-t-fail-if-GLOB_
>> BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch => 0015-don-t-fail-if-GLOB_BRACE-
>> and-GLOB_ALTDIRFUNC-is-not-.patch} (88%)
>>   rename meta/recipes-core/systemd/systemd/{0004-src-basic-missing.h-
>> check-for-missing-__compar_fn_t-.patch => 0016-src-basic-missing.h-check
>> -for-missing-__compar_fn_t-.patch} (77%)
>>   rename meta/recipes-core/systemd/systemd/{0006-Include-netinet-if_ether.h.patch
>> => 0017-Include-netinet-if_ether.h.patch} (67%)
>>   create mode 100644 meta/recipes-core/systemd/syst
>> emd/0018-check-for-missing-canonicalize_file_name.patch
>>   delete mode 100644 meta/recipes-core/systemd/syst
>> emd/0018-check-for-uchar.h-in-configure.patch
>>   create mode 100644 meta/recipes-core/systemd/syst
>> emd/0019-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch
>>   rename meta/recipes-core/systemd/systemd/{0009-test-hexdecoct.c-
>> Include-missing.h-form-strndupa.patch => 0020-test-hexdecoct.c-Include-missing.h-for-strndupa.patch}
>> (68%)
>>   rename meta/recipes-core/systemd/systemd/{0010-test-sizeof.c-Disabl
>> e-tests-for-missing-typedefs-in-.patch => 0021-test-sizeof.c-Disable-tes
>> ts-for-missing-typedefs-in-.patch} (49%)
>>   rename meta/recipes-core/systemd/systemd/{0011-don-t-use-glibc-specific-qsort_r.patch
>> => 0022-don-t-use-glibc-specific-qsort_r.patch} (88%)
>>   rename meta/recipes-core/systemd/systemd/{0012-don-t-pass-AT_SYMLIN
>> K_NOFOLLOW-flag-to-faccessat.patch => 0023-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch}
>> (90%)
>>   rename meta/recipes-core/systemd/systemd/{0013-comparison_fn_t-is-
>> glibc-specific-use-raw-signature-.patch => 0024-comparison_fn_t-is-glibc-
>> specific-use-raw-signature-.patch} (77%)
>>   rename meta/recipes-core/systemd/systemd/{0001-Define-_PATH_WTMPX-
>> and-_PATH_UTMPX-if-not-defined.patch => 0025-Define-_PATH_WTMPX-and-_P
>> ATH_UTMPX-if-not-defined.patch} (80%)
>>   rename meta/recipes-core/systemd/systemd/{0001-Use-uintmax_t-for-handling-rlim_t.patch
>> => 0026-Use-uintmax_t-for-handling-rlim_t.patch} (89%)
>>   create mode 100644 meta/recipes-core/systemd/syst
>> emd/0027-remove-nobody-user-group-checking.patch
>>   create mode 100644 meta/recipes-core/systemd/syst
>> emd/0028-add-missing-FTW_-macros-for-musl.patch
>>   create mode 100644 meta/recipes-core/systemd/syst
>> emd/0029-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch
>>   create mode 100644 meta/recipes-core/systemd/syst
>> emd/0030-fix-missing-of-__register_atfork-for-non-glibc-build.patch
>>   create mode 100644 meta/recipes-core/systemd/syst
>> emd/0031-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
>>   delete mode 100644 meta/recipes-core/systemd/systemd/run-ptest
>>   rename meta/recipes-core/systemd/{systemd_234.bb => systemd_237.bb}
>> (71%)
>>
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000880a390567714759
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Nope it&#39;s under review now.<div><br></div><div>Ross</d=
iv></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 15 Ma=
rch 2018 at 01:59, ChenQi <span dir=3D"ltr">&lt;<a href=3D"mailto:Qi.Chen@w=
indriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">ping<br>
<br>
Is there some problem with this patchset?<span class=3D"im HOEnZb"><br>
<br>
Regards,<br>
Chen Qi<br>
<br>
On 03/12/2018 04:38 PM, Chen Qi wrote:<br>
</span><div class=3D"HOEnZb"><div class=3D"h5"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
Changes in V2:<br>
* Rebase against latest master to resolve conflicts<br>
<br>
<br>
The following changes since commit 5350ee317740751f2417c1794dd39d<wbr>38803=
47dbf:<br>
<br>
=C2=A0 =C2=A0yocto-uninative: Upgrade to 1.8 version with glibc 2.27 (2018-=
03-11 06:27:02 -0700)<br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 =C2=A0git://<a href=3D"http://git.pokylinux.org/poky-contrib" rel=3D=
"noreferrer" target=3D"_blank">git.pokylinux.org/poky-<wbr>contrib</a> Chen=
Qi/systemd-237<br>
=C2=A0 =C2=A0<a href=3D"http://git.pokylinux.org/cgit.cgi/poky-contrib/log/=
?h=3DChenQi/systemd-237" rel=3D"noreferrer" target=3D"_blank">http://git.po=
kylinux.org/<wbr>cgit.cgi/poky-contrib/log/?h=3DC<wbr>henQi/systemd-237</a>=
<br>
<br>
Chen Qi (3):<br>
=C2=A0 =C2=A0systemd: upgrade to 237<br>
=C2=A0 =C2=A0systemd: fix build failure for qemux86 and qemuppc with musl<b=
r>
=C2=A0 =C2=A0systemd-boot: upgrade to 237<br>
<br>
=C2=A0 .../{<a href=3D"http://systemd-boot_234.bb" rel=3D"noreferrer" targe=
t=3D"_blank">systemd-boot_234.bb</a> =3D&gt; <a href=3D"http://systemd-boot=
_237.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_237.bb</a>}=C2=
=A0 =C2=A0|=C2=A0 31 ++-<br>
=C2=A0 meta/recipes-core/systemd/syst<wbr>emd.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 ...01-Also-check-i386-i586-and<wbr>-i686-for-ia32.patch |=C2=A0 28 +=
++<br>
=C2=A0 ...efi_cc-and-efi_ld-correctly<wbr>-when-cross-co.patch |=C2=A0 62 +=
++++<br>
=C2=A0 ...ck-protector-flags-to-worka<wbr>round-musl-bui.patch |=C2=A0 33 +=
++<br>
=C2=A0 ...v-when-secure-versions-are-<wbr>not-available.patch} |=C2=A0 21 +=
-<br>
=C2=A0 ...te-presets-after-generators<wbr>-have-run-6526.patch |=C2=A0 69 -=
-----<br>
=C2=A0 ...any-initialization-steps-wh<wbr>en-running-in-.patch | 163 ------=
-------<br>
=C2=A0 ...update-header-file-to-detec<wbr>t-memfd_create.patch |=C2=A0 28 -=
--<br>
=C2=A0 ...t-install-dependency-links-<wbr>at-install-tim.patch |=C2=A0 81 +=
++++++<br>
=C2=A0 ...c-Check-if-memfd_create-is-<wbr>already-define.patch |=C2=A0 27 -=
--<br>
=C2=A0 .../systemd/0003-fileio-includ<wbr>e-sys-mman.h.patch=C2=A0 =C2=A0|=
=C2=A0 26 --<br>
=C2=A0 ...pper-instead-of-looking-for<wbr>-relative-opti.patch |=C2=A0 64 +=
++++<br>
=C2=A0 ...004-implment-systemd-sysv-i<wbr>nstall-for-OE.patch} |=C2=A0 =C2=
=A08 +-<br>
=C2=A0 ...t-install-dependency-links-<wbr>at-install-tim.patch |=C2=A0 74 -=
-----<br>
=C2=A0 ...patch =3D&gt; 0005-rules-whitelist-hd-device<wbr>s.patch} |=C2=A0=
 =C2=A09 +-<br>
=C2=A0 ...6-Make-root-s-home-director<wbr>y-configurable.patch |=C2=A0 78 +=
+++++<br>
=C2=A0 ...vert-rules-remove-firmware-<wbr>loading-rules.patch} |=C2=A0 =C2=
=A08 +-<br>
=C2=A0 ...-check-for-missing-canonica<wbr>lize_file_name.patch |=C2=A0 63 -=
----<br>
=C2=A0 ...pper-instead-of-looking-for<wbr>-relative-opti.patch |=C2=A0 40 -=
--<br>
=C2=A0 .../systemd/0008-Do-not-enable<wbr>-nss-tests.patch=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 35 ---<br>
=C2=A0 ...remove-userspace-firmware-l<wbr>oading-suppor.patch} | 204 ++++++=
+++-------<br>
=C2=A0 ...=3D&gt; 0009-remove-duplicate-include-<wbr>uchar.h.patch} |=C2=A0=
 14 +-<br>
=C2=A0 .../0010-check-for-uchar.h-in-<wbr>meson.build.patch=C2=A0 =C2=A0 |=
=C2=A0 45 ++++<br>
=C2=A0 ...nes-Build-conditionally-whe<wbr>n-HAVE_MYHOSTN.patch |=C2=A0 38 -=
--<br>
=C2=A0 ...l-don-t-fail-if-libc-doesn-<wbr>t-support-IDN.patch} |=C2=A0 26 +=
-<br>
=C2=A0 ...es-watch-metadata-changes-i<wbr>n-ide-devices.patch} |=C2=A0 =C2=
=A08 +-<br>
=C2=A0 ...3-Make-root-s-home-director<wbr>y-configurable.patch | 155 ------=
------<br>
=C2=A0 ...lback-parse_printf_format-i<wbr>mplementation.patch} |=C2=A0 86 +=
+++---<br>
=C2=A0 ...sic-missing.h-check-for-mis<wbr>sing-strndupa.patch} |=C2=A0 96 +=
+++----<br>
=C2=A0 ...f-GLOB_BRACE-and-GLOB_ALTDI<wbr>RFUNC-is-not-.patch} |=C2=A0 30 +=
--<br>
=C2=A0 ...ssing.h-check-for-missing-_<wbr>_compar_fn_t-.patch} |=C2=A0 18 +=
-<br>
=C2=A0 ...patch =3D&gt; 0017-Include-netinet-if_ether.<wbr>h.patch} |=C2=A0=
 55 +++--<br>
=C2=A0 ...-check-for-missing-canonica<wbr>lize_file_name.patch |=C2=A0 47 +=
+++<br>
=C2=A0 .../0018-check-for-uchar.h-in-<wbr>configure.patch=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 44 ----<br>
=C2=A0 ...le-nss-tests-if-nss-systemd<wbr>-is-not-enable.patch |=C2=A0 29 +=
++<br>
=C2=A0 ...xdecoct.c-Include-missing.h<wbr>-for-strndupa.patch} |=C2=A0 15 +=
-<br>
=C2=A0 ...c-Disable-tests-for-missing<wbr>-typedefs-in-.patch} |=C2=A0 39 +=
+-<br>
=C2=A0 ...=3D&gt; 0022-don-t-use-glibc-specific-<wbr>qsort_r.patch} |=C2=A0=
 26 +-<br>
=C2=A0 ...ss-AT_SYMLINK_NOFOLLOW-flag<wbr>-to-faccessat.patch} |=C2=A0 22 +=
-<br>
=C2=A0 ...n_t-is-glibc-specific-use-r<wbr>aw-signature-.patch} |=C2=A0 14 +=
-<br>
=C2=A0 ...ATH_WTMPX-and-_PATH_UTMPX-i<wbr>f-not-defined.patch} |=C2=A0 16 +=
-<br>
=C2=A0 ...&gt; 0026-Use-uintmax_t-for-handlin<wbr>g-rlim_t.patch} |=C2=A0 2=
2 +-<br>
=C2=A0 .../0027-remove-nobody-user-gr<wbr>oup-checking.patch=C2=A0 =C2=A0|=
=C2=A0 63 +++++<br>
=C2=A0 .../0028-add-missing-FTW_-macr<wbr>os-for-musl.patch=C2=A0 =C2=A0 |=
=C2=A0 50 ++++<br>
=C2=A0 ...nes-Build-conditionally-whe<wbr>n-ENABLE_MYHOS.patch |=C2=A0 43 +=
+++<br>
=C2=A0 ...-of-__register_atfork-for-n<wbr>on-glibc-build.patch |=C2=A0 45 +=
+++<br>
=C2=A0 ...-ULONG_LONG_MAX-definition-<wbr>in-case-of-mus.patch |=C2=A0 30 +=
++<br>
=C2=A0 meta/recipes-core/systemd/syst<wbr>emd/run-ptest=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A06 -<br>
=C2=A0 .../systemd/{<a href=3D"http://systemd_234.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">systemd_234.bb</a> =3D&gt; <a href=3D"http://systemd_237.bb=
" rel=3D"noreferrer" target=3D"_blank">systemd_237.bb</a>}=C2=A0 =C2=A0 =C2=
=A0| 270 +++++++++------------<br>
=C2=A0 50 files changed, 1211 insertions(+), 1295 deletions(-)<br>
=C2=A0 rename meta/recipes-core/systemd/{<a href=3D"http://systemd-boot_234=
.bb" rel=3D"noreferrer" target=3D"_blank">sys<wbr>temd-boot_234.bb</a> =3D&=
gt; <a href=3D"http://systemd-boot_237.bb" rel=3D"noreferrer" target=3D"_bl=
ank">systemd-boot_237.bb</a>} (58%)<br>
=C2=A0 create mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0001-Also-=
check-i386-i586-<wbr>and-i686-for-ia32.patch<br>
=C2=A0 create mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0001-Fix-t=
o-run-efi_cc-<wbr>and-efi_ld-correctly-when-cros<wbr>s-co.patch<br>
=C2=A0 create mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0001-Remov=
e-fstack-protect<wbr>or-flags-to-workaround-musl-<wbr>bui.patch<br>
=C2=A0 rename meta/recipes-core/systemd/syst<wbr>emd/{0004-Use-getenv-when-=
secu<wbr>re-versions-are-not-available.<wbr>patch =3D&gt; 0001-Use-getenv-w=
hen-secure-ve<wbr>rsions-are-not-available.patch<wbr>} (53%)<br>
=C2=A0 delete mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0001-core-=
evaluate-presets<wbr>-after-generators-have-run-<wbr>6526.patch<br>
=C2=A0 delete mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0001-main-=
skip-many-initia<wbr>lization-steps-when-running-<wbr>in-.patch<br>
=C2=A0 delete mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0001-meson=
-update-header-<wbr>file-to-detect-memfd_create.<wbr>patch<br>
=C2=A0 create mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0002-binfm=
t-Don-t-install-<wbr>dependency-links-at-install-<wbr>tim.patch<br>
=C2=A0 delete mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0002-confi=
gure.ac-Check-<wbr>if-memfd_create-is-already-<wbr>define.patch<br>
=C2=A0 delete mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0003-filei=
o-include-sys-<wbr>mman.h.patch<br>
=C2=A0 create mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0003-use-l=
nr-wrapper-inste<wbr>ad-of-looking-for-relative-<wbr>opti.patch<br>
=C2=A0 rename meta/recipes-core/systemd/syst<wbr>emd/{0010-implment-systemd=
-<wbr>sysv-install-for-OE.patch =3D&gt; 0004-implment-systemd-sysv-ins<wbr>=
tall-for-OE.patch} (89%)<br>
=C2=A0 delete mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0005-binfm=
t-Don-t-install-<wbr>dependency-links-at-install-<wbr>tim.patch<br>
=C2=A0 rename meta/recipes-core/systemd/syst<wbr>emd/{0012-rules-whitelist-=
hd-<wbr>devices.patch =3D&gt; 0005-rules-whitelist-hd-device<wbr>s.patch} (=
89%)<br>
=C2=A0 create mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0006-Make-=
root-s-home-dire<wbr>ctory-configurable.patch<br>
=C2=A0 rename meta/recipes-core/systemd/syst<wbr>emd/{0014-Revert-rules-rem=
ove-<wbr>firmware-loading-rules.patch =3D&gt; 0007-Revert-rules-remove-firm=
w<wbr>are-loading-rules.patch} (81%)<br>
=C2=A0 delete mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0007-check=
-for-missing-<wbr>canonicalize_file_name.patch<br>
=C2=A0 delete mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0007-use-l=
nr-wrapper-inste<wbr>ad-of-looking-for-relative-<wbr>opti.patch<br>
=C2=A0 delete mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0008-Do-no=
t-enable-nss-<wbr>tests.patch<br>
=C2=A0 rename meta/recipes-core/systemd/syst<wbr>emd/{0015-Revert-udev-remo=
ve-<wbr>userspace-firmware-loading-<wbr>suppor.patch =3D&gt; 0008-Revert-ud=
ev-remove-usersp<wbr>ace-firmware-loading-suppor.<wbr>patch} (63%)<br>
=C2=A0 rename meta/recipes-core/systemd/syst<wbr>emd/{0017-remove-duplicate=
-<wbr>include-uchar.h.patch =3D&gt; 0009-remove-duplicate-include-<wbr>ucha=
r.h.patch} (78%)<br>
=C2=A0 create mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0010-check=
-for-uchar.h-in-<wbr>meson.build.patch<br>
=C2=A0 delete mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0011-nss-m=
ymachines-Build-<wbr>conditionally-when-HAVE_MYHOST<wbr>N.patch<br>
=C2=A0 rename meta/recipes-core/systemd/syst<wbr>emd/{0019-socket-util-don-=
t-<wbr>fail-if-libc-doesn-t-support-<wbr>IDN.patch =3D&gt; 0011-socket-util=
-don-t-fail-if<wbr>-libc-doesn-t-support-IDN.patc<wbr>h} (58%)<br>
=C2=A0 rename meta/recipes-core/systemd/syst<wbr>emd/{0020-rules-watch-meta=
data<wbr>-changes-in-ide-devices.patch =3D&gt; 0012-rules-watch-metadata-ch=
an<wbr>ges-in-ide-devices.patch} (90%)<br>
=C2=A0 delete mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0013-Make-=
root-s-home-dire<wbr>ctory-configurable.patch<br>
=C2=A0 rename meta/recipes-core/systemd/syst<wbr>emd/{0001-add-fallback-par=
se_<wbr>printf_format-implementation.<wbr>patch =3D&gt; 0013-add-fallback-p=
arse_printf<wbr>_format-implementation.patch} (88%)<br>
=C2=A0 rename meta/recipes-core/systemd/syst<wbr>emd/{0002-src-basic-missin=
g.h-<wbr>check-for-missing-strndupa.<wbr>patch =3D&gt; 0014-src-basic-missi=
ng.h-check<wbr>-for-missing-strndupa.patch} (47%)<br>
=C2=A0 rename meta/recipes-core/systemd/syst<wbr>emd/{0003-don-t-fail-if-GL=
OB_<wbr>BRACE-and-GLOB_ALTDIRFUNC-is-<wbr>not-.patch =3D&gt; 0015-don-t-fai=
l-if-GLOB_BRACE-<wbr>and-GLOB_ALTDIRFUNC-is-not-.pa<wbr>tch} (88%)<br>
=C2=A0 rename meta/recipes-core/systemd/syst<wbr>emd/{0004-src-basic-missin=
g.h-<wbr>check-for-missing-__compar_fn_<wbr>t-.patch =3D&gt; 0016-src-basic=
-missing.h-check<wbr>-for-missing-__compar_fn_t-.<wbr>patch} (77%)<br>
=C2=A0 rename meta/recipes-core/systemd/syst<wbr>emd/{0006-Include-netinet-=
if_<wbr>ether.h.patch =3D&gt; 0017-Include-netinet-if_ether.<wbr>h.patch} (=
67%)<br>
=C2=A0 create mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0018-check=
-for-missing-<wbr>canonicalize_file_name.patch<br>
=C2=A0 delete mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0018-check=
-for-uchar.h-in-<wbr>configure.patch<br>
=C2=A0 create mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0019-Do-no=
t-enable-nss-<wbr>tests-if-nss-systemd-is-not-<wbr>enable.patch<br>
=C2=A0 rename meta/recipes-core/systemd/syst<wbr>emd/{0009-test-hexdecoct.c=
-<wbr>Include-missing.h-form-strndup<wbr>a.patch =3D&gt; 0020-test-hexdecoc=
t.c-Include-<wbr>missing.h-for-strndupa.patch} (68%)<br>
=C2=A0 rename meta/recipes-core/systemd/syst<wbr>emd/{0010-test-sizeof.c-Di=
sabl<wbr>e-tests-for-missing-typedefs-<wbr>in-.patch =3D&gt; 0021-test-size=
of.c-Disable-tes<wbr>ts-for-missing-typedefs-in-.<wbr>patch} (49%)<br>
=C2=A0 rename meta/recipes-core/systemd/syst<wbr>emd/{0011-don-t-use-glibc-=
spec<wbr>ific-qsort_r.patch =3D&gt; 0022-don-t-use-glibc-specific-<wbr>qsor=
t_r.patch} (88%)<br>
=C2=A0 rename meta/recipes-core/systemd/syst<wbr>emd/{0012-don-t-pass-AT_SY=
MLIN<wbr>K_NOFOLLOW-flag-to-faccessat.<wbr>patch =3D&gt; 0023-don-t-pass-AT=
_SYMLINK_NOF<wbr>OLLOW-flag-to-faccessat.patch} (90%)<br>
=C2=A0 rename meta/recipes-core/systemd/syst<wbr>emd/{0013-comparison_fn_t-=
is-<wbr>glibc-specific-use-raw-signatu<wbr>re-.patch =3D&gt; 0024-compariso=
n_fn_t-is-glibc-<wbr>specific-use-raw-signature-.pa<wbr>tch} (77%)<br>
=C2=A0 rename meta/recipes-core/systemd/syst<wbr>emd/{0001-Define-_PATH_WTM=
PX-<wbr>and-_PATH_UTMPX-if-not-defined<wbr>.patch =3D&gt; 0025-Define-_PATH=
_WTMPX-and-_P<wbr>ATH_UTMPX-if-not-defined.patch<wbr>} (80%)<br>
=C2=A0 rename meta/recipes-core/systemd/syst<wbr>emd/{0001-Use-uintmax_t-fo=
r-<wbr>handling-rlim_t.patch =3D&gt; 0026-Use-uintmax_t-for-handlin<wbr>g-r=
lim_t.patch} (89%)<br>
=C2=A0 create mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0027-remov=
e-nobody-user-<wbr>group-checking.patch<br>
=C2=A0 create mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0028-add-m=
issing-FTW_-macr<wbr>os-for-musl.patch<br>
=C2=A0 create mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0029-nss-m=
ymachines-Build-<wbr>conditionally-when-ENABLE_<wbr>MYHOS.patch<br>
=C2=A0 create mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0030-fix-m=
issing-of-__regi<wbr>ster_atfork-for-non-glibc-buil<wbr>d.patch<br>
=C2=A0 create mode 100644 meta/recipes-core/systemd/syst<wbr>emd/0031-fix-m=
issing-ULONG_<wbr>LONG_MAX-definition-in-case-<wbr>of-mus.patch<br>
=C2=A0 delete mode 100644 meta/recipes-core/systemd/syst<wbr>emd/run-ptest<=
br>
=C2=A0 rename meta/recipes-core/systemd/{<a href=3D"http://systemd_234.bb" =
rel=3D"noreferrer" target=3D"_blank">sys<wbr>temd_234.bb</a> =3D&gt; <a hre=
f=3D"http://systemd_237.bb" rel=3D"noreferrer" target=3D"_blank">systemd_23=
7.bb</a>} (71%)<br>
<br>
</blockquote>
<br>
-- <br></div></div><div class=3D"HOEnZb"><div class=3D"h5">
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--000000000000880a390567714759--
