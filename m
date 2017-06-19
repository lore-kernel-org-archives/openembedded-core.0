Return-Path: <Aaron_Wright@selinc.com>
Received: from volare.selinc.com (volare.selinc.com [74.117.214.143])
	by mail.openembedded.org (Postfix) with ESMTP id 5C73D7820F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 21:22:20 +0000 (UTC)
Received: from pps.filterd (volare.selinc.com [127.0.0.1])
	by volare.selinc.com (8.16.0.20/8.16.0.20) with SMTP id v5JLM1dY005072
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 14:22:22 -0700
Received: from edison.ad.selinc.com (edison.ad.selinc.com [10.100.0.15])
	by volare.selinc.com with ESMTP id 2b5001v1x0-1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 14:22:22 -0700
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
X-KeepSent: F99D52E7:784FCCB0-88258144:00749469;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP6 April 21, 2016
Message-ID: <OFF99D52E7.784FCCB0-ON88258144.00749469-88258144.0075679D@selinc.com>
From: Aaron_Wright@selinc.com
Date: Mon, 19 Jun 2017 14:22:22 -0700
X-MIMETrack: Serialize by Router on Edison/SEL(Release 9.0.1FP3 HF515|April 25,
	2015) at 06/19/2017 02:22:22 PM,
	Serialize complete at 06/19/2017 02:22:22 PM
X-Proofpoint-Virus-Version: vendor=nai engine=5800 definitions=8565
	signatures=668480
Subject: Yocto Extensible SDK (eSDK) and CMake
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
X-List-Received-Date: Mon, 19 Jun 2017 21:22:21 -0000
Content-Type: multipart/alternative;
	boundary="=_alternative 0075679D88258144_="

--=_alternative 0075679D88258144_=
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: Quoted-printable

I've been trying to figure out some workflows for my developers using the=20
eSDK, and I am running into a roadblock with CMake. I would love for my=20
developers to be able to run build tools that they're familiar with, such=20
as autotools, CMake, and make, but the required command line to CMake to=20
get it to work right is much too long.

A stackoverflow question (
https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__stackoverflow.com_qu=
estions_41964891_yocto-2Dsdk-2Dwith-2Dcmake-2Dtoolchain-2Dfile&d=3DDwIBAg&c=
=3DzVFQZQ67ypsA9mYKSCqWmQHiVkCCaN-Gb60_N6TVnLk&r=3Dak_pMnzuMKndrbvJGok-seoF=
enjTGhP3oPNUzKUOwzHhGpNMwSJsaHunyXDlBGjO&m=3DeSDGDMNHufVzPE8auZWFVn-tHcve22=
0-IgczS5MR6Oc&s=3Dtq3czscbBcY8BjXvD1J_53wlPnE6XjryI8yzzMPPd_Y&e=3D=20
) seems to address this for the SDK, but the solution presented doesn't=20
work for the eSDK.=20

I created a new question on stackoverflow (
https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__stackoverflow.com_qu=
estions_44598647_yocto-2Dextensible-2Dsdk-2Desdk-2Dand-2Dcmake&d=3DDwIBAg&c=
=3DzVFQZQ67ypsA9mYKSCqWmQHiVkCCaN-Gb60_N6TVnLk&r=3Dak_pMnzuMKndrbvJGok-seoF=
enjTGhP3oPNUzKUOwzHhGpNMwSJsaHunyXDlBGjO&m=3DeSDGDMNHufVzPE8auZWFVn-tHcve22=
0-IgczS5MR6Oc&s=3D_SisNaFvLXKa912DqmXImCDmGjJ1hM-jyzOf09zlcUU&e=3D=20
) to address this in the eSDK.

The meta/recipes-devtools/cmake/cmake_3.6.1.bb file references an=20
environment-setup.d/cmake.sh file as part of a nativesdk package, but that=
=20
doesn't seem to get installed when I install the eSDK.

Am I missing something simple?=

--=_alternative 0075679D88258144_=
Content-Type: text/html; charset="US-ASCII"
Content-Transfer-Encoding: Quoted-printable

<font size=3D2 face=3D"sans-serif">I've been trying to figure out some work=
flows
for my developers using the eSDK, and I am running into a roadblock with
CMake. I would love for my developers to be able to run build tools that
they're familiar with, such as autotools, CMake, and make, but the required
command line to CMake to get it to work right is much too long.</font>
<br>
<br><font size=3D2 face=3D"sans-serif">A stackoverflow question (</font><a =
href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__stackoverflo=
w.com_questions_41964891_yocto-2Dsdk-2Dwith-2Dcmake-2Dtoolchain-2Dfile&d=3D=
DwMBAg&c=3DzVFQZQ67ypsA9mYKSCqWmQHiVkCCaN-Gb60_N6TVnLk&r=3Dak_pMnzuMKndrbvJ=
Gok-seoFenjTGhP3oPNUzKUOwzHhGpNMwSJsaHunyXDlBGjO&m=3DeSDGDMNHufVzPE8auZWFVn=
-tHcve220-IgczS5MR6Oc&s=3Dtq3czscbBcY8BjXvD1J_53wlPnE6XjryI8yzzMPPd_Y&e=3D"=
><font size=3D2 color=3Dblue face=3D"sans-serif">https://stackoverflow.com/=
questions/41964891/yocto-sdk-with-cmake-toolchain-file</font>[stackoverflow=
.com]</a><font size=3D2 face=3D"sans-serif">)
seems to address this for the SDK, but the solution presented doesn't work
for the eSDK. </font>
<br>
<br><font size=3D2 face=3D"sans-serif">I created a new question on stackove=
rflow
(</font><a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__s=
tackoverflow.com_questions_44598647_yocto-2Dextensible-2Dsdk-2Desdk-2Dand-2=
Dcmake&d=3DDwMBAg&c=3DzVFQZQ67ypsA9mYKSCqWmQHiVkCCaN-Gb60_N6TVnLk&r=3Dak_pM=
nzuMKndrbvJGok-seoFenjTGhP3oPNUzKUOwzHhGpNMwSJsaHunyXDlBGjO&m=3DeSDGDMNHufV=
zPE8auZWFVn-tHcve220-IgczS5MR6Oc&s=3D_SisNaFvLXKa912DqmXImCDmGjJ1hM-jyzOf09=
zlcUU&e=3D"><font size=3D2 color=3Dblue face=3D"sans-serif">https://stackov=
erflow.com/questions/44598647/yocto-extensible-sdk-esdk-and-cmake</font>[st=
ackoverflow.com]</a><font size=3D2 face=3D"sans-serif">)
to address this in the eSDK.</font>
<br>
<br><font size=3D2 face=3D"sans-serif">The </font><font size=3D1 face=3D"Lu=
cida Console">meta/recipes-devtools/cmake/cmake_3.6.1.bb</font><font size=
=3D2 face=3D"sans-serif">
file references an &nbsp;environment-setup.d/cmake.sh file as part of a
nativesdk package, but that doesn't seem to get installed when I install
the eSDK.</font>
<br>
<br><font size=3D2 face=3D"sans-serif">Am I missing something simple?</font=
>=

--=_alternative 0075679D88258144_=--
