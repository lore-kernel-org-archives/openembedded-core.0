Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7CFD576FFA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 15:23:13 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id 186so15887445itf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 08:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S9CJUmbYvQD2EoK2iMlIqY3oBDERVgX9jYWbavK6B9I=;
	b=Q3LHFssvA3V1cSHSCO2Gxq/ATqcQ+dDehENmIufYASYeCsGkqtR1tvcOypRatUm8kk
	Szk61MjGIv2xhvsQoBU0IHS6GFOw68oI6QZHxEVAGzCid9O9f/lb5cXYjYg4w9EWBSiB
	xlE78mJWLvZyl++cU8tmyUNuodO8bwDRAPbCT9OY1t5vZ5/0f2oC0IBm8oLABiFnNFwR
	/xYYzftbdyVyYUhxNbDX3K2RINqvJ29XWwTbF5TbDFbUiS5kfstkW6ZC6S9IaVcJteZd
	z6kbhtdoIAZkzh9YBTRR0ef+lNdbgDGi6NxfTXhTwDV6eKu0+2poh0RIvrmKIobix0i+
	kF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S9CJUmbYvQD2EoK2iMlIqY3oBDERVgX9jYWbavK6B9I=;
	b=ItN9HijSaI9lDfQR/U5lFSLcmsDMsEDCmHLj9Mo53KL2eXm7BZJD0vyfPFDUGao/+q
	Z7KzWGSRGSz/Js6RC76je/JKJ1yPVF1ANBtRLzEbsDdoVvTdq8R6GWffPh/U4B1Djd4Z
	j/7b/OkIXcBO0j60PdhF2Ie2k+FnZYwq419fAzPd8Qo5oOyHSGHoTJ6eLFnWjvtXQjiE
	V05cEbKX3IymXcck7SiovG1HR4t34TGI8jFBgDw822UGe89MjLbE4jQ8oxlb6p+ZF3oL
	y25zJBAAZHRjZilnsBrJiedo5c01y8hR7ZQwx5p07UeL/vvso375nSOTVnNmYRDOufPA
	mzug==
X-Gm-Message-State: AE9vXwOo2hFG6I7pcpQB/lxIsZhZtWwNtb2XxSyYUAu8ngK2QDvrZ2W7qaGj+sCNAh+SCsGEy6Eol90PtINk+Oeg
X-Received: by 10.157.17.203 with SMTP id y11mr21146475oty.188.1473693794536; 
	Mon, 12 Sep 2016 08:23:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Mon, 12 Sep 2016 08:22:54 -0700 (PDT)
In-Reply-To: <81e9e5ba-665b-65ae-3e84-289da8682866@smile.fr>
References: <cover.b47dcbad9b495b8e621528579e9ae39cd15d32e8.1473239261.git-series.jeremy.rosen@smile.fr>
	<81e9e5ba-665b-65ae-3e84-289da8682866@smile.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 Sep 2016 16:22:54 +0100
Message-ID: <CAJTo0LaZOT1m+-P_cm_Q+0qbr7dzuNyV9J3QxZy0xYFuugJr6g@mail.gmail.com>
To: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/8] Fix BUILD_* family of variables
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
X-List-Received-Date: Mon, 12 Sep 2016 15:23:16 -0000
Content-Type: multipart/alternative; boundary=94eb2c192a5621a36b053c511395

--94eb2c192a5621a36b053c511395
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

It's in my staging branch and works for me, just needs a run through the AB
and then a decision on whether it is a bug fix (good for M4) or enhancement
(too late for M3)...

Ross

On 12 September 2016 at 16:19, J=C3=A9r=C3=A9my Rosen <jeremy.rosen@smile.f=
r> wrote:

> Any news ?
>
>
>
> On 07/09/2016 11:08, J=C3=A9r=C3=A9my Rosen wrote:
>
>> The BUILD_* family of variables allow the user to specify the name of th=
e
>> host
>> compiler to use at build time. This feature is particularly important fo=
r
>> long
>> term maintainance. Future versions of gcc might not be compatible with o=
ld
>> yocto distributions and we can't assume that "gcc" is the correct name
>> for the
>> compiler.
>>
>> This problem is already an issue with Jethro which can't be compiled on =
a
>> machine wher gcc-6 is the default compiler. pkgconfig-native will refuse
>> to
>> compile because it uses -Werror and gcc-6 has new warnings compared to
>> gcc-5
>>
>> This patch serie fixes multiple hard-coded references to gcc in various
>> recipes
>> and build infrastructure
>>
>> This patch was tested by building core-image-minimal for qemu-x86_64 wit=
h
>> a
>> directory with the following content added to the PATH
>>
>>   g++ -> /bin/false
>>   gcc -> /bin/false
>>   myg++ -> /usr/bin/g++
>>   mygcc -> /usr/bin/gcc
>>
>> And the following variables added to local.conf
>>
>> export BUILD_CC =3D "mygcc"
>> export BUILD_CXX =3D "myg++"
>> export BUILD_CPP =3D "mygcc -E"
>> export BUILD_CCLD =3D "mygcc"
>>
>> ---
>> V2
>> * rewording in some commits messages
>> * no need for a patch to KConfig, use OE_RUNMAKE_FLAGS instead
>> * change all patch titles to use : in the short commit message
>> * rpm : manually remove files instead of calling make distclean
>> * libpcre : explicitely set CCLD_FOR_BUILD in the recipe since it's the
>> only
>>    recipe using it.
>> * glibc patch has been submited upstream
>>
>> It would be interesting to modify yocto's builders to use the BUILD_*
>> variable in order to have some early warning wrt gcc polution in recipes=
,
>> but
>> seeing the various recipes I had to patch, I would expect such a change =
to
>> trigger a high number of build failures.
>>
>> J=C3=A9r=C3=A9my Rosen (8):
>>    cross: export CC family from BUILD_* for cross compilers
>>    linux-yocto: allow overriding compiler name in KConfig
>>    linux-libc-headers: allow overriding compiler name in KConfig
>>    busybox: allow overriding compiler name in KConfig
>>    sanity: fix hardcoded references to gcc
>>    glibc: remove hard-coded reference to gcc -E
>>    rpm: manually cleanup sysck
>>    libpcre: explicitely specify CCLD_FOR_BUILD for this recipe
>>
>>   meta/classes/cross.bbclass
>>           | 12 ++++++++++++
>>   meta/classes/kernel.bbclass
>>            |  1 +
>>   meta/classes/sanity.bbclass
>>            | 14 +++++++-------
>>   meta/recipes-core/busybox/busybox.inc
>>            |  2 +-
>>   meta/recipes-core/glibc/glibc/0001-locale-fix-hard-coded-reference-to-=
gcc-E.patch
>> | 39 +++++++++++++++++++++++++++++++++++++++
>>   meta/recipes-core/glibc/glibc_2.24.bb
>>            |  3 ++-
>>   meta/recipes-devtools/rpm/rpm_5.4.16.bb
>>            |  2 +-
>>   meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
>>            |  2 ++
>>   meta/recipes-support/libpcre/libpcre_8.39.bb
>>             |  2 ++
>>   9 files changed, 67 insertions(+), 10 deletions(-)
>>   create mode 100644 meta/recipes-core/glibc/glibc/
>> 0001-locale-fix-hard-coded-reference-to-gcc-E.patch
>>
>>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c192a5621a36b053c511395
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It&#39;s in my staging branch and works for me, just needs=
 a run through the AB and then a decision on whether it is a bug fix (good =
for M4) or enhancement (too late for M3)...<div><br></div><div>Ross</div></=
div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 12 Septemb=
er 2016 at 16:19, J=C3=A9r=C3=A9my Rosen <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:jeremy.rosen@smile.fr" target=3D"_blank">jeremy.rosen@smile.fr</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">Any news ?<div class=3D"H=
OEnZb"><div class=3D"h5"><br>
<br>
<br>
On 07/09/2016 11:08, J=C3=A9r=C3=A9my Rosen wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
The BUILD_* family of variables allow the user to specify the name of the h=
ost<br>
compiler to use at build time. This feature is particularly important for l=
ong<br>
term maintainance. Future versions of gcc might not be compatible with old<=
br>
yocto distributions and we can&#39;t assume that &quot;gcc&quot; is the cor=
rect name for the<br>
compiler.<br>
<br>
This problem is already an issue with Jethro which can&#39;t be compiled on=
 a<br>
machine wher gcc-6 is the default compiler. pkgconfig-native will refuse to=
<br>
compile because it uses -Werror and gcc-6 has new warnings compared to gcc-=
5<br>
<br>
This patch serie fixes multiple hard-coded references to gcc in various rec=
ipes<br>
and build infrastructure<br>
<br>
This patch was tested by building core-image-minimal for qemu-x86_64 with a=
<br>
directory with the following content added to the PATH<br>
<br>
=C2=A0 g++ -&gt; /bin/false<br>
=C2=A0 gcc -&gt; /bin/false<br>
=C2=A0 myg++ -&gt; /usr/bin/g++<br>
=C2=A0 mygcc -&gt; /usr/bin/gcc<br>
<br>
And the following variables added to local.conf<br>
<br>
export BUILD_CC =3D &quot;mygcc&quot;<br>
export BUILD_CXX =3D &quot;myg++&quot;<br>
export BUILD_CPP =3D &quot;mygcc -E&quot;<br>
export BUILD_CCLD =3D &quot;mygcc&quot;<br>
<br>
---<br>
V2<br>
* rewording in some commits messages<br>
* no need for a patch to KConfig, use OE_RUNMAKE_FLAGS instead<br>
* change all patch titles to use : in the short commit message<br>
* rpm : manually remove files instead of calling make distclean<br>
* libpcre : explicitely set CCLD_FOR_BUILD in the recipe since it&#39;s the=
 only<br>
=C2=A0 =C2=A0recipe using it.<br>
* glibc patch has been submited upstream<br>
<br>
It would be interesting to modify yocto&#39;s builders to use the BUILD_*<b=
r>
variable in order to have some early warning wrt gcc polution in recipes, b=
ut<br>
seeing the various recipes I had to patch, I would expect such a change to<=
br>
trigger a high number of build failures.<br>
<br>
J=C3=A9r=C3=A9my Rosen (8):<br>
=C2=A0 =C2=A0cross: export CC family from BUILD_* for cross compilers<br>
=C2=A0 =C2=A0linux-yocto: allow overriding compiler name in KConfig<br>
=C2=A0 =C2=A0linux-libc-headers: allow overriding compiler name in KConfig<=
br>
=C2=A0 =C2=A0busybox: allow overriding compiler name in KConfig<br>
=C2=A0 =C2=A0sanity: fix hardcoded references to gcc<br>
=C2=A0 =C2=A0glibc: remove hard-coded reference to gcc -E<br>
=C2=A0 =C2=A0rpm: manually cleanup sysck<br>
=C2=A0 =C2=A0libpcre: explicitely specify CCLD_FOR_BUILD for this recipe<br=
>
<br>
=C2=A0 meta/classes/cross.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 12 ++++++++++++<br>
=C2=A0 meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 1 +<br>
=C2=A0 meta/classes/sanity.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 14 +++++++-------<br>
=C2=A0 meta/recipes-core/busybox/busy<wbr>box.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<=
br>
=C2=A0 meta/recipes-core/glibc/glibc/<wbr>0001-locale-fix-hard-coded-ref<wb=
r>erence-to-gcc-E.patch | 39 ++++++++++++++++++++++++++++++<wbr>+++++++++<b=
r>
=C2=A0 meta/recipes-core/glibc/<a href=3D"http://glibc_2.24.bb" rel=3D"nore=
ferrer" target=3D"_blank">glibc_<wbr>2.24.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ++-<br=
>
=C2=A0 meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.16.bb" rel=3D"no=
referrer" target=3D"_blank">rpm_<wbr>5.4.16.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0 meta/recipes-kernel/linux-libc<wbr>-headers/linux-libc-headers.<wbr>=
inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 2 ++<br>
=C2=A0 meta/recipes-support/libpcre/<a href=3D"http://libpcre_8.39.bb" rel=
=3D"noreferrer" target=3D"_blank">l<wbr>ibpcre_8.39.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A0 9 files changed, 67 insertions(+), 10 deletions(-)<br>
=C2=A0 create mode 100644 meta/recipes-core/glibc/glibc/<wbr>0001-locale-fi=
x-hard-coded-ref<wbr>erence-to-gcc-E.patch<br>
<br>
</blockquote>
<br>
-- <br></div></div><div class=3D"HOEnZb"><div class=3D"h5">
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--94eb2c192a5621a36b053c511395--
