Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T3WkE-000359-8g
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 20:30:34 +0200
Received: by wgbdr1 with SMTP id dr1so4930796wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 11:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Kb51Qkqn77P3UuNsc6IYA77Q8WDzC5OBECOOAnGhZ04=;
	b=FThaFDsTABMKwy6sPUJUYvVGGTjBJagPoMPZp3JlKqlfBO/3E1DmIJvUEIQ9B2QNoT
	/xOjd/wNCgC2n+3UTpqhxTGYlElrTeMntC9+k4HBF4NGwNtys8Ue1EBAvQezpmPuxt3X
	Xq8qeHaE0+Kp0c5NgLWSErHVVRwfrEJzsc5MPXlro+Mjtmyvtf1P91VByYZrMUZPLL3K
	gBwZAqTspxXJe4/BzxCzFhyKsLnGGZ5pf+OlztsHfUAMxcmkep8y7D1RkaZUaPGIEeIg
	rtCb+ETVFg3hvbyuszODcYh25lyS4ScXwDMxsV8NLTUofPPFmHKHz2wLohfORwD1vM8p
	j1ZA==
Received: by 10.180.91.169 with SMTP id cf9mr36186788wib.1.1345486711455;
	Mon, 20 Aug 2012 11:18:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q4sm29220043wix.9.2012.08.20.11.18.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 11:18:29 -0700 (PDT)
Date: Mon, 20 Aug 2012 20:18:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120820181831.GE3063@jama.jama.net>
References: <1345481905.3907.31.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1345481905.3907.31.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: meta/classes: Various python whitespace fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2012 18:30:34 -0000
X-Groupsio-MsgNum: 27917
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qFgkTsE6LiHkLPZw"
Content-Disposition: inline

--qFgkTsE6LiHkLPZw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 20, 2012 at 05:58:25PM +0100, Richard Purdie wrote:
> It was pointed out we have a number of weird indentations in the python f=
unctions. This patch
> cleans up 3, 7 and other weird indentations for the core bbclass files.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 84dcb47..6021ce0 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -205,8 +205,8 @@ def preferred_ml_updates(d):
>              continue
>          virt =3D ""
>          if pkg.startswith("virtual/"):
> -             pkg =3D pkg.replace("virtual/", "")
> -             virt =3D "virtual/"
> +            pkg =3D pkg.replace("virtual/", "")
> +            virt =3D "virtual/"
>          for p in prefixes:
>              newname =3D "PREFERRED_PROVIDER_" + virt + p + "-" + pkg
>              if pkg !=3D "kernel":
> @@ -353,13 +353,13 @@ python () {
>              appends =3D bb.utils.explode_deps(d.expand(" ".join(appends)=
))
>              newappends =3D []
>              for a in appends:
> -               if a.endswith("-native") or a.endswith("-cross"):
> -                   newappends.append(a)
> -               elif a.startswith("virtual/"):
> -                   subs =3D a.split("/", 1)[1]
> -                   newappends.append("virtual/" + prefix + subs + extens=
ion)
> -               else:
> -                   newappends.append(prefix + a + extension)
> +                if a.endswith("-native") or a.endswith("-cross"):
> +                    newappends.append(a)
> +                elif a.startswith("virtual/"):
> +                    subs =3D a.split("/", 1)[1]
> +                    newappends.append("virtual/" + prefix + subs + exten=
sion)
> +                else:
> +                    newappends.append(prefix + a + extension)
>              return newappends
> =20
>          def appendVar(varname, appends):
> diff --git a/meta/classes/bugzilla.bbclass b/meta/classes/bugzilla.bbclass
> index 6806dcd..006763d 100644
> --- a/meta/classes/bugzilla.bbclass
> +++ b/meta/classes/bugzilla.bbclass
> @@ -105,8 +105,8 @@ python bugzilla_eventhandler() {
>      data =3D e.data
>      name =3D bb.event.getName(event)
>      if name =3D=3D "MsgNote":
> -       # avoid recursion
> -       return
> +        # avoid recursion
> +        return
> =20
>      if name =3D=3D "TaskFailed":
>          xmlrpc  =3D data.getVar("BUGZILLA_XMLRPC", True)
> diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bb=
class
> index dc9afb1..6fd13a8 100644
> --- a/meta/classes/buildstats.bbclass
> +++ b/meta/classes/buildstats.bbclass
> @@ -65,7 +65,7 @@ def set_device(e):
>      try:
>          for line in open("/proc/diskstats", "r"):
>              if majordev =3D=3D int(line.split()[0]) and minordev =3D=3D =
int(line.split()[1]):
> -               rdev=3Dline.split()[2]
> +                rdev=3Dline.split()[2]
>      except:
>          pass
>      file =3D open(e.data.getVar('DEVFILE', True), "w")
> @@ -100,10 +100,10 @@ def get_diskdata(var, dev, data):
>      olddiskdata =3D data.getVar(var, False)
>      diskdata =3D {}
>      if olddiskdata is None:
> -       return
> +        return
>      newdiskdata =3D get_diskstats(dev)
>      for key in olddiskdata.iterkeys():
> -        diskdata["Start"+key] =3D str(int(olddiskdata[key]))       =20
> +        diskdata["Start"+key] =3D str(int(olddiskdata[key]))
>          diskdata["End"+key] =3D str(int(newdiskdata[key]))   =20
>      return diskdata
>     =20
> diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
> index 147accc..a093628 100644
> --- a/meta/classes/grub-efi.bbclass
> +++ b/meta/classes/grub-efi.bbclass
> @@ -54,12 +54,12 @@ python build_grub_cfg() {
>      if not workdir:
>          bb.error("WORKDIR not defined, unable to package")
>          return
> -      =20
> +
>      labels =3D d.getVar('LABELS', True)
>      if not labels:
>          bb.debug(1, "LABELS not defined, nothing to do")
>          return
> -  =20
> +
>      if labels =3D=3D []:
>          bb.debug(1, "No labels, nothing to do")
>          return
> @@ -109,7 +109,7 @@ python build_grub_cfg() {
>          if append:
>              cfgfile.write('%s' % (append))
>          cfgfile.write('\n')
> -  =20
> +
>          if initrd:
>              cfgfile.write('initrd /initrd')
>          cfgfile.write('\n}\n')
> diff --git a/meta/classes/image-swab.bbclass b/meta/classes/image-swab.bb=
class
> index 0414653..37d7535 100644
> --- a/meta/classes/image-swab.bbclass
> +++ b/meta/classes/image-swab.bbclass
> @@ -51,13 +51,13 @@ python() {
>      # and cross packages which aren't swabber-native or one of its depen=
dencies
>      # I have ignored them for now...
>      if not bb.data.inherits_class('native', d) and not bb.data.inherits_=
class('nativesdk', d) and not bb.data.inherits_class('cross', d):
> -       deps =3D (d.getVarFlag('do_setscene', 'depends') or "").split()
> -       deps.append('strace-native:do_populate_sysroot')
> -       d.setVarFlag('do_setscene', 'depends', " ".join(deps))
> -       logdir =3D d.expand("${TRACE_LOGDIR}")
> -       bb.utils.mkdirhier(logdir)
> +        deps =3D (d.getVarFlag('do_setscene', 'depends') or "").split()
> +        deps.append('strace-native:do_populate_sysroot')
> +        d.setVarFlag('do_setscene', 'depends', " ".join(deps))
> +        logdir =3D d.expand("${TRACE_LOGDIR}")
> +        bb.utils.mkdirhier(logdir)
>      else:
> -       d.setVar('STRACEFUNC', '')
> +        d.setVar('STRACEFUNC', '')
>  }
> =20
>  STRACEPID =3D "${@os.getpid()}"
> @@ -76,23 +76,23 @@ imageswab_attachstrace () {
> =20
>  do_generate_swabber_report () {
> =20
> -  update_distro ${HOST_DATA}
> +	update_distro ${HOST_DATA}
> =20
> -  # Swabber can't create the directory for us
> -  mkdir -p ${SWABBER_REPORT}
> +	# Swabber can't create the directory for us
> +	mkdir -p ${SWABBER_REPORT}
> =20
> -  REPORTSTAMP=3D${SWAB_ORIG_TASK}-`date +%2m%2d%2H%2M%Y`
> +	REPORTSTAMP=3D${SWAB_ORIG_TASK}-`date +%2m%2d%2H%2M%Y`
> =20
> -  if [ `which ccache` ] ; then
> -    CCACHE_DIR=3D`( ccache -s | grep "cache directory" | grep -o '[^ ]*$=
' 2> /dev/null )`
> -  fi
> +	if [ `which ccache` ] ; then
> +		CCACHE_DIR=3D`( ccache -s | grep "cache directory" | grep -o '[^ ]*$' =
2> /dev/null )`
> + 	fi
> =20
> -  if [ "$(ls -A ${HOST_DATA})" ]; then
> -    echo "Generating swabber report"
> -    swabber -d ${HOST_DATA} -l ${SWABBER_LOGS} -o ${SWABBER_REPORT}/repo=
rt-${REPORTSTAMP}.txt -r ${SWABBER_REPORT}/extra_report-${REPORTSTAMP}.txt =
-c all -p ${TOPDIR} -f ${OEROOT}/meta/conf/swabber ${TOPDIR} ${OEROOT} ${CC=
ACHE_DIR}
> -  else
> -    echo "No host data, cannot generate swabber report."
> -  fi
> +	if [ "$(ls -A ${HOST_DATA})" ]; then
> +		echo "Generating swabber report"
> +		swabber -d ${HOST_DATA} -l ${SWABBER_LOGS} -o ${SWABBER_REPORT}/report=
-${REPORTSTAMP}.txt -r ${SWABBER_REPORT}/extra_report-${REPORTSTAMP}.txt -c=
 all -p ${TOPDIR} -f ${OEROOT}/meta/conf/swabber ${TOPDIR} ${OEROOT} ${CCAC=
HE_DIR}
> +	else
> +		echo "No host data, cannot generate swabber report."
> +	fi
>  }
>  addtask generate_swabber_report after do_${SWAB_ORIG_TASK}
>  do_generate_swabber_report[depends] =3D "swabber-native:do_populate_sysr=
oot"
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 556a176..0f3f1cd 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -109,7 +109,7 @@ def package_qa_get_machine_dict():
>              "linux-gnux32" :       {
>                          "x86_64":     (62,     0,    0,          True,  =
        32),
>                        },
> -       }
> +        }
> =20
> =20
>  # Currently not being used by default "desktop"
> @@ -719,19 +719,19 @@ Rerun configure task after fixing this. The path wa=
s '%s'""" % root)
> =20
>      cnf =3D d.getVar('EXTRA_OECONF', True) or ""
>      if "gettext" not in d.getVar('P', True) and "gcc-runtime" not in d.g=
etVar('P', True) and "--disable-nls" not in cnf:
> -       ml =3D d.getVar("MLPREFIX", True) or ""
> -       if bb.data.inherits_class('native', d) or bb.data.inherits_class(=
'cross', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_cl=
ass('nativesdk', d):
> -          gt =3D "gettext-native"
> -       elif bb.data.inherits_class('cross-canadian', d):
> -          gt =3D "gettext-nativesdk"
> -       else:
> -          gt =3D "virtual/" + ml + "gettext"
> -       deps =3D bb.utils.explode_deps(d.getVar('DEPENDS', True) or "")
> -       if gt not in deps:
> -          for config in configs:
> -              gnu =3D "grep \"^[[:space:]]*AM_GNU_GETTEXT\" %s >/dev/nul=
l" % config
> -              if subprocess.call(gnu, shell=3DTrue) =3D=3D 0:
> -                 bb.fatal("""%s required but not in DEPENDS for file %s.
> +        ml =3D d.getVar("MLPREFIX", True) or ""
> +        if bb.data.inherits_class('native', d) or bb.data.inherits_class=
('cross', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_c=
lass('nativesdk', d):
> +            gt =3D "gettext-native"
> +        elif bb.data.inherits_class('cross-canadian', d):
> +            gt =3D "gettext-nativesdk"
> +        else:
> +            gt =3D "virtual/" + ml + "gettext"
> +        deps =3D bb.utils.explode_deps(d.getVar('DEPENDS', True) or "")
> +        if gt not in deps:
> +            for config in configs:
> +                gnu =3D "grep \"^[[:space:]]*AM_GNU_GETTEXT\" %s >/dev/n=
ull" % config
> +                if subprocess.call(gnu, shell=3DTrue) =3D=3D 0:
> +                    bb.fatal("""%s required but not in DEPENDS for file =
%s.
>  Missing inherit gettext?""" % (gt, config))
> =20
>      if not package_qa_check_license(workdir, d):
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 278f0f0..b17fa08 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -230,42 +230,42 @@ def splitfile2(debugsrcdir, d):
> =20
>      sourcefile =3D d.expand("${WORKDIR}/debugsources.list")
>      if debugsrcdir and os.path.isfile(sourcefile):
> -       dvar =3D d.getVar('PKGD', True)
> -       pathprefix =3D "export PATH=3D%s; " % d.getVar('PATH', True)
> -       strip =3D d.getVar("STRIP", True)
> -       objcopy =3D d.getVar("OBJCOPY", True)
> -       debugedit =3D d.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debugedi=
t")
> -       workdir =3D d.getVar("WORKDIR", True)
> -       workparentdir =3D os.path.dirname(workdir)
> -       workbasedir =3D os.path.basename(workdir)
> -
> -       nosuchdir =3D []
> -       basepath =3D dvar
> -       for p in debugsrcdir.split("/"):
> -           basepath =3D basepath + "/" + p
> -           if not os.path.exists(basepath):
> -               nosuchdir.append(basepath)
> -       bb.mkdirhier(basepath)
> -
> -       processdebugsrc =3D  "LC_ALL=3DC ; sort -z -u '%s' | egrep -v -z =
'(<internal>|<built-in>)$' | "
> -       # We need to ignore files that are not actually ours
> -       # we do this by only paying attention to items from this package
> -       processdebugsrc +=3D "fgrep -z '%s' | "
> -       processdebugsrc +=3D "(cd '%s' ; cpio -pd0mL --no-preserve-owner =
'%s%s' 2>/dev/null)"
> -
> -       subprocess.call(processdebugsrc % (sourcefile, workbasedir, workp=
arentdir, dvar, debugsrcdir), shell=3DTrue)
> -
> -       # The copy by cpio may have resulted in some empty directories!  =
Remove these
> -       for root, dirs, files in os.walk("%s%s" % (dvar, debugsrcdir)):
> -          for d in dirs:
> -              dir =3D os.path.join(root, d)
> -              #bb.note("rmdir -p %s" % dir)
> -              subprocess.call("rmdir -p %s 2>/dev/null" % dir, shell=3DT=
rue)
> -
> -       # Also remove debugsrcdir if its empty
> -       for p in nosuchdir[::-1]:
> -           if os.path.exists(p) and not os.listdir(p):
> -               os.rmdir(p)
> +        dvar =3D d.getVar('PKGD', True)
> +        pathprefix =3D "export PATH=3D%s; " % d.getVar('PATH', True)
> +        strip =3D d.getVar("STRIP", True)
> +        objcopy =3D d.getVar("OBJCOPY", True)
> +        debugedit =3D d.expand("${STAGING_LIBDIR_NATIVE}/rpm/bin/debuged=
it")
> +        workdir =3D d.getVar("WORKDIR", True)
> +        workparentdir =3D os.path.dirname(workdir)
> +        workbasedir =3D os.path.basename(workdir)
> +
> +        nosuchdir =3D []
> +        basepath =3D dvar
> +        for p in debugsrcdir.split("/"):
> +            basepath =3D basepath + "/" + p
> +            if not os.path.exists(basepath):
> +                nosuchdir.append(basepath)
> +        bb.mkdirhier(basepath)
> +
> +        processdebugsrc =3D  "LC_ALL=3DC ; sort -z -u '%s' | egrep -v -z=
 '(<internal>|<built-in>)$' | "
> +        # We need to ignore files that are not actually ours
> +        # we do this by only paying attention to items from this package
> +        processdebugsrc +=3D "fgrep -z '%s' | "
> +        processdebugsrc +=3D "(cd '%s' ; cpio -pd0mL --no-preserve-owner=
 '%s%s' 2>/dev/null)"
> +
> +        subprocess.call(processdebugsrc % (sourcefile, workbasedir, work=
parentdir, dvar, debugsrcdir), shell=3DTrue)
> +
> +        # The copy by cpio may have resulted in some empty directories! =
 Remove these
> +        for root, dirs, files in os.walk("%s%s" % (dvar, debugsrcdir)):
> +            for d in dirs:
> +                dir =3D os.path.join(root, d)
> +                #bb.note("rmdir -p %s" % dir)
> +                subprocess.call("rmdir -p %s 2>/dev/null" % dir, shell=
=3DTrue)
> +
> +        # Also remove debugsrcdir if its empty
> +        for p in nosuchdir[::-1]:
> +            if os.path.exists(p) and not os.listdir(p):
> +                os.rmdir(p)
> =20
>  def runstrip(file, elftype, d):
>      # Function to strip a single file, called from split_and_strip_files=
 below
> @@ -735,7 +735,7 @@ python split_and_strip_files () {
>      file_list =3D {}
>      file_links =3D {}
>      if (d.getVar('INHIBIT_PACKAGE_DEBUG_SPLIT', True) !=3D '1') and \
> -       (d.getVar('INHIBIT_PACKAGE_STRIP', True) !=3D '1'):
> +            (d.getVar('INHIBIT_PACKAGE_STRIP', True) !=3D '1'):
>          for root, dirs, files in os.walk(dvar):
>              for f in files:
>                  file =3D os.path.join(root, f)
> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.=
bbclass
> index a297a1f..e94586e 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -172,23 +172,23 @@ package_install_internal_ipk() {
>  }
> =20
>  ipk_log_check() {
> -       target=3D"$1"
> -       lf_path=3D"$2"
> -
> -       lf_txt=3D"`cat $lf_path`"
> -       for keyword_die in "exit 1" "Collected errors" ERR Fail
> -       do
> -               if (echo "$lf_txt" | grep -v log_check | grep "$keyword_d=
ie") >/dev/null 2>&1
> -               then
> -                       echo "log_check: There were error messages in the=
 logfile"
> -                       echo -e "log_check: Matched keyword: [$keyword_di=
e]\n"
> -                       echo "$lf_txt" | grep -v log_check | grep -C 5 -i=
 "$keyword_die"
> -                       echo ""
> -                       do_exit=3D1
> -               fi
> -       done
> -       test "$do_exit" =3D 1 && exit 1
> -       true
> +	target=3D"$1"
> +	lf_path=3D"$2"
> +
> +	lf_txt=3D"`cat $lf_path`"
> +	for keyword_die in "exit 1" "Collected errors" ERR Fail
> +	do
> +		if (echo "$lf_txt" | grep -v log_check | grep "$keyword_die") >/dev/nu=
ll 2>&1
> +		then
> +			echo "log_check: There were error messages in the logfile"
> +			echo -e "log_check: Matched keyword: [$keyword_die]\n"
> +			echo "$lf_txt" | grep -v log_check | grep -C 5 -i "$keyword_die"
> +			echo ""
> +			do_exit=3D1
> +		fi
> +	done
> +	test "$do_exit" =3D 1 && exit 1
> +	true
>  }

This ^^ isn't python as commit message suggest, the same for
utils.bbclass and package_rpm.bbclass change

Cheers,

> =20
>  #
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.=
bbclass
> index bfb346f..1266b5f 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -101,23 +101,23 @@ package_generate_rpm_conf_common() {
>  }
> =20
>  rpm_log_check() {
> -       target=3D"$1"
> -       lf_path=3D"$2"
> -
> -       lf_txt=3D"`cat $lf_path`"
> -       for keyword_die in "Cannot find package" "exit 1" ERR Fail
> -       do
> -               if (echo "$lf_txt" | grep -v log_check | grep "$keyword_d=
ie") >/dev/null 2>&1
> -               then
> -                       echo "log_check: There were error messages in the=
 logfile"
> -                       echo -e "log_check: Matched keyword: [$keyword_di=
e]\n"
> -                       echo "$lf_txt" | grep -v log_check | grep -C 5 -i=
 "$keyword_die"
> -                       echo ""
> -                       do_exit=3D1
> -               fi
> -       done
> -       test "$do_exit" =3D 1 && exit 1
> -       true
> +	target=3D"$1"
> +	lf_path=3D"$2"
> +
> +	lf_txt=3D"`cat $lf_path`"
> +	for keyword_die in "Cannot find package" "exit 1" ERR Fail
> +	do
> +		if (echo "$lf_txt" | grep -v log_check | grep "$keyword_die") >/dev/nu=
ll 2>&1
> +		then
> +			echo "log_check: There were error messages in the logfile"
> +			echo -e "log_check: Matched keyword: [$keyword_die]\n"
> +			echo "$lf_txt" | grep -v log_check | grep -C 5 -i "$keyword_die"
> +			echo ""
> +			do_exit=3D1
> +		fi
> +	done
> +	test "$do_exit" =3D 1 && exit 1
> +	true
>  }
> =20
> =20
> diff --git a/meta/classes/recipe_sanity.bbclass b/meta/classes/recipe_san=
ity.bbclass
> index 63e9e7f..c3bd0d2 100644
> --- a/meta/classes/recipe_sanity.bbclass
> +++ b/meta/classes/recipe_sanity.bbclass
> @@ -4,7 +4,7 @@ def __note(msg, d):
>  __recipe_sanity_badruntimevars =3D "RDEPENDS RPROVIDES RRECOMMENDS RCONF=
LICTS"
>  def bad_runtime_vars(cfgdata, d):
>      if bb.data.inherits_class("native", d) or \
> -       bb.data.inherits_class("cross", d):
> +            bb.data.inherits_class("cross", d):
>          return
> =20
>      for var in d.getVar("__recipe_sanity_badruntimevars", True).split():
> @@ -42,7 +42,7 @@ def var_renames_overwrite(cfgdata, d):
> =20
>  def incorrect_nonempty_PACKAGES(cfgdata, d):
>      if bb.data.inherits_class("native", d) or \
> -       bb.data.inherits_class("cross", d):
> +            bb.data.inherits_class("cross", d):
>          if d.getVar("PACKAGES", True):
>              return True
> =20
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 575ce15..1a0c232 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -280,10 +280,10 @@ def check_sanity_validmachine(sanity_data):
>              tunefound =3D True
> =20
>      if len(dups):
> -       messages =3D messages + "Error, the PACKAGE_ARCHS variable contai=
ns duplicates. The following archs are listed more than once: %s" % " ".joi=
n(dups)
> +        messages =3D messages + "Error, the PACKAGE_ARCHS variable conta=
ins duplicates. The following archs are listed more than once: %s" % " ".jo=
in(dups)
> =20
>      if tunefound =3D=3D False:
> -       messages =3D messages + "Error, the PACKAGE_ARCHS variable does n=
ot contain TUNE_PKGARCH (%s)." % tunepkg
> +        messages =3D messages + "Error, the PACKAGE_ARCHS variable does =
not contain TUNE_PKGARCH (%s)." % tunepkg
> =20
>      return messages
> =20
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index e87f3c0..6762e32 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -174,7 +174,7 @@ def sstate_installpkg(ss, d):
>      sstatepkg =3D d.getVar('SSTATE_PKG', True) + '_' + ss['name'] + ".tg=
z"
> =20
>      if not os.path.exists(sstatepkg):
> -       pstaging_fetch(sstatefetch, sstatepkg, d)
> +        pstaging_fetch(sstatefetch, sstatepkg, d)
> =20
>      if not os.path.isfile(sstatepkg):
>          bb.note("Staging package %s does not exist" % sstatepkg)
> @@ -259,10 +259,10 @@ def sstate_clean_manifest(manifest, d):
>          # so we ignore errors here.
>          try:
>              if entry.endswith("/"):
> -               if os.path.islink(entry[:-1]):
> -                  os.remove(entry[:-1])
> -               elif os.path.exists(entry) and len(os.listdir(entry)) =3D=
=3D 0:
> -                  os.rmdir(entry[:-1])
> +                if os.path.islink(entry[:-1]):
> +                    os.remove(entry[:-1])
> +                elif os.path.exists(entry) and len(os.listdir(entry)) =
=3D=3D 0:
> +                    os.rmdir(entry[:-1])
>              else:
>                  oe.path.remove(entry)
>          except OSError:
> @@ -314,14 +314,14 @@ python sstate_cleanall() {
> =20
>      for manifest in (os.listdir(manifest_dir)):
>          if fnmatch.fnmatch(manifest, manifest_pattern):
> -             name =3D manifest.replace(manifest_pattern[:-1], "")
> -             namemap =3D d.getVar('SSTATETASKNAMES', True).split()
> -             tasks =3D d.getVar('SSTATETASKS', True).split()
> -             if name not in namemap:
> -                  continue
> -             taskname =3D tasks[namemap.index(name)]
> -             shared_state =3D sstate_state_fromvars(d, taskname[3:])
> -             sstate_clean(shared_state, d)
> +            name =3D manifest.replace(manifest_pattern[:-1], "")
> +            namemap =3D d.getVar('SSTATETASKNAMES', True).split()
> +            tasks =3D d.getVar('SSTATETASKS', True).split()
> +            if name not in namemap:
> +                continue
> +            taskname =3D tasks[namemap.index(name)]
> +            shared_state =3D sstate_state_fromvars(d, taskname[3:])
> +            sstate_clean(shared_state, d)
>  }
> =20
>  def sstate_hardcode_path(d):
> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
> index eda415e..8b3dcb4 100644
> --- a/meta/classes/staging.bbclass
> +++ b/meta/classes/staging.bbclass
> @@ -70,8 +70,8 @@ SYSROOT_LOCK =3D "${STAGING_DIR}/staging.lock"
> =20
>  # We clean out any existing sstate from the sysroot if we rerun configure
>  python sysroot_cleansstate () {
> -     ss =3D sstate_state_fromvars(d, "populate_sysroot")
> -     sstate_clean(ss, d)
> +    ss =3D sstate_state_fromvars(d, "populate_sysroot")
> +    sstate_clean(ss, d)
>  }
>  do_configure[prefuncs] +=3D "sysroot_cleansstate"
> =20
> diff --git a/meta/classes/tinderclient.bbclass b/meta/classes/tinderclien=
t.bbclass
> index e57bc48..6984efd 100644
> --- a/meta/classes/tinderclient.bbclass
> +++ b/meta/classes/tinderclient.bbclass
> @@ -2,20 +2,20 @@ def tinder_http_post(server, selector, content_type, bo=
dy):
>      import httplib
>      # now post it
>      for i in range(0,5):
> -       try:
> -           h =3D httplib.HTTP(server)
> -           h.putrequest('POST', selector)
> -           h.putheader('content-type', content_type)
> -           h.putheader('content-length', str(len(body)))
> -           h.endheaders()
> -           h.send(body)
> -           errcode, errmsg, headers =3D h.getreply()
> -           #print errcode, errmsg, headers
> -           return (errcode,errmsg, headers, h.file)
> -       except:
> -           print "Error sending the report!"
> -           # try again
> -           pass
> +        try:
> +            h =3D httplib.HTTP(server)
> +            h.putrequest('POST', selector)
> +            h.putheader('content-type', content_type)
> +            h.putheader('content-length', str(len(body)))
> +            h.endheaders()
> +            h.send(body)
> +            errcode, errmsg, headers =3D h.getreply()
> +            #print errcode, errmsg, headers
> +            return (errcode,errmsg, headers, h.file)
> +        except:
> +            print "Error sending the report!"
> +            # try again
> +            pass
> =20
>      # return some garbage
>      return (-1, "unknown", "unknown", None)
> diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/upda=
te-alternatives.bbclass
> index 47215ad..4e1ff27 100644
> --- a/meta/classes/update-alternatives.bbclass
> +++ b/meta/classes/update-alternatives.bbclass
> @@ -150,22 +150,22 @@ def update_alternatives_after_parse(d):
>  UPDALTVARS  =3D "ALTERNATIVE ALTERNATIVE_LINK_NAME ALTERNATIVE_TARGET AL=
TERNATIVE_PRIORITY"
> =20
>  def gen_updatealternativesvardeps(d):
> -   pkgs =3D (d.getVar("PACKAGES", True) or "").split()
> -   vars =3D (d.getVar("UPDALTVARS", True) or "").split()
> -
> -   # First compute them for non_pkg versions
> -   for v in vars:
> -      for flag in (d.getVarFlags(v) or {}):
> -         if flag =3D=3D "doc" or flag =3D=3D "vardeps" or flag =3D=3D "v=
ardepsexp":
> -            continue
> -         d.appendVar('%s_VARDEPS' % (v), ' %s:%s' % (flag, d.getVarFlag(=
v, flag, False)))
> -
> -   for p in pkgs:
> -      for v in vars:
> -         for flag in (d.getVarFlags("%s_%s" % (v,p)) or {}):
> +    pkgs =3D (d.getVar("PACKAGES", True) or "").split()
> +    vars =3D (d.getVar("UPDALTVARS", True) or "").split()
> +
> +    # First compute them for non_pkg versions
> +    for v in vars:
> +        for flag in (d.getVarFlags(v) or {}):
>              if flag =3D=3D "doc" or flag =3D=3D "vardeps" or flag =3D=3D=
 "vardepsexp":
> -               continue
> -            d.appendVar('%s_VARDEPS_%s' % (v,p), ' %s:%s' % (flag, d.get=
VarFlag('%s_%s' % (v,p), flag, False)))
> +                continue
> +            d.appendVar('%s_VARDEPS' % (v), ' %s:%s' % (flag, d.getVarFl=
ag(v, flag, False)))
> +
> +    for p in pkgs:
> +        for v in vars:
> +            for flag in (d.getVarFlags("%s_%s" % (v,p)) or {}):
> +                if flag =3D=3D "doc" or flag =3D=3D "vardeps" or flag =
=3D=3D "vardepsexp":
> +                    continue
> +                d.appendVar('%s_VARDEPS_%s' % (v,p), ' %s:%s' % (flag, d=
=2EgetVarFlag('%s_%s' % (v,p), flag, False)))
> =20
>  python __anonymous() {
>      # deprecated stuff...
> @@ -176,18 +176,18 @@ python __anonymous() {
>  }
> =20
>  def gen_updatealternativesvars(d):
> -   ret =3D []
> -   pkgs =3D (d.getVar("PACKAGES", True) or "").split()
> -   vars =3D (d.getVar("UPDALTVARS", True) or "").split()
> -
> -   for v in vars:
> -      ret.append(v + "_VARDEPS")
> -
> -   for p in pkgs:
> -      for v in vars:
> -         ret.append(v + "_" + p)
> -         ret.append(v + "_VARDEPS_" + p)
> -   return " ".join(ret)
> +    ret =3D []
> +    pkgs =3D (d.getVar("PACKAGES", True) or "").split()
> +    vars =3D (d.getVar("UPDALTVARS", True) or "").split()
> +
> +    for v in vars:
> +        ret.append(v + "_VARDEPS")
> +
> +    for p in pkgs:
> +        for v in vars:
> +            ret.append(v + "_" + p)
> +            ret.append(v + "_VARDEPS_" + p)
> +    return " ".join(ret)
> =20
>  # First the deprecated items...
>  populate_packages[vardeps] +=3D "ALTERNATIVE_LINKS ALTERNATIVE_NAME ALTE=
RNATIVE_PATH"
> diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
> index 5740610..c47ad69 100644
> --- a/meta/classes/utils.bbclass
> +++ b/meta/classes/utils.bbclass
> @@ -246,49 +246,49 @@ oe_machinstall() {
>  }
> =20
>  create_cmdline_wrapper () {
> -   # Create a wrapper script
> -   #
> -   # These are useful to work around relocation issues, by setting envir=
onment
> -   # variables which point to paths in the filesystem.
> -   #
> -   # Usage: create_wrapper FILENAME [[VAR=3DVALUE]..]
> +	# Create a wrapper script
> +	#
> +	# These are useful to work around relocation issues, by setting environ=
ment
> +	# variables which point to paths in the filesystem.
> +	#
> +	# Usage: create_wrapper FILENAME [[VAR=3DVALUE]..]
> =20
> -   cmd=3D$1
> -   shift
> +	cmd=3D$1
> +	shift
> =20
> -   echo "Generating wrapper script for $cmd"
> +	echo "Generating wrapper script for $cmd"
> =20
> -   mv $cmd $cmd.real
> -   cmdname=3D`basename $cmd`.real
> -   cat <<END >$cmd
> +	mv $cmd $cmd.real
> +	cmdname=3D`basename $cmd`.real
> +	cat <<END >$cmd
>  #!/bin/sh
>  realpath=3D\`readlink -fn \$0\`
>  exec \`dirname \$realpath\`/$cmdname $@ "\$@"
>  END
> -   chmod +x $cmd
> +	chmod +x $cmd
>  }
> =20
>  create_wrapper () {
> -   # Create a wrapper script
> -   #
> -   # These are useful to work around relocation issues, by setting envir=
onment
> -   # variables which point to paths in the filesystem.
> -   #
> -   # Usage: create_wrapper FILENAME [[VAR=3DVALUE]..]
> +	# Create a wrapper script
> +	#
> +	# These are useful to work around relocation issues, by setting environ=
ment
> +	# variables which point to paths in the filesystem.
> +	#
> +	# Usage: create_wrapper FILENAME [[VAR=3DVALUE]..]
> =20
> -   cmd=3D$1
> -   shift
> +	cmd=3D$1
> +	shift
> =20
> -   echo "Generating wrapper script for $cmd"
> +	echo "Generating wrapper script for $cmd"
> =20
> -   mv $cmd $cmd.real
> -   cmdname=3D`basename $cmd`.real
> -   cat <<END >$cmd
> +	mv $cmd $cmd.real
> +	cmdname=3D`basename $cmd`.real
> +	cat <<END >$cmd
>  #!/bin/sh
>  realpath=3D\`readlink -fn \$0\`
>  exec env $@ \`dirname \$realpath\`/$cmdname "\$@"
>  END
> -   chmod +x $cmd
> +	chmod +x $cmd
>  }
> =20
>  def check_app_exists(app, d):
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qFgkTsE6LiHkLPZw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAyf3cACgkQN1Ujt2V2gBxVrgCZAZEf/2BnSu0oSrKRjxVTq+ME
2KsAn0LbD/tGJ25xmSCJAaZOH+OjQxPp
=oUm7
-----END PGP SIGNATURE-----

--qFgkTsE6LiHkLPZw--
