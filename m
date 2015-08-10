Return-Path: <B54851@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0118.outbound.protection.outlook.com [207.46.100.118])
	by mail.openembedded.org (Postfix) with ESMTP id A36C9767D6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 03:41:42 +0000 (UTC)
Received: from DM2PR0301MB1183.namprd03.prod.outlook.com (10.160.217.145) by
	DM2PR0301MB1326.namprd03.prod.outlook.com (10.160.220.28) with
	Microsoft SMTP
	Server (TLS) id 15.1.231.11; Mon, 10 Aug 2015 03:41:42 +0000
Received: from BLUPR0301CA0036.namprd03.prod.outlook.com (10.162.113.174) by
	DM2PR0301MB1183.namprd03.prod.outlook.com (10.160.217.145) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Mon, 10 Aug 2015 03:41:41 +0000
Received: from BY2FFO11FD055.protection.gbl (2a01:111:f400:7c0c::172) by
	BLUPR0301CA0036.outlook.office365.com (2a01:111:e400:5259::46) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Mon, 10 Aug 2015 03:41:40 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD055.mail.protection.outlook.com (10.1.15.192) with Microsoft
	SMTP Server (TLS) id 15.1.243.9 via Frontend Transport;
	Mon, 10 Aug 2015 03:41:40 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t7A3faQT000825;
	Sun, 9 Aug 2015 20:41:39 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Aug 2015 11:41:33 +0800
Message-ID: <1439178103-17813-2-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1439178103-17813-1-git-send-email-b54851@freescale.com>
References: <1439178103-17813-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD055;
	1:v6bc5Y0iG9o0AxzcoltgF//lwM8TanPkaH9vx6tLG/lLRu3l5SBOwMvyCkP2ChtNA8RqsTNkOUECar/oNS/cWfyuFrm+DNYmpJiUjgEbXT6sGIdPyrRqJl4aQtDJblU3eidJowbyGGkiNmNP+HCrOwDsvVtZC05ok+w7PeFduqXaTTKpE8B68rwHkYnj1EvVgjcvwVsDPQUty9SbUlG7XTc0Oy2jDA1hKgBi4/gOkLEGNxMbVrrULia8YsV5YrNYAd4FkdeEJLAuO8Haflc2si92Ox9Pu8UkGIQkhoVSIhIQNk0bTKXezt2J8xU8Wa2h781ncHzNjBimbqydhU12yQ==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(86362001)(46102003)(19580405001)(15975445007)(19580395003)(106466001)(50466002)(69596002)(5003940100001)(48376002)(450100001)(64706001)(105606002)(47776003)(62966003)(77156002)(230783001)(2351001)(5001860100001)(575784001)(87936001)(189998001)(5001830100001)(33646002)(81156007)(4001540100001)(92566002)(36756003)(97736004)(104016003)(6806004)(50226001)(85426001)(2950100001)(107886002)(68736005)(5001960100002)(76176999)(77096005)(50986999)(229853001)(110136002)(42413003)(32563001)(4001430100001)(473944003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1183;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1183;
	2:LkEArjQaPyRS01tiK+8p9PFppEiH2J22LOcgKg4FRy2vW5wbYaBDgFNojpbFs9UBZ5Gmpy6FcVr2j1vGetVuPJEaZcj14kWdexJxZCh3etzRj8QCyE9OpJvz7L7Z40GR5Stk/8b+S6Tt3eOF46u9/kapFcPlbUNczzvIEcaUdMM=;
	3:3MI40665ZMwmJEliuvdjYS2djn8p+ygVGFteCs/0t53xe+DL6WR/qJMu2QwU3bqo8uLGCFLUXlkrlHs6ZuzxbjjOlyiN6rLJq5xKNZHoWGymmIA0z2Z0/UkHZaQcH+m+70eP7nJA8mXVL0wiKj/0+dRGCfNl5IfQFpnINYIuUtQoTM51PxqiUmaUvQ3gsBQrEGkdO4WY7N+9gT35cNm0lvmxCafdYbQoGGm+h+Z7EKY=;
	25:58uuQ9um9yC8gLmxZpWpqsXwU05Ow59Yp+H8QI2RLznqEjBXpGj01e0I8Py1fHo2lLyxDKPl4ZfQorD3SxZvlBIctOPOfp4YwiEG7jmWIrweyHT/mL85W+lJ6A0oiS3tdJVyO+LibDwJi9uT4R+3z/bCoxu/4dwbnb5UvamT/ckgEspQs+Cd6YDt8QwnLQbFb3GIfqSf50vfyWyG/EZVs7FmgHFGTNuyCYkjuLVA7FtaechrQYrhk4utk5Rie/ON4qERGJ1fK4PVDCFlxBmusA==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:DM2PR0301MB1183;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:DM2PR0301MB1326; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1183;
	20:7yanyzXTQm3D2pCdPFX2+vU0AyjoTcddT1M/JjEFAVuQzVj5dsSAAW8lnWCYyoNWbKcbkF4ADgFZbkxGMXe/8ANqpHObicHuQR2ux4I2LlwVw9+v5iUf3m9QJr687z6Y0Mjx9j3UsvI2sJy4EAwEcvXkHpwSAfi18fRWSKYCt3yKgmAx/cCxKSzx52kLrnCuI7Ap2N+SChBqFqs03I/lTON89CjUsOPER8fGq0KbdpVAIPIgip92oPgqXWCVcsVmpbN6lh+4GZdBPVElc04kSp6yDlIjq2vDPs4uP1nQAYocw4LTzEULP3GdB1tPrKnHv09mjkBMSb+QCBbfbm/n5bw5UjfjOX++Uu/pZMQIIo8=;
	4:FY8fdRpskH2nk4PtoB4d4UvReKxFkNRjlg/0nK7BPxAso1cAKfVlma+C3NpQrD9Zfd3gAQTMnY8289EH2ox9u5WfwrXc+joqPq7WWC9YgH72BPPii0h9yYuUaTCgltM2IF1NASObkkXLGTW2rrXr0Luy5GKP4HNNZz4Dqiw8UPRqKs79b3vL2HyNrzcJjjwIHGE9++pSqSupTdQI3EFIGpxdA26lZeC+JRYvqc6F/2J8hFaY9h7F+dsGf98YuVkUwAT81joEkCxfH6+Dt4RVL8xj2MnIL286rFNJCiVZWP0=
X-Microsoft-Antispam-PRVS: <DM2PR0301MB11835AE8C1F5D35FFAAA82EB86700@DM2PR0301MB1183.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:DM2PR0301MB1183; BCL:0;
	PCL:0; RULEID:; SRVR:DM2PR0301MB1183; 
X-Forefront-PRVS: 06640999CA
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB1183;
	23:YGEdCb09rgQvAfsTm4bxYGwWee2Cj36fAjStSmn?=
	=?us-ascii?Q?4DEaBgUxCQaUD326mGIO2UQwT6qELHoL3EftdvwGHy0m+8lnkyyXpBHT5RQW?=
	=?us-ascii?Q?wDjmiKaFsTbACNAAGlEhQa2XI1A0Gr97EeMk0pQF8IRx8IiXhLYnwvlo+BHI?=
	=?us-ascii?Q?DMriCcY2+s4SXAxmWxQvNHe8NvgwI/ReELjDyTksvOGYMWaoAA/nJlIE6el7?=
	=?us-ascii?Q?1unXHLmnwzQ/62KTSOR/iTA2Eyb+dUEvkYrp5EFrCXeT/br3ng7sei8fJYSU?=
	=?us-ascii?Q?1UlG3nnjp0NjSxrJx+g4lNZ1bgxkdUx+frFF56aRfPa2+1jZVQtRIm8XhtST?=
	=?us-ascii?Q?LlslUf0sf6DnVUuMcNLn2DYRI8SuwVWLHVrD/D1/vVZl347kWecDmiiBAqug?=
	=?us-ascii?Q?O3c5yVM0Za609nUcKK9V8GVCBfBrVVfUZINGzlJ269pxHoEH4e0YEHRLzFSV?=
	=?us-ascii?Q?0A3FPZjyIOKPh+5QTSe52WAbHDRUHN8ZCd26X2ItQB6k1oPO/3abVfNPA4Vp?=
	=?us-ascii?Q?tyZLCZizyFiQg03m7hLI/kKT/a9b+fg1UYp8zSsqliE7wwDYpBD8EYs4Qknb?=
	=?us-ascii?Q?qjGQFGHiR4sgiu9oohXhAe5HsDVipjo8PYfPjDaFI0Iw859B7t3FPfL0Qvlm?=
	=?us-ascii?Q?EcefA9w09FBLoyVIVafCaK14pUzMyGxpq5/Jw+uD9U3+p0r2eFATImFYz/NC?=
	=?us-ascii?Q?UvIcvgkTj+krb/3dmo1k2vILwFyE6H4iGiuw0xXwpgim1PtoDm1rulEZcKBi?=
	=?us-ascii?Q?3nNZhgH7w3G12tXiWMXUy9L5IpL7gBlrO1sjJed/AR0/UiMBBFWCBfAIBVrJ?=
	=?us-ascii?Q?c8FuzGlLclowu94XVw12V6Oxz8MHGgbzo+R8twbXBZEwuedL5mqC14O8+uz7?=
	=?us-ascii?Q?NS5491bfhnJukGiVbIQSfuDrwbp8DnE005BqvnhAsxlJsIvC/t6uCc6p28mP?=
	=?us-ascii?Q?2ttAU6QwJV91IZ9LJz+j5YmqQtXo2wBVgtTsdJFL97xMvVB469EdGgcrOIt0?=
	=?us-ascii?Q?T+KYUjU9p9zCs/o5sRy3B1Ar9YPL/OBXDcLvCQ0ZNWl4eoQWXoTXJG7BVMVe?=
	=?us-ascii?Q?KTLZJJ0HFVFw1vklYyb8qOdc10cfDPMsr+SI9FZX4xyxtcYUsJidd9fPtzPH?=
	=?us-ascii?Q?lvxf6gI0azl4lWELy4NH/vqzZ5mu0V05vlfYC4KNU1nZNWHUj6LSoIndJcPh?=
	=?us-ascii?Q?Ls4TDydw3Z1lFPy/EQbXWSp/a25ViDI1A5EjjG66z1eVg+JgkW8b+uJjr4H4?=
	=?us-ascii?Q?KrOTRoEcRHa0WCr1QMnN9c+QHypqF5If4DPuAuyPh6ain777LjLaYngZp8Au?=
	=?us-ascii?Q?2Mhh3gcrQ4XI513Zvjid/OaMn8aVabf2hs0cy0QAeQ2wj?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1183;
	5:thiQ9/HIgOatLF3CmwgbxuKRdmPHlgymk0XYcZrD1wsZASmhxQ2aU7IQwPTft0WbvuTmefkJHtH0PhEjZ6sm/YUTwOxmQjHfWB1gwBMmp/tFxMhg3FBZcJdVoEkIByDGJDE8D7ytaB/q+QwoBxJcVQ==;
	24:7yRYmdysnA02MF81yt8ZvpCaSzCRLeI0KPX9/NpaSvblEgDxSyUmNLEhyPRiWa2o8T+mBmC3ErZJXBu2ZnDuwql3jznp2PcALDjqQTdn+SA=;
	20:QaEg8/SCSKZ7fOU8s+Ka9NaX2mxqkDW7HIb6HRuBu4GAL3WJoOzKwY9rNyHPWHeMlWkYuLX85se4JI154i2NHQ==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2015 03:41:40.6032 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1183
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1326;
	2:0XWEkLLf7DwFfNPZbPd6+rK4N+4KhzS4i/C87Z+CyQFtdOGJvLwGEknMfke1cUo0Q/bG6fGWTuS7gHTTwnOJ9HP4KlehRLB5ZTdJonKiNnfWh7Vx34P9eUTse1TRn6g5x2QG9n06iruu1V+FSTUgZLiFGURQRQQovV+AP6aB7cg=;
	3:jacW543cwnNixAPr5oJsCVFLoOnZQsaqF/MrW+ljAfnEfD3AWdI7+I866LZI4B52ya+1qagAi8T7WXrD95hDGl2zRudue8CkLR0qyygLevG7bQc8gimsXU2oeXSAtRvvNdMmBb2ALwONNKnrIWf6xcY9hWuazG2ZwxkvSaN+4Q8j1/rUCeYHs3dwa1LsudJGOxOvv+5UBnc0zt3vYRdFaySLsN1NDDZELkDWSScrEhc=;
	25:Oca1E1CAZ6LdwTDdDyJLZ2RPIDR50jZoBfD2PeKCazGBp0NHEPLkEc/k0y5gqjwrFnyatLM0pjUZ0Tu57ayIjXMRpYN3xvK0YzAB7yNKLHgrfdJKoRumVgZbaFNAIbXkM6UidLviODN/QlQzSvWirjCfqJwB0ow2ADnvTBgZWtOk6I3n+Flyqe1VXEHUW/+OkLYGwCOyhFa2zJ7mjU1B+BG+G9pZahM7YKtP71NiayUswtvUISpbxijez55XKl9UfcjKZOITxCxb0AlVN5kI1A==;
	23:p0XH9DSWSDusr8C4f4G0qpv2rWK+oI2ByEY2Gh966CU1uah4eXRIrS4MWOncmdKQmVvyV1ODf8O3aMPOPMZPjdxHvAqObt8Ad8GRByRBQThB5zbAEOvkgwXeixfN7YLvmz3MAs0L/E2LgL1dIDEfWgOfDN9jl9kmuhCPxyPdwRy+PG11TqXfQJKIDctA2NMH
X-OriginatorOrg: freescale.com
Subject: [poky][PATCH v8 01/11] gstreamer1.0-plugins-base: Bug fix for id3demux issue
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

Use g_utf16_to_utf8() instead of g_convert to fix the issue that
id3 tags utf16 charaters cannot be extreacted in id3demux when try
to get the id3v2 tag such as TIT2, TALB etc.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 .../fix-id3demux-utf16-to-utf8-issue.patch         | 54 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  1 +
 2 files changed, 55 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch
new file mode 100755
index 0000000..ef3f75f
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch
@@ -0,0 +1,54 @@
+Author: Lyon Wang <b12696@freescale.com>
+Date:   Thu Oct 9 17:37:43 2014 +0800
+
+[id3v2frames] Bug fix for id3demux issue
+
+Fix the issue that id3 tags utf16 charaters cannot be extreacted in id3demux
+when I tried to get the id3v2 tag such as TIT2, TALB etc. it will return extrac
+failed.
+
+Checked in id3v2frame.c,  When parse the UTF-16 streams, it used g_convert() to
+convert the buffer from UTF-16 to UTF-8, however it will return err that this
+conversion is not supported which cause the extraction failed with these UTF-16
+characters.
+
+In the patch, use g_utf16_to_utf8() instead of g_convert, which can convert the
+character format successfully.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=741144
+
+Upstream-Status: Backport [1.5.1]
+
+Signed-off-by: Lyon Wang <b12696@freescale.com>
+
+diff --git a/gst-libs/gst/tag/id3v2frames.c b/gst-libs/gst/tag/id3v2frames.c
+old mode 100644
+new mode 100755
+index 3785c2a..7b9d8ac
+--- a/gst-libs/gst/tag/id3v2frames.c
++++ b/gst-libs/gst/tag/id3v2frames.c
+@@ -1057,14 +1057,17 @@ parse_insert_string_field (guint8 encoding, gchar * data, gint data_size,
+         data_size -= 2;
+       }
+ 
+-      field = g_convert (data, data_size, "UTF-8", in_encode, NULL, NULL, NULL);
+-
+-      if (field == NULL || g_utf8_validate (field, -1, NULL) == FALSE) {
+-        /* As a fallback, try interpreting UTF-16 in the other endianness */
+-        if (in_encode == utf16beenc)
+-          field = g_convert (data, data_size, "UTF-8", utf16leenc,
+-              NULL, NULL, NULL);
++      if (in_encode == utf16beenc) {
++           gunichar2 *data_utf16;
++           guint i;
++           data_utf16 =  (gunichar2 *) data;
++          for (i=0; i<(data_size>>1); i++) {
++            data_utf16[i] = GUINT16_TO_LE (data_utf16[i]);
++          }
+       }
++      //field = g_convert (data, data_size, "UTF-8", in_encode, NULL, NULL, NULL);
++       field = g_utf16_to_utf8((gunichar2 *)data, (glong)(data_size>>1), NULL, NULL, NULL);
++
+     }
+ 
+       break;
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
index 11cf8b4..aaa1ecb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
 SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
             file://get-caps-from-src-pad-when-query-caps.patch \
             file://taglist-not-send-to-down-stream-if-all-the-frame-cor.patch \
+            file://fix-id3demux-utf16-to-utf8-issue.patch \
 "
 
 SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"
-- 
1.9.1


