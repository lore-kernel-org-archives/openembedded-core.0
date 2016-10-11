Return-Path: <vesa.jaaskelainen@vaisala.com>
Received: from hel-mailgw-01.vaisala.com (hel-mailgw-01.vaisala.com
	[193.143.230.17])
	by mail.openembedded.org (Postfix) with ESMTP id 3CF9D6022F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 13:15:00 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2CgBAA75fxX/1sBGKxcHQEFAQsBgzwBAQEBAYF3uGOCC4hgEgECAQEBAQEBAYEFhGiBCwGBACYBBBvLfo8rEQFohRMFjniFMIVagTqOPI98kHglCUCFE4Z0gSCBAAEBAQ
X-IPAS-Result: A2CgBAA75fxX/1sBGKxcHQEFAQsBgzwBAQEBAYF3uGOCC4hgEgECAQEBAQEBAYEFhGiBCwGBACYBBBvLfo8rEQFohRMFjniFMIVagTqOPI98kHglCUCFE4Z0gSCBAAEBAQ
X-IronPort-AV: E=Sophos;i="5.31,329,1473109200"; d="scan'208";a="31943664"
Received: from hel-exch-01.corp.vaisala.com ([172.24.1.91])
	by hel-mailgw-01.vaisala.com with ESMTP/TLS/AES256-SHA;
	11 Oct 2016 16:15:02 +0300
Received: from HEL-EXCH-02.corp.vaisala.com (172.24.1.85) by
	HEL-EXCH-01.corp.vaisala.com (172.24.1.91) with Microsoft SMTP Server
	(TLS) id 15.0.1130.7; Tue, 11 Oct 2016 16:15:00 +0300
Received: from HEL-EXCH-02.corp.vaisala.com ([fe80::59d1:1a7:ed7f:2d17]) by
	HEL-EXCH-02.corp.vaisala.com ([fe80::59d1:1a7:ed7f:2d17%14]) with mapi
	id 15.00.1130.005; Tue, 11 Oct 2016 16:15:00 +0300
From: <vesa.jaaskelainen@vaisala.com>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: Two kmeta's not allowed for master?
Thread-Index: AdIjwWY4Erb6eTDHSWe+FK2tgZlOCQ==
Date: Tue, 11 Oct 2016 13:15:00 +0000
Message-ID: <35a67fa817544a4fa1a59f5ceef6b8db@HEL-EXCH-02.corp.vaisala.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.24.65.135]
MIME-Version: 1.0
Subject: Two kmeta's not allowed for master?
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
X-List-Received-Date: Tue, 11 Oct 2016 13:15:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I was trying out how well 'master' branch compiles in our environment.

We are using meta-xilinx and then we have custom BSP layer which bbappends =
linux-xlnx.

When using meta-xilinx as standalone (w/o our BSP layer) I can get it to co=
mpile.

However when using it with combo meta-xilinx and our BSP we get failure on =
do_kernel_metadata due to missing scc files.

It seems that there can no longer be two kmeta entries in SRC_URI.

meta-xilinx's linux-xlnx.inc has:
file://xilinx-base;type=3Dkmeta;destsuffix=3Dxilinx-base
our bbappend has:
file://meta;type=3Dkmeta;destsuffix=3Dmeta

In krogoth this works fine.

Is this expected change?

Ps. Sorry for html version of this same email.

Thanks,
Vesa J=E4=E4skel=E4inen

