Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68.1795108929430540647
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 09:22:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FiNpvklj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=57839d567b=saisireesha.t@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJF8LhF2338873
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 09:22:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Jf2sDXwAa
	cAup2Dc2+cjQBUHO5gMYyuJMdwgknCqL0Y=; b=FiNpvklj0ruDRbQ+HYsPTL4qp
	xnNe9ta7y7yzDOPQec32dkvSdwWwyts3QCbjR5wHC8dxVOe25ZPo8ENgGlGKQA65
	HLzr3PFM0OFyM5u6EnfMPA/gvJBW7gFzzH74AFi1NhhSLOWaZLkJ4egPkMud26mh
	wKlrwATsZzFRBNh4FwYq58l1ASJ2QC3+YK7r/i/UA54a7uzfO9UpBHjT8FDOixi+
	8wSnYePSsnBVbIjTML5PKuIlTZaYhJhAv6mzq28ZxlqVc2p84+2/qQ041Dzfiunl
	OMcTEqQqne4jTYrBnzbbd3R7VtrF4nwoHRrZsxLindcbS0kWQb/c85U7v17RQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020096.outbound.protection.outlook.com [52.101.56.96])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j0yvgere6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 09:22:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okRnXRBwQ33i9k9I+JMUSgxsAcUZjYZwSrICrwbratUgIKdzW3wH3cdOZNDP5XFl5xr6WMlZmfB8Aoo7Xj1zc1HC8LQ4hH8cB9v9YCW9SY2fogz4MkaMS8ibHIVKtL4BKuvF1OK+tKnk2YCkPCUjQrYGjqPf8sdtvLLUUMHuM0Vq4UvAVjD5o+e2rHfEEOq7TJofmBd8ZypJZsd9Kd3pwIicBzfHd4tw989xX3mMPZGwm/6BLkyBvLvEBoF4WU4qZbV6kOpqSUQqsJKXpnmCfTcb53Buw8hQS/X5qHPz4FufYFj4jkZNe7iHpF9/HKIOJOROHJ+wbLJyTsD59rZNbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jf2sDXwAacAup2Dc2+cjQBUHO5gMYyuJMdwgknCqL0Y=;
 b=LQF7nYIqwnJGzaOVT+4D5NYkrMj5ByQ+lYHcZ0y/mNhbYIJeCs5oo4/mim5qnVgNJ27WzjXSAqb/D94Y0tgBQET9M8+Zp31XJcr7svytxAOgreQTgRInIQPTUsg1+uyiQ6oU4S2eb1Z+RhnA+m/QVcCkuDGTsfFZTQCEANTG/4Lg32V8QPVMK3qTshoQVUF8OtDjVnpNhuy4DgYuVfsHGTjePKNHmI5ag5xA/IsJemwyY37I2nDpz2HGa8sCRbv/5/cLBVszhmHuKX/olF4JidkwbOtg1FXlQjYDICnxULymueRjlna2IzDJ+bPlZ5Pqj98SCpCxm4HxHb7bS3MRUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA7PR11MB9594.namprd11.prod.outlook.com (2603:10b6:806:4cf::24)
 by MW4PR11MB6809.namprd11.prod.outlook.com (2603:10b6:303:1e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 19 Nov
 2026 17:21:57 +0000
Received: from SA7PR11MB9594.namprd11.prod.outlook.com
 ([fe80::8471:23b1:c4ab:7102]) by SA7PR11MB9594.namprd11.prod.outlook.com
 ([fe80::8471:23b1:c4ab:7102%3]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 17:21:57 +0000
From: Sai Sireesha T <saisireesha.t@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr, Kris.Gavvala@windriver.com,
        sumanth.gavini@windriver.com
Subject: [blacksail][PATCH] libsoup: fix CVE-2026-0719
Date: Thu, 19 Nov 2026 11:21:43 -0600
Message-ID: <20261119172143.7613-1-saisireesha.t@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0092.namprd04.prod.outlook.com
 (2603:10b6:408:ec::7) To SA7PR11MB9594.namprd11.prod.outlook.com
 (2603:10b6:806:4cf::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA7PR11MB9594:EE_|MW4PR11MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: afb63595-06d1-45f4-bf66-08df46619cef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|10070799003|261009223027099003|261021130227099003|18002099003|260925022911599003|260925021911599003|13003099007|261013131602099003|261021135927099003|261021133027099003|261022075727099003|261021123027099003|261022113327099003|261022105027099003|261026130827099003|261026135527099003|261026121527099003|261026140227099003|261028144727099003|260925021311599003|261102123227099003|261021121427099003|11063799006|56012099006|10067099003|261022115727099003;
X-Microsoft-Antispam-Message-Info: i1xziV1Y6aEGVOtHY0BwX/MqmSTqqRWUKdnVZsTFUoAcr9pHhJo9JkSKkpRlVr46CVyVlPTFnq8xNbPqIEpHGL5jEVmGr2h5L9H6o2GSwhRyx4KNTbl8xYxB5deUXYTphRDilROzJ8yOJnm72Mdq5AFXk7iXJ5po9CiEzK7rUmx9ubQaitOaLS5xY/XmW6PK3EAGwqvPA1ioM8haZ62SSoUOwMaHZ82vVJzwqyYzGBvLC2ZdgaEqJyZa+MueGk4T9GKtVNAG1pNW00nhX/1jCOb0yEqRf4bHy+B0vOTsCvC50OXzI2qyScFiAYmqkwrFSbbzkHIqWPJi0xUPy6336xDapksApGIxe2Dm5SCYdEUrL3jv4GW1+/H7GHfZSahLa97tVPo/hHqw4ViIOSWvrG0uozZuX6jFPUUgLyrG+fDzEY11Fa+QAhDF99M1XCpeCmtEPq9XKUocvDN/u7sFTTDsWh4qkvWEmPCdeR7dmGaHaQQ/A6MRhijsS37s5g0DX4QFTIucQRy8s4r8XOCA43KKcHInnII9cfSBP1z51uaxydwg6iCdqVjUwBh3vNWHB5HhYoMrTyl+po8gM+SVr9Z3yfNxW2QCx6IdvmgEXdnXuB0cv0ASwWOGj6uGTnaO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA7PR11MB9594.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(10070799003)(261009223027099003)(261021130227099003)(18002099003)(260925022911599003)(260925021911599003)(13003099007)(261013131602099003)(261021135927099003)(261021133027099003)(261022075727099003)(261021123027099003)(261022113327099003)(261022105027099003)(261026130827099003)(261026135527099003)(261026121527099003)(261026140227099003)(261028144727099003)(260925021311599003)(261102123227099003)(261021121427099003)(11063799006)(56012099006)(10067099003)(261022115727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aWm1BPmFLde8Nk7rGs4wsMjheVUnREJuMZBsZRe/8JG50VhasrRDzLHZyVso?=
 =?us-ascii?Q?chrji0EBoroRZKcvXLFhRY0WqMVBrPZrRuLtMJw0Lk/F7btdGzxj8P0c8B7g?=
 =?us-ascii?Q?L87RmX+pVs08Z/G+q+mkhKXPzV6erSmih+dEXfcGf4pjtDJj7glIo1KnJDVo?=
 =?us-ascii?Q?U9chuv3nIGBlCCamA8m2khfOeu4h/BxsdHXtcrgXVrCj8BwHz3KGCAWyf7e8?=
 =?us-ascii?Q?tp/S61pu5b17JU6xthoOk2AxZFQLldpDzBJCspmbULi8+/dvoGIPF8XS+Jq6?=
 =?us-ascii?Q?PHiQPIYnSAA81K6emKlRAr0K9t3VpCAaHyYEIA/SVD2MBfCo1jlsrxJhV9O/?=
 =?us-ascii?Q?WGEcXP6E2iFohZIx4vfNdz9l9TJ0mbDSQznRDyYJ4CSJuNmYw5m8YUHJD7JN?=
 =?us-ascii?Q?8gANWWdSyc5ujUqzJkdPNbyDI491ZSv3l8oRwGtj5YhfFQOux28z9CjjyurJ?=
 =?us-ascii?Q?CobGNlNcqwKBQ94FkDVnvqr3UUMlahhfGYrf58UERvQyIUiiQvBy+5vPDOk7?=
 =?us-ascii?Q?b9ZYb6PIi6ij5L3dYSDQ62XU0qZWTC/NrZTy8dWriUoRyzcnq0K3RUfbMp8A?=
 =?us-ascii?Q?m54ZdYCgn8azn4Zs5WzsyDakdMvKi7R38vv/H5+s97f5/gad/VooBtCCPtBe?=
 =?us-ascii?Q?XYkn6g4yWHY8DCAeDN+4hMYFvAvmGXZlsLthpxuIH1tTJQlU8lZZNLZuaDlt?=
 =?us-ascii?Q?m+OWIpOkeZg4YGansUn7SN7h++Knp8egCtJyg7OulO+9dSo4CcziPudcqbm0?=
 =?us-ascii?Q?5oGXQNhUsaBgYCGc8j8Z+dMEnQgR+QKQVqTvJVBkVhG9wBrBCpYcqyarkMvP?=
 =?us-ascii?Q?ez4+4QjE72PhTF37dJGhZyHtu6rO8eWDOXeVrrpuSNWWFhkcnlVqTk/zYBqD?=
 =?us-ascii?Q?Zl2/Md+BxiPI0fyDzu3nZUe3A+RJcuPYGWoCBF31bA+q/OW7X6acTrP/DxcU?=
 =?us-ascii?Q?kkpKCOBhL20QBI0G3hQmDefn6OCDwaJ7sqNE+MtEW+vnw0w9SxefVGR3IUBi?=
 =?us-ascii?Q?se6j9EA0TtMQB9rj9khuUcm41t6f7lG5QAd5SlyhSjAmsifjga7c/tFsQ2we?=
 =?us-ascii?Q?Gfi9lMp8ncR88dnSZvEHRqBvDrVEJsY2OZ+PoZhKaQ4uQEqXt5YHV8l80BSx?=
 =?us-ascii?Q?+ogVjQARN0i7dmdKJpJEVkqbDO2gh9sfnsJoKvW08RMtEXxgxpdfZrc9mD+P?=
 =?us-ascii?Q?Iqpjb1p6azirnC3T4/KrGE9wpmkRgq/C+XN58ZV2Xo9oRSmqA1FKWFoIVtP+?=
 =?us-ascii?Q?yrggBVkvZDjKMh75+JGu8yJJQQYO30j1OWhyYzz5s5YjU8GzX9Y1Ii6K50Jx?=
 =?us-ascii?Q?nH3bwa9jKwHctoxmxYhO2X7sA4lWJMihlROXniekRlNNmkZ6frHrTwYzzo3z?=
 =?us-ascii?Q?XVFTrOFffWhgZV4NBJ2CqjO9cPDmVwa81PCeOkMiR45L90PnpK54qVid9LkQ?=
 =?us-ascii?Q?VDyTfkdkNYIq3S+xI35pdp9kA1PD6J+zn/GMthtk/xJk2PW8+98Uiz7lVJTR?=
 =?us-ascii?Q?r1mvz5lXRhn2t9sBTFUlSy09G5vj6dsvMjd74fjiL1rkHlAVvgKhEI6k/M/z?=
 =?us-ascii?Q?Lr0I+7bsYqTeS0zwpg2TSxaT6en1wRSgnaZb538QZ985gD06YF37wwMpWY8o?=
 =?us-ascii?Q?2iuYihzHFYkRMxDBUtxIRjE1tSUo+RhY1Pm39RDLdZcmn0hnPBI7B3QwGaaE?=
 =?us-ascii?Q?orZrQeddcAVp3ZMr2iNMq0CxGmUsByk/W4WPoc6aLXLH6NxBMWrey38dDUWX?=
 =?us-ascii?Q?0VWixjVDI2IEvY/lzhOloZUPECL52rLd0UxbeMVyX0jQvcWsdAPWM7eMhGIc?=
X-MS-Exchange-AntiSpam-MessageData-1: L1+DgycVBDbSI16FbZ1thkf6/3oRGpNh9Hk=
X-Exchange-RoutingPolicyChecked: x0ZUvsKg+YmsNJ2GpfFK/qNXk8HkI0xbm1U5c3MFC8jNts05TODxCyCSIqVeIazcWufmvYoSoyBV8YoV3e7cLQJu8L/uEaURTfanQdpUJkDF64iSv905IkUNxYYtXdaJ8WlrD0Eiec01sJwGc74rhjzIVxdnqlXmZRsef6A2wmsd7WpgiZQ7a53NnSD2/YHFAzqcVbC29P3OPTeK2w6Ku3qwp1Ev6TK0iEAnnFk2BoRo2rt/rFjbZs/HR9SYePHqgMcQ6cgetK0APyLZdO9sTXuynEfZOo55GWp0qokjj+jEymhV5fu4cZ1pG4oIxuu7UjZR7+zgFzPspYwBlc6K4Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afb63595-06d1-45f4-bf66-08df46619cef
X-MS-Exchange-CrossTenant-AuthSource: SA7PR11MB9594.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 17:21:56.9647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lvvwdw91zYDPiCfUrWGxyI8PWTDrVT5gq0RZidRpFwkOHywedgD8o6+stRndKCbN4+v156SZp+jLOUt8obfk3iI46Ir3oCmkseb7REWoDHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6809
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=EudHPicA c=1 sm=1 tr=0 ts=6aff3040 cx=c_pps
 a=NO5CczpcTQW1gtzKHD9VpQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=yMhMjlubAAAA:8 a=t7CeM3EgAAAA:8 a=iox4zFpeAAAA:8 a=fjap6yag92prjKDRmHcA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA2OSBTYWx0ZWRfX2OYmVOEavyth
 D/mLl1mY7zkU1pLwhmitlC5JJfop9W/9nvEOZabiRn51dLiIdH8seWcl3t+viEfTmoDaT7ucZhT
 z9r7DxwE/gQjAFrEKP2UtaU1dbi8feMOdCh8Yhc/sMsqBcyVa9Y9qY/NaIj/D/0ACd60INddQ1u
 VVcfR2rWDKWUUEYSelMfVy0tWUPlloO4Uj4coS1k8E5TrEih0gUOwbYWVEy+rdd89t9pBuH89Qt
 P0PvupY3rc/+j3Y70lorV+ZauE6Glt1/GSQJXnkWc0ykrja1vpcwdnXj+iOCBMm5n1QmJK+l9ru
 tzx1lyKVC6KUdiJw1PgRFRcRBqNOQ8JP/zjOPBgXH+wkhOCGCGkG6U9SA419ZvURrcwP0rhJo9w
 Gv59h13wOMvj0ygCTGD+yyqfGl+0WRNH2zOwgu1gSsvRJusryzwguWQqUufYutTfVG4WdtB8a19
 bv5cFOFiTMHKvPPHITA==
X-Proofpoint-GUID: 8nxUFn77pILOf-yPRhN3XxC1pJ2Q0zQQ
X-Proofpoint-ORIG-GUID: rJl4dz0lFhNXVKpPzn5ivRxRJSxzZQCj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA2OSBTYWx0ZWRfXytGY3walPtCt
 1zlvpDxOwXH2WuI8p85lZZ9iZVZ7GlV8b5SnQ8VWs8lxYfu0PL4dWCrC1ShudIKFdx2IKpxe92N
 YcbW2PD3dtgI9a+IcpShUJf69xlURWpEqjHO7cdR3f93VZ7D1GnG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 17:22:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250715
Content-Type: text/plain; charset="utf-8"

Backport the upstream fix [1], which explicitly mentions CVE-2026-0719
and was merged into libsoup 3.8.1. The 3.6 stable series was not
patched upstream, so a backport is needed.

[1] https://github.com/GNOME/libsoup/commit/1972635264f1d9ab1823c8b6becf921b4125b513

Signed-off-by: Sai Sireesha T <saisireesha.t@windriver.com>
---
 .../libsoup/libsoup/CVE-2026-0719.patch       | 191 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.6.6.bb |   1 +
 2 files changed, 192 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2026-0719.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2026-0719.patch b/meta/recipes-support/libsoup/libsoup/CVE-2026-0719.patch
new file mode 100644
index 0000000000..73e8121de2
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2026-0719.patch
@@ -0,0 +1,191 @@
+From 835d887ec7b37c45bda55df2cf575de5bcdcb652 Mon Sep 17 00:00:00 2001
+From: Mike Gorse <mgorse@suse.com>
+Date: Thu, 8 Jan 2026 16:19:37 -0600
+Subject: [PATCH] soup-auth-ntlm: Reject excessively long passwords
+
+According to
+https://learn.microsoft.com/en-us/troubleshoot/windows-server/windows-security/ntlm-user-authentication,
+the practical limit for a NTLM password is 128 Unicode characters, so it
+should be safe to reject passwords longer than 256 bytes. Previously,
+md4sum could overflow and cause an out-of-bounds memory access if an
+extremely long password was provided. Also update md4sum to use unsigned
+variables for size-related calculations, as a precaution.
+
+This is CVE-2026-0719.
+
+Closes #477.
+CVE: CVE-2026-0719
+Upstream-Status: Backport [https://github.com/GNOME/libsoup/commit/1972635264f1d9ab1823c8b6becf921b4125b513]
+Signed-off-by: SaiSireesha T <saisireesha.t@windriver.com>
+---
+ libsoup/auth/soup-auth-ntlm.c | 28 ++++++++++++-----
+ tests/ntlm-test.c             | 59 +++++++++++++++++++++++++++++++++++
+ 2 files changed, 80 insertions(+), 7 deletions(-)
+
+diff --git a/libsoup/auth/soup-auth-ntlm.c b/libsoup/auth/soup-auth-ntlm.c
+index af416fd2..0b8accd9 100644
+--- a/libsoup/auth/soup-auth-ntlm.c
++++ b/libsoup/auth/soup-auth-ntlm.c
+@@ -309,6 +309,7 @@ soup_auth_ntlm_update_connection (SoupConnectionAuth *auth, SoupMessage *msg,
+ 	gboolean success = TRUE;
+ 	GUri *uri;
+ 	char *authority;
++	static const guchar zero_hash[21] = { 0 };
+ 
+ 	/* Note that we only return FALSE if some sort of parsing error
+ 	 * occurs. Otherwise, the SoupAuth is still reusable (though it may
+@@ -355,6 +356,14 @@ soup_auth_ntlm_update_connection (SoupConnectionAuth *auth, SoupMessage *msg,
+ 		return FALSE;
+ 	}
+ 
++	if (priv->password_state == SOUP_NTLM_PASSWORD_PROVIDED && !memcmp(priv->nt_hash, zero_hash, sizeof(zero_hash))) {
++		/* This can happen if an excessively long password was
++		 * provided, in which case we don't try to hash */
++		conn->state = SOUP_NTLM_FAILED;
++		priv->password_state = SOUP_NTLM_PASSWORD_REJECTED;
++		return TRUE;
++	}
++
+ 	if (!soup_ntlm_parse_challenge (auth_header + 5, &conn->nonce,
+ 					priv->domain ? NULL : &priv->domain,
+ 					&conn->ntlmv2_session, &conn->negotiate_target,
+@@ -449,8 +458,10 @@ soup_auth_ntlm_authenticate (SoupAuth *auth, const char *username,
+ 		priv->username = g_strdup (username);
+ 	}
+ 
+-	soup_ntlm_nt_hash (password, priv->nt_hash);
+-	soup_ntlm_lanmanager_hash (password, priv->lm_hash);
++	if (strlen (password) < 256) {
++		soup_ntlm_nt_hash (password, priv->nt_hash);
++		soup_ntlm_lanmanager_hash (password, priv->lm_hash);
++	}
+ 
+ 	priv->password_state = SOUP_NTLM_PASSWORD_PROVIDED;
+ }
+@@ -604,7 +615,7 @@ soup_auth_ntlm_class_init (SoupAuthNTLMClass *auth_ntlm_class)
+ }
+ 
+ static void md4sum                (const unsigned char *in, 
+-				   int                  nbytes, 
++				   size_t               nbytes, 
+ 				   unsigned char        digest[16]);
+ 
+ typedef guint32 DES_KS[16][2]; /* Single-key DES key schedule */
+@@ -650,7 +661,7 @@ soup_ntlm_nt_hash (const char *password, guchar hash[21])
+ {
+ 	unsigned char *buf, *p;
+ 
+-	p = buf = g_malloc (strlen (password) * 2);
++	p = buf = g_malloc_n (strlen (password), 2);
+ 
+ 	while (*password) {
+ 		*p++ = *password++;
+@@ -1092,15 +1103,16 @@ calc_response (const guchar *key, const guchar *plaintext, guchar *results)
+ #define ROT(val, n) ( ((val) << (n)) | ((val) >> (32 - (n))) )
+ 
+ static void
+-md4sum (const unsigned char *in, int nbytes, unsigned char digest[16])
++md4sum (const unsigned char *in, size_t nbytes, unsigned char digest[16])
+ {
+ 	unsigned char *M;
+ 	guint32 A, B, C, D, AA, BB, CC, DD, X[16];
+-	int pbytes, nbits = nbytes * 8, i, j;
++	size_t pbytes, nbits = nbytes * 8;
++	int i, j;
+ 
+ 	/* There is *always* padding of at least one bit. */
+ 	pbytes = ((119 - (nbytes % 64)) % 64) + 1;
+-	M = alloca (nbytes + pbytes + 8);
++	M = g_malloc (nbytes + pbytes + 8);
+ 	memcpy (M, in, nbytes);
+ 	memset (M + nbytes, 0, pbytes + 8);
+ 	M[nbytes] = 0x80;
+@@ -1200,6 +1212,8 @@ md4sum (const unsigned char *in, int nbytes, unsigned char digest[16])
+ 	digest[13] = (D >>  8) & 0xFF;
+ 	digest[14] = (D >> 16) & 0xFF;
+ 	digest[15] = (D >> 24) & 0xFF;
++
++	g_free (M);
+ }
+ 
+ 
+diff --git a/tests/ntlm-test.c b/tests/ntlm-test.c
+index a92a21c8..4670532a 100644
+--- a/tests/ntlm-test.c
++++ b/tests/ntlm-test.c
+@@ -714,6 +714,62 @@ do_retrying_test (TestServer *ts,
+ 	soup_test_session_abort_unref (session);
+ }
+ 
++static gboolean
++long_password_test_authenticate (SoupMessage *msg,
++			         SoupAuth    *auth,
++			         gboolean     retrying,
++			         gpointer user)
++{
++	size_t l = 65536;
++	char *password;
++	char tmp[10000];
++	size_t i;
++
++	password = (char *)g_malloc (l);
++
++	for (i = 0; i < 10000; i++) {
++		tmp[i] = 'A';
++	}
++	for (i = 0; i < l/10000; i++) {
++		memcpy (password + i * 10000, tmp, 10000);
++	}
++	memcpy (password + l - 1 - 10000, tmp, 10000);
++        
++	soup_auth_authenticate (auth, "alice", password);
++
++	g_free (password);
++	return TRUE;
++}
++
++static void
++do_long_password_test (TestServer *ts,
++		  gconstpointer data)
++{
++	SoupSession *session;
++	SoupMessage *msg;
++	GUri *uri;
++	GBytes *body;
++
++	session = soup_test_session_new (NULL);
++        soup_session_add_feature_by_type (session, SOUP_TYPE_AUTH_NTLM);
++        soup_session_set_proxy_resolver(session, NULL);
++
++	uri = g_uri_parse_relative (ts->uri, "/alice", SOUP_HTTP_URI_FLAGS, NULL);
++	msg = soup_message_new_from_uri ("GET", uri);
++	g_signal_connect (msg, "authenticate",
++			  G_CALLBACK (long_password_test_authenticate), NULL);
++	g_uri_unref (uri);
++
++	body = soup_session_send_and_read (session, msg, NULL, NULL);
++
++	soup_test_assert_message_status (msg, SOUP_STATUS_UNAUTHORIZED);
++
++	g_bytes_unref (body);
++	g_object_unref (msg);
++
++	soup_test_session_abort_unref (session);
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -737,6 +793,9 @@ main (int argc, char **argv)
+ 	g_test_add ("/ntlm/retry", TestServer, NULL,
+ 		    setup_server, do_retrying_test, teardown_server);
+ 
++	g_test_add ("/ntlm/long-password", TestServer, NULL,
++		    setup_server, do_long_password_test, teardown_server);
++
+ 	ret = g_test_run ();
+ 
+ 	test_cleanup ();
+-- 
+2.54.0
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.6.6.bb b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
index e5c2d18ded..c5805dd22f 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.6.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
@@ -17,6 +17,7 @@ SRC_URI += "file://CVE-2025-32049-1.patch \
             file://CVE-2025-32049-2.patch \
             file://CVE-2025-32049-3.patch \
             file://CVE-2025-32049-4.patch \
+            file://CVE-2026-0719.patch \
             file://CVE-2026-1539.patch \
             file://CVE-2026-5119.patch \
             file://CVE-2026-2708.patch \
-- 
2.43.0

