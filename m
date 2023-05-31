Return-Path: <belouargamohamed@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBE7C7EE23
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 18:54:58 +0000 (UTC)
Subject: Re: [master][PATCH 1/6] recipetool: create: npm: Remove duplicate function to not have future conflicts
To: openembedded-core@lists.openembedded.org
From: belouargamohamed@gmail.com
X-Originating-Location: Cahors, Occitanie, FR (79.80.30.96)
X-Originating-Platform: Linux Firefox 113
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 31 May 2023 11:54:56 -0700
References: <CANNYZj-1DyNYzct3DQmihoudLhAnLF5j=r0pyfJ-GN0zuBXuqg@mail.gmail.com>
In-Reply-To: <CANNYZj-1DyNYzct3DQmihoudLhAnLF5j=r0pyfJ-GN0zuBXuqg@mail.gmail.com>
Message-ID: <18872.1685559296647066649@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="pSonpRSA4NyKXuD0yE3F"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 18:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182033

--pSonpRSA4NyKXuD0yE3F
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hey Alexander,
Thanks for your answer.

In order that my changes work, Some patches on bitbake should be accepted:
https://lists.openembedded.org/g/bitbake-devel/message/14815?p=3D%2C%2C%2C2=
0%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Cbelouarga%2C20%2C2%2C0%2C99=
163598
https://lists.openembedded.org/g/bitbake-devel/message/14819?p=3D%2C%2C%2C2=
0%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Cbelouarga%2C20%2C2%2C0%2C99=
230772
https://lists.openembedded.org/g/bitbake-devel/message/14820?p=3D%2C%2C%2C2=
0%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Cbelouarga%2C20%2C2%2C0%2C99=
248868

and one patch that I just made on open embedded-core:
https://lists.openembedded.org/g/openembedded-core/message/182022?p=3D%2C%2=
C%2C20%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Cbelouarga%2C20%2C2%2C0=
%2C99248914

I ran the tests that you asked me to do, you can find the results below.

elf@container:~/workspace$ oe-selftest -r recipetool.RecipetoolCreateTests.=
test_recipetool_create_npm
2023-05-31 17:31:33,552 - oe-selftest - INFO - Changing cwd to /home/elf/wo=
rkspace/build
2023-05-31 17:31:33,552 - oe-selftest - WARNING - meta-selftest layer not f=
ound in BBLAYERS, adding it
2023-05-31 17:31:39,880 - oe-selftest - INFO - Adding layer libraries:
2023-05-31 17:31:39,880 - oe-selftest - INFO -=C2=A0 /home/elf/workspace/la=
yers/poky/meta/lib
2023-05-31 17:31:39,880 - oe-selftest - INFO -=C2=A0 /home/elf/workspace/la=
yers/poky/meta-yocto-bsp/lib
2023-05-31 17:31:39,880 - oe-selftest - INFO -=C2=A0 /home/elf/workspace/la=
yers/meta-openembedded/meta-oe/lib
2023-05-31 17:31:39,880 - oe-selftest - INFO -=C2=A0 /home/elf/workspace/la=
yers/poky/meta-selftest/lib
2023-05-31 17:31:39,882 - oe-selftest - INFO - Running bitbake -e to test t=
he configuration is valid/parsable
NOTE: Starting bitbake server...
2023-05-31 17:31:49,176 - oe-selftest - INFO - Adding: "include selftest.in=
c" in /home/elf/workspace/build-st/conf/local.conf
2023-05-31 17:31:49,178 - oe-selftest - INFO - Adding: "include bblayers.in=
c" in bblayers.conf
2023-05-31 17:31:49,179 - oe-selftest - INFO - test_recipetool_create_npm (=
recipetool.RecipetoolCreateTests)
2023-05-31 17:33:36,312 - oe-selftest - INFO -=C2=A0 ... ok
2023-05-31 17:33:38,097 - oe-selftest - INFO - ----------------------------=
------------------------------------------
2023-05-31 17:33:38,097 - oe-selftest - INFO - Ran 1 test in 115.852s
2023-05-31 17:33:38,097 - oe-selftest - INFO - OK
2023-05-31 17:33:48,971 - oe-selftest - INFO - RESULTS:
2023-05-31 17:33:48,971 - oe-selftest - INFO - RESULTS - recipetool.Recipet=
oolCreateTests.test_recipetool_create_npm: PASSED (107.13s)
2023-05-31 17:33:49,063 - oe-selftest - INFO - SUMMARY:
2023-05-31 17:33:49,063 - oe-selftest - INFO - oe-selftest () - Ran 1 test =
in 115.853s
2023-05-31 17:33:49,064 - oe-selftest - INFO - oe-selftest - OK - All requi=
red tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=3D0)
elf@container:~/workspace$ oe-selftest -r devtool.DevtoolAddTests.test_devt=
ool_add_npm
2023-05-31 17:34:03,550 - oe-selftest - INFO - Changing cwd to /home/elf/wo=
rkspace/build
2023-05-31 17:34:03,550 - oe-selftest - INFO - Adding layer libraries:
2023-05-31 17:34:03,550 - oe-selftest - INFO -=C2=A0 /home/elf/workspace/la=
yers/poky/meta/lib
2023-05-31 17:34:03,551 - oe-selftest - INFO -=C2=A0 /home/elf/workspace/la=
yers/poky/meta-yocto-bsp/lib
2023-05-31 17:34:03,551 - oe-selftest - INFO -=C2=A0 /home/elf/workspace/la=
yers/meta-openembedded/meta-oe/lib
2023-05-31 17:34:03,551 - oe-selftest - INFO -=C2=A0 /home/elf/workspace/la=
yers/poky/meta-selftest/lib
2023-05-31 17:34:03,552 - oe-selftest - INFO - Running bitbake -e to test t=
he configuration is valid/parsable
NOTE: Starting bitbake server...
2023-05-31 17:34:12,581 - oe-selftest - INFO - Adding: "include selftest.in=
c" in /home/elf/workspace/build-st/conf/local.conf
2023-05-31 17:34:12,582 - oe-selftest - INFO - Adding: "include bblayers.in=
c" in bblayers.conf
2023-05-31 17:34:15,320 - oe-selftest - INFO - test_devtool_add_npm (devtoo=
l.DevtoolAddTests)
2023-05-31 17:38:02,622 - oe-selftest - INFO -=C2=A0 ... ok
2023-05-31 17:38:04,371 - oe-selftest - INFO - ----------------------------=
------------------------------------------
2023-05-31 17:38:04,371 - oe-selftest - INFO - Ran 1 test in 238.516s
2023-05-31 17:38:04,371 - oe-selftest - INFO - OK
2023-05-31 17:38:21,118 - oe-selftest - INFO - RESULTS:
2023-05-31 17:38:21,118 - oe-selftest - INFO - RESULTS - devtool.DevtoolAdd=
Tests.test_devtool_add_npm: PASSED (227.30s)
2023-05-31 17:38:21,200 - oe-selftest - INFO - SUMMARY:
2023-05-31 17:38:21,200 - oe-selftest - INFO - oe-selftest () - Ran 1 test =
in 238.517s
2023-05-31 17:38:21,201 - oe-selftest - INFO - oe-selftest - OK - All requi=
red tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=3D0)

--pSonpRSA4NyKXuD0yE3F
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hey Alexander,<br />Thanks for your answer.<br /><br />In order that my cha=
nges work, Some patches on bitbake should be accepted:<br /><a href=3D"http=
s://lists.openembedded.org/g/bitbake-devel/message/14815?p=3D%2C%2C%2C20%2C=
0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Cbelouarga%2C20%2C2%2C0%2C991635=
98" target=3D"_blank" rel=3D"noopener">https://lists.openembedded.org/g/bit=
bake-devel/message/14815?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Arecentpostdate%2F=
sticky%2C%2Cbelouarga%2C20%2C2%2C0%2C99163598</a><br /><a href=3D"https://l=
ists.openembedded.org/g/bitbake-devel/message/14819?p=3D%2C%2C%2C20%2C0%2C0=
%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Cbelouarga%2C20%2C2%2C0%2C99230772" t=
arget=3D"_blank" rel=3D"noopener">https://lists.openembedded.org/g/bitbake-=
devel/message/14819?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Arecentpostdate%2Fstick=
y%2C%2Cbelouarga%2C20%2C2%2C0%2C99230772</a><br /><a href=3D"https://lists.=
openembedded.org/g/bitbake-devel/message/14820?p=3D%2C%2C%2C20%2C0%2C0%2C0%=
3A%3Arecentpostdate%2Fsticky%2C%2Cbelouarga%2C20%2C2%2C0%2C99248868" target=
=3D"_blank" rel=3D"noopener">https://lists.openembedded.org/g/bitbake-devel=
/message/14820?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%=
2Cbelouarga%2C20%2C2%2C0%2C99248868</a><br /><br />and one patch that I jus=
t made on open embedded-core: <br /><a href=3D"https://lists.openembedded.o=
rg/g/openembedded-core/message/182022?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Arece=
ntpostdate%2Fsticky%2C%2Cbelouarga%2C20%2C2%2C0%2C99248914" target=3D"_blan=
k" rel=3D"noopener">https://lists.openembedded.org/g/openembedded-core/mess=
age/182022?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Cbe=
louarga%2C20%2C2%2C0%2C99248914</a><br /><br />I ran the tests that you ask=
ed me to do, you can find the results below.<br /><br />elf@container:~/wor=
kspace$ oe-selftest -r recipetool.RecipetoolCreateTests.test_recipetool_cre=
ate_npm<br />2023-05-31 17:31:33,552 - oe-selftest - INFO - Changing cwd to=
 /home/elf/workspace/build<br />2023-05-31 17:31:33,552 - oe-selftest - WAR=
NING - meta-selftest layer not found in BBLAYERS, adding it<br />2023-05-31=
 17:31:39,880 - oe-selftest - INFO - Adding layer libraries:<br />2023-05-3=
1 17:31:39,880 - oe-selftest - INFO -&nbsp; /home/elf/workspace/layers/poky=
/meta/lib<br />2023-05-31 17:31:39,880 - oe-selftest - INFO -&nbsp; /home/e=
lf/workspace/layers/poky/meta-yocto-bsp/lib<br />2023-05-31 17:31:39,880 - =
oe-selftest - INFO -&nbsp; /home/elf/workspace/layers/meta-openembedded/met=
a-oe/lib<br />2023-05-31 17:31:39,880 - oe-selftest - INFO -&nbsp; /home/el=
f/workspace/layers/poky/meta-selftest/lib<br />2023-05-31 17:31:39,882 - oe=
-selftest - INFO - Running bitbake -e to test the configuration is valid/pa=
rsable<br />NOTE: Starting bitbake server...<br />2023-05-31 17:31:49,176 -=
 oe-selftest - INFO - Adding: "include selftest.inc" in /home/elf/workspace=
/build-st/conf/local.conf<br />2023-05-31 17:31:49,178 - oe-selftest - INFO=
 - Adding: "include bblayers.inc" in bblayers.conf<br />2023-05-31 17:31:49=
,179 - oe-selftest - INFO - test_recipetool_create_npm (recipetool.Recipeto=
olCreateTests)<br />2023-05-31 17:33:36,312 - oe-selftest - INFO -&nbsp; ..=
. ok<br />2023-05-31 17:33:38,097 - oe-selftest - INFO - ------------------=
----------------------------------------------------<br />2023-05-31 17:33:=
38,097 - oe-selftest - INFO - Ran 1 test in 115.852s<br />2023-05-31 17:33:=
38,097 - oe-selftest - INFO - OK<br />2023-05-31 17:33:48,971 - oe-selftest=
 - INFO - RESULTS:<br />2023-05-31 17:33:48,971 - oe-selftest - INFO - RESU=
LTS - recipetool.RecipetoolCreateTests.test_recipetool_create_npm: PASSED (=
107.13s)<br />2023-05-31 17:33:49,063 - oe-selftest - INFO - SUMMARY:<br />=
2023-05-31 17:33:49,063 - oe-selftest - INFO - oe-selftest () - Ran 1 test =
in 115.853s<br />2023-05-31 17:33:49,064 - oe-selftest - INFO - oe-selftest=
 - OK - All required tests passed (successes=3D1, skipped=3D0, failures=3D0=
, errors=3D0)<br />elf@container:~/workspace$ oe-selftest -r devtool.Devtoo=
lAddTests.test_devtool_add_npm<br />2023-05-31 17:34:03,550 - oe-selftest -=
 INFO - Changing cwd to /home/elf/workspace/build<br />2023-05-31 17:34:03,=
550 - oe-selftest - INFO - Adding layer libraries:<br />2023-05-31 17:34:03=
,550 - oe-selftest - INFO -&nbsp; /home/elf/workspace/layers/poky/meta/lib<=
br />2023-05-31 17:34:03,551 - oe-selftest - INFO -&nbsp; /home/elf/workspa=
ce/layers/poky/meta-yocto-bsp/lib<br />2023-05-31 17:34:03,551 - oe-selftes=
t - INFO -&nbsp; /home/elf/workspace/layers/meta-openembedded/meta-oe/lib<b=
r />2023-05-31 17:34:03,551 - oe-selftest - INFO -&nbsp; /home/elf/workspac=
e/layers/poky/meta-selftest/lib<br />2023-05-31 17:34:03,552 - oe-selftest =
- INFO - Running bitbake -e to test the configuration is valid/parsable<br =
/>NOTE: Starting bitbake server...<br />2023-05-31 17:34:12,581 - oe-selfte=
st - INFO - Adding: "include selftest.inc" in /home/elf/workspace/build-st/=
conf/local.conf<br />2023-05-31 17:34:12,582 - oe-selftest - INFO - Adding:=
 "include bblayers.inc" in bblayers.conf<br />2023-05-31 17:34:15,320 - oe-=
selftest - INFO - test_devtool_add_npm (devtool.DevtoolAddTests)<br />2023-=
05-31 17:38:02,622 - oe-selftest - INFO -&nbsp; ... ok<br />2023-05-31 17:3=
8:04,371 - oe-selftest - INFO - -------------------------------------------=
---------------------------<br />2023-05-31 17:38:04,371 - oe-selftest - IN=
FO - Ran 1 test in 238.516s<br />2023-05-31 17:38:04,371 - oe-selftest - IN=
FO - OK<br />2023-05-31 17:38:21,118 - oe-selftest - INFO - RESULTS:<br />2=
023-05-31 17:38:21,118 - oe-selftest - INFO - RESULTS - devtool.DevtoolAddT=
ests.test_devtool_add_npm: PASSED (227.30s)<br />2023-05-31 17:38:21,200 - =
oe-selftest - INFO - SUMMARY:<br />2023-05-31 17:38:21,200 - oe-selftest - =
INFO - oe-selftest () - Ran 1 test in 238.517s<br />2023-05-31 17:38:21,201=
 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (succe=
sses=3D1, skipped=3D0, failures=3D0, errors=3D0)

--pSonpRSA4NyKXuD0yE3F--

