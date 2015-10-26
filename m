Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 32BD973D27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 16:11:14 +0000 (UTC)
Received: by qgem9 with SMTP id m9so123167855qge.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 09:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=5A+5MAm1VhuJWLyjQsRD1XKvnSG8FSKkFUa8CFdbQXc=;
	b=svW7io0YfhV9UTr2rvV0PtjXzNxqb4YflUoI30ZsHtaGy+O8LSJqWG5iUJ86Qb/D/7
	0BXcxWhhlnfk+Mvky6SUHoCqL5GK2OEw4WznjvaHxx2yy796FcX9kyYJosA2QjqsgzT/
	sYhE2OZVEth2K6mINmjpg9Bee56Nrp7ZtYqk+wjBQZyQyxF/+MXfqJicErhnroP07Afh
	YcFoz2Le9kV0qbWoIxJ5ngWX9Hs48xcys6Lp+1WG3cPR0+15qgPkZlEgb36OBnn0lHKu
	B1o7jr4IW+g9IpxbHDEFlZSjQnTDUWB5yJh/cbSzZOi0L1OYq3SwiMGddNhvdjUsZqsZ
	pNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5A+5MAm1VhuJWLyjQsRD1XKvnSG8FSKkFUa8CFdbQXc=;
	b=M67q6SX4AE5bWyVWF9K2diEkBL8zAweYQDn7qg18f8tZyFVYAjsBzOH3U1RXoyeiC1
	QTaYa2K/mK6iVTyNQiwoU0DwKxCYcBFud3xRH5qvNL3s6JaU2BrFYPIWcBb3+nbnRPgx
	7ZfzPA6XFRnOrHO5eI7/RG4KCLMxlEp1CfSXiECZIDLkcgeioyoqI+YmeURYpaBlruGx
	GGeMXX+jdkJN0WBfdnypkeoddRpppR/x5WpufG/o5Dbq6/yXrY19sjJxuOLgFdjvCHBn
	ZXgIra/vI6aIbNbz16e5da51vpSKmdqqeORXG0y6GKTP8P6b3IbV8UF6k0xdxsWQ6FLf
	UXVA==
X-Gm-Message-State: ALoCoQmF2m8X/2iqP9N0iqdTJv5++QnHdbXleJC2UPb0KbE8mboWlklFqJ+FtZeBIhbAPoRHUWGZ
X-Received: by 10.141.23.20 with SMTP id z20mr39517504qhd.52.1445875874415;
	Mon, 26 Oct 2015 09:11:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Mon, 26 Oct 2015 09:10:54 -0700 (PDT)
In-Reply-To: <562D9C5F.4040500@windriver.com>
References: <1444286871-8615-1-git-send-email-jian.liu@windriver.com>
	<562091F8.40805@windriver.com> <562D9C5F.4040500@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Oct 2015 16:10:54 +0000
Message-ID: <CAJTo0Lamv2+vvoACpZ+Td5jCVxhLomxTSPD51kR0dw7D=0yFwQ@mail.gmail.com>
To: Liu Jian <jian.liu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: considering multilib when setting LICENSE_EXCLUSION
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
X-List-Received-Date: Mon, 26 Oct 2015 16:11:18 -0000
Content-Type: multipart/alternative; boundary=001a11423c80e25c4905230435a7

--001a11423c80e25c4905230435a7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This is in the queue and will likely be merged for Jethro.

Ross

On 26 October 2015 at 03:22, Liu Jian <jian.liu@windriver.com> wrote:

> Ping
>
> =E4=BA=8E 2015=E5=B9=B410=E6=9C=8816=E6=97=A5 13:58, Liu Jian =E5=86=99=
=E9=81=93:
>
>> Hi All,
>>
>> Will you going to merge this patch?
>> I have ever discuss with Robert Yang and he agreed to integrated it.
>>
>> Thanks!
>> Jian
>>
>>
>> =E4=BA=8E 2015=E5=B9=B410=E6=9C=8808=E6=97=A5 14:47, Jian Liu =E5=86=99=
=E9=81=93:
>>
>>> The PACKAGES is not mapped with MLPREFIX when setting LICENSE_EXCLUSION
>>> in base.bbclass. For example,
>>>    For libgcc-dev,
>>>      LICENSE_EXCLUSION-libgcc-dev=3D1
>>>     but for lib32-libgcc-dev,
>>>      LICENSE_EXCLUSION-libgcc-dev=3D1
>>> Obviously it is wrong for lib32-libgcc-dev.
>>>
>>> Add MLPREFIX before the package name during setting LICENSE_EXCLUSION
>>>
>>> Signed-off-by: Jian Liu <jian.liu@windriver.com>
>>> ---
>>>   meta/classes/base.bbclass | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
>>> index f078001..89c8f04 100644
>>> --- a/meta/classes/base.bbclass
>>> +++ b/meta/classes/base.bbclass
>>> @@ -512,7 +512,8 @@ python () {
>>>                   if unskipped_pkgs:
>>>                       for pkg in skipped_pkgs:
>>>                           bb.debug(1, "SKIPPING the package " + pkg + "
>>> at do_rootfs because it's " + recipe_license)
>>> -                        d.setVar('LICENSE_EXCLUSION-' + pkg, 1)
>>> +                        mlprefix =3D d.getVar('MLPREFIX', True)
>>> +                        d.setVar('LICENSE_EXCLUSION-' + mlprefix + pkg=
,
>>> 1)
>>>                       for pkg in unskipped_pkgs:
>>>                           bb.debug(1, "INCLUDING the package " + pkg)
>>>                   elif all_skipped or incompatible_license(d,
>>> bad_licenses):
>>>
>>
>>
> --
> Jian Liu
> Email: jian.liu@windriver.com
> Office Phone: 86-10-84778539
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11423c80e25c4905230435a7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is in the queue and will likely be merged for Jethro.=
<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On 26 October 2015 at 03:22, Liu Jian <span dir=3D"ltr">=
&lt;<a href=3D"mailto:jian.liu@windriver.com" target=3D"_blank">jian.liu@wi=
ndriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span c=
lass=3D"im HOEnZb">Ping<br>
<br>
=E4=BA=8E 2015=E5=B9=B410=E6=9C=8816=E6=97=A5 13:58, Liu Jian =E5=86=99=E9=
=81=93:<br>
</span><div class=3D"HOEnZb"><div class=3D"h5"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
Hi All,<br>
<br>
Will you going to merge this patch?<br>
I have ever discuss with Robert Yang and he agreed to integrated it.<br>
<br>
Thanks!<br>
Jian<br>
<br>
<br>
=E4=BA=8E 2015=E5=B9=B410=E6=9C=8808=E6=97=A5 14:47, Jian Liu =E5=86=99=E9=
=81=93:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
The PACKAGES is not mapped with MLPREFIX when setting LICENSE_EXCLUSION<br>
in base.bbclass. For example,<br>
=C2=A0 =C2=A0For libgcc-dev,<br>
=C2=A0 =C2=A0 =C2=A0LICENSE_EXCLUSION-libgcc-dev=3D1<br>
=C2=A0 =C2=A0 but for lib32-libgcc-dev,<br>
=C2=A0 =C2=A0 =C2=A0LICENSE_EXCLUSION-libgcc-dev=3D1<br>
Obviously it is wrong for lib32-libgcc-dev.<br>
<br>
Add MLPREFIX before the package name during setting LICENSE_EXCLUSION<br>
<br>
Signed-off-by: Jian Liu &lt;<a href=3D"mailto:jian.liu@windriver.com" targe=
t=3D"_blank">jian.liu@windriver.com</a>&gt;<br>
---<br>
=C2=A0 meta/classes/base.bbclass | 3 ++-<br>
=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass<br>
index f078001..89c8f04 100644<br>
--- a/meta/classes/base.bbclass<br>
+++ b/meta/classes/base.bbclass<br>
@@ -512,7 +512,8 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if unskipped=
_pkgs:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 for pkg in skipped_pkgs:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 bb.debug(1, &quot;SKIPPING the package &quot; + pkg + &qu=
ot; at do_rootfs because it&#39;s &quot; + recipe_license)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 d.setVar(&#39;LICENSE_EXCLUSION-&#39; + pkg, 1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 mlprefix =3D d.getVar(&#39;MLPREFIX&#39;, True)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 d.setVar(&#39;LICENSE_EXCLUSION-&#39; + mlprefix + pkg, 1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 for pkg in unskipped_pkgs:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 bb.debug(1, &quot;INCLUDING the package &quot; + pkg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif all_ski=
pped or incompatible_license(d, bad_licenses):<br>
</blockquote>
<br>
</blockquote>
<br>
-- <br>
Jian Liu<br>
Email: <a href=3D"mailto:jian.liu@windriver.com" target=3D"_blank">jian.liu=
@windriver.com</a><br>
Office Phone: 86-10-84778539<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br></div>

--001a11423c80e25c4905230435a7--
