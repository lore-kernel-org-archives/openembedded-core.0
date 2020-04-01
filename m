Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web11.83.1585776723298316276
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 14:32:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ECqp/YOZ;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id m15so1361440iob.5
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2020 14:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AsYTws25CyfKKnoY3jkuUpWxyOwV9oAF3+CnjN6DZkU=;
        b=ECqp/YOZikEqRBxsZvdctS+IW1GFPXLhb71O59pb8e//bwbZyR8onqpoJPLPqMGTpX
         HnH2Y+6ned8wYkuRNmEYfnYp8PKiebOk1RhCiq/iF9Yr0LVaawYHMwSqMDWhBsrnoBpk
         RrKgIIbPDOFri8YkJeiHIqFySEFHmEuXhdBjD2F/ioCiEctdgi+XzILsA63t+639Og+K
         Bbkcss5feM8EYe8OJGJUVs1Vo8iDfrS0M4Cq48/AJQkx4q4zFvFwSzu5QLYP/hx9KYVF
         OfVGCdRbnJLGePnJQCqfxsxv0YSO4spe5SMc/Sn5BN7I3bcjAOqe2yauATh2vRaSC7+h
         pW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AsYTws25CyfKKnoY3jkuUpWxyOwV9oAF3+CnjN6DZkU=;
        b=pVwMg3bHUcNwszvYFRiJl8HBPoWnoPqupMCTIfJk1XU40QIzsb5AeceyBqjvK2VosC
         9LiqajB6yFxKlfKxtrrvZFHKATWEtpsFS7Vej/dK+8LDmXrrTbi29ZcRNqf8VPzqJ9Qm
         ZQt3xX4SkR7dsB74nwcJQmt6bPesN8G/xvuWl9IEGss4LDV73Mm0iFg7N5CkDCVbyOca
         bpUSKO4sE/dF3zjO8PfDw2IgU/C9Y7NbiIRWZ2x0V6jW7Iy9nnYlI5yhDDp+sxPfVYZG
         ovchZn4iPeDiX1pIa3TB8bizyJtcAKBmw/EZozmAfx41a1vQxloFN/7pURboFUDPVGdy
         5kZw==
X-Gm-Message-State: AGi0PubaSe0oD2vVPzFb8dn8weza7UNSglm4T3GKBx9zdcqt4NHS8a9V
	1zimNmQgTxJ1vLR57/FpUfjqMbYx6bV04yzMwKI=
X-Google-Smtp-Source: APiQypIYwvLa5ctlpiijerJIf87et3jxePbWLcHfNLZcJ9fbqqfKFmpwBk3arXdSccTj1NYxN5nE+qVO/TjpZqubJMU=
X-Received: by 2002:a02:9406:: with SMTP id a6mr261435jai.138.1585776722550;
 Wed, 01 Apr 2020 14:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200330194302.30032-1-timothy.t.orling@linux.intel.com> <CAJ86T=XCX7MGRVzoTzaaD3Xe9FqdWM9zX2Zha5Mk8Zo2y1MRVg@mail.gmail.com>
In-Reply-To: <CAJ86T=XCX7MGRVzoTzaaD3Xe9FqdWM9zX2Zha5Mk8Zo2y1MRVg@mail.gmail.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Wed, 1 Apr 2020 14:31:51 -0700
Message-ID: <CANx9H-B-whqswwLmZBZTUfOFVLhwC=t+V4y9FELk-kkpZpOGMA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] scripts/install-buildtools: improvements
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Tim Orling <timothy.t.orling@linux.intel.com>
Content-Type: multipart/alternative; boundary="0000000000003da36c05a2416a41"

--0000000000003da36c05a2416a41
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2020 at 1:09 PM Andre McCurdy <armccurdy@gmail.com> wrote:

> On Mon, Mar 30, 2020 at 12:43 PM Tim Orling
> <timothy.t.orling@linux.intel.com> wrote:
> >
> > * Install directory defaults to scripts/../buildtools
> >   e.g. --directory is set by default
> >   This avoids the user having to type in their sudo password
> >   to install in /opt/poky/<installer-version>
> >
> > * Use "." rather than "source" for sourcing the environment script
> >   as not all distros (e.g. Debian) have "source" by default.
> >
> > * Add buildtools/ to .gitignore
> >
> > * Fix typos in example usage (--install-version -> --installer-version=
)
> >
> > [YOCTO #13832]
> >
> > Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> > ---
> >  .gitignore                 |  1 +
> >  scripts/install-buildtools | 13 +++++++++----
> >  2 files changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/.gitignore b/.gitignore
> > index d0e6b2fb89..b66d371aac 100644
> > --- a/.gitignore
> > +++ b/.gitignore
> > @@ -9,6 +9,7 @@ pstage/
> >  scripts/oe-git-proxy-socks
> >  sources/
> >  meta-*/
> > +buildtools/
> >  !meta-skeleton
> >  !meta-selftest
> >  hob-image-*.bb
> > diff --git a/scripts/install-buildtools b/scripts/install-buildtools
> > index 0947e9c4d6..49cab1345a 100755
> > --- a/scripts/install-buildtools
> > +++ b/scripts/install-buildtools
> > @@ -17,7 +17,7 @@
> >  #        $ install-buildtools \
> >  #          --base-url http://downloads.yoctoproject.org/releases/yoct=
o
> \
> >  #          --release yocto-3.1_M2 \
> > -#          --install-version 3.0+snapshot
> > +#          --installer-version 3.0+snapshot
> >  #          --build-date 202000122
> >  #
> >  #  Example usage (standard buildtools from release):
> > @@ -29,7 +29,7 @@
> >  #        $ install-buildtools --without-extended-buildtools \
> >  #          --base-url http://downloads.yoctoproject.org/releases/yoct=
o
> \
> >  #          --release yocto-3.0.2 \
> > -#          --install-version 3.0.2
> > +#          --installer-version 3.0.2
> >  #
> >
> >  import argparse
> > @@ -59,6 +59,7 @@ if not bitbakepath:
> >  PROGNAME =3D 'install-buildtools'
> >  logger =3D scriptutils.logger_create(PROGNAME, stream=3Dsys.stdout)
> >
> > +DEFAULT_INSTALL_DIR: str =3D
> os.path.join(os.path.split(scripts_path)[0],'buildtools')
>
> It looks like there are some assumptions about the minimum version of
> python3 on the host in order to even be able to run
> install-buildtools. Should that be checked explicitly?
>

To be honest, everything was written on CentOS-7, where =E2=80=98python3=
=E2=80=99 is now
python36.

The remaining supported holdout for 3.4 is Debian-8 (Jessie). Which also
happens to have tar 1.27. At least it has git 2.1.4, so it=E2=80=99s not a=
 complete
mess.

Python 3.4 is already EOL. We should not support it for the complete build
system, but I can see that the install-buildtools script should ideally
still run on python34. The whole point is to make it easier to install the
pre-built buildtools.

Debian-8 is EOL in June 2020.


> >  DEFAULT_BASE_URL: str =3D '
> http://downloads.yoctoproject.org/releases/yocto'
> >  DEFAULT_RELEASE: str =3D 'yocto-3.1_M2'
> >  DEFAULT_INSTALLER_VERSION: str =3D '3.0+snapshot'
> > @@ -66,6 +67,7 @@ DEFAULT_BUILDDATE: str =3D "20200122"
> >
> >
> >  def main():
> > +    global DEFAULT_INSTALL_DIR
> >      global DEFAULT_BASE_URL
> >      global DEFAULT_RELEASE
> >      global DEFAULT_INSTALLER_VERSION
> > @@ -73,6 +75,7 @@ def main():
> >      filename: str =3D ""
> >      release: str =3D ""
> >      buildtools_url: str =3D ""
> > +    install_dir: str =3D ""
> >
> >      parser =3D argparse.ArgumentParser(
> >          description=3D"Buildtools installation helper",
> > @@ -87,6 +90,7 @@ def main():
> >                               '(optional)\nRequires --url',
> >                          action=3D'store')
> >      parser.add_argument('-d', '--directory',
> > +                        default=3DDEFAULT_INSTALL_DIR,
> >                          help=3D'directory where buildtools SDK will b=
e
> installed (optional)',
> >                          action=3D'store')
> >      parser.add_argument('-r', '--release',
> > @@ -216,12 +220,12 @@ def main():
> >          st =3D os.stat(tmpbuildtools)
> >          os.chmod(tmpbuildtools, st.st_mode | stat.S_IEXEC)
> >          logger.debug(os.stat(tmpbuildtools))
> > -        install_dir =3D "/opt/poky/%s" % args.installer_version
> >          if args.directory:
> >              install_dir =3D args.directory
> >              ret =3D subprocess.call("%s -d %s -y" %
> >                                    (tmpbuildtools, install_dir),
> shell=3DTrue)
> >          else:
> > +            install_dir =3D "/opt/poky/%s" % args.installer_version
> >              ret =3D subprocess.call("%s -y" % tmpbuildtools, shell=3D=
True)
> >          if ret !=3D 0:
> >              logger.error("Could not run buildtools installer")
> > @@ -238,7 +242,8 @@ def main():
> >              tool =3D 'gcc'
> >          else:
> >              tool =3D 'tar'
> > -        proc =3D subprocess.run("source
> %s/environment-setup-x86_64-pokysdk-linux && which %s" %
> > +        logger.debug("install_dir: %s" % install_dir)
> > +        proc =3D subprocess.run(".
> %s/environment-setup-x86_64-pokysdk-linux && which %s" %
> >                                (install_dir, tool),
> >                                shell=3DTrue, stdout=3Dsubprocess.PIPE)
> >          which_tool =3D proc.stdout.decode("utf-8")
> > --
> > 2.24.0
> >
> >
>=20
>

--0000000000003da36c05a2416a41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Apr 1, 2020 at 1:09 PM Andre McCurdy &lt;<a href=
=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On Mon, Mar 30, 2020 at 12:43 PM Tim Orlin=
g<br>
&lt;<a href=3D"mailto:timothy.t.orling@linux.intel.com" target=3D"_blank">=
timothy.t.orling@linux.intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; * Install directory defaults to scripts/../buildtools<br>
&gt;=C2=A0 =C2=A0e.g. --directory is set by default<br>
&gt;=C2=A0 =C2=A0This avoids the user having to type in their sudo passwor=
d<br>
&gt;=C2=A0 =C2=A0to install in /opt/poky/&lt;installer-version&gt;<br>
&gt;<br>
&gt; * Use &quot;.&quot; rather than &quot;source&quot; for sourcing the e=
nvironment script<br>
&gt;=C2=A0 =C2=A0as not all distros (e.g. Debian) have &quot;source&quot; =
by default.<br>
&gt;<br>
&gt; * Add buildtools/ to .gitignore<br>
&gt;<br>
&gt; * Fix typos in example usage (--install-version -&gt; --installer-ver=
sion)<br>
&gt;<br>
&gt; [YOCTO #13832]<br>
&gt;<br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:timothy.t.orling@linu=
x.intel.com" target=3D"_blank">timothy.t.orling@linux.intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .gitignore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 scripts/install-buildtools | 13 +++++++++----<br>
&gt;=C2=A0 2 files changed, 10 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/.gitignore b/.gitignore<br>
&gt; index d0e6b2fb89..b66d371aac 100644<br>
&gt; --- a/.gitignore<br>
&gt; +++ b/.gitignore<br>
&gt; @@ -9,6 +9,7 @@ pstage/<br>
&gt;=C2=A0 scripts/oe-git-proxy-socks<br>
&gt;=C2=A0 sources/<br>
&gt;=C2=A0 meta-*/<br>
&gt; +buildtools/<br>
&gt;=C2=A0 !meta-skeleton<br>
&gt;=C2=A0 !meta-selftest<br>
&gt;=C2=A0 hob-image-*.bb<br>
&gt; diff --git a/scripts/install-buildtools b/scripts/install-buildtools<=
br>
&gt; index 0947e9c4d6..49cab1345a 100755<br>
&gt; --- a/scripts/install-buildtools<br>
&gt; +++ b/scripts/install-buildtools<br>
&gt; @@ -17,7 +17,7 @@<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 $ install-buildtools \<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --base-url <a href=3D"http:=
//downloads.yoctoproject.org/releases/yocto" rel=3D"noreferrer" target=3D"_=
blank">http://downloads.yoctoproject.org/releases/yocto</a> \<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --release yocto-3.1_M2 \<br=
>
&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --install-version 3.0+snapshot<b=
r>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --installer-version 3.0+snapshot=
<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --build-date 202000122<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 #=C2=A0 Example usage (standard buildtools from release):<br>
&gt; @@ -29,7 +29,7 @@<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 $ install-buildtools --without-ext=
ended-buildtools \<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --base-url <a href=3D"http:=
//downloads.yoctoproject.org/releases/yocto" rel=3D"noreferrer" target=3D"_=
blank">http://downloads.yoctoproject.org/releases/yocto</a> \<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --release yocto-3.0.2 \<br>
&gt; -#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --install-version 3.0.2<br>
&gt; +#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --installer-version 3.0.2<br>
&gt;=C2=A0 #<br>
&gt;<br>
&gt;=C2=A0 import argparse<br>
&gt; @@ -59,6 +59,7 @@ if not bitbakepath:<br>
&gt;=C2=A0 PROGNAME =3D &#39;install-buildtools&#39;<br>
&gt;=C2=A0 logger =3D scriptutils.logger_create(PROGNAME, stream=3Dsys.std=
out)<br>
&gt;<br>
&gt; +DEFAULT_INSTALL_DIR: str =3D os.path.join(os.path.split(scripts_path=
)[0],&#39;buildtools&#39;)<br>
<br>
It looks like there are some assumptions about the minimum version of<br>
python3 on the host in order to even be able to run<br>
install-buildtools. Should that be checked explicitly?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">To be honest, e=
verything was written on CentOS-7, where =E2=80=98python3=E2=80=99 is now p=
ython36.</div><div dir=3D"auto"><br></div><div dir=3D"auto">The remaining s=
upported holdout for 3.4 is Debian-8 (Jessie). Which also happens to have t=
ar 1.27. At least it has git 2.1.4, so it=E2=80=99s not a complete mess.</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">Python 3.4 is already EOL.=
 We should not support it for the complete build system, but I can see that=
 the install-buildtools script should ideally still run on python34. The wh=
ole point is to make it easier to install the pre-built buildtools.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Debian-8 is EOL in June 2020.</=
div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
&gt;=C2=A0 DEFAULT_BASE_URL: str =3D &#39;<a href=3D"http://downloads.yoct=
oproject.org/releases/yocto" rel=3D"noreferrer" target=3D"_blank">http://do=
wnloads.yoctoproject.org/releases/yocto</a>&#39;<br>
&gt;=C2=A0 DEFAULT_RELEASE: str =3D &#39;yocto-3.1_M2&#39;<br>
&gt;=C2=A0 DEFAULT_INSTALLER_VERSION: str =3D &#39;3.0+snapshot&#39;<br>
&gt; @@ -66,6 +67,7 @@ DEFAULT_BUILDDATE: str =3D &quot;20200122&quot;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 def main():<br>
&gt; +=C2=A0 =C2=A0 global DEFAULT_INSTALL_DIR<br>
&gt;=C2=A0 =C2=A0 =C2=A0 global DEFAULT_BASE_URL<br>
&gt;=C2=A0 =C2=A0 =C2=A0 global DEFAULT_RELEASE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 global DEFAULT_INSTALLER_VERSION<br>
&gt; @@ -73,6 +75,7 @@ def main():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 filename: str =3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 release: str =3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 buildtools_url: str =3D &quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 install_dir: str =3D &quot;&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 parser =3D argparse.ArgumentParser(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 description=3D&quot;Buildtools inst=
allation helper&quot;,<br>
&gt; @@ -87,6 +90,7 @@ def main():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;(optional)\nRequires --url&#=
39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 action=3D&#39;store&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 parser.add_argument(&#39;-d&#39;, &#39;--director=
y&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 default=3DDEFAULT_INSTALL_DIR,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 help=3D&#39;directory where buildtools SDK will be in=
stalled (optional)&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 action=3D&#39;store&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 parser.add_argument(&#39;-r&#39;, &#39;--release&=
#39;,<br>
&gt; @@ -216,12 +220,12 @@ def main():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 st =3D os.stat(tmpbuildtools)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chmod(tmpbuildtools, st.st_mode =
| stat.S_IEXEC)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(os.stat(tmpbuildtools)=
)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 install_dir =3D &quot;/opt/poky/%s&quot;=
 % args.installer_version<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if args.directory:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install_dir =3D args.=
directory<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D subprocess.ca=
ll(&quot;%s -d %s -y&quot; %<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (tmpbuildtools, in=
stall_dir), shell=3DTrue)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install_dir =3D &quot;/opt=
/poky/%s&quot; % args.installer_version<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D subprocess.ca=
ll(&quot;%s -y&quot; % tmpbuildtools, shell=3DTrue)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ret !=3D 0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.error(&quot;Co=
uld not run buildtools installer&quot;)<br>
&gt; @@ -238,7 +242,8 @@ def main():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tool =3D &#39;gcc&#39=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tool =3D &#39;tar&#39=
;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 proc =3D subprocess.run(&quot;source %s/=
environment-setup-x86_64-pokysdk-linux &amp;&amp; which %s&quot; %<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.debug(&quot;install_dir: %s&quot;=
 % install_dir)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 proc =3D subprocess.run(&quot;. %s/envir=
onment-setup-x86_64-pokysdk-linux &amp;&amp; which %s&quot; %<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (install_dir, tool),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shell=3DTrue, stdout=3Dsubproces=
s.PIPE)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 which_tool =3D proc.stdout.decode(&=
quot;utf-8&quot;)<br>
&gt; --<br>
&gt; 2.24.0<br>
&gt;<br>
&gt; <br>
<br>
</blockquote></div></div>

--0000000000003da36c05a2416a41--
