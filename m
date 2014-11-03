Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 57BFA6E63E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 10:13:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Nov 2014 02:13:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,307,1413270000"; d="scan'208";a="625372416"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by fmsmga002.fm.intel.com with ESMTP; 03 Nov 2014 02:13:44 -0800
Received: from irsmsx110.ger.corp.intel.com (163.33.3.25) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Mon, 3 Nov 2014 10:13:29 +0000
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.56]) by
	IRSMSX110.ger.corp.intel.com ([169.254.15.3]) with mapi id
	14.03.0195.001; Mon, 3 Nov 2014 10:13:28 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Jia, Hongxu (Wind River)" <hongxu.jia@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Burton, Ross"
	<ross.burton@intel.com>, "Chen, Qi (Wind River)" <qi.chen@windriver.com>
Thread-Topic: [OE-core] [PATCH 0/1] systemd: add network config while
	networkd	supported
Thread-Index: AQHP9zmAwqAJtcNzy0KY6W7aCRkbvJxOrOOA
Date: Mon, 3 Nov 2014 10:13:29 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB2F385461@IRSMSX105.ger.corp.intel.com>
References: <cover.1415000039.git.hongxu.jia@windriver.com>
In-Reply-To: <cover.1415000039.git.hongxu.jia@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Subject: Re: [PATCH 0/1] systemd: add network config while networkd	supported
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
X-List-Received-Date: Mon, 03 Nov 2014 10:13:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

In my opinion, in the actual form, this patch cannot be taken in.
Reasons/questions:
1. How exactly this has been tested? I don't see any details. Testing netwo=
rk configs and doing modifications of this kind are sensible matters.
2. Different images have different ways of setting up network; for example,=
 core-image-sato will manage network setup using conmman; has this configur=
ation been tested?
3. How exactly is decided if networkd is active or not in a systemd-based L=
inux image?
4. Please go into details why exactly this patch has been submitted (what i=
t tries to solve in the first place).

Regards,
Cristian

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Hongxu Jia
Sent: Monday, November 3, 2014 9:38 AM
To: openembedded-core@lists.openembedded.org; Burton, Ross; Chen, Qi (Wind =
River)
Subject: [OE-core] [PATCH 0/1] systemd: add network config while networkd s=
upported

The following changes since commit f19b4e995ea47f9243f152b39337330307453c9f=
:

  bitbake: bitbake: clarify startup message (2014-10-30 13:39:52 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-systemd-network
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dhongxu/fix-system=
d-network

Hongxu Jia (1):
  systemd: add network config while networkd supported

 meta/recipes-core/systemd/systemd/oe-core.network | 8 ++++++++
 meta/recipes-core/systemd/systemd_216.bb          | 6 ++++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/oe-core.network

--=20
1.9.1

--=20
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

