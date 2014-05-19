Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f180.google.com (unknown [209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8695265EB4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 03:12:42 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id tp5so1880647ieb.39
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 May 2014 20:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=tjvfdY1lKbAW5HAKyRgo1FY8UU7tzvu3/SOdQHpca1Q=;
	b=Br/lYNcTEMsei/8yrzpL2mivGHRha8T6eC3zQ8fZoz0kIcCzKZmien14cU98SAsRUf
	u9wXfTZy+ngKJ5FcCIX8ekM9mXppcCDOCTB/wroZZwu91/Hl+URGQPS9lGqZmay5xRas
	nfqBc38veNglvUxQ7fCCJgajz9ZdLNmOQwQhmmU/9PyDqW40kiKzg9LuhtLUcQwKK2pe
	IjWOZPbPVoDNLrNLC5eYXkwJK92c8EE473QugIFm2nj0GSNqYM3OQmVc6IEnV9y0woEe
	IIntahpYgAel8c1XmjbuRnmEvSQAISe1gHqzLQxtdtejXkoSnE55MYDQIfbyzvDWI9vY
	cyAg==
MIME-Version: 1.0
X-Received: by 10.42.120.15 with SMTP id d15mr31009951icr.35.1400469163916;
	Sun, 18 May 2014 20:12:43 -0700 (PDT)
Received: by 10.50.117.33 with HTTP; Sun, 18 May 2014 20:12:43 -0700 (PDT)
Received: by 10.50.117.33 with HTTP; Sun, 18 May 2014 20:12:43 -0700 (PDT)
In-Reply-To: <5379741E.5010207@linux.intel.com>
References: <1400226305-5166-1-git-send-email-b40527@freescale.com>
	<CAMKF1spxe7wAPvbGHB94n3bvHjNO5K+jnnrXHMzpDaYMtfqntg@mail.gmail.com>
	<5379741E.5010207@linux.intel.com>
Date: Sun, 18 May 2014 20:12:43 -0700
Message-ID: <CAMKF1sreNeRkSB7=6CCtrrcb-y6yCaF=HwhCTG7LqEkjy+cbAA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Zongchun YU <b40527@freescale.com>, Zongchun Yu <Zongchun.Yu@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] doxygen: add recipe
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
X-List-Received-Date: Mon, 19 May 2014 03:12:43 -0000
Content-Type: multipart/alternative; boundary=90e6ba613c3a08c61104f9b8230f

--90e6ba613c3a08c61104f9b8230f
Content-Type: text/plain; charset=UTF-8

On May 18, 2014 8:02 PM, "Saul Wold" <sgw@linux.intel.com> wrote:
>
> On 05/16/2014 01:40 AM, Khem Raj wrote:
>>
>> On Fri, May 16, 2014 at 12:45 AM,  <b40527@freescale.com> wrote:
>>>
>>> From: Zongchun Yu <Zongchun.Yu@freescale.com>
>>>
>>> Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
>>> ---
>>>   .../doxygen/doxygen-native_1.8.6.bb                |   23
++++++++++++++++++++
>>
>>
>> Commit message should say that its adding recipe for doxygen-native
>> and not oxygen
>
>
> Also why are we adding it, what packages needs doxygen ?

well its useful tool to offer for generating documentation from code. lot
of packages use it but someone can choose to use it for their own
documentation as well
>
> Sau!
>
>
>>
>>>   1 files changed, 23 insertions(+), 0 deletions(-)
>>>   create mode 100644 meta/recipes-devtools/doxygen/
doxygen-native_1.8.6.bb
>>>
>>> diff --git a/meta/recipes-devtools/doxygen/doxygen-native_1.8.6.bbb/meta/recipes-devtools/doxygen/
doxygen-native_1.8.6.bb
>>> new file mode 100644
>>> index 0000000..eac4c9b
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/doxygen/doxygen-native_1.8.6.bb
>>> @@ -0,0 +1,23 @@
>>> +DESCRIPTION = "Utilities for generating documentation from source code"
>>> +HOMEPAGE = "http://www.stack.nl/~dimitri/doxygen/index.html"
>>> +SECTION = "console/utils"
>>> +LICENSE = "GPLv2"
>>> +LIC_FILES_CHKSUM =
"file://LICENSE;md5=b380c86cea229fa42b9e543fc491f5eb"
>>> +DEPENDS = "flex-native bison-native"
>>> +
>>> +SRC_URI = "
http://ftp.stack.nl/pub/users/dimitri/doxygen-${PV}.src.tar.gz"
>>> +
>>> +SRC_URI[md5sum] = "9385dc52f0627875f8fa758e754ec674"
>>> +SRC_URI[sha256sum] =
"6a718625f0c0c1eb3dee78ec1f83409b49e790f4c6c47fd44cd51cb92695535f"
>>> +
>>> +inherit native
>>> +
>>> +EXTRA_OECONF = "--prefix ${prefix}"
>>> +
>>> +do_configure () {
>>> +    ./configure ${EXTRA_OECONF}
>>> +}
>>> +
>>> +do_install() {
>>> +    oe_runmake install DESTDIR=${D} MAN1DIR=share/man/man1
>>> +}
>>> --
>>> 1.7.0.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--90e6ba613c3a08c61104f9b8230f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On May 18, 2014 8:02 PM, &quot;Saul Wold&quot; &lt;<a href=3D"mailto:sgw@li=
nux.intel.com">sgw@linux.intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 05/16/2014 01:40 AM, Khem Raj wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Fri, May 16, 2014 at 12:45 AM, =C2=A0&lt;<a href=3D"mailto:b405=
27@freescale.com">b40527@freescale.com</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; From: Zongchun Yu &lt;<a href=3D"mailto:Zongchun.Yu@freescale.=
com">Zongchun.Yu@freescale.com</a>&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Zongchun Yu &lt;<a href=3D"mailto:Zongchun.Yu@f=
reescale.com">Zongchun.Yu@freescale.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt; =C2=A0 .../doxygen/<a href=3D"http://doxygen-native_1.8.6.bb">=
doxygen-native_1.8.6.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 23 ++++++++++++++++++++<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Commit message should say that its adding recipe for doxygen-nativ=
e<br>
&gt;&gt; and not oxygen<br>
&gt;<br>
&gt;<br>
&gt; Also why are we adding it, what packages needs doxygen ?</p>
<p dir=3D"ltr">well its useful tool to offer for generating documentation f=
rom code. lot of packages use it but someone can choose to use it for their=
 own documentation as well<br>
&gt;<br>
&gt; Sau!<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; =C2=A0 1 files changed, 23 insertions(+), 0 deletions(-)<br>
&gt;&gt;&gt; =C2=A0 create mode 100644 meta/recipes-devtools/doxygen/<a hre=
f=3D"http://doxygen-native_1.8.6.bb">doxygen-native_1.8.6.bb</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/meta/recipes-devtools/doxygen/<a href=3D"http://d=
oxygen-native_1.8.6.bb">doxygen-native_1.8.6.bb</a> b/meta/recipes-devtools=
/doxygen/<a href=3D"http://doxygen-native_1.8.6.bb">doxygen-native_1.8.6.bb=
</a><br>

&gt;&gt;&gt; new file mode 100644<br>
&gt;&gt;&gt; index 0000000..eac4c9b<br>
&gt;&gt;&gt; --- /dev/null<br>
&gt;&gt;&gt; +++ b/meta/recipes-devtools/doxygen/<a href=3D"http://doxygen-=
native_1.8.6.bb">doxygen-native_1.8.6.bb</a><br>
&gt;&gt;&gt; @@ -0,0 +1,23 @@<br>
&gt;&gt;&gt; +DESCRIPTION =3D &quot;Utilities for generating documentation =
from source code&quot;<br>
&gt;&gt;&gt; +HOMEPAGE =3D &quot;<a href=3D"http://www.stack.nl/~dimitri/do=
xygen/index.html">http://www.stack.nl/~dimitri/doxygen/index.html</a>&quot;=
<br>
&gt;&gt;&gt; +SECTION =3D &quot;console/utils&quot;<br>
&gt;&gt;&gt; +LICENSE =3D &quot;GPLv2&quot;<br>
&gt;&gt;&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Db380c86cea229=
fa42b9e543fc491f5eb&quot;<br>
&gt;&gt;&gt; +DEPENDS =3D &quot;flex-native bison-native&quot;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +SRC_URI =3D &quot;<a href=3D"http://ftp.stack.nl/pub/users/di=
mitri/doxygen-${PV}.src.tar.gz">http://ftp.stack.nl/pub/users/dimitri/doxyg=
en-${PV}.src.tar.gz</a>&quot;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +SRC_URI[md5sum] =3D &quot;9385dc52f0627875f8fa758e754ec674&qu=
ot;<br>
&gt;&gt;&gt; +SRC_URI[sha256sum] =3D &quot;6a718625f0c0c1eb3dee78ec1f83409b=
49e790f4c6c47fd44cd51cb92695535f&quot;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +inherit native<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +EXTRA_OECONF =3D &quot;--prefix ${prefix}&quot;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +do_configure () {<br>
&gt;&gt;&gt; + =C2=A0 =C2=A0./configure ${EXTRA_OECONF}<br>
&gt;&gt;&gt; +}<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +do_install() {<br>
&gt;&gt;&gt; + =C2=A0 =C2=A0oe_runmake install DESTDIR=3D${D} MAN1DIR=3Dsha=
re/man/man1<br>
&gt;&gt;&gt; +}<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; 1.7.0.4<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; _______________________________________________<br>
&gt;&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Op=
enembedded-core@lists.openembedded.org</a><br>
&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/open=
embedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-=
core</a><br>
</p>

--90e6ba613c3a08c61104f9b8230f--
