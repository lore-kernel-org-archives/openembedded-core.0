Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dennis.yxun@gmail.com>) id 1SlrAe-0000jk-1e
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 02:40:48 +0200
Received: by obcva7 with SMTP id va7so9043907obc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2012 17:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=KuoLHbpHx0z6ijdQe6G52/mA8sNQR6x10mtUpyx7DD8=;
	b=qWrQIvh7LFa7F4eX+znvsOoh8YfUwf3rNElOgA3aw5JSGVmvW0otpSYF6wSyqN/kNn
	3MVzxzhguMUbb6NZ5GSPPfXiawaXZ6NT4V0WQMFRNsVqItbns8OKgHqKGUiHLccHmk8o
	8MfhAHw7twHAt2CiQV98M6EBgsWSR5DEITxIcGb1bq7EzvuCkYQzLQRh+KFtBc3rfe+J
	DRVKndumGl/76i2IFHhpCefp3Qw702/SBckfkax7+u+jqBju2zsj7YpPY9lyj0oEKQWW
	n8WhJ3bspAiy+C/jHeHUnT4wXZQq3NClUNAx3SXHp0w29E1BDCoBGrGPlZ0t1p/yuCqB
	Xwzw==
MIME-Version: 1.0
Received: by 10.60.20.74 with SMTP id l10mr16227421oee.19.1341275386020; Mon,
	02 Jul 2012 17:29:46 -0700 (PDT)
Received: by 10.182.37.134 with HTTP; Mon, 2 Jul 2012 17:29:45 -0700 (PDT)
Received: by 10.182.37.134 with HTTP; Mon, 2 Jul 2012 17:29:45 -0700 (PDT)
In-Reply-To: <4FF232D7.70906@linux.intel.com>
References: <1340859395-13638-1-git-send-email-dennis.lan@actions-semi.com>
	<4FEC93ED.2040102@linux.intel.com>
	<CAF1ZMEfVGmrhzMHwKErPo8x1wZCy_ZeVAGS4qDctpQ=d_jsAkg@mail.gmail.com>
	<4FF232D7.70906@linux.intel.com>
Date: Tue, 3 Jul 2012 08:29:45 +0800
Message-ID: <CAF1ZMEdRP77A808Lc4_p0VpanH+hmwfgpeyaMaXcRgw4p7Y1tw@mail.gmail.com>
From: "Dennis.Yxun" <dennis.yxun@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: floppym@gentoo.org, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Tue, 03 Jul 2012 00:40:48 -0000
Content-Type: multipart/alternative; boundary=e89a8f923f7cee022504c3e202be

--e89a8f923f7cee022504c3e202be
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

hi saul:
  it seems that my inline comments got lost.
   ok, since the origial patch is took from gentoo upstream. so, i thought
better to keep what it was, instead of trying to modify. but if you insist,
i could cook another patch, put mike(floppym) as author-of?
  besides, as mike already point out, the openjade upstream is dead, and i
still got no response from them, chance that patch will got accept is rare.
what's the upstream-status do you suggest?
=E5=9C=A8 2012-7-3 =E4=B8=8A=E5=8D=887:46=EF=BC=8C"Saul Wold" <sgw@linux.in=
tel.com>=E5=86=99=E9=81=93=EF=BC=9A

> On 07/02/2012 03:24 PM, Dennis.Yxun wrote:
>
>> hi saul:
>>    please see my comment as following
>>
>>  I do not understand what you are getting at here?
>
> You PATCH file openjade-1.3.2/msggen.pl.patch is what is missing the
> Upsteam-Status: and SOB (Signed-off-by), the commit message what you have
> for SOB is Ok, the commit message itself should not have the
> Upstream-Status: tag, it belongs in the .patch file header.
>
> Sau!
>
>  dennis
>>
>> At 2012-6-29 AM1:27=EF=BC=8C"Saul Wold" &
>>
>>     On 06/27/2012 09:56 PM, dennis lan wrote:
>>
>>         From: Dennis Lan<dennis.yxun@gmail.com
>>         <mailto:dennis.yxun@gmail.com>**>
>>
>>         Using Gentoo Linux as the build host, it fails without this patc=
h
>>         Use Getopt::Std in place of getopts.pl <http://getopts.pl>.
>>
>>         https://bugs.gentoo.org/show__**_bug.cgi?id=3D420083<https://bug=
s.gentoo.org/show___bug.cgi?id=3D420083>
>>         <https://bugs.gentoo.org/show_**bug.cgi?id=3D420083<https://bugs=
.gentoo.org/show_bug.cgi?id=3D420083>
>> >
>>
>>         which following error:
>>         /usr/bin/perl -w ./../msggen.pl <http://msggen.pl> -l
>>         jstyleModule InterpreterMessages.msg
>>         /usr/bin/perl -w ./../msggen.pl <http://msggen.pl> -l
>>         jstyleModule DssslAppMessages.msg
>>         Undefined subroutine&main::Getopts called at ./../msggen.pl
>>         <http://msggen.pl> line 22.
>>         make[2]: *** [InterpreterMessages.h] Error 2
>>         make[2]: *** Waiting for unfinished jobs....
>>         Undefined subroutine&main::Getopts called at ./../msggen.pl
>>         <http://msggen.pl> line 22.
>>         make[2]: *** [DssslAppMessages.h] Error 2
>>
>>         Upstream-Status: Submitted
>>         [openjade-devel@lists.__source**forge.net<http://sourceforge.net=
>
>>         <mailto:openjade-devel@lists.**sourceforge.net<openjade-devel@li=
sts.sourceforge.net>
>> >]
>>
>>     This needs to be in the patch file itself, we can track the patches
>>     better that way.
>>
>>         Signed-off-by: Dennis Lan<dennis.yxun@gmail.com
>>         <mailto:dennis.yxun@gmail.com>**>
>>         ---
>>            .../openjade/openjade-1.3.2/__**msggen.pl.patch        |   32
>>         ++++++++++++++++++++
>>            .../openjade/openjade-native__**_1.3.2.bb<http://openjade-nat=
ive___1.3.2.bb>
>>         <http://openjade-native_1.3.2.**bb<http://openjade-native_1.3.2.=
bb>>
>>              |    1 +
>>            2 files changed, 33 insertions(+), 0 deletions(-)
>>            create mode 100644
>>         meta/recipes-devtools/__**openjade/openjade-1.3.2/__**
>> msggen.pl.patch
>>
>>         diff --git
>>         a/meta/recipes-devtools/__**openjade/openjade-1.3.2/__**
>> msggen.pl.patch
>>         b/meta/recipes-devtools/__**openjade/openjade-1.3.2/__**
>> msggen.pl.patch
>>         new file mode 100644
>>         index 0000000..1afe68b
>>         --- /dev/null
>>         +++
>>         b/meta/recipes-devtools/__**openjade/openjade-1.3.2/__**
>> msggen.pl.patch
>>
>>
>>     Please add comment Upstream-Status and SOB to the patch itself.
>>
>>     Thanks
>>     Sau!
>>
>>         @@ -0,0 +1,32 @@
>>         +Use Getopt::Std in place of getopts.pl <http://getopts.pl>.
>>         +https://bugs.gentoo.org/show_**__bug.cgi?id=3D420083<https://bu=
gs.gentoo.org/show___bug.cgi?id=3D420083>
>>         <https://bugs.gentoo.org/show_**bug.cgi?id=3D420083<https://bugs=
.gentoo.org/show_bug.cgi?id=3D420083>
>> >
>>         +
>>         +--- a/msggen.pl <http://msggen.pl>
>>         ++++ b/msggen.pl <http://msggen.pl>
>>         +@@ -4,6 +4,7 @@
>>         + # See the file COPYING for copying permission.
>>         +
>>         + use POSIX;
>>         ++use Getopt::Std;
>>         +
>>         + # Package and version.
>>         + $package =3D 'openjade';
>>         +@@ -18,8 +19,7 @@
>>         + undef $opt_l;
>>         + undef $opt_p;
>>         + undef $opt_t;
>>         +-do 'getopts.pl <http://getopts.pl>';
>>         +-&Getopts('l:p:t:');
>>         ++getopts('l:p:t:');
>>         + $module =3D $opt_l;
>>         + $pot_file =3D $opt_p;
>>         +
>>         +@@ -72,7 +72,7 @@
>>         +     else {
>>         +       $field[0] =3D~ /^[IWQXE][0-9]$/ ||&error("invalid first
>>         field");;
>>         +       $type[$num] =3D substr($field[0], 0, 1);
>>         +-      $argc =3D int(substr($field[0], 1, 1));
>>         ++      $argc =3D substr($field[0], 1, 1);
>>         +     }
>>         +     $nargs[$num] =3D $argc;
>>         +     $field[1] =3D~ /^[a-zA-Z_][a-zA-Z0-9_]+$/ ||&error("invali=
d
>>         tag");
>>         diff --git
>>         a/meta/recipes-devtools/__**openjade/openjade-native_1.3._**_2.b=
b
>>         <http://openjade-native_1.3.2.**bb<http://openjade-native_1.3.2.=
bb>
>> >
>>         b/meta/recipes-devtools/__**openjade/openjade-native_1.3._**_2.b=
b
>>         <http://openjade-native_1.3.2.**bb<http://openjade-native_1.3.2.=
bb>
>> >
>>         index 5b29c1f..efd1e11 100644
>>         ---
>>         a/meta/recipes-devtools/__**openjade/openjade-native_1.3._**_2.b=
b
>>         <http://openjade-native_1.3.2.**bb<http://openjade-native_1.3.2.=
bb>
>> >
>>         +++
>>         b/meta/recipes-devtools/__**openjade/openjade-native_1.3._**_2.b=
b
>>         <http://openjade-native_1.3.2.**bb<http://openjade-native_1.3.2.=
bb>
>> >
>>         @@ -14,6 +14,7 @@ RDEPENDS_${PN} =3D "sgml-common-native"
>>
>>            SRC_URI =3D
>>         "${SOURCEFORGE_MIRROR}/__**openjade/openjade-${PV}.tar.gz \
>>                       file://makefile.patch \
>>         +           file://msggen.pl.patch \
>>                       file://reautoconf.patch \
>>                     file://user-declared-default-_**_constructor.patch"
>>
>>

--e89a8f923f7cee022504c3e202be
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p>hi saul:<br>
=C2=A0 it seems that my inline comments got lost.<br>
=C2=A0=C2=A0 ok, since the origial patch is took from gentoo upstream. so, =
i thought better to keep what it was, instead of trying to modify. but if y=
ou insist, i could cook another patch, put mike(floppym) as author-of?<br>
=C2=A0 besides, as mike already point out, the openjade upstream is dead, a=
nd i still got no response from them, chance that patch will got accept is =
rare. what&#39;s the upstream-status do you suggest?</p>
<div class=3D"gmail_quote">=E5=9C=A8 2012-7-3 =E4=B8=8A=E5=8D=887:46=EF=BC=
=8C&quot;Saul Wold&quot; &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@lin=
ux.intel.com</a>&gt;=E5=86=99=E9=81=93=EF=BC=9A<br type=3D"attribution"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">
On 07/02/2012 03:24 PM, Dennis.Yxun wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
hi saul:<br>
=C2=A0 =C2=A0please see my comment as following<br>
<br>
</blockquote>
I do not understand what you are getting at here?<br>
<br>
You PATCH file openjade-1.3.2/msggen.pl.patch is what is missing the Upstea=
m-Status: and SOB (Signed-off-by), the commit message what you have for SOB=
 is Ok, the commit message itself should not have the Upstream-Status: tag,=
 it belongs in the .patch file header.<br>

<br>
Sau!<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
dennis<br>
<br>
At 2012-6-29 AM1:27=EF=BC=8C&quot;Saul Wold&quot; &amp;<br>
<br>
=C2=A0 =C2=A0 On 06/27/2012 09:56 PM, dennis lan wrote:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 From: Dennis Lan&lt;<a href=3D"mailto:dennis.yx=
un@gmail.com" target=3D"_blank">dennis.yxun@gmail.com</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:dennis.yxun@gmail.=
com" target=3D"_blank">dennis.yxun@gmail.com</a>&gt;<u></u>&gt;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Using Gentoo Linux as the build host, it fails =
without this patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Use Getopt::Std in place of <a href=3D"http://g=
etopts.pl" target=3D"_blank">getopts.pl</a> &lt;<a href=3D"http://getopts.p=
l" target=3D"_blank">http://getopts.pl</a>&gt;.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://bugs.gentoo.org/show___bug.c=
gi?id=3D420083" target=3D"_blank">https://bugs.gentoo.org/show__<u></u>_bug=
.cgi?id=3D420083</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"https://bugs.gentoo.org/show_bug=
.cgi?id=3D420083" target=3D"_blank">https://bugs.gentoo.org/show_<u></u>bug=
.cgi?id=3D420083</a>&gt;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 which following error:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/bin/perl -w ./../<a href=3D"http://msggen.=
pl" target=3D"_blank">msggen.pl</a> &lt;<a href=3D"http://msggen.pl" target=
=3D"_blank">http://msggen.pl</a>&gt; -l<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 jstyleModule InterpreterMessages.msg<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/bin/perl -w ./../<a href=3D"http://msggen.=
pl" target=3D"_blank">msggen.pl</a> &lt;<a href=3D"http://msggen.pl" target=
=3D"_blank">http://msggen.pl</a>&gt; -l<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 jstyleModule DssslAppMessages.msg<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Undefined subroutine&amp;main::Getopts called a=
t ./../<a href=3D"http://msggen.pl" target=3D"_blank">msggen.pl</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://msggen.pl" target=3D"_bla=
nk">http://msggen.pl</a>&gt; line 22.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 make[2]: *** [InterpreterMessages.h] Error 2<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 make[2]: *** Waiting for unfinished jobs....<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Undefined subroutine&amp;main::Getopts called a=
t ./../<a href=3D"http://msggen.pl" target=3D"_blank">msggen.pl</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://msggen.pl" target=3D"_bla=
nk">http://msggen.pl</a>&gt; line 22.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 make[2]: *** [DssslAppMessages.h] Error 2<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Upstream-Status: Submitted<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [openjade-devel@lists.__<a href=3D"http://sourc=
eforge.net" target=3D"_blank">source<u></u>forge.net</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:openjade-devel@lis=
ts.sourceforge.net" target=3D"_blank">openjade-devel@lists.<u></u>sourcefor=
ge.net</a>&gt;]<br>
<br>
=C2=A0 =C2=A0 This needs to be in the patch file itself, we can track the p=
atches<br>
=C2=A0 =C2=A0 better that way.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Signed-off-by: Dennis Lan&lt;<a href=3D"mailto:=
dennis.yxun@gmail.com" target=3D"_blank">dennis.yxun@gmail.com</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:dennis.yxun@gmail.=
com" target=3D"_blank">dennis.yxun@gmail.com</a>&gt;<u></u>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ---<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.../openjade/openjade-1.3.2/__<u><=
/u>msggen.pl.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 32<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ++++++++++++++++++++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.../openjade/<a href=3D"http://ope=
njade-native___1.3.2.bb" target=3D"_blank">openjade-native__<u></u>_1.3.2.b=
b</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://openjade-native_1.3.2.bb"=
 target=3D"_blank">http://openjade-native_1.3.2.<u></u>bb</a>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A01 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02 files changed, 33 insertions(+),=
 0 deletions(-)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create mode 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-devtools/__<u></u>openjade/openjad=
e-1.3.2/__<u></u>msggen.pl.patch<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 diff --git<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 a/meta/recipes-devtools/__<u></u>openjade/openj=
ade-1.3.2/__<u></u>msggen.pl.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 b/meta/recipes-devtools/__<u></u>openjade/openj=
ade-1.3.2/__<u></u>msggen.pl.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 new file mode 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 index 0000000..1afe68b<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --- /dev/null<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 b/meta/recipes-devtools/__<u></u>openjade/openj=
ade-1.3.2/__<u></u>msggen.pl.patch<br>
<br>
<br>
=C2=A0 =C2=A0 Please add comment Upstream-Status and SOB to the patch itsel=
f.<br>
<br>
=C2=A0 =C2=A0 Thanks<br>
=C2=A0 =C2=A0 Sau!<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@ -0,0 +1,32 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +Use Getopt::Std in place of <a href=3D"http://=
getopts.pl" target=3D"_blank">getopts.pl</a> &lt;<a href=3D"http://getopts.=
pl" target=3D"_blank">http://getopts.pl</a>&gt;.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +<a href=3D"https://bugs.gentoo.org/show___bug.=
cgi?id=3D420083" target=3D"_blank">https://bugs.gentoo.org/show_<u></u>__bu=
g.cgi?id=3D420083</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"https://bugs.gentoo.org/show_bug=
.cgi?id=3D420083" target=3D"_blank">https://bugs.gentoo.org/show_<u></u>bug=
.cgi?id=3D420083</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +--- a/<a href=3D"http://msggen.pl" target=3D"_=
blank">msggen.pl</a> &lt;<a href=3D"http://msggen.pl" target=3D"_blank">htt=
p://msggen.pl</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ++++ b/<a href=3D"http://msggen.pl" target=3D"_=
blank">msggen.pl</a> &lt;<a href=3D"http://msggen.pl" target=3D"_blank">htt=
p://msggen.pl</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +@@ -4,6 +4,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + # See the file COPYING for copying permission=
.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + use POSIX;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ++use Getopt::Std;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + # Package and version.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + $package =3D &#39;openjade&#39;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +@@ -18,8 +19,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + undef $opt_l;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + undef $opt_p;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + undef $opt_t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +-do &#39;<a href=3D"http://getopts.pl" target=
=3D"_blank">getopts.pl</a> &lt;<a href=3D"http://getopts.pl" target=3D"_bla=
nk">http://getopts.pl</a>&gt;&#39;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +-&amp;Getopts(&#39;l:p:t:&#39;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ++getopts(&#39;l:p:t:&#39;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + $module =3D $opt_l;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + $pot_file =3D $opt_p;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +@@ -72,7 +72,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + =C2=A0 =C2=A0 else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + =C2=A0 =C2=A0 =C2=A0 $field[0] =3D~ /^[IWQXE]=
[0-9]$/ ||&amp;error(&quot;invalid first<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 field&quot;);;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + =C2=A0 =C2=A0 =C2=A0 $type[$num] =3D substr($=
field[0], 0, 1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +- =C2=A0 =C2=A0 =C2=A0$argc =3D int(substr($fi=
eld[0], 1, 1));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ++ =C2=A0 =C2=A0 =C2=A0$argc =3D substr($field[=
0], 1, 1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + =C2=A0 =C2=A0 $nargs[$num] =3D $argc;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + =C2=A0 =C2=A0 $field[1] =3D~ /^[a-zA-Z_][a-zA=
-Z0-9_]+$/ ||&amp;error(&quot;invalid<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tag&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 diff --git<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 a/meta/recipes-devtools/__<u></u>openjade/openj=
ade-native_1.3._<u></u>_<a href=3D"http://2.bb" target=3D"_blank">2.bb</a><=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://openjade-native_1.3.2.bb"=
 target=3D"_blank">http://openjade-native_1.3.2.<u></u>bb</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 b/meta/recipes-devtools/__<u></u>openjade/openj=
ade-native_1.3._<u></u>_<a href=3D"http://2.bb" target=3D"_blank">2.bb</a><=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://openjade-native_1.3.2.bb"=
 target=3D"_blank">http://openjade-native_1.3.2.<u></u>bb</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 index 5b29c1f..efd1e11 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ---<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 a/meta/recipes-devtools/__<u></u>openjade/openj=
ade-native_1.3._<u></u>_<a href=3D"http://2.bb" target=3D"_blank">2.bb</a><=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://openjade-native_1.3.2.bb"=
 target=3D"_blank">http://openjade-native_1.3.2.<u></u>bb</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 b/meta/recipes-devtools/__<u></u>openjade/openj=
ade-native_1.3._<u></u>_<a href=3D"http://2.bb" target=3D"_blank">2.bb</a><=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://openjade-native_1.3.2.bb"=
 target=3D"_blank">http://openjade-native_1.3.2.<u></u>bb</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 @@ -14,6 +14,7 @@ RDEPENDS_${PN} =3D &quot;sgml=
-common-native&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SRC_URI =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${SOURCEFORGE_MIRROR}/__<u></u>openjade/o=
penjade-${PV}.tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 file://makefile.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://msg=
gen.pl.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 file://reautoconf.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file:=
//user-declared-default-_<u></u>_constructor.patch&quot;<br>
<br>
</blockquote>
</blockquote></div>

--e89a8f923f7cee022504c3e202be--
