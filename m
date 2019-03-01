Return-Path: <prvs=95684d004=Alistair.Francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2326B7CD8B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 19:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1551468761; x=1583004761;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=MmP6Ihqe9Im/v1968xKtE03+Hoz+T5Y+PwpPy6yy400=;
	b=I8wZEQ5XTHsth6z6Nzs+dXj3tzbqtS1cW2P7IdJHZc+5qZmyOxZXd5Wh
	1X4CVIBl1rcaa2nZSOuA/yanFXrg2tVA4+Ki8nNRbyAVGuQJ7U0qTbmC6
	L2h54u1ZfRvdPcbBzrBdlo0JgEZTok4S7Ugo4peRTD7AkCHsnPoYW7xeP
	/RZBb+5XxR+Vs00EXyIFRDs30PxH3+zQds5IZh12br1PdGdLil2vwpaih
	qd8fS1XrvkikR8L5N60lKmAajiBZfF8h/Dz6txW+Nx8r2qfXCwXeMtYk7
	2qTqn2HXDIc9ZtboN4Ir6406GtP97u2CmBFVesDZziGfjqnlsmrU2U/be w==;
X-IronPort-AV: E=Sophos;i="5.58,428,1544457600"; d="scan'208";a="104238460"
Received: from mail-bn3nam01lp2051.outbound.protection.outlook.com (HELO
	NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.51])
	by ob1.hgst.iphmx.com with ESMTP; 02 Mar 2019 03:32:39 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=4A1gtMo5A32dyjHortoGab4sTuR8kQDe9AHuvpwf+is=;
	b=BuBhGPG88dCGpXmF2ogw02dxPDiqwnn3dnckDyHf7QFZKRsxzRL1sjEvY5U8zfhr8cEImWpvhi6/d+I6Pm8mDsi66nmBsJfifve/ZpaBrmZ/dxC4dn47IaerE7yXe35vOVucDN0JVernke/9roXD7bQs3DvZFN+qn+vk1nR3vEw=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0352.namprd04.prod.outlook.com (10.169.202.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1665.18; Fri, 1 Mar 2019 19:32:38 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::f55c:272b:6401:1b8c]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::f55c:272b:6401:1b8c%10]) with mapi id 15.20.1643.022;
	Fri, 1 Mar 2019 19:32:38 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 2/3] license: Add the Sun license
Thread-Index: AQHU0GWHfwcHtOfdKEiSxa0Dt+2ztw==
Date: Fri, 1 Mar 2019 19:32:37 +0000
Message-ID: <20190301193156.25878-2-alistair.francis@wdc.com>
References: <20190301193156.25878-1-alistair.francis@wdc.com>
In-Reply-To: <20190301193156.25878-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR01CA0044.prod.exchangelabs.com (2603:10b6:a03:94::21)
	To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60efcd48-d35c-42ce-4739-08d69e7ca973
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0352; 
x-ms-traffictypediagnostic: MWHPR04MB0352:
x-ms-exchange-purlcount: 1
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; MWHPR04MB0352;
	23:BN7/PFFw/Il4Qgh/16643YMB7oNHOTMnlRd96uf?=
	=?iso-8859-1?Q?GFKia6iit9k0SQkXzLLeyXbFQeHI2P/M7pBNngHhJHuarTj/+mmyY90YdD?=
	=?iso-8859-1?Q?5kdrPFrf4h2STkrRDSzqo4c+YVLW2TbcMm6hCy95NstNMGI3B1NJyHMR6g?=
	=?iso-8859-1?Q?DNLSqAlDg3yNfTbZO3kAwlahFLhr3y0tIKE0eqfShVR/ikafwcVFL3fw2W?=
	=?iso-8859-1?Q?B9slkW+2Snnu8ohMoBeod4cw+T/+J720zl0/m8dJZ9rjnobAxUes0UFpM3?=
	=?iso-8859-1?Q?2NqycKKXFQnyh7hZpSa2zkkNPDg+LxfabboqtW6rhwz+JU+n6iYi77pR65?=
	=?iso-8859-1?Q?jxRe8RFkPJdIiAC9GwitBd6dBwZT92muFj/RaYgNsZoVdu0ClRm1pA4lnD?=
	=?iso-8859-1?Q?YwD2Py7WHqNrtvzcn6Trih+f8WN0Hjfo0tCn2NFSdfZEf5u0740jDZwA75?=
	=?iso-8859-1?Q?53xmdoIXJd906WcMtIT5zbN2Fvo4dXOwbkS+L6KUt4R40GvT15wqDg33uh?=
	=?iso-8859-1?Q?Pyc8KenyfLrixjWz2aJovI8D1gKKF28D2dVFiznkvTfShb2/exX3Cwe5dJ?=
	=?iso-8859-1?Q?8xzialpod2c9QX0PUHxlgyRi93u56aOn31+H0dukL++SfuD8dnAsudvZpH?=
	=?iso-8859-1?Q?xJPD5eLLmll6nIhhMXTPNuF+d2Uv/K0NeI79R15RZfGlHoUyxYYpKWJJ0Q?=
	=?iso-8859-1?Q?EifyyLYp9jv2X2JuwRb07yQMGUXs/Xz3Ms6gfrDQq2pkcoV6vUoQf2LukL?=
	=?iso-8859-1?Q?DMli9qamKUkWrSKQV+oBykZvPBwsDT9Ckl9mmDxodjrsBTzX70IlqVeub2?=
	=?iso-8859-1?Q?sa2CdLf3Kata5g7mGDOdorhvIq8wve0M8QNej4GyAfgKLzsSvVB6i4I2Gk?=
	=?iso-8859-1?Q?qcL/kNRxMJLPsB+XgdV2zhgYcJXHkKlFNdrnXUhigJ83+xxKM/8bFmnaiS?=
	=?iso-8859-1?Q?nmDz2mK2x/hPLaUUxq0zfNrbeU0+hNhanasrbsCY2+jdKRbIh1E5mDt7Sz?=
	=?iso-8859-1?Q?K4STl9HLLvzVJ7/BvnZHz4yL5PL3uHOFX9Nrgo1paUjYXfilxU32y5fNo5?=
	=?iso-8859-1?Q?/6HaumpoTxK0CjL/PT+i//NT/m7E+sYdLM9nBwETcJAVk2FryxzPOoNKQM?=
	=?iso-8859-1?Q?VXisAiY1OLJu/qPVxCGxMgCWcJw1cZUbL80zTVYNUG0PfYWqq2lUHhdtYI?=
	=?iso-8859-1?Q?/oFvCuPwaJvp1Nfh8lH+dX4rTtBlcqXZ2U4xxOPUXfulhCpItzvgw9K/om?=
	=?iso-8859-1?Q?Wk8NGSyq+DHfk7VqTQWaBRITQ0lK2gmBgvdp7l/zmTjrji0Z2lAecvVGWV?=
	=?iso-8859-1?Q?kfl3tRTbpj7z5tJzKJ5uf/wTLsfOONaThGjDP/3EAEDYcFBHzkB6OEnBP5?=
	=?iso-8859-1?Q?MTNwUX3BWzxQ5nwqXjk92+/1WyVJeBA4Wx2YBqfdsLZd5rHdhcA=3D=3D?=
x-microsoft-antispam-prvs: <MWHPR04MB0352F7AA7CD156D79F979FC090760@MWHPR04MB0352.namprd04.prod.outlook.com>
x-forefront-prvs: 09634B1196
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(396003)(39860400002)(136003)(376002)(346002)(189003)(199004)(105586002)(97736004)(66066001)(26005)(7736002)(3846002)(6916009)(186003)(6116002)(2906002)(316002)(486006)(478600001)(44832011)(14454004)(71200400001)(476003)(71190400001)(2616005)(53936002)(11346002)(446003)(6306002)(6512007)(81166006)(5660300002)(8936002)(6436002)(6486002)(2501003)(52116002)(76176011)(2351001)(5640700003)(36756003)(386003)(6506007)(305945005)(99286004)(102836004)(81156014)(8676002)(106356001)(1076003)(50226002)(256004)(4326008)(25786009)(54906003)(68736007)(86362001)(72206003)(966005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0352;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rc1OCHvTpAkEOuAsx8QX3T4JZ/4Jf3GNvwMF9oW41HHAacYhWjcksclUKdE0Zv1R08234cFLS+x+oXnWDTVs6cyUCuOr6r+9zqSCtNe1CyZ8lRchDijtXu2UDyVpAMfk2GCUE9p5bZadvTLpwrGY/9T79c7mb8F98nidGTeeTPuFStXKHt1KvEQCbq05WqQ3sfPqt7j3MVpSRw5cOcqbvRp3H/3ORc+7GZC2SWsa1bkoM2q0NkXjvdZGJOCzv6w7d0t3aikCXiYqc4xv6R4tOvduJOHaJ1Uo2V2HiraDFcK3sfC7xmpgUs38G6ZlDY0/N8Fnw0W/Hd3COk69yJQz6aGh70+RX1rr81KlM71VeU6Wg80TYpaTCH8m6HimS02+0kPADr0iVXanlCxT2Umye0k9Ce0oIWhh1twnEcJdKFw=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60efcd48-d35c-42ce-4739-08d69e7ca973
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2019 19:32:37.4170 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0352
Subject: [PATCH 2/3] license: Add the Sun license
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
X-List-Received-Date: Fri, 01 Mar 2019 19:32:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

This is based on the license here:
https://github.com/MycroftAI/mimic/blob/development/COPYING#L915

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/files/common-licenses/Sun | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta/files/common-licenses/Sun

diff --git a/meta/files/common-licenses/Sun b/meta/files/common-licenses/Su=
n
new file mode 100644
index 0000000000..d125a16575
--- /dev/null
+++ b/meta/files/common-licenses/Sun
@@ -0,0 +1,23 @@
+This source code is a product of Sun Microsystems, Inc. and is provided
+for unrestricted use.  Users may copy or modify this source code without
+charge.
+
+SUN SOURCE CODE IS PROVIDED AS IS WITH NO WARRANTIES OF ANY KIND INCLUDING
+THE WARRANTIES OF DESIGN, MERCHANTIBILITY AND FITNESS FOR A PARTICULAR
+PURPOSE, OR ARISING FROM A COURSE OF DEALING, USAGE OR TRADE PRACTICE.
+
+Sun source code is provided with no support and without any obligation on
+the part of Sun Microsystems, Inc. to assist in its use, correction,
+modification or enhancement.
+
+SUN MICROSYSTEMS, INC. SHALL HAVE NO LIABILITY WITH RESPECT TO THE
+INFRINGEMENT OF COPYRIGHTS, TRADE SECRETS OR ANY PATENTS BY THIS SOFTWARE
+OR ANY PART THEREOF.
+
+In no event will Sun Microsystems, Inc. be liable for any lost revenue
+or profits or other special, indirect and consequential damages, even if
+Sun has been advised of the possibility of such damages.
+
+Sun Microsystems, Inc.
+2550 Garcia Avenue
+Mountain View, California  94043
--=20
2.20.1


