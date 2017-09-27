Return-Path: <matt@madison.systems>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3D1A977D74
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 12:03:06 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id z39so16011134wrb.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 05:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ud/koeoqQ8rUOWGTczA8EvFnQY3ujS53laKcXwMHT64=;
	b=mt7bR7vwXkpd7DjM52hH030er4+3odmlbXafM2YUX/gaD938hfaWT/MizZgQMY4iWp
	xvJ6PFDCdpHxGyeQZ1FG5EfqjVXBjuyn07YXGpbXXN/1HRUHMcBeqj9DIhTlpiWrBjbn
	SwXjAy1Hy5JlY1rha1oyytBtmNmaYqK2cFo7EK6eJvx6ix8H+vTxcwmRWQcDg/+npNAJ
	qd3F3VEv4ihFrskzpwvsW0JiwctEa1XvQ/76vKioHdxrW3zSq58HhFxiY2Md1xgA9EGD
	YKTPBd2MotCIQb8r1tfbZ4VnM8YfPybm3xPBFu+/AbNvBe4ir7jBVdurrDTjjtwq1PSh
	tDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ud/koeoqQ8rUOWGTczA8EvFnQY3ujS53laKcXwMHT64=;
	b=FK5r3K80Cxz/xG0RYupWb9oIk4ZTT67qOn1h+c4yRPb93JWJ+k8MM2+7/MmrIpMyiU
	60oJi68eVz4PDlOoJ9lRpZDSUfeecncMyHcbtTFxK5ELHytzK8CMzl0QudP3ITksxEJ9
	2Md1uf1whO6B+UR03ibWCGhsHqS/Q1AOcbVskEAKC/ilcC6OXpM0VaSJr+jEr5ZCJlck
	YGI+1CqebocNRKa9SjGArzthVrpv+YoWQ5+JLdCRc9ItUkKxeMYYKtaqsQ9qewM0XHDF
	4p63lp2ZBKWA4aHGLPl94ii5sLjXzQG55CV/xF/k3xgh1FtjxkLWCU228G8ycqqXOIzT
	M0kQ==
X-Gm-Message-State: AHPjjUgRYGxcgrvPoNhQ5kYpjuf/ZJqEf63nFwq0WWqVuAxpsvJO3kIv
	XZJe+u4DirDUCbs3VdG3/y+RUH5YiOGh8rEQYxac8Q==
X-Google-Smtp-Source: AOwi7QA3TcJLUReI0iJ1NajITCFYVCks3DqhZhilexAwhi2Mi+hNVeL+8HOIbluH+EqTEHnt1ZOhA7tdNrCUKXwWUkY=
X-Received: by 10.46.25.78 with SMTP id p75mr568025lje.24.1506513787920; Wed,
	27 Sep 2017 05:03:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.225.68 with HTTP; Wed, 27 Sep 2017 05:03:07 -0700 (PDT)
In-Reply-To: <CA+chaQf4jpk5UXY0jzQeQg2+f6QkkSdN5DqVHCdP85rcK-WE+g@mail.gmail.com>
References: <150634558794.9679.11257385804107218293@git.openembedded.org>
	<20170925131948.4E25B23363A@git.openembedded.org>
	<CA+chaQf4jpk5UXY0jzQeQg2+f6QkkSdN5DqVHCdP85rcK-WE+g@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Wed, 27 Sep 2017 05:03:07 -0700
Message-ID: <CAGgRHJrYOQAkFzPuB2C9kkZz_nU_KJDx_b+J4VtCvpkY7yHbyQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 01/08: goarch.bbclass: fixups for Go mips32 support
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
X-List-Received-Date: Wed, 27 Sep 2017 12:03:07 -0000
Content-Type: text/plain; charset="UTF-8"

I just sent a patch that reworks the mips fixups to avoid the variable
dependency that's causing the problem.

Thanks,
-Matt

On Tue, Sep 26, 2017 at 5:15 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> This change (or one of the other 3 go related changes merged recently) seems
> to cause go-native to depend on MACHINE specific DEFAULTTUNE variable.
>
> As detected by oe-core/scripts/sstate-diff-machines.sh
>
> ERROR: go-native different signature for task do_configure.sigdata between
> qemux86 and foo
>
> Task dependencies changed from:
> ['AR', 'AS', 'B', 'BASEDEPENDS', 'BUILD_AR', 'BUILD_AS', 'BUILD_AS_ARCH',
> 'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP',
> 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_GOARCH',
> 'BUILD_GOOS', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM',
> 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB',
> 'BUILD_REPRODUCIBLE_BINARIES', 'BUILD_STRIP', 'BUILD_VENDOR', 'CC', 'CCLD',
> 'CFLAGS', 'CGO_ENABLED', 'CONFIG_SITE', 'CPP', 'CPPFLAGS', 'CXX',
> 'CXXFLAGS', 'DEFAULTTUNE', 'DEPENDS', 'DISABLE_STATIC', 'DISTRO',
> 'EXTRA_NATIVE_PKGCONFIG_PATH', 'EXTRA_OECONF', 'FC', 'GOARCH', 'GOOS',
> 'HOST_PREFIX', 'ICECC_AS', 'ICECC_CC', 'ICECC_CXX', 'ICECC_VERSION',
> 'ICECC_WHICH_AS', 'ICE_PATH', 'LC_ALL', 'LD', 'LDFLAGS', 'LOGFIFO', 'MAKE',
> 'MLPREFIX', 'NATIVE_PACKAGE_PATH_SUFFIX', 'NM', 'OBJCOPY', 'OBJDUMP', 'P',
> 'PACKAGECONFIG', 'PACKAGE_ARCH', 'PKG_CONFIG_DIR',
> 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH',
> 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE',
> 'QA_SANE', 'RANLIB', 'READELF', 'RECIPE_SYSROOT_NATIVE', 'S',
> 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_BINDIR', 'STAGING_BINDIR_NATIVE',
> 'STAGING_DATADIR', 'STAGING_DATADIR_NATIVE', 'STAGING_DIR_NATIVE',
> 'STAGING_ETCDIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR_NATIVE',
> 'STAGING_SBINDIR_NATIVE', 'STRINGS', 'STRIP', 'T', 'TARGET_ARCH',
> 'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS',
> 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_VENDOR',
> 'TUNE_FEATURES', 'TUNE_FEATURES_tune-i586', 'TUNE_FEATURES_tune-x86',
> 'UNKNOWN_CONFIGURE_WHITELIST', 'base_bindir', 'base_libdir',
> 'base_libdir_native', 'base_prefix', 'base_sbindir', 'baselib', 'bbnote',
> 'bbwarn', 'bindir', 'bindir_cross', 'bindir_native', 'create_path',
> 'datadir', 'datadir_native', 'do_qa_configure', 'docdir', 'exec_prefix',
> 'get_cross_kernel_cc', 'get_icecc', 'go_map_arch', 'go_map_os',
> 'icecc_dep_prepend', 'icecc_get_and_check_tool', 'icecc_get_external_tool',
> 'icecc_get_tool', 'icecc_is_allarch', 'icecc_is_kernel', 'icecc_is_native',
> 'icecc_path', 'icecc_version', 'includedir', 'includedir_native', 'infodir',
> 'libdir', 'libdir_native', 'libexecdir', 'localstatedir',
> 'lt_cv_sys_lib_dlsearch_path_spec', 'mandir', 'nonarch_base_libdir',
> 'nonarch_libdir', 'oldincludedir', 'package_qa_handle_error',
> 'package_qa_write_error', 'prefix', 'prefix_native', 'root_prefix',
> 'sbindir', 'sbindir_native', 'servicedir', 'set_icecc_env',
> 'sharedstatedir', 'sysconfdir', 'sysconfdir_native',
> 'systemd_system_unitdir', 'systemd_unitdir', 'systemd_user_unitdir',
> 'use_icecc']
> to:
> ['AR', 'AS', 'B', 'BASEDEPENDS', 'BUILD_AR', 'BUILD_AS', 'BUILD_AS_ARCH',
> 'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP',
> 'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC', 'BUILD_GOARCH',
> 'BUILD_GOOS', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH', 'BUILD_NM',
> 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX', 'BUILD_RANLIB',
> 'BUILD_REPRODUCIBLE_BINARIES', 'BUILD_STRIP', 'BUILD_VENDOR', 'CC', 'CCLD',
> 'CFLAGS', 'CGO_ENABLED', 'CONFIG_SITE', 'CPP', 'CPPFLAGS', 'CXX',
> 'CXXFLAGS', 'DEFAULTTUNE', 'DEPENDS', 'DISABLE_STATIC', 'DISTRO',
> 'EXTRA_NATIVE_PKGCONFIG_PATH', 'EXTRA_OECONF', 'FC', 'GOARCH', 'GOOS',
> 'HOST_PREFIX', 'ICECC_AS', 'ICECC_CC', 'ICECC_CXX', 'ICECC_VERSION',
> 'ICECC_WHICH_AS', 'ICE_PATH', 'LC_ALL', 'LD', 'LDFLAGS', 'LOGFIFO', 'MAKE',
> 'MLPREFIX', 'NATIVE_PACKAGE_PATH_SUFFIX', 'NM', 'OBJCOPY', 'OBJDUMP', 'P',
> 'PACKAGECONFIG', 'PACKAGE_ARCH', 'PKG_CONFIG_DIR',
> 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR', 'PKG_CONFIG_PATH',
> 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PSEUDO_DISABLED', 'PV', 'QA_LOGFILE',
> 'QA_SANE', 'RANLIB', 'READELF', 'RECIPE_SYSROOT_NATIVE', 'S',
> 'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_BINDIR', 'STAGING_BINDIR_NATIVE',
> 'STAGING_DATADIR', 'STAGING_DATADIR_NATIVE', 'STAGING_DIR_NATIVE',
> 'STAGING_ETCDIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR_NATIVE',
> 'STAGING_SBINDIR_NATIVE', 'STRINGS', 'STRIP', 'T', 'TARGET_ARCH',
> 'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS',
> 'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_VENDOR',
> 'TUNE_FEATURES', 'TUNE_FEATURES_tune-armv7a', 'TUNE_FEATURES_tune-armv7at',
> 'TUNE_FEATURES_tune-armv7at-neon', 'TUNE_FEATURES_tune-cortexa9t-neon',
> 'TUNE_FEATURES_tune-webos-tune-ca9v1', 'UNKNOWN_CONFIGURE_WHITELIST',
> 'base_bindir', 'base_libdir', 'base_libdir_native', 'base_prefix',
> 'base_sbindir', 'baselib', 'bbnote', 'bbwarn', 'bindir', 'bindir_cross',
> 'bindir_native', 'create_path', 'datadir', 'datadir_native',
> 'do_qa_configure', 'docdir', 'exec_prefix', 'get_cross_kernel_cc',
> 'get_icecc', 'go_map_arch', 'go_map_os', 'icecc_dep_prepend',
> 'icecc_get_and_check_tool', 'icecc_get_external_tool', 'icecc_get_tool',
> 'icecc_is_allarch', 'icecc_is_kernel', 'icecc_is_native', 'icecc_path',
> 'icecc_version', 'includedir', 'includedir_native', 'infodir', 'libdir',
> 'libdir_native', 'libexecdir', 'localstatedir',
> 'lt_cv_sys_lib_dlsearch_path_spec', 'mandir', 'nonarch_base_libdir',
> 'nonarch_libdir', 'oldincludedir', 'package_qa_handle_error',
> 'package_qa_write_error', 'prefix', 'prefix_native', 'root_prefix',
> 'sbindir', 'sbindir_native', 'servicedir', 'set_icecc_env',
> 'sharedstatedir', 'sysconfdir', 'sysconfdir_native',
> 'systemd_system_unitdir', 'systemd_unitdir', 'systemd_user_unitdir',
> 'use_icecc']
> basehash changed from c9b68d1fd3b5cabc8e1a1d90f9679613 to
> c93e5a979d443f1a235d14d25b9945d7
> List of dependencies for variable TUNE_FEATURES changed from
> '{'DEFAULTTUNE', 'TUNE_FEATURES_tune-i586'}' to '{'DEFAULTTUNE',
> 'TUNE_FEATURES_tune-webos-tune-ca9v1'}'
> changed items: {'TUNE_FEATURES_tune-webos-tune-ca9v1',
> 'TUNE_FEATURES_tune-i586'}
>
> On Mon, Sep 25, 2017 at 3:19 PM, <git@git.openembedded.org> wrote:
>>
>> This is an automated email from the git hooks/post-receive script.
>>
>> rpurdie pushed a commit to branch master-next
>> in repository openembedded-core.
>>
>> commit bdd20c296048937737da0f10bd1a3b63843c5bf4
>> Author: Matt Madison <matt@madison.systems>
>> AuthorDate: Fri Sep 22 17:58:20 2017 -0700
>>
>>     goarch.bbclass: fixups for Go mips32 support
>>
>>     * Fix the regular expression in the mips test
>>
>>     * Flag as incompatible any mips32 tunes for n32 ABI
>>       or soft-float, as go does not support them.
>>
>>     * Replace mips32r2 tune with mips32r1. Go only supports
>>       mips32r1, which is a strict subset of r2.  Adjusting
>>       this tune is not ideal, but is hopefully a temporary
>>       measure until more complete mips32 ISA coverage
>>       arrives upstream.
>>
>>     [YOCTO #12108]
>>
>>     Signed-off-by: Matt Madison <matt@madison.systems>
>>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>  meta/classes/goarch.bbclass | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
>> index 8b95c5f..9ed562d 100644
>> --- a/meta/classes/goarch.bbclass
>> +++ b/meta/classes/goarch.bbclass
>> @@ -43,10 +43,14 @@ def go_map_arch(a, d):
>>          return 'mips64le'
>>      elif re.match('mips64*', a):
>>          return 'mips64'
>> -    elif re.match('mipsel*', a):
>> -        return 'mipsle'
>> -    elif re.match('mips*', a):
>> -        return 'mips'
>> +    elif re.match('mips.*', a):
>> +        tf = d.getVar('TUNE_FEATURES').split()
>> +        if 'fpu-hard' in tf and 'n32' not in tf:
>> +            if 'mips32r2' in tf:
>> +                newtf = [t for t in tf if t != 'mips32r2']
>> +                newtf.append('mips32')
>> +                d.setVar('TUNE_FEATURES', ' '.join(newtf))
>> +            return 'mips' if 'bigendian' in tf else 'mipsle'
>>      elif re.match('p(pc|owerpc)(64)', a):
>>          return 'ppc64'
>>      elif re.match('p(pc|owerpc)(64el)', a):
>>
>> --
>> To stop receiving notification emails like this one, please contact
>> the administrator of this repository.
>> --
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>
>

