Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id DCB42783FC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Jul 2017 09:24:54 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id g13so29492192ioj.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Jul 2017 02:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=j1eNfyTKsH/lt8p7evJyMIASMSj5neBkwy9P7+Qr6Jw=;
	b=AFPvfY3KALOIOJ0i0PcWdrklolmdeCfquz8FIwD1kiFN3uaYzVhlJaLVELB7DTk/dd
	hS8HtUe3Lb45Jk2aUSqdj6Sn/s0372G+dZ5dXoOFqBfDR0goBBdvfLtwf72Nku6yG1ZO
	D2gkME3M10fMu2udZuaXm6IFUveJ9R2WvK8XbiJLKXD6gPjlVJ0LZ2SQDzxlLhOBUx2+
	xfP7+h4lA1qWPAl6w1L9LkuSvat8owdx3x/u/mZF9ou2WmgppS/JuTYNUd6ODf2L5wjG
	I/y+lpkzWtYWQDgCVU7VMdXTgDuHJLf6TWC97QcacQ4G1of8tk4fd3jYD//yNvuvD6+9
	SA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=j1eNfyTKsH/lt8p7evJyMIASMSj5neBkwy9P7+Qr6Jw=;
	b=i5BGusn3uWQurKN7FqtZqen1KLlAC8QyPR4BoPcq95kFa0+SHmZBGyTLRmoi/hIsbY
	fU2NxqoTCs1s4FxQi5R9l5bL2H/40N/wsZcxY2LiyosSJtQEm5pCMATQQdpuUDQTMAyJ
	wmVC9yqlrP9bhsWqdOfGp51aJt3UpaNChN+nHUTwWYC5d6QP+vpqGmXoodpHesyk8Hr/
	Zmb5nw8UJPXeGrLm/11WDXvRD9oR7wLOEEtzl3pVELxgaaBNTNCjk8O4qCyOWtdimBb0
	ETctzux+XGT7F4YSh4I2dWhpCPdNKJhzF+hZIpV1izAz5hY/lLswRz4KsIWmQVmCN1BY
	T+7g==
X-Gm-Message-State: AIVw112WZeJEFmsNXqCkzyWcoVhXHzEW//8ZKm/HmdKj+QiPke7XwcRO
	afcsn8Q1tzc15PtiZjRGtpmAmFlGRE3f
X-Received: by 10.107.170.212 with SMTP id g81mr10452647ioj.19.1500715495832; 
	Sat, 22 Jul 2017 02:24:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Sat, 22 Jul 2017 02:24:35 -0700 (PDT)
In-Reply-To: <dd968ff528a0928627a3bb12b4b1e8d77a1ff829.1500357604.git.dengke.du@windriver.com>
References: <cover.1500357604.git.dengke.du@windriver.com>
	<dd968ff528a0928627a3bb12b4b1e8d77a1ff829.1500357604.git.dengke.du@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 22 Jul 2017 10:24:35 +0100
Message-ID: <CAJTo0Lac01Ny9N5D0p8Qv+GCFXRNv0qF_BjGdXx4Q3zvc+1How@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] expat: upgrade to 2.2.2
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
X-List-Received-Date: Sat, 22 Jul 2017 09:24:55 -0000
Content-Type: multipart/alternative; boundary="001a11425b7009d8f70554e48e11"

--001a11425b7009d8f70554e48e11
Content-Type: text/plain; charset="UTF-8"

On 18 July 2017 at 07:01, Dengke Du <dengke.du@windriver.com> wrote:

>     using getrandom syscall on linux 3.17+, so when we compiling expat
> -native
>     on the kernel older than 3.17, that would be failed.
>

It's failing on Debian 8, which is kernel 4.9.0:

| ../expat-2.2.2/lib/xmlparse.c:56:3: error: #error You do not have support
for any sources of high quality entropy enabled. For end user security,
that is probably not what you want. Your options include: * Linux + glibc
>=2.25 (getrandom): HAVE_GETRANDOM, * Linux + glibc <2.25 (syscall
SYS_getrandom): HAVE_SYSCALL_GETRANDOM, * BSD / macOS (arc4random_buf):
HAVE_ARC4RANDOM_BUF, * libbsd (arc4random_buf): HAVE_ARC4RANDOM_BUF +
HAVE_LIBBSD, * Windows (RtlGenRandom): _WIN32. If insist on not using any
of these, bypass this error by defining XML_POOR_ENTROPY; you have been
warned. For CMake, one way to pass the define is: cmake
-DCMAKE_C_FLAGS="-pipe -O2 -DHAVE_SYSCALL_GETRANDOM" . If you have reasons
to patch this detection code away or need changes to the build system,
please open a bug. Thank you!

(
https://autobuilder.yocto.io/builders/nightly-ppc/builds/379/steps/BuildImages/logs/stdio
)

I suspect the detection code is well and truly broken.

Ross

--001a11425b7009d8f70554e48e11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 July 2017 at 07:01, Dengke Du <span dir=3D"ltr">&lt;<a href=3D"mailto=
:dengke.du@windriver.com" target=3D"_blank">dengke.du@windriver.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:=
rgb(204,204,204);padding-left:1ex"><div id=3D"gmail-:4tt" class=3D"gmail-a3=
s gmail-aXjCH gmail-m15d544a8ef991e51">=C2=A0 =C2=A0 using getrandom syscal=
l on linux 3.17+, so when we compiling <span class=3D"gmail-il">expat</span=
>-native<br>
=C2=A0 =C2=A0 on the kernel older than 3.17, that would be failed.<br></div=
></blockquote></div><br>It&#39;s failing on Debian 8, which is kernel 4.9.0=
:</div><br>| ../expat-2.2.2/lib/xmlparse.c:56:3: error: #error You do not h=
ave support for any sources of high quality entropy enabled. For end user s=
ecurity, that is probably not what you want. Your options include: * Linux =
+ glibc &gt;=3D2.25 (getrandom): HAVE_GETRANDOM, * Linux + glibc &lt;2.25 (=
syscall SYS_getrandom): HAVE_SYSCALL_GETRANDOM, * BSD / macOS (arc4random_b=
uf): HAVE_ARC4RANDOM_BUF, * libbsd (arc4random_buf): HAVE_ARC4RANDOM_BUF + =
HAVE_LIBBSD, * Windows (RtlGenRandom): _WIN32. If insist on not using any o=
f these, bypass this error by defining XML_POOR_ENTROPY; you have been warn=
ed. For CMake, one way to pass the define is: cmake -DCMAKE_C_FLAGS=3D&quot=
;-pipe -O2 -DHAVE_SYSCALL_GETRANDOM&quot; . If you have reasons to patch th=
is detection code away or need changes to the build system, please open a b=
ug. Thank you!<div><br></div><div>(<a href=3D"https://autobuilder.yocto.io/=
builders/nightly-ppc/builds/379/steps/BuildImages/logs/stdio">https://autob=
uilder.yocto.io/builders/nightly-ppc/builds/379/steps/BuildImages/logs/stdi=
o</a>)</div><div><br></div><div>I suspect the detection code is well and tr=
uly broken.</div><div><br></div><div>Ross</div></div>

--001a11425b7009d8f70554e48e11--
