Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1703B605F1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 15:28:45 +0000 (UTC)
Received: by wgso17 with SMTP id o17so42842626wgs.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 08:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=8Wq9nhoaushfFnM8psfjt5hkKf7F/LXsXJZkTLIIFFg=;
	b=KHbGJGJAM6dlV9dwK9sxxh3cy3WVsMCV//fzhaZyQYMjlIs2MdIzvUaRcpNP9XbLKV
	tPYclBlM0M6/LXqDZ6a4+U/p/tXf5dJjAGZNnB3UxvkDATsfAjujvqd0fArbepYGO9ku
	kpDXmQ1eAhtQgSkeXrZI4HzcpWXZU0E1cjESJlE6RpkqryXV9dDPw7rrhW1FOcKjNeyX
	6pwQ6ghEojLvbGPirFll+IAmt+hT1qb1xGW45SwcakrVwhxUmT6IUUrKiXXDELuaZxvz
	EMOoCVy9PtW+mEJuQqEwOCh0AewM9PqFdg4dV7KqxTdc5YVevYbTnwlcQz26cUB9mBbE
	x/yg==
MIME-Version: 1.0
X-Received: by 10.180.76.205 with SMTP id m13mr6505643wiw.19.1428766126140;
	Sat, 11 Apr 2015 08:28:46 -0700 (PDT)
Received: by 10.28.157.17 with HTTP; Sat, 11 Apr 2015 08:28:46 -0700 (PDT)
In-Reply-To: <CAMKF1sqtJ2H0KAOHkz=qYczFOb2_AUX3eb5EQWSiR2HsZPXCxg@mail.gmail.com>
References: <cover.1428714999.git.raj.khem@gmail.com>
	<9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
	<c8117308ef5d12d8bdeb088d2bea4dff4bb686ff.1428714999.git.raj.khem@gmail.com>
	<CA+chaQe1WeSN3pCy3=jzb8x3PZmJ_LdDMtkkzxCrVE9ibZJnOQ@mail.gmail.com>
	<CAMKF1sqtJ2H0KAOHkz=qYczFOb2_AUX3eb5EQWSiR2HsZPXCxg@mail.gmail.com>
Date: Sat, 11 Apr 2015 17:28:46 +0200
Message-ID: <CA+chaQdK9RAWt_Gcv0QSRL913bDkFN1y22pAe8dVNu-V9jhWbA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Sat, 11 Apr 2015 15:28:48 -0000
Content-Type: multipart/alternative; boundary=f46d043749936a754205137489db

--f46d043749936a754205137489db
Content-Type: text/plain; charset=UTF-8

> does it cover e2label as well

yes it does

On Sat, Apr 11, 2015 at 5:01 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Saturday, April 11, 2015, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> There is configure option for this, see my pending e2fsprogs patch from
>> Friday.
>>
>> Saw it now. Looks good  does it cover e2label as well
>
>>
>> On Sat, Apr 11, 2015 at 3:20 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> Here is what build history tells now
>>>
>>> e2fsprogs-tune2fs:
>>>
>>> -PKGSIZE = 144336
>>> +PKGSIZE = 72175
>>>
>>> e2fsprogs-e2fsck:
>>>
>>> -PKGSIZE = 1345500
>>> +PKGSIZE = 269124
>>>
>>> e2fsprogs-mke2fs:
>>>
>>> -PKGSIZE = 551316
>>> +PKGSIZE = 111036
>>>
>>> Change-Id: I0902484ad506d892292c4bea6789467179b5ea8d
>>> Signed-off-by: Khem Raj <khem_raj@cable.comcast.com>
>>> ---
>>>  meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
>>> b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
>>> index 66065bc..e6ff5f9 100644
>>> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
>>> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
>>> @@ -43,6 +43,9 @@ do_install () {
>>>         rm -f ${D}${base_sbindir}/blkid
>>>         rm -f ${D}${base_sbindir}/fsck
>>>         rm -f ${D}${base_sbindir}/findfs
>>> +       rm -f ${D}${base_sbindir}/mkfs.ext*
>>> +       rm -f ${D}${base_sbindir}/fsck.ext*
>>> +       rm -f ${D}${base_sbindir}/e2label
>>>
>>>         # e2initrd_helper and the pkgconfig files belong in libdir
>>>         if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
>>> @@ -50,6 +53,11 @@ do_install () {
>>>                 mv ${D}${base_libdir}/e2initrd_helper ${D}${libdir}
>>>                 mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
>>>         fi
>>> +       for ext in ext2 ext3 ext4 ext4dev; do
>>> +               ln -sf mke2fs ${D}${base_sbindir}/mkfs.${ext}
>>> +               ln -sf e2fsck ${D}${base_sbindir}/fsck.${ext}
>>> +       done
>>> +       ln -sf tune2fs ${D}${base_sbindir}/e2label
>>>
>>>         oe_multilib_header ext2fs/ext2_types.h
>>>         install -d ${D}${base_bindir}
>>> --
>>> 2.1.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>
>>
>

--f46d043749936a754205137489db
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;=C2=A0<span style=3D"font-size:12.8000001907349px">doe=
s it cover e2label as well</span><div><span style=3D"font-size:12.800000190=
7349px"><br></span></div><div><span style=3D"font-size:12.8000001907349px">=
yes it does</span></div></div><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On Sat, Apr 11, 2015 at 5:01 PM, Khem Raj <span dir=3D"ltr">&l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">=
<br><br>On Saturday, April 11, 2015, Martin Jansa &lt;<a href=3D"mailto:mar=
tin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">There is configure opt=
ion for this, see my pending e2fsprogs patch from Friday.</div><div class=
=3D"gmail_extra"><br></div></blockquote></span><div>Saw it now. Looks good=
=C2=A0=C2=A0does it cover e2label as well</div><div class=3D"HOEnZb"><div c=
lass=3D"h5"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extra"><br><=
div class=3D"gmail_quote">On Sat, Apr 11, 2015 at 3:20 AM, Khem Raj <span d=
ir=3D"ltr">&lt;<a>raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">Here is what build history tells now<br>
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
Signed-off-by: Khem Raj &lt;<a>khem_raj@cable.comcast.com</a>&gt;<br>
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
<a>Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br></div></blockquote><div>=C2=A0</div>
</div></div></blockquote></div><br></div>

--f46d043749936a754205137489db--
