Return-Path: <niko.mauno@vaisala.com>
X-Greylist: delayed 21161 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 31 Aug 2018 22:07:30 UTC
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-eopbgr60064.outbound.protection.outlook.com [40.107.6.64])
	by mail.openembedded.org (Postfix) with ESMTP id 422886069C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 22:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=O3DnHzun9CqRM5hLiJgnG3CopEDNiFv2KTpCZ08B568=;
	b=ckZgOPepeIqFs1uCkX9yIN5YGlxlK5AWmPyI08hNjiCQyopetlrTVjnErZovjxCcL5Z+9ROhWIklwOf4F1nsgSrv9Pz+idaTCys/TMQTG6P3CVG0X7uJdMLvRxJR1S71tu4UUeIYDIi86gIkKrKZV2CEs3pXEAXTk8Vut4TDKqk=
Received: from [172.24.64.128] (193.143.230.131) by
	VI1PR0602MB3550.eurprd06.prod.outlook.com (2603:10a6:803:2::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1101.15;
	Fri, 31 Aug 2018 15:34:16 +0000
To: openembedded-core@lists.openembedded.org
References: <cover.1535118570.git.bruce.ashfield@windriver.com>
From: Niko Mauno <niko.mauno@vaisala.com>
Message-ID: <b11c0e06-2d5f-8478-6dfa-a69604d92714@vaisala.com>
Date: Fri, 31 Aug 2018 18:34:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1535118570.git.bruce.ashfield@windriver.com>
X-Originating-IP: [193.143.230.131]
X-ClientProxiedBy: AM5PR0701CA0071.eurprd07.prod.outlook.com
	(2603:10a6:203:2::33) To VI1PR0602MB3550.eurprd06.prod.outlook.com
	(2603:10a6:803:2::11)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19e81f84-b3ff-4b1c-f074-08d60f573632
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR0602MB3550; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0602MB3550;
	3:nNKZXIWDNSkHCd2Njmx+g81U6dYGDuzyzNKDKrd5UP/fhYxvA607UjDoWDDsyU+4DHfeuvLgbHT6LEiYjBUfrInM1npNaZw6QafhcUbzZ6Fyr37VE5frxtd0D0dpCUx5Ra269gflTvViJpcHM+n3VknVfkt7w3CECmgTJoN+quHvirNMXNbXNduDbGLRsQOANjNU8VN/saiat5Rl1GtJ5KdaedpZIsh4liFWtHtQIVfRh7uAe3Vi5jMrJF96pl3t;
	25:QtQ4NqTqES4AhEKVErIc9Vw8e4TtaJXMuNNDuDb6zaPzBR0lG4koYr2yD1ovhxYaZ7t1M4j/gf1qjxdSu2ZGNasLa3IZjIHP2VeESuWEqMfTlXJOyrPdMbccZ+xhFXVEn3WeHJyivNCxu20Cn19/M+3QlmNdGdHTHTMn6pEZxjoLXGm3Xt8Il3S1xynZXxsYyxiJDNL0isk+qeBH+cRP0/yHPpc00TTzdJsn6/gp3OZxuBhonDip2X4I1wE+MTqY50ORZNWruvKz+Z/hzgLqXjiEZ/v6QKXUv1e7AIx2wYnx4+rcU2Y7n4jf2Ecb7czLJMlVTIfsJJoEeTpj1ZuwMg==;
	31:bKHOSiK47VK7VnRPSxhNdp1EyXBK7sNtAYQyAb8W2gqMGFm1YQDD7I32/X5VxjObS3kJD5Nlza6nT1p9JifNFCIXNJdjx8NSsdeXUxT48GuwrO19A8r7oce0QGlh2O4mYZNVOj6IaZMKR+Wp4CGvFszYIdbyZzmabyw86AZg8xYKRMLFPu7h/U1g250UbstN1foAKMMbyqrDRSFuNYH/eAiDCRH1LGhO0Z4oUdhXcn0=
X-MS-TrafficTypeDiagnostic: VI1PR0602MB3550:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=niko.mauno@vaisala.com; 
X-Tenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0602MB3550;
	20:zk+mXYBzBJsqDunpGwqA6DhiWsovXYsfv89Xpd3T89uuckz0liRuQnIyzNseN9AHBqMcn7Dbwg9LV1uco/y2OI7OY9cZ5gGGmqhmFGgfKzu+G1K1PJ434wKk06Uqxy4Xl0t02jGH/je/z2C6yLNJDSx1EQ7iuRg6j5q0B8L6NP4=;
	4:GU9ooNh49x5CWLMDffFOasgEzTS9PZwgn3C0v3uTbXnR7hNspYnSsvY2saRUEb+PDlupq3qy5brtKDvs88PxfezbYqBK2HBXSVUbTWFZ/tR5PfSoSuAx2a0x0yyUeQWE12zXZCCW1P0f3QN4MirnR/H5Q93ZX2hDuwB1GgQTbDYLgtpUD03YNyjchL82TQSbvdXCBH9dM/WQQ2JBO+uBJZp2XRnC6hNjnWc+nd+HFGgqSW0qfJjM3ph+xabFKaKth9VWLL/WbU9ACSVtC3TPBg==
X-Microsoft-Antispam-PRVS: <VI1PR0602MB355066D01947435897BD3FF2810F0@VI1PR0602MB3550.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(3231311)(944501410)(52105095)(93006095)(93001095)(149027)(150027)(6041310)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699016);
	SRVR:VI1PR0602MB3550; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR0602MB3550; 
X-Forefront-PRVS: 07817FCC2D
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(366004)(136003)(39850400004)(396003)(376002)(346002)(199004)(189003)(105586002)(26005)(2616005)(47776003)(31696002)(81156014)(86362001)(77096007)(36756003)(65806001)(25786009)(476003)(65826007)(956004)(6306002)(11346002)(66066001)(6666003)(106356001)(486006)(65956001)(16526019)(97736004)(3846002)(6116002)(186003)(8936002)(68736007)(81166006)(31686004)(2361001)(446003)(1857600001)(305945005)(64126003)(23756003)(76176011)(44832011)(2906002)(7736002)(6486002)(58126008)(478600001)(8676002)(50466002)(53936002)(6916009)(386003)(2351001)(16576012)(5660300001)(52116002)(316002)(966005)(230700001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0602MB3550;
	H:[172.24.64.128]; FPR:; SPF:None; LANG:en; PTR:InfoNoRecords;
	A:1; MX:1; 
Received-SPF: None (protection.outlook.com: vaisala.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?iso-8859-15?Q?1; VI1PR0602MB3550;
	23:E8+mBvpiS2k3zxd+PJa1qiqApnompYQO5yZM?=
	=?iso-8859-15?Q?aoP1a2Q4yRjryGFWHn1z2TJPQ/SqfU51c1fUpunioe0MuNCiaL+WF5A5q?=
	=?iso-8859-15?Q?ZNiECKR5HhmvFE3TJ7nMvrdLAcYXp6jqgElCCJqd98Egtl3upFiERsno9?=
	=?iso-8859-15?Q?we968V9PMuVd6XAFbOTz6jQZ9WHbCdiZBCzT+ilYrgx+AbQX8CsEaYeMZ?=
	=?iso-8859-15?Q?YUYGtHqek7o5QsvEyY/3lHQX0qG0tvHM24n29dci9EfhMZYFCyLrEdnMJ?=
	=?iso-8859-15?Q?GY0Ilhu5dv54xvhxQNG/AhHK35fwKdOsZ0jp+9WTvPrOGo/59E7PEiFJl?=
	=?iso-8859-15?Q?04xRYxwIte9LNpEBclmDNsen7CwW7Igik3tNlxjHF64OqSsqBXpPiPxkb?=
	=?iso-8859-15?Q?NF7fRYhaPBLHQqjm71H5u9eg1xo6P/Qvcw9cdwGJyoUov+bPOs8Mrtov0?=
	=?iso-8859-15?Q?iD9GqeUH9DNNfqualclIG3g/l90+liaZXjq6/cwZK+SDJ9kQS/F2o8CPA?=
	=?iso-8859-15?Q?3d8B4t4LdjpcOF/Sks0QN+qQ3i8E/k6opKSSXgzWAIcOszFauGmBYhH3b?=
	=?iso-8859-15?Q?NOdZXr5oHxkjxm4F739LKKnefNkhMxG4QFe7hom6jKLx0/vb8GSNXEoig?=
	=?iso-8859-15?Q?GLKTAo1NVVxcuuqwEHd50Wo4qJ2LxsvWFMOXriE7TTzbPibzzRlYdrNus?=
	=?iso-8859-15?Q?adABiMr7Pz4SMaiNoRH8th7VfC9Y4o6qx1ylBoKgBuunq5aYqxfqsofMI?=
	=?iso-8859-15?Q?6/bg4I7D2lzDh9STzhYzG3YgR5ucIjuEBLFIbpUCYy9uzhdwKfQYhbnd7?=
	=?iso-8859-15?Q?llhRWKXdHqYLPLCUrM5o9y2BtOpMPt7FFU49Mh+Pw7liDcsd2BADB2JqY?=
	=?iso-8859-15?Q?iwAJy6Jz6sv22W9I3blhfhQgZdONj3dB5i+kNy/rOZJs0FGpWBUPV6OYj?=
	=?iso-8859-15?Q?3m3Hqs504QdLWUKnUV46pd+4Vt+eOLoqPnKacwcSlDqXgSx3hKM4UkX6t?=
	=?iso-8859-15?Q?NQEjmbsgcgYjOg78nENJ7OfX2UuObpp0REf3LqaE4+hWJ+HBumVJhVPSZ?=
	=?iso-8859-15?Q?iIpK/D6w6qNmVm9v3MJgtJJctKfVAJBSlnnEruCBzw7BienqSYOZbphMC?=
	=?iso-8859-15?Q?0jKt9oWbGWFs9G6DX8IUjPC3hR5Q35uwMlW0TY/AyFGNT3rDSkRMGn26E?=
	=?iso-8859-15?Q?qmExejDvUHsRuK/+5PRgtld94PGoGJslJfOe1zDSgXInltMfTuOg0CcoO?=
	=?iso-8859-15?Q?AG4Vufy/HWVj/k5b56K5dVR4OisuvlziUdBegrcoUMDBGaUFS5ZlBGUB5?=
	=?iso-8859-15?Q?lkPD2DWZ6OLhES77xhRFa9maG/EPFwXelAXHeq3GTw9OBe3Zs8Nii5GVb?=
	=?iso-8859-15?Q?KaUsHTqV20bDpzgEorFBP4cGJ3HweXmlU4Y1MgBv89Em8uPTCHqZcDpQ7?=
	=?iso-8859-15?Q?irCcVs8B1HkGOXkmayqokv98vHzLuU8y7TCpXCGaynMdTpZ9+n5yNzZJX?=
	=?iso-8859-15?Q?wsAe?=
X-Microsoft-Antispam-Message-Info: yjeU78d7OLgmvHMl9aOybDmZkb13AvhyqVYELebClhpOta9GNV2B0/kFJe5Lp5ZmEcW+qvAS67/8gtIDyDv/lGNicYg8hWhvh0iXbcX0WNyPhqzstOdj7KSXzFvyP4UeoU7RNbWBhQMBOLOuCu8xsp19IXS79+mqyIvp2H+ZYIA1inW8pt/o8AdhIsLj8l+vW21Z9IC6oi8QyI/t8JDQOYSIy58S/Dp+YAbf6J+qm74UHCMN3iopkGUDmCdaaAZbLr5gBwq9EAF+FsyymwaTicqz0kYkB6Ok7EHn1C2yy84mceYltrCIIaeoULPWopJTVK0fAXBHwxsNwbCFKnmugbCtvRSGa2ptDmoDnH2Yv98=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0602MB3550;
	6:N+eQBXiCPd9fTYWVJOEhOWKiJfn0LqqnSqLBJWFZeyl9cIf5bS3xRWyFSZBKW53+GB4yh38SaEHw0an/FS5xwH1OmqOwNt47nHguAAAhx53RPQ9OzjXFG88/KJFl4W7HADusjjWZ5fBeR6/gpdisPTvr0u2lBdodqRwBs6HX0JjEteBpbnBfbmUaQ2Y7wU3hP6frd5VAsqbZZTDCt04ZK38XGiYacBdZXbQuugJLtQV4O+Rm9i/W4bdSWTcoGDEdW4CT1LO2fCnwcRZUC4yoFmT9kvetDG882AKtYWlbG/fGT3MKnwUyMAFeZP1qhhLCmdrY+3qBqiF/+aD0Ev1nWlZ4uFEBn+QT1DaZuHJE4lTq2IZ3E6iMrcQGw7Zeb8vdBWWYzONf7Iey6ufdRbb0BINqOUC8xHI1YQ8q8Wf/+OfsucvVi5qZpkJ8TFnlhc19kzHtDc2gPwVCaBa7rNSVVA==;
	5:X/72NrtcuFcmwLhi8AzXZxHWYY1zm+OcI5SVVXzVrTvPEs3x6jGqGKy7/a7dOtMcRlSIM2kvK6hhNevt3Aq9/T4Bj/2EZpcIkHUyakXUGuJ+zNd1ZPl1C/UX0Kj/TMYNVfbSgc3r+xC54XyKO+UxkAtnkQzZTooQFQ5z+jkYJKY=;
	7:OWk5cZr8byl+mSImeOUQjggBsJeWo6nC9NatoGASFdSeFoBZGvAxGLTcETkULFGib9K4nwfiN7VE38Rfu8TemIbqa+VnH23gcoZ6+A4mxnhhtuHTtQMddESY6Z8nRgpn9g8yXHsYs2glyXQBtkuINCti98R5HT7J7qKl+r7Ewdx/9W+VofK/5lgsbVTD6A2XGFdDJhZa1ddLO76FPHmQLSKxbkuDtQQ8kQ+KX5OunxhGi0DBkGvBymjbsQ/sBTsR
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2018 15:34:16.3195 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e81f84-b3ff-4b1c-f074-08d60f573632
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0602MB3550
Subject: recipes-kernel/linux-libc-headers/linux-libc-headers.inc question
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
X-List-Received-Date: Fri, 31 Aug 2018 22:07:31 -0000
Content-Type: text/plain; charset=iso-8859-15
Content-Language: en-US
Content-Transfer-Encoding: 7bit

https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=eb24d4aeacaad9d41ddcbefd8d2ac96e95548183
apparently is needed for 4.15, but it breaks with 4.14 as we get

  ERROR: linux-libc-headers-4.14-r0 do_install: oe_multilib_header:
  Unable to find header asm/bpf_perf_event.h.

I used following to work this around in our own linux-libc-headers_4.14.bb:

  do_install_armmultilib_prepend() {
      touch ${D}${includedir}/asm/bpf_perf_event.h
  }

but curious if somebody could suggest a better mitigation

-Niko

