Return-Path: <Jose.DiazdeGrenu@digi.com>
X-Greylist: delayed 755 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 09 Feb 2018 14:46:01 UTC
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.8])
	by mail.openembedded.org (Postfix) with ESMTP id E7D3D784D5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Feb 2018 14:46:01 +0000 (UTC)
Received: from [216.82.251.39] (using TLSv1.2 with cipher
	DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-8.bemta-12.messagelabs.com id C4/24-04153-831BD7A5;
	Fri, 09 Feb 2018 14:33:28 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJIsWRWlGSWpSXmKPExsXi5LtOQNd8Y22
	UwfYnRhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bzoWksBc18FavftTM2MH7g7mLk4hASWMUo
	8W7tTBYIZzWjxNsbV5ghnMWMEh/X/WHvYuTkYBMwl5h2+CALiC0iECVxc9czoDgHh7CAo8S2g
	1wQYTeJz30LmSBsPYm1jxczg9gsAioSbdOXgdm8Ar4SX1/NBathFJCVWHn+NCOIzSwgLnHryX
	ywuISAgMSSPeeZIWxRiZeP/7FC2PISr84dYYKo15FYsPsTG4StLbFs4Wuo+YISJ2c+ATtTSEB
	Nom3OBOYJjMKzkKyYhaR9FpL2WUjaFzCyrGLUKE4tKkst0jWy0EsqykzPKMlNzMzRNTQ00stN
	LS5OTE/NSUwq1kvOz93ECIyAegYGxh2MG6d7HWKU5GBSEuVdP6s2SogvKT+lMiOxOCO+qDQnt
	fgQowwHh5IE74P1QDnBotT01Iq0zBxgLMKkJTh4lER4Z20ASvMWFyTmFmemQ6ROMRpz3Hjxuo
	2ZY9qyN23MQix5+XmpUuK8tiClAiClGaV5cINgKeISo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5
	GJWHe9yD38GTmlcDtewV0ChPQKXcdwE4pSURISTUw1jt0JO1Uvf1K5dA8foNH7BxMye8/Vfy0
	bPZ61b7luvLrJOvpotqHzr8+xOk1w3Bf68PcnBmtp6J/na3NrG76WXrvlprDVcVsSbFHN+5ki
	MrNuXtVba+S7dHNuRd+lK9X3PTRNM3aedpBv2rphLsx7hMjtljZ3bO27qsvOmGpdfrP8mvOvR
	qdSizFGYmGWsxFxYkABKXEAwwDAAA=
X-Env-Sender: Jose.DiazdeGrenu@digi.com
X-Msg-Ref: server-2.tower-164.messagelabs.com!1518186807!52574031!1
X-Originating-IP: [66.77.174.16]
X-StarScan-Received: 
X-StarScan-Version: 9.4.45; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 55424 invoked from network); 9 Feb 2018 14:33:27 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-2.tower-164.messagelabs.com with DHE-RSA-AES256-GCM-SHA384
	encrypted SMTP; 9 Feb 2018 14:33:27 -0000
Received: from MTK-SMS-XCH02.digi.com (10.10.8.196) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Fri, 9 Feb 2018 08:33:26 -0600
Received: from DOR-VMS-XCH01.digi.com (10.49.8.98) by MTK-SMS-XCH02.digi.com
	(10.10.8.196) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Fri, 9 Feb 2018 08:33:26 -0600
Received: from DOR-SMS-XCH01.digi.com ([fe80::894b:3bdc:74ae:6efc]) by
	DOR-VMS-XCH01.digi.com ([::1]) with mapi id 14.03.0361.001;
	Fri, 9 Feb 2018 15:33:24 +0100
From: "Diaz de Grenu, Jose" <Jose.DiazdeGrenu@digi.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Cherry-pick postinstallation script refactoring to rocko
Thread-Index: AdOhsWImEpmcvmkSQc2DFvNXID12rQ==
Date: Fri, 9 Feb 2018 14:33:23 +0000
Message-ID: <0B2EBCD48D33654381E736352034C70C01C7BF64@dor-sms-xch01.digi.com>
Accept-Language: es-ES, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.101.2.93]
MIME-Version: 1.0
Subject: Cherry-pick postinstallation script refactoring to rocko
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
X-List-Received-Date: Fri, 09 Feb 2018 14:46:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Recently, the mechanism for defining post installation scripts that have to=
 run on the first boot (on the target) was refactored in the following comm=
its:

ff4835470bc4 rootfs.py: change the notice about deferring scripts to first =
boot from warning to a note
a2b7260f791e package_rpm.bbclass: run pre/post installation scriptlets usin=
g sh -e
7bc55b296097 meta/lib/oe/package_manager.py: deprecate 'exit 1' as a way to=
 defer to first boot
6ca669105ff7 package.bbclass: add support for pkg_postinst_ontarget()
32c500b8ea2c meta/lib/oe/rootfs.py: do not execute defer_to_first_boot when=
 processing postinst_intercept hooks
4c808e31ea35 meta/lib/oe/rootfs.py: separate first boot deferral logic into=
 a separate function

This makes it easier and clearer to define post installation scripts that h=
ave to run on the target, and it also clears the warnings that you currentl=
y get in rocko when trying to define post installation scripts that have to=
 run on the target:

> [log_check] warning: %post(u-boot-fw-utils-1:2017.09-r0.0.ccimx6sbc) scri=
ptlet failed, exit status 1

I think these warnings are quite confusing, as they seem to indicate that s=
ome scriptlet failed, when that is not the case at all. The exit status 1 i=
s the result of the idiom (or hacky method) that you have to use in order t=
o define post installation scripts that run on the target, as documented in=
 rocko [1].

Note that this patchset would not break anything, it would just change conf=
using warnings (like shown above) to a specific warning telling users about=
 using this new method.

Would it be possible to cherry-pick this patchset to rocko, in order to fix=
 this?

Thanks.

[1] http://www.yoctoproject.org/docs/2.4/mega-manual/mega-manual.html#new-r=
ecipe-post-installation-scripts=20

