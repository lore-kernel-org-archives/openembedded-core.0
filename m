Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 2042 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 08 May 2018 19:23:18 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0078.outbound.protection.outlook.com [104.47.32.78])
	by mail.openembedded.org (Postfix) with ESMTP id 53A9074B83
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 19:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=hOxxJl3FPfOaUmhGu73AwivU7sHGvWB7GxaLOlcJiPE=;
	b=RSlFELJoU1LsvZubnsgY4t7apI9cW2+w4+m4l4kcaQvSQrwoLU4cM7H2N64EJaQCtIebDju3IgOxxvC1E7RLAU6mNPjcffihnkT2NgB7uujmY2poRGJDpK29kNhKzfBOuVcYnslcWTP0aTyfpaFl+YXB31KMFekvnRS6Ou1+Zuw=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from columbia.corp.xevo.com (65.122.179.226) by
	SN6PR0102MB3422.prod.exchangelabs.com (2603:10b6:805:3::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.735.17;
	Tue, 8 May 2018 18:49:19 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2018 11:49:03 -0700
Message-Id: <20180508184903.13506-3-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180508184903.13506-1-mkelly@xevo.com>
References: <20180508184903.13506-1-mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: DM5PR20CA0010.namprd20.prod.outlook.com
	(2603:10b6:3:93::20) To SN6PR0102MB3422.prod.exchangelabs.com
	(2603:10b6:805:3::11)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:SN6PR0102MB3422; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR0102MB3422;
	3:ycMej26IuPBQvlRTSee2vX03/x70IEbiBxlrVEiPdXMpkJXRWqT1yGTy9Ya5YwbGvhzuxfySItzZRToQWnCodqUxoFYGoOrH1LAKh2K3F3o4MndOUnWVo7Kfs2wSZTJTJBUL11uBOx9bmeyluefLsaU2DIp747/c8mSa2IjknkBY7QxVF5Qk2LwHIQkx3xewnIfxuPmzxcxznFTq1OdaKnA4iGrgSlK2laGHxk/m9SqUt6EK74pc8gaZYteefUvC;
	25:l4NeXJroZQ3GiqNjG+6Ia0hTb+LTtTKh4IA+C+myt1fKYUZTu9mWdWjJIzZY5zW7tPtXrmRvMuirux/V9TpRtzbAPb8uhZNmDaonbtUAhe2vaki84hjz6uj619Iavo1fcAsiPc6GAJ2gtV+PJU+YduXD1mfpSw4TYcMAysBhjQmT0v7Cy+rgg26Aq2UPZibEZ64AFgQvIJMgwuRv08yfCm5hbuoeeXPb+UFA2RVByM9UP7OdGtzpfNQ7bNl1M0uqvEZzGCn6hAwrIl7DP12R9InertvqArWllEpWVbqW+6OaSEz1LST+s+8LUzJ20zGT3f6+GqqwFXxwhA6I/lvtsQ==;
	31:+wgy3SmkELAglvj0y46RwiU5R7RdlJwxQg4OwbsAJmIFOmibpHWfiGOEdsa0cGLUFncpcrO4mi93DR8bUt2/PwdZjPpP+xJMLiVxkC61QpAdI978wrLSnCtTQ8YOYS5bT50hEJe9DrqV9PBpYsfsDBTOI2dWT7wv3Q1sTJ8xuGNeo7Ei9jifKq81DlnnjxZ1vZZDoNufRILO2WGVqrIJVyihlBQi7CRsRT1TIBzm+LA=
X-MS-TrafficTypeDiagnostic: SN6PR0102MB3422:
X-Microsoft-Exchange-Diagnostics: 1; SN6PR0102MB3422;
	20:m+WH6ulzNRDOR4F26M/uJtiilvRIYAZ6BqOOYkxlqWkKFh46mUj73nH+Cpv/Wi60lefXIPVGc7FXopG3cAwH9vg9osOyjnkY0cPBunllgQXiMrnpb0VE1JMj4RlXD0Eap2pxHYX84S6uNVi+pOSKoxUqmxRslNUMhcRVv+AMNkJCiYYcez76p+84/IHZfwH3myqw7budMF91HdX920KunvX63ZPe4DuUSFsHpPeV1KrjbbwY4Pw910lZ0+fatPbsc6mgjXlXgdH0Aj/sRCEXx3h3WWESMB6h0IMog9FFJfoLFESsOL5WLrGBg7mxM+Hhd9tboXHRa6ijA3qI9bCPQw8OYDVVxnJ3Hz3xCtQyY0wXJE3dmIGsv0yR32F/5b8Yd5znCnpsKzjpId1rNSH29Jwbg/yiE41Wp5WkPXhu0BbuU/erKc2k53SqAQUcFdhD8PXG1LdljPVTeI7t22dpx+6iyFbQQXjygGwnaJA+Bfmu8NlQqyTnSkOs3O6s+Wjx;
	4:tJ2dZk5vsHuRqC20UzS2lh+VKOYqNdyWZf6HqQ9SvuMYro97S9Tos6r5xyQG/S0ReXF6XLkTl0uud8XdIhtnTigIKUtJMLzgItd7oY7miRlOrHb0tejgVaghaNRs8VNnIQ3fd45D7o+mKmBBwSvPxP98Hm0kCWzwpZ0ltpG6GX6p1LRekJ7v8zMTLJwgw33mVt7HH0O01ne/AGUighgHq8g1PnKeUaDFWwfx0TfzQiTsBo1ZBT+iRqdHQbc+2d+YgqTLiJk0UBWP5Q3nkR4VzQ==
X-Microsoft-Antispam-PRVS: <SN6PR0102MB34226639A197E3C270CC5E87AB9A0@SN6PR0102MB3422.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(3231254)(944501410)(52105095)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123562045)(6072148)(201708071742011);
	SRVR:SN6PR0102MB3422; BCL:0; PCL:0; RULEID:;
	SRVR:SN6PR0102MB3422; 
X-Forefront-PRVS: 0666E15D35
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39380400002)(346002)(39840400004)(366004)(396003)(376002)(189003)(199004)(8676002)(54906003)(97736004)(3846002)(81166006)(16586007)(39060400002)(486006)(4326008)(53936002)(316002)(5660300001)(81156014)(6116002)(2351001)(2361001)(8936002)(1076002)(50226002)(16526019)(26005)(107886003)(2906002)(7736002)(305945005)(956004)(386003)(76176011)(52116002)(86362001)(7696005)(50466002)(51416003)(25786009)(47776003)(105586002)(186003)(66066001)(106356001)(6486002)(1857600001)(6916009)(478600001)(68736007)(6666003)(446003)(48376002)(11346002)(2616005)(36756003)(476003)(59450400001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR0102MB3422;
	H:columbia.corp.xevo.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN6PR0102MB3422;
	23:RD95ligWE+vsAGU1RgMAMQAzHK2fzy32fzrzl3q?=
	=?us-ascii?Q?SvgWdG4s1v8khvX3QZ+XBHVY4KEnhNfifkmYSK8IAjh9C2fekV3rgVeAoF4c?=
	=?us-ascii?Q?Ru6bwIGa7QP/R0KzHQ7ieAVGgxxWhraehZ792BaXdNms49T/6DenRJT995ef?=
	=?us-ascii?Q?sCe3QjOUd5xp9EiwMIRL8UadSEamZCLqjHGGJpBUHPeYC7qxiPPqjZfwU74Y?=
	=?us-ascii?Q?qV35FCgSU3R/XrFat5Fxipv9kn+FlbCUXWWEWIsI3Nw2XblOLf01eFS/BZeX?=
	=?us-ascii?Q?P6wjHpJFufsWS1ShJN8tb9GAPZzdUwxe/0veGzUhMr9Ct0jKKbU+i362r7iZ?=
	=?us-ascii?Q?60I2mTcsLKhVa9uIWZhNZ4GJ758CK4mxX5DQxSVt29p9lyrh+/5eaae1Y78E?=
	=?us-ascii?Q?ZNn6yzVRKGRvmJIagTdMszDy6DfU4tP/tGiTuPgHkzWuC7UOa/6QaqydfwHs?=
	=?us-ascii?Q?+hRw05cUAWQDldaxmrxqxsZsnuCiw3X6kacDcqAm0G0USDJgn/AzhTJQxnwA?=
	=?us-ascii?Q?9wTNHXVUKBGPIWuvTFvCdc9f4ztx4QPQacQJRCQMzzUAnnrU2FfiDP/ctuHg?=
	=?us-ascii?Q?op3j8n77V7BQITgeTuuU1I+zSew2w9ViYbACAcw8dGDgqkIqVujCe4hZsC+r?=
	=?us-ascii?Q?NXWjINlIkqLFGjr2Blnapvx0eSuQ0SVPXKuSyMtJD2XLGYgDvoQ5SFloT3RF?=
	=?us-ascii?Q?c1F6iS4viKMTea8J58Qy2X1VXtgihELTWYB63zxtftvt7iwo1MUxU8p4ALCh?=
	=?us-ascii?Q?YOAWiOWOFo5oG1b14/gWhS36vsP2/3i0aD38Qn5VpciOJGQR4ReaXWmWIe1M?=
	=?us-ascii?Q?YUB8t4oGnGcuCXqlcD+zhAFYdQLt97CISKF5I7teJ5oh9rMEzJsKFQknq5oh?=
	=?us-ascii?Q?yOTE2AsZd/yDv+x8+WGdQsSk0kIkd5CfVUo0bzFwCGpqrthsIdTTPDN2Qgcl?=
	=?us-ascii?Q?mktgZvZ+LNhkJa+jc2Qg5JG4AGNI+0+fcPdYj91syJgmMpPyFU6PDd3Jz1U0?=
	=?us-ascii?Q?ZeJ/6AUzcmAKFvG6HfJgCbwfh7CtQbpZOgl2PIOShFPDJz1/a4oK/ES7jPdE?=
	=?us-ascii?Q?sVyMEGE8hS/+DBqe7uu28AL1FZ94cBw0XuPOGAPLZQfpulF9DNuZfXfj80/L?=
	=?us-ascii?Q?Q6hiZrXE42HjhOjM7mC469yeAszqqeYT7hEnh8wxmLpztmfuW2DGYJ5ZMcei?=
	=?us-ascii?Q?eEa+khgec1XBtt2V6q/pTDhjKYoMO63nWX+EBONNA9KSi5WlM2KUX05XAkWy?=
	=?us-ascii?Q?Sn2te2OY0kuYT3dApNxNNmqXaAWdX+cWopahQBGlXSKBOgQw7mvWYAwXlGVw?=
	=?us-ascii?Q?mj2Yh+QU2f1N9hksRH0IGQ5SP0Ta4k4PxZ1UNLiJ54yi+?=
X-Microsoft-Antispam-Message-Info: +e18ykKrgiggW7Zp/DOSky0YCnBt5bJ8H7M+IlA3YmqKsAkhvQzdjv6+JFlVhxMDie9rOidjqueTbUIwi0Dz6kU9Yo40QcTOYXd+MZDnckyHj3N2sz4pzUY4d5sLJq1abFQXlh2P1ibeUibMEci33xrHeh6QNj8vM7fNek4LxGalqtIgzapyorbKffY9vCb1
X-Microsoft-Exchange-Diagnostics: 1; SN6PR0102MB3422;
	6:qyX/11JGdI33jbD/nqX0SF7glYwOyrSYc/Wh9ifpM88aVfr+/Zqn17YEU1+3F9Idne7Zmo6/VK8ohHLThB5cOKGx5jyc/JpEs9S0C+lmgLkn7rGEFyHoiC2KEMAmu2iBiEs46KZdS3SnTZzAH2x5Q5SJ8ToIQHMibUjviM/pwPJy2I5pTxCwj5inoTjjxMLs6DeLh2uhAqjuAvv3rIKtfdYl4B3X1utFZG1SoiCYa3qgIhPXzf9szUMn5wE6ptL7QD5PZOhXYNIs22keyavvhcvzq1cSvIbh2bKBScKXJC/F/iztdDcQA0vwBwcYamWtwBkkVdP40BcrZ2TX8vVV9UTCYZ/pMX8AibTN+eKUHiJgQyXlygIQFTpw/9JI9ZmC/AKzwgXgliY/bS73xp5+ItXcd64l2AvwnfU8th8MbqcLdntU7HN5J3gv3mbOwVBCCJiimSpgpKyLhvZOBS0RdQ==;
	5:zkc5DlstBeWvdC/dX6f+/A8u/n50vKTHvc0iYM+wOAoe5E0/OlQufShEN/LRF7uHQRlbxllYiFGPpQQyEEpEadeZhB8yMOqfDnpGeRq5s/ugbW7aPyiP7+q/ZpplcHyaBzQcit7FbdXdf+/PCEctqwaobFsOHbO2UxENvAqh5XQ=;
	24:kfqlurH+/bVWSxmoqxmRKf73TRssx5Qbrw6LOMFtBalSj4NcYVebTHrR4LSJx1K5GOVlXCLK35df44l9GlBRTFKuZzifc9wSOsnCMMvutC0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; SN6PR0102MB3422;
	7:0D0H5ASB5hWgKvmdoHuH6pYV9YKrGme8zVLtSyqe6OgSucJ1H8JTSIJxvn3UQ/qXV7Rfcz8wc1fBglOOc4e8Am3C05zBfVmgENar1N/6is7ALFxnPX6hOcQzRtgTq7nRNNAUYhAXDSKxE9indolkS3hU7SJF1jyBg4B45bgxyd8+m2xMxFRr+kCmD4DmttOfLeMOxwcga0P81WAbc2qf3bZDZMuzNO7whk2xqycOXV5Lr5BpS4HIWald1yv4ttcX
X-MS-Office365-Filtering-Correlation-Id: 2a1cdabc-08f1-42d1-cd6f-08d5b514686e
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2018 18:49:19.5108 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1cdabc-08f1-42d1-cd6f-08d5b514686e
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR0102MB3422
Subject: [meta-oe][PATCH 3/3] modemmanager: fix mbim disable string
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
X-List-Received-Date: Tue, 08 May 2018 19:23:19 -0000
Content-Type: text/plain

The current string used to disable mbim is "--enable-mbim=no", which is
producing a warning. It should be "--with-mdim=no", so change it.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
index 4f9400169..b1a718dbf 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.7.991.bb
@@ -25,7 +25,7 @@ PACKAGECONFIG ??= "mbim qmi polkit \
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,,"
 PACKAGECONFIG[polkit] = "--with-polkit=yes,--with-polkit=no,polkit"
 # Support WWAN modems and devices which speak the Mobile Interface Broadband Model (MBIM) protocol.
-PACKAGECONFIG[mbim] = "--with-mbim,--enable-mbim=no,libmbim"
+PACKAGECONFIG[mbim] = "--with-mbim,--with-mbim=no,libmbim"
 # Support WWAN modems and devices which speak the Qualcomm MSM Interface (QMI) protocol.
 PACKAGECONFIG[qmi] = "--with-qmi,--without-qmi,libqmi"
 
-- 
2.11.0


