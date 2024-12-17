Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF96E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 12:49:28 +0000 (UTC)
Subject: Re: [PATCH 1/4] meta/lib/oe/sbom30.py: correct alias
To: openembedded-core@lists.openembedded.org
From: "hongxu" <hongxu.jia@eng.windriver.com>
X-Originating-Location: US (147.11.105.171)
X-Originating-Platform: Linux Firefox 133
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 17 Dec 2024 04:49:20 -0800
References: <D6DSYBCD4I4G.2O4ZDW15ZPJ1S@bootlin.com>
In-Reply-To: <D6DSYBCD4I4G.2O4ZDW15ZPJ1S@bootlin.com>
Message-ID: <13203.1734439760027052834@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="pkGuVEKQaR7HmnwrSmF4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 12:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208839

--pkGuVEKQaR7HmnwrSmF4
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

After apply all the 4 patches,
[PATCH 1/4] meta/lib/oe/sbom30.py: correct alias ( https://lists.openembedd=
ed.org/g/openembedded-core/message/208802?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3A=
Created%2C%2C%2C20%2C2%2C20%2C110158019%2Cd%253D3&d=3D3 )
[PATCH 2/4] meta/lib/oe/spdx30_tasks.py: fix hash link conflict while multi=
config enabled ( https://lists.openembedded.org/g/openembedded-core/message=
/208798?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2C%2C20%2C2%2C20%2C1101=
58020%2Cd%253D3&d=3D3 )
[PATCH V2 3/4] gcc-cross.inc: add var-SSTATE_ARCHS_TUNEPKG to vardeps of do=
_create_spdx ( https://lists.openembedded.org/g/openembedded-core/message/2=
08799?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2C%2C20%2C2%2C20%2C110158=
021%2Cd%253D3&d=3D3 )
[PATCH V3 4/4] meta/lib/oe/sbom30.py: fix alias in simplelicensing_customId=
ToUri not extracted ( https://lists.openembedded.org/g/openembedded-core/me=
ssage/208800?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2C%2C20%2C2%2C20%2=
C110158022%2Cd%253D3&d=3D3 )

$ bitbake core-image-sato core-image-sato-sdk core-image-minimal core-image=
-sato:do_populate_sdk core-image-minimal:do_populate_sdk_ext core-image-sat=
o:do_populate_sdk_ext

I could not re-produce the WARNING, f rom the=C2=A0 autobuilder log [1], I =
doubt the issue was caused by sstate cache between multiple builds with dif=
ferent poky sources

$ grep openssl stdio -n | grep spdx
2775:NOTE: Running setscene task 1619 of 7903 (virtual:nativesdk:/srv/pokyb=
uild/yocto-worker/qemuarm64-armhost/build/meta/recipes-connectivity/openssl=
/openssl_3.4.0.bb:do_create_packa
ge_spdx_setscene)
2805:NOTE: recipe nativesdk-openssl-3.4.0-r0: task do_create_package_spdx_s=
etscene: Started
2823:NOTE: recipe nativesdk-openssl-3.4.0-r0: task do_create_package_spdx_s=
etscene: Succeeded
6774:NOTE: Running setscene task 3110 of 7903 (/srv/pokybuild/yocto-worker/=
qemuarm64-armhost/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:=
do_create_package_spdx_setscene)
6799:NOTE: recipe openssl-3.4.0-r0: task do_create_package_spdx_setscene: S=
tarted
6823:NOTE: recipe openssl-3.4.0-r0: task do_create_package_spdx_setscene: S=
ucceeded
7879:NOTE: Running setscene task 3505 of 7903 (virtual:native:/srv/pokybuil=
d/yocto-worker/qemuarm64-armhost/build/meta/recipes-connectivity/openssl/op=
enssl_3.4.0.bb:do_create_package spdx_setscene)
7909:NOTE: recipe openssl-native-3.4.0-r0: task do_create_package_spdx_sets=
cene: Started
7929:NOTE: recipe openssl-native-3.4.0-r0: task do_create_package_spdx_sets=
cene: Succeeded
13460:NOTE: Running setscene task 5732 of 7903 (virtual:nativesdk:/srv/poky=
build/yocto-worker/qemuarm64-armhost/build/meta/recipes-connectivity/openss=
l/openssl_3.4.0.bb:do_create_spd _setscene)
13494:NOTE: recipe nativesdk-openssl-3.4.0-r0: task do_create_spdx_setscene=
: Started
13512:NOTE: recipe nativesdk-openssl-3.4.0-r0: task do_create_spdx_setscene=
: Succeeded
15764:NOTE: Running setscene task 7051 of 7903 (/srv/pokybuild/yocto-worker=
/qemuarm64-armhost/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb=
:do_create_spdx_setscene)
15788:NOTE: recipe openssl-3.4.0-r0: task do_create_spdx_setscene: Started
15814:NOTE: recipe openssl-3.4.0-r0: task do_create_spdx_setscene: Succeede=
d
16806:NOTE: Running setscene task 7666 of 7903 (virtual:native:/srv/pokybui=
ld/yocto-worker/qemuarm64-armhost/build/meta/recipes-connectivity/openssl/o=
penssl_3.4.0.bb:do_create_spdx_se
tscene)
16823:NOTE: recipe openssl-native-3.4.0-r0: task do_create_spdx_setscene: S=
tarted
16832:NOTE: recipe openssl-native-3.4.0-r0: task do_create_spdx_setscene: S=
ucceeded
19470: =C2=A0http://spdxdocs.org/openembedded-alias/by-doc-hash/82b2ddffbd6=
24bcb26b4c93f8e7bf31e456ea81a1e5720354726d1fc7e433dd0/openssl/UNIHASH/packa=
ge/openssl-bin
19471: =C2=A0http://spdxdocs.org/openembedded-alias/by-doc-hash/882a5d19051=
8b194aea7380573eeee8a79f524131463308e414d0cb51f9a8099/openssl/UNIHASH/packa=
ge/openssl
19482: =C2=A0http://spdxdocs.org/openembedded-alias/by-doc-hash/abb77695d73=
c96547fa2c4d5d658cd5c44a6ca7b4f0c07889cbf868d6c832bb1/openssl-native/UNIHAS=
H/build/recipe
19866: =C2=A0http://spdxdocs.org/openembedded-alias/by-doc-hash/abb77695d73=
c96547fa2c4d5d658cd5c44a6ca7b4f0c07889cbf868d6c832bb1/openssl-native/UNIHAS=
H/build/recipe
19965: =C2=A0http://spdxdocs.org/openembedded-alias/by-doc-hash/82b2ddffbd6=
24bcb26b4c93f8e7bf31e456ea81a1e5720354726d1fc7e433dd0/openssl/UNIHASH/packa=
ge/openssl-bin
19967: =C2=A0http://spdxdocs.org/openembedded-alias/by-doc-hash/882a5d19051=
8b194aea7380573eeee8a79f524131463308e414d0cb51f9a8099/openssl/UNIHASH/packa=
ge/openssl
19982: =C2=A0http://spdxdocs.org/openembedded-alias/by-doc-hash/abb77695d73=
c96547fa2c4d5d658cd5c44a6ca7b4f0c07889cbf868d6c832bb1/openssl-native/UNIHAS=
H/build/recipe
20069: =C2=A0http://spdxdocs.org/openembedded-alias/by-doc-hash/abb77695d73=
c96547fa2c4d5d658cd5c44a6ca7b4f0c07889cbf868d6c832bb1/openssl-native/UNIHAS=
H/build/recipe

[1] https://valkyrie.yoctoproject.org/api/v2/logs/928428/raw

//Hongxu

--pkGuVEKQaR7HmnwrSmF4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Mathieu,</div>
<div>&nbsp;</div>
<div>After apply all the 4 patches,</div>
<div><span class=3D"subject"><a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/208802?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%=
2C%2C20%2C2%2C20%2C110158019%2Cd%253D3&amp;d=3D3">[PATCH 1/4] meta/lib/oe/s=
bom30.py: correct alias </a></span></div>
<div><span class=3D"subject"><span class=3D"subject"><a href=3D"https://lis=
ts.openembedded.org/g/openembedded-core/message/208798?p=3D%2C%2C%2C20%2C0%=
2C0%2C0%3A%3ACreated%2C%2C%2C20%2C2%2C20%2C110158020%2Cd%253D3&amp;d=3D3">[=
PATCH 2/4] meta/lib/oe/spdx30_tasks.py: fix hash link conflict while multic=
onfig enabled </a></span></span></div>
<div><span class=3D"subject"><span class=3D"subject"><a href=3D"https://lis=
ts.openembedded.org/g/openembedded-core/message/208799?p=3D%2C%2C%2C20%2C0%=
2C0%2C0%3A%3ACreated%2C%2C%2C20%2C2%2C20%2C110158021%2Cd%253D3&amp;d=3D3"> =
[PATCH V2 3/4] gcc-cross.inc: add var-SSTATE_ARCHS_TUNEPKG to vardeps of do=
_create_spdx </a></span></span></div>
<div><span class=3D"subject"><a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/208800?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%=
2C%2C20%2C2%2C20%2C110158022%2Cd%253D3&amp;d=3D3">[PATCH V3 4/4] meta/lib/o=
e/sbom30.py: fix alias in simplelicensing_customIdToUri not extracted </a><=
/span></div>
<div>&nbsp;</div>
<div><span class=3D"subject">$ bitbake core-image-sato core-image-sato-sdk =
core-image-minimal core-image-sato:do_populate_sdk core-image-minimal:do_po=
pulate_sdk_ext core-image-sato:do_populate_sdk_ext</span></div>
<div>&nbsp;</div>
<div><span class=3D"subject">I could not re-produce the WARNING, </span>f<s=
pan class=3D"subject">rom the&nbsp; autobuilder log [1], I doubt the issue =
was caused by sstate cache between multiple builds with different poky sour=
ces</span></div>
<div>&nbsp;</div>
<div><span class=3D"subject">$ grep openssl stdio -n | grep spdx&nbsp;<br /=
>2775:NOTE: Running setscene task 1619 of 7903 (virtual:nativesdk:/srv/poky=
build/yocto-worker/qemuarm64-armhost/build/meta/recipes-connectivity/openss=
l/openssl_3.4.0.bb:do_create_packa<br />ge_spdx_setscene)<br />2805:NOTE: r=
ecipe nativesdk-openssl-3.4.0-r0: task do_create_package_spdx_setscene: Sta=
rted<br />2823:NOTE: recipe nativesdk-openssl-3.4.0-r0: task do_create_pack=
age_spdx_setscene: Succeeded<br />6774:NOTE: Running setscene task 3110 of =
7903 (/srv/pokybuild/yocto-worker/qemuarm64-armhost/build/meta/recipes-conn=
ectivity/openssl/openssl_3.4.0.bb:do_create_package_spdx_setscene)<br />679=
9:NOTE: recipe openssl-3.4.0-r0: task do_create_package_spdx_setscene: Star=
ted<br />6823:NOTE: recipe openssl-3.4.0-r0: task do_create_package_spdx_se=
tscene: Succeeded<br />7879:NOTE: Running setscene task 3505 of 7903 (virtu=
al:native:/srv/pokybuild/yocto-worker/qemuarm64-armhost/build/meta/recipes-=
connectivity/openssl/openssl_3.4.0.bb:do_create_package spdx_setscene)<br /=
>7909:NOTE: recipe openssl-native-3.4.0-r0: task do_create_package_spdx_set=
scene: Started<br />7929:NOTE: recipe openssl-native-3.4.0-r0: task do_crea=
te_package_spdx_setscene: Succeeded<br />13460:NOTE: Running setscene task =
5732 of 7903 (virtual:nativesdk:/srv/pokybuild/yocto-worker/qemuarm64-armho=
st/build/meta/recipes-connectivity/openssl/openssl_3.4.0.bb:do_create_spd _=
setscene)<br />13494:NOTE: recipe nativesdk-openssl-3.4.0-r0: task do_creat=
e_spdx_setscene: Started<br />13512:NOTE: recipe nativesdk-openssl-3.4.0-r0=
: task do_create_spdx_setscene: Succeeded<br />15764:NOTE: Running setscene=
 task 7051 of 7903 (/srv/pokybuild/yocto-worker/qemuarm64-armhost/build/met=
a/recipes-connectivity/openssl/openssl_3.4.0.bb:do_create_spdx_setscene)<br=
 />15788:NOTE: recipe openssl-3.4.0-r0: task do_create_spdx_setscene: Start=
ed<br />15814:NOTE: recipe openssl-3.4.0-r0: task do_create_spdx_setscene: =
Succeeded<br />16806:NOTE: Running setscene task 7666 of 7903 (virtual:nati=
ve:/srv/pokybuild/yocto-worker/qemuarm64-armhost/build/meta/recipes-connect=
ivity/openssl/openssl_3.4.0.bb:do_create_spdx_se<br />tscene)<br />16823:NO=
TE: recipe openssl-native-3.4.0-r0: task do_create_spdx_setscene: Started<b=
r />16832:NOTE: recipe openssl-native-3.4.0-r0: task do_create_spdx_setscen=
e: Succeeded<br />19470: &nbsp;http://spdxdocs.org/openembedded-alias/by-do=
c-hash/82b2ddffbd624bcb26b4c93f8e7bf31e456ea81a1e5720354726d1fc7e433dd0/ope=
nssl/UNIHASH/package/openssl-bin<br />19471: &nbsp;http://spdxdocs.org/open=
embedded-alias/by-doc-hash/882a5d190518b194aea7380573eeee8a79f524131463308e=
414d0cb51f9a8099/openssl/UNIHASH/package/openssl<br />19482: &nbsp;http://s=
pdxdocs.org/openembedded-alias/by-doc-hash/abb77695d73c96547fa2c4d5d658cd5c=
44a6ca7b4f0c07889cbf868d6c832bb1/openssl-native/UNIHASH/build/recipe<br />1=
9866: &nbsp;http://spdxdocs.org/openembedded-alias/by-doc-hash/abb77695d73c=
96547fa2c4d5d658cd5c44a6ca7b4f0c07889cbf868d6c832bb1/openssl-native/UNIHASH=
/build/recipe<br />19965: &nbsp;http://spdxdocs.org/openembedded-alias/by-d=
oc-hash/82b2ddffbd624bcb26b4c93f8e7bf31e456ea81a1e5720354726d1fc7e433dd0/op=
enssl/UNIHASH/package/openssl-bin<br />19967: &nbsp;http://spdxdocs.org/ope=
nembedded-alias/by-doc-hash/882a5d190518b194aea7380573eeee8a79f524131463308=
e414d0cb51f9a8099/openssl/UNIHASH/package/openssl<br />19982: &nbsp;http://=
spdxdocs.org/openembedded-alias/by-doc-hash/abb77695d73c96547fa2c4d5d658cd5=
c44a6ca7b4f0c07889cbf868d6c832bb1/openssl-native/UNIHASH/build/recipe<br />=
20069: &nbsp;http://spdxdocs.org/openembedded-alias/by-doc-hash/abb77695d73=
c96547fa2c4d5d658cd5c44a6ca7b4f0c07889cbf868d6c832bb1/openssl-native/UNIHAS=
H/build/recipe</span></div>
<div>&nbsp;</div>
<div><span class=3D"subject">[1] <a href=3D"https://valkyrie.yoctoproject.o=
rg/api/v2/logs/928428/raw" target=3D"_blank" rel=3D"noopener">https://valky=
rie.yoctoproject.org/api/v2/logs/928428/raw</a></span></div>
<div>&nbsp;</div>
<div><span class=3D"subject">//Hongxu</span></div>
<div>&nbsp;</div>

--pkGuVEKQaR7HmnwrSmF4--

