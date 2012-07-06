Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SmziD-0004zN-Cw
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 06:00:09 +0200
Received: by eekd49 with SMTP id d49so3378365eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2012 20:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=E4+P2ZbZYV9KVMff+Nka6RNuSnJOXfwU3K9cX56AtDM=;
	b=KXe99oW5up1I1J9rv/X4TSnu6NQfgu0yRKa1eC5fl/MxUeGbaQvN7Ref1WE9/sqamQ
	Lq5Sn7rlx7caeIrw0N4xhfOGJUhY91Qi38x0ROIlUOUAMPgdT23yNN5i3W3cvscX8YhY
	TFV7WbZyQVuirc4r9X+r81Qa0qwpxOWyu3WOFi45/ERYR5H+R1B7XpFyTyZ0cI5dWe7C
	tLq4LiXSTZBCgL6hOHxxQi+uRMRFvZgwd8B977uZ7sRLjcBPkyHV8KUsN6SiUSL986Sw
	DKuL6gSwEMyEJU0ThG3O525gIzt13Wv5GdNB2Ojwo6BFo4OqET5UqmsDmhzQGZZ86CG9
	JXmw==
MIME-Version: 1.0
Received: by 10.14.95.138 with SMTP id p10mr6958687eef.110.1341546543811; Thu,
	05 Jul 2012 20:49:03 -0700 (PDT)
Received: by 10.14.210.199 with HTTP; Thu, 5 Jul 2012 20:49:03 -0700 (PDT)
In-Reply-To: <4FF64D14.2080303@linux.intel.com>
References: <48ef71f7c5eea25278a5a9c9befd01123369e2f9.1341498745.git.raj.khem@gmail.com>
	<0218f823021f888115dba8e26ef98efa612cbe42.1341498745.git.raj.khem@gmail.com>
	<4FF64D14.2080303@linux.intel.com>
Date: Thu, 5 Jul 2012 20:49:03 -0700
Message-ID: <CAMKF1sqjrzDbnwRZ788O4+uQMv7nxU0eht5UVi=x7ce-wRgxvQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/14] eglibc: Add recipes for 2.16 release
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jul 2012 04:00:09 -0000
Content-Type: multipart/alternative; boundary=bcaec52c6aa5318b2204c42125e2

--bcaec52c6aa5318b2204c42125e2
Content-Type: text/plain; charset=UTF-8

On Thursday, July 5, 2012, Saul Wold <sgw@linux.intel.com> wrote:
> On 07/05/2012 07:35 AM, Khem Raj wrote:
>>
>> Drop the patches that were either applied
>> or fixed differenly in 2.16
>>
>> Add patches to fix ppc spe patches to match
>> eglibc 2.16
>>
>> Fix CPPFLAGS to contain correct includepaths
>> so autoconf cache is generated correctly
>>
>
> Khem,
>
> Just to let you know that I will be doing builds with this set over the
weekend and since we are approaching a Milestone cut date, we will likely
wait until after the freeze date before including these changes.
>
> I will keep you posted on my results.

Sure we need more testing on them so they land in good shape
My aim is to use 2.16 in 1.3 release
>
> Sau!
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../eglibc/cross-localedef-native_2.16.bb          |   44 ++
>   .../eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch    |  108 ++++
>   .../eglibc/eglibc-2.16/IO-acquire-lock-fix.patch   |   17 +
>   .../eglibc-svn-arm-lowlevellock-include-tls.patch  |   21 +
>   .../eglibc_fix_findidx_parameters.patch            |   38 ++
>   .../eglibc/eglibc-2.16/generate-supported.mk       |   11 +
>   .../eglibc/eglibc-2.16/initgroups_keys.patch       |   20 +
>   .../eglibc/eglibc-2.16/ld-search-order.patch       |   56 ++
>   .../eglibc/eglibc-2.16/mips-rld-map-check.patch    |   26 +
>   .../eglibc/eglibc-2.16/multilib_readlib.patch      |   17 +
>   .../recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch |  538
++++++++++++++++++++
>   .../eglibc/eglibc-2.16/ppc-sqrt_finite.patch       |  112 ++++
>   .../eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch |  123 +++++
>   .../eglibc/eglibc-2.16/rpc-bootstrap.patch         |   63 +++
>   .../eglibc-2.16/use-sysroot-cxx-headers.patch      |   42 ++
>   meta/recipes-core/eglibc/eglibc-initial_2.16.bb    |    6 +
>   meta/recipes-core/eglibc/eglibc-locale_2.16.bb     |    1 +
>   meta/recipes-core/eglibc/eglibc_2.16.bb            |  146 ++++++
>   18 files changed, 1389 insertions(+)
>   create mode 100644 meta/recipes-core/eglibc/
cross-localedef-native_2.16.bb
>   create mode 100644
meta/recipes-core/eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch
>   create mode 100644
meta/recipes-core/eglibc/eglibc-2.16/IO-acquire-lock-fix.patch
>   create mode 100644
meta/recipes-core/eglibc/eglibc-2.16/eglibc-svn-arm-lowlevellock-include-tls.patch
>   create mode 100644
meta/recipes-core/eglibc/eglibc-2.16/eglibc_fix_findidx_parameters.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/etc/ld.so.conf
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/
generate-supported.mk
>   create mode 100644
meta/recipes-core/eglibc/eglibc-2.16/initgroups_keys.patch
>   create mode 100644
meta/recipes-core/eglibc/eglibc-2.16/ld-search-order.patch
>   create mode 100644
meta/recipes-core/eglibc/eglibc-2.16/mips-rld-map-check.patch
>   create mode 100644
meta/recipes-core/eglibc/eglibc-2.16/multilib_readlib.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch
>   create mode 100644
meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt_finite.patch
>   create mode 100644
meta/recipes-core/eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch
>   create mode 100644
meta/recipes-core/eglibc/eglibc-2.16/rpc-bootstrap.patch
>   create mode 100644
meta/recipes-core/eglibc/eglibc-2.16/use-sysroot-cxx-headers.patch
>   create mode 100644 meta/recipes-core/eglibc/eglibc-initial_2.16.bb
>   create mode 100644 meta/recipes-core/eglibc/eglibc-locale_2.16.bb
>   create mode 100644 meta/recipes-core/eglibc/eglibc_2.16.bb
>
> diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.16.bbb/meta/recipes-core/eglibc/
cross-localedef-native_2.16.bb
> new file mode 100644
> index 0000000..88c701e
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
> @@ -0,0 +1,44 @@
> +DESCRIPTION = "Cross locale generation tool for eglibc"
> +HOMEPAGE = "http://www.eglibc.org/home"
> +SECTION = "libs"
> +LICENSE = "LGPL-2.1"
> +
> +LIC_DIR = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
> +LIC_FILES_CHKSUM = "file://${LIC_D

--bcaec52c6aa5318b2204c42125e2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Thursday, July 5, 2012, Saul Wold &lt;<a href=3D"mailto:sgw@linu=
x.intel.com">sgw@linux.intel.com</a>&gt; wrote:<br>&gt; On 07/05/2012 07:35=
 AM, Khem Raj wrote:<br>&gt;&gt;<br>&gt;&gt; Drop the patches that were eit=
her applied<br>
&gt;&gt; or fixed differenly in 2.16<br>&gt;&gt;<br>&gt;&gt; Add patches to=
 fix ppc spe patches to match<br>&gt;&gt; eglibc 2.16<br>&gt;&gt;<br>&gt;&g=
t; Fix CPPFLAGS to contain correct includepaths<br>&gt;&gt; so autoconf cac=
he is generated correctly<br>
&gt;&gt;<br>&gt;<br>&gt; Khem,<br>&gt;<br>&gt; Just to let you know that I =
will be doing builds with this set over the weekend and since we are approa=
ching a Milestone cut date, we will likely wait until after the freeze date=
 before including these changes.<br>
&gt;<br>&gt; I will keep you posted on my results.<br><br>Sure we need more=
 testing on them so they land in good shape<br>My aim is to use 2.16 in 1.3=
 release <br>&gt;<br>&gt; Sau!<br>&gt;<br>&gt; Signed-off-by: Khem Raj &lt;=
<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>&gt; =C2=A0 .../eglibc/<a href=3D"http://cross-localedef-native=
_2.16.bb">cross-localedef-native_2.16.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 44 ++<br>&gt; =C2=A0 .../eglibc/eglibc-2.16/GLRO_dl_debug_ma=
sk.patch =C2=A0 =C2=A0| =C2=A0108 ++++<br>&gt; =C2=A0 .../eglibc/eglibc-2.1=
6/IO-acquire-lock-fix.patch =C2=A0 | =C2=A0 17 +<br>
&gt; =C2=A0 .../eglibc-svn-arm-lowlevellock-include-tls.patch =C2=A0| =C2=
=A0 21 +<br>&gt; =C2=A0 .../eglibc_fix_findidx_parameters.patch =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 38 ++<br>&gt; =C2=A0 .../eglibc/egl=
ibc-2.16/<a href=3D"http://generate-supported.mk">generate-supported.mk</a>=
 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 11 +<br>
&gt; =C2=A0 .../eglibc/eglibc-2.16/initgroups_keys.patch =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 20 +<br>&gt; =C2=A0 .../eglibc/eglibc-2.16/ld-search-order.pat=
ch =C2=A0 =C2=A0 =C2=A0 | =C2=A0 56 ++<br>&gt; =C2=A0 .../eglibc/eglibc-2.1=
6/mips-rld-map-check.patch =C2=A0 =C2=A0| =C2=A0 26 +<br>&gt; =C2=A0 .../eg=
libc/eglibc-2.16/multilib_readlib.patch =C2=A0 =C2=A0 =C2=A0| =C2=A0 17 +<b=
r>
&gt; =C2=A0 .../recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch | =C2=A0538 =
++++++++++++++++++++<br>&gt; =C2=A0 .../eglibc/eglibc-2.16/ppc-sqrt_finite.=
patch =C2=A0 =C2=A0 =C2=A0 | =C2=A0112 ++++<br>&gt; =C2=A0 .../eglibc/eglib=
c-2.16/ppc_slow_ieee754_sqrt.patch | =C2=A0123 +++++<br>
&gt; =C2=A0 .../eglibc/eglibc-2.16/rpc-bootstrap.patch =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | =C2=A0 63 +++<br>&gt; =C2=A0 .../eglibc-2.16/use-sysroot-cxx-head=
ers.patch =C2=A0 =C2=A0 =C2=A0| =C2=A0 42 ++<br>&gt; =C2=A0 meta/recipes-co=
re/eglibc/<a href=3D"http://eglibc-initial_2.16.bb">eglibc-initial_2.16.bb<=
/a> =C2=A0 =C2=A0| =C2=A0 =C2=A06 +<br>
&gt; =C2=A0 meta/recipes-core/eglibc/<a href=3D"http://eglibc-locale_2.16.b=
b">eglibc-locale_2.16.bb</a> =C2=A0 =C2=A0 | =C2=A0 =C2=A01 +<br>&gt; =C2=
=A0 meta/recipes-core/eglibc/<a href=3D"http://eglibc_2.16.bb">eglibc_2.16.=
bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0146 ++++++<br>
&gt; =C2=A0 18 files changed, 1389 insertions(+)<br>&gt; =C2=A0 create mode=
 100644 meta/recipes-core/eglibc/<a href=3D"http://cross-localedef-native_2=
.16.bb">cross-localedef-native_2.16.bb</a><br>&gt; =C2=A0 create mode 10064=
4 meta/recipes-core/eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch<br>
&gt; =C2=A0 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/IO-acqu=
ire-lock-fix.patch<br>&gt; =C2=A0 create mode 100644 meta/recipes-core/egli=
bc/eglibc-2.16/eglibc-svn-arm-lowlevellock-include-tls.patch<br>&gt; =C2=A0=
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/eglibc_fix_findidx=
_parameters.patch<br>
&gt; =C2=A0 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/etc/ld.=
so.conf<br>&gt; =C2=A0 create mode 100644 meta/recipes-core/eglibc/eglibc-2=
.16/<a href=3D"http://generate-supported.mk">generate-supported.mk</a><br>&=
gt; =C2=A0 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/initgrou=
ps_keys.patch<br>
&gt; =C2=A0 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ld-sear=
ch-order.patch<br>&gt; =C2=A0 create mode 100644 meta/recipes-core/eglibc/e=
glibc-2.16/mips-rld-map-check.patch<br>&gt; =C2=A0 create mode 100644 meta/=
recipes-core/eglibc/eglibc-2.16/multilib_readlib.patch<br>
&gt; =C2=A0 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ppc-sqr=
t.patch<br>&gt; =C2=A0 create mode 100644 meta/recipes-core/eglibc/eglibc-2=
.16/ppc-sqrt_finite.patch<br>&gt; =C2=A0 create mode 100644 meta/recipes-co=
re/eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch<br>
&gt; =C2=A0 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/rpc-boo=
tstrap.patch<br>&gt; =C2=A0 create mode 100644 meta/recipes-core/eglibc/egl=
ibc-2.16/use-sysroot-cxx-headers.patch<br>&gt; =C2=A0 create mode 100644 me=
ta/recipes-core/eglibc/<a href=3D"http://eglibc-initial_2.16.bb">eglibc-ini=
tial_2.16.bb</a><br>
&gt; =C2=A0 create mode 100644 meta/recipes-core/eglibc/<a href=3D"http://e=
glibc-locale_2.16.bb">eglibc-locale_2.16.bb</a><br>&gt; =C2=A0 create mode =
100644 meta/recipes-core/eglibc/<a href=3D"http://eglibc_2.16.bb">eglibc_2.=
16.bb</a><br>
&gt;<br>&gt; diff --git a/meta/recipes-core/eglibc/<a href=3D"http://cross-=
localedef-native_2.16.bb">cross-localedef-native_2.16.bb</a> b/meta/recipes=
-core/eglibc/<a href=3D"http://cross-localedef-native_2.16.bb">cross-locale=
def-native_2.16.bb</a><br>
&gt; new file mode 100644<br>&gt; index 0000000..88c701e<br>&gt; --- /dev/n=
ull<br>&gt; +++ b/meta/recipes-core/eglibc/<a href=3D"http://cross-localede=
f-native_2.16.bb">cross-localedef-native_2.16.bb</a><br>&gt; @@ -0,0 +1,44 =
@@<br>
&gt; +DESCRIPTION =3D &quot;Cross locale generation tool for eglibc&quot;<b=
r>&gt; +HOMEPAGE =3D &quot;<a href=3D"http://www.eglibc.org/home">http://ww=
w.eglibc.org/home</a>&quot;<br>&gt; +SECTION =3D &quot;libs&quot;<br>&gt; +=
LICENSE =3D &quot;LGPL-2.1&quot;<br>
&gt; +<br>&gt; +LIC_DIR =3D &quot;${WORKDIR}/${EGLIBC_BRANCH}/libc&quot;<br=
>&gt; +LIC_FILES_CHKSUM =3D &quot;file://${LIC_D

--bcaec52c6aa5318b2204c42125e2--
