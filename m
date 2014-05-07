Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id E2C9A60167
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 02:30:57 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id as1so362837iec.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 May 2014 19:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=lfSGpflvCX52g31RrFMIef8mI2Dnu0dm88GcjSrLyus=;
	b=hOzGExbaDbtugr6YYJdHxDgPq++HXixY3gdgm4DYq5FrfnOdlnve8aMVNllcDUuOHi
	iCd3c5v2L7Bb724AIQHYjdcwN0TOg8rcts2rGcMs5OEIJOGdW6/zkl2gGPKhW2rxqzv/
	JqUVMNSBlMMEk+F6aNA1XTC5TVjL0GFI2SohfP6CyKZh6dk/AP8fwaEEsC8iHk02WzJp
	5r07iKVu/YBNh2fIyDUKVKVbo3h+faaAg/PjLUOSo7ys0a+fKpHDHrsuXX4hF62//LM2
	3nJ6Ny10Y1OAt/4p2w4H1qtbzjo3tPcmyfQzWyZtO1gQzShkpsHSpSZu0+bRZNWzal6i
	PrmQ==
MIME-Version: 1.0
X-Received: by 10.50.109.130 with SMTP id hs2mr37476981igb.29.1399429858529;
	Tue, 06 May 2014 19:30:58 -0700 (PDT)
Received: by 10.50.74.228 with HTTP; Tue, 6 May 2014 19:30:58 -0700 (PDT)
Received: by 10.50.74.228 with HTTP; Tue, 6 May 2014 19:30:58 -0700 (PDT)
In-Reply-To: <4fa3366ba6f01dbeedc243bcc512a967d5b39374.1399428662.git.Qi.Chen@windriver.com>
References: <cover.1399428662.git.Qi.Chen@windriver.com>
	<4fa3366ba6f01dbeedc243bcc512a967d5b39374.1399428662.git.Qi.Chen@windriver.com>
Date: Tue, 6 May 2014 19:30:58 -0700
Message-ID: <CAMKF1sqme+v9167=DfCG16kY8Y2Bft5wFoandyFk0oYqpwcmkQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sudo: upgrade from 1.8.9p5 to 1.8.10p2
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
X-List-Received-Date: Wed, 07 May 2014 02:31:05 -0000
Content-Type: multipart/alternative; boundary=089e0111bc9a9b1a5204f8c62720

--089e0111bc9a9b1a5204f8c62720
Content-Type: text/plain; charset=UTF-8

On May 6, 2014 7:12 PM, "Chen Qi" <Qi.Chen@windriver.com> wrote:
>
> Upgrade sudo from 1.8.9p5 to the newest stable release 1.8.10p2.
>
> The license information is modified as required.

can you b more explicit here and provide information as to what changed
exactly?

>
> As /var/run/sudo is the default directory for sudo's time stamp
> files, this patch adds a configuration file to manage this directory.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-extended/sudo/files/volatiles.99_sudo |    1 +
>  meta/recipes-extended/sudo/sudo.inc                |    6 +++---
>  .../sudo/{sudo_1.8.9p5.bb => sudo_1.8.10p2.bb}     |   13 ++++++++++---
>  3 files changed, 14 insertions(+), 6 deletions(-)
>  create mode 100644 meta/recipes-extended/sudo/files/volatiles.99_sudo
>  rename meta/recipes-extended/sudo/{sudo_1.8.9p5.bb => sudo_1.8.10p2.bb}
(57%)
>
> diff --git a/meta/recipes-extended/sudo/files/volatiles.99_sudo
b/meta/recipes-extended/sudo/files/volatiles.99_sudo
> new file mode 100644
> index 0000000..ecb576e
> --- /dev/null
> +++ b/meta/recipes-extended/sudo/files/volatiles.99_sudo
> @@ -0,0 +1 @@
> +d root root 0755 /var/run/sudo none
> diff --git a/meta/recipes-extended/sudo/sudo.inc
b/meta/recipes-extended/sudo/sudo.inc
> index 0aa5193..6de984a 100644
> --- a/meta/recipes-extended/sudo/sudo.inc
> +++ b/meta/recipes-extended/sudo/sudo.inc
> @@ -4,13 +4,14 @@ HOMEPAGE = "http://www.sudo.ws"
>  BUGTRACKER = "http://www.sudo.ws/bugs/"
>  SECTION = "admin"
>  LICENSE = "ISC & BSD & Zlib"
> -LIC_FILES_CHKSUM =
"file://doc/LICENSE;md5=923752f88decdea9d69f92fe42c2af80 \
> +LIC_FILES_CHKSUM =
"file://doc/LICENSE;md5=69e337d679950e304953813158595256 \
>
 file://plugins/sudoers/redblack.c;beginline=1;endline=41;md5=e2dbb155fc49beea947515300bab99e0
\
>
 file://compat/fnmatch.c;beginline=3;endline=27;md5=67f83ee9bd456557397082f8f1be0efd
\
>
 file://compat/getcwd.c;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681
\
>
 file://compat/glob.c;beginline=6;endline=31;md5=5872733146b9eb0deb79e1f664815b85
\
>
 file://compat/snprintf.c;beginline=6;endline=31;md5=c98b24f02967c095d7a70ae2e4d4d4ea
\
> -
 file://include/queue.h;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681"
> +
 file://include/queue.h;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681
\
> +
 file://compat/inet_pton.c;beginline=3;endline=17;md5=3970ab0518ab79cbd0bafb697f10b33a"
>
>  inherit autotools
>
> @@ -38,4 +39,3 @@ do_compile_prepend () {
>  do_install_prepend (){
>         mkdir -p ${D}/${localstatedir}/lib
>  }
> -
> diff --git a/meta/recipes-extended/sudo/sudo_1.8.9p5.bbb/meta/recipes-extended/sudo/
sudo_1.8.10p2.bb
> similarity index 57%
> rename from meta/recipes-extended/sudo/sudo_1.8.9p5.bb
> rename to meta/recipes-extended/sudo/sudo_1.8.10p2.bb
> index 7851473..aa8c445 100644
> --- a/meta/recipes-extended/sudo/sudo_1.8.9p5.bb
> +++ b/meta/recipes-extended/sudo/sudo_1.8.10p2.bb
> @@ -1,12 +1,13 @@
>  require sudo.inc
>
>  SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'pam',
'${PAM_SRC_URI}', '', d)}"
> +           ${@bb.utils.contains('DISTRO_FEATURES', 'pam',
'${PAM_SRC_URI}', '', d)} \
> +           file://volatiles.99_sudo"
>
>  PAM_SRC_URI = "file://sudo.pam"
>
> -SRC_URI[md5sum] = "d3f1f1cfca6b2b06b048e1abb7d0227e"
> -SRC_URI[sha256sum] =
"bc9d5c96de5f8b4d2b014f87a37870aef60d2891c869202454069150a21a5c21"
> +SRC_URI[md5sum] = "5e5eab1036a7cc2c088ab0d9b6b6a42e"
> +SRC_URI[sha256sum] =
"ba6cb8db6dccdb92a96e8ae63ca65c410f8b61270b603ab9af4b1154fef379f1"
>
>  DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam',
'', d)}"
>  RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam',
'pam-plugin-limits pam-plugin-keyinit', '', d)}"
> @@ -20,4 +21,10 @@ do_install_append () {
>
>         chmod 4111 ${D}${bindir}/sudo
>         chmod 0440 ${D}${sysconfdir}/sudoers
> +
> +       # Explicitly remove the ${localstatedir}/run directory as we can
> +       # manage it by a configuration file under
${sysconfdir}/default/volatiles/
> +       rmdir -p --ignore-fail-on-non-empty ${D}${localstatedir}/run/sudo
> +       install -d ${D}/${sysconfdir}/default/volatiles
> +       install -m 644 ${WORKDIR}/volatiles.99_sudo
${D}/${sysconfdir}/default/volatiles/99_sudo
>  }
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--089e0111bc9a9b1a5204f8c62720
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On May 6, 2014 7:12 PM, &quot;Chen Qi&quot; &lt;<a href=3D"mailto:Qi.Chen@w=
indriver.com">Qi.Chen@windriver.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Upgrade sudo from 1.8.9p5 to the newest stable release 1.8.10p2.<br>
&gt;<br>
&gt; The license information is modified as required.</p>
<p dir=3D"ltr">can you b more explicit here and provide information as to w=
hat changed exactly?</p>
<p dir=3D"ltr">&gt;<br>
&gt; As /var/run/sudo is the default directory for sudo&#39;s time stamp<br=
>
&gt; files, this patch adds a configuration file to manage this directory.<=
br>
&gt;<br>
&gt; Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi=
.Chen@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-extended/sudo/files/volatiles.99_sudo | =C2=A0 =C2=
=A01 +<br>
&gt; =C2=A0meta/recipes-extended/sudo/sudo.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A06 +++---<br>
&gt; =C2=A0.../sudo/{<a href=3D"http://sudo_1.8.9p5.bb">sudo_1.8.9p5.bb</a>=
 =3D&gt; <a href=3D"http://sudo_1.8.10p2.bb">sudo_1.8.10p2.bb</a>} =C2=A0 =
=C2=A0 | =C2=A0 13 ++++++++++---<br>
&gt; =C2=A03 files changed, 14 insertions(+), 6 deletions(-)<br>
&gt; =C2=A0create mode 100644 meta/recipes-extended/sudo/files/volatiles.99=
_sudo<br>
&gt; =C2=A0rename meta/recipes-extended/sudo/{<a href=3D"http://sudo_1.8.9p=
5.bb">sudo_1.8.9p5.bb</a> =3D&gt; <a href=3D"http://sudo_1.8.10p2.bb">sudo_=
1.8.10p2.bb</a>} (57%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/sudo/files/volatiles.99_sudo b/meta=
/recipes-extended/sudo/files/volatiles.99_sudo<br>
&gt; new file mode 100644<br>
&gt; index 0000000..ecb576e<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-extended/sudo/files/volatiles.99_sudo<br>
&gt; @@ -0,0 +1 @@<br>
&gt; +d root root 0755 /var/run/sudo none<br>
&gt; diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extend=
ed/sudo/sudo.inc<br>
&gt; index 0aa5193..6de984a 100644<br>
&gt; --- a/meta/recipes-extended/sudo/sudo.inc<br>
&gt; +++ b/meta/recipes-extended/sudo/sudo.inc<br>
&gt; @@ -4,13 +4,14 @@ HOMEPAGE =3D &quot;<a href=3D"http://www.sudo.ws">ht=
tp://www.sudo.ws</a>&quot;<br>
&gt; =C2=A0BUGTRACKER =3D &quot;<a href=3D"http://www.sudo.ws/bugs/">http:/=
/www.sudo.ws/bugs/</a>&quot;<br>
&gt; =C2=A0SECTION =3D &quot;admin&quot;<br>
&gt; =C2=A0LICENSE =3D &quot;ISC &amp; BSD &amp; Zlib&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://doc/LICENSE;md5=3D923752f88decdea9d=
69f92fe42c2af80 \<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://doc/LICENSE;md5=3D69e337d679950e304=
953813158595256 \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0file://plugins/sudoers/redblack.c;beginline=3D1;endline=3D41;md5=3De2=
dbb155fc49beea947515300bab99e0 \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0file://compat/fnmatch.c;beginline=3D3;endline=3D27;md5=3D67f83ee9bd45=
6557397082f8f1be0efd \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0file://compat/getcwd.c;beginline=3D5;endline=3D27;md5=3D449af4cc57fc7=
d46f42090608ba3e681 \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0file://compat/glob.c;beginline=3D6;endline=3D31;md5=3D5872733146b9eb0=
deb79e1f664815b85 \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0file://compat/snprintf.c;beginline=3D6;endline=3D31;md5=3Dc98b24f0296=
7c095d7a70ae2e4d4d4ea \<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://include/queue.h;beginline=3D5;endline=3D27;md5=3D449af4cc57fc7d46=
f42090608ba3e681&quot;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://include/queue.h;beginline=3D5;endline=3D27;md5=3D449af4cc57fc7d46=
f42090608ba3e681 \<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://compat/inet_pton.c;beginline=3D3;endline=3D17;md5=3D3970ab0518ab7=
9cbd0bafb697f10b33a&quot;<br>
&gt;<br>
&gt; =C2=A0inherit autotools<br>
&gt;<br>
&gt; @@ -38,4 +39,3 @@ do_compile_prepend () {<br>
&gt; =C2=A0do_install_prepend (){<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}/${localstatedir}/lib<br>
&gt; =C2=A0}<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-extended/sudo/<a href=3D"http://sudo_1.8.9p5=
.bb">sudo_1.8.9p5.bb</a> b/meta/recipes-extended/sudo/<a href=3D"http://sud=
o_1.8.10p2.bb">sudo_1.8.10p2.bb</a><br>
&gt; similarity index 57%<br>
&gt; rename from meta/recipes-extended/sudo/<a href=3D"http://sudo_1.8.9p5.=
bb">sudo_1.8.9p5.bb</a><br>
&gt; rename to meta/recipes-extended/sudo/<a href=3D"http://sudo_1.8.10p2.b=
b">sudo_1.8.10p2.bb</a><br>
&gt; index 7851473..aa8c445 100644<br>
&gt; --- a/meta/recipes-extended/sudo/<a href=3D"http://sudo_1.8.9p5.bb">su=
do_1.8.9p5.bb</a><br>
&gt; +++ b/meta/recipes-extended/sudo/<a href=3D"http://sudo_1.8.10p2.bb">s=
udo_1.8.10p2.bb</a><br>
&gt; @@ -1,12 +1,13 @@<br>
&gt; =C2=A0require sudo.inc<br>
&gt;<br>
&gt; =C2=A0SRC_URI =3D &quot;<a href=3D"http://ftp.sudo.ws/sudo/dist/sudo-$=
{PV}.tar.gz">http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz</a> \<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_=
FEATURES&#39;, &#39;pam&#39;, &#39;${PAM_SRC_URI}&#39;, &#39;&#39;, d)}&quo=
t;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_=
FEATURES&#39;, &#39;pam&#39;, &#39;${PAM_SRC_URI}&#39;, &#39;&#39;, d)} \<b=
r>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://volatiles.99_sudo&quot;<br=
>
&gt;<br>
&gt; =C2=A0PAM_SRC_URI =3D &quot;file://sudo.pam&quot;<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;d3f1f1cfca6b2b06b048e1abb7d0227e&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;bc9d5c96de5f8b4d2b014f87a37870aef60d2891=
c869202454069150a21a5c21&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;5e5eab1036a7cc2c088ab0d9b6b6a42e&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;ba6cb8db6dccdb92a96e8ae63ca65c410f8b6127=
0b603ab9af4b1154fef379f1&quot;<br>
&gt;<br>
&gt; =C2=A0DEPENDS +=3D &quot; ${@bb.utils.contains(&#39;DISTRO_FEATURES&#3=
9;, &#39;pam&#39;, &#39;libpam&#39;, &#39;&#39;, d)}&quot;<br>
&gt; =C2=A0RDEPENDS_${PN} +=3D &quot; ${@bb.utils.contains(&#39;DISTRO_FEAT=
URES&#39;, &#39;pam&#39;, &#39;pam-plugin-limits pam-plugin-keyinit&#39;, &=
#39;&#39;, d)}&quot;<br>
&gt; @@ -20,4 +21,10 @@ do_install_append () {<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 chmod 4111 ${D}${bindir}/sudo<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 chmod 0440 ${D}${sysconfdir}/sudoers<br>
&gt; +<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 # Explicitly remove the ${localstatedir}/run di=
rectory as we can<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 # manage it by a configuration file under ${sys=
confdir}/default/volatiles/<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 rmdir -p --ignore-fail-on-non-empty ${D}${local=
statedir}/run/sudo<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 install -d ${D}/${sysconfdir}/default/volatiles=
<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 install -m 644 ${WORKDIR}/volatiles.99_sudo ${D=
}/${sysconfdir}/default/volatiles/99_sudo<br>
&gt; =C2=A0}<br>
&gt; --<br>
&gt; 1.7.9.5<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--089e0111bc9a9b1a5204f8c62720--
