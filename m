Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6B7856F15E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 13:03:06 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id ma3so3864292pbc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 05:03:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=gH+r/OCZOkKo8nHEVkQwrYUxbEG796vSod3pqehNNbo=;
	b=jIQxIHCpdIFpE2Hydbla/d7YVB7zNMUYLdUtadyx+eZjyGLCI9WL6Kd9CSKeVavkCP
	hEwq01KYRj0rKl4XAmoBKRR9h/l9IoH69VRW4mvGpvTWLKfc0fw8dlB0rT9pZu34IQqt
	Ka++7WWGPE3H9f1F1niZKiyv97ZYjFn7iHVNw8IkdwzLtLvVlFkzX7UbzcOeL+d4ZCcb
	2S7EoTlpWhF/pIEq8GMb8+pnXdJczDrGz+jO3nL/Dakg+inEgzkuPVkxWV/6EsnwV+Th
	KYMR/wb6ZoYiqiPtdCZ6QAmZiPqmCDTDUQYrl0OAmy0gh9u1QvFC5FaPSYDajDTz+FSU
	c8pQ==
X-Gm-Message-State: ALoCoQn8OkMj6Ttu/vZITbbsIfI5+kLVqAJ1LrcKfcbhIYDzrib9PEacG3COOEqgEJ5YDzCw8Xw5
MIME-Version: 1.0
X-Received: by 10.68.249.100 with SMTP id yt4mr24912690pbc.165.1393246987593; 
	Mon, 24 Feb 2014 05:03:07 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.26.195 with HTTP; Mon, 24 Feb 2014 05:03:07 -0800 (PST)
In-Reply-To: <CAP71WjxHc6+9DDGeQsuAc3Cv7qN+bfPgNT-ju01z6pje3Q2qEg@mail.gmail.com>
References: <CAOMwXhNMs7top-CBCDf8Hgsxxz7=oBocF6YjbC_PhH1PDgYG0Q@mail.gmail.com>
	<CAP71Wjy4kX15uoz=_42+zRKS7i91TYnGM=2u35+tNXf7CFoaww@mail.gmail.com>
	<CAOMwXhMxcr_EVZx4uVnnpGvcq2MrMchHVUL5ApBdC+4bH7q_Yg@mail.gmail.com>
	<CAP71WjwR9Lrb1QeHPEXLGnPe+vcEnYtgMDoQZW-eNayOMubbKQ@mail.gmail.com>
	<CAOMwXhMz+_KcMzY1Stwi2g8EyFg+8BVajqrrvAX7Xd02qVNG9g@mail.gmail.com>
	<CAP71WjxHc6+9DDGeQsuAc3Cv7qN+bfPgNT-ju01z6pje3Q2qEg@mail.gmail.com>
Date: Mon, 24 Feb 2014 13:03:07 +0000
X-Google-Sender-Auth: YWpEK0YgNg-ASyhGmPnZhO5xy-c
Message-ID: <CAOMwXhOmeZfrzsmnssC77oUgMG5Ka4feFG1D+8Bas8WpDUpM=w@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Conf notes
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
X-List-Received-Date: Mon, 24 Feb 2014 13:03:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2014 at 12:49 PM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> On Mon, Feb 24, 2014 at 12:47 PM, Laszlo Papp <lpapp@kde.org> wrote:
>>> hmm. do you get any error message?
>>
>> Nope, I have been using this construction for several weeks now. The
>> local and bblayer samples have been extracted properly into the build
>> folder, so in that sense, there is no infrastructural change
>> introduced in here, just yet another file added in the folder.
>
> well, i don't see what can possibly go wrong then... especially if
> layers.conf.sample and bblayer sample files work fine... maybe adding
> "set -x" in the script would reveal something..

1) I use dylan if that matters.

2) cat ../meta-foo/conf/conf-notes.txt
Common targets are:
    core-image-minimal
    foo

You can also run generated qemu images with a command like 'runqemu qemux86=
'

3) set -x output

++ TEMPLATECONF=3Dmeta-foo/conf
++ . oe-init-build-env
+++ '[' -z '' ']'
+++ '[' xbash =3D x./oe-init-build-env ']'
+++ '[' -n oe-init-build-env ']'
++++ dirname oe-init-build-env
+++ OEROOT=3D.
++++ readlink -f .
+++ OEROOT=3D/home/lpapp/Projects/Yocto/poky-dylan-9.0.1
+++ export OEROOT
+++ . /home/lpapp/Projects/Yocto/poky-dylan-9.0.1/scripts/oe-buildenv-inter=
nal
++++ '[' -z /home/lpapp/Projects/Yocto/poky-dylan-9.0.1 ']'
++++ '[' x =3D x ']'
++++ '[' x =3D x ']'
++++ BDIR=3Dbuild
++++ expr build : '/.*'
+++++ pwd
++++ BUILDDIR=3D/home/lpapp/Projects/Yocto/poky-dylan-9.0.1/build
++++ unset BDIR
++++ BITBAKEDIR=3D/home/lpapp/Projects/Yocto/poky-dylan-9.0.1/bitbake/
+++++ readlink -f /home/lpapp/Projects/Yocto/poky-dylan-9.0.1/bitbake/
++++ BITBAKEDIR=3D/home/lpapp/Projects/Yocto/poky-dylan-9.0.1/bitbake
+++++ readlink -f /home/lpapp/Projects/Yocto/poky-dylan-9.0.1/build
++++ BUILDDIR=3D/home/lpapp/Projects/Yocto/poky-dylan-9.0.1/build
++++ test -d /home/lpapp/Projects/Yocto/poky-dylan-9.0.1/bitbake
++++ PATH=3D/home/lpapp/Projects/Yocto/poky-dylan-9.0.1/scripts:/home/lpapp=
/Projects/Yocto/poky-dylan-9.0.1/bitbake/bin/:/home/lpapp/Projects/Yocto/po=
ky-dylan-9.0.1/scripts:/home/lpapp/Projects/Yocto/poky-dylan-9.0.1/bitbake/=
bin/:/home/lpapp/Projects/Yocto/poky-dylan-9.0.1/scripts:/home/lpapp/Projec=
ts/Yocto/poky-dylan-9.0.1/bitbake/bin/:/home/lpapp/Projects/Yocto/poky-dyla=
n-9.0.1/scripts:/home/lpapp/Projects/Yocto/poky-dylan-9.0.1/bitbake/bin/:/h=
ome/lpapp/Projects/Yocto/poky-dylan-9.0.1/scripts:/home/lpapp/Projects/Yoct=
o/poky-dylan-9.0.1/bitbake/bin/:/usr/lib/colorgcc/bin/:/home/lpapp/bin:/usr=
/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
++++ unset BITBAKEDIR
++++ export BUILDDIR
++++ export PATH
++++ export 'BB_ENV_EXTRAWHITE=3DMACHINE DISTRO TCMODE TCLIBC http_proxy
ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID
SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS
PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD
SOCKS5_USER'
++++ BB_ENV_EXTRAWHITE=3D'MACHINE DISTRO TCMODE TCLIBC http_proxy
ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID
SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS
PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD
SOCKS5_USER'
+++ /home/lpapp/Projects/Yocto/poky-dylan-9.0.1/scripts/oe-setup-builddir
You had no conf/local.conf file. This configuration file has therefore been
created for you with some default values. You may wish to edit it to use a
different MACHINE (target hardware) or enable parallel build options to tak=
e
advantage of multiple cores for example. See the file for more information =
as
common configuration options are commented.

The Yocto Project has extensive documentation about OE including a
reference manual
which can be found at:
    http://yoctoproject.org/documentation

For more information about OpenEmbedded see their website:
    http://www.openembedded.org/

You had no conf/bblayers.conf file. The configuration file has been created=
 for
you with some default values. To add additional metadata layers into your
configuration please add entries to this file.

The Yocto Project has extensive documentation about OE including a
reference manual
which can be found at:
    http://yoctoproject.org/documentation

For more information about OpenEmbedded see their website:
    http://www.openembedded.org/



### Shell environment set up for builds. ###

You can now run 'bitbake <target>'

Common targets are:
    core-image-minimal
    core-image-sato
    meta-toolchain
    meta-toolchain-sdk
    adt-installer
    meta-ide-support

You can also run generated qemu images with a command like 'runqemu qemux86=
'

+++ '[' -n /home/lpapp/Projects/Yocto/poky-dylan-9.0.1/build ']'
+++ cd /home/lpapp/Projects/Yocto/poky-dylan-9.0.1/build
+++ unset OEROOT
+++ unset BBPATH
++ printf '\033_%s@%s:%s\033\' lpapp wheezy
'~/Projects/Yocto/poky-dylan-9.0.1/build'

