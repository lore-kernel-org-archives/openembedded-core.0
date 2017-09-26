Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id E95B671A8D;
	Tue, 26 Sep 2017 12:15:45 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id b9so2416619wra.0;
	Tue, 26 Sep 2017 05:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qU8yr/a+p9Lj9AaNLf+ImWHN1qkuVr8mT5gTzNr4wNc=;
	b=QZNN7EI/BrD3PtE+TA9GLNz+X1fMzIt2G1ll2MQpFXbkWxIlofQ7mJIBgj9x9MMZXt
	PgsGI547FLDj2SwWqKZhmXl+ajXFQQmqv2EbIwH9QiqzwJeGMAYT/kJi34zWvdoRURza
	jFfwcjiJ1McpAInJC6pLiAE+qCsbkzstt8on4uFzXfFansoGfV3vn6+ECtpp/xBVmJzu
	juS9JwEF0dWccVG0KRKRgaV3ud0SEndmrhW2JWG7xgxDJ608PGzgnlODHGTXkImC5pvj
	9ygIDDqCRKCVlC54DQpyxJe/annipv+aFGI/GtDW+VklosXiQOU42pFCabnkcwMc+/ht
	vVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qU8yr/a+p9Lj9AaNLf+ImWHN1qkuVr8mT5gTzNr4wNc=;
	b=LYS6KT/LeIABiACqEbYbci6CM87fEdvkYjhRnvFQWOg2ezbS+ZQeaOeVXfruH4qTZI
	jsSK6mZ99ThDNNZhlaS8mw0/lBvRCx5+aBucOmHgfQHIDopSpVgQyaN0euKw5hqEV954
	Aae04JAkOSaDegqD+pyR0YL+AOFYzCGo7iKPVRPRKu9UPeaU6m5osL5LdAauNLiKwDPg
	V0tnOgENElPEFma9dmeXq2aL+YBpGR42P1UxObPjiwujg0Y3DCGvjzpl9mkM4xUleIlj
	m/a1MXzMbpjZv7aMMTaizluH61BSdpGsCDdz3lEVIWcfJb6wLVr4DBH3snmus7RnHmsA
	Rsug==
X-Gm-Message-State: AHPjjUgSJnYZCa9JGlb3l34PmwgIDo3arRjVnJ69fFPINZqFqHJk8vU8
	zUMveO+3YhbK6K0w/BDoCwAU0h0tmwYxGO8DA30Ksg==
X-Google-Smtp-Source: AOwi7QCF3jkBLEfTD8AxrhaHlhGlEfaI8oXl+tqCEsxkc8iGotxuZio8BM9qYbozBWoeH7ExXSSMUD/h46bWk03k8Uo=
X-Received: by 10.223.161.22 with SMTP id o22mr7929043wro.99.1506428146548;
	Tue, 26 Sep 2017 05:15:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.147.202 with HTTP; Tue, 26 Sep 2017 05:15:45 -0700 (PDT)
In-Reply-To: <20170925131948.4E25B23363A@git.openembedded.org>
References: <150634558794.9679.11257385804107218293@git.openembedded.org>
	<20170925131948.4E25B23363A@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 26 Sep 2017 14:15:45 +0200
Message-ID: <CA+chaQf4jpk5UXY0jzQeQg2+f6QkkSdN5DqVHCdP85rcK-WE+g@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
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
X-List-Received-Date: Tue, 26 Sep 2017 12:15:46 -0000
Content-Type: multipart/alternative; boundary="f403045e20768e0478055a16a283"

--f403045e20768e0478055a16a283
Content-Type: text/plain; charset="UTF-8"

This change (or one of the other 3 go related changes merged recently)
seems to cause go-native to depend on MACHINE specific DEFAULTTUNE variable.

As detected by oe-core/scripts/sstate-diff-machines.sh

ERROR: go-native different signature for task do_configure.sigdata between
qemux86 and foo

Task dependencies changed from:
['AR', 'AS', 'B', 'BASEDEPENDS', 'BUILD_AR', 'BUILD_AS', 'BUILD_AS_ARCH',
'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP',
'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC',
'BUILD_GOARCH', 'BUILD_GOOS', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH',
'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX',
'BUILD_RANLIB', 'BUILD_REPRODUCIBLE_BINARIES', 'BUILD_STRIP',
'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CGO_ENABLED', 'CONFIG_SITE',
'CPP', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'DEFAULTTUNE', 'DEPENDS',
'DISABLE_STATIC', 'DISTRO', 'EXTRA_NATIVE_PKGCONFIG_PATH', 'EXTRA_OECONF',
'FC', 'GOARCH', 'GOOS', 'HOST_PREFIX', 'ICECC_AS', 'ICECC_CC', 'ICECC_CXX',
'ICECC_VERSION', 'ICECC_WHICH_AS', 'ICE_PATH', 'LC_ALL', 'LD', 'LDFLAGS',
'LOGFIFO', 'MAKE', 'MLPREFIX', 'NATIVE_PACKAGE_PATH_SUFFIX', 'NM',
'OBJCOPY', 'OBJDUMP', 'P', 'PACKAGECONFIG', 'PACKAGE_ARCH',
'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR',
'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PSEUDO_DISABLED', 'PV',
'QA_LOGFILE', 'QA_SANE', 'RANLIB', 'READELF', 'RECIPE_SYSROOT_NATIVE', 'S',
'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_BINDIR', 'STAGING_BINDIR_NATIVE',
'STAGING_DATADIR', 'STAGING_DATADIR_NATIVE', 'STAGING_DIR_NATIVE',
'STAGING_ETCDIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR_NATIVE',
'STAGING_SBINDIR_NATIVE', 'STRINGS', 'STRIP', 'T', 'TARGET_ARCH',
'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS',
'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_VENDOR',
'TUNE_FEATURES', 'TUNE_FEATURES_tune-i586', 'TUNE_FEATURES_tune-x86',
'UNKNOWN_CONFIGURE_WHITELIST', 'base_bindir', 'base_libdir',
'base_libdir_native', 'base_prefix', 'base_sbindir', 'baselib', 'bbnote',
'bbwarn', 'bindir', 'bindir_cross', 'bindir_native', 'create_path',
'datadir', 'datadir_native', 'do_qa_configure', 'docdir', 'exec_prefix',
'get_cross_kernel_cc', 'get_icecc', 'go_map_arch', 'go_map_os',
'icecc_dep_prepend', 'icecc_get_and_check_tool', 'icecc_get_external_tool',
'icecc_get_tool', 'icecc_is_allarch', 'icecc_is_kernel', 'icecc_is_native',
'icecc_path', 'icecc_version', 'includedir', 'includedir_native',
'infodir', 'libdir', 'libdir_native', 'libexecdir', 'localstatedir',
'lt_cv_sys_lib_dlsearch_path_spec', 'mandir', 'nonarch_base_libdir',
'nonarch_libdir', 'oldincludedir', 'package_qa_handle_error',
'package_qa_write_error', 'prefix', 'prefix_native', 'root_prefix',
'sbindir', 'sbindir_native', 'servicedir', 'set_icecc_env',
'sharedstatedir', 'sysconfdir', 'sysconfdir_native',
'systemd_system_unitdir', 'systemd_unitdir', 'systemd_user_unitdir',
'use_icecc']
to:
['AR', 'AS', 'B', 'BASEDEPENDS', 'BUILD_AR', 'BUILD_AS', 'BUILD_AS_ARCH',
'BUILD_CC', 'BUILD_CCLD', 'BUILD_CC_ARCH', 'BUILD_CFLAGS', 'BUILD_CPP',
'BUILD_CPPFLAGS', 'BUILD_CXX', 'BUILD_CXXFLAGS', 'BUILD_FC',
'BUILD_GOARCH', 'BUILD_GOOS', 'BUILD_LD', 'BUILD_LDFLAGS', 'BUILD_LD_ARCH',
'BUILD_NM', 'BUILD_OPTIMIZATION', 'BUILD_OS', 'BUILD_PREFIX',
'BUILD_RANLIB', 'BUILD_REPRODUCIBLE_BINARIES', 'BUILD_STRIP',
'BUILD_VENDOR', 'CC', 'CCLD', 'CFLAGS', 'CGO_ENABLED', 'CONFIG_SITE',
'CPP', 'CPPFLAGS', 'CXX', 'CXXFLAGS', 'DEFAULTTUNE', 'DEPENDS',
'DISABLE_STATIC', 'DISTRO', 'EXTRA_NATIVE_PKGCONFIG_PATH', 'EXTRA_OECONF',
'FC', 'GOARCH', 'GOOS', 'HOST_PREFIX', 'ICECC_AS', 'ICECC_CC', 'ICECC_CXX',
'ICECC_VERSION', 'ICECC_WHICH_AS', 'ICE_PATH', 'LC_ALL', 'LD', 'LDFLAGS',
'LOGFIFO', 'MAKE', 'MLPREFIX', 'NATIVE_PACKAGE_PATH_SUFFIX', 'NM',
'OBJCOPY', 'OBJDUMP', 'P', 'PACKAGECONFIG', 'PACKAGE_ARCH',
'PKG_CONFIG_DIR', 'PKG_CONFIG_DISABLE_UNINSTALLED', 'PKG_CONFIG_LIBDIR',
'PKG_CONFIG_PATH', 'PKG_CONFIG_SYSROOT_DIR', 'PN', 'PSEUDO_DISABLED', 'PV',
'QA_LOGFILE', 'QA_SANE', 'RANLIB', 'READELF', 'RECIPE_SYSROOT_NATIVE', 'S',
'STAGING_BASE_LIBDIR_NATIVE', 'STAGING_BINDIR', 'STAGING_BINDIR_NATIVE',
'STAGING_DATADIR', 'STAGING_DATADIR_NATIVE', 'STAGING_DIR_NATIVE',
'STAGING_ETCDIR_NATIVE', 'STAGING_INCDIR_NATIVE', 'STAGING_LIBDIR_NATIVE',
'STAGING_SBINDIR_NATIVE', 'STRINGS', 'STRIP', 'T', 'TARGET_ARCH',
'TARGET_CFLAGS', 'TARGET_CPPFLAGS', 'TARGET_CXXFLAGS', 'TARGET_LDFLAGS',
'TARGET_OS', 'TARGET_PREFIX', 'TARGET_SYS', 'TARGET_VENDOR',
'TUNE_FEATURES', 'TUNE_FEATURES_tune-armv7a', 'TUNE_FEATURES_tune-armv7at',
'TUNE_FEATURES_tune-armv7at-neon', 'TUNE_FEATURES_tune-cortexa9t-neon',
'TUNE_FEATURES_tune-webos-tune-ca9v1', 'UNKNOWN_CONFIGURE_WHITELIST',
'base_bindir', 'base_libdir', 'base_libdir_native', 'base_prefix',
'base_sbindir', 'baselib', 'bbnote', 'bbwarn', 'bindir', 'bindir_cross',
'bindir_native', 'create_path', 'datadir', 'datadir_native',
'do_qa_configure', 'docdir', 'exec_prefix', 'get_cross_kernel_cc',
'get_icecc', 'go_map_arch', 'go_map_os', 'icecc_dep_prepend',
'icecc_get_and_check_tool', 'icecc_get_external_tool', 'icecc_get_tool',
'icecc_is_allarch', 'icecc_is_kernel', 'icecc_is_native', 'icecc_path',
'icecc_version', 'includedir', 'includedir_native', 'infodir', 'libdir',
'libdir_native', 'libexecdir', 'localstatedir',
'lt_cv_sys_lib_dlsearch_path_spec', 'mandir', 'nonarch_base_libdir',
'nonarch_libdir', 'oldincludedir', 'package_qa_handle_error',
'package_qa_write_error', 'prefix', 'prefix_native', 'root_prefix',
'sbindir', 'sbindir_native', 'servicedir', 'set_icecc_env',
'sharedstatedir', 'sysconfdir', 'sysconfdir_native',
'systemd_system_unitdir', 'systemd_unitdir', 'systemd_user_unitdir',
'use_icecc']
basehash changed from c9b68d1fd3b5cabc8e1a1d90f9679613 to
c93e5a979d443f1a235d14d25b9945d7
List of dependencies for variable TUNE_FEATURES changed from
'{'DEFAULTTUNE', 'TUNE_FEATURES_tune-i586'}' to '{'DEFAULTTUNE',
'TUNE_FEATURES_tune-webos-tune-ca9v1'}'
changed items: {'TUNE_FEATURES_tune-webos-tune-ca9v1',
'TUNE_FEATURES_tune-i586'}

On Mon, Sep 25, 2017 at 3:19 PM, <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a commit to branch master-next
> in repository openembedded-core.
>
> commit bdd20c296048937737da0f10bd1a3b63843c5bf4
> Author: Matt Madison <matt@madison.systems>
> AuthorDate: Fri Sep 22 17:58:20 2017 -0700
>
>     goarch.bbclass: fixups for Go mips32 support
>
>     * Fix the regular expression in the mips test
>
>     * Flag as incompatible any mips32 tunes for n32 ABI
>       or soft-float, as go does not support them.
>
>     * Replace mips32r2 tune with mips32r1. Go only supports
>       mips32r1, which is a strict subset of r2.  Adjusting
>       this tune is not ideal, but is hopefully a temporary
>       measure until more complete mips32 ISA coverage
>       arrives upstream.
>
>     [YOCTO #12108]
>
>     Signed-off-by: Matt Madison <matt@madison.systems>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/goarch.bbclass | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> index 8b95c5f..9ed562d 100644
> --- a/meta/classes/goarch.bbclass
> +++ b/meta/classes/goarch.bbclass
> @@ -43,10 +43,14 @@ def go_map_arch(a, d):
>          return 'mips64le'
>      elif re.match('mips64*', a):
>          return 'mips64'
> -    elif re.match('mipsel*', a):
> -        return 'mipsle'
> -    elif re.match('mips*', a):
> -        return 'mips'
> +    elif re.match('mips.*', a):
> +        tf = d.getVar('TUNE_FEATURES').split()
> +        if 'fpu-hard' in tf and 'n32' not in tf:
> +            if 'mips32r2' in tf:
> +                newtf = [t for t in tf if t != 'mips32r2']
> +                newtf.append('mips32')
> +                d.setVar('TUNE_FEATURES', ' '.join(newtf))
> +            return 'mips' if 'bigendian' in tf else 'mipsle'
>      elif re.match('p(pc|owerpc)(64)', a):
>          return 'ppc64'
>      elif re.match('p(pc|owerpc)(64el)', a):
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

--f403045e20768e0478055a16a283
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This change (or one of the other 3 go related changes merg=
ed recently) seems to cause go-native to depend on MACHINE specific DEFAULT=
TUNE variable.<div><br></div><div>As detected by=C2=A0oe-core/scripts/sstat=
e-diff-machines.sh</div><div><br></div><div><div>ERROR: go-native different=
 signature for task do_configure.sigdata between qemux86 and foo</div><div>=
<br></div><div>Task dependencies changed from:</div><div>[&#39;AR&#39;, &#3=
9;AS&#39;, &#39;B&#39;, &#39;BASEDEPENDS&#39;, &#39;BUILD_AR&#39;, &#39;BUI=
LD_AS&#39;, &#39;BUILD_AS_ARCH&#39;, &#39;BUILD_CC&#39;, &#39;BUILD_CCLD&#3=
9;, &#39;BUILD_CC_ARCH&#39;, &#39;BUILD_CFLAGS&#39;, &#39;BUILD_CPP&#39;, &=
#39;BUILD_CPPFLAGS&#39;, &#39;BUILD_CXX&#39;, &#39;BUILD_CXXFLAGS&#39;, &#3=
9;BUILD_FC&#39;, &#39;BUILD_GOARCH&#39;, &#39;BUILD_GOOS&#39;, &#39;BUILD_L=
D&#39;, &#39;BUILD_LDFLAGS&#39;, &#39;BUILD_LD_ARCH&#39;, &#39;BUILD_NM&#39=
;, &#39;BUILD_OPTIMIZATION&#39;, &#39;BUILD_OS&#39;, &#39;BUILD_PREFIX&#39;=
, &#39;BUILD_RANLIB&#39;, &#39;BUILD_REPRODUCIBLE_BINARIES&#39;, &#39;BUILD=
_STRIP&#39;, &#39;BUILD_VENDOR&#39;, &#39;CC&#39;, &#39;CCLD&#39;, &#39;CFL=
AGS&#39;, &#39;CGO_ENABLED&#39;, &#39;CONFIG_SITE&#39;, &#39;CPP&#39;, &#39=
;CPPFLAGS&#39;, &#39;CXX&#39;, &#39;CXXFLAGS&#39;, &#39;DEFAULTTUNE&#39;, &=
#39;DEPENDS&#39;, &#39;DISABLE_STATIC&#39;, &#39;DISTRO&#39;, &#39;EXTRA_NA=
TIVE_PKGCONFIG_PATH&#39;, &#39;EXTRA_OECONF&#39;, &#39;FC&#39;, &#39;GOARCH=
&#39;, &#39;GOOS&#39;, &#39;HOST_PREFIX&#39;, &#39;ICECC_AS&#39;, &#39;ICEC=
C_CC&#39;, &#39;ICECC_CXX&#39;, &#39;ICECC_VERSION&#39;, &#39;ICECC_WHICH_A=
S&#39;, &#39;ICE_PATH&#39;, &#39;LC_ALL&#39;, &#39;LD&#39;, &#39;LDFLAGS&#3=
9;, &#39;LOGFIFO&#39;, &#39;MAKE&#39;, &#39;MLPREFIX&#39;, &#39;NATIVE_PACK=
AGE_PATH_SUFFIX&#39;, &#39;NM&#39;, &#39;OBJCOPY&#39;, &#39;OBJDUMP&#39;, &=
#39;P&#39;, &#39;PACKAGECONFIG&#39;, &#39;PACKAGE_ARCH&#39;, &#39;PKG_CONFI=
G_DIR&#39;, &#39;PKG_CONFIG_DISABLE_UNINSTALLED&#39;, &#39;PKG_CONFIG_LIBDI=
R&#39;, &#39;PKG_CONFIG_PATH&#39;, &#39;PKG_CONFIG_SYSROOT_DIR&#39;, &#39;P=
N&#39;, &#39;PSEUDO_DISABLED&#39;, &#39;PV&#39;, &#39;QA_LOGFILE&#39;, &#39=
;QA_SANE&#39;, &#39;RANLIB&#39;, &#39;READELF&#39;, &#39;RECIPE_SYSROOT_NAT=
IVE&#39;, &#39;S&#39;, &#39;STAGING_BASE_LIBDIR_NATIVE&#39;, &#39;STAGING_B=
INDIR&#39;, &#39;STAGING_BINDIR_NATIVE&#39;, &#39;STAGING_DATADIR&#39;, &#3=
9;STAGING_DATADIR_NATIVE&#39;, &#39;STAGING_DIR_NATIVE&#39;, &#39;STAGING_E=
TCDIR_NATIVE&#39;, &#39;STAGING_INCDIR_NATIVE&#39;, &#39;STAGING_LIBDIR_NAT=
IVE&#39;, &#39;STAGING_SBINDIR_NATIVE&#39;, &#39;STRINGS&#39;, &#39;STRIP&#=
39;, &#39;T&#39;, &#39;TARGET_ARCH&#39;, &#39;TARGET_CFLAGS&#39;, &#39;TARG=
ET_CPPFLAGS&#39;, &#39;TARGET_CXXFLAGS&#39;, &#39;TARGET_LDFLAGS&#39;, &#39=
;TARGET_OS&#39;, &#39;TARGET_PREFIX&#39;, &#39;TARGET_SYS&#39;, &#39;TARGET=
_VENDOR&#39;, &#39;TUNE_FEATURES&#39;, &#39;TUNE_FEATURES_tune-i586&#39;, &=
#39;TUNE_FEATURES_tune-x86&#39;, &#39;UNKNOWN_CONFIGURE_WHITELIST&#39;, &#3=
9;base_bindir&#39;, &#39;base_libdir&#39;, &#39;base_libdir_native&#39;, &#=
39;base_prefix&#39;, &#39;base_sbindir&#39;, &#39;baselib&#39;, &#39;bbnote=
&#39;, &#39;bbwarn&#39;, &#39;bindir&#39;, &#39;bindir_cross&#39;, &#39;bin=
dir_native&#39;, &#39;create_path&#39;, &#39;datadir&#39;, &#39;datadir_nat=
ive&#39;, &#39;do_qa_configure&#39;, &#39;docdir&#39;, &#39;exec_prefix&#39=
;, &#39;get_cross_kernel_cc&#39;, &#39;get_icecc&#39;, &#39;go_map_arch&#39=
;, &#39;go_map_os&#39;, &#39;icecc_dep_prepend&#39;, &#39;icecc_get_and_che=
ck_tool&#39;, &#39;icecc_get_external_tool&#39;, &#39;icecc_get_tool&#39;, =
&#39;icecc_is_allarch&#39;, &#39;icecc_is_kernel&#39;, &#39;icecc_is_native=
&#39;, &#39;icecc_path&#39;, &#39;icecc_version&#39;, &#39;includedir&#39;,=
 &#39;includedir_native&#39;, &#39;infodir&#39;, &#39;libdir&#39;, &#39;lib=
dir_native&#39;, &#39;libexecdir&#39;, &#39;localstatedir&#39;, &#39;lt_cv_=
sys_lib_dlsearch_path_spec&#39;, &#39;mandir&#39;, &#39;nonarch_base_libdir=
&#39;, &#39;nonarch_libdir&#39;, &#39;oldincludedir&#39;, &#39;package_qa_h=
andle_error&#39;, &#39;package_qa_write_error&#39;, &#39;prefix&#39;, &#39;=
prefix_native&#39;, &#39;root_prefix&#39;, &#39;sbindir&#39;, &#39;sbindir_=
native&#39;, &#39;servicedir&#39;, &#39;set_icecc_env&#39;, &#39;sharedstat=
edir&#39;, &#39;sysconfdir&#39;, &#39;sysconfdir_native&#39;, &#39;systemd_=
system_unitdir&#39;, &#39;systemd_unitdir&#39;, &#39;systemd_user_unitdir&#=
39;, &#39;use_icecc&#39;]</div><div>to:</div><div>[&#39;AR&#39;, &#39;AS&#3=
9;, &#39;B&#39;, &#39;BASEDEPENDS&#39;, &#39;BUILD_AR&#39;, &#39;BUILD_AS&#=
39;, &#39;BUILD_AS_ARCH&#39;, &#39;BUILD_CC&#39;, &#39;BUILD_CCLD&#39;, &#3=
9;BUILD_CC_ARCH&#39;, &#39;BUILD_CFLAGS&#39;, &#39;BUILD_CPP&#39;, &#39;BUI=
LD_CPPFLAGS&#39;, &#39;BUILD_CXX&#39;, &#39;BUILD_CXXFLAGS&#39;, &#39;BUILD=
_FC&#39;, &#39;BUILD_GOARCH&#39;, &#39;BUILD_GOOS&#39;, &#39;BUILD_LD&#39;,=
 &#39;BUILD_LDFLAGS&#39;, &#39;BUILD_LD_ARCH&#39;, &#39;BUILD_NM&#39;, &#39=
;BUILD_OPTIMIZATION&#39;, &#39;BUILD_OS&#39;, &#39;BUILD_PREFIX&#39;, &#39;=
BUILD_RANLIB&#39;, &#39;BUILD_REPRODUCIBLE_BINARIES&#39;, &#39;BUILD_STRIP&=
#39;, &#39;BUILD_VENDOR&#39;, &#39;CC&#39;, &#39;CCLD&#39;, &#39;CFLAGS&#39=
;, &#39;CGO_ENABLED&#39;, &#39;CONFIG_SITE&#39;, &#39;CPP&#39;, &#39;CPPFLA=
GS&#39;, &#39;CXX&#39;, &#39;CXXFLAGS&#39;, &#39;DEFAULTTUNE&#39;, &#39;DEP=
ENDS&#39;, &#39;DISABLE_STATIC&#39;, &#39;DISTRO&#39;, &#39;EXTRA_NATIVE_PK=
GCONFIG_PATH&#39;, &#39;EXTRA_OECONF&#39;, &#39;FC&#39;, &#39;GOARCH&#39;, =
&#39;GOOS&#39;, &#39;HOST_PREFIX&#39;, &#39;ICECC_AS&#39;, &#39;ICECC_CC&#3=
9;, &#39;ICECC_CXX&#39;, &#39;ICECC_VERSION&#39;, &#39;ICECC_WHICH_AS&#39;,=
 &#39;ICE_PATH&#39;, &#39;LC_ALL&#39;, &#39;LD&#39;, &#39;LDFLAGS&#39;, &#3=
9;LOGFIFO&#39;, &#39;MAKE&#39;, &#39;MLPREFIX&#39;, &#39;NATIVE_PACKAGE_PAT=
H_SUFFIX&#39;, &#39;NM&#39;, &#39;OBJCOPY&#39;, &#39;OBJDUMP&#39;, &#39;P&#=
39;, &#39;PACKAGECONFIG&#39;, &#39;PACKAGE_ARCH&#39;, &#39;PKG_CONFIG_DIR&#=
39;, &#39;PKG_CONFIG_DISABLE_UNINSTALLED&#39;, &#39;PKG_CONFIG_LIBDIR&#39;,=
 &#39;PKG_CONFIG_PATH&#39;, &#39;PKG_CONFIG_SYSROOT_DIR&#39;, &#39;PN&#39;,=
 &#39;PSEUDO_DISABLED&#39;, &#39;PV&#39;, &#39;QA_LOGFILE&#39;, &#39;QA_SAN=
E&#39;, &#39;RANLIB&#39;, &#39;READELF&#39;, &#39;RECIPE_SYSROOT_NATIVE&#39=
;, &#39;S&#39;, &#39;STAGING_BASE_LIBDIR_NATIVE&#39;, &#39;STAGING_BINDIR&#=
39;, &#39;STAGING_BINDIR_NATIVE&#39;, &#39;STAGING_DATADIR&#39;, &#39;STAGI=
NG_DATADIR_NATIVE&#39;, &#39;STAGING_DIR_NATIVE&#39;, &#39;STAGING_ETCDIR_N=
ATIVE&#39;, &#39;STAGING_INCDIR_NATIVE&#39;, &#39;STAGING_LIBDIR_NATIVE&#39=
;, &#39;STAGING_SBINDIR_NATIVE&#39;, &#39;STRINGS&#39;, &#39;STRIP&#39;, &#=
39;T&#39;, &#39;TARGET_ARCH&#39;, &#39;TARGET_CFLAGS&#39;, &#39;TARGET_CPPF=
LAGS&#39;, &#39;TARGET_CXXFLAGS&#39;, &#39;TARGET_LDFLAGS&#39;, &#39;TARGET=
_OS&#39;, &#39;TARGET_PREFIX&#39;, &#39;TARGET_SYS&#39;, &#39;TARGET_VENDOR=
&#39;, &#39;TUNE_FEATURES&#39;, &#39;TUNE_FEATURES_tune-armv7a&#39;, &#39;T=
UNE_FEATURES_tune-armv7at&#39;, &#39;TUNE_FEATURES_tune-armv7at-neon&#39;, =
&#39;TUNE_FEATURES_tune-cortexa9t-neon&#39;, &#39;TUNE_FEATURES_tune-webos-=
tune-ca9v1&#39;, &#39;UNKNOWN_CONFIGURE_WHITELIST&#39;, &#39;base_bindir&#3=
9;, &#39;base_libdir&#39;, &#39;base_libdir_native&#39;, &#39;base_prefix&#=
39;, &#39;base_sbindir&#39;, &#39;baselib&#39;, &#39;bbnote&#39;, &#39;bbwa=
rn&#39;, &#39;bindir&#39;, &#39;bindir_cross&#39;, &#39;bindir_native&#39;,=
 &#39;create_path&#39;, &#39;datadir&#39;, &#39;datadir_native&#39;, &#39;d=
o_qa_configure&#39;, &#39;docdir&#39;, &#39;exec_prefix&#39;, &#39;get_cros=
s_kernel_cc&#39;, &#39;get_icecc&#39;, &#39;go_map_arch&#39;, &#39;go_map_o=
s&#39;, &#39;icecc_dep_prepend&#39;, &#39;icecc_get_and_check_tool&#39;, &#=
39;icecc_get_external_tool&#39;, &#39;icecc_get_tool&#39;, &#39;icecc_is_al=
larch&#39;, &#39;icecc_is_kernel&#39;, &#39;icecc_is_native&#39;, &#39;icec=
c_path&#39;, &#39;icecc_version&#39;, &#39;includedir&#39;, &#39;includedir=
_native&#39;, &#39;infodir&#39;, &#39;libdir&#39;, &#39;libdir_native&#39;,=
 &#39;libexecdir&#39;, &#39;localstatedir&#39;, &#39;lt_cv_sys_lib_dlsearch=
_path_spec&#39;, &#39;mandir&#39;, &#39;nonarch_base_libdir&#39;, &#39;nona=
rch_libdir&#39;, &#39;oldincludedir&#39;, &#39;package_qa_handle_error&#39;=
, &#39;package_qa_write_error&#39;, &#39;prefix&#39;, &#39;prefix_native&#3=
9;, &#39;root_prefix&#39;, &#39;sbindir&#39;, &#39;sbindir_native&#39;, &#3=
9;servicedir&#39;, &#39;set_icecc_env&#39;, &#39;sharedstatedir&#39;, &#39;=
sysconfdir&#39;, &#39;sysconfdir_native&#39;, &#39;systemd_system_unitdir&#=
39;, &#39;systemd_unitdir&#39;, &#39;systemd_user_unitdir&#39;, &#39;use_ic=
ecc&#39;]</div><div>basehash changed from c9b68d1fd3b5cabc8e1a1d90f9679613 =
to c93e5a979d443f1a235d14d25b9945d7</div><div>List of dependencies for vari=
able TUNE_FEATURES changed from &#39;{&#39;DEFAULTTUNE&#39;, &#39;TUNE_FEAT=
URES_tune-i586&#39;}&#39; to &#39;{&#39;DEFAULTTUNE&#39;, &#39;TUNE_FEATURE=
S_tune-webos-tune-ca9v1&#39;}&#39;</div><div>changed items: {&#39;TUNE_FEAT=
URES_tune-webos-tune-ca9v1&#39;, &#39;TUNE_FEATURES_tune-i586&#39;}</div></=
div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon,=
 Sep 25, 2017 at 3:19 PM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:git@git.=
openembedded.org" target=3D"_blank">git@git.openembedded.org</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">This is an automated email from t=
he git hooks/post-receive script.<br>
<br>
rpurdie pushed a commit to branch master-next<br>
in repository openembedded-core.<br>
<br>
commit bdd20c296048937737da0f10bd1a3b<wbr>63843c5bf4<br>
Author: Matt Madison &lt;matt@madison.systems&gt;<br>
AuthorDate: Fri Sep 22 17:58:20 2017 -0700<br>
<br>
=C2=A0 =C2=A0 goarch.bbclass: fixups for Go mips32 support<br>
<br>
=C2=A0 =C2=A0 * Fix the regular expression in the mips test<br>
<br>
=C2=A0 =C2=A0 * Flag as incompatible any mips32 tunes for n32 ABI<br>
=C2=A0 =C2=A0 =C2=A0 or soft-float, as go does not support them.<br>
<br>
=C2=A0 =C2=A0 * Replace mips32r2 tune with mips32r1. Go only supports<br>
=C2=A0 =C2=A0 =C2=A0 mips32r1, which is a strict subset of r2.=C2=A0 Adjust=
ing<br>
=C2=A0 =C2=A0 =C2=A0 this tune is not ideal, but is hopefully a temporary<b=
r>
=C2=A0 =C2=A0 =C2=A0 measure until more complete mips32 ISA coverage<br>
=C2=A0 =C2=A0 =C2=A0 arrives upstream.<br>
<br>
=C2=A0 =C2=A0 [YOCTO #12108]<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.=
com">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org">richard.purdie@<wbr>linuxfoundation.org</a>&gt;<=
br>
---<br>
=C2=A0meta/classes/goarch.bbclass | 12 ++++++++----<br>
=C2=A01 file changed, 8 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass<br>
index 8b95c5f..9ed562d 100644<br>
--- a/meta/classes/goarch.bbclass<br>
+++ b/meta/classes/goarch.bbclass<br>
@@ -43,10 +43,14 @@ def go_map_arch(a, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &#39;mips64le&#39;<br>
=C2=A0 =C2=A0 =C2=A0elif re.match(&#39;mips64*&#39;, a):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &#39;mips64&#39;<br>
-=C2=A0 =C2=A0 elif re.match(&#39;mipsel*&#39;, a):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;mipsle&#39;<br>
-=C2=A0 =C2=A0 elif re.match(&#39;mips*&#39;, a):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;mips&#39;<br>
+=C2=A0 =C2=A0 elif re.match(&#39;mips.*&#39;, a):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tf =3D d.getVar(&#39;TUNE_FEATURES&#39;).<wbr>=
split()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;fpu-hard&#39; in tf and &#39;n32&#39; =
not in tf:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;mips32r2&#39; in tf:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 newtf =3D [t for t=
 in tf if t !=3D &#39;mips32r2&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 newtf.append(&#39;=
mips32&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;TUNE=
_FEATURES&#39;, &#39; &#39;.join(newtf))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;mips&#39; if &#39;bi=
gendian&#39; in tf else &#39;mipsle&#39;<br>
=C2=A0 =C2=A0 =C2=A0elif re.match(&#39;p(pc|owerpc)(64)&#39;, a):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &#39;ppc64&#39;<br>
=C2=A0 =C2=A0 =C2=A0elif re.match(&#39;p(pc|owerpc)(64el)&#39;, a):<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
To stop receiving notification emails like this one, please contact<br>
the administrator of this repository.<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-commits mailing list<br>
<a href=3D"mailto:Openembedded-commits@lists.openembedded.org">Openembedded=
-commits@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-comm=
its" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wb=
r>mailman/listinfo/openembedded-<wbr>commits</a><br>
</font></span></blockquote></div><br></div>

--f403045e20768e0478055a16a283--
