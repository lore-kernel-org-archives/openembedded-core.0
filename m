Return-Path: <reinette.chatre@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1EC9873DA4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 17:46:03 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 29 Apr 2015 10:46:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,671,1422950400"; d="scan'208";a="563807911"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
	by orsmga003.jf.intel.com with ESMTP; 29 Apr 2015 10:46:04 -0700
Received: from orsmsx114.amr.corp.intel.com (10.22.240.10) by
	ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 29 Apr 2015 10:46:04 -0700
Received: from orsmsx111.amr.corp.intel.com ([169.254.11.135]) by
	ORSMSX114.amr.corp.intel.com ([169.254.8.220]) with mapi id
	14.03.0224.002; Wed, 29 Apr 2015 10:46:03 -0700
From: "Chatre, Reinette" <reinette.chatre@intel.com>
To: "joshua.lock@collabora.co.uk" <joshua.lock@collabora.co.uk>, Armin Kuster
	<akuster808@gmail.com>
Thread-Topic: [fido] [dizzy] Please port gummiboot install fix to fido and
	dizzy branches
Thread-Index: AdCCo/pgPlIjFjBsQRK+JL8u1Ab7Mg==
Date: Wed, 29 Apr 2015 17:46:03 +0000
Message-ID: <0D818C7A2259ED42912C1E04120FDE26710B11FC@ORSMSX111.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [fido] [dizzy] Please port gummiboot install fix to fido and dizzy branches
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
X-List-Received-Date: Wed, 29 Apr 2015 17:46:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Joshua and Armin,

We are seeing installation failures as a result of gummiboot entries not be=
ing installed correctly. This is already fixed in master with the commit be=
low. It applies cleanly to fido and dizzy branches since apart from this pa=
tch the file being changed has exactly the same git history there as master=
. Could you please port this fix to the fido and dizzy branches?

commit fc15878af46c09512fc3cb73480359fcbb22e627
Author: Reinette Chatre <reinette.chatre@intel.com>
Date:   Tue Apr 14 11:49:37 2015 -0700

    init-install-efi.sh: fix gummiboot entry installation
   =20
    After selecting the "install" gummiboot option of a Live image we are
    seeing boot failure resulting from the gummiboot entries not being
    installed correctly. This seems to be a problem in this init-install-ef=
i.sh
    script where it incorrectly installs the gummiboot entries into the roo=
t
    filesystem, not the boot partition. We fix it by installing the entries=
 in
    the boot partition.
   =20
    (From OE-Core rev: c9b06c79ed8a082d1b385e9f61721aeeda9bf1af)
   =20
    Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
    Acked-by: Darren Hart <dvhart@linux.intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Thank you very much

Reinette

