Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0758C624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 12:24:06 +0000 (UTC)
Subject: Re: [wrynose][PATCH] python3-lxml: fix CVE-2026-41066
To: openembedded-core@lists.openembedded.org
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
X-Originating-Location: Mumbai, Maharashtra, IN (151.186.177.21)
X-Originating-Platform: Windows Edge 152
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 03 Sep 2026 05:24:01 -0700
References: <20260819103604.107840-1-dkelaiya@cisco.com> <DL4TUXARXU2C.FKDEUMNVUYGJ@smile.fr>
In-Reply-To: <DL4TUXARXU2C.FKDEUMNVUYGJ@smile.fr>
Message-ID: <2561044.1788438241065281383@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="4eAMtP6YHjmuXce9TZvk"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 12:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245033

--4eAMtP6YHjmuXce9TZvk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Yoann,

Thanks for the review.

The v2 patches now include the regenerated src/lxml/etree.c for both branch=
es. The regeneration was performed outside BitBake, since the recipes build=
 the pregenerated C source and do not depend on Cython.

For Scarthgap, I used Cython 3.0.9 with Python 3.12:

python3.12 setup.py build_ext -i --with-cython --warnings -j1

For Wrynose, I used Cython 3.1.4, matching the version recorded in the ship=
ped etree.c:

python setup.py build_ext -i --with-cython

I kept the iterparse.pxi changes line-count stable and removed unrelated ge=
nerator metadata changes to avoid Cython source-location churn. As a result=
, the etree.c diffs are limited to 40 changed lines for Scarthgap and 60 ch=
anged lines for Wrynose.

The Scarthgap v2 also includes the upstream ETCompatXMLParser documented-de=
fault change. Please find the v2 patches for Wrynose [1] and Scarthgap [2]:

[1] https://lists.openembedded.org/g/openembedded-core/topic/wrynose_patch_=
v2/121067576
[2] https://lists.openembedded.org/g/openembedded-core/topic/scarthgap_patc=
h_v2/121067675

Regards,
Darsh Kelaiya

--4eAMtP6YHjmuXce9TZvk
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello Yoann,<br /><br />Thanks for the review.<br /><br />The v2 patch=
es now include the regenerated src/lxml/etree.c for both branches. The rege=
neration was performed outside BitBake, since the recipes build the pregene=
rated C source and do not depend on Cython.<br /><br />For Scarthgap, I use=
d Cython 3.0.9 with Python 3.12:<br /><br />&nbsp; &nbsp; &nbsp; python3.12=
 setup.py build_ext -i --with-cython --warnings -j1<br /><br />For Wrynose,=
 I used Cython 3.1.4, matching the version recorded in the shipped etree.c:=
<br /><br />&nbsp; &nbsp; &nbsp; python setup.py build_ext -i --with-cython=
<br /><br />I kept the iterparse.pxi changes line-count stable and removed =
unrelated generator metadata changes to avoid Cython source-location churn.=
 As a result, the etree.c diffs are limited to 40 changed lines for Scarthg=
ap and 60 changed lines for Wrynose.<br /><br />The Scarthgap v2 also inclu=
des the upstream ETCompatXMLParser documented-default change. Please find t=
he v2 patches for Wrynose [1] and Scarthgap [2]:<br /><br />[1] <a href=3D"=
https://lists.openembedded.org/g/openembedded-core/topic/wrynose_patch_v2/1=
21067576" target=3D"_blank" rel=3D"noopener">https://lists.openembedded.org=
/g/openembedded-core/topic/wrynose_patch_v2/121067576</a><br />[2] <a href=
=3D"https://lists.openembedded.org/g/openembedded-core/topic/scarthgap_patc=
h_v2/121067675" target=3D"_blank" rel=3D"noopener">https://lists.openembedd=
ed.org/g/openembedded-core/topic/scarthgap_patch_v2/121067675</a><br /><br =
/>Regards,<br />Darsh Kelaiya</div>

--4eAMtP6YHjmuXce9TZvk--

