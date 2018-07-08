Return-Path: <ticotimo@gmail.com>
Received: from mail-ua0-f181.google.com (mail-ua0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7A5DF7546A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Jul 2018 07:45:40 +0000 (UTC)
Received: by mail-ua0-f181.google.com with SMTP id x24-v6so9958667ual.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jul 2018 00:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0Fv9/sghNzlZTWd1brB1gppyK3H3KnGe4ViQkTOQ6Qg=;
	b=r4MTgE7wqe2jXkAZcMVOIpVMz2ldqYqKVPKnR7IPGu4+LiD1xclj+xkCdr+feK0gXU
	eHAYFuTo29KC1LgLZnqF6yAsNeILyRmo73DIVofbSgXD12Iz1bnycNHapcYMmuOHglTV
	oa29XVk4M/PaYaUKLWRgw+3Ndh0fFIG+nkol/sos5KLwNjHBTuPBAGroJOXM/hCXSh8R
	QBT5idR/fjIIY5wt0EUiLf4rafCe/xt7dKoKFOqfu+7g/iMCsBa9sE0kQirmy+95W71Y
	QmVcXMra6MZ6hIZPhah7pTnGWOWWIsCxttDB1UwjSQtTPsSG27KBRqzB4FpTn6pihin4
	aXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0Fv9/sghNzlZTWd1brB1gppyK3H3KnGe4ViQkTOQ6Qg=;
	b=p0f2k60CN1nAnoxm4FZfqz8ANnUtLhkF5hgjHEeFlzmpk83Ef+1xmmy1YE6DNb0neH
	JLt2F1+JEDvVuuHTYAO7UzvQC/WXhXu5gTIZ/9gFBWHxU+aIh2r3YDVISIDCZ/Pk95ML
	mEsKOrg3dr7gOdGGdG4zskv34+BjcJ8suWyRzFfH29uueFi+O/5Iljv9u6HQA9RP4awr
	TjGRIDPi6+2/vjPvVv8PRdjQfdzZlq/Ji7yAC7fKXk+Yi5OoTttE5kaZIDUeutXc4wwg
	V8IJPSkasHqg0tvc6A6zpVDF9+8Xp+e9YvfGyDRmneV15UqTNI2b3sTSDQk3w5Nx0uJi
	mdzw==
X-Gm-Message-State: APt69E1gLNBe6GvNztMPzfnX2UrDugpyRMO2cu0W7c8mWQXGRyVG+iy0
	4u99pDXWg53L39pIxksLHiGzqJ/lNA0wbdilmuk=
X-Google-Smtp-Source: AAOMgpfgUAKwTf1+BTnKz8CcB3M+Ug1jVPpwUV/Sl1nqEkm/YhoWO8/VsQ0Kn9XysfFEHaLHQ0nPofDSRelrIFLpkO8=
X-Received: by 2002:ab0:5323:: with SMTP id
	x32-v6mr10099602uax.139.1531035941376; 
	Sun, 08 Jul 2018 00:45:41 -0700 (PDT)
MIME-Version: 1.0
References: <20180706154749.19324-1-ross.burton@intel.com>
	<CANx9H-BuNP_+EeFJSooZk+awTn3qG5_YU63dypoAWjNvE3k4iQ@mail.gmail.com>
In-Reply-To: <CANx9H-BuNP_+EeFJSooZk+awTn3qG5_YU63dypoAWjNvE3k4iQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 8 Jul 2018 00:45:29 -0700
Message-ID: <CANx9H-BjOBcHU=yyM1s+qfeQQhDra1g3fYNSU57DCmVDh3O0rA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] minicom: remove dead URL from UPSTREAM_CHECK_URI
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
X-List-Received-Date: Sun, 08 Jul 2018 07:45:40 -0000
Content-Type: multipart/alternative; boundary="0000000000006c969305707815fc"

--0000000000006c969305707815fc
Content-Type: text/plain; charset="UTF-8"

salsa.debian.org had no tags, so perhaps:
https://sources.debian.org/src/minicom/
On Sun, Jul 8, 2018 at 12:28 AM Tim Orling <ticotimo@gmail.com> wrote:

> All the alioth.debian.org URLs should be changed to use salsa.debian.org.
> Quick search showed:
> https://salsa.debian.org/minicom-team/minicom
> On Fri, Jul 6, 2018 at 8:47 AM Ross Burton <ross.burton@intel.com> wrote:
>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta/recipes-extended/minicom/minicom_2.7.1.bb | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/meta/recipes-extended/minicom/minicom_2.7.1.bb
>> b/meta/recipes-extended/minicom/minicom_2.7.1.bb
>> index be0b48dfdf5..1e6f1317ebe 100644
>> --- a/meta/recipes-extended/minicom/minicom_2.7.1.bb
>> +++ b/meta/recipes-extended/minicom/minicom_2.7.1.bb
>> @@ -16,8 +16,6 @@ SRC_URI =
>> "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.gz \
>>  SRC_URI[md5sum] = "9021cb8c5445f6e6e74b2acc39962d62"
>>  SRC_URI[sha256sum] =
>> "532f836b7a677eb0cb1dca8d70302b73729c3d30df26d58368d712e5cca041f1"
>>
>> -UPSTREAM_CHECK_URI = "https://alioth.debian.org/frs/?group_id=30018"
>> -
>>  PACKAGECONFIG ??= ""
>>  PACKAGECONFIG[lockdev] = "--enable-lockdev,--disable-lockdev,lockdev"
>>
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--0000000000006c969305707815fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<a href=3D"http://salsa.debian.org">salsa.debian.org</a> had no tags, so pe=
rhaps:<br><a href=3D"https://sources.debian.org/src/minicom/">https://sourc=
es.debian.org/src/minicom/</a><br><div class=3D"gmail_quote"><div dir=3D"lt=
r">On Sun, Jul 8, 2018 at 12:28 AM Tim Orling &lt;<a href=3D"mailto:ticotim=
o@gmail.com">ticotimo@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">All the <a href=3D"http://alioth.debian.org" target=3D"_blank=
">alioth.debian.org</a> URLs should be changed to use <a href=3D"http://sal=
sa.debian.org" target=3D"_blank">salsa.debian.org</a>.<br>Quick search show=
ed:<br><a href=3D"https://salsa.debian.org/minicom-team/minicom" target=3D"=
_blank">https://salsa.debian.org/minicom-team/minicom</a><br><div class=3D"=
gmail_quote"><div dir=3D"ltr">On Fri, Jul 6, 2018 at 8:47 AM Ross Burton &l=
t;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@in=
tel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-off-b=
y: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blan=
k">ross.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/minicom/<a href=3D"http://minicom_2.7.1.bb" rel=
=3D"noreferrer" target=3D"_blank">minicom_2.7.1.bb</a> | 2 --<br>
=C2=A01 file changed, 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-extended/minicom/<a href=3D"http://minicom_2.7.1.=
bb" rel=3D"noreferrer" target=3D"_blank">minicom_2.7.1.bb</a> b/meta/recipe=
s-extended/minicom/<a href=3D"http://minicom_2.7.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">minicom_2.7.1.bb</a><br>
index be0b48dfdf5..1e6f1317ebe 100644<br>
--- a/meta/recipes-extended/minicom/<a href=3D"http://minicom_2.7.1.bb" rel=
=3D"noreferrer" target=3D"_blank">minicom_2.7.1.bb</a><br>
+++ b/meta/recipes-extended/minicom/<a href=3D"http://minicom_2.7.1.bb" rel=
=3D"noreferrer" target=3D"_blank">minicom_2.7.1.bb</a><br>
@@ -16,8 +16,6 @@ SRC_URI =3D &quot;${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_$=
{PV}.orig.tar.gz \<br>
=C2=A0SRC_URI[md5sum] =3D &quot;9021cb8c5445f6e6e74b2acc39962d62&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;532f836b7a677eb0cb1dca8d70302b73729c3d30=
df26d58368d712e5cca041f1&quot;<br>
<br>
-UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://alioth.debian.org/frs/?gro=
up_id=3D30018" rel=3D"noreferrer" target=3D"_blank">https://alioth.debian.o=
rg/frs/?group_id=3D30018</a>&quot;<br>
-<br>
=C2=A0PACKAGECONFIG ??=3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG[lockdev] =3D &quot;--enable-lockdev,--disable-lockdev,l=
ockdev&quot;<br>
<br>
-- <br>
2.11.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>
</blockquote></div>

--0000000000006c969305707815fc--
