Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7189.1627359781024148199
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jul 2021 21:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=lxbthVt1;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=284286954d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16R4MotQ024011
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jul 2021 04:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=8OGhc+S/jMahs9hwJvxZN4QUtgkl3YaK+gGdpT7ebXk=;
 b=lxbthVt15sXPKRvR3k1ayCRq2648yy1iEyRQZYz9J6GbsKHxuWoQ6AGaMex8nNbgleX/
 Zoqswb2YxkjZg75x8ESiRdgpLGk+aNPjY/eIx+v0XMjNFivi9trxpYxmg+8tTjaxyQYU
 wvOfWiFDCsBv9vVNeBsIAWbeRWrek5G6zbPeKAJdKMe9vCtTRgywkvuYNiORLQBkXpn3
 vs1hw7IgKD1sgn9nwMhc9AnY2r+ohqmqnXLZn0YF3IGSnYyGSenvt2x+guqdCzqsJ6QZ
 8mPv1oXr0UNMoXwQEYmCiaBr/cL3lAJWUN71BNljtNrD6GzC0/5aUclij1uTqmAlMlqS Iw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a234x08vy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jul 2021 04:23:00 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16R4JY14020390
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jul 2021 04:22:59 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2047.outbound.protection.outlook.com [104.47.73.47])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a234x08vw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jul 2021 04:22:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnggDeTgL7jmsXtxjpDRvHfz0ZU2ErUOGBkvmdB7LlbNzeW6wDtXDPcdN7tD3P4xyuqlCDRntNeiiYIIndnmSgNPlZrtdlDr0ygTHDNR10QJE8zGIgTz837o6Jnjpw0xdfPzwMr/0IVlvfj4DLBpo6FXTkvSMS1hbZ+h9JP3Vbw9HJGVGdwnbmAnZtQA1zgbdLaSHngp2BigRFxdOSJlR+H+P2iacNfePdm6aO/XEpowzAe6yyvQv0HgRprSbUk/rEfFj1DqMsDPMNdDXEh1bw+rimNY2sLtOtZaWxXi9mzsRCAx/RUKyBclruTz6LnrSS3f+DVPqp6Z4UJePJSBCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8OGhc+S/jMahs9hwJvxZN4QUtgkl3YaK+gGdpT7ebXk=;
 b=RIhnoq+2rysekLk9VGAPx1kWf4b4miw5ORTqblapCbMejsKwDHLl+TWZMpObtFfv/6nZ+G/iDVTrUsptyv19eDhEX07bNvkOk5ACHaaYT2YOCj58CEuEED5+DvlC5TUGDMLhrYg/pNz2BpeWLNZNDoISzD6bneBRJ/+v+TLQCjsPYGeqfEkLBQe3chpzPldoLYNS2WzzQZhEGR24XyGD3F5ye/06zDogIWSalJdwaxE66Ymp8R1FtsDpNMP4ZpM9ZmbMOwdQwk906ajIVByBaaxClIuq0NeCg80pufCXA+jiVFrIsJae/zWdoT/gc4O7cAzkyQD7fn21avFA/sJPQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR1101MB2189.namprd11.prod.outlook.com (2603:10b6:301:51::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Tue, 27 Jul
 2021 04:22:56 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ca0:3d02:dcd0:626c]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ca0:3d02:dcd0:626c%7]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 04:22:56 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org, steve@sakoman.com
Cc: simon.schwarz@infoteam.de
Subject: [dunfell][PATCH] ifupdown: added -1 option to dhclient for dhcpv6
Date: Tue, 27 Jul 2021 12:22:44 +0800
Message-Id: <20210727042244.21050-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: HK2PR04CA0076.apcprd04.prod.outlook.com
 (2603:1096:202:15::20) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR04CA0076.apcprd04.prod.outlook.com (2603:1096:202:15::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend Transport; Tue, 27 Jul 2021 04:22:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c4626fe-b84b-4e6f-df95-08d950b63587
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2189:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB2189920AAF94071691524536F9E99@MWHPR1101MB2189.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vCWd6d9YLIiqu+WYSiJe/VZbBAN9di0AkQyXH9qsmfXwsenSH4cs7q5LovXuIbbPzWRuxTg/1Q2ftNQ5mx+2DbyHa6eHqQXpBNPtq8kXOgPUmcwlrQIB/3Cm13mlyDtrzmkW5gxOZV+PqjHWy1VXfYDXP1ds2Jz6V8xsS+9sPZRj/P1S0CT3gw/RXTNPHZVTBi4AjuIOcE3EOwIZ2OJ0YjGTDCcwGb5ne6howCJHltj7jsDglR240Q/1J5A61Ky7ARU+nGlHPObODokZT8u8iYmzeTAnaEijDXrnA6H1bc2HHummNKnCTmRBFuB7dou53yvBN7lYF6E9X+Z6Q6P/VV0azBL/DZYvS4JY7VDHINw+Z0Fp9BwtM+JViNFM5sihuouqKkZ/vXnTxwZA4BBZlhryOuxhgVv3M30s1+JYmQHKrGATISoT1zZNHzQp/49CmauVaXhw1iXT0zxeSOOq0UMr5zDGFsNzlcj5afdLZ7jhZsGaYu9AaoJCy6+6z0ZnsogwXWKmX1z+L2vVjJQepZamp8vcwgHPJPMeHxGy9NhIstKeVge03U6z67fSSWzGtBPmT+JF9kd3S9zdm1QssqTBpDiuB/nghEUFc6aIFpqXBxvuIOLE56xaIc4XGQMJz79vEPNz5vZAK1vbZ0djmLlPJb5CPSAboGlyl2EVOtg6qmN2C8aWm5Ply0y7vmo3Fy79QGC3PacOEN9ILHaFWPee5rCh7W3WLYJMesSzJA5YvlFE0TTyzEy5xG63RQCPo37C+BcwJYdKvraAOQlcPDhNZOVZxzAyuYdM9M3zvbQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(376002)(366004)(346002)(52116002)(8676002)(8936002)(6506007)(38100700002)(2906002)(6486002)(83380400001)(4326008)(1076003)(5660300002)(36756003)(86362001)(6512007)(6666004)(478600001)(66476007)(66556008)(66946007)(956004)(966005)(2616005)(38350700002)(26005)(316002)(44832011)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?g3LnTQFDHt9QEQIvQ7Q9wt5skGJc+CEcjKZsJFP+A99hnOriFuxtaddArHmn?=
 =?us-ascii?Q?KiQ6dX3A0BdLzW7bPVnLmmq1/uaeiLCIfWMWy0bbThkqsrOqZlUj8qyk+BBf?=
 =?us-ascii?Q?ixVKjtr0I+aLAXIrF5dq9sS+7tBhM2+7s56phn6PTI0ko/AWnV0XPBgfOqhw?=
 =?us-ascii?Q?cx4dTB784FaUo+aQcvOxs1kXjzEpPJHwb2sAXzEcijBPhZMc0HEjPm8NxGyG?=
 =?us-ascii?Q?u0FNdEtIzzyO3ikOM6BEO2TkRL6PaAHtYwT3Eo6Zg87TsxC6ABZ3RVRuX32B?=
 =?us-ascii?Q?rWpuhEqXPezJneuYbNdxv1rwfo0vt48q/0pt/9W88IEsxUhLv58uBTPVlOtU?=
 =?us-ascii?Q?/TFPE4RB/HUQKOm94RGOF4majgW6szokklFbVUjkeqs9qU5xxNU2FZOO1CuK?=
 =?us-ascii?Q?XcGxCn+++wTRhZaxyZnrSXh1WN1YauBSySQg98VIeGJOVP1WWoiiL8dxkbcE?=
 =?us-ascii?Q?RgErud8jqOS7eOeijUjZYk3aUceRPnIcDK6lu4m2ycGwsgvtXF00nkCL4kWO?=
 =?us-ascii?Q?/AXGR0MSLrZDF+IgOrFSB5XiNta9pv72JHcy/IKayGzYxwohEMtVjKztZ77M?=
 =?us-ascii?Q?idFqRosJrxo6Fx4WM0P7qgOPVBwZsMX4239KYF/40sjYBnvGLS9fTNo2sGMA?=
 =?us-ascii?Q?n3vCIvcAGwK9lMqfr+05wvf2OVABbe4B9TbhfBu9RBuM9BFnrpnNYswROSg5?=
 =?us-ascii?Q?gMIhaqmpBEqsaJsg0bgOqgoG6mwIZk+LoEEy/yxTLbwMFeFdSnIezbEhzKsr?=
 =?us-ascii?Q?TB+Bzr4Tx9OHhMaBSsgSag9tp6d+GO0PK3csDM+PXMKwOEC1gOurFfHEdFqr?=
 =?us-ascii?Q?qauiPhd/rOn9ng27K5S2XRtAuTy8ql7cslN7Tx5EKy5/tlcxu42LvkYEaH/7?=
 =?us-ascii?Q?DHWbm6cOM4FQu7/WW7imKow3S+pv8s061qrnDgRqR1RPEY3pr0u04yuPaGMQ?=
 =?us-ascii?Q?Wizrh5PvANXfXu/qa0kfrcMYvH+bEO9ame3ylU/mIONVrcl0t/4TERFu0n+2?=
 =?us-ascii?Q?0i/Ca42mmkyeOSwgtMnUl6lrJYIap93XXIOnGvd10GxqzTa/V3GCLezCSn57?=
 =?us-ascii?Q?QCXLIK9WunSesLEDb7M2chFMNkLKy5Cl3w4zis+tSrhh/rW0NXKpyVJQg24i?=
 =?us-ascii?Q?4Dy5iEhCPa6d0AvF92lOmM/I5PvnQ/Cl1yr0D/4dzxSid80aJIELBPv7mQT5?=
 =?us-ascii?Q?CEJXMmpY+ovKFWhjSKDapqbJZ0dDAOqYA0XZtLtaqaHvswKq7zbqwyKoNUuZ?=
 =?us-ascii?Q?WO3Vq4ecOAGgN/v7rTZ7eTVkfB/G+3vaS84TONqZ72BOlie+G+gMMCnR51jN?=
 =?us-ascii?Q?BpTRc5Om18Mzc3+B1LrAQDLK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c4626fe-b84b-4e6f-df95-08d950b63587
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 04:22:56.3516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/6IvqdgmPwNI0rlchGFUc0D+7c+X+QalCVI/uA/X/eJniN+y94DAd8XsfaHeXS8f4moeurrtpuaeHFvhPFAkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2189
X-Proofpoint-ORIG-GUID: WNX3gRDd4OGdfrjD9UldyMjh63PLVOwb
X-Proofpoint-GUID: mXtirwlJZmBB5PWt_hFPjKDvP205BZjF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-27_03,2021-07-26_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107270023
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When dhclient is used with ifupdown and in the /etc/network/interfaces
file is something like e.g. "iface eth0 inet6 dhcp" the system does not
boot but hangs at the after dhcp configuration of IPv4 at the stage
where IPv6 should be configured.
The reason seems to be, that ifupdown calls the dhclient in a blocking
way which leads to a permanent block of the boot when no DHCPv6 server
is available.
A similar bug in Redhat:
https://bugzilla.redhat.com/show_bug.cgi?id=585047

[YOCTO #14117]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-1-option-to-dhclient-on-upping-an-i.patch | 65 +++++++++++++++++++
 meta/recipes-core/ifupdown/ifupdown_0.8.35.bb |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-core/ifupdown/files/0001-inet6.defn-Added-1-option-to-dhclient-on-upping-an-i.patch

diff --git a/meta/recipes-core/ifupdown/files/0001-inet6.defn-Added-1-option-to-dhclient-on-upping-an-i.patch b/meta/recipes-core/ifupdown/files/0001-inet6.defn-Added-1-option-to-dhclient-on-upping-an-i.patch
new file mode 100644
index 0000000000..e374d8ca59
--- /dev/null
+++ b/meta/recipes-core/ifupdown/files/0001-inet6.defn-Added-1-option-to-dhclient-on-upping-an-i.patch
@@ -0,0 +1,65 @@
+From e2263b58d7733835355d7b46c3caa96d911a4717 Mon Sep 17 00:00:00 2001
+From: Simon Schwarz <simon.schwarz@infoteam.de>
+Date: Fri, 6 Nov 2020 08:53:20 +0100
+Subject: [PATCH] inet6.defn: Added -1 option to dhclient on upping an
+ interface
+
+This prevents hangs on startup when no server is available and dhcpv6 is used
+
+Upstream-Status: Pending
+
+Signed-off-by: Simon Schwarz <simon.schwarz@infoteam.de>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ inet6.defn | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/inet6.defn b/inet6.defn
+index 73dce24..25022e3 100644
+--- a/inet6.defn
++++ b/inet6.defn
+@@ -29,9 +29,9 @@ method auto
+         if (var_set("accept_ra", ifd) && !var_true("accept_ra", ifd))
+     /sbin/ip link set dev %iface% up
+     /lib/ifupdown/wait-for-ll6.sh if (var_true("dhcp", ifd) && execable("/lib/ifupdown/wait-for-ll6.sh"))
+-    /sbin/dhclient -6 -v -P -pf /run/dhclient6.%iface%.pid -lf /var/lib/dhcp/dhclient6.%iface%.leases -I -df /var/lib/dhcp/dhclient.%iface%.leases %iface% \
++    /sbin/dhclient -6 -1 -v -P -pf /run/dhclient6.%iface%.pid -lf /var/lib/dhcp/dhclient6.%iface%.leases -I -df /var/lib/dhcp/dhclient.%iface%.leases %iface% \
+         if (var_true("dhcp", ifd) && execable("/sbin/dhclient") && var_true("request_prefix", ifd))
+-    /sbin/dhclient -6 -v -S -pf /run/dhclient6.%iface%.pid -lf /var/lib/dhcp/dhclient6.%iface%.leases -I -df /var/lib/dhcp/dhclient.%iface%.leases %iface% \
++    /sbin/dhclient -6 -1 -v -S -pf /run/dhclient6.%iface%.pid -lf /var/lib/dhcp/dhclient6.%iface%.leases -I -df /var/lib/dhcp/dhclient.%iface%.leases %iface% \
+         elsif (var_true("dhcp", ifd) && execable("/sbin/dhclient"))
+     echo 'No DHCPv6 client software found!' >&2; false \
+         elsif (var_true("dhcp", ifd))
+@@ -154,9 +154,9 @@ method dhcp
+         if (var_set("accept_ra", ifd) && !var_true("accept_ra", ifd))
+     /sbin/ip link set dev %iface% [[address %hwaddress%]] up
+     /lib/ifupdown/wait-for-ll6.sh if (execable("/lib/ifupdown/wait-for-ll6.sh"))
+-    /sbin/dhclient -6 -v -pf /run/dhclient6.%iface%.pid -lf /var/lib/dhcp/dhclient6.%iface%.leases -I -P -N -df /var/lib/dhcp/dhclient.%iface%.leases %iface% \
++    /sbin/dhclient -6 -1 -v -pf /run/dhclient6.%iface%.pid -lf /var/lib/dhcp/dhclient6.%iface%.leases -I -P -N -df /var/lib/dhcp/dhclient.%iface%.leases %iface% \
+         if (execable("/sbin/dhclient") && var_true("request_prefix", ifd))
+-    /sbin/dhclient -6 -v -pf /run/dhclient6.%iface%.pid -lf /var/lib/dhcp/dhclient6.%iface%.leases -I -df /var/lib/dhcp/dhclient.%iface%.leases %iface% \
++    /sbin/dhclient -6 -1 -v -pf /run/dhclient6.%iface%.pid -lf /var/lib/dhcp/dhclient6.%iface%.leases -I -df /var/lib/dhcp/dhclient.%iface%.leases %iface% \
+         elsif (execable("/sbin/dhclient"))
+     echo 'No DHCPv6 client software found!' >&2; false \
+         elsif (1)
+@@ -325,7 +325,7 @@ method dhcp
+ 
+   up
+     /sbin/ifconfig %iface% [[link %hwaddress%]] up
+-    /sbin/dhclient -6 -pf /run/dhclient6.%iface%.pid -lf /var/lib/dhcp/dhclient6.%iface%.leases -I -df /var/lib/dhcp/dhclient.%iface%.leases %iface% \
++    /sbin/dhclient -6 -1 -pf /run/dhclient6.%iface%.pid -lf /var/lib/dhcp/dhclient6.%iface%.leases -I -df /var/lib/dhcp/dhclient.%iface%.leases %iface% \
+         if (execable("/sbin/dhclient"))
+     echo 'No DHCPv6 client software found!' >&2; false \
+         elsif (1)
+@@ -397,7 +397,7 @@ method dhcp
+   up
+     [[Warning: Option hwaddress: %hwaddress% not yet supported]]
+     inetutils-ifconfig --interface %iface% --up
+-    /sbin/dhclient -6 -pf /run/dhclient6.%iface///.%.pid -lf /var/lib/dhcp/dhclient6.%iface///.%.leases -I -df /var/lib/dhcp/dhclient.%iface///.%.leases %iface% \
++    /sbin/dhclient -6 -1 -pf /run/dhclient6.%iface///.%.pid -lf /var/lib/dhcp/dhclient6.%iface///.%.leases -I -df /var/lib/dhcp/dhclient.%iface///.%.leases %iface% \
+         if (execable("/sbin/dhclient"))
+     echo 'No DHCPv6 client software found!' >&2; false \
+         elsif (1)
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
index ae175848b7..16807eb675 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https \
            file://99_network \
            file://0001-Define-FNM_EXTMATCH-for-musl.patch \
            file://0001-Makefile-do-not-use-dpkg-for-determining-OS-type.patch \
+           file://0001-inet6.defn-Added-1-option-to-dhclient-on-upping-an-i.patch \
            file://run-ptest \
            ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'file://tweak-ptest-script.patch', '', d)} \
            "
-- 
2.25.1

