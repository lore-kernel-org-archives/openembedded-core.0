Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0FA7260581
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 07:52:34 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id z25so15766491qkj.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 00:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2tYfj3oTR9bTIlJQgmzgJvV3AcCfC1Wfj7aJPk03b/o=;
	b=D8K4/4Ky08S8Vzva1G1GaYGIqPyAxT+MbbXMDzdTDwlqIohqtrFoy1C4IKPylrZQY4
	iSdnT3rNy92/6Fh0aIMZf1iB9QbZdOpp4PvzcQqonynahwUaaeUxODmyX788GfvAtW+y
	LvG/eQEOpgYbj4DpQ3M82vBKWwfdjwdVMrxxhWmiOU+UnJxSH3lTeyyAZg1/8i6L/BGD
	Eae4XBQ9ykhWIRSfWc7XRAhmZFp45EGvASlyh6CwZksy4ZgGa0goz6lyfl6si+q8BSJm
	x4HBw9UNiv7Tc+kIkJACEjodjGqEBfBJbIA1mLSWhjbcClu3HW7ot8VYgb6JTMJkpfAN
	tosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2tYfj3oTR9bTIlJQgmzgJvV3AcCfC1Wfj7aJPk03b/o=;
	b=GnQWYTosE7pLCSR+NAbq8fbPnykVloDc0Lz4afA2lwGQ+uS+BwYIn4e9AUJ7/uKgoG
	2TUh9JFQZ/2jBPZnMoYZBR2wpfu2upppxY42unSa5QdJ5SahruHcat2YqYT3ZCF5GbRw
	J9mQmHtd/u42C91KJ7iyk4FwWIhIFxa0SKUlVxPowPuFHM6fZzo8YacWXGQ3VovSwRhM
	8bfTC105CXaSxNsSp7Ca8mMmWC/5ZVv56BBQwbo3QZdyjMTR718l/mYCTbf6PeWv+Soh
	BTC5Y3IBh/T31S70U7CWJ1u6A3mqJ8uRwYUIr9QS8HUMtru7+ZAM/beAJOki+ZDVmPvh
	X+Kw==
X-Gm-Message-State: ANhLgQ2BYWznEKoK819N85vXWzhn1EX2DKQfIiRN69R5gSrr+zbrTrRR
	IZJoFanh5aaY8iXut6s7EnkeYUMPTbrM8OM++BA=
X-Google-Smtp-Source: ADFU+vtYFU7sI9buiIbi9NThWXuqtVaEvBvtRFpCbNZrGLIdND3EnLmK2hVZYn9mFqfFyBDK0zUtrM9IqolzuX6/ci4=
X-Received: by 2002:a37:e47:: with SMTP id 68mr20286940qko.17.1584258755677;
	Sun, 15 Mar 2020 00:52:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200315042947.3257882-1-raj.khem@gmail.com>
	<CANNYZj98XmAvvu5PTmUKyFyGU5+f4XDo7J6=cHFEr2u3Ge5T1A@mail.gmail.com>
In-Reply-To: <CANNYZj98XmAvvu5PTmUKyFyGU5+f4XDo7J6=cHFEr2u3Ge5T1A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 15 Mar 2020 00:52:25 -0700
Message-ID: <CAMKF1sr=3OvOCLiAzeYN+KD1LqkcUj2QfSHE3A+5GNT3QWm+mQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bison: Reset load average settings if specified in environment
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
X-List-Received-Date: Sun, 15 Mar 2020 07:52:35 -0000
Content-Type: multipart/alternative; boundary="0000000000005d50b805a0dffcbd"

--0000000000005d50b805a0dffcbd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 14, 2020 at 10:38 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Shouldn=E2=80=99t the race be fixed? This might still happen because -j s=
till
> parallelises the build,no?
>

It perhaps is a make bug which only triggers with -j and -l being both
present  it=E2=80=99s perhaps easily reproducible using these together on b=
ison
builds
As such I don=E2=80=99t see anything wrong with bison makery


> Alex
>
> On Sun 15. Mar 2020 at 5.30, Khem Raj <raj.khem@gmail.com> wrote:
>
>> In some cases, we run into parallel build failures where BUILT_SOURCES
>> is skipped, as a result required header files are not generated and the
>> build fails with missing header errors like
>>
>> ../bison-3.5.2/lib/uniwidth/width.c:21:10: fatal error: uniwidth.h: No
>> such file or directory
>>  #include "uniwidth.h"
>>           ^~~~~~~~~~~~
>> compilation terminated.
>>
>> BUILT_SOURCES should be built automatically with `make all` [1] therefor=
e
>> ensure that make is invoked with `all` target
>>
>> bison-native parallel build fails when -l<n> is passed globally from
>> build environment, errors like below due to race starts to show up
>>
>> Therefore removes a previous load limit if set
>>
>> [1]
>> https://www.gnu.org/software/automake/manual/html_node/Built-Sources-Exa=
mple.html#Built-Sources-Example
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-devtools/bison/bison_3.5.3.bb | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/bison/bison_3.5.3.bb
>> b/meta/recipes-devtools/bison/bison_3.5.3.bb
>> index 09e4b18f9e..27e09434f8 100644
>> --- a/meta/recipes-devtools/bison/bison_3.5.3.bb
>> +++ b/meta/recipes-devtools/bison/bison_3.5.3.bb
>> @@ -18,6 +18,12 @@ SRC_URI[sha256sum] =3D
>> "2bf85b5f88a5f2fa8069aed2a2dfc3a9f8d15a97e59c713e3906e5fdd9
>>  # No point in hardcoding path to m4, just use PATH
>>  EXTRA_OECONF +=3D "M4=3Dm4"
>>
>> +# Reset any loadavg set via environment, it breaks parallel build
>> +# | ../bison-3.5.2/lib/uniwidth/width.c:21:10: fatal error: uniwidth.h:
>> No such file or directory
>> +# |  #include "uniwidth.h"
>> +# |           ^~~~~~~~~~~~
>> +EXTRA_OEMAKE_append =3D " -l"
>> +
>>  inherit autotools gettext texinfo
>>
>>  # The automatic m4 path detection gets confused, so force the right val=
ue
>> --
>> 2.25.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--0000000000005d50b805a0dffcbd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Mar 14, 2020 at 10:38 PM Alexander Kanavin &lt;<a h=
ref=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div><div dir=3D"auto">Shouldn=E2=
=80=99t the race be fixed? This might still happen because -j still paralle=
lises the build,no?</div></div></blockquote><div dir=3D"auto"><br></div><di=
v dir=3D"auto">It perhaps is a make bug which only triggers with -j and -l =
being both present =C2=A0it=E2=80=99s perhaps easily reproducible using the=
se together on bison builds=C2=A0</div><div dir=3D"auto">As such I don=E2=
=80=99t see anything wrong with bison makery=C2=A0</div><div dir=3D"auto"><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div><div dir=3D"auto"></div></div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=
=3D"gmail_quote"></div></div><div><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Sun 15. Mar 2020 at 5.30, Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">In some cases, we run into =
parallel build failures where BUILT_SOURCES<br>
is skipped, as a result required header files are not generated and the<br>
build fails with missing header errors like<br>
<br>
../bison-3.5.2/lib/uniwidth/width.c:21:10: fatal error: uniwidth.h: No such=
 file or directory<br>
=C2=A0#include &quot;uniwidth.h&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~<br>
compilation terminated.<br>
<br>
BUILT_SOURCES should be built automatically with `make all` [1] therefore<b=
r>
ensure that make is invoked with `all` target<br>
<br>
bison-native parallel build fails when -l&lt;n&gt; is passed globally from<=
br>
build environment, errors like below due to race starts to show up<br>
<br>
Therefore removes a previous load limit if set<br>
<br>
[1] <a href=3D"https://www.gnu.org/software/automake/manual/html_node/Built=
-Sources-Example.html#Built-Sources-Example" rel=3D"noreferrer" target=3D"_=
blank">https://www.gnu.org/software/automake/manual/html_node/Built-Sources=
-Example.html#Built-Sources-Example</a><br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/bison/<a href=3D"http://bison_3.5.3.bb" rel=3D"=
noreferrer" target=3D"_blank">bison_3.5.3.bb</a> | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/bison/<a href=3D"http://bison_3.5.3.bb" =
rel=3D"noreferrer" target=3D"_blank">bison_3.5.3.bb</a> b/meta/recipes-devt=
ools/bison/<a href=3D"http://bison_3.5.3.bb" rel=3D"noreferrer" target=3D"_=
blank">bison_3.5.3.bb</a><br>
index 09e4b18f9e..27e09434f8 100644<br>
--- a/meta/recipes-devtools/bison/<a href=3D"http://bison_3.5.3.bb" rel=3D"=
noreferrer" target=3D"_blank">bison_3.5.3.bb</a><br>
+++ b/meta/recipes-devtools/bison/<a href=3D"http://bison_3.5.3.bb" rel=3D"=
noreferrer" target=3D"_blank">bison_3.5.3.bb</a><br>
@@ -18,6 +18,12 @@ SRC_URI[sha256sum] =3D &quot;2bf85b5f88a5f2fa8069aed2a2d=
fc3a9f8d15a97e59c713e3906e5fdd9<br>
=C2=A0# No point in hardcoding path to m4, just use PATH<br>
=C2=A0EXTRA_OECONF +=3D &quot;M4=3Dm4&quot;<br>
<br>
+# Reset any loadavg set via environment, it breaks parallel build<br>
+# | ../bison-3.5.2/lib/uniwidth/width.c:21:10: fatal error: uniwidth.h: No=
 such file or directory<br>
+# |=C2=A0 #include &quot;uniwidth.h&quot;<br>
+# |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~<br>
+EXTRA_OEMAKE_append =3D &quot; -l&quot;<br>
+<br>
=C2=A0inherit autotools gettext texinfo<br>
<br>
=C2=A0# The automatic m4 path detection gets confused, so force the right v=
alue<br>
-- <br>
2.25.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>
</blockquote></div></div>

--0000000000005d50b805a0dffcbd--
