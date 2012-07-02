Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dennis.yxun@gmail.com>) id 1SlpDt-0005Bb-K0
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 00:36:01 +0200
Received: by obcva7 with SMTP id va7so8898443obc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2012 15:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=yeCSbseOnaYH163EvhSKhjlzqCxVKSuqaEFPx8nDkuM=;
	b=CUUeXgAu0Qi9KEE7F0GxXNp0f4B4WPCqc152eBNd4oZgR25Xs4ZYMK+QR3M5VGHvWO
	KFY1poQPU07/JbRyEV7oCKHcrHwJUBZ20VUBXk9JxJnGin/XiNZ9o8et5UcufQm0OaiQ
	CvIp6gdgVwVeUXvFfVduuJTyHmEuEXdnOqpkeqc/MFtIrJBY9g8/VYRF+7kjYrnIsBmT
	3ILsCxhVplkEeh1Rri5Lhr2AMQIXCf5vkbku2StJGem5zTpa4cSffjqbrapuQ3kXdQ+j
	JDsneMRKF+iG7ivq6E4qFL3wOeR6IfUkwgC+7q0sDL4C8rzBgHGD9qj1BucuznvjbQ41
	6qMw==
MIME-Version: 1.0
Received: by 10.182.1.101 with SMTP id 5mr10257116obl.74.1341267899575; Mon,
	02 Jul 2012 15:24:59 -0700 (PDT)
Received: by 10.182.37.134 with HTTP; Mon, 2 Jul 2012 15:24:59 -0700 (PDT)
Received: by 10.182.37.134 with HTTP; Mon, 2 Jul 2012 15:24:59 -0700 (PDT)
In-Reply-To: <4FEC93ED.2040102@linux.intel.com>
References: <1340859395-13638-1-git-send-email-dennis.lan@actions-semi.com>
	<4FEC93ED.2040102@linux.intel.com>
Date: Tue, 3 Jul 2012 06:24:59 +0800
Message-ID: <CAF1ZMEfVGmrhzMHwKErPo8x1wZCy_ZeVAGS4qDctpQ=d_jsAkg@mail.gmail.com>
From: "Dennis.Yxun" <dennis.yxun@gmail.com>
To: Saul Wold <sgw@linux.intel.com>, floppym@gentoo.org
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] openjade-native: fix undefined Getopts error, use std namespace
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
X-List-Received-Date: Mon, 02 Jul 2012 22:36:02 -0000
Content-Type: multipart/alternative; boundary=f46d04462f0ab3ec9c04c3e0449f

--f46d04462f0ab3ec9c04c3e0449f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

hi saul:
  please see my comment as following

dennis

At 2012-6-29 AM1:27=EF=BC=8C"Saul Wold" &
>
> On 06/27/2012 09:56 PM, dennis lan wrote:
>
>> From: Dennis Lan<dennis.yxun@gmail.com>
>>
>> Using Gentoo Linux as the build host, it fails without this patch
>> Use Getopt::Std in place of getopts.pl.
>>
>> https://bugs.gentoo.org/show_**bug.cgi?id=3D420083<https://bugs.gentoo.o=
rg/show_bug.cgi?id=3D420083>
>>
>> which following error:
>> /usr/bin/perl -w ./../msggen.pl -l jstyleModule InterpreterMessages.msg
>> /usr/bin/perl -w ./../msggen.pl -l jstyleModule DssslAppMessages.msg
>> Undefined subroutine&main::Getopts called at ./../msggen.pl line 22.
>> make[2]: *** [InterpreterMessages.h] Error 2
>> make[2]: *** Waiting for unfinished jobs....
>> Undefined subroutine&main::Getopts called at ./../msggen.pl line 22.
>> make[2]: *** [DssslAppMessages.h] Error 2
>>
>> Upstream-Status: Submitted [openjade-devel@lists.**sourceforge.net<openj=
ade-devel@lists.sourceforge.net>
>> ]
>>
>>  This needs to be in the patch file itself, we can track the patches
> better that way.
>
>> Signed-off-by: Dennis Lan<dennis.yxun@gmail.com>
>> ---
>>   .../openjade/openjade-1.3.2/**msggen.pl.patch        |   32
>> ++++++++++++++++++++
>>   .../openjade/openjade-native_**1.3.2.bb<http://openjade-native_1.3.2.b=
b>             |    1 +
>>   2 files changed, 33 insertions(+), 0 deletions(-)
>>   create mode 100644 meta/recipes-devtools/**openjade/openjade-1.3.2/**
>> msggen.pl.patch
>>
>> diff --git a/meta/recipes-devtools/**openjade/openjade-1.3.2/**msggen.pl=
.patch
>> b/meta/recipes-devtools/**openjade/openjade-1.3.2/**msggen.pl.patch
>> new file mode 100644
>> index 0000000..1afe68b
>> --- /dev/null
>> +++ b/meta/recipes-devtools/**openjade/openjade-1.3.2/**msggen.pl.patch
>>
>
> Please add comment Upstream-Status and SOB to the patch itself.
>
> Thanks
> Sau!
>
>  @@ -0,0 +1,32 @@
>> +Use Getopt::Std in place of getopts.pl.
>> +https://bugs.gentoo.org/show_**bug.cgi?id=3D420083<https://bugs.gentoo.=
org/show_bug.cgi?id=3D420083>
>> +
>> +--- a/msggen.pl
>> ++++ b/msggen.pl
>> +@@ -4,6 +4,7 @@
>> + # See the file COPYING for copying permission.
>> +
>> + use POSIX;
>> ++use Getopt::Std;
>> +
>> + # Package and version.
>> + $package =3D 'openjade';
>> +@@ -18,8 +19,7 @@
>> + undef $opt_l;
>> + undef $opt_p;
>> + undef $opt_t;
>> +-do 'getopts.pl';
>> +-&Getopts('l:p:t:');
>> ++getopts('l:p:t:');
>> + $module =3D $opt_l;
>> + $pot_file =3D $opt_p;
>> +
>> +@@ -72,7 +72,7 @@
>> +     else {
>> +       $field[0] =3D~ /^[IWQXE][0-9]$/ ||&error("invalid first field");=
;
>> +       $type[$num] =3D substr($field[0], 0, 1);
>> +-      $argc =3D int(substr($field[0], 1, 1));
>> ++      $argc =3D substr($field[0], 1, 1);
>> +     }
>> +     $nargs[$num] =3D $argc;
>> +     $field[1] =3D~ /^[a-zA-Z_][a-zA-Z0-9_]+$/ ||&error("invalid tag");
>> diff --git a/meta/recipes-devtools/**openjade/openjade-native_1.3.**2.bb=
<http://openjade-native_1.3.2.bb>b/meta/recipes-devtools/
>> **openjade/openjade-native_1.3.**2.bb <http://openjade-native_1.3.2.bb>
>> index 5b29c1f..efd1e11 100644
>> --- a/meta/recipes-devtools/**openjade/openjade-native_1.3.**2.bb<http:/=
/openjade-native_1.3.2.bb>
>> +++ b/meta/recipes-devtools/**openjade/openjade-native_1.3.**2.bb<http:/=
/openjade-native_1.3.2.bb>
>> @@ -14,6 +14,7 @@ RDEPENDS_${PN} =3D "sgml-common-native"
>>
>>   SRC_URI =3D "${SOURCEFORGE_MIRROR}/**openjade/openjade-${PV}.tar.gz \
>>              file://makefile.patch \
>> +           file://msggen.pl.patch \
>>              file://reautoconf.patch \
>>            file://user-declared-default-**constructor.patch"
>>
>>

--f46d04462f0ab3ec9c04c3e0449f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p>hi saul:<br>
=C2=A0 please see my comment as following</p>
<p>dennis</p>
<p>At 2012-6-29 AM1:27=EF=BC=8C&quot;Saul Wold&quot; &amp;<blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On 06/27/2012 09:56 PM, dennis lan wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Dennis Lan&lt;<a href=3D"mailto:dennis.yxun@gmail.com" target=3D"_bla=
nk">dennis.yxun@gmail.com</a>&gt;<br>
<br>
Using Gentoo Linux as the build host, it fails without this patch<br>
Use Getopt::Std in place of <a href=3D"http://getopts.pl" target=3D"_blank"=
>getopts.pl</a>.<br>
<br>
<a href=3D"https://bugs.gentoo.org/show_bug.cgi?id=3D420083" target=3D"_bla=
nk">https://bugs.gentoo.org/show_<u></u>bug.cgi?id=3D420083</a><br>
<br>
which following error:<br>
/usr/bin/perl -w ./../<a href=3D"http://msggen.pl" target=3D"_blank">msggen=
.pl</a> -l jstyleModule InterpreterMessages.msg<br>
/usr/bin/perl -w ./../<a href=3D"http://msggen.pl" target=3D"_blank">msggen=
.pl</a> -l jstyleModule DssslAppMessages.msg<br>
Undefined subroutine&amp;main::Getopts called at ./../<a href=3D"http://msg=
gen.pl" target=3D"_blank">msggen.pl</a> line 22.<br>
make[2]: *** [InterpreterMessages.h] Error 2<br>
make[2]: *** Waiting for unfinished jobs....<br>
Undefined subroutine&amp;main::Getopts called at ./../<a href=3D"http://msg=
gen.pl" target=3D"_blank">msggen.pl</a> line 22.<br>
make[2]: *** [DssslAppMessages.h] Error 2<br>
<br>
Upstream-Status: Submitted [<a href=3D"mailto:openjade-devel@lists.sourcefo=
rge.net" target=3D"_blank">openjade-devel@lists.<u></u>sourceforge.net</a>]=
<br>
<br>
</blockquote>
This needs to be in the patch file itself, we can track the patches better =
that way.<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Signed-off-by: Dennis Lan&lt;<a href=3D"mailto:dennis.yxun@gmail.com" targe=
t=3D"_blank">dennis.yxun@gmail.com</a>&gt;<br>
---<br>
=C2=A0 .../openjade/openjade-1.3.2/<u></u>msggen.pl.patch =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 32 ++++++++++++++++++++<br>
=C2=A0 .../openjade/<a href=3D"http://openjade-native_1.3.2.bb" target=3D"_=
blank">openjade-native_<u></u>1.3.2.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A01 +<br>
=C2=A0 2 files changed, 33 insertions(+), 0 deletions(-)<br>
=C2=A0 create mode 100644 meta/recipes-devtools/<u></u>openjade/openjade-1.=
3.2/<u></u>msggen.pl.patch<br>
<br>
diff --git a/meta/recipes-devtools/<u></u>openjade/openjade-1.3.2/<u></u>ms=
ggen.pl.patch b/meta/recipes-devtools/<u></u>openjade/openjade-1.3.2/<u></u=
>msggen.pl.patch<br>
new file mode 100644<br>
index 0000000..1afe68b<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/<u></u>openjade/openjade-1.3.2/<u></u>msggen.pl=
.patch<br>
</blockquote>
<br>
Please add comment Upstream-Status and SOB to the patch itself.<br>
<br>
Thanks<br>
Sau!<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
@@ -0,0 +1,32 @@<br>
+Use Getopt::Std in place of <a href=3D"http://getopts.pl" target=3D"_blank=
">getopts.pl</a>.<br>
+<a href=3D"https://bugs.gentoo.org/show_bug.cgi?id=3D420083" target=3D"_bl=
ank">https://bugs.gentoo.org/show_<u></u>bug.cgi?id=3D420083</a><br>
+<br>
+--- a/<a href=3D"http://msggen.pl" target=3D"_blank">msggen.pl</a><br>
++++ b/<a href=3D"http://msggen.pl" target=3D"_blank">msggen.pl</a><br>
+@@ -4,6 +4,7 @@<br>
+ # See the file COPYING for copying permission.<br>
+<br>
+ use POSIX;<br>
++use Getopt::Std;<br>
+<br>
+ # Package and version.<br>
+ $package =3D &#39;openjade&#39;;<br>
+@@ -18,8 +19,7 @@<br>
+ undef $opt_l;<br>
+ undef $opt_p;<br>
+ undef $opt_t;<br>
+-do &#39;<a href=3D"http://getopts.pl" target=3D"_blank">getopts.pl</a>&#3=
9;;<br>
+-&amp;Getopts(&#39;l:p:t:&#39;);<br>
++getopts(&#39;l:p:t:&#39;);<br>
+ $module =3D $opt_l;<br>
+ $pot_file =3D $opt_p;<br>
+<br>
+@@ -72,7 +72,7 @@<br>
+ =C2=A0 =C2=A0 else {<br>
+ =C2=A0 =C2=A0 =C2=A0 $field[0] =3D~ /^[IWQXE][0-9]$/ ||&amp;error(&quot;i=
nvalid first field&quot;);;<br>
+ =C2=A0 =C2=A0 =C2=A0 $type[$num] =3D substr($field[0], 0, 1);<br>
+- =C2=A0 =C2=A0 =C2=A0$argc =3D int(substr($field[0], 1, 1));<br>
++ =C2=A0 =C2=A0 =C2=A0$argc =3D substr($field[0], 1, 1);<br>
+ =C2=A0 =C2=A0 }<br>
+ =C2=A0 =C2=A0 $nargs[$num] =3D $argc;<br>
+ =C2=A0 =C2=A0 $field[1] =3D~ /^[a-zA-Z_][a-zA-Z0-9_]+$/ ||&amp;error(&quo=
t;invalid tag&quot;);<br>
diff --git a/meta/recipes-devtools/<u></u>openjade/<a href=3D"http://openja=
de-native_1.3.2.bb" target=3D"_blank">openjade-native_1.3.<u></u>2.bb</a> b=
/meta/recipes-devtools/<u></u>openjade/<a href=3D"http://openjade-native_1.=
3.2.bb" target=3D"_blank">openjade-native_1.3.<u></u>2.bb</a><br>

index 5b29c1f..efd1e11 100644<br>
--- a/meta/recipes-devtools/<u></u>openjade/<a href=3D"http://openjade-nati=
ve_1.3.2.bb" target=3D"_blank">openjade-native_1.3.<u></u>2.bb</a><br>
+++ b/meta/recipes-devtools/<u></u>openjade/<a href=3D"http://openjade-nati=
ve_1.3.2.bb" target=3D"_blank">openjade-native_1.3.<u></u>2.bb</a><br>
@@ -14,6 +14,7 @@ RDEPENDS_${PN} =3D &quot;sgml-common-native&quot;<br>
<br>
=C2=A0 SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/<u></u>openjade/openjade-${P=
V}.tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://makefile.patch \<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://msggen.pl.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://reautoconf.patch \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://user-declared-default-<u></=
u>constructor.patch&quot;<br>
<br>
</blockquote>
</blockquote></p>

--f46d04462f0ab3ec9c04c3e0449f--
