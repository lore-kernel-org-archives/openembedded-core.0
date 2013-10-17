Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id C747460FF0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 16:00:03 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so1182125eaj.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 09:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=s7GlOiGyOqxePYxGsnDBrzJiLZjNv97usNBrNj1S1Ck=;
	b=ytwuFx751nfCnoAKWldxL68isnG/C6Zpt3/WX59Ihn7aU7gcYbE/Z2J+1Xrly6d22T
	GrFz59SISK398xd8war0+xxdDYve0u2WWAcVpqfTm8Tyb3RGcHwEAZ+hkY83TcOJldQK
	/oWYf6WAQ3WK64E822Tm6ChryzuNgHAhzGaKHvhbV6tjNrV9YK3HWfeW34EZeD42cTpP
	V83Ne/Ngth7pBNt61+FYC6OKBgyZP4L8wRLHCHowir22ZPhtzl+KeZueVHEjc/hVBnOS
	immqYYP322qiFWKErxkqjuHN5Je8W/u/dqb3lCRa6TaEy0hCaF9IZIw9xusUc9aujH6v
	QGMg==
MIME-Version: 1.0
X-Received: by 10.15.94.201 with SMTP id bb49mr13710162eeb.23.1382025605293;
	Thu, 17 Oct 2013 09:00:05 -0700 (PDT)
Received: by 10.14.118.15 with HTTP; Thu, 17 Oct 2013 09:00:05 -0700 (PDT)
Received: by 10.14.118.15 with HTTP; Thu, 17 Oct 2013 09:00:05 -0700 (PDT)
In-Reply-To: <525FF4C6.6020601@windriver.com>
References: <1382018386-25389-1-git-send-email-david.nystrom@enea.com>
	<1382018386-25389-12-git-send-email-david.nystrom@enea.com>
	<525FF4C6.6020601@windriver.com>
Date: Thu, 17 Oct 2013 18:00:05 +0200
Message-ID: <CAAKB1h1iTcO7S5ptpAV+UV72VXGVGeTu6Uzjz2f9m+QJkFcnFw@mail.gmail.com>
From: David Nystrom <david.c.nystrom@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/11] rpm: Add nativesdk in BBCLASSEXTEND
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
X-List-Received-Date: Thu, 17 Oct 2013 16:00:04 -0000
Content-Type: multipart/alternative; boundary=089e01681f42462e1804e8f1e9bb

--089e01681f42462e1804e8f1e9bb
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 17 Oct 2013 16:31, "Mark Hatle" <mark.hatle@windriver.com> wrote:
>
> On 10/17/13 8:59 AM, David Nystr=F6m wrote:
>
> Should have a commit message explaining the various changes.
>
>
>> Signed-off-by: David Nystr=F6m <david.nystrom@enea.com>
>> ---
>>   meta/recipes-devtools/rpm/rpm_5.4.9.bb | 24 ++++++++++++++++++------
>>   1 file changed, 18 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bbb/meta/recipes-devtoo=
ls/rpm/
rpm_5.4.9.bb
>> index 3c7e03b..0630f74 100644
>> --- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
>> +++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
>> @@ -105,12 +105,12 @@ acpaths =3D "-I ${S}/db/dist/aclocal -I
${S}/db/dist/aclocal_java"
>>   # Specify the default rpm macros in terms of adjustable variables
>>   rpm_macros =3D
"%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_targe=
t}/macros:%{_etcrpm}/macros.*:%{_etcrpm}/macros:%{_etcrpm}/%{_target}/macro=
s:~/.oerpmmacros"
>>   rpm_macros_class-native =3D
"%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_targe=
t}/macros:~/.oerpmmacros"
>> +rpm_macros_class-nativesdk =3D
"%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_targe=
t}/macros:~/.oerpmmacros"
>>
>>   # sqlite lua tcl augeas nss gcrypt neon xz xar keyutils perl selinux
>>
>>   # Note: perl and sqlite w/o db specified does not currently work.
>>   #       tcl, augeas, nss, gcrypt, xar and keyutils support is untested=
.
>> -PACKAGECONFIG_class-native ??=3D "db bzip2 zlib beecrypt openssl libelf
python"
>>   PACKAGECONFIG ??=3D "db bzip2 zlib beecrypt openssl libelf python"
>>
>>   PACKAGECONFIG[bzip2] =3D "--with-bzip2,--without-bzip2,bzip2,"
>> @@ -224,8 +224,11 @@ FILES_${PN} =3D  "${bindir}/rpm \
>>                 ${libdir}/rpm/bin/rpmrepo \
>>                 ${libdir}/rpm/bin/rpmspecdump \
>>                 ${libdir}/rpm/bin/wget \
>> -               /var/lib/rpm \
>> -               /var/cache/rpm \
>> +               ${libdir}/rpm \
>> +               ${localstatedir}/cache/rpm \
>> +               ${localstatedir}/cache/wdj \
>> +               ${localstatedir}/lib/rpm \
>> +               ${localstatedir}/lib/wdj \
>
>
> The above was hard defined because the /var/lib, /var/cache locations
were hard coded into RPM itself and did not vary based on
libdir/localstatedir.  It's possible this has changed since the work was
originally done.  But you should be sure to verify that.

I was under the impression that localstatedir always resolved to /var,
But your probably correct about libdir above(/usr/lib vs. /lib), will
return with V2.

The reason for the change is that nativesdk variable-expansion is
different(broken ?) from target/native, and will not find items from
hardcoded libdir, bindir et.c.

Postinstall hooks using libdir, bindir et.al. when built in nativesdk mode
is equally "broken".

>
>
> Otherwise the content looks fine.
>
> --Mark
>
>
>>                 "
>>
>>   FILES_${PN}-dbg +=3D "${libdir}/rpm/.debug \
>> @@ -235,7 +238,7 @@ FILES_${PN}-dbg +=3D "${libdir}/rpm/.debug \
>>   FILES_${PN}-common =3D "${bindir}/rpm2cpio \
>>                 ${bindir}/gendiff \
>>                 ${sysconfdir}/rpm \
>> -               /var/spool/repackage \
>> +               ${localstatedir}/spool/repackage \
>>                 "
>>
>>   FILES_${PN}-libs =3D "${libdir}/librpm-*.so \
>> @@ -313,6 +316,7 @@ FILES_${PN}-build =3D "${prefix}/src/rpm \
>>                 "
>>   RDEPENDS_${PN} =3D "base-files run-postinsts"
>>   RDEPENDS_${PN}_class-native =3D ""
>> +RDEPENDS_${PN}_class-nativesdk =3D ""
>>   RDEPENDS_${PN}-build =3D "file"
>>
>>   RDEPENDS_python-rpm =3D "${PN}"
>> @@ -452,7 +456,7 @@ do_install_append() {
>>
>>   }
>>
>> -do_install_append_class-native() {
>> +add_native_wrapper() {
>>           create_wrapper ${D}/${bindir}/rpm \
>>                 RPM_USRLIBRPM=3D'`dirname
$''realpath`'/${@os.path.relpath(d.getVar('libdir', True),
d.getVar('bindir', True))}/rpm \
>>                 RPM_ETCRPM=3D'$'{RPM_ETCRPM-'`dirname
$''realpath`'/${@os.path.relpath(d.getVar('sysconfdir', True),
d.getVar('bindir', True))}/rpm} \
>> @@ -481,4 +485,12 @@ do_install_append_class-native() {
>>         done
>>   }
>>
>> -BBCLASSEXTEND =3D "native"
>> +do_install_append_class-native() {
>> +       add_native_wrapper
>> +}
>> +
>> +do_install_append_class-nativesdk() {
>> +       add_native_wrapper
>> +}
>> +
>> +BBCLASSEXTEND =3D "native nativesdk"
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--089e01681f42462e1804e8f1e9bb
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On 17 Oct 2013 16:31, &quot;Mark Hatle&quot; &lt;<a href=3D"mailto:mark.hat=
le@windriver.com">mark.hatle@windriver.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 10/17/13 8:59 AM, David Nystr=F6m wrote:<br>
&gt;<br>
&gt; Should have a commit message explaining the various changes.<br>
&gt;<br>
&gt;<br>
&gt;&gt; Signed-off-by: David Nystr=F6m &lt;<a href=3D"mailto:david.nystrom=
@enea.com">david.nystrom@enea.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =A0 meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.9.bb">rpm_=
5.4.9.bb</a> | 24 ++++++++++++++++++------<br>
&gt;&gt; =A0 1 file changed, 18 insertions(+), 6 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.9=
.bb">rpm_5.4.9.bb</a> b/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4=
.9.bb">rpm_5.4.9.bb</a><br>
&gt;&gt; index 3c7e03b..0630f74 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.9.bb">rp=
m_5.4.9.bb</a><br>
&gt;&gt; +++ b/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.9.bb">rp=
m_5.4.9.bb</a><br>
&gt;&gt; @@ -105,12 +105,12 @@ acpaths =3D &quot;-I ${S}/db/dist/aclocal -I=
 ${S}/db/dist/aclocal_java&quot;<br>
&gt;&gt; =A0 # Specify the default rpm macros in terms of adjustable variab=
les<br>
&gt;&gt; =A0 rpm_macros =3D &quot;%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/m=
acros:%{_usrlibrpm}/poky/%{_target}/macros:%{_etcrpm}/macros.*:%{_etcrpm}/m=
acros:%{_etcrpm}/%{_target}/macros:~/.oerpmmacros&quot;<br>
&gt;&gt; =A0 rpm_macros_class-native =3D &quot;%{_usrlibrpm}/macros:%{_usrl=
ibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:~/.oerpmmacros&quot=
;<br>
&gt;&gt; +rpm_macros_class-nativesdk =3D &quot;%{_usrlibrpm}/macros:%{_usrl=
ibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:~/.oerpmmacros&quot=
;<br>
&gt;&gt;<br>
&gt;&gt; =A0 # sqlite lua tcl augeas nss gcrypt neon xz xar keyutils perl s=
elinux<br>
&gt;&gt;<br>
&gt;&gt; =A0 # Note: perl and sqlite w/o db specified does not currently wo=
rk.<br>
&gt;&gt; =A0 # =A0 =A0 =A0 tcl, augeas, nss, gcrypt, xar and keyutils suppo=
rt is untested.<br>
&gt;&gt; -PACKAGECONFIG_class-native ??=3D &quot;db bzip2 zlib beecrypt ope=
nssl libelf python&quot;<br>
&gt;&gt; =A0 PACKAGECONFIG ??=3D &quot;db bzip2 zlib beecrypt openssl libel=
f python&quot;<br>
&gt;&gt;<br>
&gt;&gt; =A0 PACKAGECONFIG[bzip2] =3D &quot;--with-bzip2,--without-bzip2,bz=
ip2,&quot;<br>
&gt;&gt; @@ -224,8 +224,11 @@ FILES_${PN} =3D =A0&quot;${bindir}/rpm \<br>
&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/rpm/bin/rpmrepo \<br>
&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/rpm/bin/rpmspecdump \<br=
>
&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/rpm/bin/wget \<br>
&gt;&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /var/lib/rpm \<br>
&gt;&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /var/cache/rpm \<br>
&gt;&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/rpm \<br>
&gt;&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${localstatedir}/cache/rpm \<br>
&gt;&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${localstatedir}/cache/wdj \<br>
&gt;&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${localstatedir}/lib/rpm \<br>
&gt;&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${localstatedir}/lib/wdj \<br>
&gt;<br>
&gt;<br>
&gt; The above was hard defined because the /var/lib, /var/cache locations =
were hard coded into RPM itself and did not vary based on libdir/localstate=
dir. =A0It&#39;s possible this has changed since the work was originally do=
ne. =A0But you should be sure to verify that.</p>

<p dir=3D"ltr">I was under the impression that localstatedir always resolve=
d to /var,<br>
But your probably correct about libdir above(/usr/lib vs. /lib), will retur=
n with V2.</p>
<p dir=3D"ltr">The reason for the change is that nativesdk variable-expansi=
on is different(broken ?) from target/native, and will not find items from =
hardcoded libdir, bindir et.c.</p>
<p dir=3D"ltr">Postinstall hooks using libdir, bindir <a href=3D"http://et.=
al">et.al</a>. when built in nativesdk mode is equally &quot;broken&quot;.<=
/p>
<p dir=3D"ltr">&gt;<br>
&gt;<br>
&gt; Otherwise the content looks fine.<br>
&gt;<br>
&gt; --Mark<br>
&gt;<br>
&gt;<br>
&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &quot;<br>
&gt;&gt;<br>
&gt;&gt; =A0 FILES_${PN}-dbg +=3D &quot;${libdir}/rpm/.debug \<br>
&gt;&gt; @@ -235,7 +238,7 @@ FILES_${PN}-dbg +=3D &quot;${libdir}/rpm/.debu=
g \<br>
&gt;&gt; =A0 FILES_${PN}-common =3D &quot;${bindir}/rpm2cpio \<br>
&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${bindir}/gendiff \<br>
&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${sysconfdir}/rpm \<br>
&gt;&gt; - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /var/spool/repackage \<br>
&gt;&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${localstatedir}/spool/repackage \<b=
r>
&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &quot;<br>
&gt;&gt;<br>
&gt;&gt; =A0 FILES_${PN}-libs =3D &quot;${libdir}/librpm-*.so \<br>
&gt;&gt; @@ -313,6 +316,7 @@ FILES_${PN}-build =3D &quot;${prefix}/src/rpm =
\<br>
&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &quot;<br>
&gt;&gt; =A0 RDEPENDS_${PN} =3D &quot;base-files run-postinsts&quot;<br>
&gt;&gt; =A0 RDEPENDS_${PN}_class-native =3D &quot;&quot;<br>
&gt;&gt; +RDEPENDS_${PN}_class-nativesdk =3D &quot;&quot;<br>
&gt;&gt; =A0 RDEPENDS_${PN}-build =3D &quot;file&quot;<br>
&gt;&gt;<br>
&gt;&gt; =A0 RDEPENDS_python-rpm =3D &quot;${PN}&quot;<br>
&gt;&gt; @@ -452,7 +456,7 @@ do_install_append() {<br>
&gt;&gt;<br>
&gt;&gt; =A0 }<br>
&gt;&gt;<br>
&gt;&gt; -do_install_append_class-native() {<br>
&gt;&gt; +add_native_wrapper() {<br>
&gt;&gt; =A0 =A0 =A0 =A0 =A0 create_wrapper ${D}/${bindir}/rpm \<br>
&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 RPM_USRLIBRPM=3D&#39;`dirname $&#3=
9;&#39;realpath`&#39;/${@os.path.relpath(d.getVar(&#39;libdir&#39;, True), =
d.getVar(&#39;bindir&#39;, True))}/rpm \<br>
&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 RPM_ETCRPM=3D&#39;$&#39;{RPM_ETCRP=
M-&#39;`dirname $&#39;&#39;realpath`&#39;/${@os.path.relpath(d.getVar(&#39;=
sysconfdir&#39;, True), d.getVar(&#39;bindir&#39;, True))}/rpm} \<br>
&gt;&gt; @@ -481,4 +485,12 @@ do_install_append_class-native() {<br>
&gt;&gt; =A0 =A0 =A0 =A0 done<br>
&gt;&gt; =A0 }<br>
&gt;&gt;<br>
&gt;&gt; -BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt;&gt; +do_install_append_class-native() {<br>
&gt;&gt; + =A0 =A0 =A0 add_native_wrapper<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +do_install_append_class-nativesdk() {<br>
&gt;&gt; + =A0 =A0 =A0 add_native_wrapper<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt;&gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--089e01681f42462e1804e8f1e9bb--
