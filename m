Return-Path: <hui.qing.chong@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 29FE06FA7E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 09:44:32 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 May 2014 02:44:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,940,1392192000"; d="scan'208";a="438939925"
Received: from pgsmsx103.gar.corp.intel.com ([10.221.44.82])
	by azsmga001.ch.intel.com with ESMTP; 30 May 2014 02:44:33 -0700
Received: from pgsmsx104.gar.corp.intel.com ([169.254.3.123]) by
	PGSMSX103.gar.corp.intel.com ([169.254.2.137]) with mapi id
	14.03.0123.003; Fri, 30 May 2014 17:44:32 +0800
From: "Chong, Hui Qing" <hui.qing.chong@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [Repo Issue] x264: Unable to find revision
Thread-Index: Ac9768FBpew9lhsRQAKr3WglFQX35g==
Date: Fri, 30 May 2014 09:44:31 +0000
Message-ID: <4D2B74E594FF4C4A97424079247E473A17DC8288@PGSMSX104.gar.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Subject: [Repo Issue] x264: Unable to find revision
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
X-List-Received-Date: Fri, 30 May 2014 09:44:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, I am working on Yocto Project 1.6, Daisy branch. Previously I am able t=
o build the image successfully, but now I have errors as follow:

ERROR: Fetcher failure: Unable to find revision 585324fee380109acd9986388f8=
57f413a60b896 in branch master even from upstream
ERROR: Function failed: Fetcher failure for URL: 'git://git.videolan.org/x2=
64.git'. Unable to fetch URL from any source.

In the x264_git.bb file, the SRC_URI and SRCREV are:

SRC_URI =3D "git://git.videolan.org/x264.git \
	        file://don-t-default-to-cortex-a9-with-neon.patch \
	        "
SRCREV =3D "585324fee380109acd9986388f857f413a60b896"

Does anyone notice this and is there any solution for this error? Thank you=
.

Regards,
Hui Qing

