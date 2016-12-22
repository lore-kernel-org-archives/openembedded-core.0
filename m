Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id BC46077543
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 09:36:46 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id u25so97596640qki.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 01:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gKlGVVr4VvOpyw5ATwfWooghGNYPpDUoPu6mEnBz3hY=;
	b=Xzdl4ztf3fe1a6QvtGmGG3Fb01EjhifpzlY5318tijrzxO31O/9Mm4B/98xfyeLZwb
	OacoiI4xI7CXTz0fLPbvn79btOLCnfTV6hLGYiVxeV06K3ndbKuGkLgjM/7jidTorVRm
	wKRImPJ7Emm+CDvdqBkSxNyqYsPoPbk+2pzSew4/KlR0Y0icmcxLLO6HXpaV/eXzloIO
	bttdmanhU6W0UmZY56FSCmuJ3Eo/QRpC945HCsscuDTFEgTbzmJRYBFnUYq5NA6HsEPu
	gbArz1CwLjBkmU4YVn7/kQiYzvYKB2oTt1sM5kuBosfuyc52sKNQRNJPeuVTtEAg0lk8
	swSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gKlGVVr4VvOpyw5ATwfWooghGNYPpDUoPu6mEnBz3hY=;
	b=LbXjQuWnqMZ87UY7hfxb+kntNIFgOi126urQjQam1bCpYUtVfdu1rVevLTah9sH0mu
	bKv74rL4yTJKVd+0DFYP1pbJiE0VyBY08sj0W539jo69Fb/Z/rv4W2Mup/DYuZIHzzhc
	01//3twLV3oysJjMkKbQ75PfPhdoFQA4/cbEaUc5UMBGlCPWLLuhh9cZrzbLh4T109vj
	MQgMp7qlJsNTng3mVUj7sMl2jIWwp2AC/OFO/AA1reliHuhLzZp6D0Yv9eVlWehx935j
	Gh12+fb4SiiBhIPm2u2vhhTaza+r0JoPmoXFg98Cws3zICvLkA/ha23XDlMvaZKslh++
	M2BA==
X-Gm-Message-State: AIkVDXJldy6u8T3W2Rs84Gzi+RHhWzJYIX0X2zEephtUgsZvmQpBZVv3ZV+iP0WlHaI2sI8G61pJdlqCcWGCINh2
X-Received: by 10.55.64.79 with SMTP id n76mr9134715qka.178.1482399407843;
	Thu, 22 Dec 2016 01:36:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.237.34.74 with HTTP; Thu, 22 Dec 2016 01:36:17 -0800 (PST)
In-Reply-To: <4e33a8311af3ea53162e3c9a8ed0848b4a8250cc.1482294710.git.Qi.Chen@windriver.com>
References: <cover.1482294710.git.Qi.Chen@windriver.com>
	<4e33a8311af3ea53162e3c9a8ed0848b4a8250cc.1482294710.git.Qi.Chen@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 22 Dec 2016 11:36:17 +0200
Message-ID: <CAHiDW_HLYXEMEsF1ukFgOSZ+NFXJ2j09Pmo9Ty+7mW9pJrZVTA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] package_manager: default to have scriptlet output captured in log
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
X-List-Received-Date: Thu, 22 Dec 2016 09:36:48 -0000
Content-Type: multipart/alternative; boundary=001a1148bb6c1ec1df05443c027f

--001a1148bb6c1ec1df05443c027f
Content-Type: text/plain; charset=UTF-8

On 21 December 2016 at 06:32, Chen Qi <Qi.Chen@windriver.com> wrote:
>
> We need to have scriptlet output captured in log. If we don't do so,
> some useful information from scriptlets (especially postinstall script)
> would be missing. In case a script has a warning message but it does not
> necessarily have to fail, the message should be captured.
>
> Opkg has already done that. Change for rpm and dpkg so that scriptlet
> output is captured and no warning message is missing.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/lib/oe/package_manager.py | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/meta/lib/oe/package_manager.py
b/meta/lib/oe/package_manager.py
> index e557473..6892106 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -669,11 +669,11 @@ class RpmPM(PackageManager):
>          self.install_dir_path = os.path.join(self.target_rootfs,
self.install_dir_name)
>          self.rpm_cmd = bb.utils.which(os.getenv('PATH'), "rpm")
>          self.smart_cmd = bb.utils.which(os.getenv('PATH'), "smart")
> -        # 0 = default, only warnings
> -        # 1 = --log-level=info (includes information about executing
scriptlets and their output)
> +        # 0 = --log-level=warning, only warnings
> +        # 1 = --log-level=info (includes information about executing
scriptlets and their output), default
>          # 2 = --log-level=debug
>          # 3 = --log-level=debug plus dumps of scriplet content and
command invocation
> -        self.debug_level = int(d.getVar('ROOTFS_RPM_DEBUG') or "0")
> +        self.debug_level = int(d.getVar('ROOTFS_RPM_DEBUG') or "1")
>          self.smart_opt = ["--log-level=%s" %
>                           ("warning" if self.debug_level == 0 else
>                            "info" if self.debug_level == 1 else
> @@ -2025,7 +2025,8 @@ class DpkgPM(OpkgDpkgPM):
>                          bb.note("Executing %s for package: %s ..." %
>                                   (control_script.name.lower(), pkg_name))
>                          subprocess.check_output([p_full,
control_script.argument],
> -                                stderr=subprocess.STDOUT)
> +                                stderr=subprocess.STDOUT).decode("utf-8")
> +                        bb.note(output)


This patch seems likely to be the reason for this autobuilder failure:
https://autobuilder.yoctoproject.org/main/builders/nightly-deb-non-deb/builds/669/steps/BuildImages/logs/stdio

---
ERROR: core-image-sato-sdk-1.0-r0 do_rootfs: Error executing a python
function in exec_python_func() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:do_rootfs(d)
     0003:
File:
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/classes/image.bbclass',
lineno: 266, function: do_rootfs
     0262:
     0263:    progress_reporter.next_stage()
     0264:
     0265:    # generate rootfs
 *** 0266:    create_rootfs(d, progress_reporter=progress_reporter,
logcatcher=logcatcher)
     0267:
     0268:    progress_reporter.finish()
     0269:}
     0270:do_rootfs[dirs] = "${TOPDIR}"
File:
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/lib/oe/rootfs.py',
lineno: 1009, function: create_rootfs
     1005:        RpmRootfs(d, manifest_dir, progress_reporter,
logcatcher).create()
     1006:    elif img_type == "ipk":
     1007:        OpkgRootfs(d, manifest_dir, progress_reporter,
logcatcher).create()
     1008:    elif img_type == "deb":
 *** 1009:        DpkgRootfs(d, manifest_dir, progress_reporter,
logcatcher).create()
     1010:
     1011:    os.environ.clear()
     1012:    os.environ.update(env_bkp)
     1013:
File:
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/lib/oe/rootfs.py',
lineno: 202, function: create
     0198:        if self.progress_reporter:
     0199:            self.progress_reporter.next_stage()
     0200:
     0201:        # call the package manager dependent create method
 *** 0202:        self._create()
     0203:
     0204:        sysconfdir = self.image_rootfs +
self.d.getVar('sysconfdir')
     0205:        bb.utils.mkdirhier(sysconfdir)
     0206:        with open(sysconfdir + "/version", "w+") as ver:
File:
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/lib/oe/rootfs.py',
lineno: 691, function: _create
     0687:        self.pm.fix_broken_dependencies()
     0688:
     0689:        self.pm.mark_packages("installed")
     0690:
 *** 0691:        self.pm.run_pre_post_installs()
     0692:
     0693:        execute_pre_post_process(self.d, deb_post_process_cmds)
     0694:
     0695:        if self.progress_reporter:
File:
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non-deb/build/meta/lib/oe/package_manager.py',
lineno: 2029, function: run_pre_post_installs
     2025:                        bb.note("Executing %s for package: %s
..." %
     2026:                                 (control_script.name.lower(),
pkg_name))
     2027:                        subprocess.check_output([p_full,
control_script.argument],
     2028:
 stderr=subprocess.STDOUT).decode("utf-8")
 *** 2029:                        bb.note(output)
     2030:                    except subprocess.CalledProcessError as e:
     2031:                        bb.note("%s for package %s failed with
%d:\n%s" %
     2032:                                (control_script.name, pkg_name,
e.returncode,
     2033:                                    e.output.decode("utf-8")))
Exception: NameError: name 'output' is not defined
---


Thanks,
  Jussi


>
>                      except subprocess.CalledProcessError as e:
>                          bb.note("%s for package %s failed with %d:\n%s" %
>                                  (control_script.name, pkg_name,
e.returncode,
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a1148bb6c1ec1df05443c027f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 21 December 2016 at 06:32, Chen Qi &lt;<a href=3D"mailt=
o:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt; wrote:<br>&gt;<br>&g=
t; We need to have scriptlet output captured in log. If we don&#39;t do so,=
<br>&gt; some useful information from scriptlets (especially postinstall sc=
ript)<br>&gt; would be missing. In case a script has a warning message but =
it does not<br>&gt; necessarily have to fail, the message should be capture=
d.<br>&gt;<br>&gt; Opkg has already done that. Change for rpm and dpkg so t=
hat scriptlet<br>&gt; output is captured and no warning message is missing.=
<br>&gt;<br>&gt; Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windr=
iver.com">Qi.Chen@windriver.com</a>&gt;<br>&gt; ---<br>&gt; =C2=A0meta/lib/=
oe/package_manager.py | 9 +++++----<br>&gt; =C2=A01 file changed, 5 inserti=
ons(+), 4 deletions(-)<br>&gt;<br>&gt; diff --git a/meta/lib/oe/package_man=
ager.py b/meta/lib/oe/package_manager.py<br>&gt; index e557473..6892106 100=
644<br>&gt; --- a/meta/lib/oe/package_manager.py<br>&gt; +++ b/meta/lib/oe/=
package_manager.py<br>&gt; @@ -669,11 +669,11 @@ class RpmPM(PackageManager=
):<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.install_dir_path =3D os.p=
ath.join(self.target_rootfs, self.install_dir_name)<br>&gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0self.rpm_cmd =3D bb.utils.which(os.getenv(&#39;PATH&#39=
;), &quot;rpm&quot;)<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.smart_c=
md =3D bb.utils.which(os.getenv(&#39;PATH&#39;), &quot;smart&quot;)<br>&gt;=
 - =C2=A0 =C2=A0 =C2=A0 =C2=A0# 0 =3D default, only warnings<br>&gt; - =C2=
=A0 =C2=A0 =C2=A0 =C2=A0# 1 =3D --log-level=3Dinfo (includes information ab=
out executing scriptlets and their output)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0# 0 =3D --log-level=3Dwarning, only warnings<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0# 1 =3D --log-level=3Dinfo (includes information about executi=
ng scriptlets and their output), default<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0# 2 =3D --log-level=3Ddebug<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0# 3 =3D --log-level=3Ddebug plus dumps of scriplet content and comman=
d invocation<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0self.debug_level =3D int(=
d.getVar(&#39;ROOTFS_RPM_DEBUG&#39;) or &quot;0&quot;)<br>&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0self.debug_level =3D int(d.getVar(&#39;ROOTFS_RPM_DEBUG&#3=
9;) or &quot;1&quot;)<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.smart_=
opt =3D [&quot;--log-level=3D%s&quot; %<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;warn=
ing&quot; if self.debug_level =3D=3D 0 else<br>&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;info&quot; if self.debug_level =3D=3D 1 else<br>&gt; @@ -2025,7 +2=
025,8 @@ class DpkgPM(OpkgDpkgPM):<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(&quot;Ex=
ecuting %s for package: %s ...&quot; %<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (control_script.name.lower(), pkg_name))<br>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0subprocess.check_output([p_full, control_script.argument],<br>&gt=
; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stderr=3Dsubprocess.STDOUT)<br>&gt=
; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stderr=3Dsubprocess.STDOUT).decode=
(&quot;utf-8&quot;)<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(output)<br><br><br>This patch=
 seems likely to be the reason for this autobuilder failure:<br><a href=3D"=
https://autobuilder.yoctoproject.org/main/builders/nightly-deb-non-deb/buil=
ds/669/steps/BuildImages/logs/stdio">https://autobuilder.yoctoproject.org/m=
ain/builders/nightly-deb-non-deb/builds/669/steps/BuildImages/logs/stdio</a=
><br><br>---<br>ERROR: core-image-sato-sdk-1.0-r0 do_rootfs: Error executin=
g a python function in exec_python_func() autogenerated:<br><br>The stack t=
race of python calls that resulted in this exception/failure was:<br>File: =
&#39;exec_python_func() autogenerated&#39;, lineno: 2, function: &lt;module=
&gt;<br>=C2=A0 =C2=A0 =C2=A00001:<br>=C2=A0*** 0002:do_rootfs(d)<br>=C2=A0 =
=C2=A0 =C2=A00003:<br>File: &#39;/home/pokybuild/yocto-autobuilder/yocto-wo=
rker/nightly-deb-non-deb/build/meta/classes/image.bbclass&#39;, lineno: 266=
, function: do_rootfs<br>=C2=A0 =C2=A0 =C2=A00262:<br>=C2=A0 =C2=A0 =C2=A00=
263: =C2=A0 =C2=A0progress_reporter.next_stage()<br>=C2=A0 =C2=A0 =C2=A0026=
4:<br>=C2=A0 =C2=A0 =C2=A00265: =C2=A0 =C2=A0# generate rootfs<br>=C2=A0***=
 0266: =C2=A0 =C2=A0create_rootfs(d, progress_reporter=3Dprogress_reporter,=
 logcatcher=3Dlogcatcher)<br>=C2=A0 =C2=A0 =C2=A00267:<br>=C2=A0 =C2=A0 =C2=
=A00268: =C2=A0 =C2=A0progress_reporter.finish()<br>=C2=A0 =C2=A0 =C2=A0026=
9:}<br>=C2=A0 =C2=A0 =C2=A00270:do_rootfs[dirs] =3D &quot;${TOPDIR}&quot;<b=
r>File: &#39;/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-deb-non=
-deb/build/meta/lib/oe/rootfs.py&#39;, lineno: 1009, function: create_rootf=
s<br>=C2=A0 =C2=A0 =C2=A01005: =C2=A0 =C2=A0 =C2=A0 =C2=A0RpmRootfs(d, mani=
fest_dir, progress_reporter, logcatcher).create()<br>=C2=A0 =C2=A0 =C2=A010=
06: =C2=A0 =C2=A0elif img_type =3D=3D &quot;ipk&quot;:<br>=C2=A0 =C2=A0 =C2=
=A01007: =C2=A0 =C2=A0 =C2=A0 =C2=A0OpkgRootfs(d, manifest_dir, progress_re=
porter, logcatcher).create()<br>=C2=A0 =C2=A0 =C2=A01008: =C2=A0 =C2=A0elif=
 img_type =3D=3D &quot;deb&quot;:<br>=C2=A0*** 1009: =C2=A0 =C2=A0 =C2=A0 =
=C2=A0DpkgRootfs(d, manifest_dir, progress_reporter, logcatcher).create()<b=
r>=C2=A0 =C2=A0 =C2=A01010:<br>=C2=A0 =C2=A0 =C2=A01011: =C2=A0 =C2=A0os.en=
viron.clear()<br>=C2=A0 =C2=A0 =C2=A01012: =C2=A0 =C2=A0os.environ.update(e=
nv_bkp)<br>=C2=A0 =C2=A0 =C2=A01013:<br>File: &#39;/home/pokybuild/yocto-au=
tobuilder/yocto-worker/nightly-deb-non-deb/build/meta/lib/oe/rootfs.py&#39;=
, lineno: 202, function: create<br>=C2=A0 =C2=A0 =C2=A00198: =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if self.progress_reporter:<br>=C2=A0 =C2=A0 =C2=A00199: =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.progress_reporter.next_stage()<br>=
=C2=A0 =C2=A0 =C2=A00200:<br>=C2=A0 =C2=A0 =C2=A00201: =C2=A0 =C2=A0 =C2=A0=
 =C2=A0# call the package manager dependent create method<br>=C2=A0*** 0202=
: =C2=A0 =C2=A0 =C2=A0 =C2=A0self._create()<br>=C2=A0 =C2=A0 =C2=A00203:<br=
>=C2=A0 =C2=A0 =C2=A00204: =C2=A0 =C2=A0 =C2=A0 =C2=A0sysconfdir =3D self.i=
mage_rootfs + self.d.getVar(&#39;sysconfdir&#39;)<br>=C2=A0 =C2=A0 =C2=A002=
05: =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(sysconfdir)<br>=C2=A0 =C2=
=A0 =C2=A00206: =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(sysconfdir + &quot;/ve=
rsion&quot;, &quot;w+&quot;) as ver:<br>File: &#39;/home/pokybuild/yocto-au=
tobuilder/yocto-worker/nightly-deb-non-deb/build/meta/lib/oe/rootfs.py&#39;=
, lineno: 691, function: _create<br>=C2=A0 =C2=A0 =C2=A00687: =C2=A0 =C2=A0=
 =C2=A0 =C2=A0self.pm.fix_broken_dependencies()<br>=C2=A0 =C2=A0 =C2=A00688=
:<br>=C2=A0 =C2=A0 =C2=A00689: =C2=A0 =C2=A0 =C2=A0 =C2=A0self.pm.mark_pack=
ages(&quot;installed&quot;)<br>=C2=A0 =C2=A0 =C2=A00690:<br>=C2=A0*** 0691:=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.pm.run_pre_post_installs()<br>=C2=A0 =C2=
=A0 =C2=A00692:<br>=C2=A0 =C2=A0 =C2=A00693: =C2=A0 =C2=A0 =C2=A0 =C2=A0exe=
cute_pre_post_process(self.d, deb_post_process_cmds)<br>=C2=A0 =C2=A0 =C2=
=A00694:<br>=C2=A0 =C2=A0 =C2=A00695: =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.pr=
ogress_reporter:<br>File: &#39;/home/pokybuild/yocto-autobuilder/yocto-work=
er/nightly-deb-non-deb/build/meta/lib/oe/package_manager.py&#39;, lineno: 2=
029, function: run_pre_post_installs<br>=C2=A0 =C2=A0 =C2=A02025: =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0bb.note(&quot;Executing %s for package: %s ...&quot; %<br>=C2=A0 =C2=A0 =
=C2=A02026: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (control_script.name.lower=
(), pkg_name))<br>=C2=A0 =C2=A0 =C2=A02027: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subprocess.check_output=
([p_full, control_script.argument],<br>=C2=A0 =C2=A0 =C2=A02028: =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0stderr=3Dsubprocess.STDOUT).decode(&quot;utf-8&q=
uot;)<br>=C2=A0*** 2029: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(output)<br>=C2=A0 =C2=A0 =C2=A020=
30: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ex=
cept subprocess.CalledProcessError as e:<br>=C2=A0 =C2=A0 =C2=A02031: =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0bb.note(&quot;%s for package %s failed with %d:\n%s&quot; %<br>=C2=A0=
 =C2=A0 =C2=A02032: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(<a href=3D"http://=
control_script.name">control_script.name</a>, pkg_name, e.returncode,<br>=
=C2=A0 =C2=A0 =C2=A02033: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0e.output.decode(&quot;utf-8&quot;)))<br>Exception: NameError: name &#39;=
output&#39; is not defined<br>---<br><br><div><br></div><div>Thanks,</div><=
div>=C2=A0 Jussi<br><br>=C2=A0<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except subprocess.CalledPro=
cessError as e:<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(&quot;%s for package %s fa=
iled with %d:\n%s&quot; %<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(<a href=3D"http://control_script.name">control_script.name</a>, pkg_nam=
e, e.returncode,<br>&gt; --<br>&gt; 1.9.1<br>&gt;<br>&gt; --<br>&gt; ______=
_________________________________________<br>&gt; Openembedded-core mailing=
 list<br>&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">O=
penembedded-core@lists.openembedded.org</a><br>&gt; <a href=3D"http://lists=
.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembe=
dded.org/mailman/listinfo/openembedded-core</a></div></div>

--001a1148bb6c1ec1df05443c027f--
