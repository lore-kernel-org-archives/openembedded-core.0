Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4568.1795145383158670816
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 19:29:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WrDgrJQu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5784f9bc1d=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK3SwRJ2644237
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 19:29:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=2bjwREYZojsdu+sLvMOJzJY/LJh5QOl3AbT5iCFMpgY=; b=
	WrDgrJQu9Os2aQKO5W7OITCXTUFb/rq187gbsNTDXKbi4myE+/Q4MptkIHnyk2Xd
	WELtvGC6MlHu/jjbL6DSsUfJLbueA3XGYNgvpKA0S6V2wuNod1nNTdgIH/877rd4
	PhrvpGNgXJ9fCX3RAboFjS81gpYmOeXImAbnhS6PO9Oe4oHmL2l13vqsM+lA3+nH
	04UPYHoiZKVCGYzPHapEoJ0jov59fppUDgM8LO25MA4Q73jGhDQVnlNDNyr9epbj
	4pui9VrZwbWx9p9N2PtqmaS2JfuHaH2L3pMvIiKxVd+lXJZrYyWJwiK+JDR467Jn
	aqrwrZHTMCD+Kds537cZlA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020102.outbound.protection.outlook.com [40.93.198.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j0yvdr1d7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 19:29:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E9AtCD/9CNLIaKVCH44oQucPI7aYaLccJSyL2wPbm8qJLs5X/ubsNUwnLfLqR0SywEcpZMUBHGH6p6JDAR9krKhurXxnVjLFjZcZs6APIoGRk3tFqP1RgVVDfLpnGWdgFvKrk1xbgz0zvUVLeQkq3e4iP7Ys4DSvo15XA9+zPAtULPEFqEcq5D/U2tj3uONwaiaZiy58spwk+DBK7nEIcSXyn0uEsCnOKC73XfCLcuRnnMpVHr201SAjF7xATrXQe2xD/iRPsWryY5kKJzJRVX9uSXlMpJfK/klCHTN0HHqK5P2365ZpcZo+eM4NuUvGa5WaB6YyWOndVG0q3ujupQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bjwREYZojsdu+sLvMOJzJY/LJh5QOl3AbT5iCFMpgY=;
 b=kWawcS0/Hqyvhj7UKPDRlgIE0E+KAFKg76PcmXeFZOL0Z0StuwIUbFkgZvYBRMGYZMgvqZMgEZqOF2UCTvaMsxkmTxb4yT0mo+LAetV6xUTY53TQt0nIuw1JxCDRg/An1X/JJLnpk0DZx6QS+8vLW8aXaDdHQfgYS/9RuzvpF3U1bPrK0Q9XPDOf6/tIdU7fbtAKQYp36V6drdMHQYlWKJinVBND6mPw4zFZTKjd/Kgbdf0ol9vmbIEk5Ei5s+c/+9/5LBN2iHk1VW7VLn9ZbrErOwQmVU+sYWt7bY51/8OhZjEIhwUxt1+gYvZHuhf0TmDeYJR0YVVf+koMx3KY5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH0PR11MB4774.namprd11.prod.outlook.com (2603:10b6:510:40::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.10; Fri, 20 Nov 2026 03:29:07 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%4]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 03:29:07 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr, alex.kanavin@gmail.com,
        sundeep.kokkonda@windriver.com, Randy.MacLeod@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [scarthgap][PATCH 1/2] rust-llvm: build and install the LLVM shared library
Date: Thu, 19 Nov 2026 19:28:45 -0800
Message-ID: <20261120032846.2692732-2-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261120032846.2692732-1-sunilkumar.dora@windriver.com>
References: <20261120032846.2692732-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0189.namprd05.prod.outlook.com
 (2603:10b6:a03:330::14) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH0PR11MB4774:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fa06035-618d-4430-8b64-08df46b66eca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|6133799003|18002099003|22082099003|38350700014|5023799004|11063799006|261022105027099003|261026121527099003|261026140227099003|56012099006|261028144727099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261102130727099003|10067099003;
X-Microsoft-Antispam-Message-Info: nPu4O8bzhutCGLDpUiXHByOqGTIe+hfSf1cBzgbBQpU48wlTUE79pS29irWEQn+WM/5NF0BFyaCJW85HyDJ2iCr+QLnF0P6D2ImN02Ih6Nd5HwK/dGjqamJOkpVdxUTdBnP2sIaX0SpdXbh6uRN7d25C5uHIZu4UJcrbA1UGi/WcJdvEy5bhA4w1+K1sLi8VbreoHAm3RhFJg61y+axjHCGolmmgszbGXVsonB9SXJIvrfewrqRAMWMCFg/Ne9nOKDerHn7sHmzH5mN7YS27cPuiwhQjvcDHkrak7h+abU6v+/iUw7q5uprDVVFocXF+Vnm6K7Cn6TPoJEPiZAeHcdYEK28eqvKewgQRzkBIZjKuVuWxvVL24jUSBrTL44GhLwTwb/1hUu0u67GyFrtw5OdwDolcL2DoBc0MowV84tl5hsSB+ufZkwku2ZQlYrQYmUoofkV94iUBZH1xSyqC9JVwGF8t/VIY+Og9Y613ZlyUt2MoNkFkmijlXeigWyHgJQhw9u2YIox6mNk0byrPedcI1x2B186buJd9vZCUpjhK2jVDvMpb+Ggq9Zkvp+sISACw0s7GnkO2vgkDECkZbDbynid/d8Mc2tD1MRFqmc2anxeO0hdK9SV2/eFH6QDU4Ek1O4znSdeRBVBFbGBntZ3umILl3CyGbgEtkwxj+ls=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(6133799003)(18002099003)(22082099003)(38350700014)(5023799004)(11063799006)(261022105027099003)(261026121527099003)(261026140227099003)(56012099006)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261102130727099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p2fWTD8fVM7l9pGQUxXU0XXPlf8kiWMNEbMn+kLQYRBI5pPwri6IjB4os4bN?=
 =?us-ascii?Q?hWtG5AOjY0cnz/g42m40giht1VSLrcVS/1+xQlPdTDO1t33ZYyFgJjKQROvl?=
 =?us-ascii?Q?YfbRjsPuu6LfPVIfXpIjEbtE/B2LEcNdG/XCjrzEtJLn1p35emI7iiMQ+O5Y?=
 =?us-ascii?Q?z6kX6a9dJEdlHyY78WPIxyw5BpT6fcc7tL+VvKEJ3nIRhh+0hPgxBSn2/pbp?=
 =?us-ascii?Q?DZbY86wYp+qpv6Ob+RJAKhBfSOiWY8ltmUT3ZUqEz13GkQZaajp++pZeaKeB?=
 =?us-ascii?Q?bzgQw5FfnF45k8PcMM+9Dm7IH575lakMxvTHL51zbx7h/Cczb5ay4eOldU1p?=
 =?us-ascii?Q?/fA2TwtHG5x3lQ38GwcLIokVJGF6ti152c0M4wduqnxFl3Yt6uOzURg4/6Ks?=
 =?us-ascii?Q?BfX0vwMe3ki8dznaoIRxj2eFelTKJy/zhVEL21yZSQxu585OPMjFjsQLd0XG?=
 =?us-ascii?Q?oAfiR8Wu8PQOtr+B290uWAbhYabVXVx+eThhtqfaNydmpzyewCUvPRG2hXMM?=
 =?us-ascii?Q?eFUgX5p7//bhU8pF0iwVghLn05ET2kJq37/4cUs6Q+jSrz055tI/3ZCJmIoi?=
 =?us-ascii?Q?CN6XcZ5SQ9Xl/Yt5ETiZmvPMh6U+nrpkDqu5bfMt0s1vyJkhaTy4eyjaV/Mz?=
 =?us-ascii?Q?sQ5Hnu1AdW1Kb+Gfqk6g2sWxqycmJKa6jL02eqUIh6KPtmQ3eeTPNOmrt2/G?=
 =?us-ascii?Q?w15sOj+WEiaU3SQbdubezZGtWdFowEEzoxw/wChnpDW1ePKpttIY8iD20C3X?=
 =?us-ascii?Q?ipXAd9IhmlDiYMBBlSbAYNjKZcFE8wwJ2VeQ9FxiDKXBugXWFLB9gtEg4JJE?=
 =?us-ascii?Q?FWl5fZngFL9Wiuw6afYE4idtkg6npnTXw9+FZkdL6J33gGxGwp/xJ0TG8hN5?=
 =?us-ascii?Q?39noGlkBo7mG5gZl4KDHKnkQE6vInPFCYhcw2zl2UR4gR3SYS532DYkAn/Sr?=
 =?us-ascii?Q?nvGG78mjZn8M3Yy/GS4jbU3SCV0MUmWCukvHI4Joud3qWZTagyc5KjEDE1O5?=
 =?us-ascii?Q?cX3C/d6UEw+V85nSsrPnGoepAzEDcVdO2C+GtVo/6wf8Px+cdjcldqAFO6iN?=
 =?us-ascii?Q?J0Hc+BG1u0mrYCA46edLi7Xsp1B9tle8+kVPNLVYjdGZjCv9O4xaNgMRJXbj?=
 =?us-ascii?Q?tk5q1zApHMy/u4lBefLFTWssrZyBbq7lOTyVMpAy9sB9QHftGt2F/oR4UtDH?=
 =?us-ascii?Q?JfVRUCPP5IuDEL1PUO6QqAv6qhBBepch1x5K33XqEy5dW/1IZLbybZcqWsLQ?=
 =?us-ascii?Q?O0nN0mhswM5sWhrHMRyCxlWS+8klc8hqxhH9UzB6vO4Z6+IwhjLtgCB/Gu+m?=
 =?us-ascii?Q?/QsItSBxj7eT9xbS5d2peE/XwZ76cDa9U44usQ1NZ60HQM10t9XEDDeeMGZs?=
 =?us-ascii?Q?AN6VEGar7HkNmFpEgMtpOU192eX6Yamxkh0e5OYtZh29V8DEmuGOv1c5Ppe8?=
 =?us-ascii?Q?kIf/1h/+3vMCXb/czACXDFDZLUOlgvd62oJs1NPBNmrZM6iiWfwI7VRJZ53m?=
 =?us-ascii?Q?NcDxvuvqlZPWGwQ15FYxZ+dZdbtYLA/UGkUuoextmslW6RK57R7fSfbpg4Fa?=
 =?us-ascii?Q?jJjC8sedPCIzSQGg+DIZ8SCV33OJyJlLj8af5/x+50BRTG2jV7puHpx7wtvK?=
 =?us-ascii?Q?NsmfVzIfC9YAMBNZULMym04ocXU6tI/DSADU0JsFckJvyjJQEURZhmvTScLW?=
 =?us-ascii?Q?eb5F6S0HzID//9grl1wTjjgxF5f8ZZsHCYsKRGuU54cyHNoSREzLQuljtsK1?=
 =?us-ascii?Q?0R0Sh+RLL5RRc4wm7jSDjYydWM/fHAY=3D?=
X-Exchange-RoutingPolicyChecked: S2KcUc+lwOvgTgwo0pTwzM13B9vGIDgR5G/G6gJQLzE1+46l/AhajC7U43ApzS+Ros73b6ihTHoD8jsC7vmZJ8lr+JPLOIkRy9/3Hevh8dbYhLee/fS0Ay61uFDNQDQdUqN6wPia/Gkl000w3jagKrj2n8biPV26679WlCHll5oyLgu+VRSUQH7gXpurHPOsMdCKoq7DOLD7cR/TQqLhFSq0FYVTGNg2L9CzKg+DJTRJeCs8jHnHkgthnWl+ivLCEvjtfZzd8Kigd4VKtEA5EqJyPY6u3+Logg0fTCaYsOzhTxutrPF2tldwcgs8tN5SXYlL/UL2443omgjVBA2aig==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa06035-618d-4430-8b64-08df46b66eca
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 03:29:06.8607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RCH/B6A38Y5AKwAX/Kohr6jO52g6ZMPqjwlpBkiVPcIxwkg93wvrcl8SvoogBr8jc/zpL7JnXi3fJQll0EMWnrGX3h7vRQO8XbusB7WbE80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4774
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=XL2l2ghE c=1 sm=1 tr=0 ts=6affbea6 cx=c_pps
 a=cPJgcE//urRiG05FhKkhAw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=YdBpLS5etR7EgKS05KcA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfXxPJ/G3NmGoJb
 i9NwBH+GybRsrWhAuvrAzVO4OHGHg3xQKUPgkyEcaXPSyGnY57ljA9lsTBxF4CixDki5oMlVHuW
 LgDvbprFlRkwb8ymkiUXmpFyxYIxcx/DmuH44DSQEzzmwko5hdIaIoH4QKsAkICJs2yooPGGEjw
 kr40Sc2ptIe5qMqYPWUhM9rvLCMifJYQDrJeYuo8BVuCQX/AOOSKWqbhVgIixrI0skjX3t1Fcm0
 5dHM06KmenfZo0LZmw4TAklHGmSU0rLC1nlcva3uhKDeJyUOS2tsP13hJClM9CMRvHdxOlr7MKf
 wBrZdxH1FL6fEe88gjy/f0BkO+xd6fstEyXasiS82V7AmdpLnAhAYbUA0qGLINu7LoFx+iDMIB9
 7IVU2PcuIeESi9jgPPXCFq1+3djocCRO5+WHsCYkMiuqdrjxHsZ2rpNffI0k6V6mSFL5NC9ivg8
 mc0TTH9Uf7R6WxyKvzg==
X-Proofpoint-ORIG-GUID: dZpVFUJpbs1efUEa8kRhJ1af6DB67_5P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX8J74mdJLbTzc
 J7Ay35OlEEKxvjF/zcSW+k2VTY2xWyic0ksQgZTZtW3NHaNuDUYprP/j3BBSb5rebGF6h5jrwUW
 JxnBCDJ0szI3GIVtLEshcO0Lo7O5LLL6wq8PBZ3td0EIMLwT9R6b
X-Proofpoint-GUID: GdrX6IdZDjKgsym_Og-tNLc6WwFyVqTh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 03:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250725
Content-Type: text/plain; charset="utf-8"

From: Sunil Dora <sunilkumar.dora@windriver.com>

For the rustc segfault in [YOCTO #16058] rust has to link LLVM
dynamically. On master libLLVM.so comes from the llvm recipe, rust-llvm
was dropped there [1]. scarthgap still builds LLVM for rust from this
recipe and it builds only static libs. So add the shared lib here.

Need both LLVM_BUILD_LLVM_DYLIB and LLVM_LINK_LLVM_DYLIB. With only the
first one "llvm-config --link-shared --libs" gives the per component
libs (which don't exist) instead of -lLLVM-17. llvm-config and
llvm-tblgen stay static, so the native llvm-config rust uses keeps
working. master had the same two options for rust-llvm [2] when it
still had the recipe.

LLVM installs the lib as ${libdir}/llvm-rust/lib/libLLVM-17.so. Nothing
looks there at runtime, it is not a default loader path and the RUNPATH
of the rust binaries does not point there. So move it to ${libdir} and
keep a symlink behind, the -L path from llvm-config still works at link
time.

Package it as ${PN}-libllvm. Otherwise the .so goes to ${PN}-dev by the
default rules and rust would rdepend on a -dev package. Static libs are
still installed, rust without llvm-shared is not affected.

[1] https://git.openembedded.org/openembedded-core/commit/?id=c116828a876853cd5b53f7bd4607f0037fef4ee4
[2] https://git.openembedded.org/openembedded-core/commit/?id=2b6a6d4199e4eed65f20351d077a04a7cf9da460

[YOCTO #16058]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/recipes-devtools/rust/rust-llvm_1.75.0.bb | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb
index cba41c739e..76335dc055 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb
@@ -47,6 +47,8 @@ EXTRA_OECMAKE = " \
     -DLLVM_ENABLE_LIBXML2=OFF \
     -DLLVM_ENABLE_FFI=OFF \
     -DLLVM_INSTALL_UTILS=ON \
+    -DLLVM_BUILD_LLVM_DYLIB=ON \
+    -DLLVM_LINK_LLVM_DYLIB=ON \
     -DLLVM_BUILD_EXAMPLES=OFF \
     -DLLVM_INCLUDE_EXAMPLES=OFF \
     -DLLVM_BUILD_TESTS=OFF \
@@ -84,15 +86,26 @@ export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
 do_install:append () {
     # we don't need any of this stuff to build Rust
     rm -rf "${D}/usr/lib/cmake"
+
+    # rustc links to libLLVM (llvm-shared in rust). Nothing searches
+    # llvm-rust/lib at runtime, so move the library to ${libdir} and keep
+    # a symlink for the -L path given by llvm-config.
+    for lib in ${D}${libdir}/llvm-rust/lib*/libLLVM-*.so; do
+        [ -f "$lib" ] && [ ! -L "$lib" ] || continue
+        mv "$lib" ${D}${libdir}/
+        ln -s ../../$(basename "$lib") "$lib"
+    done
 }
 
-PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liblto"
+PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liblto ${PN}-libllvm"
 
 # Add the extra locations to avoid the complaints about unpackaged files
 FILES:${PN}-bugpointpasses = "${libdir}/llvm-rust/lib/BugpointPasses.so"
 FILES:${PN}-llvmhello = "${libdir}/llvm-rust/lib/LLVMHello.so"
 FILES:${PN}-liblto = "${libdir}/llvm-rust/lib/libLTO.so.*"
+FILES:${PN}-libllvm = "${libdir}/libLLVM-*.so"
 FILES:${PN}-staticdev =+ "${libdir}/llvm-rust/*/*.a"
+RDEPENDS:${PN}-dev += "${PN}-libllvm"
 FILES:${PN} += "${libdir}/libLLVM*.so.* ${libdir}/llvm-rust/lib/*.so.* ${libdir}/llvm-rust/bin"
 FILES:${PN}-dev += "${datadir}/llvm ${libdir}/llvm-rust/lib/*.so ${libdir}/llvm-rust/include ${libdir}/llvm-rust/share ${libdir}/llvm-rust/lib/cmake"
 
-- 
2.49.0

