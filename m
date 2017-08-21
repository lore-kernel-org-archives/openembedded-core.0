Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 62DAD78356;
	Mon, 21 Aug 2017 09:00:42 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id l132so2065558vke.5;
	Mon, 21 Aug 2017 02:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kbHdrBGKac6mVCGYLZiQQ82HBzk6etON8it8YvTemqg=;
	b=lTaQgJ72dp2ztLMEqMQ5GjMPeBzWcH1JHf+pELE+gc01J5YeCMyEJShOfCzsYsjKgB
	q9bNkCzI5vJlfZ/tkzeqtjBb2Grgf4XTmkGZEpWiqQVlMHjq8b/BHRoCQYx++XEz5Ihg
	5hWP3YQp/cQMyblRFq9/aAYH7ho7cllll9TnXPJrB/ZBIB45mzwtGvO1mvnUAcFT/ION
	jcyAesHoZsZGRJ5wdAmnxzIwA0ViMxrBrFZd4FH/EM9ZYYswN12ADCt9Mci2tshIrrnO
	nncumDA+Zdg5FM5UnsxGCur58/eynY2mXwOPV2CLo/NGUO8njyto3CqxHZ/u8wxwGHth
	P1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kbHdrBGKac6mVCGYLZiQQ82HBzk6etON8it8YvTemqg=;
	b=X4EES0aBbbk/DfSpNecf9z5bf07CgPLlvVZJ1PE3jpowZX4nrFc8qej4OsjVebpMAB
	ktC+2oBmTX+CG/c7TpveinNitWmivuTx6199wWBhpSNlNkx7MNOvr79OUE6UbBuNG3+L
	akR+CAY565bJPmdY+ouDQrb+wACWp5NvbUJmpgWAN1yROF/mGqPEWLXbWZB9IoXzrNtH
	NCIlonrlMdLV7aG/BsoZlj/eTn/dDU+2oURtVpl7jErNEK/VBOb53Ldd1nhWhjHv0IpE
	nyMIbYk+6xWvamIBdaeP+b9H3t7MPZDWtIpiJHUC124b3hdiV2tV+ybsRDHnhzNDs8hy
	nmvQ==
X-Gm-Message-State: AHYfb5ihZcPXrAocAyxQjiGUR28VmIAihxRblFRLbM5kmTW/ugLGXeFn
	ypoesLL1F1r+Lejzcngh+jAAQTxFtXK0
X-Received: by 10.31.233.194 with SMTP id g185mr10580858vkh.56.1503306042430; 
	Mon, 21 Aug 2017 02:00:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Mon, 21 Aug 2017 02:00:41 -0700 (PDT)
In-Reply-To: <20170816164450.1447E236566@git.openembedded.org>
References: <150290188985.5203.15184613586486279186@git.openembedded.org>
	<20170816164450.1447E236566@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 21 Aug 2017 11:00:41 +0200
Message-ID: <CA+chaQfbEAVhPbPeOi=vfMcjds2DMGtMGz256gode6+2NdzMug@mail.gmail.com>
To: Peter Kjellerstedt <pkj@axis.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 01/02: package.bbclass: Restore functionality to detect RPM dependencies
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
X-List-Received-Date: Mon, 21 Aug 2017 09:00:42 -0000
Content-Type: multipart/alternative; boundary="94eb2c094a4aa5da3705573fb689"

--94eb2c094a4aa5da3705573fb689
Content-Type: text/plain; charset="UTF-8"

This seems to find a many more missed dependencies which is good thing.

There is +- 20 failures found in meta-oe recipes and there is still at
least one in oe-core:

ERROR: nativesdk-libcheck-0.10.0-r0 do_package_qa: QA Issue:
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/checkmk
contained in package nativesdk-libcheck requires
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/gawk, but no
providers found in RDEPENDS_nativesdk-libcheck? [file-rdeps]

I wonder why this one wasn't catched by oe-core autobuilder.

On Wed, Aug 16, 2017 at 6:44 PM, <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a commit to branch master-next
> in repository openembedded-core.
>
> commit bf017930036f19b3d6df8e5b50d9979ee7045c5c
> Author: Peter Kjellerstedt <pkj@axis.com>
> AuthorDate: Tue Aug 15 16:41:56 2017 -0500
>
>     package.bbclass: Restore functionality to detect RPM dependencies
>
>     During the transition to dnf and rpm4, the functionality to
>     automatically make RPM determine dependencies was lost.
>
>     Before the transition, an OE specific tool called rpmdeps-oecore had
>     been added to the rpm suit. It was based on the rpmdeps tool that is
>     part of rpm. For each file specified on its command line, it would
>     output the provides and requires that RPM could determine.
>
>     During the transition to rpm4, rpmdeps-oecore was replaced with the
>     standard rpmdeps. However, what no one noticed was that unless rpmdeps
>     is given options, e.g., -P or -R, to tell it what it should output, it
>     will not output anything. Thus, it would do all the work to determine
>     the requirements, but would keep silent about it. And since no output
>     from rpmdeps is expected unless there are requirements, there were no
>     warnings indicating that everything was not working as expected.
>
>     Porting the old rpmdeps-oecore to work with rpm4 is not really
>     possible since it relied on being able to access internals of RPM that
>     are no longer available. However, it turned out that rpmdeps had a
>     debug option, --rpmfcdebug, that would output exactly the information
>     that we need, albeit in a different format and to stderr. To make this
>     usable, rpmdeps has now received a new option, --alldeps, which sends
>     the information we need to stdout.
>
>     (From OE-Core rev: 958501b3d9201aaabb81ec644c6049e0c9b737e7)
>
>     Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>     Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/package.bbclass |  5 ++--
>  meta/lib/oe/package.py       | 60 ++++++++++++++++++++++++++++++
> +-------------
>  2 files changed, 44 insertions(+), 21 deletions(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index d2fa617..2fe30da 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1453,7 +1453,7 @@ if [ x"$D" = "x" ]; then
>  fi
>  }
>
> -RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/rpmdeps --rcfile
> ${STAGING_LIBDIR_NATIVE}/rpm/rpmrc  --macros ${STAGING_LIBDIR_NATIVE}/rpm/macros
> --define '_rpmconfigdir ${STAGING_LIBDIR_NATIVE}/rpm/'"
> +RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/rpmdeps --alldeps"
>
>  # Collect perfile run-time dependency metadata
>  # Output:
> @@ -1470,7 +1470,6 @@ python package_do_filedeps() {
>      pkgdest = d.getVar('PKGDEST')
>      packages = d.getVar('PACKAGES')
>      rpmdeps = d.getVar('RPMDEPS')
> -    magic = d.expand("${STAGING_DIR_NATIVE}${datadir_native}/misc/
> magic.mgc")
>
>      def chunks(files, n):
>          return [files[i:i+n] for i in range(0, len(files), n)]
> @@ -1482,7 +1481,7 @@ python package_do_filedeps() {
>          if pkg.endswith('-dbg') or pkg.endswith('-doc') or
> pkg.find('-locale-') != -1 or pkg.find('-localedata-') != -1 or
> pkg.find('-gconv-') != -1 or pkg.find('-charmap-') != -1 or
> pkg.startswith('kernel-module-') or pkg.endswith('-src'):
>              continue
>          for files in chunks(pkgfiles[pkg], 100):
> -            pkglist.append((pkg, files, rpmdeps, pkgdest, magic))
> +            pkglist.append((pkg, files, rpmdeps, pkgdest))
>
>      processed = oe.utils.multiprocess_exec( pkglist,
> oe.package.filedeprunner)
>
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index 43748b2..a79c668 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -162,44 +162,68 @@ def file_translate(file):
>  def filedeprunner(arg):
>      import re, subprocess, shlex
>
> -    (pkg, pkgfiles, rpmdeps, pkgdest, magic) = arg
> +    (pkg, pkgfiles, rpmdeps, pkgdest) = arg
>      provides = {}
>      requires = {}
>
> -    r = re.compile(r'[<>=]+ +[^ ]*')
> +    file_re = re.compile(r'\s+\d+\s(.*)')
> +    dep_re = re.compile(r'\s+(\S)\s+(.*)')
> +    r = re.compile(r'[<>=]+\s+\S*')
>
>      def process_deps(pipe, pkg, pkgdest, provides, requires):
> +        file = None
>          for line in pipe:
> -            f = line.decode("utf-8").split(" ", 1)[0].strip()
> -            line = line.decode("utf-8").split(" ", 1)[1].strip()
> +            line = line.decode("utf-8")
>
> -            if line.startswith("Requires:"):
> +            m = file_re.match(line)
> +            if m:
> +                file = m.group(1)
> +                file = file.replace(pkgdest + "/" + pkg, "")
> +                file = file_translate(file)
> +                continue
> +
> +            m = dep_re.match(line)
> +            if not m or not file:
> +                continue
> +
> +            type, dep = m.groups()
> +
> +            if type == 'R':
>                  i = requires
> -            elif line.startswith("Provides:"):
> +            elif type == 'P':
>                  i = provides
>              else:
> -                continue
> +               continue
>
> -            file = f.replace(pkgdest + "/" + pkg, "")
> -            file = file_translate(file)
> -            value = line.split(":", 1)[1].strip()
> -            value = r.sub(r'(\g<0>)', value)
> +            if dep.startswith("python("):
> +                continue
>
> -            if value.startswith("rpmlib("):
> +            # Ignore all perl(VMS::...) and perl(Mac::...) dependencies.
> These
> +            # are typically used conditionally from the Perl code, but are
> +            # generated as unconditional dependencies.
> +            if dep.startswith('perl(VMS::') or
> dep.startswith('perl(Mac::'):
>                  continue
> -            if value == "python":
> +
> +            # Ignore perl dependencies on .pl files.
> +            if dep.startswith('perl(') and dep.endswith('.pl)'):
>                  continue
> +
> +            # Remove perl versions and perl module versions since they
> typically
> +            # do not make sense when used as package versions.
> +            if dep.startswith('perl') and r.search(dep):
> +                dep = dep.split()[0]
> +
> +            # Put parentheses around any version specifications.
> +            dep = r.sub(r'(\g<0>)',dep)
> +
>              if file not in i:
>                  i[file] = []
> -            i[file].append(value)
> +            i[file].append(dep)
>
>          return provides, requires
>
> -    env = os.environ.copy()
> -    env["MAGIC"] = magic
> -
>      try:
> -        dep_popen = subprocess.Popen(shlex.split(rpmdeps) + pkgfiles,
> stdout=subprocess.PIPE, env=env)
> +        dep_popen = subprocess.Popen(shlex.split(rpmdeps) + pkgfiles,
> stdout=subprocess.PIPE)
>          provides, requires = process_deps(dep_popen.stdout, pkg, pkgdest,
> provides, requires)
>      except OSError as e:
>          bb.error("rpmdeps: '%s' command failed, '%s'" %
> (shlex.split(rpmdeps) + pkgfiles, e))
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

--94eb2c094a4aa5da3705573fb689
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This seems to find a many more missed dependencies which i=
s good thing.<div><br></div><div>There is +- 20 failures found in meta-oe r=
ecipes and there is still at least one in oe-core:</div><div><br></div><div=
><div>ERROR: nativesdk-libcheck-0.10.0-r0 do_package_qa: QA Issue: /usr/loc=
al/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/checkmk contained in p=
ackage nativesdk-libcheck requires /usr/local/oecore-x86_64/sysroots/x86_64=
-oesdk-linux/usr/bin/gawk, but no providers found in RDEPENDS_nativesdk-lib=
check? [file-rdeps]</div></div><div><br></div><div>I wonder why this one wa=
sn&#39;t catched by oe-core autobuilder.</div></div><div class=3D"gmail_ext=
ra"><br><div class=3D"gmail_quote">On Wed, Aug 16, 2017 at 6:44 PM,  <span =
dir=3D"ltr">&lt;<a href=3D"mailto:git@git.openembedded.org" target=3D"_blan=
k">git@git.openembedded.org</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">This is an automated email from the git hooks/post-receive script.=
<br>
<br>
rpurdie pushed a commit to branch master-next<br>
in repository openembedded-core.<br>
<br>
commit bf017930036f19b3d6df8e5b50d997<wbr>9ee7045c5c<br>
Author: Peter Kjellerstedt &lt;<a href=3D"mailto:pkj@axis.com">pkj@axis.com=
</a>&gt;<br>
AuthorDate: Tue Aug 15 16:41:56 2017 -0500<br>
<br>
=C2=A0 =C2=A0 package.bbclass: Restore functionality to detect RPM dependen=
cies<br>
<br>
=C2=A0 =C2=A0 During the transition to dnf and rpm4, the functionality to<b=
r>
=C2=A0 =C2=A0 automatically make RPM determine dependencies was lost.<br>
<br>
=C2=A0 =C2=A0 Before the transition, an OE specific tool called rpmdeps-oec=
ore had<br>
=C2=A0 =C2=A0 been added to the rpm suit. It was based on the rpmdeps tool =
that is<br>
=C2=A0 =C2=A0 part of rpm. For each file specified on its command line, it =
would<br>
=C2=A0 =C2=A0 output the provides and requires that RPM could determine.<br=
>
<br>
=C2=A0 =C2=A0 During the transition to rpm4, rpmdeps-oecore was replaced wi=
th the<br>
=C2=A0 =C2=A0 standard rpmdeps. However, what no one noticed was that unles=
s rpmdeps<br>
=C2=A0 =C2=A0 is given options, e.g., -P or -R, to tell it what it should o=
utput, it<br>
=C2=A0 =C2=A0 will not output anything. Thus, it would do all the work to d=
etermine<br>
=C2=A0 =C2=A0 the requirements, but would keep silent about it. And since n=
o output<br>
=C2=A0 =C2=A0 from rpmdeps is expected unless there are requirements, there=
 were no<br>
=C2=A0 =C2=A0 warnings indicating that everything was not working as expect=
ed.<br>
<br>
=C2=A0 =C2=A0 Porting the old rpmdeps-oecore to work with rpm4 is not reall=
y<br>
=C2=A0 =C2=A0 possible since it relied on being able to access internals of=
 RPM that<br>
=C2=A0 =C2=A0 are no longer available. However, it turned out that rpmdeps =
had a<br>
=C2=A0 =C2=A0 debug option, --rpmfcdebug, that would output exactly the inf=
ormation<br>
=C2=A0 =C2=A0 that we need, albeit in a different format and to stderr. To =
make this<br>
=C2=A0 =C2=A0 usable, rpmdeps has now received a new option, --alldeps, whi=
ch sends<br>
=C2=A0 =C2=A0 the information we need to stdout.<br>
<br>
=C2=A0 =C2=A0 (From OE-Core rev: 958501b3d9201aaabb81ec644c6049<wbr>e0c9b73=
7e7)<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter=
.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@wi=
ndriver.com">mark.hatle@windriver.com</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org">richard.purdie@<wbr>linuxfoundation.org</a>&gt;<=
br>
---<br>
=C2=A0meta/classes/package.bbclass |=C2=A0 5 ++--<br>
=C2=A0meta/lib/oe/package.py=C2=A0 =C2=A0 =C2=A0 =C2=A0| 60 +++++++++++++++=
+++++++++++++++<wbr>+-------------<br>
=C2=A02 files changed, 44 insertions(+), 21 deletions(-)<br>
<br>
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass<br=
>
index d2fa617..2fe30da 100644<br>
--- a/meta/classes/package.bbclass<br>
+++ b/meta/classes/package.bbclass<br>
@@ -1453,7 +1453,7 @@ if [ x&quot;$D&quot; =3D &quot;x&quot; ]; then<br>
=C2=A0fi<br>
=C2=A0}<br>
<br>
-RPMDEPS =3D &quot;${STAGING_LIBDIR_NATIVE}/rpm/<wbr>rpmdeps --rcfile ${STA=
GING_LIBDIR_NATIVE}/rpm/<wbr>rpmrc=C2=A0 --macros ${STAGING_LIBDIR_NATIVE}/=
rpm/<wbr>macros --define &#39;_rpmconfigdir ${STAGING_LIBDIR_NATIVE}/rpm/&#=
39;<wbr>&quot;<br>
+RPMDEPS =3D &quot;${STAGING_LIBDIR_NATIVE}/rpm/<wbr>rpmdeps --alldeps&quot=
;<br>
<br>
=C2=A0# Collect perfile run-time dependency metadata<br>
=C2=A0# Output:<br>
@@ -1470,7 +1470,6 @@ python package_do_filedeps() {<br>
=C2=A0 =C2=A0 =C2=A0pkgdest =3D d.getVar(&#39;PKGDEST&#39;)<br>
=C2=A0 =C2=A0 =C2=A0packages =3D d.getVar(&#39;PACKAGES&#39;)<br>
=C2=A0 =C2=A0 =C2=A0rpmdeps =3D d.getVar(&#39;RPMDEPS&#39;)<br>
-=C2=A0 =C2=A0 magic =3D d.expand(&quot;${STAGING_DIR_<wbr>NATIVE}${datadir=
_native}/misc/<wbr>magic.mgc&quot;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def chunks(files, n):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return [files[i:i+n] for i in range(0, le=
n(files), n)]<br>
@@ -1482,7 +1481,7 @@ python package_do_filedeps() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if pkg.endswith(&#39;-dbg&#39;) or pkg.en=
dswith(&#39;-doc&#39;) or pkg.find(&#39;-locale-&#39;) !=3D -1 or pkg.find(=
&#39;-localedata-&#39;) !=3D -1 or pkg.find(&#39;-gconv-&#39;) !=3D -1 or p=
kg.find(&#39;-charmap-&#39;) !=3D -1 or pkg.startswith(&#39;kernel-module-<=
wbr>&#39;) or pkg.endswith(&#39;-src&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for files in chunks(pkgfiles[pkg], 100):<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkglist.append((pkg, files, rpmd=
eps, pkgdest, magic))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkglist.append((pkg, files, rpmd=
eps, pkgdest))<br>
<br>
=C2=A0 =C2=A0 =C2=A0processed =3D oe.utils.multiprocess_exec( pkglist, oe.p=
ackage.filedeprunner)<br>
<br>
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py<br>
index 43748b2..a79c668 100644<br>
--- a/meta/lib/oe/package.py<br>
+++ b/meta/lib/oe/package.py<br>
@@ -162,44 +162,68 @@ def file_translate(file):<br>
=C2=A0def filedeprunner(arg):<br>
=C2=A0 =C2=A0 =C2=A0import re, subprocess, shlex<br>
<br>
-=C2=A0 =C2=A0 (pkg, pkgfiles, rpmdeps, pkgdest, magic) =3D arg<br>
+=C2=A0 =C2=A0 (pkg, pkgfiles, rpmdeps, pkgdest) =3D arg<br>
=C2=A0 =C2=A0 =C2=A0provides =3D {}<br>
=C2=A0 =C2=A0 =C2=A0requires =3D {}<br>
<br>
-=C2=A0 =C2=A0 r =3D re.compile(r&#39;[&lt;&gt;=3D]+ +[^ ]*&#39;)<br>
+=C2=A0 =C2=A0 file_re =3D re.compile(r&#39;\s+\d+\s(.*)&#39;)<br>
+=C2=A0 =C2=A0 dep_re =3D re.compile(r&#39;\s+(\S)\s+(.*)&#39;)<br>
+=C2=A0 =C2=A0 r =3D re.compile(r&#39;[&lt;&gt;=3D]+\s+\S*&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def process_deps(pipe, pkg, pkgdest, provides, requires=
):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 file =3D None<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for line in pipe:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D line.decode(&quot;utf-8&qu=
ot;).split(&quot; &quot;, 1)[0].strip()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line =3D line.decode(&quot;utf-8=
&quot;).split(&quot; &quot;, 1)[1].strip()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line =3D line.decode(&quot;utf-8=
&quot;)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if line.startswith(&quot;Require=
s:&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m =3D file_re.match(line)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if m:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file =3D m.group(1=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file =3D file.repl=
ace(pkgdest + &quot;/&quot; + pkg, &quot;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file =3D file_tran=
slate(file)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m =3D dep_re.match(line)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not m or not file:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type, dep =3D m.groups()<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if type =3D=3D &#39;R&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D require=
s<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif line.startswith(&quot;Provi=
des:&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif type =3D=3D &#39;P&#39;:<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D provide=
s<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file =3D f.replace(pkgdest + &qu=
ot;/&quot; + pkg, &quot;&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file =3D file_translate(file)<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D line.split(&quot;:&quo=
t;, 1)[1].strip()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value =3D r.sub(r&#39;(\g&lt;0&g=
t;)&#39;, value)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if dep.startswith(&quot;python(&=
quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if value.startswith(&quot;rpmlib=
(&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ignore all perl(VMS::...) and =
perl(Mac::...) dependencies. These<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # are typically used conditional=
ly from the Perl code, but are<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # generated as unconditional dep=
endencies.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if dep.startswith(&#39;perl(VMS:=
:&#39;) or dep.startswith(&#39;perl(Mac::&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if value =3D=3D &quot;python&quo=
t;:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Ignore perl dependencies on .p=
l files.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if dep.startswith(&#39;perl(&#39=
;) and dep.endswith(&#39;.pl)&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove perl versions and perl =
module versions since they typically<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # do not make sense when used as=
 package versions.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if dep.startswith(&#39;perl&#39;=
) and r.search(dep):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dep =3D dep.split(=
)[0]<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Put parentheses around any ver=
sion specifications.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dep =3D r.sub(r&#39;(\g&lt;0&gt;=
)&#39;,dep)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if file not in i:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i[file] =3D [=
]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i[file].append(value)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i[file].append(dep)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return provides, requires<br>
<br>
-=C2=A0 =C2=A0 env =3D os.environ.copy()<br>
-=C2=A0 =C2=A0 env[&quot;MAGIC&quot;] =3D magic<br>
-<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dep_popen =3D subprocess.Popen(shlex.split(<wb=
r>rpmdeps) + pkgfiles, stdout=3Dsubprocess.PIPE, env=3Denv)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dep_popen =3D subprocess.Popen(shlex.split(<wb=
r>rpmdeps) + pkgfiles, stdout=3Dsubprocess.PIPE)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0provides, requires =3D process_deps(dep_p=
open.stdout, pkg, pkgdest, provides, requires)<br>
=C2=A0 =C2=A0 =C2=A0except OSError as e:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.error(&quot;rpmdeps: &#39;%s&#39; comm=
and failed, &#39;%s&#39;&quot; % (shlex.split(rpmdeps) + pkgfiles, e))<br>
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

--94eb2c094a4aa5da3705573fb689--
