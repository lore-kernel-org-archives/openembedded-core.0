Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1Stw7a-0005a7-JI
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 09:35:02 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 25 Jul 2012 00:23:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="185681130"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by fmsmga001.fm.intel.com with ESMTP; 25 Jul 2012 00:23:32 -0700
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.176]) by
	IRSMSX103.ger.corp.intel.com ([169.254.3.87]) with mapi id
	14.01.0355.002; Wed, 25 Jul 2012 08:23:31 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Package recipes change proposal (system-wide) - name wise
Thread-Index: AQHNajOav4LCEYK+qEq1SwOn+cr5wZc5lC0w
Date: Wed, 25 Jul 2012 07:23:31 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16174E03@IRSMSX102.ger.corp.intel.com>
References: <cover.1343199345.git.Xin.Ouyang@windriver.com>
In-Reply-To: <cover.1343199345.git.Xin.Ouyang@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Subject: Package recipes change proposal (system-wide) - name wise
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jul 2012 07:35:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Hello all,

For me, having the version number contained in the name of package recipe i=
s a little bit puzzling.
For example: libpcre/libpcre_8.31.bb

Is there a solid technical reason to not have it like this?

libpcre/libpcre.bb
and inside the recipe to have a PV variable defined:
PV=3D"8.31"

In that case, the upgrade/update process would not involve performing a "gi=
t move" operation.
In my opinion, this "git move" operation is something to be avoided, as it =
puzzles a little bit the versioning system and complicates the review proce=
ss.

Of course, some changes in the bitbake system would be involved, but I gues=
s would not be too complicated.
Also, there will be a volume of work to be performed for changing the name =
of recipes and adding the PV variable inside the recipe.
But I guess that a script could solve that, followed by some manual review.

Waiting for some feedback.

Thanks,
Cristian

Cristian Iorga
Linux Software Engineer
Open Source Technology Center
System Software Division Romania
iNET: 88451023




