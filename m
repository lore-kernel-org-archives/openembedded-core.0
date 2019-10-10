Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id EECDA6D56C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 10:02:21 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id s7so3525701vsl.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 03:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1GLkna3bVk0boe9S3C6CNFSoGqov51Ycf+qGHGqE1zE=;
	b=B/qcclqF429XSYt2hJZXQi7lUZs9QHyx7B++RBT024nwrUWLM05spw6YQRMY04Noxj
	IZxSQpUEFrFkHCphqRyF4wCJSTfLcufMpdel0T/OqPYCQnAuskYrgqgqZwWCsCze9XqJ
	HftxH55aXCv+yOvbOcec8s1VhlZhkwqW1xXnb+PXlNzhEGOlGcdScTBVILa04H5OY/OY
	8ff3d+TPb1Wn20YNsEMZmcdtAkn87ep/zRe0xYFUhS/zrebkvGAbADSavyvMxgdRKKz+
	J154bNqHFjvNSxKUoF5Luf1b90YkWhEX5DwJKgPKj37n0VG9ScWO2hELv0g07Sm/d8eL
	k1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1GLkna3bVk0boe9S3C6CNFSoGqov51Ycf+qGHGqE1zE=;
	b=GIBSxNbaxT0mcQuuhPhbYdBH9Ft6PWBfWOh04eHqj8LQG80IZWLwRe8qhWZ4v2VTu1
	1DhRSM5SzkMeiqjFgtzePSzP2ChCGMxr7CN/VJY7uI7tEI1cSJVRTjSmNYeadm8PsWzh
	8kOXStxo0xZUs3btfw965brAKKFEUhyMwWpngXf774wdnQN7SaNEaJfkUOYZ5j+jyVcJ
	zT8HU1PrvgmFHq4kh2f35DXtaiMGemervZzjyrN0VaOnbGGWX1g0ytzu+ykvz+zZi15k
	KY6xecTu7sOEku1pDo2QY/aEe+Yn4tNGWmR7l/K66vwH2hWRHIGF9o9Z2eTd548CLg5B
	HCYA==
X-Gm-Message-State: APjAAAWvw8iR0IOyE5anQcKlZ7XMFeEQ4B84mDVn+/tIi/qJHmuT4H1Y
	JP+88dKF/vJ+R7yp+qaLUX8eIUGB/y13UM1Y7UilEB0L
X-Google-Smtp-Source: APXvYqyHrhFhN0tfVatBXpzkaarTAJ12Y58HCybwOLCqQDXSnTNcpFc2OI/Ni/6Pz3bFOXrjTrfqyBLNIFJXDNl9jnU=
X-Received: by 2002:a67:ea09:: with SMTP id g9mr5121208vso.23.1570701742749;
	Thu, 10 Oct 2019 03:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1567169002.git.alex.kanavin@gmail.com>
	<874b5e653ac604a410f2290e0b97ad7acb4a0d39.1567169002.git.alex.kanavin@gmail.com>
	<3625c508-3380-25b3-aacd-63543d3782b1@windriver.com>
In-Reply-To: <3625c508-3380-25b3-aacd-63543d3782b1@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Oct 2019 12:02:11 +0200
Message-ID: <CANNYZj_SOSotWpU_rBema9Pt_RAcdqAYws3Pxs=7JmwXK3Wz3w@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/13] qemu: switch to '-vga std' emulated hardware from vmware/cirrus for x86/mips
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
X-List-Received-Date: Thu, 10 Oct 2019 10:02:22 -0000
Content-Type: multipart/alternative; boundary="0000000000006cbe3105948b7f2e"

--0000000000006cbe3105948b7f2e
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Oct 2019 at 08:16, Changqing Li <changqing.li@windriver.com>
wrote:

> After switch from -vga vmware to -vga std (use qemux86-64),  start image
> by "runqemu nographic",
>
> Memory used by process Xorg raised a lot,   for my image,   from ~%7 to
> ~%34 (check by ps aux --sort -rss)
>
> also check memory by command "systemctl status xserver-nodm",  raised from
> ~60M to ~120M.
>
> with the high raise of memory usage of Xorg, when run oe-test on the
> target,  OOM is happened like:
>
> [ 1038.221438] *Out of memory*: Killed process 180 (Xorg)
> total-vm:335368kB, anon-rss:68824kB, file-rss:0kB, shmem-rss:140kB
>
>
> Also test with poky distro,  and image core-image-sato, also installed
> procps.
>
> 1. "ps aux --sort -rss":  Xorg from  ~3.6%  to ~ 17.4%
>
> 2. "systemctl status xserver-nodm":  from ~65M to ~131M
>
>
> Any idea about how to resolve this problem?  do we really need unify all
> boards to -vga=std? Thanks.
>

The increased memory usage is due to glamor loading the full 3D stack, mesa
and friends. You can drop opengl from DISTRO_FEATURES, or otherwise disable
glamor in xorg recipe via PACKAGECONFIG.

Or you can bump the available RAM for your image like is already done for
core-image-sato.

Alex

--0000000000006cbe3105948b7f2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 10 Oct 2019 at 08:16, Changqing L=
i &lt;<a href=3D"mailto:changqing.li@windriver.com">changqing.li@windriver.=
com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF">After switch from -vga vmware to -vga std (use q=
emux86-64),=C2=A0
      start image by &quot;runqemu nographic&quot;, <br>
   =20
    <p>Memory used by process Xorg raised a lot,=C2=A0=C2=A0 for my image,=
=C2=A0=C2=A0 from
      ~%7 to ~%34 (check by ps aux --sort -rss)<br>
    </p>
    <p>also check memory by command &quot;systemctl status xserver-nodm&quo=
t;,=C2=A0
      raised from ~60M to ~120M.</p>
    <p>with the high raise of memory usage of Xorg, when run oe-test on
      the target,=C2=A0 OOM is happened like:</p>
    <p><span style=3D"color:rgb(51,51,51);font-family:Arial,sans-serif;font=
-size:14px;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(245,245,245);text-decoration-style:initial;text-decoration-color:ini=
tial;display:inline;float:none">[
        1038.221438]<span>=C2=A0</span></span><b style=3D"color:rgb(51,51,5=
1);font-family:Arial,sans-serif;font-size:14px;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;letter-spacing:normal;text-ali=
gn:start;text-indent:0px;text-transform:none;white-space:normal;word-spacin=
g:0px;background-color:rgb(245,245,245);text-decoration-style:initial;text-=
decoration-color:initial">Out of memory</b><span style=3D"color:rgb(51,51,5=
1);font-family:Arial,sans-serif;font-size:14px;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(245,245,245);text-decoration-sty=
le:initial;text-decoration-color:initial;display:inline;float:none">: Kille=
d
        process 180 (Xorg) total-vm:335368kB, anon-rss:68824kB,
        file-rss:0kB, shmem-rss:140kB</span></p>
    <p><br>
    </p>
    <p>Also test with poky distro,=C2=A0 and image core-image-sato, also
      installed procps.<br>
    </p>
    <p>1. &quot;ps aux --sort -rss&quot;:=C2=A0 Xorg from=C2=A0 ~3.6%=C2=A0=
 to ~ 17.4%</p>
    <p>2. &quot;systemctl status xserver-nodm&quot;:=C2=A0 from ~65M to ~13=
1M</p>
    <p><br>
    </p>
    <p>Any idea about how to resolve this problem?=C2=A0 do we really need
      unify all boards to -vga=3Dstd? Thanks.</p></div></blockquote><div><b=
r></div><div>The increased memory usage is due to glamor loading the full 3=
D stack, mesa and friends. You can drop opengl from DISTRO_FEATURES, or oth=
erwise disable glamor in xorg recipe via PACKAGECONFIG.</div><div><br></div=
><div>Or you can bump the available RAM for your image like is already done=
 for core-image-sato.</div><div><br></div><div>Alex<br></div></div></div>

--0000000000006cbe3105948b7f2e--
