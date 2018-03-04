Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0260278A3A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 11:43:31 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 188so10460867wme.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 03:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=070/r00dn4ytsfaIZNGmRCqZ9l1tDSXxEnaNCc6PHoQ=;
	b=oSOyUr4pDh/bGAaLkZRu1kuOw84oFTSkyfogjDZH5dIEmefgrVyU4Fq++Fr9QpDmJ+
	/9MKP7vj+5tM9ZdVUInGRcPmZdB2anU6zTpuFFdl3O2/nbStqcnFJoCWsP/ARnYitxnv
	Q98Dl4tpR6nLS+JM/KmCyFnq/fwxctCIXuoCba06iQRiewCIvJtpsur3LvWHY7Aqg1GD
	Ke+7YK2VePMdVvvMJWaubl6ouA/ChSpK1AV9LhbEEsJINg930d5PovPT17xK7REogy2J
	SEzFnUa0IlFrB1DG8cv1A43V0rx4g+QaxDc7Y4GjFoj6kmKRctNV3gCv0dL/wD4hdRT4
	Hf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=070/r00dn4ytsfaIZNGmRCqZ9l1tDSXxEnaNCc6PHoQ=;
	b=j32jPqcG7CFz9M/WQ4nUMi1DZKEMb8YixFZd2iZRRq/JPO/Y7zyZNQqwauRqZTKb6o
	d/wQoMNYXBBmDUcyldWxSKiSB8doCT+GfrHxhqBLfERPy5+Up1I7AAGclNek+QWmQCjA
	CZqtF4/fTDHDoNClTrYhxLEYOSsREhv3iCDWRw/Q8Y/7AoE7e6ulcO8FVpu47ZGcuWDT
	8/hSwhQLWtptzmfe5+dtVm7CEMWUFcXAxucSdhBt7G0a1DYQQwb5NZ1HqAntvllDA57q
	k1h/NqgluCx7wnnFJDCZ8/p49QlIAi58IaPot5yyjYVBaIIJaeNqEH/remFCUrnYQZOv
	VpPw==
X-Gm-Message-State: AElRT7FqaoDGhX/tmfwlshasINMrg9FbbHYhJ1AdS9TkkauMQ77PV54j
	JM03tGCNDJBPDo6ZAtkq5pjSXHfuqddd1LBTWCo=
X-Google-Smtp-Source: AG47ELuan0+MbxrcSvzoc29RJp/YitSK548BU8m3JMAgce6rUmsSIjGHqwYThVlWkn5B47GMs4ABUfM7ElvnCDiTu6Q=
X-Received: by 10.28.225.130 with SMTP id y124mr5452976wmg.60.1520163812653;
	Sun, 04 Mar 2018 03:43:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Sun, 4 Mar 2018 03:43:32 -0800 (PST)
In-Reply-To: <3353088c-10d8-3e8e-3aba-178e2c4e55b3@gmail.com>
References: <20161018011619.31677-1-raj.khem@gmail.com>
	<1512175057-78-1-git-send-email-Martin.Jansa@gmail.com>
	<CA+chaQcbgVU+=f5Yg6QrJ0fQyY4LZU3hFAs4L+gw+HVq4sk35w@mail.gmail.com>
	<3353088c-10d8-3e8e-3aba-178e2c4e55b3@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 4 Mar 2018 12:43:32 +0100
Message-ID: <CA+chaQdW06ppxR65-JU__1_mUFFYT4U3OPXejp4bmyaxwiXy4Q@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [morty][RESEND][PATCH] gnutls_3.5.3.bb: Fix native build on distro with kernel < 3.4.17
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
X-List-Received-Date: Sun, 04 Mar 2018 11:43:32 -0000
Content-Type: multipart/alternative; boundary="001a114a4cfa0dc073056694b88c"

--001a114a4cfa0dc073056694b88c
Content-Type: text/plain; charset="UTF-8"

Seems like what was now merged to morty didn't include this.

On Wed, Jan 17, 2018 at 8:06 PM, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 01/15/2018 12:14 AM, Martin Jansa wrote:
>
> ping
>
> On Sat, Dec 2, 2017 at 1:37 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> From: Khem Raj <raj.khem@gmail.com>
>>
>
> pick up now for stagging.
> armin
>
>
>> When using distros which use old kernels gnutls fails to build
>> due to missing SYS_getrandom, therefore we need to check for this
>> before using it.
>> Fixes errorr e.g.
>>
>> | ../../../gnutls-3.5.3/lib/nettle/rnd-linux.c: In function
>> 'have_getrandom':
>> | ../../../gnutls-3.5.3/lib/nettle/rnd-linux.c:59:42: error:
>> 'SYS_getrandom' undeclared (first use in this function)
>> |  #  define getrandom(dst,s,flags) syscall(SYS_getrandom, (void*)dst,
>> (size_t)s, (unsigned int)flags)
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  .../gnutls/gnutls/check_SYS_getrandom.patch        | 35
>> ++++++++++++++++++++++
>>  meta/recipes-support/gnutls/gnutls_3.5.3.bb        |  1 +
>>  2 files changed, 36 insertions(+)
>>  create mode 100644 meta/recipes-support/gnutls/gn
>> utls/check_SYS_getrandom.patch
>>
>> diff --git a/meta/recipes-support/gnutls/gnutls/check_SYS_getrandom.patch
>> b/meta/recipes-support/gnutls/gnutls/check_SYS_getrandom.patch
>> new file mode 100644
>> index 0000000..535c22a
>> --- /dev/null
>> +++ b/meta/recipes-support/gnutls/gnutls/check_SYS_getrandom.patch
>> @@ -0,0 +1,35 @@
>> +From f26c3979ab0325edb2e410d287bc501cf00e0ac0 Mon Sep 17 00:00:00 2001
>> +From: Nikos Mavrogiannopoulos <nmav@redhat.com>
>> +Date: Mon, 22 Aug 2016 16:32:34 +0200
>> +Subject: [PATCH] rnd-linux: added check for SYS_getrandom being defined
>> +
>> +This allows to compile the getrandom() code in old Linux systems
>> +which do not have the system call defined.
>> +---
>> +
>> +Upstream-Status: Backport
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +
>> + lib/nettle/rnd-linux.c | 6 +++++-
>> + 1 file changed, 5 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/lib/nettle/rnd-linux.c b/lib/nettle/rnd-linux.c
>> +index d7f07a6..7a24d05 100644
>> +--- a/lib/nettle/rnd-linux.c
>> ++++ b/lib/nettle/rnd-linux.c
>> +@@ -56,7 +56,11 @@ static dev_t _gnutls_urandom_fd_rdev = 0;
>> + # else
>> + #  include <sys/syscall.h>
>> + #  undef getrandom
>> +-#  define getrandom(dst,s,flags) syscall(SYS_getrandom, (void*)dst,
>> (size_t)s, (unsigned int)flags)
>> ++#  if defined(SYS_getrandom)
>> ++#   define getrandom(dst,s,flags) syscall(SYS_getrandom, (void*)dst,
>> (size_t)s, (unsigned int)flags)
>> ++#  else
>> ++#   define getrandom(dst,s,flags) -1
>> ++#  endif
>> + # endif
>> +
>> + static unsigned have_getrandom(void)
>> +--
>> +libgit2 0.24.0
>> +
>> diff --git a/meta/recipes-support/gnutls/gnutls_3.5.3.bb
>> b/meta/recipes-support/gnutls/gnutls_3.5.3.bb
>> index b2dbb07..0400588 100644
>> --- a/meta/recipes-support/gnutls/gnutls_3.5.3.bb
>> +++ b/meta/recipes-support/gnutls/gnutls_3.5.3.bb
>> @@ -4,6 +4,7 @@ SRC_URI += "file://correct_rpl_gettimeofday_signature.patch
>> \
>>              file://0001-configure.ac-fix-sed-command.patch \
>>              file://use-pkg-config-to-locate-zlib.patch \
>>              file://0001-Use-correct-include-dir-with-minitasn.patch \
>> +            file://check_SYS_getrandom.patch \
>>              file://CVE-2016-7444.patch \
>>             "
>>  SRC_URI[md5sum] = "6c2c7f40ddf52933ee3ca474cb8cb63c"
>> --
>> 2.7.4
>>
>>
>
>
>
>

--001a114a4cfa0dc073056694b88c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Seems like what was now merged to morty didn&#39;t include=
 this.</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On We=
d, Jan 17, 2018 at 8:06 PM, akuster808 <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF"><span class=3D"">
    <p><br>
    </p>
    <br>
    <div class=3D"m_-6088208376238100494moz-cite-prefix">On 01/15/2018 12:1=
4 AM, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">ping</div>
      <div class=3D"gmail_extra"><br>
        <div class=3D"gmail_quote">On Sat, Dec 2, 2017 at 1:37 AM, Martin
          Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.=
com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span>
          wrote:<br>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">From: Khem
            Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br></span>
    pick up now for stagging.<br>
    armin<div><div class=3D"h5"><br>
    <blockquote type=3D"cite">
      <div class=3D"gmail_extra">
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
            <br>
            When using distros which use old kernels gnutls fails to
            build<br>
            due to missing SYS_getrandom, therefore we need to check for
            this<br>
            before using it.<br>
            Fixes errorr e.g.<br>
            <br>
            | ../../../gnutls-3.5.3/lib/nett<wbr>le/rnd-linux.c: In
            function &#39;have_getrandom&#39;:<br>
            | ../../../gnutls-3.5.3/lib/nett<wbr>le/rnd-linux.c:59:42:
            error: &#39;SYS_getrandom&#39; undeclared (first use in this
            function)<br>
            |=C2=A0 #=C2=A0 define getrandom(dst,s,flags) syscall(SYS_getra=
ndom,
            (void*)dst, (size_t)s, (unsigned int)flags)<br>
            <br>
            Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.co=
m" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
            Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@=
gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
            ---<br>
            =C2=A0.../gnutls/gnutls/check_SYS_g<wbr>etrandom.patch=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |
            35 ++++++++++++++++++++++<br>
            =C2=A0meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.5.=
3.bb" rel=3D"noreferrer" target=3D"_blank">g<wbr>nutls_3.5.3.bb</a>=C2=A0
            =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
            =C2=A02 files changed, 36 insertions(+)<br>
            =C2=A0create mode 100644 meta/recipes-support/gnutls/gn<wbr>utl=
s/check_SYS_getrandom.patch<br>
            <br>
            diff --git a/meta/recipes-support/gnutls/<wbr>gnutls/check_SYS_=
getrandom.pat<wbr>ch
            b/meta/recipes-support/gnutls/<wbr>gnutls/check_SYS_getrandom.p=
at<wbr>ch<br>
            new file mode 100644<br>
            index 0000000..535c22a<br>
            --- /dev/null<br>
            +++ b/meta/recipes-support/gnutls/<wbr>gnutls/check_SYS_getrand=
om.pat<wbr>ch<br>
            @@ -0,0 +1,35 @@<br>
            +From f26c3979ab0325edb2e410d287bc50<wbr>1cf00e0ac0 Mon Sep
            17 00:00:00 2001<br>
            +From: Nikos Mavrogiannopoulos &lt;<a href=3D"mailto:nmav@redha=
t.com" target=3D"_blank">nmav@redhat.com</a>&gt;<br>
            +Date: Mon, 22 Aug 2016 16:32:34 +0200<br>
            +Subject: [PATCH] rnd-linux: added check for SYS_getrandom
            being defined<br>
            +<br>
            +This allows to compile the getrandom() code in old Linux
            systems<br>
            +which do not have the system call defined.<br>
            +---<br>
            +<br>
            +Upstream-Status: Backport<br>
            +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.c=
om" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
            +<br>
            + lib/nettle/rnd-linux.c | 6 +++++-<br>
            + 1 file changed, 5 insertions(+), 1 deletion(-)<br>
            +<br>
            +diff --git a/lib/nettle/rnd-linux.c
            b/lib/nettle/rnd-linux.c<br>
            +index d7f07a6..7a24d05 100644<br>
            +--- a/lib/nettle/rnd-linux.c<br>
            ++++ b/lib/nettle/rnd-linux.c<br>
            +@@ -56,7 +56,11 @@ static dev_t _gnutls_urandom_fd_rdev =3D
            0;<br>
            + # else<br>
            + #=C2=A0 include &lt;sys/syscall.h&gt;<br>
            + #=C2=A0 undef getrandom<br>
            +-#=C2=A0 define getrandom(dst,s,flags) syscall(SYS_getrandom,
            (void*)dst, (size_t)s, (unsigned int)flags)<br>
            ++#=C2=A0 if defined(SYS_getrandom)<br>
            ++#=C2=A0 =C2=A0define getrandom(dst,s,flags) syscall(SYS_getra=
ndom,
            (void*)dst, (size_t)s, (unsigned int)flags)<br>
            ++#=C2=A0 else<br>
            ++#=C2=A0 =C2=A0define getrandom(dst,s,flags) -1<br>
            ++#=C2=A0 endif<br>
            + # endif<br>
            +<br>
            + static unsigned have_getrandom(void)<br>
            +--<br>
            +libgit2 0.24.0<br>
            +<br>
            diff --git a/meta/recipes-support/gnutls/<a href=3D"http://gnut=
ls_3.5.3.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>gnutls_3.5.3.bb</a>
            b/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.5.3.bb=
" rel=3D"noreferrer" target=3D"_blank"><wbr>gnutls_3.5.3.bb</a><br>
            index b2dbb07..0400588 100644<br>
            --- a/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.5.=
3.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>gnutls_3.5.3.bb</a><br>
            +++ b/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.5.=
3.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>gnutls_3.5.3.bb</a><br>
            @@ -4,6 +4,7 @@ SRC_URI +=3D &quot;<a class=3D"m_-6088208376238=
100494moz-txt-link-freetext">file://correct_rpl_</a>gettimeofd<wbr>ay_signa=
ture.patch
            \<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a class=3D"m_-=
6088208376238100494moz-txt-link-freetext">file://0001-configure.ac-fix</a>-=
<wbr>sed-command.patch
            \<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a class=3D"m_-=
6088208376238100494moz-txt-link-freetext">file://use-pkg-config-to</a>-loca=
<wbr>te-zlib.patch
            \<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a class=3D"m_-=
6088208376238100494moz-txt-link-freetext">file://0001-Use-correct</a>-inclu=
<wbr>de-dir-with-minitasn.patch
            \<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a class=3D"m_-60882=
08376238100494moz-txt-link-freetext">file://check_SYS_getrandom</a>.pat<wbr=
>ch \<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a class=3D"m_-=
6088208376238100494moz-txt-link-freetext">file://CVE-2016-7444.patch</a> \<=
br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
            =C2=A0SRC_URI[md5sum] =3D &quot;6c2c7f40ddf52933ee3ca474cb8cb<w=
br>63c&quot;<br>
            <span class=3D"m_-6088208376238100494HOEnZb"><font color=3D"#88=
8888">--<br>
                2.7.4<br>
                <br>
              </font></span></blockquote>
        </div>
        <br>
      </div>
      <br>
      <fieldset class=3D"m_-6088208376238100494mimeAttachmentHeader"></fiel=
dset>
      <br>
    </blockquote>
    <br>
  </div></div></div>

</blockquote></div><br></div>

--001a114a4cfa0dc073056694b88c--
