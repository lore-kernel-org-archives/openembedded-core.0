Return-Path: <chris.sutton@l3harris.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A92C0015E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 15:14:03 +0000 (UTC)
Subject: nativesdk recipe not added to esdk
To: openembedded-core@lists.openembedded.org
From: "Sutton, Chris (FP) - IC" <chris.sutton@l3harris.com>
X-Originating-Location: London, England, GB (35.230.157.57)
X-Originating-Platform: Windows Chrome 115
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 15 Aug 2023 08:13:53 -0700
Message-ID: <Ih5n.1692112433172929300.jiff@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="nNpoDxvyzzDXtFB3J5jm"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 15:14:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186071

--nNpoDxvyzzDXtFB3J5jm
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I have a recipe - test-py.bb - that contains:

BBCLASSEXTEND =3D "native nativesdk".
FILES:${PN} +=3D " one.py two.py"
do_install() {
install -D ${WORKDIR}/git/Core/scripts/one.py "${D}$bindir}/one.py"
install -D ${WORKDIR}/git/Core/scripts/two.py "${D}$bindir}/two.py"
}

I want to have those python files made available in the $PATH of the esdk. =
So in the local.conf I have:

TOOLCHAIN_HOST_TASK_ESDK +=3D " nativesdk-test-py "

I build the full version of the esdk.
I install the eSDK and run "devtool sdk-install test-py"
I do a search but I cannot find one.py/two.py anywhere in the esdk install.
I notice that Yocto is not generating a nativesdk-test-py recipe under work=
/tmp/x86_64-nativesdk-pokysdk-linux. I though this was the purpose of addin=
g nativesdk with BBCLASSEXTEND?
I notice that populate_sdk_ext.bbclass hardcodes the TOOLCHAIN_HOST_TASK_ES=
DK variable to meta-environment-extsdk-${MACHINE}. Surely this is overwriti=
ng any values I use the local.conf.
I don't fully understand the meta-environment-extsdk.bb mechanism but I get=
 the impression this is the key to adding something to the esdk?
Also is there a way to confirm which packages have been added to the esdk? =
It seems to be obfuscated behind the meta-environment-extsdk recipe.

--nNpoDxvyzzDXtFB3J5jm
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,<br /><br />I have a recipe - test-py.bb - that contains:<br /><br />BBC=
LASSEXTEND =3D "native nativesdk".<br />FILES:${PN} +=3D " one.py two.py"<b=
r />do_install() {<br />&nbsp; &nbsp; install -D ${WORKDIR}/git/Core/script=
s/one.py "${D}$bindir}/one.py"<br />&nbsp; &nbsp; install -D ${WORKDIR}/git=
/Core/scripts/two.py "${D}$bindir}/two.py"<br />}<br /><br />I want to have=
 those python files made available in the $PATH of the esdk. So in the loca=
l.conf I have:<br /><br />TOOLCHAIN_HOST_TASK_ESDK +=3D " nativesdk-test-py=
 "<br /><br />I build the full version of the esdk.<br />I install the eSDK=
 and run "devtool sdk-install test-py"<br />I do a search but I cannot find=
 one.py/two.py anywhere in the esdk install.<br />I notice that Yocto is no=
t generating a nativesdk-test-py recipe under work/tmp/x86_64-nativesdk-pok=
ysdk-linux. I though this was the purpose of adding nativesdk with BBCLASSE=
XTEND?<br />I notice that populate_sdk_ext.bbclass hardcodes the TOOLCHAIN_=
HOST_TASK_ESDK variable to meta-environment-extsdk-${MACHINE}. Surely this =
is overwriting any values I use the local.conf.<br />I don't fully understa=
nd the meta-environment-extsdk.bb mechanism but I get the impression this i=
s the key to adding something to the esdk?<br />Also is there a way to conf=
irm which packages have been added to the esdk? It seems to be obfuscated b=
ehind the meta-environment-extsdk recipe.

--nNpoDxvyzzDXtFB3J5jm--

