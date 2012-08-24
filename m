Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1T51JB-0006fW-B6
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 23:20:49 +0200
Received: by pbcwy7 with SMTP id wy7so4252357pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 14:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to:x-mailer;
	bh=mzAE9eijQ4yc3B7aRaNukKkAzifOVHByoSrsEaUmGA0=;
	b=Ex3078QqlxfdwApIDz2qjNhH05263ZCyl8G2s6YEn93+AGf5VP7hwfh3f1OVdwLiv3
	hUoJMuIrRSYAv8MKpYDhY04Q0PvmUZRDXD13cn04ks1sYK/iSu+ZNd6n2wStdp+vfOYA
	5jCIN/ZIUYC+AsmIEm6SE+9xZFFvuIn9Y61PBvSshiSZ5BBMa89cFiC7fyrSlN8pTmP2
	I4un82fPLlGVvgG5l5AIHo45MYO5WbrFnP6ESB3+xiTcHdKQxEJeao1GutnBUu35jy52
	FMYSXATh0eUKTKl2EtdAgVtpC7wcX6PKyLnYauaT/UFhmilcYEvYKspW2StbSrCaLVhE
	A6GQ==
Received: by 10.68.202.133 with SMTP id ki5mr15879111pbc.10.1345842520555;
	Fri, 24 Aug 2012 14:08:40 -0700 (PDT)
Received: from [192.168.1.101] ([94.205.108.162])
	by mx.google.com with ESMTPS id gf3sm8991306pbc.74.2012.08.24.14.08.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Aug 2012 14:08:39 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <8a3cf0ce40dbc72a43f08bfed56e61569fe7a910.1345518098.git.raj.khem@gmail.com>
Date: Sat, 25 Aug 2012 01:08:33 +0400
Message-Id: <48919519-8CA2-41A8-96EA-F5D7F91DE33F@gmail.com>
References: <7dacdb4ffd32fe781e4cd0c54b428cf86b96b693.1345518098.git.raj.khem@gmail.com>
	<8a3cf0ce40dbc72a43f08bfed56e61569fe7a910.1345518098.git.raj.khem@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1278)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/9] gcc-cross: Make gcc-cross-initial as the only intermediate gcc stage
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Aug 2012 21:20:49 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_BE111182-FD59-41ED-A737-5F8393271CB5"

--Apple-Mail=_BE111182-FD59-41ED-A737-5F8393271CB5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Khem,

On Aug 21, 2012, at 7:07 AM, Khem Raj wrote:

> Now glibc can be compiled with gcc-cross-initial therefore prepare
> the stage to drop gcc-cross-intermediate

I'm adapting my earlier gcc-4.5 recipes, to try and get them to build =
with the latest poky master.=20

I'm using eglibc-2.13, so it is possible for this version to drop the =
gcc-cross-intermediate stage, or is it only with newer eglibc versions?

At the moment, I've made the required changes to the gcc-4.5 recipes, to =
match that of the current gcc-4.7 templates, and deleted the gcc-4.5 =
intermediate recipes.

Right now I get a compile error with eglibc-2.13, as follows:

| powerpc-poky-linux-gcc  -m32  -msoft-float -mcpu=3D440 =
--sysroot=3D/tool/yocto/poky/build/tmp/sysroots/virtex5-tcbootstrap =
-nostdlib -nostartfiles -o =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/iconv/iconv_prog -msoft-float =
-Wl,-dynamic-linker=3D/lib/ld.so.1   -Wl,-z,combreloc -Wl,-z,relro =
-Wl,--hash-style=3Dboth =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/csu/crt1.o =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/csu/crti.o `powerpc-poky-linux-gcc  -m32  =
-msoft-float -mcpu=3D440 =
--sysroot=3D/tool/yocto/poky/build/tmp/sysroots/virtex5-tcbootstrap =
-msoft-float --print-file-name=3Dcrtbegin.o` =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/iconv/iconv_prog.o =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/iconv/iconv_charmap.o =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/iconv/charmap.o =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/iconv/charmap-dir.o =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/iconv/linereader.o =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/iconv/dummy-repertoire.o =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/iconv/simple-hash.o =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/iconv/xstrdup.o =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/iconv/xmalloc.o  =
-Wl,-rpath-link=3D/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc=
-2.13-r28+svnr15508/build-powerpc-poky-linux:/tool/yocto/poky/build/tmp/wo=
rk/ppc440-poky-linux/eglibc-2.13-r28+svnr15508/build-powerpc-poky-linux/ma=
th:/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1=
5508/build-powerpc-poky-linux/elf:/tool/yocto/poky/build/tmp/work/ppc440-p=
oky-linux/eglibc-2.13-r28+svnr15508/build-powerpc-poky-linux/dlfcn:/tool/y=
octo/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr15508/build=
-powerpc-poky-linux/nss:/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/=
eglibc-2.13-r28+svnr15508/build-powerpc-poky-linux/nis:/tool/yocto/poky/bu=
ild/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr15508/build-powerpc-pok=
y-linux/rt:/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r=
28+svnr15508/build-powerpc-poky-linux/resolv:/tool/yocto/poky/build/tmp/wo=
rk/ppc440-poky-linux/eglibc-2.13-r28+svnr15508/build-powerpc-poky-linux/cr=
ypt:/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr=
15508/build-powerpc-poky-linux/nptl =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/libc.so.6 =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/libc_nonshared.a  =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/elf/ld.so  -lgcc -lgcc_eh  =
`powerpc-poky-linux-gcc  -m32  -msoft-float -mcpu=3D440 =
--sysroot=3D/tool/yocto/poky/build/tmp/sysroots/virtex5-tcbootstrap =
-msoft-float --print-file-name=3Dcrtend.o` =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/csu/crtn.o
| =
/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/libexec/ppc440-poky-l=
inux.gcc-cross-initial/gcc/powerpc-poky-linux/4.5.1/ld: cannot find =
-lgcc_eh
| collect2: ld returned 1 exit status
| make[2]: *** =
[/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr155=
08/build-powerpc-poky-linux/iconv/iconvconfig] Error 1
| make[2]: *** Waiting for unfinished jobs....
| =
/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/libexec/ppc440-poky-l=
inux.gcc-cross-initial/gcc/powerpc-poky-linux/4.5.1/ld: cannot find =
-lgcc_eh
| collect2: ld returned 1 exit status
| make[2]: *** =
[/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr155=
08/build-powerpc-poky-linux/iconv/iconv_prog] Error 1
| make[2]: Leaving directory =
`/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr155=
08/eglibc-2_13/libc/iconv'
| make[1]: *** [iconv/others] Error 2
| make[1]: Leaving directory =
`/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr155=
08/eglibc-2_13/libc'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (see =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/temp/log.do_compile.55715 for further information)
ERROR: Task 32 =
(/tool/yocto/meta-openembedded/toolchain-layer/recipes-core/eglibc/eglibc_=
2.13.bb, do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1146 tasks of which 1145 didn't need to =
be rerun and 1 failed.

Summary: 1 task failed:
  =
/tool/yocto/meta-openembedded/toolchain-layer/recipes-core/eglibc/eglibc_2=
.13.bb, do_compile
Summary: There was 1 ERROR message shown, returning a non-zero exit =
code.


Best regards,

Elvis Dowson=

--Apple-Mail=_BE111182-FD59-41ED-A737-5F8393271CB5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; ">Hi =
Khem,<div><br><div><div>On Aug 21, 2012, at 7:07 AM, Khem Raj =
wrote:</div><br class=3D"Apple-interchange-newline"><blockquote =
type=3D"cite"><div>Now glibc can be compiled with gcc-cross-initial =
therefore prepare<br>the stage to drop =
gcc-cross-intermediate<br></div></blockquote></div><br><div>I'm adapting =
my earlier gcc-4.5 recipes, to try and get them to build with the latest =
poky master.&nbsp;</div><div><br></div><div>I'm using eglibc-2.13, so it =
is possible for this version to drop the gcc-cross-intermediate stage, =
or is it only with newer eglibc =
versions?</div></div><div><br></div><div>At the moment, I've made the =
required changes to the gcc-4.5 recipes, to match that of the current =
gcc-4.7 templates, and deleted the gcc-4.5 intermediate =
recipes.</div><div><br></div><div>Right now I get a compile error with =
eglibc-2.13, as follows:</div><div><br></div><div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">| =
powerpc-poky-linux-gcc &nbsp;-m32 &nbsp;-msoft-float -mcpu=3D440 =
--sysroot=3D/tool/yocto/poky/build/tmp/sysroots/virtex5-tcbootstrap =
-nostdlib -nostartfiles -o =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/iconv/iconv_prog -msoft-float =
-Wl,-dynamic-linker=3D/lib/ld.so.1 &nbsp; -Wl,-z,combreloc -Wl,-z,relro =
-Wl,--hash-style=3Dboth =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/csu/crt1.o =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/csu/crti.o `powerpc-poky-linux-gcc &nbsp;-m32 =
&nbsp;-msoft-float -mcpu=3D440 =
--sysroot=3D/tool/yocto/poky/build/tmp/sysroots/virtex5-tcbootstrap =
-msoft-float --print-file-name=3Dcrtbegin.o` =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/iconv/iconv_prog.o =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/iconv/iconv_charmap.o =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/iconv/charmap.o =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/iconv/charmap-dir.o =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/iconv/linereader.o =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/iconv/dummy-repertoire.o =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/iconv/simple-hash.o =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/iconv/xstrdup.o =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/iconv/xmalloc.o =
&nbsp;-Wl,-rpath-link=3D/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/=
eglibc-2.13-r28+svnr15508/build-powerpc-poky-linux:/tool/yocto/poky/build/=
tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr15508/build-powerpc-poky-li=
nux/math:/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28=
+svnr15508/build-powerpc-poky-linux/elf:/tool/yocto/poky/build/tmp/work/pp=
c440-poky-linux/eglibc-2.13-r28+svnr15508/build-powerpc-poky-linux/dlfcn:/=
tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr15508=
/build-powerpc-poky-linux/nss:/tool/yocto/poky/build/tmp/work/ppc440-poky-=
linux/eglibc-2.13-r28+svnr15508/build-powerpc-poky-linux/nis:/tool/yocto/p=
oky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr15508/build-power=
pc-poky-linux/rt:/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-=
2.13-r28+svnr15508/build-powerpc-poky-linux/resolv:/tool/yocto/poky/build/=
tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr15508/build-powerpc-poky-li=
nux/crypt:/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r2=
8+svnr15508/build-powerpc-poky-linux/nptl =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/libc.so.6 =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/libc_nonshared.a =
&nbsp;/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+sv=
nr15508/build-powerpc-poky-linux/elf/ld.so &nbsp;-lgcc -lgcc_eh =
&nbsp;`powerpc-poky-linux-gcc &nbsp;-m32 &nbsp;-msoft-float -mcpu=3D440 =
--sysroot=3D/tool/yocto/poky/build/tmp/sysroots/virtex5-tcbootstrap =
-msoft-float --print-file-name=3Dcrtend.o` =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/build-powerpc-poky-linux/csu/crtn.o</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">| =
/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/libexec/ppc440-poky-l=
inux.gcc-cross-initial/gcc/powerpc-poky-linux/4.5.1/ld: cannot find =
-lgcc_eh</font></div><div><font class=3D"Apple-style-span" face=3D"Monaco"=
 size=3D"2">| collect2: ld returned 1 exit status</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">| make[2]: *** =
[/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr155=
08/build-powerpc-poky-linux/iconv/iconvconfig] Error =
1</font></div><div><font class=3D"Apple-style-span" face=3D"Monaco" =
size=3D"2">| make[2]: *** Waiting for unfinished =
jobs....</font></div><div><font class=3D"Apple-style-span" face=3D"Monaco"=
 size=3D"2">| =
/tool/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/libexec/ppc440-poky-l=
inux.gcc-cross-initial/gcc/powerpc-poky-linux/4.5.1/ld: cannot find =
-lgcc_eh</font></div><div><font class=3D"Apple-style-span" face=3D"Monaco"=
 size=3D"2">| collect2: ld returned 1 exit status</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">| make[2]: *** =
[/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr155=
08/build-powerpc-poky-linux/iconv/iconv_prog] Error =
1</font></div><div><font class=3D"Apple-style-span" face=3D"Monaco" =
size=3D"2">| make[2]: Leaving directory =
`/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr155=
08/eglibc-2_13/libc/iconv'</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">| make[1]: *** =
[iconv/others] Error 2</font></div><div><font class=3D"Apple-style-span" =
face=3D"Monaco" size=3D"2">| make[1]: Leaving directory =
`/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr155=
08/eglibc-2_13/libc'</font></div><div><font class=3D"Apple-style-span" =
face=3D"Monaco" size=3D"2">| make: *** [all] Error =
2</font></div><div><font class=3D"Apple-style-span" face=3D"Monaco" =
size=3D"2">| ERROR: oe_runmake failed</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">| ERROR: Function =
failed: do_compile (see =
/tool/yocto/poky/build/tmp/work/ppc440-poky-linux/eglibc-2.13-r28+svnr1550=
8/temp/log.do_compile.55715 for further =
information)</font></div><div><font class=3D"Apple-style-span" =
face=3D"Monaco" size=3D"2">ERROR: Task 32 =
(/tool/yocto/meta-openembedded/toolchain-layer/recipes-core/eglibc/eglibc_=
2.13.bb, do_compile) failed with exit code '1'</font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">NOTE: Tasks =
Summary: Attempted 1146 tasks of which 1145 didn't need to be rerun and =
1 failed.</font></div><div><font class=3D"Apple-style-span" =
face=3D"Monaco" size=3D"2"><br></font></div><div><font =
class=3D"Apple-style-span" face=3D"Monaco" size=3D"2">Summary: 1 task =
failed:</font></div><div><font class=3D"Apple-style-span" face=3D"Monaco" =
size=3D"2">&nbsp; =
/tool/yocto/meta-openembedded/toolchain-layer/recipes-core/eglibc/eglibc_2=
.13.bb, do_compile</font></div><div><font class=3D"Apple-style-span" =
face=3D"Monaco" size=3D"2">Summary: There was 1 ERROR message shown, =
returning a non-zero exit =
code.</font></div></div><div><br></div><div><br></div><div>Best =
regards,</div><div><br></div><div>Elvis Dowson</div></body></html>=

--Apple-Mail=_BE111182-FD59-41ED-A737-5F8393271CB5--
