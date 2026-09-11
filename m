Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D12C88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 09:33:07 +0000 (UTC)
Subject: Re: [scarthgap][PATCH v2 2/3] python3-py: correct CVE_PRODUCT mapping
To: openembedded-core@lists.openembedded.org
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.83)
X-Originating-Platform: Windows Edge 152
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 11 Sep 2026 02:32:58 -0700
References: <20260902060943.2931635-1-dkelaiya@cisco.com> <20260902060943.2931635-2-dkelaiya@cisco.com> <DLCC065ZWGTZ.19S8A96PYY4SZ@smile.fr>
In-Reply-To: <DLCC065ZWGTZ.19S8A96PYY4SZ@smile.fr>
Message-ID: <307014.1789119178609979440@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="TM1M8BB1iCWNlddWtg7z"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 09:33:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245627

--TM1M8BB1iCWNlddWtg7z
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 01:37 PM, Yoann Congal wrote:

>=20
> On Wed Sep 2, 2026 at 8:09 AM CEST, Darsh Kelaiya -X (dkelaiya - E
> INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>=20
>> From: Devansh Patel <devanshp@cisco.com>
>>=20
>> The product-only "py" mapping generates a wildcard-vendor identity
>> instead of the exact NVD identity for the packaged pytest-dev py
>> source. Use "pytest:py" for its NVD dictionary CPE and configuration
>> matches.
>>=20
>> This changes the generated product identity. With sbom-cve-check 1.3.3,
>> the current CVE report is unchanged using the pinned database snapshots;
>> both mappings report CVE-2020-29651 and CVE-2022-42969.
>>=20
>> Signed-off-by: Devansh Patel <devanshp@cisco.com>
>> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
>> (cherry picked from commit 26fa8b053b71d1f3f8da359abaef578c671c692f)
>> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
>> ---
>> meta/recipes-devtools/python/python3-py_1.11.0.bb | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/meta/recipes-devtools/python/python3-py_1.11.0.bb
>> b/meta/recipes-devtools/python/python3-py_1.11.0.bb
>> index a75b9c2b14..906410e9bb 100644
>> --- a/meta/recipes-devtools/python/python3-py_1.11.0.bb
>> +++ b/meta/recipes-devtools/python/python3-py_1.11.0.bb
>> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D
>> "file://LICENSE;md5=3Da6bb0320b04a0a503f12f69fea479de9"
>>=20
>> SRC_URI[sha256sum] =3D
>> "51c75c4126074b472f746a24399ad32f6053d1b34b68d2fa41e558e6f4a98719"
>>=20
>> -CVE_PRODUCT =3D "py"
>> +CVE_PRODUCT =3D "pytest:py"
>>=20
>> DEPENDS +=3D "python3-setuptools-scm-native"
>=20
> Hello,
>=20
> As far as I can tell, this is also needed on meta-oe/wrynose. Can you
> send a backport there, please?
>=20
> Since patches 2&3/3 conflicts, I'll hold both until "python3-py: correct
> CVE_PRODUCT mapping" lands on meta-oe/wrynose.
>=20
> Baring future issues, I'll take 1/3.
>=20
> Thanks!
> --
> Yoann Congal
> Smile ECS

Hello Yoann,

Thanks for highlighting this. I've sent the requested "python3-py: correct =
CVE_PRODUCT mapping" as shown here for Wrynose:

https://lists.openembedded.org/g/openembedded-devel/message/129959

Regards,
Darsh Kelaiya

--TM1M8BB1iCWNlddWtg7z
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Fri, Sep 11, 2026 at 01:37 PM, Yoann Congal wrote:</div>
<div>
<blockquote>On Wed Sep 2, 2026 at 8:09 AM CEST, Darsh Kelaiya -X (dkelaiya =
- E INFOCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:<b=
r />
<blockquote>From: Devansh Patel &lt;devanshp@cisco.com&gt;<br /><br />The p=
roduct-only "py" mapping generates a wildcard-vendor identity<br />instead =
of the exact NVD identity for the packaged pytest-dev py<br />source. Use "=
pytest:py" for its NVD dictionary CPE and configuration<br />matches.<br />=
<br />This changes the generated product identity. With sbom-cve-check 1.3.=
3,<br />the current CVE report is unchanged using the pinned database snaps=
hots;<br />both mappings report CVE-2020-29651 and CVE-2022-42969.<br /><br=
 />Signed-off-by: Devansh Patel &lt;devanshp@cisco.com&gt;<br />Signed-off-=
by: Khem Raj &lt;khem.raj@oss.qualcomm.com&gt;<br />(cherry picked from com=
mit 26fa8b053b71d1f3f8da359abaef578c671c692f)<br />Signed-off-by: Darsh Kel=
aiya &lt;dkelaiya@cisco.com&gt;<br />---<br />meta/recipes-devtools/python/=
python3-py_1.11.0.bb | 2 +-<br />1 file changed, 1 insertion(+), 1 deletion=
(-)<br /><br />diff --git a/meta/recipes-devtools/python/python3-py_1.11.0.=
bb b/meta/recipes-devtools/python/python3-py_1.11.0.bb<br />index a75b9c2b1=
4..906410e9bb 100644<br />--- a/meta/recipes-devtools/python/python3-py_1.1=
1.0.bb<br />+++ b/meta/recipes-devtools/python/python3-py_1.11.0.bb<br />@@=
 -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da6bb0320b04a0a503f=
12f69fea479de9"<br /><br />SRC_URI[sha256sum] =3D "51c75c4126074b472f746a24=
399ad32f6053d1b34b68d2fa41e558e6f4a98719"<br /><br />-CVE_PRODUCT =3D "py"<=
br />+CVE_PRODUCT =3D "pytest:py"<br /><br />DEPENDS +=3D "python3-setuptoo=
ls-scm-native"</blockquote>
Hello,<br /><br />As far as I can tell, this is also needed on meta-oe/wryn=
ose. Can you<br />send a backport there, please?<br /><br />Since patches 2=
&amp;3/3 conflicts, I'll hold both until "python3-py: correct<br />CVE_PROD=
UCT mapping" lands on meta-oe/wrynose.<br /><br />Baring future issues, I'l=
l take 1/3.<br /><br />Thanks!<br />-- <br />Yoann Congal<br />Smile ECS</b=
lockquote>
Hello Yoann,<br /><br />Thanks for highlighting this. I've sent the request=
ed "python3-py: correct CVE_PRODUCT mapping" as shown here for Wrynose:<br =
/><br /><a href=3D"https://lists.openembedded.org/g/openembedded-devel/mess=
age/129959" target=3D"_blank" rel=3D"noopener">https://lists.openembedded.o=
rg/g/openembedded-devel/message/129959</a><br /><br />Regards,<br />Darsh K=
elaiya</div>

--TM1M8BB1iCWNlddWtg7z--

