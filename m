Received: from mail-wg0-f45.google.com ([74.125.82.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rwmacleod@gmail.com>) id 1UZSmy-000399-8b
	for openembedded-core@lists.openembedded.org;
	Mon, 06 May 2013 23:17:44 +0200
Received: by mail-wg0-f45.google.com with SMTP id l18so4111293wgh.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 May 2013 13:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=BKbqIFwZz0fn+olIEEx5RiYTNim++8fa03U7HlUanRc=;
	b=xWn3zAKCOA90T1+8PFOxs7IVE8W7Uqo2dZRzaOanf3tHFwQG8BmrVSi4TzDJOuWLQS
	ZiF62VUxPOH79GsShnKw6Sh4grgU1czJK2BH3MRVl2AEadcbmM9PdPK2xZ/MBUa+quH4
	XnX92cr9e4GndsmF4Ifrm+FjNGi5/LfP0+Vo6wGMUHNAPHyzB+wDyGVFGszTQQ6K9wY0
	yhEn2WKo5gx/BxtC0AbmjX4ZmPmWSYVf7LWhN/MnX3XfJGlWdr+JrQM08aesSaNm//cV
	l9JS1eF02qme9FPuNHItSiDYJ5gJqp+OaDvXO9aOY7FdNnuIV9kfOOWq4zsfrlf2mjn6
	mTnA==
MIME-Version: 1.0
X-Received: by 10.194.109.198 with SMTP id hu6mr9825262wjb.5.1367873980355;
	Mon, 06 May 2013 13:59:40 -0700 (PDT)
Received: by 10.194.94.233 with HTTP; Mon, 6 May 2013 13:59:40 -0700 (PDT)
Date: Mon, 6 May 2013 16:59:40 -0400
Message-ID: <CAK6=ix4EGtoEd0JqEBC6tNt+nXVEw5=F_Mf3vUFCzKeCEq8kzg@mail.gmail.com>
From: Randy MacLeod <rwmacleod@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 12/18] pkgconfig: Move patches in prep for 0.28 update
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
X-List-Received-Date: Mon, 06 May 2013 21:17:44 -0000
Content-Type: multipart/alternative; boundary=089e010d8602b2589e04dc12faad

--089e010d8602b2589e04dc12faad
Content-Type: text/plain; charset=ISO-8859-1

On 13-04-24 05:37 PM, Saul Wold wrote:> Signed-off-by: Saul Wold <
sgw@linux.intel.com>
> ---
>   meta/recipes-devtools/pkgconfig/pkgconfig.inc     | 8 +-------
>   meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb | 7 +++++++
>   2 files changed, 8 insertions(+), 7 deletions(-)

Saul,

Any news on pkgconfig-0.28 ? I'm trying to compile c-i-m
using clang for the -native tools and glib-1.2.10 shipped with
pkgconfig-0.25 is causing the build error below.
pkgconfig-0.28 and later includes version of glib-2.32.4

If you are about to push this uprev, I'll wait a while and try
again. Do you want help?


BTW, I just set
  /usr/bin/gcc -> clang manually and used update-alternatives
to set:
  /usr/bin/c++ -> /etc/alternative/c++ ~=>
                  Ubuntu clang version 3.2-1~exp9ubuntu1
                  (tags/RELEASE_32/final) (based on LLVM 3.2)

my host is Ubuntu-13.04. I guess I should figure out

Is there a better way to make oe-core use clang for native tools?
I did glance at:
http://www.openembedded.org/wiki/Adding_a_secondary_toolchain

// Randy



 testglib.o:testglib.c:(.text+0x0): first defined here
| ./.libs/libglib.a(gutils.o): In function `g_bit_nth_msf':
| gutils.c:(.text+0x30): multiple definition of `g_bit_nth_msf'
| testglib.o:testglib.c:(.text+0x30): first defined here
| ./.libs/libglib.a(gutils.o): In function `g_bit_storage':
| gutils.c:(.text+0x60): multiple definition of `g_bit_storage'
| testglib.o:testglib.c:(.text+0x60): first defined here
| clang: error: linker command failed with exit code 1 (use -v to see
invocation)
| make[4]: *** [testglib] Error 1
| make[4]: Leaving directory
`/home/rmacleod/src/distro/yocto/b-clang/build/tmp-eglibc/work/x86_64-linux/pkgconfig-native/0.25-r7/pkg-config-0.25/glib-1.2.10'
| make[3]: *** [all-recursive] Error 1
| make[3]: Leaving directory
`/home/rmacleod/src/distro/yocto/b-clang/build/tmp-eglibc/work/x86_64-linux/pkgconfig-native/0.25-r7/pkg-config-0.25/glib-1.2.10'
| make[2]: *** [all] Error 2
| make[2]: Leaving directory
`/home/rmacleod/src/distro/yocto/b-clang/build/tmp-eglibc/work/x86_64-linux/pkgconfig-native/0.25-r7/pkg-config-0.25/glib-1.2.10'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/home/rmacleod/src/distro/yocto/b-clang/build/tmp-eglibc/work/x86_64-linux/pkgconfig-native/0.25-r7/pkg-config-0.25'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (see
/home/rmacleod/src/distro/yocto/b-clang/build/tmp-eglibc/work/x86_64-linux/pkgconfig-native/0.25-r7/temp/log.do_compile.32446
for further information)
ERROR: Task 27
(virtual:native:/home/rmacleod/src/distro/yocto/oe-core.git/meta/recipes-devtools/pkgconfig/
pkgconfig_0.25.bb, do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 47 tasks of which 46 didn't need to be rerun
and 1 failed.
No currently running tasks (47 of 63)


-- 
../Randy/..

--089e010d8602b2589e04dc12faad
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>On 13-04-24 05:37 PM, Saul Wold wrote:&gt; Signed-off=
-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@linux.intel.c=
om</a>&gt;</div><div>&gt; ---</div><div>&gt; =A0 meta/recipes-devtools/pkgc=
onfig/pkgconfig.inc =A0 =A0 | 8 +-------</div>
<div>&gt; =A0 meta/recipes-devtools/pkgconfig/<a href=3D"http://pkgconfig_0=
.25.bb">pkgconfig_0.25.bb</a> | 7 +++++++</div><div>&gt; =A0 2 files change=
d, 8 insertions(+), 7 deletions(-)</div><div><br></div><div>Saul,</div><div=
><br>
</div><div>Any news on pkgconfig-0.28 ? I&#39;m trying to compile c-i-m</di=
v><div>using clang for the -native tools and glib-1.2.10 shipped with</div>=
<div>pkgconfig-0.25 is causing the build error below.=A0</div><div>pkgconfi=
g-0.28 and later includes version of glib-2.32.4</div>
<div><br></div><div>If you are about to push this uprev, I&#39;ll wait a wh=
ile and try</div><div>again. Do you want help?</div><div><br></div><div><br=
></div><div>BTW, I just set</div><div>=A0 /usr/bin/gcc -&gt; clang manually=
 and used update-alternatives</div>
<div>to set:</div><div>=A0 /usr/bin/c++ -&gt; /etc/alternative/c++ ~=3D&gt;=
=A0</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Ubuntu clang version 3.2-=
1~exp9ubuntu1=A0</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (tags/RELEAS=
E_32/final) (based on LLVM 3.2)</div><div>
<br></div><div>my host is Ubuntu-13.04. I guess I should figure out=A0</div=
><div><br></div><div style>Is there a better way to make oe-core use clang =
for native tools?</div><div style>I did glance at:</div><div><a href=3D"htt=
p://www.openembedded.org/wiki/Adding_a_secondary_toolchain">http://www.open=
embedded.org/wiki/Adding_a_secondary_toolchain</a><br>
</div><div><br></div><div>// Randy</div><div><br></div><div><br></div><div>=
<br></div><div>=A0testglib.o:testglib.c:(.text+0x0): first defined here</di=
v><div>| ./.libs/libglib.a(gutils.o): In function `g_bit_nth_msf&#39;:</div=
>
<div>| gutils.c:(.text+0x30): multiple definition of `g_bit_nth_msf&#39;</d=
iv><div>| testglib.o:testglib.c:(.text+0x30): first defined here</div><div>=
| ./.libs/libglib.a(gutils.o): In function `g_bit_storage&#39;:</div><div>
| gutils.c:(.text+0x60): multiple definition of `g_bit_storage&#39;</div><d=
iv>| testglib.o:testglib.c:(.text+0x60): first defined here</div><div>| cla=
ng: error: linker command failed with exit code 1 (use -v to see invocation=
)</div>
<div>| make[4]: *** [testglib] Error 1</div><div>| make[4]: Leaving directo=
ry `/home/rmacleod/src/distro/yocto/b-clang/build/tmp-eglibc/work/x86_64-li=
nux/pkgconfig-native/0.25-r7/pkg-config-0.25/glib-1.2.10&#39;</div><div>
| make[3]: *** [all-recursive] Error 1</div><div>| make[3]: Leaving directo=
ry `/home/rmacleod/src/distro/yocto/b-clang/build/tmp-eglibc/work/x86_64-li=
nux/pkgconfig-native/0.25-r7/pkg-config-0.25/glib-1.2.10&#39;</div><div>
| make[2]: *** [all] Error 2</div><div>| make[2]: Leaving directory `/home/=
rmacleod/src/distro/yocto/b-clang/build/tmp-eglibc/work/x86_64-linux/pkgcon=
fig-native/0.25-r7/pkg-config-0.25/glib-1.2.10&#39;</div><div>| make[1]: **=
* [all-recursive] Error 1</div>
<div>| make[1]: Leaving directory `/home/rmacleod/src/distro/yocto/b-clang/=
build/tmp-eglibc/work/x86_64-linux/pkgconfig-native/0.25-r7/pkg-config-0.25=
&#39;</div><div>| make: *** [all] Error 2</div><div>| ERROR: oe_runmake fai=
led</div>
<div>| ERROR: Function failed: do_compile (see /home/rmacleod/src/distro/yo=
cto/b-clang/build/tmp-eglibc/work/x86_64-linux/pkgconfig-native/0.25-r7/tem=
p/log.do_compile.32446 for further information)</div><div>ERROR: Task 27 (v=
irtual:native:/home/rmacleod/src/distro/yocto/oe-core.git/meta/recipes-devt=
ools/pkgconfig/<a href=3D"http://pkgconfig_0.25.bb">pkgconfig_0.25.bb</a>, =
do_compile) failed with exit code &#39;1&#39;</div>
<div>NOTE: Tasks Summary: Attempted 47 tasks of which 46 didn&#39;t need to=
 be rerun and 1 failed.</div><div>No currently running tasks (47 of 63)</di=
v><div><br></div><div><br></div>-- <br>../Randy/..
</div>

--089e010d8602b2589e04dc12faad--
