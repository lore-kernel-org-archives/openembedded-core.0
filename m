Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <emilia.maria.silvia.ciobanu@intel.com>)
	id 1TyLoL-0000yG-47 for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 13:22:01 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 24 Jan 2013 04:05:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,529,1355126400"; d="scan'208";a="194669823"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Jan 2013 04:05:02 -0800
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.82]) by
	IRSMSX103.ger.corp.intel.com ([169.254.3.218]) with mapi id
	14.01.0355.002; Thu, 24 Jan 2013 12:05:01 +0000
From: "Ciobanu, Emilia Maria Silvia" <emilia.maria.silvia.ciobanu@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Meta-web-kiosk Layer
Thread-Index: Ac36KwkedgWuxsgKTRCww92yjPskEQ==
Date: Thu, 24 Jan 2013 12:05:00 +0000
Message-ID: <985E5BBDA0968D48ABDF343456A521B3F1301C@IRSMSX102.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.135]
MIME-Version: 1.0
Subject: Meta-web-kiosk Layer
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2013 12:22:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I've created a new layer that can be used for kiosk devices.
You can check it out at:
    http://git.yoctoproject.org/cgit/cgit.cgi/meta-web-kiosk/

It contains a new bitbake target that automatically
starts a web browser right after boot and enables the
use of a virtual keyboard if there is support for it.

The layer currently includes recipes for the web browser,
and bsp configurations.

I'm open to receiving feedback, patches and any suggestions.

Thanks,
Emilia Ciobanu


