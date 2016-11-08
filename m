Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7BC87719D7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 11:07:50 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id n6so105014810qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 03:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GKQLVmB13dJAcfACFaijUt64qlzc29gqWVAZLCYV7ds=;
	b=m5QoWQOgxLrVQAkE24wYZMrbZsIK/Qet/nRReikvm7mzzJo4X6WXQvE+cFRs61og/J
	3ajjl1nIR6XKrfiDKXnoXyoxgC81TJ3ajpmVwkzbwOJLFxXIRqy5TW+Ov73hm3osXw6W
	RCCL/wsq76GIlG0FeV7K65ATGxlrATynUjigUpej9yibWcDZO8+pYoc0PQjvvQClLZPL
	oLL5PhV+qshAvN5ugeJ3AIjfMeytGEhMSgtidmvw4tjxRdU+Cn3l9jxspYv7W43gQ+rs
	o+w/0x+Qrdbq15L+h4xZRHOWaUfa9akCLrhs6DpxyjFxkdo2U2W/1WN6CDUZZJ3CsrLI
	iSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GKQLVmB13dJAcfACFaijUt64qlzc29gqWVAZLCYV7ds=;
	b=i3gS0iTqvLbQeSDr22CbBqbmm3SFvWYk8CEkEQPU7GppqHgt6Z20OZu4oMXa/JT0/m
	Fb95rHka+qMu1Xvr3zZsVuMJBgrRJs6q1Fl6to5aO277PeebI8UckZ54Qsn9x4MLGPLG
	IMiIqF7J8o3YgiLi1RxKVHLNx5uyRdAmUbHAPJ93rhUigu2cM82Uh77wprmptZFwotOl
	L5eFWYp+Kq6bBXCHr2ZAZtCYkxWSdonJXnfme8Z7YgC6r3QhbQ/JCIN60qYSd0qD2hJS
	dtZFJ9ybdL0Wk7wERw+xGkZK5GHDhngUddQouxraL1UL81jr6woY6TOxiJa/2HMbXRYh
	VWDg==
X-Gm-Message-State: ABUngvcFJUYNTo19OvwNgBS/TiR9jrQcMVh7owP95ia9hj9xMG+tx0bwrZnHfpNa1inz3fvdSX9v2ZgObTl19kFd
X-Received: by 10.200.40.101 with SMTP id 34mr12199952qtr.38.1478603271474;
	Tue, 08 Nov 2016 03:07:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Tue, 8 Nov 2016 03:07:31 -0800 (PST)
In-Reply-To: <20161108052325.11907-1-raj.khem@gmail.com>
References: <20161108052325.11907-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Nov 2016 11:07:31 +0000
Message-ID: <CAJTo0LbTtLuY8JEPY6nRN7AithNTrn8A3oFrQMaKke9GJZnDCQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] x264: Update to latest on stable branch
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
X-List-Received-Date: Tue, 08 Nov 2016 11:07:50 -0000
Content-Type: multipart/alternative; boundary=001a1140451cc2b44b0540c82607

--001a1140451cc2b44b0540c82607
Content-Type: text/plain; charset=UTF-8

On 8 November 2016 at 05:23, Khem Raj <raj.khem@gmail.com> wrote:

> - Switch URI to use github mirror for reliabality
> - Disable openCL code, its not used
> - TEXTRELs are fixed, therefore dont skip QA check
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>

Breaking here for x86-64.

configure output:

DEBUG: Executing shell function do_configure
Unknown option --disable-static, ignored
Found x86_64-poky-linux-gcc (GCC) 6.2.0
Minimum version is yasm-1.2.0
If you really want to compile without asm, configure with --disable-asm.
WARNING: exit code 1 from a shell command.

config.log:

x264 configure script
Command line options: "--prefix=/usr" "--host=x86_64-poky-linux"
"--libdir=/usr/lib" "--cross-prefix=x86_64-poky-linux-"
"--sysroot=/data/poky-master/tmp-glibc/sysroots/intel-corei7-64"
"--enable-shared" "--enable-static" "--disable-lavf" "--disable-swscale"
"--disable-opencl" "--enable-pic" "--disable-static"

checking whether x86_64-poky-linux-gcc  -m64 -march=corei7 -mtune=corei7
-mfpmath=sse -msse4.2
--sysroot=/data/poky-master/tmp-glibc/sysroots/intel-corei7-64 works... yes
checking whether x86_64-poky-linux-gcc  -m64 -march=corei7 -mtune=corei7
-mfpmath=sse -msse4.2
--sysroot=/data/poky-master/tmp-glibc/sysroots/intel-corei7-64 supports
for( int i = 0; i < 9; i++ ); with -std=gnu99... yes
checking for -mpreferred-stack-boundary=5... yes
checking whether x86_64-poky-linux-gcc supports vpmovzxwd ymm0, xmm0... no
Failed commandline was:
--------------------------------------------------
x86_64-poky-linux-gcc conftest.asm  -I. -I$(SRCPATH) -DARCH_X86_64=1
-I$(SRCPATH)/common/x86/ -f elf64  -o conftest.o
x86_64-poky-linux-gcc: error: elf64: No such file or directory
x86_64-poky-linux-gcc: error: unrecognized command line option '-f'
--------------------------------------------------
Failed program was:
--------------------------------------------------
vpmovzxwd ymm0, xmm0
--------------------------------------------------

Ah, looks like the configure is respecting the AS environment variable that
we set to 'as' in bitbake.conf, but it really actually wants yasm.  I added
AS[unexport] = 1 to the recipe and it appears to work now for me.  Can you
verify that it still works on the architectures you care about?

Ross

--001a1140451cc2b44b0540c82607
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 November 2016 at 05:23, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-sty=
le:solid;padding-left:1ex"><div id=3D"gmail-:1xe" class=3D"gmail-a3s gmail-=
aXjCH gmail-m158426581bc17c85">- Switch URI to use github mirror for reliab=
ality<br>
- Disable openCL code, its not used<br>
- TEXTRELs are fixed, therefore dont skip QA check<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;</div></blockquote></div><br>Breaking here for x86-64.</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">configure=
 output:</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a"><div class=3D"gmail_extra">DEBUG: Executing shell function do_configure<=
/div><div class=3D"gmail_extra">Unknown option --disable-static, ignored</d=
iv><div class=3D"gmail_extra">Found x86_64-poky-linux-gcc (GCC) 6.2.0</div>=
<div class=3D"gmail_extra">Minimum version is yasm-1.2.0</div><div class=3D=
"gmail_extra">If you really want to compile without asm, configure with --d=
isable-asm.</div><div class=3D"gmail_extra">WARNING: exit code 1 from a she=
ll command.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">config.log:</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra"><div class=3D"gmail_extra">x264 configure script</div><div clas=
s=3D"gmail_extra">Command line options: &quot;--prefix=3D/usr&quot; &quot;-=
-host=3Dx86_64-poky-linux&quot; &quot;--libdir=3D/usr/lib&quot; &quot;--cro=
ss-prefix=3Dx86_64-poky-linux-&quot; &quot;--sysroot=3D/data/poky-master/tm=
p-glibc/sysroots/intel-corei7-64&quot; &quot;--enable-shared&quot; &quot;--=
enable-static&quot; &quot;--disable-lavf&quot; &quot;--disable-swscale&quot=
; &quot;--disable-opencl&quot; &quot;--enable-pic&quot; &quot;--disable-sta=
tic&quot;</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">checking whether x86_64-poky-linux-gcc =C2=A0-m64 -march=3Dcorei7 -mtun=
e=3Dcorei7 -mfpmath=3Dsse -msse4.2 --sysroot=3D/data/poky-master/tmp-glibc/=
sysroots/intel-corei7-64 works... yes</div><div class=3D"gmail_extra">check=
ing whether x86_64-poky-linux-gcc =C2=A0-m64 -march=3Dcorei7 -mtune=3Dcorei=
7 -mfpmath=3Dsse -msse4.2 --sysroot=3D/data/poky-master/tmp-glibc/sysroots/=
intel-corei7-64 supports for( int i =3D 0; i &lt; 9; i++ ); with -std=3Dgnu=
99... yes</div><div class=3D"gmail_extra">checking for -mpreferred-stack-bo=
undary=3D5... yes</div><div class=3D"gmail_extra">checking whether x86_64-p=
oky-linux-gcc supports vpmovzxwd ymm0, xmm0... no</div><div class=3D"gmail_=
extra">Failed commandline was:</div><div class=3D"gmail_extra">------------=
--------------------------------------</div><div class=3D"gmail_extra">x86_=
64-poky-linux-gcc conftest.asm =C2=A0-I. -I$(SRCPATH) -DARCH_X86_64=3D1 -I$=
(SRCPATH)/common/x86/ -f elf64 =C2=A0-o conftest.o</div><div class=3D"gmail=
_extra">x86_64-poky-linux-gcc: error: elf64: No such file or directory</div=
><div class=3D"gmail_extra">x86_64-poky-linux-gcc: error: unrecognized comm=
and line option &#39;-f&#39;</div><div class=3D"gmail_extra">--------------=
------------------------------------</div><div class=3D"gmail_extra">Failed=
 program was:</div><div class=3D"gmail_extra">-----------------------------=
---------------------</div><div class=3D"gmail_extra">vpmovzxwd ymm0, xmm0<=
/div><div class=3D"gmail_extra">-------------------------------------------=
-------</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ah, looks like the configure is respecting the AS environment variable th=
at we set to &#39;as&#39; in bitbake.conf, but it really actually wants yas=
m.=C2=A0 I added AS[unexport] =3D 1 to the recipe and it appears to work no=
w for me.=C2=A0 Can you verify that it still works on the architectures you=
 care about?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Ross</div></div></div></div>

--001a1140451cc2b44b0540c82607--
