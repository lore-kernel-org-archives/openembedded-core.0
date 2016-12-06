Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3384271A6D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 17:27:08 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id n204so386933844qke.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 09:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vitjmhPfPv7X/BzSs3cYIUcXVWIN4xp0kO88pc0gddI=;
	b=0bTpsZVDi0UTjO6VVfTk+HY/9r9bDPcQKYYPemRf5i3azq5mTdNiCYCFJfJwZFWtid
	bv9KFXqFRiVsFP/XGYOoOlIBPhEo7BDLnvDNYwV5SqtVZEMRDN3fTImTO6Tb6XXrHb8n
	rB7Ixk/rUVZU3TFSkTalh1NNnS1zgoR1BI6lAhA+JmvxGHMG1Zbj6W/A3XZHUgGbxJiU
	/y32SNNeWxFgbmZRiBcRN733tv4O/LtCKPE4CYsc8u98IyVtRZJ+eKbrusaMhC+HZKgr
	l4pGnDCIdzSuWRWJODOfT4APd5adBXQ01YUuOU9CzfNIAo8m3tESEB/C7Qzgk++uOt1S
	iGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vitjmhPfPv7X/BzSs3cYIUcXVWIN4xp0kO88pc0gddI=;
	b=Qg3pEBOFiILDvymI/mLDGjHBS3c9NYe67ffYmIN/wDJHiKlXe5dpeo9nK6VI/unHmB
	2rBcS7PERp0EH9g54d7xVNp/sYphzSv1dmQSj6EO7GkoDaauet0goZ9MPe8nMBSonsdw
	g0VN0535o2nWu8SQOAefjqCY6BErSBBRHD7BiKoM3N8bRTSt5fmjBJBGFC6MtZrX2Yn/
	rZxDFKwKdbFnVUeW5+XlOlnzMwKg6a2u66Itfrd18S8ZWaI8A6m9tJ52ZBLFPV49zpjq
	OUVgi7+i9NNFCtqAUW+kvbp2WW9wJFIsIq7O2o6pspXZLGV8KCMeDPKjNVT6Oq1i5X2n
	XdOw==
X-Gm-Message-State: AKaTC017Aqiq8eJGw0bChKj5XQJLU7DHMn0pKtf2zsFC3e9BXvs+YtWv1ezNATm8o5SSKAR6NLAegVx3uw0eg+rJ
X-Received: by 10.55.75.17 with SMTP id y17mr47871730qka.26.1481045230344;
	Tue, 06 Dec 2016 09:27:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 6 Dec 2016 09:26:49 -0800 (PST)
In-Reply-To: <1481024991-5882-21-git-send-email-obi@opendreambox.org>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
	<1481024991-5882-21-git-send-email-obi@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Dec 2016 17:26:49 +0000
Message-ID: <CAJTo0Lbx_TKJgWRnYGHHAja2uT8CNG+d=wyFJ-aBiZJ3zmWyFg@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 20/33] package_manager/deb: let apt-get handle postinst scripts
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
X-List-Received-Date: Tue, 06 Dec 2016 17:27:09 -0000
Content-Type: multipart/alternative; boundary=001a114a88c8d9f22b054300b6ad

--001a114a88c8d9f22b054300b6ad
Content-Type: text/plain; charset=UTF-8

Can you elaborate on why the old code can be deleted?

Ross

On 6 December 2016 at 11:49, Andreas Oberritter <obi@opendreambox.org>
wrote:

> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta/lib/oe/package_manager.py | 86 ++++--------------------------
> ------------
>  meta/lib/oe/rootfs.py          |  6 +--
>  2 files changed, 9 insertions(+), 83 deletions(-)
>
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.
> py
> index 4ef4f6d..12dff20 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -1959,84 +1959,6 @@ class DpkgPM(OpkgDpkgPM):
>
>          self.indexer = DpkgIndexer(self.d, self.deploy_dir)
>
> -    """
> -    This function will change a package's status in /var/lib/dpkg/status
> file.
> -    If 'packages' is None then the new_status will be applied to all
> -    packages
> -    """
> -    def mark_packages(self, status_tag, packages=None):
> -        status_file = self.target_rootfs + "/var/lib/dpkg/status"
> -
> -        with open(status_file, "r") as sf:
> -            with open(status_file + ".tmp", "w+") as tmp_sf:
> -                if packages is None:
> -                    tmp_sf.write(re.sub(r"Package:
> (.*?)\n((?:[^\n]+\n)*?)Status: (.*)(?:unpacked|installed)",
> -                                        r"Package: \1\n\2Status: \3%s" %
> status_tag,
> -                                        sf.read()))
> -                else:
> -                    if type(packages).__name__ != "list":
> -                        raise TypeError("'packages' should be a list
> object")
> -
> -                    status = sf.read()
> -                    for pkg in packages:
> -                        status = re.sub(r"Package:
> %s\n((?:[^\n]+\n)*?)Status: (.*)(?:unpacked|installed)" % pkg,
> -                                        r"Package: %s\n\1Status: \2%s" %
> (pkg, status_tag),
> -                                        status)
> -
> -                    tmp_sf.write(status)
> -
> -        os.rename(status_file + ".tmp", status_file)
> -
> -    """
> -    Run the pre/post installs for package "package_name". If package_name
> is
> -    None, then run all pre/post install scriptlets.
> -    """
> -    def run_pre_post_installs(self, package_name=None):
> -        info_dir = self.target_rootfs + "/var/lib/dpkg/info"
> -        ControlScript = collections.namedtuple("ControlScript",
> ["suffix", "name", "argument"])
> -        control_scripts = [
> -                ControlScript(".preinst", "Preinstall", "install"),
> -                ControlScript(".postinst", "Postinstall", "configure")]
> -        status_file = self.target_rootfs + "/var/lib/dpkg/status"
> -        installed_pkgs = []
> -
> -        with open(status_file, "r") as status:
> -            for line in status.read().split('\n'):
> -                m = re.match("^Package: (.*)", line)
> -                if m is not None:
> -                    installed_pkgs.append(m.group(1))
> -
> -        if package_name is not None and not package_name in
> installed_pkgs:
> -            return
> -
> -        os.environ['D'] = self.target_rootfs
> -        os.environ['OFFLINE_ROOT'] = self.target_rootfs
> -        os.environ['IPKG_OFFLINE_ROOT'] = self.target_rootfs
> -        os.environ['OPKG_OFFLINE_ROOT'] = self.target_rootfs
> -        os.environ['INTERCEPT_DIR'] = os.path.join(self.d.getVar('WORKDIR',
> True),
> -                                                   "intercept_scripts")
> -        os.environ['NATIVE_ROOT'] = self.d.getVar('STAGING_DIR_NATIVE',
> True)
> -
> -        failed_pkgs = []
> -        for pkg_name in installed_pkgs:
> -            for control_script in control_scripts:
> -                p_full = os.path.join(info_dir, pkg_name +
> control_script.suffix)
> -                if os.path.exists(p_full):
> -                    try:
> -                        bb.note("Executing %s for package: %s ..." %
> -                                 (control_script.name.lower(), pkg_name))
> -                        subprocess.check_output([p_full,
> control_script.argument],
> -                                stderr=subprocess.STDOUT)
> -                    except subprocess.CalledProcessError as e:
> -                        bb.note("%s for package %s failed with %d:\n%s" %
> -                                (control_script.name, pkg_name,
> e.returncode,
> -                                    e.output.decode("utf-8")))
> -                        failed_pkgs.append(pkg_name)
> -                        break
> -
> -        if len(failed_pkgs):
> -            self.mark_packages("unpacked", failed_pkgs)
> -
>      def update(self):
>          os.environ['APT_CONFIG'] = self.apt_conf_file
>
> @@ -2058,6 +1980,14 @@ class DpkgPM(OpkgDpkgPM):
>
>          os.environ['APT_CONFIG'] = self.apt_conf_file
>
> +        os.environ['D'] = self.target_rootfs
> +        os.environ['OFFLINE_ROOT'] = self.target_rootfs
> +        os.environ['IPKG_OFFLINE_ROOT'] = self.target_rootfs
> +        os.environ['OPKG_OFFLINE_ROOT'] = self.target_rootfs
> +        os.environ['INTERCEPT_DIR'] = os.path.join(self.d.getVar('WORKDIR',
> True),
> +                                                   "intercept_scripts")
> +        os.environ['NATIVE_ROOT'] = self.d.getVar('STAGING_DIR_NATIVE',
> True)
> +
>          cmd = "%s %s install --force-yes --allow-unauthenticated %s" % \
>                (self.apt_get_cmd, self.apt_args, ' '.join(pkgs))
>
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index a348b97..4c82456 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -685,10 +685,6 @@ class DpkgRootfs(DpkgOpkgRootfs):
>
>          self.pm.fix_broken_dependencies()
>
> -        self.pm.mark_packages("installed")
> -
> -        self.pm.run_pre_post_installs()
> -
>          execute_pre_post_process(self.d, deb_post_process_cmds)
>
>          if self.progress_reporter:
> @@ -708,7 +704,7 @@ class DpkgRootfs(DpkgOpkgRootfs):
>          return self._save_postinsts_common(dst_postinst_dir,
> src_postinst_dir)
>
>      def _handle_intercept_failure(self, registered_pkgs):
> -        self.pm.mark_packages("unpacked", registered_pkgs.split())
> +        pass
>
>      def _log_check(self):
>          self._log_check_warn()
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114a88c8d9f22b054300b6ad
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can you elaborate on why the old code can be deleted?<div>=
<br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D=
"gmail_quote">On 6 December 2016 at 11:49, Andreas Oberritter <span dir=3D"=
ltr">&lt;<a href=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@open=
dreambox.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed=
-off-by: Andreas Oberritter &lt;<a href=3D"mailto:obi@opendreambox.org">obi=
@opendreambox.org</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/package_manager.py | 86 ++++--------------------------<wb=
r>------------<br>
=C2=A0meta/lib/oe/rootfs.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +--=
<br>
=C2=A02 files changed, 9 insertions(+), 83 deletions(-)<br>
<br>
diff --git a/meta/lib/oe/package_manager.<wbr>py b/meta/lib/oe/package_mana=
ger.<wbr>py<br>
index 4ef4f6d..12dff20 100644<br>
--- a/meta/lib/oe/package_manager.<wbr>py<br>
+++ b/meta/lib/oe/package_manager.<wbr>py<br>
@@ -1959,84 +1959,6 @@ class DpkgPM(OpkgDpkgPM):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.indexer =3D DpkgIndexer(self.d, self=
.deploy_dir)<br>
<br>
-=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 This function will change a package&#39;s status in /var/lib=
/dpkg/status file.<br>
-=C2=A0 =C2=A0 If &#39;packages&#39; is None then the new_status will be ap=
plied to all<br>
-=C2=A0 =C2=A0 packages<br>
-=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 def mark_packages(self, status_tag, packages=3DNone):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 status_file =3D self.target_rootfs + &quot;/va=
r/lib/dpkg/status&quot;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(status_file, &quot;r&quot;) as sf:<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(status_file + &quot;.t=
mp&quot;, &quot;w+&quot;) as tmp_sf:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if packages is Non=
e:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp_=
sf.write(re.sub(r&quot;Package: (.*?)\n((?:[^\n]+\n)*?)Status: (.*)(?:unpac=
ked|installed)&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r&quot;P=
ackage: \1\n\2Status: \3%s&quot; % status_tag,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sf.read(=
)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if t=
ype(packages).__name__ !=3D &quot;list&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 raise TypeError(&quot;&#39;packages&#39; should be a list object=
&quot;)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stat=
us =3D sf.read()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for =
pkg in packages:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 status =3D re.sub(r&quot;Package: %s\n((?:[^\n]+\n)*?)Status: (.=
*)(?:unpacked|installed)&quot; % pkg,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r&quot;P=
ackage: %s\n\1Status: \2%s&quot; % (pkg, status_tag),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status)<=
br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp_=
sf.write(status)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.rename(status_file + &quot;.tmp&quot;, stat=
us_file)<br>
-<br>
-=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 Run the pre/post installs for package &quot;package_name&quo=
t;. If package_name is<br>
-=C2=A0 =C2=A0 None, then run all pre/post install scriptlets.<br>
-=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 def run_pre_post_installs(self, package_name=3DNone):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 info_dir =3D self.target_rootfs + &quot;/var/l=
ib/dpkg/info&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ControlScript =3D collections.namedtuple(&quot=
;<wbr>ControlScript&quot;, [&quot;suffix&quot;, &quot;name&quot;, &quot;arg=
ument&quot;])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 control_scripts =3D [<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ControlScript(&quo=
t;.preinst&quot;, &quot;Preinstall&quot;, &quot;install&quot;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ControlScript(&quo=
t;.postinst&quot;, &quot;Postinstall&quot;, &quot;configure&quot;)]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 status_file =3D self.target_rootfs + &quot;/va=
r/lib/dpkg/status&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 installed_pkgs =3D []<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(status_file, &quot;r&quot;) as statu=
s:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in status.read().split(=
&#39;\n&#39;):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m =3D re.match(&qu=
ot;^Package: (.*)&quot;, line)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if m is not None:<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inst=
alled_pkgs.append(m.group(<wbr>1))<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if package_name is not None and not package_na=
me in installed_pkgs:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.environ[&#39;D&#39;] =3D self.target_rootfs=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.environ[&#39;OFFLINE_ROOT&#39;] =3D self.ta=
rget_rootfs<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.environ[&#39;IPKG_OFFLINE_ROOT&#39;<wbr>] =
=3D self.target_rootfs<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.environ[&#39;OPKG_OFFLINE_ROOT&#39;<wbr>] =
=3D self.target_rootfs<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.environ[&#39;INTERCEPT_DIR&#39;] =3D os.pat=
h.join(self.d.getVar(&#39;<wbr>WORKDIR&#39;, True),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;intercept_scripts&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.environ[&#39;NATIVE_ROOT&#39;] =3D self.d.g=
etVar(&#39;STAGING_DIR_<wbr>NATIVE&#39;, True)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 failed_pkgs =3D []<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for pkg_name in installed_pkgs:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for control_script in control_sc=
ripts:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p_full =3D os.path=
.join(info_dir, pkg_name + control_script.suffix)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(=
p_full):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bb.note(&quot;Executing %s for package: %s ...&quot; %<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(control_script.name.lower(), =
pkg_name))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 subprocess.check_output([p_<wbr>full, control_script.argument],<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stderr=3Dsubprocess.STDOUT)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exce=
pt subprocess.CalledProcessError as e:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bb.note(&quot;%s for package %s failed with %d:\n%s&quot; %<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (<a href=3D"http://control_script.na=
me" rel=3D"noreferrer" target=3D"_blank">control_script.name</a>, pkg_name,=
 e.returncode,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e.output.decode(&quot;=
utf-8&quot;)))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 failed_pkgs.append(pkg_name)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(failed_pkgs):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.mark_packages(&quot;unpacke=
d&quot;, failed_pkgs)<br>
-<br>
=C2=A0 =C2=A0 =C2=A0def update(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.environ[&#39;APT_CONFIG&#39;] =3D self=
.apt_conf_file<br>
<br>
@@ -2058,6 +1980,14 @@ class DpkgPM(OpkgDpkgPM):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.environ[&#39;APT_CONFIG&#39;] =3D self=
.apt_conf_file<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.environ[&#39;D&#39;] =3D self.target_rootfs=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.environ[&#39;OFFLINE_ROOT&#39;] =3D self.ta=
rget_rootfs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.environ[&#39;IPKG_OFFLINE_ROOT&#39;<wbr>] =
=3D self.target_rootfs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.environ[&#39;OPKG_OFFLINE_ROOT&#39;<wbr>] =
=3D self.target_rootfs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.environ[&#39;INTERCEPT_DIR&#39;] =3D os.pat=
h.join(self.d.getVar(&#39;<wbr>WORKDIR&#39;, True),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;intercept_scripts&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.environ[&#39;NATIVE_ROOT&#39;] =3D self.d.g=
etVar(&#39;STAGING_DIR_<wbr>NATIVE&#39;, True)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D &quot;%s %s install --force-yes -=
-allow-unauthenticated %s&quot; % \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(self.apt_get_cmd, s=
elf.apt_args, &#39; &#39;.join(pkgs))<br>
<br>
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py<br>
index a348b97..4c82456 100644<br>
--- a/meta/lib/oe/rootfs.py<br>
+++ b/meta/lib/oe/rootfs.py<br>
@@ -685,10 +685,6 @@ class DpkgRootfs(DpkgOpkgRootfs):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.pm.fix_broken_<wbr>dependencies()<br=
>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.pm.mark_packages(&quot;<wbr>installed&quo=
t;)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.pm.run_pre_post_installs(<wbr>)<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0execute_pre_post_process(self.<wbr>d, deb=
_post_process_cmds)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.progress_reporter:<br>
@@ -708,7 +704,7 @@ class DpkgRootfs(DpkgOpkgRootfs):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return self._save_postinsts_common(<wbr>d=
st_postinst_dir, src_postinst_dir)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def _handle_intercept_failure(<wbr>self, registered_pkg=
s):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.pm.mark_packages(&quot;<wbr>unpacked&quot=
;, registered_pkgs.split())<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
<br>
=C2=A0 =C2=A0 =C2=A0def _log_check(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._log_check_warn()<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a114a88c8d9f22b054300b6ad--
