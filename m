Return-Path: <julio.cruz@smartmatic.com>
X-Greylist: delayed 352 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 21 Mar 2016 23:59:09 UTC
Received: from dispatch1-us1.ppe-hosted.com (dispatch1-us1.ppe-hosted.com
	[148.163.129.52])
	by mail.openembedded.org (Postfix) with ESMTP id 15FE86E688
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 23:59:09 +0000 (UTC)
Received: from mx1-us1.ppe-hosted.com (unknown [10.7.64.20])
	by dispatch1-us1.ppe-hosted.com (Proofpoint Essentials ESMTP Server)
	with ESMTP id 959132005D; Mon, 21 Mar 2016 23:53:18 +0000 (UTC)
X-Virus-Scanned: Proofpoint Essentials engine
Received: from hyperion.ve.sbp.com (unknown [186.73.192.71])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (Proofpoint Essentials ESMTP Server) with
	ESMTPS id 796E9119; Mon, 21 Mar 2016 23:53:16 +0000 (UTC)
Received: from tethys.ve.sbp.com ([10.4.100.167]) by hyperion.ve.sbp.com
	([10.4.100.165]) with mapi id 14.03.0123.003;
	Mon, 21 Mar 2016 18:53:14 -0500
From: Julio Cruz Barroso <julio.cruz@smartmatic.com>
To: "Ryan Elkholy, PhD, PE" <ryanelkholy@gmail.com>
Thread-Topic: [OE-core] [meta-qt5] QtCreator now allowing me to select qmake
	in	SDK
Thread-Index: AQHRg6pqYsKGEDUjJEyPZIjX5rAkjJ9kklXR
Date: Mon, 21 Mar 2016 23:53:15 +0000
Message-ID: <45BCEEFE-5C63-462E-95C9-BFE3D4E9ACAE@smartmatic.com>
References: <CAMZfsd4G5iyKkEjaaR+T9_xTiSw=BKdB+rParnk7fwnq6uUvYQ@mail.gmail.com>
In-Reply-To: <CAMZfsd4G5iyKkEjaaR+T9_xTiSw=BKdB+rParnk7fwnq6uUvYQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
X-MDID: MabKRdMz0kqP
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-qt5] QtCreator now allowing me to select qmake in	SDK
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
X-List-Received-Date: Mon, 21 Mar 2016 23:59:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Ryan,

Try to inherit populate_sdk_qt5 in your image  or use meta-toolchain-qt5 to=
 create the SDK. In this way you will have the qmake in your SDK installer.

Regards

Julio

On Mar 22, 2016, at 3:46 AM, Ryan Elkholy, PhD, PE <ryanelkholy@gmail.com> =
wrote:

Hello,

I have used bitbake core-image-minimal -c populate_sdk to build an SDK for =
the Minnowboard to be used by QtCreator. After doing so, the SDK was built =
in /opt/poky/2.0.1/sysroots...

1. Within /sysroots I have corei7-64-poky-linux and x86_64-pokysdk-linux di=
rectories. My first question is which directory do I use when pointing to m=
y compiler, debugger and QtVersion (qmake) for QtCreator?

2. Secondly, when I try pointing to the qmake in /opt/poky/2.0.1/sysroots/c=
orei7-64-poky-linux/usr/bin/qt, QtCreator says that the file does not exist=
. I have tried everything to add it but it just wont work. I then thought I=
 had to point to the one in x86_64-pokysdk-linux, however there is no qmake=
 there. Any ideas on what the problem may be?

Thanks!
--=20
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

