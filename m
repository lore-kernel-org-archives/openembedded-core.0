Return-Path: <carol.zhu@nxp.com>
X-Greylist: delayed 898 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 04 Jul 2016 06:03:07 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0075.outbound.protection.outlook.com [104.47.38.75])
	by mail.openembedded.org (Postfix) with ESMTP id AD03E6013D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 06:03:07 +0000 (UTC)
Received: from BY2PR03CA078.namprd03.prod.outlook.com (10.141.249.51) by
	BL2PR03MB579.namprd03.prod.outlook.com (10.141.93.11) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.528.16; Mon, 4 Jul 2016 05:48:09 +0000
Received: from BY2FFO11FD031.protection.gbl (2a01:111:f400:7c0c::110) by
	BY2PR03CA078.outlook.office365.com (2a01:111:e400:2c5d::51) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.528.16 via
	Frontend Transport; Mon, 4 Jul 2016 05:48:09 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=fail action=none header.from=nxp.com;
	nxp.com; dkim=none (message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD031.mail.protection.outlook.com (10.1.14.196) with Microsoft
	SMTP Server (TLS) id 15.1.534.7 via Frontend Transport;
	Mon, 4 Jul 2016 05:48:08 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id u645m6uV030562;
	Sun, 3 Jul 2016 22:48:07 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jul 2016 13:46:27 +0800
Message-ID: <1467611193-31658-1-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131120848887695846;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1109001)(1110001)(339900001)(199003)(189002)(5003940100001)(86362001)(33646002)(87936001)(50986999)(97736004)(4326007)(77096005)(230783001)(48376002)(50226002)(2906002)(8936002)(50466002)(110136002)(92566002)(6806005)(2351001)(104016004)(69596002)(81166006)(36756003)(68736007)(8676002)(47776003)(81156014)(106466001)(356003)(189998001)(85426001)(11100500001)(8666005)(586003)(305945005)(229853001)(105606002)(7846002)(7059030)(19627235001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2PR03MB579;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD031;
	1:51dnF7Ok1ctuBagou1PuK03L9e370V1AaQclsR0hOVelieRenG9zARCPFW7GJ6CyxL50oFTkWOGdLnoDYJf5VztrdLVDSMqsLcHPo94dTxXP7/Aysf4uFUsY3r4ecNWKcCkaQUH1/XY8eV9IJUmKD2BId42pRG5c9Ut6RcRLHtrAIfC2U2kaUtkEA/be93Kbyaty472VQbXhMSJHirkVbisfmxizLWSfzx3NG1s7a2o0fmRnCTOn4a5uDGFpEkfZ5gppCBQl8VZYBjwn6jhM4PfuZNwb3guNKIf6SSwWZut7Mw/i4vE6x7HuQ03Oe4FHI7/INJIxYM49thWZRYjb2f8Fl4GM5lH7G7ZPGQLygloRg8umhc0AszqnkZztM5GihnyzY841MvrucgDGLxqxQT12DPecBGthvyls738MwSRu3eHHeOfPpZzyp69cGDrL3XsWRrRpoEBVGRWhEcHk72+0V4ctTzLnuPndlIov+MZT+K1i/8YVZwfi3gc2DwrFUgF6sbaudKZFWzjC+SgoDLe3KWYCS1PhWAmaIIGzvO8nKJvlmld7RFJ/xdLYmA0bPDXohQM9pbvnwIHTDFWQwCC7DPwfGsSMGSLFKpip52M5AfmjpVIaPq0OUPAqO+sQRrgouAhTkwF06+XI/AA/tVbd5KYWb8mN46v6h9GPYBvaIgx7S2VMZp++whpXUxhjckPIEzkYxpQ2hRvVKYBam4e2oPrtXG/+d+tplM5+czA=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 3a59f540-79a8-477f-49e6-08d3a3cec710
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB579;
	2:VzpD8qvTSf4tecFEjqYJb4YHlDXe72WqiqEygWUwvGLQabIlJIyC+Nc2uW4m8zVk8gJGXke6t2URNX4izL5EyaIx4JDqnQOElgVNVlVEBp+bw41fUwFR72IJpPRHahdXKUWCzyax9/GcUBAGPUS7SK9j+Y9VUOEeyWSfgffgFHzQ3ZMdAjyV46YZVdbMiFq2;
	3:d8Ni0fMGYZ04kmg0DQP+F2QHQgoJPYvsqr718tCkFhYieidbKEaqIMS5Twzdyiu0CxaQAsHfYkUYnqdua9/3+YoqbU7s93ah3Xe0N7uTS8+jvVy9u1YVoraI9Y4NxKMRq1AGG66iTtWeqnUaWMKQurRhESDEaPC7G7nV8eddRSca8n4izsq5W4vi1LXIFs48650Y5cwGnrZ+m+0eisPJlPpL48N3017xnTPlxTSE5U8=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BL2PR03MB579;
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB579;
	25:0I3GA6VwMh0IMTdggiWUrQ29y/lZ16Ze4+NVBqHeijglht7prUwFjH8IhUNHtYyXyAOynad/ecDQtdwdnMywW4L4t9er/RMLsZf8vyIVm4AgYhhizMokM/n66wud6VEqz544aYu+VLLO3M6BHEuUuibJ1eoxVvw4lADWYSFeB79kH+g9YbJbGlCIO6rvts9RUGh+2ZLvU5gxfegYtdrzdkQIfaY+YIn05aY2j6ogVThRe21LHsikqTSMCWv96qQpBt5JCX06VKGA/VA3oOU72OyBkWFTP1OSJCAgh/5hxEyqQlvd2EBX2bGYhJ9Rvo/fDXjwNeag/ky/6EwMfgxTIbXQUo/RRnVrKdD33MPMAaAjO6CmSFrGHGipmSQRfERUqizd5vzr0jhEw6WjctyoYK2EqMRZxoAOa1stlIe8NNVIApG0C2nFbbx7ub6tn/wuE/YUdAiIsUmIdeGptgK21U0pbkDq0LydVOWMpFVXZTVlpI0viP23/qaph/XdMYNGSqZ1v444Zb3iNtpMcyMpa3suzR/X9DZiGC7QMQFXpyRt/+N9fIXecSykxKqExnYE5Xu49JZhSCrzSwHnTCo8TtCf08QJYaNI492Z2TBCU0tWutgZkhLVtdt7EA2Bs3XVEIo0np88p8qyiDGNInJrSgFwNafNcHw5lHtZWcAyde2qSjdX+Gc+lKFrz0xxHMoRX94n5MQ/pW6+ADWp5M7v1A==;
	31:5hNnlwweairL0AZNs9KNi9e2Zjtm2YHqh/mD9PZEcIrWlIUS4ZmPppZfUn3JKdP+NIvygu9T8D049QlyFUeH5tuVAHS5LyWfM+gZAIM5eEfij94pmak8mUj+s4vlvTvV0KdkaUWdPjynolvu6GQAc+KAelCsB+1Q19ujtPTWkTxyDl0KII7UmM2wsCMgGCahSHpYFk/HgV4g75JoYmAyIQ==
X-Microsoft-Antispam-PRVS: <BL2PR03MB57992CF049B2E5EC65C0AABE9380@BL2PR03MB579.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13024025)(13023025)(13017025)(13015025)(13018025)(5005006)(8121501046)(10201501046)(3002001)(6055026);
	SRVR:BL2PR03MB579; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BL2PR03MB579; 
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB579;
	4:NAg/E1mUu4i+WX43gGXzFaTzhRXBldS9A5T0pwGqzByQwDSn5uJ+DZam4QsYEQS2DFcxNMtyq9MGlfk/Z+t5/pJhcJyRk5x+a1+rqdde1aJJ2DXye85ktom4+yfHB5ohppnfHjnhBtl018pJPHK+CtcTR+wk7ug1exU6k4ovKMGcfXXkoFNpG4l5mz3/ilTpbZuhQ/Gyg8K9He0HPFdfyYbwUjzNc2xqGJV6pLLw9kUQh4ffmekF6g1Bcoxd2Zh8yyIDlpzmGKCL1eeDacs0OqDKzrRQL9uD0Yv4MDRw3Yd0jECYss08t7Uy6F36juTrcGnSMn9zslphqir3Qahv5VOJ3x6EP7C0BatoEWpyFXCTsfMGM8xadIUX+2NiX9n6j7ueyTXG1j6nr8uRVN9hd+Vcc0oc6BCNWBzNXBIvNikUGyT5uUETNmmewJeNcfWYy8F8hq8pD+j3Byd5sMSOROpvGsmPyay/NloSMiuZVQg=
X-Forefront-PRVS: 0993689CD1
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL2PR03MB579;
	23:0NRo2D0t+AKvCPaHnfU0zyO/Lyp2EJoJsBwx0DYkgP?=
	=?us-ascii?Q?uY4XYCY7+f6eNxrIuQ6A3u+L9pHPL31Bl+un9CQgfyfyTsSekQ1XAJLB8cmm?=
	=?us-ascii?Q?R3SXD8uwEAkrYTwizuUGmGKZJif+9gUl1noIRNOOz8tPfwMeFnXszJ+ynMjq?=
	=?us-ascii?Q?IxbFJKXXtjnatZmFOCf4WkU2m7Xn96ALYiVUHFvPucw7h/+GM/abJBEjo8Ef?=
	=?us-ascii?Q?KNyLngQztwbsUh5mbMtq4iqNFAAX1InkMN64kVchrPEx7Y4W27OWfRPNAzHH?=
	=?us-ascii?Q?H+meFcnKETDfkQ+mQ1VPw0sfwUE4A+tFPUS3AUOTwDkhl6yV//vLaQMS5GF3?=
	=?us-ascii?Q?HiDsETfDJ+sAbu+UyDM1f5EIN1HJngP4jW+t/Zd58yy5bi8NDaanv2nepL7Q?=
	=?us-ascii?Q?iF1B8CrAV/6PZOmVf2OdL8B5p9XYq0Lfu8BBR70YtMSBILHoKmLacd7O+83m?=
	=?us-ascii?Q?2bsWEHX3b0iBm1Gkw1MHnzW9l/Zk7m2zWfH3onXyO7jvsmmMnQfFoXWGannj?=
	=?us-ascii?Q?xUMa3dPQCWqbc3PauBZzc4Qaq6wUj1xqGbT2+/0CD85awg+FHGvRiCyWh46f?=
	=?us-ascii?Q?r2/kS7QFU2oYDxZXpS1/ccVlOhGrm0lU4YLe1xn8TO+Nf8XfjdSutom5jlH5?=
	=?us-ascii?Q?u7zZmeqFzOt3ve4YaQx09Zw84g5HNJ2X6YJ8kdoXMabPMLwpfSbGpXuPWh6m?=
	=?us-ascii?Q?GJz492NmR+t5a/gg8JBjvVCtWmk37N6huf+vwWaNQh0ZL5P8T7E3MCQNgwJv?=
	=?us-ascii?Q?U6xP6Kd16hXjjHRgdPZBllnw9Yjbt3RjaBC0zSBvHDR2UBcHKFvHi55bBkSz?=
	=?us-ascii?Q?ob7JoON4FMxu5fxe6qVV33FfuR2n6B5ec0ieDrCD/QDpniZ+1GC1MCwPfpoQ?=
	=?us-ascii?Q?qRTP+hjmk9JVVMEYKnUtWpIG0GjGzzFA3yIF29Wp2fAq9uoCzy1FK5EUXwRb?=
	=?us-ascii?Q?Rz4lKRJPp4ddd+WekCinfkwGOYpikiVAh3zKP7wzKz9/v2ndmGFKVq+YiMIl?=
	=?us-ascii?Q?cxc5mzCcQV7HCHL6EzLUemrwbIsPEWcAf9lD9QhFuRz1qtu+wHJgki8atsFA?=
	=?us-ascii?Q?uYG1f/buLF9RrYcHjq9P4aLWSmsMizfPV4GoV/9kqa9X2SxVa6GXXJ7noOvW?=
	=?us-ascii?Q?LYXGmlYLA=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB579;
	6:B1tLaJh/0yAkE+woUhIIYZ/yb17tM8Y2hGR6prUoorUlGZn6puH/olz0+T1zlSprCZk/2OCAGTTMkc/9SLW3baNiylVwO97M9LccJrYEOQmK2hzNgzMPUgO8Nttw6tPytU8xess/wr1N8fbUd37QXdVZQPpdHVNedZfF5GKufG79g+QAOYz3ray0tV5uW40+hX9nzi/v7nYuFCjGP4Ta/Nwzae8Ys1dcRgp0EHm4fAUEzJH2vfUmO2wgztf+/tTUTL7U4bzkO4t8QC11sF+D23siXlBze9f1uSxpuuN8a6A=;
	5:Y/G6jo9W6z0W84ihN1RysSBPrrLiSp1xgn7HYl5vsHx75OoyfbVtQPDDEPibjLp75xxnIfLKg9V4qJXT2j79t25vphm4Amt0nNSq5vYFNkHaasvWn8ar+QFq8nUKCvH5Lcbi67i4/pVR+LvRgsoKqDn1FilZFRSt1Rog/8C+9t4=;
	24:CFwdK0Ts+6bEUnNE7vFW263iKtWRHs+hjrkymMD+DIZm8ZoA3Y7t7uS6jwcVz4zVOiVkg+ck2n9hkIg7V6AU5Dj2cp9h2G93e9U4q5f0Ves=;
	7:RyzszHWzPi/3irytjpUPqpfL3pjYIsMgBOyBnM6+QCd1DmKADZiBmYIIHVTHgC7NuAPBapzBBxVTtlU0Pxb9lp1CKsfoLFlp/ck8HChTf0frP8Tw+pdTIhF3mP0Mk3F9A+4mTyxgyGirtcyLPz7trRwMwrdRwstFp20JHOq6XTKcnRJ6mygVQa6eIS525hIS+CJL11GqqpDbWC6tYlCWMWXPK3w705wPjNyI+AvAPQiDL9yo9kA6xihTkBAot8Rz
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2016 05:48:08.6603 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR03MB579
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH 0/6] Add patches for gstreamer1.0-plugins-bad V1.8.2
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
X-List-Received-Date: Mon, 04 Jul 2016 06:03:08 -0000
Content-Type: text/plain

--Enable gldeinterlace on OpenGL ES

--Implement multiple render targets for GLES3

--Don't use the predefined variable name in glcolorconvert

--Add glBindFragDataLocation in glshader

--Use the newer texture() function in glcolorconvert

--Fix little rectangel appears at the center when use squeeze and tunnel effects


Yuqing Zhu (6):
  gstreamer1.0-plugins-bad: Enable gldeinterlace on OpenGL ES
  gstreamer1.0-plugins-bad: Implement multiple render targets for GLES3
  gstreamer1.0-plugins-bad: Don't use the predefined variable name in
    glcolorconvert
  gstreamer1.0-plugins-bad: Add glBindFragDataLocation in glshader
  gstreamer1.0-plugins-bad: Use the newer texture() function in
    glcolorconvert
  gstreamer1.0-plugins-bad: Fix little rectangel appears at the center
    when use squeeze and tunnel effects

 ...lplugin-enable-gldeinterlace-on-OpenGL-ES.patch | 634 +++++++++++++++++++++
 ...ert-implement-multiple-render-targets-for.patch | 244 ++++++++
 ...ert-don-t-use-the-predefined-variable-nam.patch |  32 ++
 .../0005-glshader-add-glBindFragDataLocation.patch |  77 +++
 ...ert-GLES3-deprecates-texture2D-and-it-doe.patch |  51 ++
 ...effects-fix-little-rectangel-appears-at-t.patch |  46 ++
 .../gstreamer/gstreamer1.0-plugins-bad_1.8.2.bb    |   6 +
 7 files changed, 1090 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-glplugin-enable-gldeinterlace-on-OpenGL-ES.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-glcolorconvert-implement-multiple-render-targets-for.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-glcolorconvert-don-t-use-the-predefined-variable-nam.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-glshader-add-glBindFragDataLocation.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-glcolorconvert-GLES3-deprecates-texture2D-and-it-doe.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0007-glplugin-gleffects-fix-little-rectangel-appears-at-t.patch

-- 
1.9.1


