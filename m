Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id ADDAC605F1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 15:01:53 +0000 (UTC)
Received: by iedfl3 with SMTP id fl3so42538263ied.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 08:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xHZxS0lD2V3rFtSdL1YEqzFyLNYuyWhxC8eFXt8563A=;
	b=0Q7WR++1GyLU9hOb/DDQDsr0HFFR/yj/riIdbqAXx0GyhbCavK9vwS/BqaLd0KhS35
	4Kowkjl90Ewb42EGwOLIBCEXiOw3pXFEoG646ebiZjHiE9N8EIRXUGMmxthbFKCpnvFA
	+FvfKs0o/x1Cy9PERpCs8LwbqkdjzfRxNwiYAYzal++XRZCSMFsYWiqOOGnBrrhP9Ag8
	ct7dHjXmWzXxF+iSBLMUGNSVyzqAIR5CuN1aCqWLgRVpkxuDZ/Iw3xpGqW6tSi0roJ5S
	MN4w462wzF+sahYF3P0pI14waNPmuOY0I7g953M4roFZ0pA5tvndOtdS6FaSEqOI8sPf
	E2tw==
MIME-Version: 1.0
X-Received: by 10.50.29.110 with SMTP id j14mr5498449igh.4.1428764514648; Sat,
	11 Apr 2015 08:01:54 -0700 (PDT)
Received: by 10.50.117.7 with HTTP; Sat, 11 Apr 2015 08:01:54 -0700 (PDT)
In-Reply-To: <CA+chaQe1WeSN3pCy3=jzb8x3PZmJ_LdDMtkkzxCrVE9ibZJnOQ@mail.gmail.com>
References: <cover.1428714999.git.raj.khem@gmail.com>
	<9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
	<c8117308ef5d12d8bdeb088d2bea4dff4bb686ff.1428714999.git.raj.khem@gmail.com>
	<CA+chaQe1WeSN3pCy3=jzb8x3PZmJ_LdDMtkkzxCrVE9ibZJnOQ@mail.gmail.com>
Date: Sat, 11 Apr 2015 08:01:54 -0700
Message-ID: <CAMKF1sqtJ2H0KAOHkz=qYczFOb2_AUX3eb5EQWSiR2HsZPXCxg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Khem Raj <khem_raj@cable.comcast.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 17/17] e2fsprogs: Delete identical binaries and create symlinks instead
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
X-List-Received-Date: Sat, 11 Apr 2015 15:01:54 -0000
Content-Type: multipart/alternative; boundary=047d7bd6bca85d080c05137429e2

--047d7bd6bca85d080c05137429e2
Content-Type: text/plain; charset=UTF-8

On Saturday, April 11, 2015, Martin Jansa <martin.jansa@gmail.com> wrote:

> There is configure option for this, see my pending e2fsprogs patch from
> Friday.
>
> Saw it now. Looks good  does it cover e2label as well

>
> On Sat, Apr 11, 2015 at 3:20 AM, Khem Raj <raj.khem@gmail.com
> <javascript:_e(%7B%7D,'cvml','raj.khem@gmail.com');>> wrote:
>
>> Here is what build history tells now
>>
>> e2fsprogs-tune2fs:
>>
>> -PKGSIZE = 144336
>> +PKGSIZE = 72175
>>
>> e2fsprogs-e2fsck:
>>
>> -PKGSIZE = 1345500
>> +PKGSIZE = 269124
>>
>> e2fsprogs-mke2fs:
>>
>> -PKGSIZE = 551316
>> +PKGSIZE = 111036
>>
>> Change-Id: I0902484ad506d892292c4bea6789467179b5ea8d
>> Signed-off-by: Khem Raj <khem_raj@cable.comcast.com
>> <javascript:_e(%7B%7D,'cvml','khem_raj@cable.comcast.com');>>
>> ---
>>  meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
>> b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
>> index 66065bc..e6ff5f9 100644
>> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
>> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
>> @@ -43,6 +43,9 @@ do_install () {
>>         rm -f ${D}${base_sbindir}/blkid
>>         rm -f ${D}${base_sbindir}/fsck
>>         rm -f ${D}${base_sbindir}/findfs
>> +       rm -f ${D}${base_sbindir}/mkfs.ext*
>> +       rm -f ${D}${base_sbindir}/fsck.ext*
>> +       rm -f ${D}${base_sbindir}/e2label
>>
>>         # e2initrd_helper and the pkgconfig files belong in libdir
>>         if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
>> @@ -50,6 +53,11 @@ do_install () {
>>                 mv ${D}${base_libdir}/e2initrd_helper ${D}${libdir}
>>                 mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
>>         fi
>> +       for ext in ext2 ext3 ext4 ext4dev; do
>> +               ln -sf mke2fs ${D}${base_sbindir}/mkfs.${ext}
>> +               ln -sf e2fsck ${D}${base_sbindir}/fsck.${ext}
>> +       done
>> +       ln -sf tune2fs ${D}${base_sbindir}/e2label
>>
>>         oe_multilib_header ext2fs/ext2_types.h
>>         install -d ${D}${base_bindir}
>> --
>> 2.1.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> <javascript:_e(%7B%7D,'cvml','Openembedded-core@lists.openembedded.org');>
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>

--047d7bd6bca85d080c05137429e2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Saturday, April 11, 2015, Martin Jansa &lt;<a href=3D"mailto:mar=
tin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex"><div dir=3D"ltr">There is configure option for this, see =
my pending e2fsprogs patch from Friday.</div><div class=3D"gmail_extra"><br=
></div></blockquote><div>Saw it now. Looks good=C2=A0=C2=A0does it cover e2=
label as well</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">On Sat, Apr 11, 2015 at 3:20 AM, Khem Raj =
<span dir=3D"ltr">&lt;<a href=3D"javascript:_e(%7B%7D,&#39;cvml&#39;,&#39;r=
aj.khem@gmail.com&#39;);" target=3D"_blank">raj.khem@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">Here is what build history tell=
s now<br>
<br>
e2fsprogs-tune2fs:<br>
<br>
-PKGSIZE =3D 144336<br>
+PKGSIZE =3D 72175<br>
<br>
e2fsprogs-e2fsck:<br>
<br>
-PKGSIZE =3D 1345500<br>
+PKGSIZE =3D 269124<br>
<br>
e2fsprogs-mke2fs:<br>
<br>
-PKGSIZE =3D 551316<br>
+PKGSIZE =3D 111036<br>
<br>
Change-Id: I0902484ad506d892292c4bea6789467179b5ea8d<br>
Signed-off-by: Khem Raj &lt;<a href=3D"javascript:_e(%7B%7D,&#39;cvml&#39;,=
&#39;khem_raj@cable.comcast.com&#39;);" target=3D"_blank">khem_raj@cable.co=
mcast.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2fsprogs_1.42.9.bb=
" target=3D"_blank">e2fsprogs_1.42.9.bb</a> | 8 ++++++++<br>
=C2=A01 file changed, 8 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2fsprogs_1.=
42.9.bb" target=3D"_blank">e2fsprogs_1.42.9.bb</a> b/meta/recipes-devtools/=
e2fsprogs/<a href=3D"http://e2fsprogs_1.42.9.bb" target=3D"_blank">e2fsprog=
s_1.42.9.bb</a><br>
index 66065bc..e6ff5f9 100644<br>
--- a/meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2fsprogs_1.42.9.bb=
" target=3D"_blank">e2fsprogs_1.42.9.bb</a><br>
+++ b/meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2fsprogs_1.42.9.bb=
" target=3D"_blank">e2fsprogs_1.42.9.bb</a><br>
@@ -43,6 +43,9 @@ do_install () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${D}${base_sbindir}/blkid<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${D}${base_sbindir}/fsck<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${D}${base_sbindir}/findfs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}${base_sbindir}/mkfs.ext*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}${base_sbindir}/fsck.ext*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}${base_sbindir}/e2label<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # e2initrd_helper and the pkgconfig files belon=
g in libdir<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; =
then<br>
@@ -50,6 +53,11 @@ do_install () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${D}${base_libdi=
r}/e2initrd_helper ${D}${libdir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${D}${base_libdi=
r}/pkgconfig ${D}${libdir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for ext in ext2 ext3 ext4 ext4dev; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf mke2fs ${D}$=
{base_sbindir}/mkfs.${ext}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf e2fsck ${D}$=
{base_sbindir}/fsck.${ext}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf tune2fs ${D}${base_sbindir}/e2label<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_multilib_header ext2fs/ext2_types.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${base_bindir}<br>
<span><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"javascript:_e(%7B%7D,&#39;cvml&#39;,&#39;Openembedded-core@lists=
.openembedded.org&#39;);" target=3D"_blank">Openembedded-core@lists.openemb=
edded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br></div></blockquote><div>=C2=A0</div>

--047d7bd6bca85d080c05137429e2--
