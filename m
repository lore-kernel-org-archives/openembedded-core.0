Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id CB4B577375
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 17:01:21 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id y8so115702914igp.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 09:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EswpEaIPHwjDp6GYfGrKNlXdldrZaV7LL07kaN9whhY=;
	b=j7lZ6R3lga2m4G+NnODhyOPjGO6IHImiOmww52dNhap5lK3x8CB4UIHV+m83GO5fQD
	vFSDK0+GfcMwQQSUmLJNSj+3n6aPdO1FBtCRA1n5ridvjXZ9GWA7QiyFoFN33QvZ0F4E
	KTRrcu1p14fK71cpcKTGh5tq5oSGXPxIEPKdYhsa/rCBH2f3Atuw24eJUFR/zt9da32D
	3WVZq8a28TmtxSg1WVXgP86G45zhqU+GQ4hhhLvjXuLRGDWPYHEr52foQr7BJNLs3MPc
	pf6c+rJF+O6Y4YSnq3mR+8FgYS0QbjSLkbEcZXTgrLoL784h5xv6G0i4fi/MP8RcHeP7
	hIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EswpEaIPHwjDp6GYfGrKNlXdldrZaV7LL07kaN9whhY=;
	b=Xau31weY60n0Yf7xU1Pvo1ePmTR8+er7XrBCXU9lWNQko0aO3j/Izex6IXsa441GoC
	viwd43f9Xj+tTK7jq3Xp6Mwn+jTeuG/e7/6B4pEq6zAHTAzNqGfyJsDemwhE1bfsQjqM
	RAvA4KMNmM11jIXQhcmSmJOrXQbGsgZ9FTz5grwtNM+ucai19KHnSCyTku3QYr8gTHdN
	GOQB5mKvKf9vxpzwVwzXhY0BFm0ntSYzuia3EjRoUUqXoOtXuMGynqwDcEbGOVSdbxIg
	4HxwMr/bWN6belH30jX/fHoAitClAefo/v/OhTGvp1IuHH6AMzJ7sQq8f/MNnQeExe08
	nlLA==
X-Gm-Message-State: AG10YORd0M7apIPvdiGuAQe1IhjDaDFJEQNgQ4xAPGQarNz8cHL50G57Ap28D7fNQzkcShZ7NicF97kkGFm1iHid
X-Received: by 10.50.43.226 with SMTP id z2mr18790046igl.78.1456246880487;
	Tue, 23 Feb 2016 09:01:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 23 Feb 2016 09:01:00 -0800 (PST)
In-Reply-To: <CAJTo0LZStmCCA_ibNnxWO66CR+G3k51+bYVX2PrujJ2XD6mk2w@mail.gmail.com>
References: <cover.1456195451.git.kai.kang@windriver.com>
	<72d89d471771ecffc8eecc923581d3dcdcfdfa5e.1456195451.git.kai.kang@windriver.com>
	<CAJTo0LZStmCCA_ibNnxWO66CR+G3k51+bYVX2PrujJ2XD6mk2w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Feb 2016 17:01:00 +0000
Message-ID: <CAJTo0LbCLQDSEHi+MHz-+=RoHmkvFinEPTZWEdA0GzWQOp03Zw@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] useradd_base.bbclass: fix simultaneous with flock
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
X-List-Received-Date: Tue, 23 Feb 2016 17:01:22 -0000
Content-Type: multipart/alternative; boundary=047d7bfea0f4049071052c72e6f7

--047d7bfea0f4049071052c72e6f7
Content-Type: text/plain; charset=UTF-8

On 23 February 2016 at 16:29, Burton, Ross <ross.burton@intel.com> wrote:

> I got an error when openssh's do_install was running useradds to the
> sysroot:
>
> | DEBUG: Executing shell function useradd_sysroot
> | Running useradd commands...
> |
> /data/poky-master/tmp-glibc/work/core2-32-poky-linux/openssh/7.1p2-r0/temp/run.useradd_sysroot.13825:
> 264: local: /data/poky-master/tmp-glibc/sysroots/intel-core2-32: bad
> variable name
> | WARNING: exit code 2 from a shell command.
> | ERROR: Function failed: useradd_sysroot (log file is located at
> /data/poky-master/tmp-glibc/work/core2-32-poky-linux/openssh/7.1p2-r0/temp/log.do_install.13825)
> ERROR: Task 2939 (/home/ross/Yocto/poky/meta/recipes-connectivity/openssh/
> openssh_7.1p2.bb, do_install) failed with exit code '1'
>
>     262 perform_useradd() {
>     263         local rootdir="$1"
>     264         local opts=`echo $2 | sed s/\'/\"/g`
>     265         bbnote "openssh: Performing useradd with [$opts]"
>

The *amazing* BB_VERBOSE_LOGS option (set to 1 in local.conf to get all
shell scripts to do set -x) tells me this is due to missing quotes around
the opts assignment:

+ local opts=--root /data/poky-master/tmp-glibc/sysroots/intel-core2-32
--system --no-create-home --home-dir /var/run/sshd --shell /bin/false
--user-group sshd
/data/poky-master/tmp-glibc/work/core2-32-poky-linux/openssh/7.1p2-r0/temp/run.useradd_sysroot.16570:
264: local: /data/poky-master/tmp-glibc/sysroots/intel-core2-32: bad
variable name

Ross

--047d7bfea0f4049071052c72e6f7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 February 2016 at 16:29, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D=
"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex"><div class=3D"gmail_extra">I got an e=
rror when openssh&#39;s do_install was running useradds to the sysroot:</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div clas=
s=3D"gmail_extra">| DEBUG: Executing shell function useradd_sysroot</div><d=
iv class=3D"gmail_extra">| Running useradd commands...</div><div class=3D"g=
mail_extra">| /data/poky-master/tmp-glibc/work/core2-32-poky-linux/openssh/=
7.1p2-r0/temp/run.useradd_sysroot.13825: 264: local: /data/poky-master/tmp-=
glibc/sysroots/intel-core2-32: bad variable name</div><div class=3D"gmail_e=
xtra">| WARNING: exit code 2 from a shell command.</div><div class=3D"gmail=
_extra">| ERROR: Function failed: useradd_sysroot (log file is located at /=
data/poky-master/tmp-glibc/work/core2-32-poky-linux/openssh/7.1p2-r0/temp/l=
og.do_install.13825)</div><div class=3D"gmail_extra">ERROR: Task 2939 (/hom=
e/ross/Yocto/poky/meta/recipes-connectivity/openssh/<a href=3D"http://opens=
sh_7.1p2.bb" target=3D"_blank">openssh_7.1p2.bb</a>, do_install) failed wit=
h exit code &#39;1&#39;</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra"><div class=3D"gmail_extra">=C2=A0 =C2=A0 262 perform_user=
add() {</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 263 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 local rootdir=3D&quot;$1&quot;</div><div class=3D"gmail_extra">=
=C2=A0 =C2=A0 264 =C2=A0 =C2=A0 =C2=A0 =C2=A0 local opts=3D`echo $2 | sed s=
/\&#39;/\&quot;/g`</div><div class=3D"gmail_extra">=C2=A0 =C2=A0 265 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 bbnote &quot;openssh: Performing useradd with [$opts]=
&quot;</div></div></div></blockquote></div><br>The *amazing* BB_VERBOSE_LOG=
S option (set to 1 in local.conf to get all shell scripts to do set -x) tel=
ls me this is due to missing quotes around the opts assignment:</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gma=
il_extra">+ local opts=3D--root /data/poky-master/tmp-glibc/sysroots/intel-=
core2-32 --system --no-create-home --home-dir /var/run/sshd --shell /bin/fa=
lse --user-group sshd</div><div class=3D"gmail_extra">/data/poky-master/tmp=
-glibc/work/core2-32-poky-linux/openssh/7.1p2-r0/temp/run.useradd_sysroot.1=
6570: 264: local: /data/poky-master/tmp-glibc/sysroots/intel-core2-32: bad =
variable name</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Ross</div></div></div>

--047d7bfea0f4049071052c72e6f7--
