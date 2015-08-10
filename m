Return-Path: <B54851@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0117.outbound.protection.outlook.com [207.46.100.117])
	by mail.openembedded.org (Postfix) with ESMTP id C4627767D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 03:41:43 +0000 (UTC)
Received: from BY2PR03CA075.namprd03.prod.outlook.com (10.141.249.48) by
	BY1PR0301MB1175.namprd03.prod.outlook.com (10.160.195.146) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Mon, 10 Aug 2015 03:41:39 +0000
Received: from BN1AFFO11FD021.protection.gbl (2a01:111:f400:7c10::100) by
	BY2PR03CA075.outlook.office365.com (2a01:111:e400:2c5d::48) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Mon, 10 Aug 2015 03:41:39 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD021.mail.protection.outlook.com (10.58.52.81) with Microsoft
	SMTP Server (TLS) id 15.1.243.9 via Frontend Transport;
	Mon, 10 Aug 2015 03:41:39 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t7A3faQS000825;
	Sun, 9 Aug 2015 20:41:37 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Aug 2015 11:41:32 +0800
Message-ID: <1439178103-17813-1-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD021;
	1:w4mC9ZJV7xkgy87BmY8/wGS66YX1zL114CATC1t+sg76MvAGAzlTJhgHWtLaIGfDs+dd4htljtnRwekq6Em9wmoR3fTYGHrcF9MTtc3XZRO1lMM1e8SmYSTvJxRSsho+MfWpUTOzuuNTMIMXC5vcX55AnEsZdNNx09lGTB+vO6at6HtyFvBFAAahOIW8rLAQtBPben3eCxAGUQwx3WzmGn+fYh/nmgFAlzHy+spCrOQ3S9bAUxR83g/NWPlIISad1MFxhWFmSp2i7SuR+QtxaM19FTQ8Ng1j8n0QDSohARZXDC1kklb6VcwYrx8SncJBvTreMZxVxPsNw9v001OW8w==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(46102003)(5001860100001)(107886002)(5001960100002)(62966003)(69596002)(50986999)(48376002)(50466002)(92566002)(85426001)(5003940100001)(110136002)(230783001)(36756003)(68736005)(77156002)(104016003)(77096005)(106466001)(64706001)(2351001)(81156007)(33646002)(450100001)(5001830100001)(229853001)(189998001)(86362001)(50226001)(6806004)(47776003)(97736004)(4001540100001)(105606002)(87936001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1175;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1175;
	2:/M65YefoYx9Y8lvu2Dlpn99nTwrHJEuOAkdhFcqUau01oKZwX6TdAWxcvoEjXJnE4+IzpkoujaZm/Wkn+KGrH3vDKShHEMEvEGxYXJK1GJkizWgVY1G9tT2RcLktYRtXTRlARX8q9mwZvMJ+DYaE+5KrQIOAraMqGFhQmsYWn8Q=;
	3:dosbUkR5W+62XIPOk9V/WvRnFgU1Sgwfym0nXtv/n6oT2yOIBfb03LK2+oPBHvdeuWd1nlTuQ2DviX0yrVnVGUX+XX58HymnBnWxjO5au5rFJchMua+yi1AQVN42KqoCAL4hmh41jcvfKL1gYn5d8yKJqIbQqDOqZGqLpk8S/CboSYvWuU8Wm8NhXiNPZI/V+RfKWePKclzxRipsiNwzLUaWKPO4kItzW3YkTuq+PKw=;
	25:V5rhStAHJkLX2yV3kdBuEClsmFRB3T6mM/sQd0xkbk2reBHMIOhYEZ74Uqiuwdh0ACZX6OqcwGgmvU9QvDBPAkhnqwi46cGe448a7RlU2yvFP7/dFRsYz1CILvAPl/d5LRJTOUPtt3y6MD9c3IILHlSCat33rVKYdkRD1MCNNnJMJl9aqJcsUNvievRFQdyclViRU7fwfz5P8yZH/LrfpX5jyDU16bgjErW27JMzem9e9Ll5OU+QVHW5Un8tdLYY
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0301MB1175;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1175;
	20:P4V/DqNiomTjoyzLumkYfiFU/8S0NLbefH/XKwOEjxjcZKnbKh1QCERq5gxIm/rDRaR7IFAoOwNk+CdkEyDnsWiz/jn6nRgbijFPk+9zgXQPgMRjeHKpRtk7yj4uPOeue+vfRtAdKSXuudIlEbIdzOXJtHQf7d8BpdVnB0LgF5FJkrl04cDb1VyeUAmSSojf0tHVwmwcMi0XIQnswmnd75pWhuSu/4cC4awWIqs9Ct0ez3XveS7XS9ftFsNIrieSmtHFoQDPZ+jYP/7q0tPSoqTYFKGiWV7hU91yHfxqCkbPJ4frxRSdLceZl1dO5HPwY4iONw1cWNe36djC5CbbYaQG0oNzvdCbhQilG3Px/s0=;
	4:V2yJf4NEUk7qylO55EP6mP1f89VF8GDs1KPYpcwPM7wvY8lCS48pP9vV0V4ySMfIJD0QKnHeyRjTRz0BOfpcZuCbtYoqnnKhZ9s43OyKTqasDP2ocDhB2MbwlVnkqcFIvIuahhiNE3lxRBVA/XUgfz6SpXHLW24+DvYe4pHKsrtF/wormTtJLUG5xsiX7cwxXVoQcnqcFgGa0YqrFBvKIdvsfpGOgFIXb+fLKjOhM0KLcvUdfUbJbW4WP9i7s+B6qudVFE6+Qtfi4ygQlPvr3/D+PqlH71JK9dQOnImVrqg=
X-Microsoft-Antispam-PRVS: <BY1PR0301MB1175F8DD892B37E3491A39BE86700@BY1PR0301MB1175.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BY1PR0301MB1175; BCL:0;
	PCL:0; RULEID:; SRVR:BY1PR0301MB1175; 
X-Forefront-PRVS: 06640999CA
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0301MB1175;
	23:9EeliFgeHLOhe3YtNpcqbu1pEQSZorpaoZvLKWA?=
	=?us-ascii?Q?MdyxiIOHSPyMQ+m48jiPBH1CwBMjXSEQPgviDKca0EHdnfJwgT3HnW0LRnDN?=
	=?us-ascii?Q?XuPhup44dIiXf8N2oJNYM2LRrY1W+Poyu25ITsASFosrCpayhGFhUjvdv/9w?=
	=?us-ascii?Q?1KNB1uQCm5AeQjAt/WrfepOWm57k5WsB7rfDdGGiOd1zkBSja6fD1ug5oYva?=
	=?us-ascii?Q?9jxtkinNXoUM8qcr2w+UDCU6PBsN2I54CtI0nGTaWR0HDaYKxKvs1IYpstQI?=
	=?us-ascii?Q?4ZHP9nJdUJnmNAXUI7j8TDp5U4IBs+U7XsIQl2Y8TF+Ok8fh84rGleOKEhlm?=
	=?us-ascii?Q?5eKbhwtmmoV1lULL0l2UmykoTioQhg2YRjivN2yeQj+CFD3LSytyZ9VBxhvH?=
	=?us-ascii?Q?qjy0q+XJE5kNNZ4Z4YWUtlKJPSdZUY0SvCMLE97QaKya6QReP8C/Ij73xcWZ?=
	=?us-ascii?Q?9W//jS1Mw19/6Ptt9Sw3R5ZUPMhjMusNBVmgSP0KnPsyyhl69G9nZD/r7M5s?=
	=?us-ascii?Q?HE7LmGgQp3SHdqk2jjt/0bWcARviNGDDkRrkseQF8q6vEvh3FqXeMLObhz6n?=
	=?us-ascii?Q?8++H92+2mYHvXnVRKKv75ajThtx7zS87RepZHL4L7SYO6MDXkx+y5csudH1b?=
	=?us-ascii?Q?8n/chCMInJ/TQjUV1ANtKVoLEPXaYf9Q+e0dMP1fzpg0pyR59f0FZN7gKPfi?=
	=?us-ascii?Q?MW45m0HLseyoHyyAzvWGB3H/ZpcWZcDMFJ1l+RbOxB70DQjvZd5VbPcIc0Ng?=
	=?us-ascii?Q?8kyWdpO3rzhMeyrOf6el3ZC1Vl/W7PnvE3EpU/eosan2AczWVJXjqPcMUwQH?=
	=?us-ascii?Q?X33u8/qty9GlQRGPGB7GSzACGvZ4Z0qpuD51TEZknnsIdo2q6OJiCWN1qb8P?=
	=?us-ascii?Q?m/12AxEtIpOnm9yNdF6yFTroKtaoCe4r04MrWwjwx+jktquCeckEIDr1gwnL?=
	=?us-ascii?Q?RnR9kIACYuCEf+p0TnoPI23SwV0inGuRR1O8AOuL+6pyfNVl7GxoGUVpdAGd?=
	=?us-ascii?Q?dtbnQhCxZ59AvbSw+glneXppTUJ9dSr5H0mPN5q2baLks3TVVChaPj7QYrxE?=
	=?us-ascii?Q?C9v1AbCi66vK+MLh+dzdeffGKwUVge4hxH13CoTxbRXt7uKmlF5CBtz0G32S?=
	=?us-ascii?Q?bTTxGt6f91/Y=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1175;
	5:8+c5s46xMMyS/BFP15xkBoYWEMfk7c9gznI4q8Jiic+qeFFD4UCi/ucYtYtqOz2x8nwLkMhsQrcGWlxZ1IOnTCdPEbtfTBL82f+KiG/xrRjOaZuthIjuP2JV6yksPAPXAD59CV6lz+1iMcW+bg7A5g==;
	24:WRI/n5SxSfj33/vOveU+A+5cduUMndwm4VeYvnZb7vrPvjIePQJhkNjh1VFI27Ct+xmT+uw24+LuHOcrottnpgKIuehqEn0EAkXOkOC/mMQ=;
	20:awL9FhTb8nSeZCIeMjSxsshW2v7+CUacBDow6LXi2wxK1+tX14Elh6n8XFWQQ5tgudQsdt2rCbUM5AysuoWiCg==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2015 03:41:39.1036 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1175
Subject: [poky][PATCH v8 00/11] gstreamer1.0-plugins-base: Add patches for Gstreamer 1.4.5 base
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
X-List-Received-Date: Mon, 10 Aug 2015 03:41:46 -0000
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
  gstreamer1.0-plugins-base: Handle audio/video decoder error
  gstreamer1.0-plugins-base: Update video alignment after video
    alignment
  gstreamer1.0-plugins-base: Fix output buffer can't writable after
    frame_map() issue
  gstreamer1.0-plugins-base: Keep sticky events around when doing a soft
    reset
  gstreamer1.0-plugins-base: Do not change EOS event to GAP event
  gstreamer1.0-plugins-base: Make memory copy when video buffer's memory
    is read only
  gstreamer1.0-plugins-base: Don't set async of custom text-sink to
    false
  gstreamer1.0-plugins-base: Enhance SSA text lines parsing
  gstreamer1.0-plugins-base: Set need_segment after sink pad receive
    GST_EVENT_SEGMENT
  gstreamer1.0-plugins-base: Need more buffers in output queue for
    better performance

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


