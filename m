Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5CF66700F0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 13:05:45 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id f6so67358884ith.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 06:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wG3a7BrwbeQfYD4zXu+cbfWrh+onP7cEGndv3qHKMp4=;
	b=X3/ngLZ8ZHzDrQbvtmc2cn0dLWNA8YG6FItXNfvkmsl6t5Silt32qKvxAUyu3cW3+y
	B7mnog7pACxo7R7Z0uF46157ZPB5IYRvHYlt2WcH1+xG7E3cXgt+Eb3kCSe/1Yvr+Jpz
	/6E3nUU7+3V1+3BgRcH1yMf0P2o3VsErOI5vuYXlkQLAj880lyf6BnQpkss6aa7DxWTj
	MWbNBGYz9VgItpIh45/w+946L3XdH16s2JXpMmxDTvwGP1e0SCu++NMn9/P7ioAX6+Oq
	LZ/1wkyUM9Z9gAqtf9MCbFeBu2SLl66p9bS1rpQyyS9OHm0eV/VYsTuxD6lLpLAczLDF
	ZaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wG3a7BrwbeQfYD4zXu+cbfWrh+onP7cEGndv3qHKMp4=;
	b=CcSsaOxREdX2uovMDE1OSyA9G9cl0Ap87rkD1IkgJZL9OSrUsWSFZt9wKC0a38wzbL
	kw4F5LnNVtQBYtE//Fd09A3K4q/g2ZEyo76fmvaQr+9Q6VmPlLEkI+5u4V6udz+wmEi8
	N/ILXV/3nbswEDloqJifYF9vfnsDKzOpLyManhC2EQihdcqQMZ48kkMT6159woGoXYJJ
	pRiEkYifcNRkjPrXFFDckY4fV2jw8Q8S6ioN/VSlEs/fEQHrWd7NZF711JVf5dHwLPxV
	924qeKXpAdAuo9rG3as75oT7vkehiEgszu5zu3igKJxF6cf4/BE8jH75J7EECemeEkJF
	+gBA==
X-Gm-Message-State: AEkoousXVmvOMcvH0eT1EObzb4xytIyBHdUeuJpP9XjYCkxNQt/V1Rm/GPGqqxqekfHgmGmJ10Fd1T2btN3CBJlZ
X-Received: by 10.36.20.75 with SMTP id 72mr20587572itg.83.1471352746071; Tue,
	16 Aug 2016 06:05:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 16 Aug 2016 06:05:25 -0700 (PDT)
In-Reply-To: <18de1b4818af9e90e4578af9335497c5edd7ae9f.1470967099.git.dengke.du@windriver.com>
References: <cover.1470967099.git.dengke.du@windriver.com>
	<18de1b4818af9e90e4578af9335497c5edd7ae9f.1470967099.git.dengke.du@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Aug 2016 14:05:25 +0100
Message-ID: <CAJTo0LZCBQeYBXLVrihZT-bAER1k+jXqoEK4xHuL+u9RBJiM7Q@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] bash: fix run-intl ptest failed
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
X-List-Received-Date: Tue, 16 Aug 2016 13:05:46 -0000
Content-Type: multipart/alternative; boundary=001a11446942c4f1da053a30016d

--001a11446942c4f1da053a30016d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Can you rebase this on top of your upgrade patch?  At the moment this and
the upgrade conflict.

Ross

On 12 August 2016 at 03:08, Dengke Du <dengke.du@windriver.com> wrote:

> 1. Filter the extra white space in intl.right
>
>    When the sub-test unicode2.sub of intl.tests executed, it produced
>    compact results without extra white space, compared to intl.right,
>    it failed.
>
>    So we need to filter the extra white space in intl.right.
>
>    Import this patch for intl.right from bash devel branch:
>
>         http://git.savannah.gnu.org/cgit/bash.git/log/?h=3Ddevel
>
>    Commit is:
>
>         85ec0778f9d778e1820fb8c0e3e996f2d1103b45
>
> 2. Change intl.right correspond to the unicode3.sub's output
>
>    In sub-test unicode3.sub of intl.tests have this:
>
>                 printf %q "$payload"
>
>    The payload variable was assigned by ASCII characters, when using
>    '%q' format strings, it means print the associated argument
> shell-quoted.
>
>    When the strings contain the non-alpha && non-digit && non-punctuation
> &&
>    non-ISO 646 character(7-bit), it would output like this: " $'...',
> ANSI-C
>    style quoted string. We can check the bash source code at:
>
>         http://git.savannah.gnu.org/cgit/bash.git/tree/builtins/
> printf.def#n557
>         http://git.savannah.gnu.org/cgit/bash.git/tree/lib/sh/
> strtrans.c#n331
>
>    So we need to change the intl.right contain the correct output of
> unicode3.sub.
>
>    Import parts of this patch for intl.right from bash devel branch:
>
>         http://git.savannah.gnu.org/cgit/bash.git/log/?h=3Ddevel
>
>    Commit is:
>
>         74b8cbb41398b4453d8ba04d0cdd1b25f9dcb9e3
>
> NOTE:
>    Ensure the system contain fr-fr & de-de locales
>
>    Some tests of intl.tests need to change locales to accomplish. So you
> need add
>    the following to a conf file:
>
>                 IMAGE_LINGUAS =3D "en-us fr-fr de-de"
>
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>  meta/recipes-extended/bash/bash/fix-run-intl.patch | 110
> +++++++++++++++++++++
>  meta/recipes-extended/bash/bash_4.3.30.bb          |   3 +-
>  2 files changed, 112 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-extended/bash/bash/fix-run-intl.patch
>
> diff --git a/meta/recipes-extended/bash/bash/fix-run-intl.patch
> b/meta/recipes-extended/bash/bash/fix-run-intl.patch
> new file mode 100644
> index 0000000..d4a3409
> --- /dev/null
> +++ b/meta/recipes-extended/bash/bash/fix-run-intl.patch
> @@ -0,0 +1,110 @@
> +From a00d3161fd7b6a698bdd2ed5f0ac5faac580ee2a Mon Sep 17 00:00:00 2001
> +From: Dengke Du <dengke.du@windriver.com>
> +Date: Wed, 3 Aug 2016 23:13:00 -0400
> +Subject: [PATCH] fix run-intl failed
> +
> +1. Filter extra white space of intl.right
> +
> +   Due to the extra white space of intl.right, when the result of
> +   sub-test unicode2.sub of intl.tests compared to it, the test
> +   failed.
> +
> +   So we need to filter the extra white space of intl.right.
> +
> +   Import this patch for intl.right from bash devel branch:
> +
> +       http://git.savannah.gnu.org/cgit/bash.git/log/?h=3Ddevel
> +
> +   commit is:
> +
> +       85ec0778f9d778e1820fb8c0e3e996f2d1103b45
> +
> +2. Change intl.right correspond to the unicode3.sub's output
> +
> +   In sub-test unicode3.sub of intl.tests, the payload value is:
> +
> +       payload=3D$'\065\247\100\063\231\053\306\123\070\237\242\352\263'
> +
> +   It used quoted string expansion(escaped octal) to assign ASCII
> +   characters to variables. So when the test run the following:
> +
> +       printf %q "$payload"
> +
> +   It produced:
> +
> +       $'5\247@3\231+\306S8\237\242\352\263'
> +
> +   When compared to the intl.right(contain the converted character), it
> failed.
> +
> +   Import parts of patch for intl.right from bash devel branch:
> +
> +       http://git.savannah.gnu.org/cgit/bash.git/log/?h=3Ddevel
> +
> +   commit is:
> +
> +       74b8cbb41398b4453d8ba04d0cdd1b25f9dcb9e3
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
> +---
> + tests/intl.right | 30 +++++++++++++++---------------
> + 1 file changed, 15 insertions(+), 15 deletions(-)
> +
> +diff --git a/tests/intl.right b/tests/intl.right
> +index acf108a..1efdfbe 100644
> +--- a/tests/intl.right
> ++++ b/tests/intl.right
> +@@ -18,34 +18,34 @@ a=C3=83=C2=A9b
> + 1.0000
> + 1,0000
> + Passed all 1378 Unicode tests
> +-0000000   303 277 012
> ++0000000 303 277 012
> + 0000003
> +-0000000   303 277 012
> ++0000000 303 277 012
> + 0000003
> +-0000000   303 277 012
> ++0000000 303 277 012
> + 0000003
> +-0000000   303 277 012
> ++0000000 303 277 012
> + 0000003
> +-0000000   357 277 277 012
> ++0000000 357 277 277 012
> + 0000004
> +-0000000   357 277 277 012
> ++0000000 357 277 277 012
> + 0000004
> +-0000000   012
> ++0000000 012
> + 0000001
> +-0000000   012
> ++0000000 012
> + 0000001
> +-0000000   012
> ++0000000 012
> + 0000001
> +-0000000   012
> ++0000000 012
> + 0000001
> +-0000000   303 277 012
> ++0000000 303 277 012
> + 0000003
> +-0000000   303 277 012
> ++0000000 303 277 012
> + 0000003
> +-0000000   303 277 012
> ++0000000 303 277 012
> + 0000003
> +-0000000   101 040 302 243 040 305 222 012
> ++0000000 101 040 302 243 040 305 222 012
> + 0000010
> + ./unicode3.sub: line 2: 5=C2=A7@3=E2=84=A2+=C3=86S8=C5=B8=C2=A2=C3=AA=
=C2=B3: command not found
> +-5=C2=A7@3=E2=84=A2+=C3=86S8=C5=B8=C2=A2=C3=AA=C2=B3
> ++$'5\247@3\231+\306S8\237\242\352\263'
> + + : $'5\247@3\231+\306S8\237\242\352\263'
> +--
> +2.8.1
> +
> diff --git a/meta/recipes-extended/bash/bash_4.3.30.bb
> b/meta/recipes-extended/bash/bash_4.3.30.bb
> index 95ed392..3f0dd8b 100644
> --- a/meta/recipes-extended/bash/bash_4.3.30.bb
> +++ b/meta/recipes-extended/bash/bash_4.3.30.bb
> @@ -20,7 +20,8 @@ SRC_URI =3D "${GNU_MIRROR}/bash/${BP}.tar.gz;name=3Dtar=
ball
> \
>             file://test-output.patch \
>             file://fix-run-coproc-run-heredoc-run-execscript-run-test-f.p=
atch
> \
>             file://run-ptest \
> -          file://fix-run-builtins.patch \
> +           file://fix-run-builtins.patch \
> +           file://fix-run-intl.patch \
>             "
>
>  SRC_URI[tarball.md5sum] =3D "a27b3ee9be83bd3ba448c0ff52b28447"
> --
> 2.8.1
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a11446942c4f1da053a30016d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can you rebase this on top of your upgrade patch?=C2=A0 At=
 the moment this and the upgrade conflict.<div><br></div><div>Ross</div></d=
iv><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 12 August 2=
016 at 03:08, Dengke Du <span dir=3D"ltr">&lt;<a href=3D"mailto:dengke.du@w=
indriver.com" target=3D"_blank">dengke.du@windriver.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">1. Filter the extra white space in int=
l.right<br>
<br>
=C2=A0 =C2=A0When the sub-test unicode2.sub of intl.tests executed, it prod=
uced<br>
=C2=A0 =C2=A0compact results without extra white space, compared to intl.ri=
ght,<br>
=C2=A0 =C2=A0it failed.<br>
<br>
=C2=A0 =C2=A0So we need to filter the extra white space in intl.right.<br>
<br>
=C2=A0 =C2=A0Import this patch for intl.right from bash devel branch:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://git.savannah.gnu.org/cgit/bas=
h.git/log/?h=3Ddevel" rel=3D"noreferrer" target=3D"_blank">http://git.savan=
nah.gnu.org/<wbr>cgit/bash.git/log/?h=3Ddevel</a><br>
<br>
=C2=A0 =C2=A0Commit is:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 85ec0778f9d778e1820fb8c0e3e996<wbr>f2d1103b45<b=
r>
<br>
2. Change intl.right correspond to the unicode3.sub&#39;s output<br>
<br>
=C2=A0 =C2=A0In sub-test unicode3.sub of intl.tests have this:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf %q &quot;$pa=
yload&quot;<br>
<br>
=C2=A0 =C2=A0The payload variable was assigned by ASCII characters, when us=
ing<br>
=C2=A0 =C2=A0&#39;%q&#39; format strings, it means print the associated arg=
ument shell-quoted.<br>
<br>
=C2=A0 =C2=A0When the strings contain the non-alpha &amp;&amp; non-digit &a=
mp;&amp; non-punctuation &amp;&amp;<br>
=C2=A0 =C2=A0non-ISO 646 character(7-bit), it would output like this: &quot=
; $&#39;...&#39;, ANSI-C<br>
=C2=A0 =C2=A0style quoted string. We can check the bash source code at:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://git.savannah.gnu.org/cgit/bas=
h.git/tree/builtins/printf.def#n557" rel=3D"noreferrer" target=3D"_blank">h=
ttp://git.savannah.gnu.org/<wbr>cgit/bash.git/tree/builtins/<wbr>printf.def=
#n557</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://git.savannah.gnu.org/cgit/bas=
h.git/tree/lib/sh/strtrans.c#n331" rel=3D"noreferrer" target=3D"_blank">htt=
p://git.savannah.gnu.org/<wbr>cgit/bash.git/tree/lib/sh/<wbr>strtrans.c#n33=
1</a><br>
<br>
=C2=A0 =C2=A0So we need to change the intl.right contain the correct output=
 of unicode3.sub.<br>
<br>
=C2=A0 =C2=A0Import parts of this patch for intl.right from bash devel bran=
ch:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://git.savannah.gnu.org/cgit/bas=
h.git/log/?h=3Ddevel" rel=3D"noreferrer" target=3D"_blank">http://git.savan=
nah.gnu.org/<wbr>cgit/bash.git/log/?h=3Ddevel</a><br>
<br>
=C2=A0 =C2=A0Commit is:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 74b8cbb41398b4453d8ba04d0cdd1b<wbr>25f9dcb9e3<b=
r>
<br>
NOTE:<br>
=C2=A0 =C2=A0Ensure the system contain fr-fr &amp; de-de locales<br>
<br>
=C2=A0 =C2=A0Some tests of intl.tests need to change locales to accomplish.=
 So you need add<br>
=C2=A0 =C2=A0the following to a conf file:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IMAGE_LINGUAS =3D &=
quot;en-us fr-fr de-de&quot;<br>
<br>
Signed-off-by: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">den=
gke.du@windriver.com</a>&gt;<br>
---<br>
<span class=3D"">=C2=A0meta/recipes-extended/bash/<wbr>bash/fix-run-intl.pa=
tch | 110 +++++++++++++++++++++<br>
=C2=A0meta/recipes-extended/bash/<a href=3D"http://bash_4.3.30.bb" rel=3D"n=
oreferrer" target=3D"_blank">bas<wbr>h_4.3.30.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A02 files changed, 112 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-extended/bash/<wbr>bash/fix-run-intl.=
patch<br>
<br>
</span>diff --git a/meta/recipes-extended/bash/<wbr>bash/fix-run-intl.patch=
 b/meta/recipes-extended/bash/<wbr>bash/fix-run-intl.patch<br>
new file mode 100644<br>
index 0000000..d4a3409<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/bash/<wbr>bash/fix-run-intl.patch<br>
@@ -0,0 +1,110 @@<br>
+From a00d3161fd7b6a698bdd2ed5f0ac5f<wbr>aac580ee2a Mon Sep 17 00:00:00 200=
1<br>
+From: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">dengke.du@w=
indriver.com</a>&gt;<br>
+Date: Wed, 3 Aug 2016 23:13:00 -0400<br>
+Subject: [PATCH] fix run-intl failed<br>
+<br>
+1. Filter extra white space of intl.right<br>
+<br>
+=C2=A0 =C2=A0Due to the extra white space of intl.right, when the result o=
f<br>
+=C2=A0 =C2=A0sub-test unicode2.sub of intl.tests compared to it, the test<=
br>
+=C2=A0 =C2=A0failed.<br>
+<br>
+=C2=A0 =C2=A0So we need to filter the extra white space of intl.right.<br>
+<br>
+=C2=A0 =C2=A0Import this patch for intl.right from bash devel branch:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://git.savannah.gnu.org/cgit/bas=
h.git/log/?h=3Ddevel" rel=3D"noreferrer" target=3D"_blank">http://git.savan=
nah.gnu.org/<wbr>cgit/bash.git/log/?h=3Ddevel</a><br>
+<br>
+=C2=A0 =C2=A0commit is:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A085ec0778f9d778e1820fb8c0e3e996<wbr>f2d1103b45<b=
r>
+<br>
+2. Change intl.right correspond to the unicode3.sub&#39;s output<br>
+<br>
+=C2=A0 =C2=A0In sub-test unicode3.sub of intl.tests, the payload value is:=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0payload=3D$&#39;\065\247\100\063\<wbr>231\053\3=
06\123\070\237\242\<wbr>352\263&#39;<br>
+<br>
+=C2=A0 =C2=A0It used quoted string expansion(escaped octal) to assign ASCI=
I<br>
+=C2=A0 =C2=A0characters to variables. So when the test run the following:<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0printf %q &quot;$payload&quot;<br>
+<br>
+=C2=A0 =C2=A0It produced:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$&#39;5\247@3\231+\306S8\237\242\<wbr>352\263&#=
39;<br>
+<br>
+=C2=A0 =C2=A0When compared to the intl.right(contain the converted charact=
er), it failed.<br>
+<br>
+=C2=A0 =C2=A0Import parts of patch for intl.right from bash devel branch:<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://git.savannah.gnu.org/cgit/bas=
h.git/log/?h=3Ddevel" rel=3D"noreferrer" target=3D"_blank">http://git.savan=
nah.gnu.org/<wbr>cgit/bash.git/log/?h=3Ddevel</a><br>
+<br>
+=C2=A0 =C2=A0commit is:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A074b8cbb41398b4453d8ba04d0cdd1b<wbr>25f9dcb9e3<b=
r>
+<br>
+Upstream-Status: Backport<br>
+<br>
+Signed-off-by: Dengke Du &lt;<a href=3D"mailto:dengke.du@windriver.com">de=
ngke.du@windriver.com</a>&gt;<br>
+---<br>
+ tests/intl.right | 30 +++++++++++++++---------------<br>
+ 1 file changed, 15 insertions(+), 15 deletions(-)<br>
+<br>
+diff --git a/tests/intl.right b/tests/intl.right<br>
+index acf108a..1efdfbe 100644<br>
+--- a/tests/intl.right<br>
++++ b/tests/intl.right<br>
+@@ -18,34 +18,34 @@ a=C3=83=C2=A9b<br>
+ 1.0000<br>
+ 1,0000<br>
+ Passed all 1378 Unicode tests<br>
+-0000000=C2=A0 =C2=A0303 277 012<br>
++0000000 303 277 012<br>
+ 0000003<br>
+-0000000=C2=A0 =C2=A0303 277 012<br>
++0000000 303 277 012<br>
+ 0000003<br>
+-0000000=C2=A0 =C2=A0303 277 012<br>
++0000000 303 277 012<br>
+ 0000003<br>
+-0000000=C2=A0 =C2=A0303 277 012<br>
++0000000 303 277 012<br>
+ 0000003<br>
+-0000000=C2=A0 =C2=A0357 277 277 012<br>
++0000000 357 277 277 012<br>
+ 0000004<br>
+-0000000=C2=A0 =C2=A0357 277 277 012<br>
++0000000 357 277 277 012<br>
+ 0000004<br>
+-0000000=C2=A0 =C2=A0012<br>
++0000000 012<br>
+ 0000001<br>
+-0000000=C2=A0 =C2=A0012<br>
++0000000 012<br>
+ 0000001<br>
+-0000000=C2=A0 =C2=A0012<br>
++0000000 012<br>
+ 0000001<br>
+-0000000=C2=A0 =C2=A0012<br>
++0000000 012<br>
+ 0000001<br>
+-0000000=C2=A0 =C2=A0303 277 012<br>
++0000000 303 277 012<br>
+ 0000003<br>
+-0000000=C2=A0 =C2=A0303 277 012<br>
++0000000 303 277 012<br>
+ 0000003<br>
+-0000000=C2=A0 =C2=A0303 277 012<br>
++0000000 303 277 012<br>
+ 0000003<br>
+-0000000=C2=A0 =C2=A0101 040 302 243 040 305 222 012<br>
++0000000 101 040 302 243 040 305 222 012<br>
+ 0000010<br>
+ ./unicode3.sub: line 2: 5=C2=A7@3=E2=84=A2+=C3=86S8=C5=B8=C2=A2=C3=AA=C2=
=B3: command not found<br>
+-5=C2=A7@3=E2=84=A2+=C3=86S8=C5=B8=C2=A2=C3=AA=C2=B3<br>
++$&#39;5\247@3\231+\306S8\237\<wbr>242\352\263&#39;<br>
+ + : $&#39;5\247@3\231+\306S8\237\242\<wbr>352\263&#39;<br>
+--<br>
+2.8.1<br>
+<br>
diff --git a/meta/recipes-extended/bash/<a href=3D"http://bash_4.3.30.bb" r=
el=3D"noreferrer" target=3D"_blank">b<wbr>ash_4.3.30.bb</a> b/meta/recipes-=
extended/bash/<a href=3D"http://bash_4.3.30.bb" rel=3D"noreferrer" target=
=3D"_blank">b<wbr>ash_4.3.30.bb</a><br>
index 95ed392..3f0dd8b 100644<br>
--- a/meta/recipes-extended/bash/<a href=3D"http://bash_4.3.30.bb" rel=3D"n=
oreferrer" target=3D"_blank">b<wbr>ash_4.3.30.bb</a><br>
+++ b/meta/recipes-extended/bash/<a href=3D"http://bash_4.3.30.bb" rel=3D"n=
oreferrer" target=3D"_blank">b<wbr>ash_4.3.30.bb</a><br>
@@ -20,7 +20,8 @@ SRC_URI =3D &quot;${GNU_MIRROR}/bash/${BP}.tar.<wbr>gz;na=
me=3Dtarball \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://test-output.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-run-coproc-run-<wbr>he=
redoc-run-execscript-run-<wbr>test-f.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-run-builtins.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-run-builtins.patch \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-run-intl.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[tarball.md5sum] =3D &quot;<wbr>a27b3ee9be83bd3ba448c0ff52b284=
<wbr>47&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.8.1<br>
<br>
</font></span><br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--001a11446942c4f1da053a30016d--
