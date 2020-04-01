Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com [209.85.222.67])
 by mx.groups.io with SMTP id smtpd.web11.1175.1585779007849116215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 15:10:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aU0YKdTZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.67, mailfrom: armccurdy@gmail.com)
Received: by mail-ua1-f67.google.com with SMTP id m18so417841uap.9
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2020 15:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9XxkV7kI1CR8+fPmJBVdVvu2rVE28UtdNg4QDAAAhgU=;
        b=aU0YKdTZhXzwICWtbGnoMCe0a/ZtOkB8G6wF+cSFleGjae4cLhcLFjR6/y+ASw+SSx
         k9FzrmOSdFzs/8hcZSvQcKRwJvVkocqt69D5plQJLmwBLfFy0GDrWfI/m/hWSGS3akxu
         2SI4PpXKRmhlw6jc3dRCd6cf+nQqw5YD87TFCKKMNeXAwOaceMLtOUeQszsJDiDPrrd1
         447AkXkEMgYIz6e2z9MVZmsHVxmJPG93iLeLyxepn61jZEnADeXyspASrqEsAIYk24HQ
         mxWUee5Y5yRUxf1wRg04JnjzoZ0T5Gun8TxbDcoImKyGXBdLIaC2daOp31j8G/o3vdWJ
         LJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9XxkV7kI1CR8+fPmJBVdVvu2rVE28UtdNg4QDAAAhgU=;
        b=dxlENdzmNvaLvA2xA2Hj9wf7QWt529p6f3WGfrl0B1EX7o2pJz0+1pFtXvPYvybiMe
         y9cLstgzudZcgrYoFANFzw+WNW8Lh8DBkgNg7uOL1H8CnjGMzojyZUpN+v1ywMK2Culb
         GzjSbz3fh80tLI/6Fy1dHn5Skx5vflafyg6TzqwxuCkyEwQuDyQzV1ei3Ewv6XhSkrEo
         9W/p96cPy3HPadFmjBCng6nViSMVSWVZA3FmshwU5IDP0kNfXv4YUdbngkgSAFZOGTj8
         6JUxtG0jKgG9bzj2vif+Jnzeo6sSGp25jHB/0GYVLcylw5DZLEZGyrd0Q8/9JOooGtsG
         L7HA==
X-Gm-Message-State: AGi0PubunaYkaO1VhkfEQU5n+2M1Bhryl4GxKtVwKb6kunt1G3fBuZn9
	2/+p5XsOvyaSAPsZg/cQBI/4AJg8lKmok8/7MIo=
X-Google-Smtp-Source: APiQypIlow8Q60sLO48UB08TGgsDuEuhmJL2ZvCfxEUKCZHEtLkZ1U+FoV9dgvTKAm5U6Gfd9Y8jtsu1/GYYgO+89jY=
X-Received: by 2002:ab0:2b90:: with SMTP id q16mr494952uar.82.1585779006693;
 Wed, 01 Apr 2020 15:10:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200330194302.30032-1-timothy.t.orling@linux.intel.com>
 <CAJ86T=XCX7MGRVzoTzaaD3Xe9FqdWM9zX2Zha5Mk8Zo2y1MRVg@mail.gmail.com>
 <1601CF873C42565A.6346@lists.openembedded.org> <CANx9H-BNf9ubLHJr3V_2ZAHcpucYooRtXkA9bOJ8_Q1_aPQmjw@mail.gmail.com>
In-Reply-To: <CANx9H-BNf9ubLHJr3V_2ZAHcpucYooRtXkA9bOJ8_Q1_aPQmjw@mail.gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 1 Apr 2020 15:09:57 -0700
Message-ID: <CAJ86T=WwkHPTyi4K7jg0=XOV4OgSGAjN8NcYhQ8JvUY5JY7jxw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] scripts/install-buildtools: improvements
To: Tim Orling <ticotimo@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Tim Orling <timothy.t.orling@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2020 at 3:02 PM Tim Orling <ticotimo@gmail.com> wrote:
> On Wed, Apr 1, 2020 at 2:32 PM Tim Orling via lists.openembedded.org <ti=
cotimo=3Dgmail.com@lists.openembedded.org> wrote:
>> On Wed, Apr 1, 2020 at 1:09 PM Andre McCurdy <armccurdy@gmail.com> wrot=
e:
>>>
>>> On Mon, Mar 30, 2020 at 12:43 PM Tim Orling
>>> <timothy.t.orling@linux.intel.com> wrote:
>>> >
>>> > * Install directory defaults to scripts/../buildtools
>>> >   e.g. --directory is set by default
>>> >   This avoids the user having to type in their sudo password
>>> >   to install in /opt/poky/<installer-version>
>>> >
>>> > * Use "." rather than "source" for sourcing the environment script
>>> >   as not all distros (e.g. Debian) have "source" by default.
>>> >
>>> > * Add buildtools/ to .gitignore
>>> >
>>> > * Fix typos in example usage (--install-version -> --installer-versi=
on)
>>> >
>>> > [YOCTO #13832]
>>> >
>>> > Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
>>> > ---
>>> >  .gitignore                 |  1 +
>>> >  scripts/install-buildtools | 13 +++++++++----
>>> >  2 files changed, 10 insertions(+), 4 deletions(-)
>>> >
>>> > diff --git a/.gitignore b/.gitignore
>>> > index d0e6b2fb89..b66d371aac 100644
>>> > --- a/.gitignore
>>> > +++ b/.gitignore
>>> > @@ -9,6 +9,7 @@ pstage/
>>> >  scripts/oe-git-proxy-socks
>>> >  sources/
>>> >  meta-*/
>>> > +buildtools/
>>> >  !meta-skeleton
>>> >  !meta-selftest
>>> >  hob-image-*.bb
>>> > diff --git a/scripts/install-buildtools b/scripts/install-buildtools
>>> > index 0947e9c4d6..49cab1345a 100755
>>> > --- a/scripts/install-buildtools
>>> > +++ b/scripts/install-buildtools
>>> > @@ -17,7 +17,7 @@
>>> >  #        $ install-buildtools \
>>> >  #          --base-url http://downloads.yoctoproject.org/releases/yo=
cto \
>>> >  #          --release yocto-3.1_M2 \
>>> > -#          --install-version 3.0+snapshot
>>> > +#          --installer-version 3.0+snapshot
>>> >  #          --build-date 202000122
>>> >  #
>>> >  #  Example usage (standard buildtools from release):
>>> > @@ -29,7 +29,7 @@
>>> >  #        $ install-buildtools --without-extended-buildtools \
>>> >  #          --base-url http://downloads.yoctoproject.org/releases/yo=
cto \
>>> >  #          --release yocto-3.0.2 \
>>> > -#          --install-version 3.0.2
>>> > +#          --installer-version 3.0.2
>>> >  #
>>> >
>>> >  import argparse
>>> > @@ -59,6 +59,7 @@ if not bitbakepath:
>>> >  PROGNAME =3D 'install-buildtools'
>>> >  logger =3D scriptutils.logger_create(PROGNAME, stream=3Dsys.stdout)
>>> >
>>> > +DEFAULT_INSTALL_DIR: str =3D os.path.join(os.path.split(scripts_pat=
h)[0],'buildtools')
>>>
>>> It looks like there are some assumptions about the minimum version of
>>> python3 on the host in order to even be able to run
>>> install-buildtools. Should that be checked explicitly?
>>
>>
>> To be honest, everything was written on CentOS-7, where =E2=80=98python=
3=E2=80=99 is now python36.
>>
>> The remaining supported holdout for 3.4 is Debian-8 (Jessie). Which als=
o happens to have tar 1.27. At least it has git 2.1.4, so it=E2=80=99s not =
a complete mess.
>>
>> Python 3.4 is already EOL. We should not support it for the complete bu=
ild system, but I can see that the install-buildtools script should ideally=
 still run on python34. The whole point is to make it easier to install the=
 pre-built buildtools.
>
> Python 3.5 is now required in bitbake/lib/bb/__init__.py
> Which is needed for bb.utils.md5sum_file and sha256_file to check the ch=
ecksum of the download. I=E2=80=99d rather not have to rewrite those functi=
ons.

Looks like copy and pasting ~30 lines? Maybe not even much of a net
increase in code size if you can remove the existing code to check
that bitbake libs are available...

def _hasher(method, filename):
    import mmap

    with open(filename, "rb") as f:
        try:
            with mmap.mmap(f.fileno(), 0, access=3Dmmap.ACCESS_READ) as mm=
:
                for chunk in iter(lambda: mm.read(8192), b''):
                    method.update(chunk)
        except ValueError:
            # You can't mmap() an empty file so silence this exception
            pass
    return method.hexdigest()

def md5_file(filename):
    """
    Return the hex string representation of the MD5 checksum of filename.
    """
    import hashlib
    return _hasher(hashlib.md5(), filename)

def sha256_file(filename):
    """
    Return the hex string representation of the 256-bit SHA checksum of
    filename.
    """
    import hashlib
    return _hasher(hashlib.sha256(), filename)


>> Debian-8 is EOL in June 2020.
>>
>>>
>>> >  DEFAULT_BASE_URL: str =3D 'http://downloads.yoctoproject.org/releas=
es/yocto'
>>> >  DEFAULT_RELEASE: str =3D 'yocto-3.1_M2'
>>> >  DEFAULT_INSTALLER_VERSION: str =3D '3.0+snapshot'
>>> > @@ -66,6 +67,7 @@ DEFAULT_BUILDDATE: str =3D "20200122"
>>> >
>>> >
>>> >  def main():
>>> > +    global DEFAULT_INSTALL_DIR
>>> >      global DEFAULT_BASE_URL
>>> >      global DEFAULT_RELEASE
>>> >      global DEFAULT_INSTALLER_VERSION
>>> > @@ -73,6 +75,7 @@ def main():
>>> >      filename: str =3D ""
>>> >      release: str =3D ""
>>> >      buildtools_url: str =3D ""
>>> > +    install_dir: str =3D ""
>>> >
>>> >      parser =3D argparse.ArgumentParser(
>>> >          description=3D"Buildtools installation helper",
>>> > @@ -87,6 +90,7 @@ def main():
>>> >                               '(optional)\nRequires --url',
>>> >                          action=3D'store')
>>> >      parser.add_argument('-d', '--directory',
>>> > +                        default=3DDEFAULT_INSTALL_DIR,
>>> >                          help=3D'directory where buildtools SDK will=
 be installed (optional)',
>>> >                          action=3D'store')
>>> >      parser.add_argument('-r', '--release',
>>> > @@ -216,12 +220,12 @@ def main():
>>> >          st =3D os.stat(tmpbuildtools)
>>> >          os.chmod(tmpbuildtools, st.st_mode | stat.S_IEXEC)
>>> >          logger.debug(os.stat(tmpbuildtools))
>>> > -        install_dir =3D "/opt/poky/%s" % args.installer_version
>>> >          if args.directory:
>>> >              install_dir =3D args.directory
>>> >              ret =3D subprocess.call("%s -d %s -y" %
>>> >                                    (tmpbuildtools, install_dir), she=
ll=3DTrue)
>>> >          else:
>>> > +            install_dir =3D "/opt/poky/%s" % args.installer_version
>>> >              ret =3D subprocess.call("%s -y" % tmpbuildtools, shell=
=3DTrue)
>>> >          if ret !=3D 0:
>>> >              logger.error("Could not run buildtools installer")
>>> > @@ -238,7 +242,8 @@ def main():
>>> >              tool =3D 'gcc'
>>> >          else:
>>> >              tool =3D 'tar'
>>> > -        proc =3D subprocess.run("source %s/environment-setup-x86_64=
-pokysdk-linux && which %s" %
>>> > +        logger.debug("install_dir: %s" % install_dir)
>>> > +        proc =3D subprocess.run(". %s/environment-setup-x86_64-poky=
sdk-linux && which %s" %
>>> >                                (install_dir, tool),
>>> >                                shell=3DTrue, stdout=3Dsubprocess.PIP=
E)
>>> >          which_tool =3D proc.stdout.decode("utf-8")
>>> > --
>>> > 2.24.0
>>> >
>>> >
>>>
>>=20
