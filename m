Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0140.outbound.protection.outlook.com [157.56.111.140])
	by mail.openembedded.org (Postfix) with ESMTP id 1E8C07673C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 06:16:36 +0000 (UTC)
Received: from DM2PR0301MB1181.namprd03.prod.outlook.com (10.160.217.143) by
	DM2PR0301MB1279.namprd03.prod.outlook.com (10.160.221.148) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Fri, 7 Aug 2015 06:16:36 +0000
Received: from BN3PR0301CA0031.namprd03.prod.outlook.com (10.160.180.169) by
	DM2PR0301MB1181.namprd03.prod.outlook.com (10.160.217.143) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Fri, 7 Aug 2015 06:16:34 +0000
Received: from BY2FFO11FD053.protection.gbl (2a01:111:f400:7c0c::182) by
	BN3PR0301CA0031.outlook.office365.com (2a01:111:e400:4000::41) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19 via Frontend Transport; Fri, 7 Aug 2015
	06:16:34 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD053.mail.protection.outlook.com (10.1.15.190) with Microsoft
	SMTP Server (TLS) id 15.1.243.9 via Frontend Transport;
	Fri, 7 Aug 2015 06:16:33 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t776GVMu028512;
	Thu, 6 Aug 2015 23:16:31 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Aug 2015 14:16:32 +0800
Message-ID: <1438928203-12256-1-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD053;
	1:qM/Clp49ipMa1iNYBtbQp9XrHiqixY1nPLVRdIdgzmELrDV7uLK8ldSqEXvFGkEbhDhYJtbuRzHECRwiF/llm/dpPMz32NLY+sLKq7hbJuYe1RxkGO+MKs11oxRbglYfjZUUL77fAeMGigwJQJVXKSGhvdI+EVllsfLHcMCbStFmx5DvrW/NeuCXSV+ikpr15rCde7O1uAP/QHgOKwN95rFIP0XecEJP3nyRdwDNVTQMmGaNqVPqSHFd2DoJk7o/Bhc0gbGtNJPzIOUS8r9U+BrjuClCTsoLSD9GMWs/iWRwpOE7ycM0kwbWalcDLccMVzt/kJj6yvHjB5LaT9dMTw==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(5003940100001)(69596002)(104016003)(6806004)(85426001)(2351001)(189998001)(229853001)(48376002)(33646002)(47776003)(5001860100001)(64706001)(50466002)(81156007)(5001830100001)(4001540100001)(97736004)(62966003)(77156002)(87936001)(105606002)(5001920100001)(106466001)(68736005)(77096005)(230783001)(50986999)(86362001)(107886002)(5001960100002)(110136002)(50226001)(92566002)(46102003)(36756003)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1181;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1181;
	2:qeWzumEJfYrC7t1b4W3gnynp7go4/t0SG6SQVo6ZtGAuf8WN6rYujlgNBLjxMObD36PBZby22vGio54Dkve2GO/cPCHc0qwucshHli/wN+AsVfNa5R4b590MGgimRiFHZuSJtQ/hqGOwep8ozL/LPPfpRgfAKVRMrRjnAQEsfls=;
	3:ne34ix0oaVwO9LZbKoRA8zW+W2bBDtymXcHkrreMVhvzE7H8q4k+1Lrt8ojBsm3nE2GzXMW9/imIcRGu0lKUUUK7YXXXpjJjNGawIvL3ylgYgFIqn2sDyeWVJb3EthZ6bqrxn5fblETStIxPrbQJHeLhTxsXmYkHg9gZwGHUxu4oz6pjf/NtTe76y9GKDUJMuAxH8aWIT1lvN0gaaX0Ospw5XZDqjSDN2RVHvGHIvfs=;
	25:53vbbLNPUtqp8vqnTz2+N9ejmEfSgqxmP//AnccFQlIqMkNH8Ahbs9CFbrV4QQ8CJcd9tJVLDOMJ+xFq1NiNTkJBFiFi6NG9VnXKYNa74SybSjCAcRTuG+CUuYztKWu4YZjmpIntJ3+7x+lj7TPad5JqdElqmS1zl0/4QfO3UZSkoxqJG06WoyL7rmYFJAVZj4tD78Ok8+yhH7JyNVilMwsyoOS3o45Z2k/54DEeteMmRdpmt2ucI1U88BePHxE7
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:DM2PR0301MB1181;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:DM2PR0301MB1279; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1181;
	20:oo2tUkFABnpPmU9Y+/4y222XyqzB7IDuFqtKp3D+EE6yjXRssQDDTbGPtCOCJw3ICv5bv5kDmc8HP3La7wt/ltGJsAEubBM8r3nrlbwzcwGoW4nXb5r9oub3I6JrMDV97KdXMg34OH9dW/BycUXA77U6aCBndMhCgH6Jh8d40qePFRGEWBCPZZeSjpB6gQi1OJwt39z9jc8rb/AG0PAFCOgjtMczbwAQ08wEeWvJr2/f6OTf9NxmZvWURd+mq/rjDCODNCQYXf3j8y15eRL4BaIGmd8j57KdG7o0K63JkfCHvchLD/mF/RzqlO/Bw5zSOw4CSdWpJDy5455+LOF/jDEDF+cBbF3iY0euS1abLWc=;
	4:1c0JtTdISPNKVtGX71Cu3Vq1BpOqk+gUqwGYoxVtjGgBOz7SrFmv2o90S0XnpPa8vSUu42OIm/bnn4XsS0ozAnFHAxn5uJF8ygPh5YMiZ5n6CGfzzPwWD7u8ylJdtlCVwU6sBcQySupayDteIHoRLoAQO+l4t+Kc4WEQuc6Q0oVZOT47AdMHxIj190SUAlcJdcrbN79yKRzCBqKEgTq2PIj2pTy5fFRGAVbfVIjkO++7cvgKk+7YWW8aJKACq3M1kndBrFlT6IQ+Su4m/upH8t9kTZumU+9eyjtPKJQbeJY=
X-Microsoft-Antispam-PRVS: <DM2PR0301MB118133B1B665BA435FE8A18786730@DM2PR0301MB1181.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:DM2PR0301MB1181; BCL:0;
	PCL:0; RULEID:; SRVR:DM2PR0301MB1181; 
X-Forefront-PRVS: 066153096A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB1181;
	23:ZBTsYxyyBKtMq4YICSyUKKqAAXW+g26TZEvGYCv?=
	=?us-ascii?Q?b5ItjXK1Y1uOXvEZBSZCJB3jsIuNHtI74BVQD937cBgB/BVJN8RuWS14El01?=
	=?us-ascii?Q?3pWiYsmDqydbBlvVUi+holMWfC/WEHU3KNfOArEIh4gKEH15qZ3mz4T34pFx?=
	=?us-ascii?Q?qa1p4jQ/aEvMczgQezgC4dyqARARAAoG01r2tsK629buojAvQ3RT/VhcSBfh?=
	=?us-ascii?Q?3hG7ufp7M8kDGROPuaXc9JW6uyNQtYGHbLIvspWA15OOZipTh4TBYmJ4V/zr?=
	=?us-ascii?Q?g1j4SeKQsAPgWfGDXOzRSVyU45fECEjygWRlxMh4548+GbieCR1L0WB5sCrs?=
	=?us-ascii?Q?j8wLM0ZAfjbt35s57XLPT4GBcKzRkBgtFZgsBh+V7F7CG/zKlihQxXHq78GD?=
	=?us-ascii?Q?NDLtybg55fzIAiRJ6WQz5DFXfx2R5NQbHm5V1YlpWOzIwEIeoayW9yhHWmw+?=
	=?us-ascii?Q?9EFORmnZlNYXaq8eGqEIaLTPeJ4pMBuYvtic1fhEeFwxqyQUmHyA3Xj+Ysch?=
	=?us-ascii?Q?FnmdD7E2bbH63cRRI+iW23IpKLG3RAxf93dTN0QOnKwINxxIv4RiYORUi5zF?=
	=?us-ascii?Q?Ocg757PxjfUoShVWNiI1tTv8EbSKAYelbT5odQudRqYZQiqlo+eOeTyB05Dx?=
	=?us-ascii?Q?4T1L4aYqWbFxG+fmdVRY1wpLMJEogl8E0xogeihFXs+z0Q7PM7F7EpcDjdNI?=
	=?us-ascii?Q?Wbi/TZHMtN+FVXC+hCRtq3IxW5L47lZ8/Qyneq7qu6ZJpSLs19lnck62Sm67?=
	=?us-ascii?Q?P4aBKRz5ajxgE7ZtYr6a4CgZM1FTMv04WfaJAp8brtUQCwQkO0L4IjASKq7M?=
	=?us-ascii?Q?OFeWDtqJMDTBLdj3LMOXP6AhP6S0zvjfOOmmgxEHdhJ13ngNhvRUIqU8hxIL?=
	=?us-ascii?Q?PH6OxHuRljj6a3P06hv4X5BCprY6RRoE9o32BHtaxu+9M6xx/7gE5n+kq0gd?=
	=?us-ascii?Q?yBaDEp4WUZZ/5Epf4KjrWDyJz3s5RUK+illD5VHuc7jENWmPcVoqAk/eVlN3?=
	=?us-ascii?Q?zz5nbDB9sTD9+XdGxAidxA+qDZCbGg9uLHTgRsDXa0Y0gg1I+AEYf4PA/VP/?=
	=?us-ascii?Q?Dwlsu7sQAPjLUhqHIpWC5HYEslO/DYz9fdZQv8lg+qKjAQyYlFmstDX/i6A5?=
	=?us-ascii?Q?YwDsHw+k04r0=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1181;
	5:xBCM1ee1vqtZMQD5p8Q5cseZX6n+MkQHmURslrtQyPok68kQU/iSF1+CGn5fLQMMXQKoABwwC1Yv4EkaF/fXFRg4/Z476CNIL3yjMUQdEwJAZt/Buw1Ub912qHYKaFRH3LPPwfp2e8Dr+DXeStej3g==;
	24:9Obvw1p7EEpUPD0GdsAID79aNubvI4VOzSPEJ+CJ1LKwQCEDr0CpU/C0bbuKIrAXRvpeLP8l09c2+e6UKWveNTXppF87mSjc1Px0uf/MjCk=;
	20:yR1nHePEg3HMdgQ2wRm5ZV6udXnJBCQQeI2XHia/dczqhvdi82yrXIyQV5W9Vhg8eInBIsr4MAoS0alM/OZdiQ==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2015 06:16:33.6488 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1181
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1279;
	2:ufBFxgyK1h0thHl0muKirkVSkTOM7I8iiIBsQiJZyHGSHie8IXZkeeEAl543sBP6bj6EgV0jnC5JZXhsgfUVLKiEsrzbGoMTKVmcpOubNHhgS8FhWp1Wjy21/4AxSs9ZhTGL4mu74Pw7mLB+aJzKs6u2lLvsqX5wjxHznWcXaTk=;
	3:qvUEkGiBftvdAQcVpM7wbgx5jpq8Eg5Cfmcs4/eGd1pwT+3FKC04wrzHi6vP9jtZQjcworEf+f9YAUeFvo8iBs1wSDjJd6Lx0iHUkZeULlUCY/mRyPK5a+odA4iEMm5IhzND3Y8wt8CrX6oPe0nPAfhhxa4K/y6lFmnQZdqOfS5FuLqy/RbLcsmlJokVrXUTXIFXya91WeUBZKtZNnu9PFvXRl2AFNNHQ9ob5y8aJZQ=;
	25:ap1N+ehFhyjz6gQZUIDAHI/Yi3TQGiRwl+vz7chVfrsM6ae1gstG/WQJ70rX4hJQSTtiqco9ytXMCBCYzvuZhQelmOIq+FcAYkrkNvfLDRwB7rBWEPAnpTDPwtv1FSx47Scs7pVlMZeMBQC39PkdSPwWOcId24f+o6+nyJUYaZZpe6JEKmapj6beSmhOB7hyurDzJLBkqvjy/lmsnVvdXCsk9YfuB1se2uFkT8qri+sX0KOZOFQxui77ANGVbwY+;
	23:WIf/vIUh2ihovLJS9DEFxPfchj5+Ht5ZBY/iXTFbxmUNdURlI5shDmRaqYdyIUAoDuE4I5BaXS8fzkTl2RA1gb53xNWp/JcMmHiE/ksSSKZK9Vz1UoNIYhn5rrN1bqZEPJf4lEyCIWddn6DCOkyi2QM/63JniYKtmAapnB42BukmHhZUsb+F6U/6fXoMe6L8FbMoln1RNH7RxHP/Jr3QDIe3L5n9SK4c31q6bGAluRmwZHat1q8N6/d+6R2GwaR8
X-OriginatorOrg: freescale.com
Subject: [poky][PATCH v7 00/11] gstreamer1.0-plugins-base: Add patches for Gstreamer 1.4.5 base
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
X-List-Received-Date: Fri, 07 Aug 2015 06:16:41 -0000
Content-Type: text/plain

-Fix id3demux issue

-Handle audio/video decoder error

-Update video alignment after video alignment

-Gstvideofilter use new GST_VIDEO_FRAME_MAP_FLAG_NO_REF
 Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF, keeping buffer writable
 Don't ref buffers twice when mapping

-Keep sticky events around when doing a soft reset

-gststreamsynchronizer: Sending EOS event instead of GAP event as GAP event has issue when A/V have
 different duration.
 Stop sending second track EOS event if sending the first track EOS return fail.

-basetextoverlay: Make memory copy when video buffer's memory is read only.

-gstplaysink: Don't set async of custom text-sink to false.

-ssaparse: Enhance SSA text lines parsing.

-subparse: Set need_segment after sink pad receive GST_EVENT_SEGMENT.

-encodebin: Need more buffers in output queue for better performance.

Yuqing Zhu (11):
  gstreamer1.0-plugins-base: Bug fix for id3demux issue
  gstreamer1.0-plugins-base: handle audio/video decoder error
  gstreamer1.0-plugins-base: update video alignment after video
    alignment
  gstreamer1.0-plugins-base: Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF related
    patch
  gstreamer1.0-plugins-base: Add videoencoder related patch
  gstreamer1.0-plugins-base: Add gststreamsynchronizer related patch
  gstreamer1.0-plugins-base: Add basetextoverlay related patch
  gstreamer1.0-plugins-base: Add gstplaysink related patch
  gstreamer1.0-plugins-base: Add ssaparse related patch
  gstreamer1.0-plugins-base: Add subparse related patch
  gstreamer1.0-plugins-base: Add encodebin related patch

 ...rlay-make-memory-copy-when-video-buffer-s.patch | 129 ++++++++++++
 ...rame-Don-t-ref-buffers-twice-when-mapping.patch |  26 +++
 ...-don-t-set-async-of-custom-text-sink-to-f.patch |  31 +++
 ...frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch |  87 ++++++++
 ...3-ssaparse-enhance-SSA-text-lines-parsing.patch | 225 +++++++++++++++++++++
 ...r-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch |  69 +++++++
 ...t-need_segment-after-sink-pad-received-GS.patch |  69 +++++++
 .../do-not-change-eos-event-to-gap-event2.patch    |  49 +++++
 .../do-not-change-eos-event-to-gap-event3.patch    |  31 +++
 ...eed-more-buffers-in-output-queue-for-bett.patch |  32 +++
 .../fix-id3demux-utf16-to-utf8-issue.patch         |  54 +++++
 .../handle-audio-video-decoder-error.patch         |  64 ++++++
 .../videobuffer_updata_alignment_update.patch      |  53 +++++
 ...p-sticky-events-around-when-doing-a-soft-.patch |  46 +++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  14 ++
 15 files changed, 979 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-basetextoverlay-make-memory-copy-when-video-buffer-s.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-gstplaysink-don-t-set-async-of-custom-text-sink-to-f.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-ssaparse-enhance-SSA-text-lines-parsing.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-subparse-set-need_segment-after-sink-pad-received-GS.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event2.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event3.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/encodebin-Need-more-buffers-in-output-queue-for-bett.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch

-- 
1.9.1


