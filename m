Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 35A66731C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 09:52:17 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id 128so54867963wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 01:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=zjKN37cRNntgZ5HnOl1PPmcxNWtiPckq0e6Hx2BaGM4=;
	b=SqXtsaEXeeT8IpRInboscGsZnlodUs+5txxseX4+d+Hw6v2fa0W62B4dOQXQ4W81qz
	RuJcKryfH6SpUfyHyEVGuz7BdYWJewiEEpcPYyJdon797crOjQ8CD88pqo82uFa8qt9x
	JMI07mYLR9iQrpHpfp943IFRzFnslGu5HH+PeF7wGL7wAh/5BRdWlP0c5f4KjyTdlvdm
	kJRCbpLxhN/xi9DBlbOeudisut0DdetDtRbSWS209mipLFKaweY+ISJT6Q6iYcELPEbm
	z09rpPH2MtPOqKpVvPZurKuVXa03PhfLAcFxPWkWCugv6DdE92AaOW6mEl1B0VROb4Np
	AA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=zjKN37cRNntgZ5HnOl1PPmcxNWtiPckq0e6Hx2BaGM4=;
	b=GegVPSPZsnWcbf1v3Z0wiYmZ6+C4TL6glZoJwAVux9/bZ9t2f8YEjoilAHdDmVIGTi
	ZYGYsQl4V9baQR8/FVh9iO9P84nBR1Jd158lEFr8xidl5L4BxGOa11XYHWL9w248tfjW
	U1H+5rL9tn0RjrZE4bngZeUL4fqDEnqtywrIUglgzG7Q/d7P3SE1YgZ30iFVjX5pbJj3
	dEl6ETPZWWA+3Jx94BQWEXCLeqlaFauRPKsQJ/BRafwulD6DnXP8ML4v7wIBfAzS7Vxq
	pL0yudvWuiMkUBwS2tV5q309OZ2JPLRFnAKYO7MpgyoailEhpG98EUSwMSH5F0z+9amT
	tEGw==
X-Gm-Message-State: AG10YOTCjCsljtGUYDD8P+pD6qHIQXS9Xdx/ASqMUzle6RRV59ra6/trzzYYaCWBUlysRGm6GttL7z83B059Dg==
MIME-Version: 1.0
X-Received: by 10.194.5.36 with SMTP id p4mr647792wjp.167.1455270738247; Fri,
	12 Feb 2016 01:52:18 -0800 (PST)
Received: by 10.194.58.176 with HTTP; Fri, 12 Feb 2016 01:52:18 -0800 (PST)
Date: Fri, 12 Feb 2016 10:52:18 +0100
Message-ID: <CA+chaQd-Yyno+uQOXKZgRqjTUSURtr0X8eSMAO3iRNf3AP_Cmw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Parsing exception with latest oe-core
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
X-List-Received-Date: Fri, 12 Feb 2016 09:52:18 -0000
Content-Type: multipart/alternative; boundary=047d7b5d9c3b67ca82052b8f9fcf

--047d7b5d9c3b67ca82052b8f9fcf
Content-Type: text/plain; charset=UTF-8

Hi,

is anyone else seeing this unhelpful fatal exception?

ERROR: Failure expanding variable
__anon_648__home_jenkins_oe_world_shr_core_openembedded_core_meta_classes_base_bbclass,
expression was def
__anon_648__home_jenkins_oe_world_shr_core_openembedded_core_meta_classes_base_bbclass(d):
    import string, re

    # Handle PACKAGECONFIG
    #
    # These take the form:
    #
    # PACKAGECONFIG ??= "<default options>"
    # PACKAGECONFIG[foo] =
"--enable-foo,--disable-foo,foo_depends,foo_runtime_depends"
    pkgconfigflags = d.getVarFlags("PACKAGECONFIG") or {}
    if pkgconfigflags:
        pkgconfig = (d.getVar('PACKAGECONFIG', True) or "").split()
        pn = d.getVar("PN", True)

        mlprefix = d.getVar("MLPREFIX", True)

        def expandFilter(appends, extension, prefix):
            appends = bb.utils.explode_deps(d.expand(" ".join(appends)))
            newappends = []
            for a in appends:
                if a.endswith("-native") or ("-cross-" in a):
                    newappends.append(a)
                elif a.startswith("virtual/"):
                    subs = a.split("/", 1)[1]
                    if subs.startswith(prefix):
                        newappends.append(a + extension)
                    else:
                        newappends.append("virtual/" + prefix + subs +
extension)
                else:
                    if a.startswith(prefix):
                        newappends.append(a + extension)
                    else:
                        newappends.append(prefix + a + extension)
            return newappends

        def appendVar(varname, appends):
            if not appends:
                return
            if varname.find("DEPENDS") != -1:
                if pn.startswith("nativesdk-"):
                    appends = expandFilter(appends, "", "nativesdk-")
                if pn.endswith("-native"):
                    appends = expandFilter(appends, "-native", "")
                if mlprefix:
                    appends = expandFilter(appends, "", mlprefix)
            varname = d.expand(varname)
            d.appendVar(varname, " " + " ".join(appends))

        extradeps = []
        extrardeps = []
        extraconf = []
        for flag, flagval in sorted(pkgconfigflags.items()):
            items = flagval.split(",")
            num = len(items)
            if num > 4:
                bb.error("%s: PACKAGECONFIG[%s] Only
enable,disable,depend,rdepend can be specified!"
                    % (d.getVar('PN', True), flag))

            if flag in pkgconfig:
                if num >= 3 and items[2]:
                    extradeps.append(items[2])
                if num >= 4 and items[3]:
                    extrardeps.append(items[3])
                if num >= 1 and items[0]:
                    extraconf.append(items[0])
            elif num >= 2 and items[1]:
                    extraconf.append(items[1])
        appendVar('DEPENDS', extradeps)
        appendVar('RDEPENDS_defaultpkgname', extrardeps)
        if bb.data.inherits_class('cmake', d):
            appendVar('EXTRA_OECMAKE', extraconf)
        else:
            appendVar('EXTRA_OECONF', extraconf)

    pn = d.getVar('PN', True)
    license = d.getVar('LICENSE', True)
    if license == "INVALID":
        bb.fatal('This recipe does not have the LICENSE field set (%s)' % pn)

    if bb.data.inherits_class('license', d):
        check_license_format(d)
        unmatched_license_flag = check_license_flags(d)
        if unmatched_license_flag:
            bb.debug(1, "Skipping %s because it has a restricted license not"
                 " whitelisted in LICENSE_FLAGS_WHITELIST" % pn)
            raise bb.parse.SkipPackage("because it has a restricted license not"
                 " whitelisted in LICENSE_FLAGS_WHITELIST")

    # If we're building a target package we need to use fakeroot (pseudo)
    # in order to capture permissions, owners, groups and special files
    if not bb.data.inherits_class('native', d) and not
bb.data.inherits_class('cross', d):
        d.setVarFlag('do_unpack', 'umask', '022')
        d.setVarFlag('do_configure', 'umask', '022')
        d.setVarFlag('do_compile', 'umask', '022')
        d.appendVarFlag('do_install', 'depends', '
virtual/fakeroot-native:do_populate_sysroot')
        d.setVarFlag('do_install', 'fakeroot', '1')
        d.setVarFlag('do_install', 'umask', '022')
        d.appendVarFlag('do_package', 'depends', '
virtual/fakeroot-native:do_populate_sysroot')
        d.setVarFlag('do_package', 'fakeroot', '1')
        d.setVarFlag('do_package', 'umask', '022')
        d.setVarFlag('do_package_setscene', 'fakeroot', '1')
        d.appendVarFlag('do_package_setscene', 'depends', '
virtual/fakeroot-native:do_populate_sysroot')
        d.setVarFlag('do_devshell', 'fakeroot', '1')
        d.appendVarFlag('do_devshell', 'depends', '
virtual/fakeroot-native:do_populate_sysroot')

    need_machine = d.getVar('COMPATIBLE_MACHINE', True)
    if need_machine:
        import re
        compat_machines = (d.getVar('MACHINEOVERRIDES', True) or "").split(":")
        for m in compat_machines:
            if re.match(need_machine, m):
                break
        else:
            raise bb.parse.SkipPackage("incompatible with machine %s
(not in COMPATIBLE_MACHINE)" % d.getVar('MACHINE', True))

    source_mirror_fetch = d.getVar('SOURCE_MIRROR_FETCH', 0)
    if not source_mirror_fetch:
        need_host = d.getVar('COMPATIBLE_HOST', True)
        if need_host:
            import re
            this_host = d.getVar('HOST_SYS', True)
            if not re.match(need_host, this_host):
                raise bb.parse.SkipPackage("incompatible with host %s
(not in COMPATIBLE_HOST)" % this_host)

        bad_licenses = (d.getVar('INCOMPATIBLE_LICENSE', True) or "").split()

        check_license = False if pn.startswith("nativesdk-") else True
        for t in ["-native", "-cross-arm", "-cross-initial-arm",
              "-crosssdk-x86_64", "-crosssdk-initial-x86_64",
              "-cross-canadian-arm"]:
            if pn.endswith(d.expand(t)):
                check_license = False
        if pn.startswith("gcc-source-"):
            check_license = False

        if check_license and bad_licenses:
            bad_licenses = expand_wildcard_licenses(d, bad_licenses)

            whitelist = []
            incompatwl = []
            htincompatwl = []
            for lic in bad_licenses:
                spdx_license = return_spdx(d, lic)
                for w in ["HOSTTOOLS_WHITELIST_", "LGPLv2_WHITELIST_",
"WHITELIST_"]:
                    whitelist.extend((d.getVar(w + lic, True) or "").split())
                    if spdx_license:
                        whitelist.extend((d.getVar(w + spdx_license,
True) or "").split())
                    '''
                    We need to track what we are whitelisting and why. If pn is
                    incompatible and is not HOSTTOOLS_WHITELIST_ we need to be
                    able to note that the image that is created may infact
                    contain incompatible licenses despite INCOMPATIBLE_LICENSE
                    being set.
                    '''
                    if "HOSTTOOLS" in w:
                        htincompatwl.extend((d.getVar(w + lic, True)
or "").split())
                        if spdx_license:
                            htincompatwl.extend((d.getVar(w +
spdx_license, True) or "").split())
                    else:
                        incompatwl.extend((d.getVar(w + lic, True) or
"").split())
                        if spdx_license:
                            incompatwl.extend((d.getVar(w +
spdx_license, True) or "").split())

            if not pn in whitelist:
                recipe_license = d.getVar('LICENSE', True)
                pkgs = d.getVar('PACKAGES', True).split()
                skipped_pkgs = []
                unskipped_pkgs = []
                for pkg in pkgs:
                    if incompatible_license(d, bad_licenses, pkg):
                        skipped_pkgs.append(pkg)
                    else:
                        unskipped_pkgs.append(pkg)
                all_skipped = skipped_pkgs and not unskipped_pkgs
                if unskipped_pkgs:
                    for pkg in skipped_pkgs:
                        bb.debug(1, "SKIPPING the package " + pkg + "
at do_rootfs because it's " + recipe_license)
                        mlprefix = d.getVar('MLPREFIX', True)
                        d.setVar('LICENSE_EXCLUSION-' + mlprefix + pkg, 1)
                    for pkg in unskipped_pkgs:
                        bb.debug(1, "INCLUDING the package " + pkg)
                elif all_skipped or incompatible_license(d, bad_licenses):
                    bb.debug(1, "SKIPPING recipe %s because it's %s" %
(pn, recipe_license))
                    raise bb.parse.SkipPackage("incompatible with
license %s" % recipe_license)
            elif pn in whitelist:
                if pn in incompatwl:
                    bb.note("INCLUDING " + pn + " as buildable despite
INCOMPATIBLE_LICENSE because it has been whitelisted")
                elif pn in htincompatwl:
                    bb.note("INCLUDING " + pn + " as buildable despite
INCOMPATIBLE_LICENSE because it has been whitelisted for HOSTTOOLS")

    needsrcrev = False
    srcuri = d.getVar('SRC_URI', True)
    for uri in srcuri.split():
        (scheme, _ , path) = bb.fetch.decodeurl(uri)[:3]

        # HTTP/FTP use the wget fetcher
        if scheme in ("http", "https", "ftp"):
            d.appendVarFlag('do_fetch', 'depends', '
wget-native:do_populate_sysroot')

        # Svn packages should DEPEND on subversion-native
        if scheme == "svn":
            needsrcrev = True
            d.appendVarFlag('do_fetch', 'depends', '
subversion-native:do_populate_sysroot')

        # Git packages should DEPEND on git-native
        elif scheme == "git":
            needsrcrev = True
            d.appendVarFlag('do_fetch', 'depends', '
git-native:do_populate_sysroot')

        # Mercurial packages should DEPEND on mercurial-native
        elif scheme == "hg":
            needsrcrev = True
            d.appendVarFlag('do_fetch', 'depends', '
mercurial-native:do_populate_sysroot')

        # OSC packages should DEPEND on osc-native
        elif scheme == "osc":
            d.appendVarFlag('do_fetch', 'depends', '
osc-native:do_populate_sysroot')

        # *.lz4 should DEPEND on lz4-native for unpacking
        if path.endswith('.lz4'):
            d.appendVarFlag('do_unpack', 'depends', '
lz4-native:do_populate_sysroot')

        # *.lz should DEPEND on lzip-native for unpacking
        elif path.endswith('.lz'):
            d.appendVarFlag('do_unpack', 'depends', '
lzip-native:do_populate_sysroot')

        # *.xz should DEPEND on xz-native for unpacking
        elif path.endswith('.xz'):
            d.appendVarFlag('do_unpack', 'depends', '
xz-native:do_populate_sysroot')

        # .zip should DEPEND on unzip-native for unpacking
        elif path.endswith('.zip'):
            d.appendVarFlag('do_unpack', 'depends', '
unzip-native:do_populate_sysroot')

        # file is needed by rpm2cpio.sh
        elif path.endswith('.src.rpm'):
            d.appendVarFlag('do_unpack', 'depends', '
file-native:do_populate_sysroot')

    if needsrcrev:
        d.setVar("SRCPV", "${@bb.fetch2.get_srcrev(d)}")

    set_packagetriplet(d)

    # 'multimachine' handling
    mach_arch = d.getVar('MACHINE_ARCH', True)
    pkg_arch = d.getVar('PACKAGE_ARCH', True)

    if (pkg_arch == mach_arch):
        # Already machine specific - nothing further to do
        return

    #
    # We always try to scan SRC_URI for urls with machine overrides
    # unless the package sets SRC_URI_OVERRIDES_PACKAGE_ARCH=0
    #
    override = d.getVar('SRC_URI_OVERRIDES_PACKAGE_ARCH', True)
    if override != '0':
        paths = []
        fpaths = (d.getVar('FILESPATH', True) or '').split(':')
        machine = d.getVar('MACHINE', True)
        for p in fpaths:
            if os.path.basename(p) == machine and os.path.isdir(p):
                paths.append(p)

        if len(paths) != 0:
            for s in srcuri.split():
                if not s.startswith("file://"):
                    continue
                fetcher = bb.fetch2.Fetch([s], d)
                local = fetcher.localpath(s)
                for mp in paths:
                    if local.startswith(mp):
                        #bb.note("overriding PACKAGE_ARCH from %s to
%s for %s" % (pkg_arch, mach_arch, pn))
                        d.setVar('PACKAGE_ARCH', "qemuarm")
                        return

    packages = d.getVar('PACKAGES', True).split()
    for pkg in packages:
        pkgarch = d.getVar("PACKAGE_ARCH_%s" % pkg, True)

        # We could look for != PACKAGE_ARCH here but how to choose
        # if multiple differences are present?
        # Look through PACKAGE_ARCHS for the priority order?
        if pkgarch and pkgarch == mach_arch:
            d.setVar('PACKAGE_ARCH', "qemuarm")
            bb.warn("Recipe %s is marked as only being architecture
specific but seems to have machine specific packages?! The recipe may
as well mark itself as machine specific directly." % d.getVar("PN",
True))
 which triggered exception FetchError: Fetcher failure: SRCREV was
used yet no valid SCM was found in SRC_URI

--047d7b5d9c3b67ca82052b8f9fcf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>is anyone else seeing this unhelpfu=
l fatal exception?</div><div><br></div><div><pre class=3D"" style=3D"white-=
space:pre-wrap;word-wrap:break-word;margin-top:0px;margin-bottom:0px;color:=
rgb(51,51,51);font-size:13px">ERROR: Failure expanding variable __anon_648_=
_home_jenkins_oe_world_shr_core_openembedded_core_meta_classes_base_bbclass=
, expression was def __anon_648__home_jenkins_oe_world_shr_core_openembedde=
d_core_meta_classes_base_bbclass(d):
    import string, re

    # Handle PACKAGECONFIG
    #
    # These take the form:
    #
    # PACKAGECONFIG ??=3D &quot;&lt;default options&gt;&quot;
    # PACKAGECONFIG[foo] =3D &quot;--enable-foo,--disable-foo,foo_depends,f=
oo_runtime_depends&quot;
    pkgconfigflags =3D d.getVarFlags(&quot;PACKAGECONFIG&quot;) or {}
    if pkgconfigflags:
        pkgconfig =3D (d.getVar(&#39;PACKAGECONFIG&#39;, True) or &quot;&qu=
ot;).split()
        pn =3D d.getVar(&quot;PN&quot;, True)

        mlprefix =3D d.getVar(&quot;MLPREFIX&quot;, True)

        def expandFilter(appends, extension, prefix):
            appends =3D bb.utils.explode_deps(d.expand(&quot; &quot;.join(a=
ppends)))
            newappends =3D []
            for a in appends:
                if a.endswith(&quot;-native&quot;) or (&quot;-cross-&quot; =
in a):
                    newappends.append(a)
                elif a.startswith(&quot;virtual/&quot;):
                    subs =3D a.split(&quot;/&quot;, 1)[1]
                    if subs.startswith(prefix):
                        newappends.append(a + extension)
                    else:
                        newappends.append(&quot;virtual/&quot; + prefix + s=
ubs + extension)
                else:
                    if a.startswith(prefix):
                        newappends.append(a + extension)
                    else:
                        newappends.append(prefix + a + extension)
            return newappends

        def appendVar(varname, appends):
            if not appends:
                return
            if varname.find(&quot;DEPENDS&quot;) !=3D -1:
                if pn.startswith(&quot;nativesdk-&quot;):
                    appends =3D expandFilter(appends, &quot;&quot;, &quot;n=
ativesdk-&quot;)
                if pn.endswith(&quot;-native&quot;):
                    appends =3D expandFilter(appends, &quot;-native&quot;, =
&quot;&quot;)
                if mlprefix:
                    appends =3D expandFilter(appends, &quot;&quot;, mlprefi=
x)
            varname =3D d.expand(varname)
            d.appendVar(varname, &quot; &quot; + &quot; &quot;.join(appends=
))

        extradeps =3D []
        extrardeps =3D []
        extraconf =3D []
        for flag, flagval in sorted(pkgconfigflags.items()):
            items =3D flagval.split(&quot;,&quot;)
            num =3D len(items)
            if num &gt; 4:
                bb.error(&quot;%s: PACKAGECONFIG[%s] Only enable,disable,de=
pend,rdepend can be specified!&quot;
                    % (d.getVar(&#39;PN&#39;, True), flag))

            if flag in pkgconfig:
                if num &gt;=3D 3 and items[2]:
                    extradeps.append(items[2])
                if num &gt;=3D 4 and items[3]:
                    extrardeps.append(items[3])
                if num &gt;=3D 1 and items[0]:
                    extraconf.append(items[0])
            elif num &gt;=3D 2 and items[1]:
                    extraconf.append(items[1])
        appendVar(&#39;DEPENDS&#39;, extradeps)
        appendVar(&#39;RDEPENDS_defaultpkgname&#39;, extrardeps)
        if bb.data.inherits_class(&#39;cmake&#39;, d):
            appendVar(&#39;EXTRA_OECMAKE&#39;, extraconf)
        else:
            appendVar(&#39;EXTRA_OECONF&#39;, extraconf)

    pn =3D d.getVar(&#39;PN&#39;, True)
    license =3D d.getVar(&#39;LICENSE&#39;, True)
    if license =3D=3D &quot;INVALID&quot;:
        bb.fatal(&#39;This recipe does not have the LICENSE field set (%s)&=
#39; % pn)

    if bb.data.inherits_class(&#39;license&#39;, d):
        check_license_format(d)
        unmatched_license_flag =3D check_license_flags(d)
        if unmatched_license_flag:
            bb.debug(1, &quot;Skipping %s because it has a restricted licen=
se not&quot;
                 &quot; whitelisted in LICENSE_FLAGS_WHITELIST&quot; % pn)
            raise bb.parse.SkipPackage(&quot;because it has a restricted li=
cense not&quot;
                 &quot; whitelisted in LICENSE_FLAGS_WHITELIST&quot;)

    # If we&#39;re building a target package we need to use fakeroot (pseud=
o)
    # in order to capture permissions, owners, groups and special files
    if not bb.data.inherits_class(&#39;native&#39;, d) and not bb.data.inhe=
rits_class(&#39;cross&#39;, d):
        d.setVarFlag(&#39;do_unpack&#39;, &#39;umask&#39;, &#39;022&#39;)
        d.setVarFlag(&#39;do_configure&#39;, &#39;umask&#39;, &#39;022&#39;=
)
        d.setVarFlag(&#39;do_compile&#39;, &#39;umask&#39;, &#39;022&#39;)
        d.appendVarFlag(&#39;do_install&#39;, &#39;depends&#39;, &#39; virt=
ual/fakeroot-native:do_populate_sysroot&#39;)
        d.setVarFlag(&#39;do_install&#39;, &#39;fakeroot&#39;, &#39;1&#39;)
        d.setVarFlag(&#39;do_install&#39;, &#39;umask&#39;, &#39;022&#39;)
        d.appendVarFlag(&#39;do_package&#39;, &#39;depends&#39;, &#39; virt=
ual/fakeroot-native:do_populate_sysroot&#39;)
        d.setVarFlag(&#39;do_package&#39;, &#39;fakeroot&#39;, &#39;1&#39;)
        d.setVarFlag(&#39;do_package&#39;, &#39;umask&#39;, &#39;022&#39;)
        d.setVarFlag(&#39;do_package_setscene&#39;, &#39;fakeroot&#39;, &#3=
9;1&#39;)
        d.appendVarFlag(&#39;do_package_setscene&#39;, &#39;depends&#39;, &=
#39; virtual/fakeroot-native:do_populate_sysroot&#39;)
        d.setVarFlag(&#39;do_devshell&#39;, &#39;fakeroot&#39;, &#39;1&#39;=
)
        d.appendVarFlag(&#39;do_devshell&#39;, &#39;depends&#39;, &#39; vir=
tual/fakeroot-native:do_populate_sysroot&#39;)

    need_machine =3D d.getVar(&#39;COMPATIBLE_MACHINE&#39;, True)
    if need_machine:
        import re
        compat_machines =3D (d.getVar(&#39;MACHINEOVERRIDES&#39;, True) or =
&quot;&quot;).split(&quot;:&quot;)
        for m in compat_machines:
            if re.match(need_machine, m):
                break
        else:
            raise bb.parse.SkipPackage(&quot;incompatible with machine %s (=
not in COMPATIBLE_MACHINE)&quot; % d.getVar(&#39;MACHINE&#39;, True))

    source_mirror_fetch =3D d.getVar(&#39;SOURCE_MIRROR_FETCH&#39;, 0)
    if not source_mirror_fetch:
        need_host =3D d.getVar(&#39;COMPATIBLE_HOST&#39;, True)
        if need_host:
            import re
            this_host =3D d.getVar(&#39;HOST_SYS&#39;, True)
            if not re.match(need_host, this_host):
                raise bb.parse.SkipPackage(&quot;incompatible with host %s =
(not in COMPATIBLE_HOST)&quot; % this_host)

        bad_licenses =3D (d.getVar(&#39;INCOMPATIBLE_LICENSE&#39;, True) or=
 &quot;&quot;).split()

        check_license =3D False if pn.startswith(&quot;nativesdk-&quot;) el=
se True
        for t in [&quot;-native&quot;, &quot;-cross-arm&quot;, &quot;-cross=
-initial-arm&quot;,
              &quot;-crosssdk-x86_64&quot;, &quot;-crosssdk-initial-x86_64&=
quot;,
              &quot;-cross-canadian-arm&quot;]:
            if pn.endswith(d.expand(t)):
                check_license =3D False
        if pn.startswith(&quot;gcc-source-&quot;):
            check_license =3D False

        if check_license and bad_licenses:
            bad_licenses =3D expand_wildcard_licenses(d, bad_licenses)

            whitelist =3D []
            incompatwl =3D []
            htincompatwl =3D []
            for lic in bad_licenses:
                spdx_license =3D return_spdx(d, lic)
                for w in [&quot;HOSTTOOLS_WHITELIST_&quot;, &quot;LGPLv2_WH=
ITELIST_&quot;, &quot;WHITELIST_&quot;]:
                    whitelist.extend((d.getVar(w + lic, True) or &quot;&quo=
t;).split())
                    if spdx_license:
                        whitelist.extend((d.getVar(w + spdx_license, True) =
or &quot;&quot;).split())
                    &#39;&#39;&#39;
                    We need to track what we are whitelisting and why. If p=
n is
                    incompatible and is not HOSTTOOLS_WHITELIST_ we need to=
 be
                    able to note that the image that is created may infact
                    contain incompatible licenses despite INCOMPATIBLE_LICE=
NSE
                    being set.
                    &#39;&#39;&#39;
                    if &quot;HOSTTOOLS&quot; in w:
                        htincompatwl.extend((d.getVar(w + lic, True) or &qu=
ot;&quot;).split())
                        if spdx_license:
                            htincompatwl.extend((d.getVar(w + spdx_license,=
 True) or &quot;&quot;).split())
                    else:
                        incompatwl.extend((d.getVar(w + lic, True) or &quot=
;&quot;).split())
                        if spdx_license:
                            incompatwl.extend((d.getVar(w + spdx_license, T=
rue) or &quot;&quot;).split())

            if not pn in whitelist:
                recipe_license =3D d.getVar(&#39;LICENSE&#39;, True)
                pkgs =3D d.getVar(&#39;PACKAGES&#39;, True).split()
                skipped_pkgs =3D []
                unskipped_pkgs =3D []
                for pkg in pkgs:
                    if incompatible_license(d, bad_licenses, pkg):
                        skipped_pkgs.append(pkg)
                    else:
                        unskipped_pkgs.append(pkg)
                all_skipped =3D skipped_pkgs and not unskipped_pkgs
                if unskipped_pkgs:
                    for pkg in skipped_pkgs:
                        bb.debug(1, &quot;SKIPPING the package &quot; + pkg=
 + &quot; at do_rootfs because it&#39;s &quot; + recipe_license)
                        mlprefix =3D d.getVar(&#39;MLPREFIX&#39;, True)
                        d.setVar(&#39;LICENSE_EXCLUSION-&#39; + mlprefix + =
pkg, 1)
                    for pkg in unskipped_pkgs:
                        bb.debug(1, &quot;INCLUDING the package &quot; + pk=
g)
                elif all_skipped or incompatible_license(d, bad_licenses):
                    bb.debug(1, &quot;SKIPPING recipe %s because it&#39;s %=
s&quot; % (pn, recipe_license))
                    raise bb.parse.SkipPackage(&quot;incompatible with lice=
nse %s&quot; % recipe_license)
            elif pn in whitelist:
                if pn in incompatwl:
                    bb.note(&quot;INCLUDING &quot; + pn + &quot; as buildab=
le despite INCOMPATIBLE_LICENSE because it has been whitelisted&quot;)
                elif pn in htincompatwl:
                    bb.note(&quot;INCLUDING &quot; + pn + &quot; as buildab=
le despite INCOMPATIBLE_LICENSE because it has been whitelisted for HOSTTOO=
LS&quot;)

    needsrcrev =3D False
    srcuri =3D d.getVar(&#39;SRC_URI&#39;, True)
    for uri in srcuri.split():
        (scheme, _ , path) =3D bb.fetch.decodeurl(uri)[:3]

        # HTTP/FTP use the wget fetcher
        if scheme in (&quot;http&quot;, &quot;https&quot;, &quot;ftp&quot;)=
:
            d.appendVarFlag(&#39;do_fetch&#39;, &#39;depends&#39;, &#39; wg=
et-native:do_populate_sysroot&#39;)

        # Svn packages should DEPEND on subversion-native
        if scheme =3D=3D &quot;svn&quot;:
            needsrcrev =3D True
            d.appendVarFlag(&#39;do_fetch&#39;, &#39;depends&#39;, &#39; su=
bversion-native:do_populate_sysroot&#39;)

        # Git packages should DEPEND on git-native
        elif scheme =3D=3D &quot;git&quot;:
            needsrcrev =3D True
            d.appendVarFlag(&#39;do_fetch&#39;, &#39;depends&#39;, &#39; gi=
t-native:do_populate_sysroot&#39;)

        # Mercurial packages should DEPEND on mercurial-native
        elif scheme =3D=3D &quot;hg&quot;:
            needsrcrev =3D True
            d.appendVarFlag(&#39;do_fetch&#39;, &#39;depends&#39;, &#39; me=
rcurial-native:do_populate_sysroot&#39;)

        # OSC packages should DEPEND on osc-native
        elif scheme =3D=3D &quot;osc&quot;:
            d.appendVarFlag(&#39;do_fetch&#39;, &#39;depends&#39;, &#39; os=
c-native:do_populate_sysroot&#39;)

        # *.lz4 should DEPEND on lz4-native for unpacking
        if path.endswith(&#39;.lz4&#39;):
            d.appendVarFlag(&#39;do_unpack&#39;, &#39;depends&#39;, &#39; l=
z4-native:do_populate_sysroot&#39;)

        # *.lz should DEPEND on lzip-native for unpacking
        elif path.endswith(&#39;.lz&#39;):
            d.appendVarFlag(&#39;do_unpack&#39;, &#39;depends&#39;, &#39; l=
zip-native:do_populate_sysroot&#39;)

        # *.xz should DEPEND on xz-native for unpacking
        elif path.endswith(&#39;.xz&#39;):
            d.appendVarFlag(&#39;do_unpack&#39;, &#39;depends&#39;, &#39; x=
z-native:do_populate_sysroot&#39;)

        # .zip should DEPEND on unzip-native for unpacking
        elif path.endswith(&#39;.zip&#39;):
            d.appendVarFlag(&#39;do_unpack&#39;, &#39;depends&#39;, &#39; u=
nzip-native:do_populate_sysroot&#39;)

        # file is needed by rpm2cpio.sh
        elif path.endswith(&#39;.src.rpm&#39;):
            d.appendVarFlag(&#39;do_unpack&#39;, &#39;depends&#39;, &#39; f=
ile-native:do_populate_sysroot&#39;)

    if needsrcrev:
        d.setVar(&quot;SRCPV&quot;, &quot;${@bb.fetch2.get_srcrev(d)}&quot;=
)

    set_packagetriplet(d)

    # &#39;multimachine&#39; handling
    mach_arch =3D d.getVar(&#39;MACHINE_ARCH&#39;, True)
    pkg_arch =3D d.getVar(&#39;PACKAGE_ARCH&#39;, True)

    if (pkg_arch =3D=3D mach_arch):
        # Already machine specific - nothing further to do
        return

    #
    # We always try to scan SRC_URI for urls with machine overrides
    # unless the package sets SRC_URI_OVERRIDES_PACKAGE_ARCH=3D0
    #
    override =3D d.getVar(&#39;SRC_URI_OVERRIDES_PACKAGE_ARCH&#39;, True)
    if override !=3D &#39;0&#39;:
        paths =3D []
        fpaths =3D (d.getVar(&#39;FILESPATH&#39;, True) or &#39;&#39;).spli=
t(&#39;:&#39;)
        machine =3D d.getVar(&#39;MACHINE&#39;, True)
        for p in fpaths:
            if os.path.basename(p) =3D=3D machine and os.path.isdir(p):
                paths.append(p)

        if len(paths) !=3D 0:
            for s in srcuri.split():
                if not s.startswith(&quot;file://&quot;):
                    continue
                fetcher =3D bb.fetch2.Fetch([s], d)
                local =3D fetcher.localpath(s)
                for mp in paths:
                    if local.startswith(mp):
                        #bb.note(&quot;overriding PACKAGE_ARCH from %s to %=
s for %s&quot; % (pkg_arch, mach_arch, pn))
                        d.setVar(&#39;PACKAGE_ARCH&#39;, &quot;qemuarm&quot=
;)
                        return

    packages =3D d.getVar(&#39;PACKAGES&#39;, True).split()
    for pkg in packages:
        pkgarch =3D d.getVar(&quot;PACKAGE_ARCH_%s&quot; % pkg, True)

        # We could look for !=3D PACKAGE_ARCH here but how to choose
        # if multiple differences are present?
        # Look through PACKAGE_ARCHS for the priority order?
        if pkgarch and pkgarch =3D=3D mach_arch:
            d.setVar(&#39;PACKAGE_ARCH&#39;, &quot;qemuarm&quot;)
            bb.warn(&quot;Recipe %s is marked as only being architecture sp=
ecific but seems to have machine specific packages?! The recipe may as well=
 mark itself as machine specific directly.&quot; % d.getVar(&quot;PN&quot;,=
 True))
 which triggered exception FetchError: Fetcher failure: SRCREV was used yet=
 no valid SCM was found in SRC_URI
</pre></div><div><br></div></div>

--047d7b5d9c3b67ca82052b8f9fcf--
