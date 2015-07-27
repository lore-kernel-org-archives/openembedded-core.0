Return-Path: <B54851@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0136.outbound.protection.outlook.com [65.55.169.136])
	by mail.openembedded.org (Postfix) with ESMTP id 49C9773D13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 03:27:09 +0000 (UTC)
Received: from CO2PR03CA0028.namprd03.prod.outlook.com (10.141.194.155) by
	BY1PR0301MB1176.namprd03.prod.outlook.com (10.160.195.147) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Mon, 27 Jul 2015 03:27:07 +0000
Received: from BL2FFO11FD014.protection.gbl (2a01:111:f400:7c09::157) by
	CO2PR03CA0028.outlook.office365.com (2a01:111:e400:1414::27) with
	Microsoft SMTP Server (TLS) id 15.1.201.16 via Frontend Transport;
	Mon, 27 Jul 2015 03:27:06 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD014.mail.protection.outlook.com (10.173.160.222) with
	Microsoft SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Mon, 27 Jul 2015 03:27:06 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6R3R3Qe011344; Sun, 26 Jul 2015 20:27:04 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jul 2015 19:26:41 +0800
Message-ID: <1437996407-29463-1-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD014;
	1:HHL/c81fhOcmfyPu+mOqnaCb69sXfQOHEvS/V1pGqAeh2MYac1E+fhc3XTxDcq5rwGcLvsAgnEcfiMdsUxNKKnVCMmVswsYe9hMW0NrOuDtVg7hvbEuIvqyEo6Q8kRbT9lUjIWrGNpqB286JJq8XzLuGWmo6WswwVq6Kjgi2Wz4KzvSQ06XBjnGW6Xm1gy9KqvVyD6DernTkfzLV3vKzsPYdWCsw2DNLvMIgu7TYAPIidADVOaQ1spK+Es4Xhd7kdJuhv8k1ekwshGCuwGCXqplrhKBuZKfKg9ZEtgudFENTFQsnl4mQtIgA3OFABvI4OesxHM5MG9jLlVptzDKQyA==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(5423002)(104016003)(50226001)(33646002)(86362001)(229853001)(2351001)(47776003)(85426001)(87936001)(46102003)(50986999)(48376002)(50466002)(105606002)(6806004)(107886002)(5001960100002)(5001920100001)(110136002)(62966003)(77156002)(92566002)(189998001)(36756003)(77096005)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1176;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1176;
	2:xra0ycO60C314J1HAYCFBamOL4rXWsqeNjzHU0ZPdmiUraULQfCKZyx2bGFdxxplWdLSS+lXx/M4H6WXXgn+iSl2ELFAN5rfVQFGTyXJ3QPcPwHQhOHuDSBq/43O7NruWJSVP0S6vOkkQtfK7dIOPDz/kYC44iJ8Ob8SV4iaQ6g=;
	3:b1dx/FIrlYOPkVoqQNbhhWqJkWtHsFYusLWPTpTOjRj8igXkiS3bPh023gwo3JMG1hSmPDQHUepx7UfToM8kaui/ggnqRebL2Q5dby6p6VicfEKNwrJLT4nKF/0+nIETXJa7ZPjAf/0O5fTZgskQJWXtNf3SUw9MhhnuNoWyw4e5oEALv5adzzaftFrK5NUt8+CH/W5oOgzmIg1RvzkQIgTrUmfLzkEuUDsb8m7Gofk=;
	25:CyBW//KGRSxsrR70CofTZMVofML8W26GFC/wl+3ucmAffAP7L0srO/4yxno+di1C65PcwYxseSL8M0EaOVsfQDengHR/dqkJuyimloRCXYGnpSTWbCjmKEpaTBdgNiacSoG/S6oOjNTj+tYilfo4KMsNQOim2iUhcK8Gp+V0P8o4Fn8Lklaxp0WDeKpqw0+W2WD0IDtOrnAVarGsE1u1VOdo7uav13Jlfy7F3Yol1yMBuNHxSn4AbxezWE4C5zRX
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0301MB1176;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1176;
	20:xmeZIfAVV1ZcrkCTf5yxeRxreXHTzJbCuihtzhvoJvCEB47KkSZx5hlSzdG50UbB6YmLkwOYg7YsuAjxoYIvYH3xut7JjJGeY7e+g2iWiPIINZTt1lia+wCcstcZ6+R4ESn8FeGD9f7TmBj4rXbXBiwQFJs2LLnAdTW+5mL99rf0LfAteJavRxMjvKriXwgtbqXm8bHLRl3kpeFitF1gmCocqZ0m+MEGR4fn2PDpZxatz16KM0U24EeAjgnS17BeufWa/WfjmPZJAKdEQBQ54GkYVY9qe/CdkLOoMByI8SJI4z52uLgXpRSH5joWXjdX/hC986P10ElxvhbFClqUfqTIiWVFFftC70fTxlu3KOM=;
	4:p4RVTI5Zg20hrRRASXmkdY4gpWDemKg/B32kw/H5QHN9fg0CwpZD0ia2svu6SQTpLyX5erNwMQiymPkAz2ktbGCkh7WJjihPIOttkOIEwSf/aPhecsfbetQn8kBTRCY41/CDFWzKJyrvZg59AcvSX2emKGCHuw96rmbjtw4Yip3UBdJWLmHyQmQA/ftXLHK236NE1ebrf520sgj7Igmfp6G9YkCHvcyhHTXklgeP0nQznlilnzzkHLFgVgtn1YF5H42gqVhrgVYi8UEk1U2YXX8BysLKP0Au3U1i+xjf/Hc=
BY1PR0301MB1176: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <BY1PR0301MB11768B6BCF449FA31A73F402868E0@BY1PR0301MB1176.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BY1PR0301MB1176; BCL:0;
	PCL:0; RULEID:; SRVR:BY1PR0301MB1176; 
X-Forefront-PRVS: 0650714AAA
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1176;
	23:objUZPSwVvbaR9LmuOFAEYgiwKwVU3uA0l2cUXcTJTtqarjYiPaaLqC7Gnr28SOIs+MEvcniylu5Iy+ZYlQn5nS+qNXO3DsO3bT5kt2b5hTqYFxVuIm5UqCKftIMvLOX03g+aFocPeryT0kttQlMm0QvRM5WYT/wO0n7ptgZ9E31ZDrg6X+TVdn3D/8aCiipvXaDZlLUXhiURLXZYTkEK/tg2VOdF5ivklHlT5/zCh/q/VCVLtpDm3XNQM0/KfIP49qIZHFS7r6sAyhh31zi7+dQbNp3CsJAdjI4ITqhXxMC/qYPfMi9PEoOmHP/VcakGxk7AptdjZg2aOT/iPg7ej3xSj4ooIQADD4j+wsZRRrL+zYhMNhWabiXzvh4qcmDzLEGYz9rQVWVLx8F9K155mU/0GaWWhLTAQLVNBXTaKFGpKE+sH2HKkqIrsfmW47ei1sCE8ndNUap3nFfk2zvEhylAzsLOxQpilcWMuTnxkoPr/cxz8qT0FQPmVV/NWgBiAiDtGVVuEAe6poU8FFD7QSIb47gD9qBVil3flfuNuoKPfJEwHLW/nJZe4Y6DnIqLCfs+VSbMZvM56ekYoDynTTSo2mej4/bugQHPUWigz1qVOQU8hcMCDeUQ25XPtACr2S7XZZ/O+0PLWAOttExA7dKHlJ2aU6FMmf0PYA5lp9/smJ7Hflfs47qhYjtwLvMMHkEBH8psA/RMfMWU2/CIir7Dt3iOHxKo7/qVkfiYIkEotUpv90Ckd4Ce6vpPBiO1SH4EMd7setySI1uZ0TGbBPaWT6yyuV73rjuwIyGboz1dsOXwqaS8VN2vTA+XQeFkZpvGOEyYqrn86Tr5mTq7RbTdDvHo/mSJqMmCgIyjq8=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1176;
	5:F/+Kv9Rx3Y+WKBCUh9LjSSBWHxG72D7iwNG2UhWSx84GdJvNaOiyU2/EYfab7JewRpZQ/5UgKpgwWUfWnGmI3pWlnxUrNeNYjL+u1uXoTwjFb+rleR/D5+GabhL7w2k+O6glnyGOm/Nx6cGGwOOJ+Q==;
	24:gcIdzFa88Yh32ylFOIz+v3IEKQSL+I5h4MRKl6sydaF4HAZ2ra4WVyXcE53+/Uh7M2frf/UtymJoP0VosX/xJAV0QNsGeUvfB6QGsciwDWU=;
	20:F9Ed+5hpN7QafzEm3pLGk2GWq258CDhIICc6Z+5LMkOEJs1zTIMNQTw9IG4KIL99zwGpHM4SF/LHO93ka9YyMQ==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2015 03:27:06.1346 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1176
Subject: [poky][PATCH v2 0/6] Upgrade to 3.14.38-6QP_Beta release
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
X-List-Received-Date: Mon, 27 Jul 2015 03:27:10 -0000
Content-Type: text/plain

Fix id3demux issue

Handle audio/video decoder error

Update video alignment after video alignment

Add GST_VIDEO_FRAME_MAP_FLAG_NO_REF, keeping buffer writable

Gstvideofilter use new GST_VIDEO_FRAME_MAP_FLAG_NO_REF

Don't ref buffers twice when mapping

Keep sticky events around when doing a soft reset

Yuqing Zhu (6):
  gstreamer1.0-plugins-base: Bug fix for id3demux issue
  gstreamer1.0-plugins-base: handle audio/video decoder error
  gstreamer1.0-plugins-base: update video alignment after video
    alignment
  gstreamer1.0-plugins-base: Add video-frame related patch
  gstreamer1.0-plugins-base: Add videofilter related patch
  gstreamer1.0-plugins-base: Add videoencoder related patch

 ...rame-Don-t-ref-buffers-twice-when-mapping.patch | 25 +++++++
 ...frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch | 87 ++++++++++++++++++++++
 ...r-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch | 69 +++++++++++++++++
 .../fix-id3demux-utf16-to-utf8-issue.patch         | 54 ++++++++++++++
 .../handle-audio-video-decoder-error.patch         | 66 ++++++++++++++++
 .../videobuffer_updata_alignment_update.patch      | 53 +++++++++++++
 ...p-sticky-events-around-when-doing-a-soft-.patch | 46 ++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  7 ++
 8 files changed, 407 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-video-frame-Don-t-ref-buffers-twice-when-mapping.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-video-frame-Add-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-videofilter-Use-new-GST_VIDEO_FRAME_MAP_FLAG_NO_REF.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/handle-audio-video-decoder-error.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videoencoder-Keep-sticky-events-around-when-doing-a-soft-.patch

-- 
1.9.1


