Return-Path: <carol.zhu@nxp.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0040.outbound.protection.outlook.com [104.47.34.40])
	by mail.openembedded.org (Postfix) with ESMTP id D5CCF72F24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 14:09:46 +0000 (UTC)
Received: from MWHPR03CA0004.namprd03.prod.outlook.com (10.175.133.142) by
	BY2PR03MB173.namprd03.prod.outlook.com (10.242.36.139) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1101.14; Tue, 23 May 2017 14:09:47 +0000
Received: from BN1BFFO11FD015.protection.gbl (2a01:111:f400:7c10::1:112) by
	MWHPR03CA0004.outlook.office365.com (2603:10b6:300:117::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1124.9 via
	Frontend Transport; Tue, 23 May 2017 14:09:47 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD015.mail.protection.outlook.com (10.58.144.78) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1075.5
	via Frontend Transport; Tue, 23 May 2017 14:09:46 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4NE9YgV029059; Tue, 23 May 2017 07:09:43 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 May 2017 22:08:05 +0800
Message-ID: <1495548488-12280-4-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1495548488-12280-1-git-send-email-carol.zhu@nxp.com>
References: <1495548488-12280-1-git-send-email-carol.zhu@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131400221867301700;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39840400002)(39380400002)(39850400002)(39860400002)(39400400002)(39410400002)(39450400003)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(9170700003)(2351001)(498600001)(81166006)(47776003)(106466001)(110136004)(8676002)(2950100002)(6666003)(38730400002)(53936002)(6306002)(189998001)(76176999)(5003940100001)(8936002)(6916009)(575784001)(50986999)(356003)(8656002)(54906002)(36756003)(86362001)(5660300001)(77096006)(33646002)(48376002)(104016004)(50226002)(85426001)(105606002)(50466002)(4326008)(2906002)(305945005)(230783001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR03MB173;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; A:1;
	MX:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD015;
	1:tswdzgwnbt4mLbZURMy1y0eFhKSKTbBD4e1A1CCniv5M7k+bLVbV2LLqnSvt5PMLytNgq7FrMdYzRhKD9Z5jf4HbDKbytaGeFtp6AY73d50tXiQbL1nTn1JCTUiOQ4VZF9LqmLOPbWWyCKM/QLI/e/epkBors2IhA9icUaQhmOetJa3IC+V+bTYWRygq9yeyWgSM0D1wLnub7sGlXCJ59JvE5RGtazqIgZ0kAEb8EaiI9NmG8bqKXhCAag39jSIQHVBJXNTPggDcSmPys7PfoWsSXlLCB4N7BJGzLWGU+Gga3ffRtpddSEApNnt0dGuTbOlWf/Qtv/iuiQWVgoVmmKRbYR5HEhIQv55CPABmNrnmHQgd85giAJywma4toBlKHvDeN8TZoaUOaad25sBcBEvVfhtKIu5XEQnJZxF1WfM0zsJMZ1XCbri6nLXZg3++k5knsYkmL0by2inTLZRpwL5MAjAPlmXJz24JxMdcxM4pco2xG4wTStsoySLf6VLJJa8Vc7TT4rnZKZNjMNLArktisTKN6s73iIX/xrI1JWCgh6od5eZDDcJkDmkUVf5Z4tiPMWt6iK13AAz0e86DKkUrgor8J10fsJ1r0PXR6XrYLiYvqyMVaVID7F0TKyGNOKOHtQXHORYoECSvrgkCajYrx/QGfsaEypoD5dh68SvO8J1vjepCG/IPDq0GRLCXPgkEls11wmm9K1Wdu8BpH1gMnJJ1rVQllAaCuB6oBMlrC6vc6hTz5MDFG7cXKjqkh91dsT65XvCXBoETCoF6/A==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY2PR03MB173:
X-MS-Office365-Filtering-Correlation-Id: e3525ea5-0162-4b8d-79e4-08d4a1e55e43
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131430075)(201703131517081);
	SRVR:BY2PR03MB173; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB173;
	3:3jAwJ0AvwMkBYT+FMiqvSjQvgY89TlSV9Foy/bk+xLfcsZmDaNGYhDHZdHzGpvSpZ7/g8DANl0jlz+OPUQ52oOUBiRQGcu7FfOQD+KfoPFJK8jZpadT6RHnZ+w7Fvftf4GsyKPnNjym1HKJ5av0n4aScERaVciB0K1gu1KjOO+7aJPCH6Vvd9/2kFRHw0dFyr2a9k3G+z0svlu8TnSBWRc/DUX71w3SQYC1NEbKJ0D2a3AZ03K9C+iMoSgnPP0CMXIYlXYL3ei6DNKIrleDxMFBjuaWDbhu4fy8YHEn0CQ8FGNlB9zIkZHJq8e6Cge4uahnBpgg/a45XuzOW9yPVIwukusdBz9qcjhkMZR2jlrZDM6uMdg9Ydcg7b8YGKVQEJ8MEUyhen9Eju72NXK8j/BKyGuB1hX5K3r43TvybvK8unhxtuZoyo9j7ikqkb5NG;
	25:oocl4Inz3Wp6m9JkpZR1lGnMtJ6Bbfh1ZBPZ1rHePTlvEJd/sLTatxVCNuRUirK4O4lTv88LXMSLDajrBbMEJdUEnFJC3BL+yX1rSNlMLiYNxfpxmpiHldwNq7yR2cXBhml9NiJqgHnNrqvZA1sdfUYPuQzS1ge7elLA+OTm9+qd9O8kUX3XImdpup/yARYf+iHGXTGBrZBcommkrPhxfgfxrx2TD+vc2skpJhDhrL5XODGGe5TXeDRui9+OTJs6KP162dGsqXwLy6/Jtuegow43NBxd83VBvMh54cW1sk6cY9BsYNejKx0HyH4jMusnm/lRkLt2UIVGCj8NWlK8FjhHpTlj8+amylPGtAGb+KIodLLiwlSweExBdqb2Q4mcUP7Y9l+DrLE47FT4AVWyeJEF08ql37h5h1gixtE4GKm6LUJWkXYJWLbs8T8HW5uouGeCrAXPdE17bjEHZhlAtyieAwDvuDhQEH8pdL1Ds0s=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB173;
	31:u/1q6l2qfE9/kswm1l1SwHbHCq+S7hxootI7MOKA4ykMwy7qVXllGNaunbyk+qUMnJdNGTrUbI/yTv2XNMEr5BTtc1CQu89GH3heA54g/EmlJ63lhr6fVsZcNAX/8FGxtNzaqwjzzVpGH63NhvW2lYSAamC2M2Q47ueFllIVwdN0BbzGEO0r1EFNWMG6lo3xR7vqHzbSdiaZ/pKYrxV2s5mMPlkHwx2JRxpwi0USnYsTELXmR8iIEQ6pLODuJdu7
X-Microsoft-Antispam-PRVS: <BY2PR03MB17397DA0A3DAF52FAAFABE8E9F90@BY2PR03MB173.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6095135)(601004)(2401047)(8121501046)(13018025)(13017025)(13023025)(13024025)(13015025)(5005006)(10201501046)(93006095)(93001095)(3002001)(6055026)(6096035)(201703131430075)(201703131433075)(201703131448075)(201703161259150)(201703151042153)(20161123565025)(20161123563025)(20161123556025)(20161123561025)(20161123559100);
	SRVR:BY2PR03MB173; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BY2PR03MB173; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR03MB173;
	4:tTlwc5KY7p1PIEMu9yAjxRQ5QOzZRMPVp8FNT0A1H5g?=
	=?us-ascii?Q?Xc8k3iqxXGENbWXaAB37I4GYJl8Ny9DJoJZl8QeA+BhV7qv2wyZO/uKnKTrz?=
	=?us-ascii?Q?EyWWj0O5UeBbLJHs+AgdPbx+a2KQu57qJMVZk5AKGuL5IcXlCcB+I07k+xLX?=
	=?us-ascii?Q?iVTRmVM6bKP04D8qqEV0DgNpWS4y/hLEgqvuHfofP5G159tto2cDSlEJR8Vx?=
	=?us-ascii?Q?f7datSX/VmlxwtyYJJxcPt1X/sdd53bCbDgBzCjGSEgoRD0oPkClpWrej2i3?=
	=?us-ascii?Q?SY8Fj7zdm/BkFv8Jcl6WGfK4ImPNtrZl4NlLTxw6ueJev/EXBr7QNEDkBCX2?=
	=?us-ascii?Q?X/XAfBEihfa/v0Rp2Iaee46A5VUeo6yrEAYtttjCQ4ffDgLoEoiN/1Iysd66?=
	=?us-ascii?Q?/MmE4pkbmn9GmG0nGUigG9l91ddQ7J9CJVOriiX8Rmtj6N9wFm/qD5YTCs1X?=
	=?us-ascii?Q?Zw9BI254oanmr/Y54q9m4LFOBNpCBhhhkUObWNkM1L0T0ysyZN48XsWPqMr7?=
	=?us-ascii?Q?HzaQlWjNajIpUYzRjuJuQlYveqevF2b6txqrurI45ZcjyLLgvm3y7KIdacM0?=
	=?us-ascii?Q?UMpZo38a6qtJYhWmPvQDErvrHKnANBbmgp/6TD0p5gWyD0auuAdBscNkjXUm?=
	=?us-ascii?Q?tJbPuQYfxiMlnV0y/E7N+tTsNkx1DsCmu2iATa6eQXxwcJCAqRS2YRjIdpgy?=
	=?us-ascii?Q?smtAb7XPzhazMHs1/Q2f1EaWzKSDszohW7l6sy3F2uprnlKFtfn5DmIzQYql?=
	=?us-ascii?Q?ncMXOmdc9a91R+SfSeN1YXtyhUUI44euaBhhtuiAqCENqkyFcDb7QwMfVHxW?=
	=?us-ascii?Q?cRy5ontsMoJqCEmLvczdPCcgooKrCYpigeROL69SREiH21Ahewo6LmHftaYd?=
	=?us-ascii?Q?THkvXqupaAzI2c/hdX63Rb3XOH5ldeVrdnP3irW6tS6yxi7yHahWkQvJN2hb?=
	=?us-ascii?Q?afd/64FMESt3ssoVDxvH618GvvzrzHbN3UvJZpg=3D=3D?=
X-Forefront-PRVS: 0316567485
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR03MB173;
	23:J13SL21oyH4SkcYLrVv565qNrm/U9N7wlvn21PcLVU?=
	=?us-ascii?Q?299LnSbLv6zVu+oSMISbdnjFUprPtWIjBxEoIuOOSS/8IExSAM6LQymvbSaH?=
	=?us-ascii?Q?O5epIuLbcPv9MgE6c4LILgq/txpTwXZ6/eP5IKAVF/rRY5kXYcizlZwNH7KC?=
	=?us-ascii?Q?HkQuavMhKqFtonUQgO54eBnBUWzdRIfh5eLhWuGt3AQ2Ck3NSBlbNaJTSV0x?=
	=?us-ascii?Q?hjzRezj62z30BlFwpTQWeOiyLsfgM3ZjxWHEv8L1iJremvBgX+xs0BiGVPlg?=
	=?us-ascii?Q?aRg8wYTRlUWcWRe1UekJsLBBBHBL7Z9o5vwx8WyjBc56wnG+tHyOf17RQdgJ?=
	=?us-ascii?Q?jatGVhNcf8f7FdNHvP3buuuJZVLQbGedcJTwZ91IUDOjsW+6tss04nzYvZ/a?=
	=?us-ascii?Q?qzc6FEk+Qe9ZesmDnvboVkqlwdR500ImJXhye7EbWbi+YyVgzXFQeQZwVbAl?=
	=?us-ascii?Q?D3IDBoQmRXXDQzMCuGyjvD6Ino1e7iWdmZhmRqMNqpKfiOjGyWlkxsrs5di0?=
	=?us-ascii?Q?n7yFEqUwxEE6jX63w5NMAWGVw3KsJGExOMkfsUDer2/RZvRBOQfUkteqiENY?=
	=?us-ascii?Q?jUb0zPIyusN0fTP3XhusDXCVFAKCauKQ/JzcS6ZumCs7SlOc4LuvZKz8vnfI?=
	=?us-ascii?Q?zkrY6hcmfWivUUl2MjrBhQhXIekdiOeutTvfaWaYzvm0q4/rFQ0CxiUcJd09?=
	=?us-ascii?Q?Npa901InjOF0tC1uWE4TW4loopUmwCCoXS639OR1sJTk6MZaaFoQlyIODM5Z?=
	=?us-ascii?Q?lTgTsQ1NOJfTUDn9etdauFJDRyoDhBFxjoHim8i2EzWiRP5XxcUgGXs83VAp?=
	=?us-ascii?Q?iJVVFlIfav2Idav1fTFICA3DvA/tmdrmBFbYMNzolsJz7kl1HyomduvLLeer?=
	=?us-ascii?Q?tWu4lILRIibBogt7rOFE/mELkKnk3ZlEMyfaNCDyIxXeZH8bC07hihvkV1N7?=
	=?us-ascii?Q?AOv6zsUNKmhV7i+aRWuJzHR43a00LgP3xr9lLiLQ2Z3FHZjt8XnDXvs3H9I3?=
	=?us-ascii?Q?vL54+VvTSEHDxMYeCM8Gr93iLlX9qWqvTHTd4+d//fM0tWOGQtPgiMf7mHMZ?=
	=?us-ascii?Q?Ebs+rQ5xqV0tPA2ENwA2T+IvwPsXIjMjo+qMXiMdev7qZXtguFVEoeLSvmY+?=
	=?us-ascii?Q?IN7mnNtA2CUnYcHnB1GC8DRkDMHvZ29Pvt/wXkDwnTb9o8fYjNGlol7+CUi7?=
	=?us-ascii?Q?mD+KZuSnWwgNpzwBIY+Dpg5kSQe6kkrlBbU/3NISzQiw8jd2MIebkv1DQfcX?=
	=?us-ascii?Q?xCUTwzjjnDG7coXTx1+F2XsVMw7Gc/Qw4qqowGyWM1Fel1fl32NLMw//w29z?=
	=?us-ascii?Q?xAVK1YGWLLkhRRrYoNClI=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB173;
	6:g/cOIeDaqtRohuRw/B8HwIww8DpLG6/FbR4PHwH1RiOhRfGBb9Oqck9TbW6yvw28YfhKNwwCZG7oiF1w1ZmWn0WpAzKEDb7pOv9RMgN0M2puVe4RKCYwsHNT/AGvVFuWi0iZdNwbClpkofUgudge7vDtrI5qzLhe5xUnoVGDS7V1CgrZE7JsGQ7DnOYORo2uCh65QiTHKFgAxDXxckc/seElj8nRnxVYmmPAv9/4RXMCEghwYiu6ftg+CSGqkTiZBwtClBmIgheqAcLBsId5+47gB1XAt27zIj1IJi9SNJnM24IOCHWzPW4v3WG+AKZk5QRw3rMX4Pu6chfDeHQM6owi0PsfkOWTv7MlBAG0YBHUDGTpqVh5CAtTF5zCwpKzsIhuMx5yBV2lwYCLgZx/Pyw4E065DU/bf4xAylmxN6nKoZzJ4DyonwglVi79Ek+CGe23GCzZsOQdZDEoxe/pKtB8JgU72GHUpnYkmrfRtGan1wsslnbxyC7BM/CjUzSzI8LYHaW8Zhjnzt6a77QUdA==;
	5:z0xnzHDmoLr6nuVZtZGYz4KO81GazmaIGs2Iht5/61a0cN1MNcXGFw/w560CvQU5BH7ow2Fs4htEg2oj//7n/VILBnyBhdA8q1ToCgVrlyDiA4+OM1+mxNv5REfKYIISmXu/+6Vc9Or8E4PmLgRufGBOdQ0r1pe0JPYDK2jWWGYpdjNQnX9XDK/L+g5rnRsn;
	24:kdvtdfjkvmkGj0R4axCuLABvi+lPRsD2h7YdukjEVxraDFRh0FZSnnMMY2/Bbq+YiMRtRRGTVVNCZamFXEdVbZszYMucueGr42TZD3XBbi4=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB173;
	7:0Fq+usz0Ygbfx/qmCdO5B3TY/L+tETtaRMAy0JXBys+z0WA+iSAWGT7iyV1E20jQ6Y3LSugNl6MZ9Vhz85FSx3cAX8xzUM9GI9eXo/A+NRJYrw/iyeIv1DAUpiX5xaMcLScTZoLFIJiPk+8nvJjbcKVsTrnrlHzRZ8D7W1i2IwZaQ97vfYR+QYr+Cuggy4WlEBeIzvJBPQCPKefAofkUlWYQRiX1lJPZt444QGpr6YQ7ALzj+4L6MCKF3gC6xliOS9SMgUe5Fyl3OCg9MawrQRFzIQw9HDUXA4Dzs57Tgnv4TTTTpjtVsy3LwbDOXodHCV5Mz81FqtA93iSNxnx+uQ==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2017 14:09:46.5429 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR03MB173
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [pyro][PATCH 3/6] gstreamer1.0-plugins-bad: Add get track number media info API
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
X-List-Received-Date: Tue, 23 May 2017 14:09:47 -0000
Content-Type: text/plain

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...layer-Add-get-track-number-media-info-API.patch | 126 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb   |   1 +
 2 files changed, 127 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-player-Add-get-track-number-media-info-API.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-player-Add-get-track-number-media-info-API.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-player-Add-get-track-number-media-info-API.patch
new file mode 100755
index 0000000..82e05bb
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-player-Add-get-track-number-media-info-API.patch
@@ -0,0 +1,126 @@
+From 573142bb46ea5ffff78bf0672923553877c9726c Mon Sep 17 00:00:00 2001
+From: Lyon Wang <lyon.wang@nxp.com>
+Date: Tue, 20 Dec 2016 18:20:02 +0800
+Subject: [PATCH 2/5] player: Add get track number media info API
+
+Upstream-Status: Backport [1.11.1]
+https://bugzilla.gnome.org/show_bug.cgi?id=773570
+---
+ docs/libs/gst-plugins-bad-libs-sections.txt |  4 ++
+ gst-libs/gst/player/gstplayer-media-info.c  | 62 +++++++++++++++++++++++++++++
+ gst-libs/gst/player/gstplayer-media-info.h  |  8 ++++
+ 3 files changed, 74 insertions(+)
+
+diff --git a/docs/libs/gst-plugins-bad-libs-sections.txt b/docs/libs/gst-plugins-bad-libs-sections.txt
+index 77092f9..8515556 100644
+--- a/docs/libs/gst-plugins-bad-libs-sections.txt
++++ b/docs/libs/gst-plugins-bad-libs-sections.txt
+@@ -2064,6 +2064,10 @@ gst_player_media_info_is_live
+ gst_player_media_info_get_image_sample
+ gst_player_media_info_get_tags
+ gst_player_media_info_get_stream_list
++gst_player_media_info_get_number_of_streams
++gst_player_media_info_get_number_of_video_streams
++gst_player_media_info_get_number_of_audio_streams
++gst_player_media_info_get_number_of_subtitle_streams
+ 
+ gst_player_stream_info_get_index
+ gst_player_stream_info_get_caps
+diff --git a/gst-libs/gst/player/gstplayer-media-info.c b/gst-libs/gst/player/gstplayer-media-info.c
+index bba8ea6..a6c17c4 100644
+--- a/gst-libs/gst/player/gstplayer-media-info.c
++++ b/gst-libs/gst/player/gstplayer-media-info.c
+@@ -791,3 +791,65 @@ gst_player_media_info_get_image_sample (const GstPlayerMediaInfo * info)
+ 
+   return info->image_sample;
+ }
++
++/**
++ * gst_player_media_info_get_number_of_streams:
++ * @info: a #GstPlayerMediaInfo
++ *
++ * Returns: number of total streams.
++ * Since: 1.12
++ */
++guint
++gst_player_media_info_get_number_of_streams (const GstPlayerMediaInfo * info)
++{
++  g_return_val_if_fail (GST_IS_PLAYER_MEDIA_INFO (info), 0);
++
++  return g_list_length (info->stream_list);
++}
++
++/**
++ * gst_player_media_info_get_number_of_video_streams:
++ * @info: a #GstPlayerMediaInfo
++ *
++ * Returns: number of video streams.
++ * Since: 1.12
++ */
++guint
++gst_player_media_info_get_number_of_video_streams (const GstPlayerMediaInfo *
++    info)
++{
++  g_return_val_if_fail (GST_IS_PLAYER_MEDIA_INFO (info), 0);
++
++  return g_list_length (info->video_stream_list);
++}
++
++/**
++ * gst_player_media_info_get_number_of_audio_streams:
++ * @info: a #GstPlayerMediaInfo
++ *
++ * Returns: number of audio streams.
++ * Since: 1.12
++ */
++guint
++gst_player_media_info_get_number_of_audio_streams (const GstPlayerMediaInfo *
++    info)
++{
++  g_return_val_if_fail (GST_IS_PLAYER_MEDIA_INFO (info), 0);
++
++  return g_list_length (info->audio_stream_list);
++}
++
++/**
++ * gst_player_media_info_get_number_of_subtitle_streams:
++ * @info: a #GstPlayerMediaInfo
++ *
++ * Returns: number of subtitle streams.
++ * Since: 1.12
++ */
++guint gst_player_media_info_get_number_of_subtitle_streams
++    (const GstPlayerMediaInfo * info)
++{
++  g_return_val_if_fail (GST_IS_PLAYER_MEDIA_INFO (info), 0);
++
++  return g_list_length (info->subtitle_stream_list);
++}
+diff --git a/gst-libs/gst/player/gstplayer-media-info.h b/gst-libs/gst/player/gstplayer-media-info.h
+index 7ffd6b4..6866ff6 100644
+--- a/gst-libs/gst/player/gstplayer-media-info.h
++++ b/gst-libs/gst/player/gstplayer-media-info.h
+@@ -175,12 +175,20 @@ GstClockTime  gst_player_media_info_get_duration
+                 (const GstPlayerMediaInfo *info);
+ GList*        gst_player_media_info_get_stream_list
+                 (const GstPlayerMediaInfo *info);
++guint         gst_player_media_info_get_number_of_streams
++                (const GstPlayerMediaInfo *info);
+ GList*        gst_player_get_video_streams
+                 (const GstPlayerMediaInfo *info);
++guint         gst_player_media_info_get_number_of_video_streams
++                (const GstPlayerMediaInfo *info);
+ GList*        gst_player_get_audio_streams
+                 (const GstPlayerMediaInfo *info);
++guint         gst_player_media_info_get_number_of_audio_streams
++                (const GstPlayerMediaInfo *info);
+ GList*        gst_player_get_subtitle_streams
+                 (const GstPlayerMediaInfo *info);
++guint         gst_player_media_info_get_number_of_subtitle_streams
++                (const GstPlayerMediaInfo *info);
+ GstTagList*   gst_player_media_info_get_tags
+                 (const GstPlayerMediaInfo *info);
+ const gchar*  gst_player_media_info_get_title
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
index 6655a86..732fc2d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
@@ -20,6 +20,7 @@ SRC_URI = " \
     file://0001-mssdemux-improved-live-playback-support.patch \
     file://0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch \
     file://0003-player-Add-configuration-for-enabling-accurate-seeks.patch \
+    file://0004-player-Add-get-track-number-media-info-API.patch \
 "
 SRC_URI[md5sum] = "2757103e57a096a1a05b3ab85b8381af"
 SRC_URI[sha256sum] = "23ddae506b3a223b94869a0d3eea3e9a12e847f94d2d0e0b97102ce13ecd6966"
-- 
1.9.1


