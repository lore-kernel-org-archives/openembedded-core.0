Return-Path: <B54851@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0111.outbound.protection.outlook.com [65.55.169.111])
	by mail.openembedded.org (Postfix) with ESMTP id 4436E73177
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 09:50:11 +0000 (UTC)
Received: from BN3PR0301CA0020.namprd03.prod.outlook.com (10.160.180.158) by
	DM2PR0301MB1183.namprd03.prod.outlook.com (10.160.217.145) with
	Microsoft
	SMTP Server (TLS) id 15.1.365.19; Mon, 18 Jan 2016 09:35:31 +0000
Received: from BY2FFO11FD038.protection.gbl (2a01:111:f400:7c0c::144) by
	BN3PR0301CA0020.outlook.office365.com (2a01:111:e400:4000::30) with
	Microsoft SMTP Server (TLS) id 15.1.365.19 via Frontend Transport;
	Mon, 18 Jan 2016 09:35:30 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD038.mail.protection.outlook.com (10.1.14.223) with Microsoft
	SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Mon, 18 Jan 2016 09:35:30 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0I9ZROV015522; Mon, 18 Jan 2016 02:35:28 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jan 2016 17:32:49 +0800
Message-ID: <1453109582-25485-1-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD038;
	1:/DmDmurE98yC5tk/wxhe052EztxeQVl6kOPR3kgq12w/1+ZXvcpLh4iOfnnq3KgKC5xwnIfWsNTuZPODOD1Ozh5rmA3YPAhuKeamXSHJacQe+mCvYPMEG/SkN3oASRZLyeoaEd7Cqt91qXEqu7MFHRu+t0y3rIyvSJMMNXlEm45Y2q/eL/OLjto5R6TYo/PH88mVSDZEwqnQIT/LAOEwj1JtoNp1DNr3dAR1Sw2mIESJ1LbgXpGJaNsuSPrk3bGEvHU9Eok/bfsjvbhNCPR13EupDXNr417UkCxijHSwrtjzIjfkSfx7QtKT5o2SHQ5GmyN4Oi1DrN0eWKJ8j1BYgoc1IwqvZSFKIBDGyEsQelmnDnPHX8iqBECtbdF9+hF1ppUTAtUi7euAN4eHkyns87lXS4KLCwzI0gVbT5+tq3k=
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(189002)(199003)(4326007)(97736004)(586003)(107886002)(36756003)(1096002)(5003940100001)(4001430100002)(92566002)(189998001)(450100001)(1220700001)(104016004)(2351001)(81156007)(77096005)(5008740100001)(5001960100002)(6806005)(110136002)(50986999)(229853001)(85326001)(48376002)(47776003)(106466001)(11100500001)(50226001)(87936001)(86362001)(2906002)(50466002)(33646002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1183;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: c41520b5-f8c6-4a3d-8e04-08d31feab4b9
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1183;
	2:LVavV6GY7rr6IxqO3XgZFdOd+r3VcP5aZ61cQR+9iYWf/NmCnhKufOZA9j2ptOn3iq/JfdWfCiw34HuPoKXpo61Z2+BerWXHrS1/ZXpbGiAgBAk0x4K2DEOqEua+9fwUy6ufmj2wBeeXUFDzXgLE6uZPo7e1YWTiA5Om26fZBdDChF4UPNnPQe5/uuvx96Lu;
	3:oEt2//tU7Z95Zlv7Vfr2TcnbODDkKqrI3AkraSn7R6tV8Te7XSK71fH+yT+vrYn1yDjc0hW+YHNivoHvbkVvQxB2mMKsd5t86bt38X27mTAY7rP2p8D4H2A84VrHpa/TOj/UYZwH3nezfDsyaoiFB61HgPVMqDZ/ju1qF55LjVFsCcs2ten2PHlVCMk0nOUAfqWIhRXt5IBLgLc/LqLiRWHP2inbo/NScNkD6CQrg/g=;
	25:WtsnFmQjihOel7+Y+ez8w6os+u+/9uB5ICPibqBssAKMYyA8BDdxZAj0aGmk+9gUTs5ogyNzuCPMDA4Q5ZaC8ElXkI7/rw2sfIGzBEOUpbxvdPGodFqFfV7/McUAWIfI68gl5aPBxHXDuHmJRVLs+0Ikaco10LaEM/02cJ8oQpmULILYrsm9oyO1EY/BVd1BlvQYr2OGDIzD14X1GcxuNh6FjOKWonipWJZiYH65PPpjIJUcPrSubJFoVU4ZKAqR
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0301MB1183; UriScan:; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1183;
	20:TwlAjhPcgj0r2dXDYOJUVdfQGrpsRP+NGIkgU/LJG+K99t3/f8rp3gXl/SudR1Nc0hbzGcWnYzewxj4WmjPhgl9ahDoRWX8vZCN97Nsv1bPQtD3dx/FslYDxwgMQzhCb5PLnIKWo25U8clOZuZkfPVzrIpyCRC+CGhisyXXgxhfHKSk2rUfm4TE6FwFpOWz6OrY1IYWfs1b78NA0WPQIIf2Asuu83p2ULhCVRmy8etd0WfDgt23ycAPrsRbZg9bp7A5QgNcMJtXV1uYMMxNDJulsjHMAt9u7Gzs2VTY19g9QbLCjMoenfVR5MMHOn1E5r7fyGjlJo+TvWonXssxiaR8aSC69dxEpjXTyis1jbCSlsKqHoC8CtO3iAMpIgL4LP1aK4tXU6u6QJIt7sAM/hYnhF78AJU9Lnu4NYWUjqrPOeaGexsNyKbtYivHWdM9h;
	4:EbRB1R/PA5bdrFeA6qUItIYUvfmtN4LBXBkLlWygtybG69wfGgi7j5E+DUoMNOln9DhCsx3EAkw5woUqRcbu0zACNGVjSU2v3iK922ncxLJ6X+IIXvp0nlWIfjqt/T1ycqNvSPkO1zBpVwa+hJFnKll0NIPZ2T+DyCkY8jStmLr9TAPVMRgZnsQPQCF8jNKGZSbkoo89s+IXs8Za3DiZiR1nRB7FhYPwrNi+N92Rhh4+QAImsFWQDUmCnDTXRcS5M1J2nI0p1qfQ6pmtoUnk3d6vNIfatuVUTlTHLOPLDX8xll+eQVO6x4aPg0voahbAqWM0Gbn2nfN3dAMdcJZGWm5INI/6uZqp2JQ1fNy/p7D32lG0MwPdxdx/fLGCbi/tXdNNcUIS9LArUfLFQa2Xe10EMj4DREIZFC8huZcdnydQ696HhITYlohugR3sbH9CIFnw2rjgz2z+349/7xXfhw==
X-Microsoft-Antispam-PRVS: <DM2PR0301MB1183D14BF24B730DA64E38BF86C00@DM2PR0301MB1183.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(13018025)(520078)(13023023)(8121501046)(13017025)(13015025)(10201501046)(3002001);
	SRVR:DM2PR0301MB1183; BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0301MB1183; 
X-Forefront-PRVS: 08252193F3
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB1183;
	23:34eRPzl9Uhlcm4VdHZz1KRTIvnwyBbGBJkGfR6p?=
	=?us-ascii?Q?6Ue+uWU+iKhiNeVREuEWhwrkRfJ69Ha8hO6O1FCD+zq1V5KdWfZpXxfMVfHw?=
	=?us-ascii?Q?j9eHZxvORCehY1+OEc+AMtMCJ5UNPkljE2ooDCKnyKuNxFl6blxetRbxlWlA?=
	=?us-ascii?Q?ce0YZ0dSLjGgzX9RRSLavcyUuG7fNqnOFeJxgjlg5R+BP44bIIfnjCdDGMQP?=
	=?us-ascii?Q?I5G8yGn7fNLTHFjhbowXnHl2A1v+nfzvmWHGio1bGIqXy221Dz1f2AOnsnUu?=
	=?us-ascii?Q?LNBmRZJzawH7Yek0oqZWvWu9SAHJcs/W+ANi12N+MWMzFUTkN1h8c8ht1qt1?=
	=?us-ascii?Q?HB7C0KZqHiyYHBd4a6T0uZCD450c74mVlHLrZCH9TQUajcCg9ZQmAcOzHZ3/?=
	=?us-ascii?Q?pWk8GYMkav4E1j2VzLv3cQQFuaDVwjNjE4DbuBShA7F1uL4b1WrrgjuQXE/i?=
	=?us-ascii?Q?rL2QXn9XWSz0lDwaE3WhKc1RZdQ6U5O4JJNO+Y/kNEUZrdfVgtsGVXjf1emH?=
	=?us-ascii?Q?a3IxOHvnvtq3lHY8o2KqJNKyzMoIjfgGt5DOBrzB3cW5c5iNwMCEWfEDGPHJ?=
	=?us-ascii?Q?Hc7dwKAnA1KMV0nLo2fQ4MhkDXgc56g0zeBNkHwquP4g/EJoI7o+62/giMf+?=
	=?us-ascii?Q?qU0IF2GIV7zuu22+zsWfu7HYX4zAdZhR15ShLg7cWKKv/0MFcDcwu9tbl1tE?=
	=?us-ascii?Q?8y1PKpilazsNzW3APAkwZi1tkIXKbF/hexVPv7UgSar9ymeHUpjBSk+8D64Y?=
	=?us-ascii?Q?yv2IF3rvFYT+F41nGPsxycTrPmBPCnQ8pevMRNnL3zNZW2fRaLUtGDKZ5zZS?=
	=?us-ascii?Q?yNL1IXLRDkxe22LrNIfm5GmPxWbgXJ4q3HGewa1Lp1lqPKkYCkM7WbDS7HIC?=
	=?us-ascii?Q?lPgodNOPJI19eRXZETd4LfM1ML1d7EhTh9JQUWqGs0tv/6IF5v/kyUhN6b73?=
	=?us-ascii?Q?0+DsDA9Ift6EU+RvPIV45D3FwV2vouENdq3TFFVSJVb/zd+9+bBExif7vJ77?=
	=?us-ascii?Q?el7ckd6OEdp5lqmoIwBrf4pbH?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1183;
	5:rlYTktuqHMCnk20cMe+g+7/VlcKG4DYPHtHp6/dtVhTtZVYF+V88ka+U69ZduNjIr4vFBBSRzgFm3MtuQEpCTZKuUfSszdDQtfarGk+P+DCzKSLIfDhVDrHVFR1EiMoxqRjn+t2CMS/dcSpE5t+5wQ==;
	24:wvRv/aP7J7i2OeJLIIM+YcN1GTrczNZnffacmTrXu/nY1nFMgVn0yg29lNSAyJjcj3nYpqyo9XsI/7GH0RNmJMHHJY8o5GVrDNB0JrNDzxE=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2016 09:35:30.2367 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1183
Subject: [poky][PATCH 00/13] Add patches for gstreamer 1.6
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
X-List-Received-Date: Mon, 18 Jan 2016 09:50:12 -0000
Content-Type: text/plain

---gstreamer1.0
   Correct the setting for FLAG_DISCONT when push to adapter.

---gstreamer1.0-plugins-base
   Fix taglist not being sent to down stream issue.
   Fix audio/video decoder error.
   Make gstaudiobasesink print warning instead of returning ERROR.
   Disable orc optimization for lib video.
   Add video crop supporting when convert frame.

---gstreamer1.0-plugins-bad
   Fix mpegtsmux get wrong pid.
   Add code type checking in mpeg4videoparse when draining.
   Detect picture coding type when draining.
   Fix frame rate info lost when fixating caps.
   Add video stitching support based on Open CV.
   Fix memory leak of navigation thread in glwindow.
   Fix loop test hang in glimagesink.


Yuqing Zhu (13):
  gstreamer1.0: [baseparse] unset FLAG_DISCONT when push to adapter
  gstreamer1.0-plugins-base: Fix taglist not being sent to down stream
    if     all the frame corrupted
  gstreamer1.0-plugins-base: Fix audio/video decoder error
  gstreamer1.0-plugins-base: Make gstaudiobasesink print warning instead
    of returning ERROR
  gstreamer1.0-plugins-base: Disable orc optimization for lib video
  gstreamer1.0-plugins-base: Add video crop supporting when convert
    frame
  gstreamer1.0-plugins-bad: Fix mpegtsmux get wrong pid
  gstreamer1.0-plugins-bad: Add check coding type when drain in
    mpeg4videoparse
  gstreamer1.0-plugins-bad: Adding picture coding type when drain
  gstreamer1.0-plugins-bad: Fix frame rate info lost when fixate caps
  gstreamer1.0-plugins-bad: Add video stitching support based on Open CV
  gstreamer1.0-plugins-bad: Fix memory leak of navigation thread in
    glwindow
  gstreamer1.0-plugins-bad: Fix loop test hang in glimagesink

 ...pegtsmux-Need-get-pid-when-create-streams.patch |   45 +
 ...arse-Need-detect-picture-coding-type-when.patch |   47 +
 ...rse-Need-detect-picture-coding-type-when-.patch |   47 +
 ...ter-Lost-frame-rate-info-when-fixate-caps.patch |   51 +
 ...-video-stitching-support-based-on-Open-CV.patch | 1915 ++++++++++++++++++++
 ...window-fix-memory-leak-of-navigation-thre.patch |   35 +
 ...-wayland-fix-loop-test-hang-in-glimagesin.patch |  142 ++
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb    |   10 +-
 ...-send-to-down-stream-if-all-the-frame-cor.patch |   58 +
 .../0006-handle-audio-video-decoder-error.patch    |   66 +
 ...esink-print-warning-istead-of-return-ERRO.patch |   47 +
 ...-optimization-for-lib-video-in-plugins-ba.patch |   34 +
 ...ame-Support-video-crop-when-convert-frame.patch |  143 ++
 .../gstreamer/gstreamer1.0-plugins-base_1.6.2.bb   |    5 +
 ...e-unset-FLAG_DISCONT-when-push-to-adapter.patch |   34 +
 .../gstreamer/gstreamer1.0_1.6.2.bb                |    1 +
 16 files changed, 2679 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-mpegtsmux-Need-get-pid-when-create-streams.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-mpeg4videoparse-Need-detect-picture-coding-type-when.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-mpegvideoparse-Need-detect-picture-coding-type-when-.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-glfilter-Lost-frame-rate-info-when-fixate-caps.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0006-opencv-Add-video-stitching-support-based-on-Open-CV.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0007-glplugin-glwindow-fix-memory-leak-of-navigation-thre.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0008-glplugin-gl-wayland-fix-loop-test-hang-in-glimagesin.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-taglist-not-send-to-down-stream-if-all-the-frame-cor.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0006-handle-audio-video-decoder-error.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0007-gstaudiobasesink-print-warning-istead-of-return-ERRO.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0008-Disable-orc-optimization-for-lib-video-in-plugins-ba.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0009-convertframe-Support-video-crop-when-convert-frame.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-baseparse-unset-FLAG_DISCONT-when-push-to-adapter.patch

-- 
1.9.1


