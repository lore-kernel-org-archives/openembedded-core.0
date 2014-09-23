Return-Path: <boon.leong.ong@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 978566FDEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 01:28:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 22 Sep 2014 18:19:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,576,1406617200"; d="scan'208";a="595310801"
Received: from pgsmsx101.gar.corp.intel.com ([10.221.44.78])
	by fmsmga001.fm.intel.com with ESMTP; 22 Sep 2014 18:28:40 -0700
Received: from pgsmsx106.gar.corp.intel.com (10.221.44.98) by
	PGSMSX101.gar.corp.intel.com (10.221.44.78) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Tue, 23 Sep 2014 09:28:00 +0800
Received: from pgsmsx105.gar.corp.intel.com ([169.254.4.169]) by
	pgsmsx106.gar.corp.intel.com ([169.254.9.245]) with mapi id
	14.03.0195.001; Tue, 23 Sep 2014 09:27:59 +0800
From: "Ong, Boon Leong" <boon.leong.ong@intel.com>
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Python Large File System Support
Thread-Index: Ac/WzRcu6+IDUCz7St6JngBd02/9OA==
Date: Tue, 23 Sep 2014 01:27:58 +0000
Message-ID: <AF233D1473C1364ABD51D28909A1B1B732581ED4@pgsmsx105.gar.corp.intel.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Subject: Python Large File System Support
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
X-List-Received-Date: Tue, 23 Sep 2014 01:28:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dear all,=20

Based on https://docs.python.org/2/library/posix.html, in order to support =
LFS in python,=20
there is a special CFLAGS "-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64" =
needed.

I did a search around meta/recipes-devtool/python found many recipes files.=
 =20
So, I am reaching out to expert in this forum to guide on which is the righ=
t file
to be touched to enabled LFS?=20

I notice perl seems to have this supported in recipes and I believe python =
user would
benefit from this enabling too.

Thanks..

Ong Boon Leong


