Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.53751.1590507964533715372
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 08:46:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=qxFL21pj;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.214.180, mailfrom: jpuhlman@mvista.com)
Received: by mail-pl1-f180.google.com with SMTP id y11so550623plt.12
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2020 08:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=hG8AoofX4zmcEj3Wpp8OuydGJBW/ZvI2QYd5+czrgJE=;
        b=qxFL21pjnKq0nb7w4zytA5oFOltV1jPhQ/tZ5V9Rl8KjPrpSh7T5yNvyiPerNwGdM7
         nvzDz2rYWU2iz131QTHtpH6C2LeimflmwBlRVS5t+P9R5G7NB7vBnyAFaDmoVlsA1hVF
         w5fQNZPxyE5dT8jZIpuN34zTVLdg8cdff0ITmCDJexias7U3GMSbDRAnKd92nH+2z0Ed
         qhdKKryMnYYnYiWzY4uWhEXSqvEBu4pAWmpbCBS9En/vdfiZhXIVen1wwdJtIDMbgNK5
         GqWgdpLJzQeP7REpNua9tovzXbF667zHDrkZFNvFLBJAhA3ECmgYdy9pyHaDKiShi6Ay
         LJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=hG8AoofX4zmcEj3Wpp8OuydGJBW/ZvI2QYd5+czrgJE=;
        b=Bv4HgZak4IE/3sxcKX3F6aacqO20FPAS60kAptnTB5Z48JL4WKwztIn7FLnEmhI1C6
         FK5Qn2atNPpbdTqOsT32HsgJgW9zz7+qkZv8X/xnpaIydoWtH3UpvmPrIDFPLJ0vORZJ
         7JYinfD+s+uQeDu+cd3fRXQXTGKo3hOwCtGe9zENave1d6zoXrqciwQsfEonZwjlZQvq
         7FiWzIvGQY60+FIyzPre/vnurbjl1QGu8YnLFrICMjAF71+LgzGlcH5mDODiiAeR8T2E
         zwTNrQzE/G0J+3XX1P2dMuQL3LVVhfzuIGviOX1zgOOUxpEEvARoydOAjC+cnbPLFhXn
         FSaw==
X-Gm-Message-State: AOAM531a9fxpDNuAkPxyBgcID54LTFd7h71VEntPEp5uB+egRyRLHR6v
	Hnsb7hd7CGev848IC8G9lOjNoQUNpoo=
X-Google-Smtp-Source: ABdhPJz8vsOnDyelypV2yn0dvUppug6RkKiQmRxyaiJEyTlh0qy02dz1MxJVsQ6sfF3y1UWrSrFlDQ==
X-Received: by 2002:a17:90a:64ce:: with SMTP id i14mr26202340pjm.48.1590507963234;
        Tue, 26 May 2020 08:46:03 -0700 (PDT)
Return-Path: <jpuhlman@mvista.com>
Received: from [192.168.1.128] (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id g1sm15279513pfo.142.2020.05.26.08.46.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2020 08:46:02 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] multilib/recipes: Use new RecipePostKeyExpansion event
To: openembedded-core@lists.openembedded.org
References: <20200521110914.2202188-1-richard.purdie@linuxfoundation.org>
From: "Jeremy Puhlman" <jpuhlman@mvista.com>
Message-ID: <64ca506f-b276-0a4b-4f90-55433aeb2df6@mvista.com>
Date: Tue, 26 May 2020 08:45:59 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521110914.2202188-1-richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative;
 boundary="------------1C5B25BC413E09E4485149F7"
Content-Language: en-US

--------------1C5B25BC413E09E4485149F7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

For master I this looks great. We have been bitten in various edge cases 
by this in the past. You mentioned
pushing it on to dunfell. I a little leary at this point, but if we are 
going to its kind of now or never. My feeling
is there will be some fallout(which is perfectly fine on master, a 
little questionable on a stable release) in other
layers.

On 5/21/2020 4:09 AM, Richard Purdie wrote:
> There are issues with multilib due to the ordering of events where some
> functions see the remapped multilib dependencies and some do not. A significant
> problem is that the multilib class needs to make some changes before key expansion
> and some afterwards but by using existing event handlers, some code sees things
> in a partially translated state, leading to bugs.
>
> This patch changes things to use a new event handler from bitbake which makes the
> ordering of the changes explcit.
>
> The challenge in doing this is that it breaks some existing anonymous python and
> dyanmic assignments. In some cases these used to be translated and no longer are,
> meaning MLPREFIX has to be added. In some cases these are now translated and the
> MLPREFIX can be removed.
>
> This change does now make it very clear when MLPREFIX is required and when it is
> not, its just the migration path which is harder. The patch changes the small number
> of cases where fixes are needed.
>
> This patch also reverts:
> base: Revert 'base.bbclass: considering multilib when setting LICENSE_EXCLUSION'
>
> This reverts 6597130256a1609c3e05ec5891aceaf549c37985 as the changes
> to multilib datastore handling mean its no longer necessary.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/classes/base.bbclass                     |  3 +-
>   meta/classes/fontcache.bbclass                |  2 +-
>   meta/classes/multilib.bbclass                 | 28 ++++++++++++---
>   meta/lib/oe/classextend.py                    | 35 +++++++++++++++++--
>   meta/recipes-core/glibc/glibc-package.inc     |  2 +-
>   meta/recipes-core/psplash/psplash_git.bb      |  6 ++--
>   meta/recipes-devtools/perl/perl_5.30.2.bb     |  2 +-
>   meta/recipes-devtools/python/python3_3.8.2.bb | 14 ++++----
>   meta/recipes-graphics/mesa/mesa.inc           | 10 +++---
>   .../alsa/alsa-plugins_1.2.1.bb                |  6 ++--
>   meta/recipes-support/boost/boost.inc          | 10 ++++--
>   11 files changed, 85 insertions(+), 33 deletions(-)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 7aa2e144eb7..4c681cc870d 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -570,8 +570,7 @@ python () {
>                   if unskipped_pkgs:
>                       for pkg in skipped_pkgs:
>                           bb.debug(1, "Skipping the package %s at do_rootfs because of incompatible license(s): %s" % (pkg, ' '.join(skipped_pkgs[pkg])))
> -                        mlprefix = d.getVar('MLPREFIX')
> -                        d.setVar('LICENSE_EXCLUSION-' + mlprefix + pkg, ' '.join(skipped_pkgs[pkg]))
> +                        d.setVar('LICENSE_EXCLUSION-' + pkg, ' '.join(skipped_pkgs[pkg]))
>                       for pkg in unskipped_pkgs:
>                           bb.debug(1, "Including the package %s" % pkg)
>                   else:
> diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbclass
> index 97e7f17f00e..624a420a0de 100644
> --- a/meta/classes/fontcache.bbclass
> +++ b/meta/classes/fontcache.bbclass
> @@ -7,7 +7,7 @@ PACKAGE_WRITE_DEPS += "qemu-native"
>   inherit qemu
>   
>   FONT_PACKAGES ??= "${PN}"
> -FONT_EXTRA_RDEPENDS ?= "fontconfig-utils"
> +FONT_EXTRA_RDEPENDS ?= "${MLPREFIX}fontconfig-utils"
>   FONTCONFIG_CACHE_DIR ?= "${localstatedir}/cache/fontconfig"
>   FONTCONFIG_CACHE_PARAMS ?= "-v"
>   # You can change this to e.g. FC_DEBUG=16 to debug fc-cache issues,
> diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
> index ee677da1e20..9f726e45371 100644
> --- a/meta/classes/multilib.bbclass
> +++ b/meta/classes/multilib.bbclass
> @@ -91,13 +91,12 @@ addhandler multilib_virtclass_handler
>   multilib_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"
>   
>   python __anonymous () {
> -    variant = d.getVar("BBEXTENDVARIANT")
> -
> -    import oe.classextend
> +    if bb.data.inherits_class('image', d):
> +        variant = d.getVar("BBEXTENDVARIANT")
> +        import oe.classextend
>   
> -    clsextend = oe.classextend.ClassExtender(variant, d)
> +        clsextend = oe.classextend.ClassExtender(variant, d)
>   
> -    if bb.data.inherits_class('image', d):
>           clsextend.map_depends_variable("PACKAGE_INSTALL")
>           clsextend.map_depends_variable("LINGUAS_INSTALL")
>           clsextend.map_depends_variable("RDEPENDS")
> @@ -109,6 +108,22 @@ python __anonymous () {
>           bb.build.deltask('do_populate_sdk', d)
>           bb.build.deltask('do_populate_sdk_ext', d)
>           return
> +}
> +
> +python multilib_virtclass_handler_postkeyexp () {
> +    cls = d.getVar("BBEXTENDCURR")
> +    variant = d.getVar("BBEXTENDVARIANT")
> +    if cls != "multilib" or not variant:
> +        return
> +
> +    variant = d.getVar("BBEXTENDVARIANT")
> +
> +    import oe.classextend
> +
> +    clsextend = oe.classextend.ClassExtender(variant, d)
> +
> +    if bb.data.inherits_class('image', d):
> +        return
>   
>       clsextend.map_depends_variable("DEPENDS")
>       clsextend.map_variable("PROVIDES")
> @@ -129,6 +144,9 @@ python __anonymous () {
>       reset_alternative_priority(d)
>   }
>   
> +addhandler multilib_virtclass_handler_postkeyexp
> +multilib_virtclass_handler_postkeyexp[eventmask] = "bb.event.RecipePostKeyExpansion"
> +
>   def reset_alternative_priority(d):
>       if not bb.data.inherits_class('update-alternatives', d):
>           return
> diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
> index f02fbe9fbad..ff8f84c572c 100644
> --- a/meta/lib/oe/classextend.py
> +++ b/meta/lib/oe/classextend.py
> @@ -4,11 +4,21 @@
>   
>   import collections
>   
> +def get_packages(d):
> +    pkgs = d.getVar("PACKAGES_NONML")
> +    extcls = d.getVar("EXTENDERCLASS")
> +    return extcls.rename_packages_internal(pkgs)
> +
> +def get_depends(d):
> +    extcls = d.getVar("EXTENDERCLASS")
> +    return extcls. map_depends_variable("DEPENDS_NONML")
> +
>   class ClassExtender(object):
>       def __init__(self, extname, d):
>           self.extname = extname
>           self.d = d
>           self.pkgs_mapping = []
> +        self.d.setVar("EXTENDERCLASS", self)
>   
>       def extend_name(self, name):
>           if name.startswith("kernel-") or name == "virtual/kernel":
> @@ -24,7 +34,7 @@ class ClassExtender(object):
>               if not subs.startswith(self.extname):
>                   return "virtual/" + self.extname + "-" + subs
>               return name
> -        if name.startswith("/"):
> +        if name.startswith("/") or (name.startswith("${") and name.endswith("}")):
>               return name
>           if not name.startswith(self.extname):
>               return self.extname + "-" + name
> @@ -89,8 +99,14 @@ class ClassExtender(object):
>           for dep in deps:
>               newdeps[self.map_depends(dep)] = deps[dep]
>   
> -        self.d.setVar(varname, bb.utils.join_deps(newdeps, False).replace("EXTENDPKGV", "${EXTENDPKGV}"))
> +        if varname == "DEPENDS":
> +            self.d.setVar("DEPENDS_NONML", self.d.getVar("DEPENDS", False))
> +            self.d.setVar("DEPENDS", "${@oe.classextend.get_depends(d)}")
> +        ret = bb.utils.join_deps(newdeps, False).replace("EXTENDPKGV", "${EXTENDPKGV}")
>           self.d.setVar("EXTENDPKGV", orig)
> +        if varname == "DEPENDS_NONML" or varname == "DEPENDS":
> +            return ret
> +        self.d.setVar(varname, ret)
>   
>       def map_packagevars(self):
>           for pkg in (self.d.getVar("PACKAGES").split() + [""]):
> @@ -109,10 +125,23 @@ class ClassExtender(object):
>                  continue
>               self.pkgs_mapping.append([pkg, self.extend_name(pkg)])
>   
> -        self.d.setVar("PACKAGES", " ".join([row[1] for row in self.pkgs_mapping]))
> +        self.d.setVar("PACKAGES_NONML", self.d.getVar("PACKAGES", False))
> +        self.d.setVar("PACKAGES", "${@oe.classextend.get_packages(d)}")
> +
> +    def rename_packages_internal(self, pkgs):
> +        self.pkgs_mapping = []
> +        for pkg in (self.d.expand(pkgs) or "").split():
> +            if pkg.startswith(self.extname):
> +               self.pkgs_mapping.append([pkg.split(self.extname + "-")[1], pkg])
> +               continue
> +            self.pkgs_mapping.append([pkg, self.extend_name(pkg)])
> +
> +        return " ".join([row[1] for row in self.pkgs_mapping])
>   
>       def rename_package_variables(self, variables):
>           for pkg_mapping in self.pkgs_mapping:
> +            if pkg_mapping[0].startswith("${") and pkg_mapping[0].endswith("}"):
> +                continue
>               for subs in variables:
>                   self.d.renameVar("%s_%s" % (subs, pkg_mapping[0]), "%s_%s" % (subs, pkg_mapping[1]))
>   
> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
> index aa8e0592169..ff25fd41875 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -24,7 +24,7 @@ libc_baselibs_append = " ${@oe.utils.conditional('ARCH_DYNAMIC_LOADER', '', '',
>   INSANE_SKIP_${PN}_append_aarch64 = " libdir"
>   
>   FILES_${PN} = "${libc_baselibs} ${libexecdir}/*"
> -RRECOMMENDS_${PN} = "${@bb.utils.filter('DISTRO_FEATURES', 'ldconfig', d)}"
> +RRECOMMENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', '${MLPREFIX}ldconfig', '', d)}"
>   FILES_ldconfig = "${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf"
>   FILES_ldd = "${bindir}/ldd"
>   FILES_libsegfault = "${base_libdir}/libSegFault*"
> diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
> index 22c71f099b8..bcbdec5e3ed 100644
> --- a/meta/recipes-core/psplash/psplash_git.bb
> +++ b/meta/recipes-core/psplash/psplash_git.bb
> @@ -22,6 +22,7 @@ SPLASH_IMAGES = "file://psplash-poky-img.h;outsuffix=default"
>   python __anonymous() {
>       oldpkgs = d.getVar("PACKAGES").split()
>       splashfiles = d.getVar('SPLASH_IMAGES').split()
> +    mlprefix = d.getVar('MLPREFIX') or ''
>       pkgs = []
>       localpaths = []
>       for uri in splashfiles:
> @@ -36,7 +37,7 @@ python __anonymous() {
>                   outsuffix = fbase
>               if outsuffix.endswith('-img'):
>                   outsuffix = outsuffix[:-4]
> -        outname = "psplash-%s" % outsuffix
> +        outname = "%spsplash-%s" % (mlprefix, outsuffix)
>           if outname == '' or outname in oldpkgs:
>               bb.fatal("The output name '%s' derived from the URI %s is not valid, please specify the outsuffix parameter" % (outname, uri))
>           else:
> @@ -46,9 +47,8 @@ python __anonymous() {
>       # Set these so that we have less work to do in do_compile and do_install_append
>       d.setVar("SPLASH_INSTALL", " ".join(pkgs))
>       d.setVar("SPLASH_LOCALPATHS", " ".join(localpaths))
> -
>       d.prependVar("PACKAGES", "%s " % (" ".join(pkgs)))
> -    mlprefix = d.getVar('MLPREFIX') or ''
> +
>       pn = d.getVar('PN') or ''
>       for p in pkgs:
>           ep = '%s%s' % (mlprefix, p)
> diff --git a/meta/recipes-devtools/perl/perl_5.30.2.bb b/meta/recipes-devtools/perl/perl_5.30.2.bb
> index 778c420b2ee..26138ea9e55 100644
> --- a/meta/recipes-devtools/perl/perl_5.30.2.bb
> +++ b/meta/recipes-devtools/perl/perl_5.30.2.bb
> @@ -328,7 +328,7 @@ python split_perl_packages () {
>   
>   python() {
>       if d.getVar('CLASSOVERRIDE') == "class-target":
> -        d.setVar("PACKAGES_DYNAMIC", "^perl-module-.*(?<!native)$")
> +        d.setVar("PACKAGES_DYNAMIC", "^${MLPREFIX}perl-module-.*(?<!native)$")
>       elif d.getVar('CLASSOVERRIDE') == "class-native":
>           d.setVar("PACKAGES_DYNAMIC", "^perl-module-.*-native$")
>       elif d.getVar('CLASSOVERRIDE') == "class-nativesdk":
> diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-devtools/python/python3_3.8.2.bb
> index a4a16fd495f..0474f07214f 100644
> --- a/meta/recipes-devtools/python/python3_3.8.2.bb
> +++ b/meta/recipes-devtools/python/python3_3.8.2.bb
> @@ -311,8 +311,8 @@ do_create_manifest[depends] += "${PN}:do_patch"
>   
>   # manual dependency additions
>   RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python3-modules"
> -RRECOMMENDS_${PN}-crypt_append_class-target = " openssl ca-certificates"
> -RRECOMMENDS_${PN}-crypt_append_class-nativesdk = " openssl ca-certificates"
> +RRECOMMENDS_${PN}-crypt_append_class-target = " ${MLPREFIX}openssl ${MLPREFIX}ca-certificates"
> +RRECOMMENDS_${PN}-crypt_append_class-nativesdk = " ${MLPREFIX}openssl ${MLPREFIX}ca-certificates"
>   
>   # For historical reasons PN is empty and provided by python3-modules
>   FILES_${PN} = ""
> @@ -322,7 +322,7 @@ FILES_${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
>   FILES_${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
>   
>   # provide python-pyvenv from python3-venv
> -RPROVIDES_${PN}-venv += "python3-pyvenv"
> +RPROVIDES_${PN}-venv += "${MLPREFIX}python3-pyvenv"
>   
>   # package libpython3
>   PACKAGES =+ "libpython3 libpython3-staticdev"
> @@ -333,8 +333,8 @@ INSANE_SKIP_${PN}-dev += "dev-elf"
>   # catch all the rest (unsorted)
>   PACKAGES += "${PN}-misc"
>   RDEPENDS_${PN}-misc += "python3-core python3-email python3-codecs python3-pydoc python3-pickle python3-audio"
> -RDEPENDS_${PN}-modules_append_class-target = " python3-misc"
> -RDEPENDS_${PN}-modules_append_class-nativesdk = " python3-misc"
> +RDEPENDS_${PN}-modules_append_class-target = " ${MLPREFIX}python3-misc"
> +RDEPENDS_${PN}-modules_append_class-nativesdk = " ${MLPREFIX}python3-misc"
>   FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python${PYTHON_MAJMIN}/lib-dynload"
>   
>   # catch manpage
> @@ -348,5 +348,5 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
>   RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
>   RDEPENDS_${PN}-dev = ""
>   
> -RDEPENDS_${PN}-tests_append_class-target = " bash"
> -RDEPENDS_${PN}-tests_append_class-nativesdk = " bash"
> +RDEPENDS_${PN}-tests_append_class-target = " ${MLPREFIX}bash"
> +RDEPENDS_${PN}-tests_append_class-nativesdk = " ${MLPREFIX}bash"
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index fede691d6ff..bb43a9a8b65 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -212,18 +212,20 @@ python __anonymous() {
>                 ("gles", "libgles3",)):
>           if not p[0] in pkgconfig:
>               continue
> -        fullp = p[1] + "-mesa"
> -        pkgs = " ".join(p[1:])
> +        mlprefix = d.getVar("MLPREFIX")
> +        fullp = mlprefix + p[1] + "-mesa"
> +        mlprefix = d.getVar("MLPREFIX")
> +        pkgs = " ".join(mlprefix + x for x in p[1:])
>           d.setVar("DEBIAN_NOAUTONAME_" + fullp, "1")
>           d.appendVar("RREPLACES_" + fullp, pkgs)
>           d.appendVar("RPROVIDES_" + fullp, pkgs)
>           d.appendVar("RCONFLICTS_" + fullp, pkgs)
>   
> -        d.appendVar("RRECOMMENDS_" + fullp, " mesa-megadriver")
> +        d.appendVar("RRECOMMENDS_" + fullp, " ${MLPREFIX}mesa-megadriver")
>   
>           # For -dev, the first element is both the Debian and original name
>           fullp += "-dev"
> -        pkgs = p[1] + "-dev"
> +        pkgs = mlprefix + p[1] + "-dev"
>           d.setVar("DEBIAN_NOAUTONAME_" + fullp, "1")
>           d.appendVar("RREPLACES_" + fullp, pkgs)
>           d.appendVar("RPROVIDES_" + fullp, pkgs)
> diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb
> index 9882e12763a..d092b158f26 100644
> --- a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb
> @@ -167,7 +167,7 @@ FILES_${PN}-pulseaudio-conf += "\
>   "
>   
>   RDEPENDS_${PN}-pulseaudio-conf += "\
> -        libasound-module-conf-pulse \
> -        libasound-module-ctl-pulse \
> -        libasound-module-pcm-pulse \
> +        ${MLPREFIX}libasound-module-conf-pulse \
> +        ${MLPREFIX}libasound-module-ctl-pulse \
> +        ${MLPREFIX}libasound-module-pcm-pulse \
>   "
> diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
> index 8eb9494381f..ca140d595fd 100644
> --- a/meta/recipes-support/boost/boost.inc
> +++ b/meta/recipes-support/boost/boost.inc
> @@ -62,12 +62,16 @@ PACKAGES = "${PN}-dbg ${BOOST_PACKAGES}"
>   python __anonymous () {
>       packages = []
>       extras = []
> +    mlprefix = d.getVar("MLPREFIX")
>       for lib in d.getVar('BOOST_LIBS').split():
>           extras.append("--with-%s" % lib)
> -        pkg = "boost-%s" % lib.replace("_", "-")
> -        packages.append(pkg)
> +        pkg = "boost-%s" % (lib.replace("_", "-"))
> +        packages.append(mlprefix + pkg)
>           if not d.getVar("FILES_%s" % pkg):
> -                d.setVar("FILES_%s" % pkg, "${libdir}/libboost_%s*.so.*" % lib)
> +                d.setVar("FILES_%s%s" % (mlprefix, pkg), "${libdir}/libboost_%s*.so.*" % lib)
> +        else:
> +                d.setVar("FILES_%s%s" % (mlprefix, pkg), d.getVar("FILES_%s" % pkg))
> +
>       d.setVar("BOOST_PACKAGES", " ".join(packages))
>       d.setVar("BJAM_EXTRA", " ".join(extras))
>   }
>
> 
>
>

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


--------------1C5B25BC413E09E4485149F7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    For master I this looks great. We have been bitten in various edge
    cases by this in the past. You mentioned<br>
    pushing it on to dunfell. I a little leary at this point, but if we
    are going to its kind of now or never. My feeling<br>
    is there will be some fallout(which is perfectly fine on master, a
    little questionable on a stable release) in other<br>
    layers.<br>
    <br>
    <div class="moz-cite-prefix">On 5/21/2020 4:09 AM, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200521110914.2202188-1-richard.purdie@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">There are issues with multilib due to the ordering of events where some
functions see the remapped multilib dependencies and some do not. A significant
problem is that the multilib class needs to make some changes before key expansion
and some afterwards but by using existing event handlers, some code sees things
in a partially translated state, leading to bugs.

This patch changes things to use a new event handler from bitbake which makes the
ordering of the changes explcit.

The challenge in doing this is that it breaks some existing anonymous python and
dyanmic assignments. In some cases these used to be translated and no longer are,
meaning MLPREFIX has to be added. In some cases these are now translated and the
MLPREFIX can be removed.

This change does now make it very clear when MLPREFIX is required and when it is
not, its just the migration path which is harder. The patch changes the small number
of cases where fixes are needed.

This patch also reverts:
base: Revert 'base.bbclass: considering multilib when setting LICENSE_EXCLUSION'

This reverts 6597130256a1609c3e05ec5891aceaf549c37985 as the changes
to multilib datastore handling mean its no longer necessary.

Signed-off-by: Richard Purdie <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>
---
 meta/classes/base.bbclass                     |  3 +-
 meta/classes/fontcache.bbclass                |  2 +-
 meta/classes/multilib.bbclass                 | 28 ++++++++++++---
 meta/lib/oe/classextend.py                    | 35 +++++++++++++++++--
 meta/recipes-core/glibc/glibc-package.inc     |  2 +-
 meta/recipes-core/psplash/psplash_git.bb      |  6 ++--
 meta/recipes-devtools/perl/perl_5.30.2.bb     |  2 +-
 meta/recipes-devtools/python/python3_3.8.2.bb | 14 ++++----
 meta/recipes-graphics/mesa/mesa.inc           | 10 +++---
 .../alsa/alsa-plugins_1.2.1.bb                |  6 ++--
 meta/recipes-support/boost/boost.inc          | 10 ++++--
 11 files changed, 85 insertions(+), 33 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 7aa2e144eb7..4c681cc870d 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -570,8 +570,7 @@ python () {
                 if unskipped_pkgs:
                     for pkg in skipped_pkgs:
                         bb.debug(1, "Skipping the package %s at do_rootfs because of incompatible license(s): %s" % (pkg, ' '.join(skipped_pkgs[pkg])))
-                        mlprefix = d.getVar('MLPREFIX')
-                        d.setVar('LICENSE_EXCLUSION-' + mlprefix + pkg, ' '.join(skipped_pkgs[pkg]))
+                        d.setVar('LICENSE_EXCLUSION-' + pkg, ' '.join(skipped_pkgs[pkg]))
                     for pkg in unskipped_pkgs:
                         bb.debug(1, "Including the package %s" % pkg)
                 else:
diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbclass
index 97e7f17f00e..624a420a0de 100644
--- a/meta/classes/fontcache.bbclass
+++ b/meta/classes/fontcache.bbclass
@@ -7,7 +7,7 @@ PACKAGE_WRITE_DEPS += "qemu-native"
 inherit qemu
 
 FONT_PACKAGES ??= "${PN}"
-FONT_EXTRA_RDEPENDS ?= "fontconfig-utils"
+FONT_EXTRA_RDEPENDS ?= "${MLPREFIX}fontconfig-utils"
 FONTCONFIG_CACHE_DIR ?= "${localstatedir}/cache/fontconfig"
 FONTCONFIG_CACHE_PARAMS ?= "-v"
 # You can change this to e.g. FC_DEBUG=16 to debug fc-cache issues,
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index ee677da1e20..9f726e45371 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -91,13 +91,12 @@ addhandler multilib_virtclass_handler
 multilib_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"
 
 python __anonymous () {
-    variant = d.getVar("BBEXTENDVARIANT")
-
-    import oe.classextend
+    if bb.data.inherits_class('image', d):
+        variant = d.getVar("BBEXTENDVARIANT")
+        import oe.classextend
 
-    clsextend = oe.classextend.ClassExtender(variant, d)
+        clsextend = oe.classextend.ClassExtender(variant, d)
 
-    if bb.data.inherits_class('image', d):
         clsextend.map_depends_variable("PACKAGE_INSTALL")
         clsextend.map_depends_variable("LINGUAS_INSTALL")
         clsextend.map_depends_variable("RDEPENDS")
@@ -109,6 +108,22 @@ python __anonymous () {
         bb.build.deltask('do_populate_sdk', d)
         bb.build.deltask('do_populate_sdk_ext', d)
         return
+}
+
+python multilib_virtclass_handler_postkeyexp () {
+    cls = d.getVar("BBEXTENDCURR")
+    variant = d.getVar("BBEXTENDVARIANT")
+    if cls != "multilib" or not variant:
+        return
+
+    variant = d.getVar("BBEXTENDVARIANT")
+
+    import oe.classextend
+
+    clsextend = oe.classextend.ClassExtender(variant, d)
+
+    if bb.data.inherits_class('image', d):
+        return
 
     clsextend.map_depends_variable("DEPENDS")
     clsextend.map_variable("PROVIDES")
@@ -129,6 +144,9 @@ python __anonymous () {
     reset_alternative_priority(d)
 }
 
+addhandler multilib_virtclass_handler_postkeyexp
+multilib_virtclass_handler_postkeyexp[eventmask] = "bb.event.RecipePostKeyExpansion"
+
 def reset_alternative_priority(d):
     if not bb.data.inherits_class('update-alternatives', d):
         return
diff --git a/meta/lib/oe/classextend.py b/meta/lib/oe/classextend.py
index f02fbe9fbad..ff8f84c572c 100644
--- a/meta/lib/oe/classextend.py
+++ b/meta/lib/oe/classextend.py
@@ -4,11 +4,21 @@
 
 import collections
 
+def get_packages(d):
+    pkgs = d.getVar("PACKAGES_NONML")
+    extcls = d.getVar("EXTENDERCLASS")
+    return extcls.rename_packages_internal(pkgs)
+
+def get_depends(d):
+    extcls = d.getVar("EXTENDERCLASS")
+    return extcls. map_depends_variable("DEPENDS_NONML")
+
 class ClassExtender(object):
     def __init__(self, extname, d):
         self.extname = extname
         self.d = d
         self.pkgs_mapping = []
+        self.d.setVar("EXTENDERCLASS", self)
 
     def extend_name(self, name):
         if name.startswith("kernel-") or name == "virtual/kernel":
@@ -24,7 +34,7 @@ class ClassExtender(object):
             if not subs.startswith(self.extname):
                 return "virtual/" + self.extname + "-" + subs
             return name
-        if name.startswith("/"):
+        if name.startswith("/") or (name.startswith("${") and name.endswith("}")):
             return name
         if not name.startswith(self.extname):
             return self.extname + "-" + name
@@ -89,8 +99,14 @@ class ClassExtender(object):
         for dep in deps:
             newdeps[self.map_depends(dep)] = deps[dep]
 
-        self.d.setVar(varname, bb.utils.join_deps(newdeps, False).replace("EXTENDPKGV", "${EXTENDPKGV}"))
+        if varname == "DEPENDS":
+            self.d.setVar("DEPENDS_NONML", self.d.getVar("DEPENDS", False))
+            self.d.setVar("DEPENDS", <a class="moz-txt-link-rfc2396E" href="mailto:${@oe.classextend.get_depends(d)}">"${@oe.classextend.get_depends(d)}"</a>)
+        ret = bb.utils.join_deps(newdeps, False).replace("EXTENDPKGV", "${EXTENDPKGV}")
         self.d.setVar("EXTENDPKGV", orig)
+        if varname == "DEPENDS_NONML" or varname == "DEPENDS":
+            return ret
+        self.d.setVar(varname, ret)
 
     def map_packagevars(self):
         for pkg in (self.d.getVar("PACKAGES").split() + [""]):
@@ -109,10 +125,23 @@ class ClassExtender(object):
                continue
             self.pkgs_mapping.append([pkg, self.extend_name(pkg)])
 
-        self.d.setVar("PACKAGES", " ".join([row[1] for row in self.pkgs_mapping]))
+        self.d.setVar("PACKAGES_NONML", self.d.getVar("PACKAGES", False))
+        self.d.setVar("PACKAGES", <a class="moz-txt-link-rfc2396E" href="mailto:${@oe.classextend.get_packages(d)}">"${@oe.classextend.get_packages(d)}"</a>)
+
+    def rename_packages_internal(self, pkgs):
+        self.pkgs_mapping = []
+        for pkg in (self.d.expand(pkgs) or "").split():
+            if pkg.startswith(self.extname):
+               self.pkgs_mapping.append([pkg.split(self.extname + "-")[1], pkg])
+               continue
+            self.pkgs_mapping.append([pkg, self.extend_name(pkg)])
+
+        return " ".join([row[1] for row in self.pkgs_mapping])
 
     def rename_package_variables(self, variables):
         for pkg_mapping in self.pkgs_mapping:
+            if pkg_mapping[0].startswith("${") and pkg_mapping[0].endswith("}"):
+                continue
             for subs in variables:
                 self.d.renameVar("%s_%s" % (subs, pkg_mapping[0]), "%s_%s" % (subs, pkg_mapping[1]))
 
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index aa8e0592169..ff25fd41875 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -24,7 +24,7 @@ libc_baselibs_append = " ${@oe.utils.conditional('ARCH_DYNAMIC_LOADER', '', '',
 INSANE_SKIP_${PN}_append_aarch64 = " libdir"
 
 FILES_${PN} = "${libc_baselibs} ${libexecdir}/*"
-RRECOMMENDS_${PN} = <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.filter('DISTRO_FEATURES','ldconfig',d)}">"${@bb.utils.filter('DISTRO_FEATURES', 'ldconfig', d)}"</a>
+RRECOMMENDS_${PN} = <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('DISTRO_FEATURES','ldconfig','${MLPREFIX}ldconfig','',d)}">"${@bb.utils.contains('DISTRO_FEATURES', 'ldconfig', '${MLPREFIX}ldconfig', '', d)}"</a>
 FILES_ldconfig = "${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf"
 FILES_ldd = "${bindir}/ldd"
 FILES_libsegfault = "${base_libdir}/libSegFault*"
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 22c71f099b8..bcbdec5e3ed 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -22,6 +22,7 @@ SPLASH_IMAGES = <a class="moz-txt-link-rfc2396E" href="file://psplash-poky-img.h;outsuffix=default">"file://psplash-poky-img.h;outsuffix=default"</a>
 python __anonymous() {
     oldpkgs = d.getVar("PACKAGES").split()
     splashfiles = d.getVar('SPLASH_IMAGES').split()
+    mlprefix = d.getVar('MLPREFIX') or ''
     pkgs = []
     localpaths = []
     for uri in splashfiles:
@@ -36,7 +37,7 @@ python __anonymous() {
                 outsuffix = fbase
             if outsuffix.endswith('-img'):
                 outsuffix = outsuffix[:-4]
-        outname = "psplash-%s" % outsuffix
+        outname = "%spsplash-%s" % (mlprefix, outsuffix)
         if outname == '' or outname in oldpkgs:
             bb.fatal("The output name '%s' derived from the URI %s is not valid, please specify the outsuffix parameter" % (outname, uri))
         else:
@@ -46,9 +47,8 @@ python __anonymous() {
     # Set these so that we have less work to do in do_compile and do_install_append
     d.setVar("SPLASH_INSTALL", " ".join(pkgs))
     d.setVar("SPLASH_LOCALPATHS", " ".join(localpaths))
-
     d.prependVar("PACKAGES", "%s " % (" ".join(pkgs)))
-    mlprefix = d.getVar('MLPREFIX') or ''
+
     pn = d.getVar('PN') or ''
     for p in pkgs:
         ep = '%s%s' % (mlprefix, p)
diff --git a/meta/recipes-devtools/perl/perl_5.30.2.bb b/meta/recipes-devtools/perl/perl_5.30.2.bb
index 778c420b2ee..26138ea9e55 100644
--- a/meta/recipes-devtools/perl/perl_5.30.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.2.bb
@@ -328,7 +328,7 @@ python split_perl_packages () {
 
 python() {
     if d.getVar('CLASSOVERRIDE') == "class-target":
-        d.setVar("PACKAGES_DYNAMIC", "^perl-module-.*(?&lt;!native)$")
+        d.setVar("PACKAGES_DYNAMIC", "^${MLPREFIX}perl-module-.*(?&lt;!native)$")
     elif d.getVar('CLASSOVERRIDE') == "class-native":
         d.setVar("PACKAGES_DYNAMIC", "^perl-module-.*-native$")
     elif d.getVar('CLASSOVERRIDE') == "class-nativesdk":
diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-devtools/python/python3_3.8.2.bb
index a4a16fd495f..0474f07214f 100644
--- a/meta/recipes-devtools/python/python3_3.8.2.bb
+++ b/meta/recipes-devtools/python/python3_3.8.2.bb
@@ -311,8 +311,8 @@ do_create_manifest[depends] += "${PN}:do_patch"
 
 # manual dependency additions
 RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python3-modules"
-RRECOMMENDS_${PN}-crypt_append_class-target = " openssl ca-certificates"
-RRECOMMENDS_${PN}-crypt_append_class-nativesdk = " openssl ca-certificates"
+RRECOMMENDS_${PN}-crypt_append_class-target = " ${MLPREFIX}openssl ${MLPREFIX}ca-certificates"
+RRECOMMENDS_${PN}-crypt_append_class-nativesdk = " ${MLPREFIX}openssl ${MLPREFIX}ca-certificates"
 
 # For historical reasons PN is empty and provided by python3-modules
 FILES_${PN} = ""
@@ -322,7 +322,7 @@ FILES_${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
 FILES_${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
 
 # provide python-pyvenv from python3-venv
-RPROVIDES_${PN}-venv += "python3-pyvenv"
+RPROVIDES_${PN}-venv += "${MLPREFIX}python3-pyvenv"
 
 # package libpython3
 PACKAGES =+ "libpython3 libpython3-staticdev"
@@ -333,8 +333,8 @@ INSANE_SKIP_${PN}-dev += "dev-elf"
 # catch all the rest (unsorted)
 PACKAGES += "${PN}-misc"
 RDEPENDS_${PN}-misc += "python3-core python3-email python3-codecs python3-pydoc python3-pickle python3-audio"
-RDEPENDS_${PN}-modules_append_class-target = " python3-misc"
-RDEPENDS_${PN}-modules_append_class-nativesdk = " python3-misc"
+RDEPENDS_${PN}-modules_append_class-target = " ${MLPREFIX}python3-misc"
+RDEPENDS_${PN}-modules_append_class-nativesdk = " ${MLPREFIX}python3-misc"
 FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python${PYTHON_MAJMIN}/lib-dynload"
 
 # catch manpage
@@ -348,5 +348,5 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
 RDEPENDS_${PN}-tkinter += <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('PACKAGECONFIG','tk','tktk-lib','',d)}">"${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"</a>
 RDEPENDS_${PN}-dev = ""
 
-RDEPENDS_${PN}-tests_append_class-target = " bash"
-RDEPENDS_${PN}-tests_append_class-nativesdk = " bash"
+RDEPENDS_${PN}-tests_append_class-target = " ${MLPREFIX}bash"
+RDEPENDS_${PN}-tests_append_class-nativesdk = " ${MLPREFIX}bash"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index fede691d6ff..bb43a9a8b65 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -212,18 +212,20 @@ python __anonymous() {
               ("gles", "libgles3",)):
         if not p[0] in pkgconfig:
             continue
-        fullp = p[1] + "-mesa"
-        pkgs = " ".join(p[1:])
+        mlprefix = d.getVar("MLPREFIX")
+        fullp = mlprefix + p[1] + "-mesa"
+        mlprefix = d.getVar("MLPREFIX")
+        pkgs = " ".join(mlprefix + x for x in p[1:])
         d.setVar("DEBIAN_NOAUTONAME_" + fullp, "1")
         d.appendVar("RREPLACES_" + fullp, pkgs)
         d.appendVar("RPROVIDES_" + fullp, pkgs)
         d.appendVar("RCONFLICTS_" + fullp, pkgs)
 
-        d.appendVar("RRECOMMENDS_" + fullp, " mesa-megadriver")
+        d.appendVar("RRECOMMENDS_" + fullp, " ${MLPREFIX}mesa-megadriver")
 
         # For -dev, the first element is both the Debian and original name
         fullp += "-dev"
-        pkgs = p[1] + "-dev"
+        pkgs = mlprefix + p[1] + "-dev"
         d.setVar("DEBIAN_NOAUTONAME_" + fullp, "1")
         d.appendVar("RREPLACES_" + fullp, pkgs)
         d.appendVar("RPROVIDES_" + fullp, pkgs)
diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb
index 9882e12763a..d092b158f26 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb
@@ -167,7 +167,7 @@ FILES_${PN}-pulseaudio-conf += "\
 "
 
 RDEPENDS_${PN}-pulseaudio-conf += "\
-        libasound-module-conf-pulse \
-        libasound-module-ctl-pulse \
-        libasound-module-pcm-pulse \
+        ${MLPREFIX}libasound-module-conf-pulse \
+        ${MLPREFIX}libasound-module-ctl-pulse \
+        ${MLPREFIX}libasound-module-pcm-pulse \
 "
diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 8eb9494381f..ca140d595fd 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -62,12 +62,16 @@ PACKAGES = "${PN}-dbg ${BOOST_PACKAGES}"
 python __anonymous () {
     packages = []
     extras = []
+    mlprefix = d.getVar("MLPREFIX")
     for lib in d.getVar('BOOST_LIBS').split():
         extras.append("--with-%s" % lib)
-        pkg = "boost-%s" % lib.replace("_", "-")
-        packages.append(pkg)
+        pkg = "boost-%s" % (lib.replace("_", "-"))
+        packages.append(mlprefix + pkg)
         if not d.getVar("FILES_%s" % pkg):
-                d.setVar("FILES_%s" % pkg, "${libdir}/libboost_%s*.so.*" % lib)
+                d.setVar("FILES_%s%s" % (mlprefix, pkg), "${libdir}/libboost_%s*.so.*" % lib)
+        else:
+                d.setVar("FILES_%s%s" % (mlprefix, pkg), d.getVar("FILES_%s" % pkg))
+
     d.setVar("BOOST_PACKAGES", " ".join(packages))
     d.setVar("BJAM_EXTRA", " ".join(extras))
 }
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
Jeremy A. Puhlman
<a class="moz-txt-link-abbreviated" href="mailto:jpuhlman@mvista.com">jpuhlman@mvista.com</a></pre>
  </body>
</html>

--------------1C5B25BC413E09E4485149F7--
