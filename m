Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QCmgp-0007mp-B4
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 07:44:31 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Apr 2011 22:42:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,249,1301900400"; d="scan'208";a="736367226"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by orsmga001.jf.intel.com with ESMTP; 20 Apr 2011 22:42:06 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 21 Apr 2011 13:41:21 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 21 Apr 2011 13:41:21 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Thu, 21 Apr 2011 13:41:20 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Saul Wold' <sgw@linux.intel.com>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Apr 2011 13:41:19 +0800
Thread-Topic: [OE-core] [PATCH 2/9] util-macros: upgrade from 1.11.0 to 1.13.0
Thread-Index: Acv/cZ/K/yiaBoNuSr+HYRalYav1OQAdHz3A
Message-ID: <1865303E0DED764181A9D882DEF65FB6911CBC1666@shsmsx502.ccr.corp.intel.com>
References: <cover.1303284287.git.dexuan.cui@intel.com>
	<0a4528e92190a055233b52e7d4e9bbfe0400e959.1303284287.git.dexuan.cui@intel.com>
	<4DAEFEFF.4080102@linux.intel.com>
In-Reply-To: <4DAEFEFF.4080102@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 2/9] util-macros: upgrade from 1.11.0 to 1.13.0
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
X-List-Received-Date: Thu, 21 Apr 2011 05:44:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Saul Wold wrote:
> On 04/20/2011 12:30 AM, Dexuan Cui wrote:
>>   ...util-macros_1.11.0.bb =3D>  util-macros_1.13.0.bb} |    4 ++--
>>   1 files changed, 2 insertions(+), 2 deletions(-)
>>   rename meta/recipes-graphics/xorg-util/{util-macros_1.11.0.bb =3D>=20
>> util-macros_1.13.0.bb} (79%)=20
> I will pull this patch today, but you need to determine if the
> util-macros/xaw.patch is still needed and if not, please remove it
> from the tree.
Hi Saul,
Thanks a lot for the reminder!=20
The file xaw.patch is not needed now since no recipe uses it.
I made a new commit for the upgrading of util-macros:
http://git.pokylinux.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Ddcui/master=
_util_macros&id=3D3cfb9f508b11c4a33aace97d306956f36b137992

Please pull this new commit (the commit is in a new branch dcui/master_util=
_macros)

Thanks!

-- Dexuan=


