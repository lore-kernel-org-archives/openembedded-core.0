Return-Path: <nickdademo@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id B03D360702
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 13:51:53 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id m1so1226421oag.40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 May 2014 06:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=T/FTrF3Aqz+rb4gvAx42sxYQLduhjzz7GZiHIHWp5Rw=;
	b=TTANPw/oI0TCx+9zxMM37dczz/xeYSc99Yh7zu+B0pvOW3gGh622Jz5ZhVYSYxHP7/
	tTMxGLucwvuqZhT3WkSexkRdXFZ4Jz0fIxWf+E/Od8ahGztIDhIxQ0hYK5v/Czimkw+X
	Upu3S4jqjCgKUd5rmSTX2pPj3jrPTCUc9jE7CJvhQXxR8N8Y43fZoeIXe5l0Wvr4I5IL
	QGyp4u3UOwSS0Ha28rj7q71bhobZqUP32A5qwA0TE7xgl/qU67ypg0INkO2Km9gDRf3v
	i37sMyP8Q7DYQuWHJG2elbZkxDlueSb1PFAy9PGL/lmLHW26h/VhCqnF3HfdPLeDTESz
	OAlg==
X-Received: by 10.60.176.9 with SMTP id ce9mr15627100oec.55.1399470713903;
	Wed, 07 May 2014 06:51:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.85.33 with HTTP; Wed, 7 May 2014 06:51:32 -0700 (PDT)
In-Reply-To: <CANR6C57rRhM=uSs9segE=ZcGMVaT4EUFbP8PCzg2F_=_REd28w@mail.gmail.com>
References: <1399257033-7155-1-git-send-email-ming.liu@windriver.com>
	<CANR6C57rRhM=uSs9segE=ZcGMVaT4EUFbP8PCzg2F_=_REd28w@mail.gmail.com>
From: "Nick D'Ademo" <nickdademo@gmail.com>
Date: Wed, 7 May 2014 23:51:32 +1000
Message-ID: <CANR6C55dqiKEqAS5_dN8O50vvirpn5MzEOeoFN1H7QfBegUppw@mail.gmail.com>
To: Ming Liu <ming.liu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] ldconfig-native: also default to lib32 and lib64 directories
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
X-List-Received-Date: Wed, 07 May 2014 13:51:54 -0000
Content-Type: multipart/alternative; boundary=089e0118226cc6a00404f8cfaa92

--089e0118226cc6a00404f8cfaa92
Content-Type: text/plain; charset=ISO-8859-1

"ld: cannot find -lgcc"

This is the partial log:


| x86_64-poky-linux-gcc  -m64 -march=corei7 -mtune=corei7 -mfpmath=sse
-msse4.2 --sysroot=/home/nick/poky/build/tmp/sysroots/8tree-tcbootstrap
-nostdlib -nostartfiles -r -o
/home/nick/poky/build/tmp/work/corei7-64-poky-linux/eglibc/2.19-r0/build-x86_64-poky-linux/libc_pic.os
\
|      -Wl,-d -Wl,--whole-archive
/home/nick/poky/build/tmp/work/corei7-64-poky-linux/eglibc/2.19-r0/build-x86_64-poky-linux/libc_pic.a
-o
/home/nick/poky/build/tmp/work/corei7-64-poky-linux/eglibc/2.19-r0/build-x86_64-poky-linux/libc_pic.os
| x86_64-poky-linux-gcc  -m64 -march=corei7 -mtune=corei7 -mfpmath=sse
-msse4.2 --sysroot=/home/nick/poky/build/tmp/sysroots/8tree-tcbootstrap
-nostdlib -nostartfiles -r -o
/home/nick/poky/build/tmp/work/corei7-64-poky-linux/eglibc/2.19-r0/build-x86_64-poky-linux/elf/librtld.map.o
'-Wl,-('
/home/nick/poky/build/tmp/work/corei7-64-poky-linux/eglibc/2.19-r0/build-x86_64-poky-linux/elf/dl-allobjs.os
/home/nick/poky/build/tmp/work/corei7-64-poky-linux/eglibc/2.19-r0/build-x86_64-poky-linux/libc_pic.a
-lgcc '-Wl,-)'
-Wl,-Map,/home/nick/poky/build/tmp/work/corei7-64-poky-linux/eglibc/2.19-r0/build-x86_64-poky-linux/elf/librtld.mapT
|
/home/nick/poky/build/tmp/sysroots/i686-linux/usr/libexec/x86_64-poky-linux.gcc-cross-initial-x86_64/gcc/x86_64-poky-linux/4.9.0/ld:
cannot find -lgcc
| collect2: error: ld returned 1 exit status
| make[2]: ***
[/home/nick/poky/build/tmp/work/corei7-64-poky-linux/eglibc/2.19-r0/build-x86_64-poky-linux/elf/librtld.map]
Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[2]: Leaving directory
`/home/nick/poky/build/tmp/work/corei7-64-poky-linux/eglibc/2.19-r0/eglibc-2.19/libc/elf'
| make[1]: *** [elf/subdir_lib] Error 2
| make[1]: Leaving directory
`/home/nick/poky/build/tmp/work/corei7-64-poky-linux/eglibc/2.19-r0/eglibc-2.19/libc'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| WARNING:
/home/nick/poky/build/tmp/work/corei7-64-poky-linux/eglibc/2.19-r0/temp/run.do_compile.5579:1
exit 1 from
|   exit 1
| ERROR: Function failed: do_compile (log file is located at
/home/nick/poky/build/tmp/work/corei7-64-poky-linux/eglibc/2.19-r0/temp/log.do_compile.5579)
ERROR: Task 40 (/home/nick/poky/meta/recipes-core/eglibc/eglibc_2.19.bb,
do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1275 tasks of which 20 didn't need to be
rerun and 2 failed.
Waiting for 0 running tasks to finish:

Summary: 2 tasks failed:
  virtual:multilib:lib32:/home/nick/poky/meta/recipes-core/eglibc/
eglibc_2.19.bb, do_compile
  /home/nick/poky/meta/recipes-core/eglibc/eglibc_2.19.bb, do_compile
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.



On Wed, May 7, 2014 at 6:50 PM, Nick D'Ademo <nickdademo@gmail.com> wrote:

> This patch actually breaks my MULTILIB build (Intel NUC platform).
> I'll try and get some more details.
>
>
>
> On Mon, May 5, 2014 at 12:30 PM, Ming Liu <ming.liu@windriver.com> wrote:
>
>> make ldconfig default to /lib+/usr/lib, /lib32+/usr/lib32 and
>> /lib64+/usr/lib64 on bi-ABI architectures.
>>
>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>> ---
>>  .../ldconfig-default-to-all-multilib-dirs.patch    | 37
>> ++++++++++++++++++++++
>>  meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb |  4 ++-
>>  2 files changed, 40 insertions(+), 1 deletion(-)
>>  create mode 100644
>> meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-default-to-all-multilib-dirs.patch
>>
>> diff --git
>> a/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-default-to-all-multilib-dirs.patch
>> b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-default-to-all-multilib-dirs.patch
>> new file mode 100644
>> index 0000000..5ed4f6f
>> --- /dev/null
>> +++
>> b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-default-to-all-multilib-dirs.patch
>> @@ -0,0 +1,37 @@
>> +Upstream-Status: Inappropriate [embedded specific]
>> +
>> +make ldconfig default to both /lib+/usr/lib, /lib32+/usr/lib32 and
>> +/lib64+/usr/lib64 on bi-ABI architectures.
>> +
>> +---
>> + ldconfig.c |   10 ++++++++++
>> + 1 file changed, 10 insertions(+)
>> +
>> +diff -urpN a/ldconfig.c b/ldconfig.c
>> +--- a/ldconfig.c
>> ++++ b/ldconfig.c
>> +@@ -52,7 +52,11 @@
>> +
>> + #define SYSCONFDIR "/etc"
>> + #define LIBDIR "/usr/lib"
>> ++#define LIBDIR32 "/usr/lib32"
>> ++#define LIBDIR64 "/usr/lib64"
>> + #define SLIBDIR "/lib"
>> ++#define SLIBDIR32 "/lib32"
>> ++#define SLIBDIR64 "/lib64"
>> + # define N_(msgid)  msgid
>> + #define _(msg) msg
>> +
>> +@@ -1373,6 +1377,12 @@ main (int argc, char **argv)
>> +       add_system_dir (SLIBDIR);
>> +       if (strcmp (SLIBDIR, LIBDIR))
>> +       add_system_dir (LIBDIR);
>> ++      add_system_dir (SLIBDIR32);
>> ++      if (strcmp (SLIBDIR32, LIBDIR32))
>> ++      add_system_dir (LIBDIR32);
>> ++      add_system_dir (SLIBDIR64);
>> ++      if (strcmp (SLIBDIR64, LIBDIR64))
>> ++      add_system_dir (LIBDIR64);
>> +     }
>> +
>> +   const char *aux_cache_file = _PATH_LDCONFIG_AUX_CACHE;
>> diff --git a/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bbb/meta/recipes-core/eglibc/
>> ldconfig-native_2.12.1.bb
>> index d7bc444..75ffbf6 100644
>> --- a/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
>> +++ b/meta/recipes-core/eglibc/ldconfig-native_2.12.1.bb
>> @@ -10,7 +10,9 @@ SRC_URI = "file://ldconfig-native-2.12.1.tar.bz2 \
>>             file://32and64bit.patch \
>>             file://endian-ness_handling.patch \
>>             file://flag_fix.patch \
>> -           file://endianess-header.patch"
>> +           file://endianess-header.patch \
>> +           file://ldconfig-default-to-all-multilib-dirs.patch \
>> +"
>>
>>  PR = "r2"
>>
>> --
>> 1.8.4.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>

--089e0118226cc6a00404f8cfaa92
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&quot;ld: cannot find -lgcc&quot;<div><br>This is the part=
ial log:<br><br><br>| x86_64-poky-linux-gcc=A0 -m64 -march=3Dcorei7 -mtune=
=3Dcorei7 -mfpmath=3Dsse -msse4.2 --sysroot=3D/home/nick/poky/build/tmp/sys=
roots/8tree-tcbootstrap=A0=A0 -nostdlib -nostartfiles -r -o /home/nick/poky=
/build/tmp/work/corei7-64-poky-linux/eglibc/2.19-r0/build-x86_64-poky-linux=
/libc_pic.os \<br>

| =A0=A0=A0 =A0-Wl,-d -Wl,--whole-archive /home/nick/poky/build/tmp/work/co=
rei7-64-poky-linux/eglibc/2.19-r0/build-x86_64-poky-linux/libc_pic.a -o /ho=
me/nick/poky/build/tmp/work/corei7-64-poky-linux/eglibc/2.19-r0/build-x86_6=
4-poky-linux/libc_pic.os<br>

| x86_64-poky-linux-gcc=A0 -m64 -march=3Dcorei7 -mtune=3Dcorei7 -mfpmath=3D=
sse -msse4.2 --sysroot=3D/home/nick/poky/build/tmp/sysroots/8tree-tcbootstr=
ap=A0=A0 -nostdlib -nostartfiles -r -o /home/nick/poky/build/tmp/work/corei=
7-64-poky-linux/eglibc/2.19-r0/build-x86_64-poky-linux/elf/librtld.map.o &#=
39;-Wl,-(&#39; /home/nick/poky/build/tmp/work/corei7-64-poky-linux/eglibc/2=
.19-r0/build-x86_64-poky-linux/elf/dl-allobjs.os /home/nick/poky/build/tmp/=
work/corei7-64-poky-linux/eglibc/2.19-r0/build-x86_64-poky-linux/libc_pic.a=
 -lgcc &#39;-Wl,-)&#39; -Wl,-Map,/home/nick/poky/build/tmp/work/corei7-64-p=
oky-linux/eglibc/2.19-r0/build-x86_64-poky-linux/elf/librtld.mapT<br>

| /home/nick/poky/build/tmp/sysroots/i686-linux/usr/libexec/x86_64-poky-lin=
ux.gcc-cross-initial-x86_64/gcc/x86_64-poky-linux/4.9.0/ld: cannot find -lg=
cc<br>| collect2: error: ld returned 1 exit status<br>| make[2]: *** [/home=
/nick/poky/build/tmp/work/corei7-64-poky-linux/eglibc/2.19-r0/build-x86_64-=
poky-linux/elf/librtld.map] Error 1<br>

| make[2]: *** Waiting for unfinished jobs....<br>| make[2]: Leaving direct=
ory `/home/nick/poky/build/tmp/work/corei7-64-poky-linux/eglibc/2.19-r0/egl=
ibc-2.19/libc/elf&#39;<br>| make[1]: *** [elf/subdir_lib] Error 2<br>| make=
[1]: Leaving directory `/home/nick/poky/build/tmp/work/corei7-64-poky-linux=
/eglibc/2.19-r0/eglibc-2.19/libc&#39;<br>

| make: *** [all] Error 2<br>| ERROR: oe_runmake failed<br>| WARNING: /home=
/nick/poky/build/tmp/work/corei7-64-poky-linux/eglibc/2.19-r0/temp/run.do_c=
ompile.5579:1 exit 1 from<br>|=A0=A0 exit 1<br>| ERROR: Function failed: do=
_compile (log file is located at /home/nick/poky/build/tmp/work/corei7-64-p=
oky-linux/eglibc/2.19-r0/temp/log.do_compile.5579)<br>

ERROR: Task 40 (/home/nick/poky/meta/recipes-core/eglibc/<a href=3D"http://=
eglibc_2.19.bb">eglibc_2.19.bb</a>, do_compile) failed with exit code &#39;=
1&#39;<br>NOTE: Tasks Summary: Attempted 1275 tasks of which 20 didn&#39;t =
need to be rerun and 2 failed.<br>

Waiting for 0 running tasks to finish:<br><br>Summary: 2 tasks failed:<br>=
=A0 virtual:multilib:lib32:/home/nick/poky/meta/recipes-core/eglibc/<a href=
=3D"http://eglibc_2.19.bb">eglibc_2.19.bb</a>, do_compile<br>=A0 /home/nick=
/poky/meta/recipes-core/eglibc/<a href=3D"http://eglibc_2.19.bb">eglibc_2.1=
9.bb</a>, do_compile<br>

Summary: There were 2 ERROR messages shown, returning a non-zero exit code.=
<br><br><div class=3D"gmail_extra">
<br><br><div class=3D"gmail_quote">On Wed, May 7, 2014 at 6:50 PM, Nick D&#=
39;Ademo <span dir=3D"ltr">&lt;<a href=3D"mailto:nickdademo@gmail.com" targ=
et=3D"_blank">nickdademo@gmail.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">

<div dir=3D"ltr">This patch actually breaks my MULTILIB build (Intel NUC pl=
atform).<br>I&#39;ll try and get some more details.<div><div class=3D"h5"><=
br><div><div class=3D"gmail_extra">
<br><br><div class=3D"gmail_quote">On Mon, May 5, 2014 at 12:30 PM, Ming Li=
u <span dir=3D"ltr">&lt;<a href=3D"mailto:ming.liu@windriver.com" target=3D=
"_blank">ming.liu@windriver.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">


make ldconfig default to /lib+/usr/lib, /lib32+/usr/lib32 and<br>
/lib64+/usr/lib64 on bi-ABI architectures.<br>
<br>
Signed-off-by: Ming Liu &lt;<a href=3D"mailto:ming.liu@windriver.com" targe=
t=3D"_blank">ming.liu@windriver.com</a>&gt;<br>
---<br>
=A0.../ldconfig-default-to-all-multilib-dirs.patch =A0 =A0| 37 ++++++++++++=
++++++++++<br>
=A0meta/recipes-core/eglibc/<a href=3D"http://ldconfig-native_2.12.1.bb" ta=
rget=3D"_blank">ldconfig-native_2.12.1.bb</a> | =A04 ++-<br>
=A02 files changed, 40 insertions(+), 1 deletion(-)<br>
=A0create mode 100644 meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldcon=
fig-default-to-all-multilib-dirs.patch<br>
<br>
diff --git a/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-defau=
lt-to-all-multilib-dirs.patch b/meta/recipes-core/eglibc/ldconfig-native-2.=
12.1/ldconfig-default-to-all-multilib-dirs.patch<br>
new file mode 100644<br>
index 0000000..5ed4f6f<br>
--- /dev/null<br>
+++ b/meta/recipes-core/eglibc/ldconfig-native-2.12.1/ldconfig-default-to-a=
ll-multilib-dirs.patch<br>
@@ -0,0 +1,37 @@<br>
+Upstream-Status: Inappropriate [embedded specific]<br>
+<br>
+make ldconfig default to both /lib+/usr/lib, /lib32+/usr/lib32 and<br>
+/lib64+/usr/lib64 on bi-ABI architectures.<br>
+<br>
+---<br>
+ ldconfig.c | =A0 10 ++++++++++<br>
+ 1 file changed, 10 insertions(+)<br>
+<br>
+diff -urpN a/ldconfig.c b/ldconfig.c<br>
+--- a/ldconfig.c<br>
++++ b/ldconfig.c<br>
+@@ -52,7 +52,11 @@<br>
+<br>
+ #define SYSCONFDIR &quot;/etc&quot;<br>
+ #define LIBDIR &quot;/usr/lib&quot;<br>
++#define LIBDIR32 &quot;/usr/lib32&quot;<br>
++#define LIBDIR64 &quot;/usr/lib64&quot;<br>
+ #define SLIBDIR &quot;/lib&quot;<br>
++#define SLIBDIR32 &quot;/lib32&quot;<br>
++#define SLIBDIR64 &quot;/lib64&quot;<br>
+ # define N_(msgid) =A0msgid<br>
+ #define _(msg) msg<br>
+<br>
+@@ -1373,6 +1377,12 @@ main (int argc, char **argv)<br>
+ =A0 =A0 =A0 add_system_dir (SLIBDIR);<br>
+ =A0 =A0 =A0 if (strcmp (SLIBDIR, LIBDIR))<br>
+ =A0 =A0 =A0 add_system_dir (LIBDIR);<br>
++ =A0 =A0 =A0add_system_dir (SLIBDIR32);<br>
++ =A0 =A0 =A0if (strcmp (SLIBDIR32, LIBDIR32))<br>
++ =A0 =A0 =A0add_system_dir (LIBDIR32);<br>
++ =A0 =A0 =A0add_system_dir (SLIBDIR64);<br>
++ =A0 =A0 =A0if (strcmp (SLIBDIR64, LIBDIR64))<br>
++ =A0 =A0 =A0add_system_dir (LIBDIR64);<br>
+ =A0 =A0 }<br>
+<br>
+ =A0 const char *aux_cache_file =3D _PATH_LDCONFIG_AUX_CACHE;<br>
diff --git a/meta/recipes-core/eglibc/<a href=3D"http://ldconfig-native_2.1=
2.1.bb" target=3D"_blank">ldconfig-native_2.12.1.bb</a> b/meta/recipes-core=
/eglibc/<a href=3D"http://ldconfig-native_2.12.1.bb" target=3D"_blank">ldco=
nfig-native_2.12.1.bb</a><br>



index d7bc444..75ffbf6 100644<br>
--- a/meta/recipes-core/eglibc/<a href=3D"http://ldconfig-native_2.12.1.bb"=
 target=3D"_blank">ldconfig-native_2.12.1.bb</a><br>
+++ b/meta/recipes-core/eglibc/<a href=3D"http://ldconfig-native_2.12.1.bb"=
 target=3D"_blank">ldconfig-native_2.12.1.bb</a><br>
@@ -10,7 +10,9 @@ SRC_URI =3D &quot;file://ldconfig-native-2.12.1.tar.bz2 \=
<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://32and64bit.patch \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://endian-ness_handling.patch \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://flag_fix.patch \<br>
- =A0 =A0 =A0 =A0 =A0 file://endianess-header.patch&quot;<br>
+ =A0 =A0 =A0 =A0 =A0 file://endianess-header.patch \<br>
+ =A0 =A0 =A0 =A0 =A0 file://ldconfig-default-to-all-multilib-dirs.patch \<=
br>
+&quot;<br>
<br>
=A0PR =3D &quot;r2&quot;<br>
<span><font color=3D"#888888"><br>
--<br>
1.8.4.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br></div></div></div></div></div>
</blockquote></div><br></div></div></div>

--089e0118226cc6a00404f8cfaa92--
