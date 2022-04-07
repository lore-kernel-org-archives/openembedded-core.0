Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B35C2C38A2B
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:15 +0000 (UTC)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
 [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.web11.7804.1649342944441362817
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 07:49:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Dly5NvCL;
 spf=pass (domain: gmail.com, ip: 209.85.221.172,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-vk1-f172.google.com with SMTP id b81so2812334vkf.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 07:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uAmvQfoaMhHZkZwFlQZ5bse3cCZKjPyXfJlSdScGtDg=;
        b=Dly5NvCLHj3efyOscbWpVenzy2I38mMsfLhQC2xwtlsomh7XB6cD9Sh1gwkf/HgPp3
         4mXePC1gHTlfIe9IkkXhYtZHn8tbUL45ewcttGJOuVVVV2N0LHvEYc/ShMBw72R+aPIT
         syleUXhxS9mblcV0Hcicrs5Owe4CyEy1Badj4t4yfTWpsYQBi8ugz6gZIXQPrVqTsqwd
         LHKD7Beq41vw9/El5ewPyH9CR1dzKANdlFWJVklUUq2DQOjDjqrdYAUJDxckwd3GKus9
         /RHB5HK7aJnKnbdfo8ttOIe6e+Q1NT8dJKof30pKPSWwL9fRLN242/RAD5pbBYB+v+DD
         Zbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uAmvQfoaMhHZkZwFlQZ5bse3cCZKjPyXfJlSdScGtDg=;
        b=u3yHfhE8i1Nc2HoTQKmSO+kjB2EDc7it0PnBM1NpYJejVnV0zqSp9dD5Mwq1rupTDA
         9rGdFpLzjGGB0VsIbpwlRiH2pPjTSdFb7Mcgzl/zubTn4tHddGrBIeYY/pa3rFVf7PmK
         pTgrW58OfqL0olOzPWxjtlossNK9XtJWWOwBN+wlx0FvImfIEcbZroPcR0PyFiOZpfzd
         dwwTNvCRpA4LFV1UQirIrEiFMAEtJIUdB7DfECRmNrQQB/AoViBUMXv02ejW+sW4I7EP
         7ZsBk7DhugSC/707uVc+ambRZBX7Ah9a/6WSG/aPewzUj3UKh8c/xJfk0CccEX6XStJj
         VXGw==
X-Gm-Message-State: AOAM533IoB9gyYW6hhkqpcdIWN+wtGZ5xZmV7Oi806y18UlR33MCL3j3
	IWNrlOTlJUZOCdveFbVCOQnhOVKcv66D0/JGL8U=
X-Google-Smtp-Source: 
 ABdhPJyGgdvB2bRSvT/uErbXBDqimHLdtofO9PFA1iCdU9q0Bp8mt/cLi4gTOU9EPa9OobfiYW+eoCmZ+XvSKt2Vq/c=
X-Received: by 2002:a1f:50c4:0:b0:336:e84d:2873 with SMTP id
 e187-20020a1f50c4000000b00336e84d2873mr5038361vkb.30.1649342943581; Thu, 07
 Apr 2022 07:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220317164434.387779-1-ross.burton@arm.com>
 <20220317164434.387779-2-ross.burton@arm.com>
 <16E1E04DCAF22D86.750@lists.openembedded.org>
In-Reply-To: <16E1E04DCAF22D86.750@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 7 Apr 2022 16:48:50 +0200
Message-ID: 
 <CA+chaQduTDhBx33DP0ChwQ0y+Foqt6Kx5cSZABqvRi3kriMtfA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] python3-cryptography: enforce identical
 version for -cryptography-vectors
To: martin.jansa@gmail.com,
	Alejandro del Castillo <alejandro.delcastillo@ni.com>
Cc: Ross Burton <ross@burtonini.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000043da5b05dc11943c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 15:41:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164113

--00000000000043da5b05dc11943c
Content-Type: text/plain; charset="UTF-8"

I've tried with rpm and surprisingly it works and dnf was able to
install python3-cryptography-ptest in the image (even after bumping PR to
r1 -n python3-cryptography-vectors recipe).

But still not clear why it works and if it's expected behavior.

In fresh fedora:37 docker image with rpmdevtools installed I see:

[root@aaa509e35d1f /]# rpmdev-vercmp 36.0.2-r0 36.0.2-r1
36.0.2-r0 < 36.0.2-r1
[root@aaa509e35d1f /]# rpmdev-vercmp 36.0.2-r0 36.0.2-r0
36.0.2-r0 == 36.0.2-r0
[root@aaa509e35d1f /]# rpmdev-vercmp 36.0.2-r0.0 36.0.2-r0.1
36.0.2-r0.0 < 36.0.2-r0.1

But I'm not familiar with dnf/rpm to see how the versioned runtime
dependency is handled during installation (isn't it resolved by the same
libsolv as what opkg is using now by default as well?

+ Alejandro in case it should be fixed in opkg somehow.


On Fri, Apr 1, 2022 at 10:39 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> Not sure if this is working correctly, with opkg
> and python3-cryptography-ptest included in the image I get:
>
>  * Solver encountered 1 problem(s):
>  * Problem 1/1:
>  *   - conflicting requests
>  *   - nothing provides python3-cryptography-vectors = 36.0.2 needed by
> python3-cryptography-ptest-36.0.2-r0.0.qemux86_64
>  *
>  * Solution 1:
>  *   - do not ask to install a package providing python3-cryptography-ptest
>
> even when I do have
> python3-cryptography-vectors_36.0.2-r0.0_qemux86_64.ipk and
> python3-cryptography-ptest_36.0.2-r0.0_qemux86_64.ipk
>
> is rpm parsing the version differently or is the issue somewhere else?
>
> I guess forcing identical EXTENDPKGV (instead of PV) between
> python3-cryptography and python3-cryptography-vectors would be too much
> (especially for people with PRserv enabled).
>
> Cheers,
>
> On Thu, Mar 17, 2022 at 5:44 PM Ross Burton <ross@burtonini.com> wrote:
>
>> python3-cryptography and python3-cryptography-vectors are actually the
>> same project but are on Pypi as two separate modules.
>>
>> The test suite validates that they're the same version and fails if they
>> are not:
>>
>> FAIL: tests/test_utils.py::test_vector_version
>>     def test_vector_version():
>> >       assert cryptography.__version__ ==
>> cryptography_vectors.__version__
>> E       AssertionError: assert '36.0.2' == '36.0.1'
>>
>> Catch this slightly earlier by mandating that python3-cryptography-ptest
>> pulls in an identically versioned python3-cryptography-vectors.
>>
>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>> ---
>>  meta/recipes-devtools/python/python3-cryptography_36.0.2.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
>> b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
>> index 940df60d44..cb3acdf7e2 100644
>> --- a/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
>> +++ b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
>> @@ -91,7 +91,7 @@ RDEPENDS:${PN}:append:class-target = " \
>>
>>  RDEPENDS:${PN}-ptest += " \
>>      ${PYTHON_PN}-bcrypt \
>> -    ${PYTHON_PN}-cryptography-vectors \
>> +    ${PYTHON_PN}-cryptography-vectors (= ${PV}) \
>>      ${PYTHON_PN}-hypothesis \
>>      ${PYTHON_PN}-iso8601 \
>>      ${PYTHON_PN}-pretend \
>> --
>> 2.25.1
>>
>>
>>
>>
>>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163945):
> https://lists.openembedded.org/g/openembedded-core/message/163945
> Mute This Topic: https://lists.openembedded.org/mt/89849717/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000043da5b05dc11943c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve tried with rpm and surprisingly it works and dnf =
was able to install=C2=A0python3-cryptography-ptest in the image (even afte=
r bumping PR to r1 -n python3-cryptography-vectors recipe).<div><br></div><=
div>But still not clear why it works and if it&#39;s expected behavior.</di=
v><div><br></div><div>In fresh=C2=A0fedora:37 docker image with=C2=A0rpmdev=
tools installed I see:</div><div><br></div><div>[root@aaa509e35d1f /]# rpmd=
ev-vercmp 36.0.2-r0 36.0.2-r1<br>36.0.2-r0 &lt; 36.0.2-r1<br>[root@aaa509e3=
5d1f /]# rpmdev-vercmp 36.0.2-r0 36.0.2-r0<br>36.0.2-r0 =3D=3D 36.0.2-r0<br=
>[root@aaa509e35d1f /]# rpmdev-vercmp 36.0.2-r0.0 36.0.2-r0.1<br>36.0.2-r0.=
0 &lt; 36.0.2-r0.1<br></div><div><br></div><div>But I&#39;m not familiar wi=
th dnf/rpm to see how the versioned runtime dependency is handled during in=
stallation (isn&#39;t it resolved by the same libsolv as what opkg is using=
 now by default as well?</div><div><br></div><div>+=C2=A0Alejandro in case =
it should be fixed in opkg somehow.<br></div><div><br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 1, =
2022 at 10:39 PM Martin Jansa via <a href=3D"http://lists.openembedded.org"=
>lists.openembedded.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@=
lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">No=
t sure if this is working correctly, with opkg and=C2=A0python3-cryptograph=
y-ptest included in the image I get:<div><br></div><div>=C2=A0* Solver enco=
untered 1 problem(s):<br>=C2=A0* Problem 1/1:<br>=C2=A0* =C2=A0 - conflicti=
ng requests<br>=C2=A0* =C2=A0 - nothing provides python3-cryptography-vecto=
rs =3D 36.0.2 needed by python3-cryptography-ptest-36.0.2-r0.0.qemux86_64<b=
r>=C2=A0*<br>=C2=A0* Solution 1:<br>=C2=A0* =C2=A0 - do not ask to install =
a package providing python3-cryptography-ptest<br></div><div><br></div><div=
>even when I do have python3-cryptography-vectors_36.0.2-r0.0_qemux86_64.ip=
k=C2=A0and python3-cryptography-ptest_36.0.2-r0.0_qemux86_64.ipk<br></div><=
div><br></div><div>is rpm parsing the version differently or is the issue s=
omewhere else?<br></div><div><br></div><div>I guess forcing identical EXTEN=
DPKGV (instead of PV) between python3-cryptography and python3-cryptography=
-vectors would be too much (especially for people with PRserv enabled).<br>=
</div><div><br></div><div>Cheers,</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 17, 2022 at 5:44 PM Ross=
 Burton &lt;<a href=3D"mailto:ross@burtonini.com" target=3D"_blank">ross@bu=
rtonini.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">python3-cryptography and python3-cryptography-vectors are actual=
ly the<br>
same project but are on Pypi as two separate modules.<br>
<br>
The test suite validates that they&#39;re the same version and fails if the=
y<br>
are not:<br>
<br>
FAIL: tests/test_utils.py::test_vector_version<br>
=C2=A0 =C2=A0 def test_vector_version():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0assert cryptography.__version__ =3D=3D crypt=
ography_vectors.__version__<br>
E=C2=A0 =C2=A0 =C2=A0 =C2=A0AssertionError: assert &#39;36.0.2&#39; =3D=3D =
&#39;36.0.1&#39;<br>
<br>
Catch this slightly earlier by mandating that python3-cryptography-ptest<br=
>
pulls in an identically versioned python3-cryptography-vectors.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-cryptography_3=
6.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_36.0.2.=
bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptog=
raphy_36.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_=
36.0.2.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-cryp=
tography_36.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptograp=
hy_36.0.2.bb</a><br>
index 940df60d44..cb3acdf7e2 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-cryptography_3=
6.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_36.0.2.=
bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-cryptography_3=
6.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-cryptography_36.0.2.=
bb</a><br>
@@ -91,7 +91,7 @@ RDEPENDS:${PN}:append:class-target =3D &quot; \<br>
<br>
=C2=A0RDEPENDS:${PN}-ptest +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-bcrypt \<br>
-=C2=A0 =C2=A0 ${PYTHON_PN}-cryptography-vectors \<br>
+=C2=A0 =C2=A0 ${PYTHON_PN}-cryptography-vectors (=3D ${PV}) \<br>
=C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-hypothesis \<br>
=C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-iso8601 \<br>
=C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-pretend \<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#163945): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/163945" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/163945</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89849717/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/89849717/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000043da5b05dc11943c--

