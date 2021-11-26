Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECF6C433FE
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 19:57:06 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web09.28349.1637956624959288127
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 11:57:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Cp33mB3z;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id x10so12747966ioj.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 11:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S75Jf/jj9RdSlKxOZm1hSbvAfBJg/f/9MV8Koc86Zvw=;
        b=Cp33mB3zq0pI7bdLrFVm7tRh5Ge/kW5tTO4gLRv2FY/5aaf7ofKINQrPa+2skkKJi5
         GgcUE4IdHlUVCUZNwJsahhqEJ4H1NgK/QZOtoU40Gfx/FwqfE6t4WrlnJQSYsqY3nKC8
         ib8ulnVAaFpSnZGmci/Wqbb490gSrWeuAEDjz5nsh01vY5AnOrFHpuicdBYdWSctrxKI
         sNAuDagCN0BGwNhY44cmvqjl1MDK8fqRgaGJbImIDewmjQmm12iBnaK1W6Tr9c93km9a
         bkGJ7Iwu3WkAfZZpHwJWv4bHBT3GRuSMoG6Q56ssZVEE3lqjPk6W4V40lk1lnAAPfsFm
         nwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S75Jf/jj9RdSlKxOZm1hSbvAfBJg/f/9MV8Koc86Zvw=;
        b=meNYycjFNXh0MHSHvmGXtLNRscUMzG4FiCs2hLWuGtagWxYoKGgkzKYjMcaTjitIV/
         aakNEMX4g/MvfX8Jv0GVGCbVfdwVYBgX2kNjCOazfo7vVwtRsBJ4KpXEOf5srsqJfDim
         knbM2h0Z1BJptWEF2Dyd749abD2Ym481k5wUdycwP0xIue/Nz2/QftKS11FrHl2ZFpBj
         xpOeVKhjgulTmUNFu/ibvRJd8ms9agzWPnS04JQSu/T4lGJ+3PQpnVM2sBtgRTFRItYr
         Rbfta+c0JT/ocoYkIquQXx1lHwfn1V9bVs/7N4Ut88nCe3/S/OFCDLAXsz39keU6Q70C
         dmaA==
X-Gm-Message-State: AOAM531m3vgcx+eTl61/ezo4nq9DurYc7Ju96r3nGqGt67Vst+3cVFyB
	ljY19+K/qruG5RkHnFhJ1i0n7eO0ckhqWzzTl3m9Xpsf
X-Google-Smtp-Source: 
 ABdhPJwnuILFdRk5ZkrDi29JKwTQp7LSMXTb172L8svfmJQkknC44X6O6A4KNkDYsZfR+QxjkJjkGeCwbcwzPozgsoI=
X-Received: by 2002:a05:6602:2c50:: with SMTP id
 x16mr37957132iov.114.1637956624235;
 Fri, 26 Nov 2021 11:57:04 -0800 (PST)
MIME-Version: 1.0
References: <20211126163423.166644-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211126163423.166644-1-richard.purdie@linuxfoundation.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 26 Nov 2021 11:56:53 -0800
Message-ID: 
 <CANx9H-BOYi9CxjvMfuUNEngKpY=ojyo0ORDsfCW9RnwR_zynQw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sanity/lib: Replace usage if LooseVersion with
 bb.utils.vercmp_string_op
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bec19b05d1b67e63"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 19:57:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158843

--000000000000bec19b05d1b67e63
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 26, 2021 at 8:34 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> distutils is going away and we have functionality in bitbake which can
> handle these comparisions so switch to the bb.utils function.
>

Looks good. I will refactor the distutils deprecation series to follow suit.


> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/sanity.bbclass | 18 ++++++------------
>  meta/lib/oe/distro_check.py |  2 +-
>  meta/lib/oe/terminal.py     |  7 +++----
>  3 files changed, 10 insertions(+), 17 deletions(-)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 9fbc9c18e7c..0e20589b22d 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -462,13 +462,12 @@ def check_sanity_validmachine(sanity_data):
>  # Patch before 2.7 can't handle all the features in git-style diffs.  Some
>  # patches may incorrectly apply, and others won't apply at all.
>  def check_patch_version(sanity_data):
> -    from distutils.version import LooseVersion
>      import re, subprocess
>
>      try:
>          result = subprocess.check_output(["patch", "--version"],
> stderr=subprocess.STDOUT).decode('utf-8')
>          version = re.search(r"[0-9.]+", result.splitlines()[0]).group()
> -        if LooseVersion(version) < LooseVersion("2.7"):
> +        if bb.utils.vercmp_string_op(version, "2.7", "<"):
>              return "Your version of patch is older than 2.7 and has bugs
> which will break builds. Please install a newer version of patch.\n"
>          else:
>              return None
> @@ -478,7 +477,6 @@ def check_patch_version(sanity_data):
>  # Unpatched versions of make 3.82 are known to be broken.  See GNU
> Savannah Bug 30612.
>  # Use a modified reproducer from http://savannah.gnu.org/bugs/?30612 to
> validate.
>  def check_make_version(sanity_data):
> -    from distutils.version import LooseVersion
>      import subprocess
>
>      try:
> @@ -486,7 +484,7 @@ def check_make_version(sanity_data):
>      except subprocess.CalledProcessError as e:
>          return "Unable to execute make --version, exit code %d\n%s\n" %
> (e.returncode, e.output)
>      version = result.split()[2]
> -    if LooseVersion(version) == LooseVersion("3.82"):
> +    if bb.utils.vercmp_string_op(version, "3.82", "=="):
>          # Construct a test file
>          f = open("makefile_test", "w")
>          f.write("makefile_test.a: makefile_test_a.c makefile_test_b.c
> makefile_test.a( makefile_test_a.c makefile_test_b.c)\n")
> @@ -539,12 +537,11 @@ def check_wsl(d):
>  # built buildtools-extended-tarball)
>  #
>  def check_gcc_version(sanity_data):
> -    from distutils.version import LooseVersion
>      import subprocess
>
>      build_cc, version = oe.utils.get_host_compiler_version(sanity_data)
>      if build_cc.strip() == "gcc":
> -        if LooseVersion(version) < LooseVersion("7.5"):
> +        if bb.utils.vercmp_string_op(version, "7.5", "<"):
>              return "Your version of gcc is older than 7.5 and will break
> builds. Please install a newer version of gcc (you could use the project's
> buildtools-extended-tarball or use scripts/install-buildtools).\n"
>      return None
>
> @@ -552,14 +549,13 @@ def check_gcc_version(sanity_data):
>  # but earlier versions do not; this needs to work properly for sstate
>  # Version 1.28 is needed so opkg-build works correctly when reproducibile
> builds are enabled
>  def check_tar_version(sanity_data):
> -    from distutils.version import LooseVersion
>      import subprocess
>      try:
>          result = subprocess.check_output(["tar", "--version"],
> stderr=subprocess.STDOUT).decode('utf-8')
>      except subprocess.CalledProcessError as e:
>          return "Unable to execute tar --version, exit code %d\n%s\n" %
> (e.returncode, e.output)
>      version = result.split()[3]
> -    if LooseVersion(version) < LooseVersion("1.28"):
> +    if bb.utils.vercmp_string_op(version, "1.28", "<"):
>          return "Your version of tar is older than 1.28 and does not have
> the support needed to enable reproducible builds. Please install a newer
> version of tar (you could use the project's buildtools-tarball from our
> last release or use scripts/install-buildtools).\n"
>      return None
>
> @@ -567,14 +563,13 @@ def check_tar_version(sanity_data):
>  # The kernel tools assume git >= 1.8.3.1 (verified needed > 1.7.9.5) see
> #6162
>  # The git fetcher also had workarounds for git < 1.7.9.2 which we've
> dropped
>  def check_git_version(sanity_data):
> -    from distutils.version import LooseVersion
>      import subprocess
>      try:
>          result = subprocess.check_output(["git", "--version"],
> stderr=subprocess.DEVNULL).decode('utf-8')
>      except subprocess.CalledProcessError as e:
>          return "Unable to execute git --version, exit code %d\n%s\n" %
> (e.returncode, e.output)
>      version = result.split()[2]
> -    if LooseVersion(version) < LooseVersion("1.8.3.1"):
> +    if bb.utils.vercmp_string_op(version, "1.8.3.1", "<"):
>          return "Your version of git is older than 1.8.3.1 and has bugs
> which will break builds. Please install a newer version of git.\n"
>      return None
>
> @@ -796,9 +791,8 @@ def check_sanity_everybuild(status, d):
>          status.addresult('The system requires at least Python 3.6 to run.
> Please update your Python interpreter.\n')
>
>      # Check the bitbake version meets minimum requirements
> -    from distutils.version import LooseVersion
>      minversion = d.getVar('BB_MIN_VERSION')
> -    if (LooseVersion(bb.__version__) < LooseVersion(minversion)):
> +    if bb.utils.vercmp_string_op(bb.__version__, minversion, "<"):
>          status.addresult('Bitbake version %s is required and version %s
> was found\n' % (minversion, bb.__version__))
>
>      sanity_check_locale(d)
> diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
> index 88e46c354d2..4b2a9bec01b 100644
> --- a/meta/lib/oe/distro_check.py
> +++ b/meta/lib/oe/distro_check.py
> @@ -26,7 +26,7 @@ def find_latest_numeric_release(url, d):
>      maxstr=""
>      for link in get_links_from_url(url, d):
>          try:
> -            # TODO use LooseVersion
> +            # TODO use bb.utils.vercmp_string_op()
>              release = float(link)
>          except:
>              release = 0
> diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
> index 59aa80de669..53186c4a3ed 100644
> --- a/meta/lib/oe/terminal.py
> +++ b/meta/lib/oe/terminal.py
> @@ -5,7 +5,6 @@ import logging
>  import oe.classutils
>  import shlex
>  from bb.process import Popen, ExecutionError
> -from distutils.version import LooseVersion
>
>  logger = logging.getLogger('BitBake.OE.Terminal')
>
> @@ -86,10 +85,10 @@ class Konsole(XTerminal):
>      def __init__(self, sh_cmd, title=None, env=None, d=None):
>          # Check version
>          vernum = check_terminal_version("konsole")
> -        if vernum and LooseVersion(vernum) < '2.0.0':
> +        if vernum and bb.utils.vercmp_string_op(vernum, "2.0.0", "<"):
>              # Konsole from KDE 3.x
>              self.command = 'konsole -T "{title}" -e {command}'
> -        elif vernum and LooseVersion(vernum) < '16.08.1':
> +        elif vernum and bb.utils.vercmp_string_op(vernum, "16.08.1", "<"):
>              # Konsole pre 16.08.01 Has nofork
>              self.command = 'konsole --nofork --workdir . -p
> tabtitle="{title}" -e {command}'
>          XTerminal.__init__(self, sh_cmd, title, env, d)
> @@ -260,7 +259,7 @@ def spawn(name, sh_cmd, title=None, env=None, d=None):
>
>  def check_tmux_version(desired):
>      vernum = check_terminal_version("tmux")
> -    if vernum and LooseVersion(vernum) < desired:
> +    if vernum and bb.utils.vercmp_string_op(vernum, desired, "<"):
>          return False
>      return vernum
>
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158838):
> https://lists.openembedded.org/g/openembedded-core/message/158838
> Mute This Topic: https://lists.openembedded.org/mt/87322233/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000bec19b05d1b67e63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Nov 26, 2021 at 8:34 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;paddi=
ng-left:1ex;border-left-color:rgb(204,204,204)">distutils is going away and=
 we have functionality in bitbake which can<br>
handle these comparisions so switch to the bb.utils function.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Looks good. I wi=
ll refactor the distutils deprecation series to follow suit.</div><div dir=
=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex=
;border-left-color:rgb(204,204,204)"><br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/classes/sanity.bbclass | 18 ++++++------------<br>
=C2=A0meta/lib/oe/distro_check.py |=C2=A0 2 +-<br>
=C2=A0meta/lib/oe/terminal.py=C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +++----<br>
=C2=A03 files changed, 10 insertions(+), 17 deletions(-)<br>
<br>
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass<br>
index 9fbc9c18e7c..0e20589b22d 100644<br>
--- a/meta/classes/sanity.bbclass<br>
+++ b/meta/classes/sanity.bbclass<br>
@@ -462,13 +462,12 @@ def check_sanity_validmachine(sanity_data):<br>
=C2=A0# Patch before 2.7 can&#39;t handle all the features in git-style dif=
fs.=C2=A0 Some<br>
=C2=A0# patches may incorrectly apply, and others won&#39;t apply at all.<b=
r>
=C2=A0def check_patch_version(sanity_data):<br>
-=C2=A0 =C2=A0 from distutils.version import LooseVersion<br>
=C2=A0 =C2=A0 =C2=A0import re, subprocess<br>
<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D subprocess.check_output([&quot=
;patch&quot;, &quot;--version&quot;], stderr=3Dsubprocess.STDOUT).decode(&#=
39;utf-8&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version =3D re.search(r&quot;[0-9.]+&quot=
;, result.splitlines()[0]).group()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if LooseVersion(version) &lt; LooseVersion(&qu=
ot;2.7&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if bb.utils.vercmp_string_op(version, &quot;2.=
7&quot;, &quot;&lt;&quot;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;Your version o=
f patch is older than 2.7 and has bugs which will break builds. Please inst=
all a newer version of patch.\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return None<br>
@@ -478,7 +477,6 @@ def check_patch_version(sanity_data):<br>
=C2=A0# Unpatched versions of make 3.82 are known to be broken.=C2=A0 See G=
NU Savannah Bug 30612.<br>
=C2=A0# Use a modified reproducer from <a href=3D"http://savannah.gnu.org/b=
ugs/?30612" rel=3D"noreferrer" target=3D"_blank">http://savannah.gnu.org/bu=
gs/?30612</a> to validate.<br>
=C2=A0def check_make_version(sanity_data):<br>
-=C2=A0 =C2=A0 from distutils.version import LooseVersion<br>
=C2=A0 =C2=A0 =C2=A0import subprocess<br>
<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
@@ -486,7 +484,7 @@ def check_make_version(sanity_data):<br>
=C2=A0 =C2=A0 =C2=A0except subprocess.CalledProcessError as e:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;Unable to execute make --ver=
sion, exit code %d\n%s\n&quot; % (e.returncode, e.output)<br>
=C2=A0 =C2=A0 =C2=A0version =3D result.split()[2]<br>
-=C2=A0 =C2=A0 if LooseVersion(version) =3D=3D LooseVersion(&quot;3.82&quot=
;):<br>
+=C2=A0 =C2=A0 if bb.utils.vercmp_string_op(version, &quot;3.82&quot;, &quo=
t;=3D=3D&quot;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Construct a test file<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f =3D open(&quot;makefile_test&quot;, &qu=
ot;w&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&quot;makefile_test.a: makefile_t=
est_a.c makefile_test_b.c makefile_test.a( makefile_test_a.c makefile_test_=
b.c)\n&quot;)<br>
@@ -539,12 +537,11 @@ def check_wsl(d):<br>
=C2=A0# built buildtools-extended-tarball)<br>
=C2=A0#<br>
=C2=A0def check_gcc_version(sanity_data):<br>
-=C2=A0 =C2=A0 from distutils.version import LooseVersion<br>
=C2=A0 =C2=A0 =C2=A0import subprocess<br>
<br>
=C2=A0 =C2=A0 =C2=A0build_cc, version =3D oe.utils.get_host_compiler_versio=
n(sanity_data)<br>
=C2=A0 =C2=A0 =C2=A0if build_cc.strip() =3D=3D &quot;gcc&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if LooseVersion(version) &lt; LooseVersion(&qu=
ot;7.5&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if bb.utils.vercmp_string_op(version, &quot;7.=
5&quot;, &quot;&lt;&quot;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;Your version o=
f gcc is older than 7.5 and will break builds. Please install a newer versi=
on of gcc (you could use the project&#39;s buildtools-extended-tarball or u=
se scripts/install-buildtools).\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0return None<br>
<br>
@@ -552,14 +549,13 @@ def check_gcc_version(sanity_data):<br>
=C2=A0# but earlier versions do not; this needs to work properly for sstate=
<br>
=C2=A0# Version 1.28 is needed so opkg-build works correctly when reproduci=
bile builds are enabled<br>
=C2=A0def check_tar_version(sanity_data):<br>
-=C2=A0 =C2=A0 from distutils.version import LooseVersion<br>
=C2=A0 =C2=A0 =C2=A0import subprocess<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D subprocess.check_output([&quot=
;tar&quot;, &quot;--version&quot;], stderr=3Dsubprocess.STDOUT).decode(&#39=
;utf-8&#39;)<br>
=C2=A0 =C2=A0 =C2=A0except subprocess.CalledProcessError as e:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;Unable to execute tar --vers=
ion, exit code %d\n%s\n&quot; % (e.returncode, e.output)<br>
=C2=A0 =C2=A0 =C2=A0version =3D result.split()[3]<br>
-=C2=A0 =C2=A0 if LooseVersion(version) &lt; LooseVersion(&quot;1.28&quot;)=
:<br>
+=C2=A0 =C2=A0 if bb.utils.vercmp_string_op(version, &quot;1.28&quot;, &quo=
t;&lt;&quot;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;Your version of tar is older=
 than 1.28 and does not have the support needed to enable reproducible buil=
ds. Please install a newer version of tar (you could use the project&#39;s =
buildtools-tarball from our last release or use scripts/install-buildtools)=
.\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0return None<br>
<br>
@@ -567,14 +563,13 @@ def check_tar_version(sanity_data):<br>
=C2=A0# The kernel tools assume git &gt;=3D 1.8.3.1 (verified needed &gt; 1=
.7.9.5) see #6162 <br>
=C2=A0# The git fetcher also had workarounds for git &lt; 1.7.9.2 which we&=
#39;ve dropped<br>
=C2=A0def check_git_version(sanity_data):<br>
-=C2=A0 =C2=A0 from distutils.version import LooseVersion<br>
=C2=A0 =C2=A0 =C2=A0import subprocess<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D subprocess.check_output([&quot=
;git&quot;, &quot;--version&quot;], stderr=3Dsubprocess.DEVNULL).decode(&#3=
9;utf-8&#39;)<br>
=C2=A0 =C2=A0 =C2=A0except subprocess.CalledProcessError as e:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;Unable to execute git --vers=
ion, exit code %d\n%s\n&quot; % (e.returncode, e.output)<br>
=C2=A0 =C2=A0 =C2=A0version =3D result.split()[2]<br>
-=C2=A0 =C2=A0 if LooseVersion(version) &lt; LooseVersion(&quot;1.8.3.1&quo=
t;):<br>
+=C2=A0 =C2=A0 if bb.utils.vercmp_string_op(version, &quot;1.8.3.1&quot;, &=
quot;&lt;&quot;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;Your version of git is older=
 than 1.8.3.1 and has bugs which will break builds. Please install a newer =
version of git.\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0return None<br>
<br>
@@ -796,9 +791,8 @@ def check_sanity_everybuild(status, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status.addresult(&#39;The system requires=
 at least Python 3.6 to run. Please update your Python interpreter.\n&#39;)=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Check the bitbake version meets minimum requirements<=
br>
-=C2=A0 =C2=A0 from distutils.version import LooseVersion<br>
=C2=A0 =C2=A0 =C2=A0minversion =3D d.getVar(&#39;BB_MIN_VERSION&#39;)<br>
-=C2=A0 =C2=A0 if (LooseVersion(bb.__version__) &lt; LooseVersion(minversio=
n)):<br>
+=C2=A0 =C2=A0 if bb.utils.vercmp_string_op(bb.__version__, minversion, &qu=
ot;&lt;&quot;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status.addresult(&#39;Bitbake version %s =
is required and version %s was found\n&#39; % (minversion, bb.__version__))=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0sanity_check_locale(d)<br>
diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py<br>
index 88e46c354d2..4b2a9bec01b 100644<br>
--- a/meta/lib/oe/distro_check.py<br>
+++ b/meta/lib/oe/distro_check.py<br>
@@ -26,7 +26,7 @@ def find_latest_numeric_release(url, d):<br>
=C2=A0 =C2=A0 =C2=A0maxstr=3D&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0for link in get_links_from_url(url, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # TODO use LooseVersion<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # TODO use bb.utils.vercmp_strin=
g_op()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0release =3D float(link)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0release =3D 0<br>
diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py<br>
index 59aa80de669..53186c4a3ed 100644<br>
--- a/meta/lib/oe/terminal.py<br>
+++ b/meta/lib/oe/terminal.py<br>
@@ -5,7 +5,6 @@ import logging<br>
=C2=A0import oe.classutils<br>
=C2=A0import shlex<br>
=C2=A0from bb.process import Popen, ExecutionError<br>
-from distutils.version import LooseVersion<br>
<br>
=C2=A0logger =3D logging.getLogger(&#39;BitBake.OE.Terminal&#39;)<br>
<br>
@@ -86,10 +85,10 @@ class Konsole(XTerminal):<br>
=C2=A0 =C2=A0 =C2=A0def __init__(self, sh_cmd, title=3DNone, env=3DNone, d=
=3DNone):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Check version<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vernum =3D check_terminal_version(&quot;k=
onsole&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if vernum and LooseVersion(vernum) &lt; &#39;2=
.0.0&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if vernum and bb.utils.vercmp_string_op(vernum=
, &quot;2.0.0&quot;, &quot;&lt;&quot;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Konsole from KDE 3.x<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.command =3D &#39;konso=
le -T &quot;{title}&quot; -e {command}&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif vernum and LooseVersion(vernum) &lt; &#39=
;16.08.1&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif vernum and bb.utils.vercmp_string_op(vern=
um, &quot;16.08.1&quot;, &quot;&lt;&quot;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Konsole pre 16.08.01 Has =
nofork<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.command =3D &#39;konso=
le --nofork --workdir . -p tabtitle=3D&quot;{title}&quot; -e {command}&#39;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0XTerminal.__init__(self, sh_cmd, title, e=
nv, d)<br>
@@ -260,7 +259,7 @@ def spawn(name, sh_cmd, title=3DNone, env=3DNone, d=3DN=
one):<br>
<br>
=C2=A0def check_tmux_version(desired):<br>
=C2=A0 =C2=A0 =C2=A0vernum =3D check_terminal_version(&quot;tmux&quot;)<br>
-=C2=A0 =C2=A0 if vernum and LooseVersion(vernum) &lt; desired:<br>
+=C2=A0 =C2=A0 if vernum and bb.utils.vercmp_string_op(vernum, desired, &qu=
ot;&lt;&quot;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return False<br>
=C2=A0 =C2=A0 =C2=A0return vernum<br>
<br>
-- <br>
2.32.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#158838): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/158838" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/158838</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87322233/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
87322233/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000bec19b05d1b67e63--

