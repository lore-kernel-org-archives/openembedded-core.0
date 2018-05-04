Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id CFDC674702
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 10:24:15 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id 186-v6so2794977itu.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 03:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hTSbB9cl1n51ynW6YNKCPaMekK7COouPsg5MGHAY6FA=;
	b=W7jmxwqLD0FhVPHNQ2TJIOZKbtVKkzpLT8+bSIjWYrpz0LkDkYXN9cP7tevzjTQ9tN
	OKd1lWQRe57OctjMvARsbZcgO029wFrxATyBcAYkg1x6b9PXV5EuREzxqX8EwhBCYpQs
	E98YgokFmSSuBtmeFtYryCkVBZ00EaDVcsK41w2CAGAvmhNbYxXRMEZPAhgJSi/wuquk
	5BQbqa0hW933/tmOupHuG6Et5IetPVRWOJ80bQjQ2yEftSdilG+cvEdcwjwEeQGMmvnu
	IZkZZtkPCKHgCaDQC/nR97H8wePy1/Y+iRAfb+c7yC+ZVxVaIUEh2m1ouhnZuFVW+J8k
	R+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hTSbB9cl1n51ynW6YNKCPaMekK7COouPsg5MGHAY6FA=;
	b=ZFMBqdUGJmdxme+v+j5w6T097WnA1AzNPePKd03oEg4ML+2dwn7XN3jaeMrZBhbguM
	BclKT8Zjy8vl0EFlEangXS7nOeTSbgVoHc1p0ZC0TXepSFXdtWW/YJfyn9eOoTOQYuAL
	yy3rufqhb+uIGQ8X3FyuNmbUM13ltVLZ3HjCo/OudbFJUk/FYBCBk7rcfE367CNM+hdw
	u+rj6Bo+17W6s/IMLfow+7Bqhl+CV3yGFuHLjRJ0SulqYok3KOTzgmePBRVWo86rUZfL
	g6Gt4rydsqKCko+Z6Fs+11slUy7PgIad3JLf8mP4LS4YEc9UH4uz2QkXDMtbUgcBPBMi
	cCtw==
X-Gm-Message-State: ALQs6tCj7jMhMovQPVlWu5L1VKLt0UO4nC7XB8gRVYlTqWlHBRysTIBq
	w2+Fm2VrpD0veHO5ZiT9xrPfC3nryg8ukHTbyyEKWA==
X-Google-Smtp-Source: AB8JxZoUbpAT3O1bFtFlXvpbAz63w3A2vAOd/K0N+LbYGFLHXyBvjAzAWiS9uGPAcQ/UIM+y4gtUxf3p4mzpfMg0JtM=
X-Received: by 2002:a24:b803:: with SMTP id
	m3-v6mr27129744ite.131.1525429456333; 
	Fri, 04 May 2018 03:24:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.29.203 with HTTP; Fri, 4 May 2018 03:23:55 -0700 (PDT)
In-Reply-To: <CAMKF1sowEveYKrjFkNi9SmrtWYxtEqasXcbR0QFbs_V8hcw6hw@mail.gmail.com>
References: <20180503081758.4661-1-anuj.mittal@intel.com>
	<CAMKF1sowEveYKrjFkNi9SmrtWYxtEqasXcbR0QFbs_V8hcw6hw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 May 2018 11:23:55 +0100
Message-ID: <CAJTo0LbXVMbEAseGtawGOUqb2EL9=8EnfZxhgVoRa-U_Jw3xxg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/12] gstreamer1.0: upgrade 1.12.4 -> 1.14.0
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
X-List-Received-Date: Fri, 04 May 2018 10:24:16 -0000
Content-Type: multipart/alternative; boundary="000000000000e001e0056b5eb8a6"

--000000000000e001e0056b5eb8a6
Content-Type: text/plain; charset="UTF-8"

meta-gstreamer ships its own inc files (as it should).

Ross

On 3 May 2018 at 23:49, Khem Raj <raj.khem@gmail.com> wrote:

>
> On Thu, May 3, 2018 at 1:18 AM Anuj Mittal <anuj.mittal@intel.com> wrote:
>
>> * For changes, please see: https://gstreamer.freedesktop.
>> org/releases/1.14/
>> * Merge inc and bb file since we only have one version now.
>
>
> Threre is meta gstreamer can you check if this is not going to affect that
> layer
>
>>
>>
>> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>> ---
>>  meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb   | 14
>> --------------
>>  .../gstreamer/{gstreamer1.0.inc => gstreamer1.0_1.14.0.bb} | 12
>> +++++++++++-
>>  2 files changed, 11 insertions(+), 15 deletions(-)
>>  delete mode 100644 meta/recipes-multimedia/gstreamer/
>> gstreamer1.0_1.12.4.bb
>>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0.inc =>
>> gstreamer1.0_1.14.0.bb} (84%)
>>
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb
>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb
>> deleted file mode 100644
>> index 01b2396513..0000000000
>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb
>> +++ /dev/null
>> @@ -1,14 +0,0 @@
>> -require gstreamer1.0.inc
>> -
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d
>> \
>> -                    file://gst/gst.h;beginline=1;endline=21;md5=
>> e059138481205ee2c6fc1c079c016d0d"
>> -
>> -SRC_URI = " \
>> -    http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${
>> PV}.tar.xz \
>> -"
>> -SRC_URI[md5sum] = "9d268f2e891cce1ac0832f1cc467d4ea"
>> -SRC_URI[sha256sum] = "5a8704aa4c2eeb04da192c4a9942f9
>> 4f860ac1a585de90d9f914bac26a970674"
>> -
>> -S = "${WORKDIR}/gstreamer-${PV}"
>> -
>> -CVE_PRODUCT = "gstreamer"
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
>> b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
>> similarity index 84%
>> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
>> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
>> index c2df1f3258..b4398c8111 100644
>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
>> @@ -14,11 +14,19 @@ inherit autotools pkgconfig gettext
>> upstream-version-is-even gobject-introspecti
>>  # (it has a custom INTROSPECTION_INIT macro, and so must be used instead
>> of our common introspection.m4 file)
>>  acpaths = "-I ${S}/common/m4 -I ${S}/m4"
>>
>> -SRC_URI_append = " \
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d
>> \
>> +                    file://gst/gst.h;beginline=1;endline=21;md5=
>> e059138481205ee2c6fc1c079c016d0d"
>> +
>> +S = "${WORKDIR}/gstreamer-${PV}"
>> +
>> +SRC_URI = " \
>> +    http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${
>> PV}.tar.xz \
>>      file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
>> \
>>      file://gtk-doc-tweaks.patch \
>>      file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
>> \
>>  "
>> +SRC_URI[md5sum] = "63c7cbfb86aa28c4522e374dc5555b96"
>> +SRC_URI[sha256sum] = "fc361367f0d4b780a868a8833f9f30
>> b9c9f4ac9faea4e6b251db8b4b0398466e"
>>
>>  PACKAGECONFIG ??= ""
>>
>> @@ -59,3 +67,5 @@ do_configure[prefuncs] += "delete_pkg_m4_file"
>>  do_compile_prepend() {
>>          export GIR_EXTRA_LIBS_PATH="${B}/gst/.libs:${B}/libs/gst/base/.
>> libs"
>>  }
>> +
>> +CVE_PRODUCT = "gstreamer"
>> --
>> 2.14.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--000000000000e001e0056b5eb8a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">meta-gstreamer ships its own inc files (as it should).<div=
><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 3 May 2018 at 23:49, Khem Raj <span dir=3D"ltr">&lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><br><div class=3D=
"gmail_quote"><span class=3D""><div dir=3D"auto">On Thu, May 3, 2018 at 1:1=
8 AM Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_bl=
ank">anuj.mittal@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">* For changes, please see: <a href=3D"https://gstreamer.freedesktop.=
org/releases/1.14/" rel=3D"noreferrer" target=3D"_blank">https://gstreamer.=
freedesktop.<wbr>org/releases/1.14/</a><br>
* Merge inc and bb file since we only have one version now.</blockquote><di=
v dir=3D"auto"><br></div></span><div dir=3D"auto">Threre is meta gstreamer =
can you check if this is not going to affect that layer</div><div><div clas=
s=3D"h5"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><br>
<br>
Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" tar=
get=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstreamer1.0=
_1.12.4.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.12.4.<wbr>b=
b</a>=C2=A0 =C2=A0| 14 --------------<br>
=C2=A0.../gstreamer/{gstreamer1.0.<wbr>inc =3D&gt; <a href=3D"http://gstrea=
mer1.0_1.14.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.14.0.=
bb</a>} | 12 +++++++++++-<br>
=C2=A02 files changed, 11 insertions(+), 15 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"=
http://gstreamer1.0_1.12.4.bb" rel=3D"noreferrer" target=3D"_blank">gstream=
er1.0_1.12.4.<wbr>bb</a><br>
=C2=A0rename meta/recipes-multimedia/<wbr>gstreamer/{gstreamer1.0.inc =3D&g=
t; <a href=3D"http://gstreamer1.0_1.14.0.bb" rel=3D"noreferrer" target=3D"_=
blank">gstreamer1.0_1.14.0.bb</a>} (84%)<br>
<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstre=
amer1.0_1.12.4.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.12.4=
.<wbr>bb</a> b/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gst=
reamer1.0_1.12.4.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.12=
.4.<wbr>bb</a><br>
deleted file mode 100644<br>
index 01b2396513..0000000000<br>
--- a/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstreamer1.0=
_1.12.4.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.12.4.<wbr>b=
b</a><br>
+++ /dev/null<br>
@@ -1,14 +0,0 @@<br>
-require gstreamer1.0.inc<br>
-<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>6762ed442b3822387a51c=
92d928ead<wbr>0d \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://gst/gst.h;beginline=3D1;<wbr>endline=3D21;md5=3D<wbr>e059138481205ee2c6f=
c1c079c016d<wbr>0d&quot;<br>
-<br>
-SRC_URI =3D &quot; \<br>
-=C2=A0 =C2=A0 <a href=3D"http://gstreamer.freedesktop.org/src/gstreamer/gs=
treamer-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://gstre=
amer.freedesktop.<wbr>org/src/gstreamer/gstreamer-${<wbr>PV}.tar.xz</a> \<b=
r>
-&quot;<br>
-SRC_URI[md5sum] =3D &quot;<wbr>9d268f2e891cce1ac0832f1cc467d4<wbr>ea&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>5a8704aa4c2eeb04da192c4a9942f9<wbr>4f860=
ac1a585de90d9f914bac26a97<wbr>0674&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/gstreamer-${PV}&quot;<br>
-<br>
-CVE_PRODUCT =3D &quot;gstreamer&quot;<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0.inc b/meta=
/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstreamer1.0_1.14.0.bb=
" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.14.0.<wbr>bb</a><br>
similarity index 84%<br>
rename from meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0.inc<br>
rename to meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstreame=
r1.0_1.14.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.14.0.<w=
br>bb</a><br>
index c2df1f3258..b4398c8111 100644<br>
--- a/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0.inc<br>
+++ b/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gstreamer1.0=
_1.14.0.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.14.0.<wbr>b=
b</a><br>
@@ -14,11 +14,19 @@ inherit autotools pkgconfig gettext upstream-version-is=
-even gobject-introspecti<br>
=C2=A0# (it has a custom INTROSPECTION_INIT macro, and so must be used inst=
ead of our common introspection.m4 file)<br>
=C2=A0acpaths =3D &quot;-I ${S}/common/m4 -I ${S}/m4&quot;<br>
<br>
-SRC_URI_append =3D &quot; \<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>6762ed442b3822387a51c=
92d928ead<wbr>0d \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://gst/gst.h;beginline=3D1;<wbr>endline=3D21;md5=3D<wbr>e059138481205ee2c6f=
c1c079c016d<wbr>0d&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/gstreamer-${PV}&quot;<br>
+<br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 <a href=3D"http://gstreamer.freedesktop.org/src/gstreamer/gs=
treamer-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://gstre=
amer.freedesktop.<wbr>org/src/gstreamer/gstreamer-${<wbr>PV}.tar.xz</a> \<b=
r>
=C2=A0 =C2=A0 =C2=A0file://0001-introspection.m4-<wbr>prefix-pkgconfig-path=
s-with-<wbr>PKG_CON.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://gtk-doc-tweaks.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-gst-<wbr>gstpluginloader.c-when-env-<wbr>va=
r-is-set-do-not-fal.patch \<br>
=C2=A0&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>63c7cbfb86aa28c4522e374dc5555b<wbr>96&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>fc361367f0d4b780a868a8833f9f30<wbr>b9c9f=
4ac9faea4e6b251db8b4b0398<wbr>466e&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;&quot;<br>
<br>
@@ -59,3 +67,5 @@ do_configure[prefuncs] +=3D &quot;delete_pkg_m4_file&quot=
;<br>
=C2=A0do_compile_prepend() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export GIR_EXTRA_LIBS_PATH=3D&quot;${B}/g=
st/<wbr>.libs:${B}/libs/gst/base/.<wbr>libs&quot;<br>
=C2=A0}<br>
+<br>
+CVE_PRODUCT =3D &quot;gstreamer&quot;<br>
-- <br>
2.14.1<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</blockquote></div></div></div></div>
<br>-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--000000000000e001e0056b5eb8a6--
