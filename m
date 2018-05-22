Return-Path: <tanuk@iki.fi>
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
	[66.111.4.224])
	by mail.openembedded.org (Postfix) with ESMTP id 759E5606B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 15:30:19 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 7148D1C89
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 11:30:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute5.internal (MEProxy); Tue, 22 May 2018 11:30:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=uunlpfXb+WPS4QZfS
	WLMf7bhVRRRPPqiGIg/LIY7amg=; b=BSSqeU6T0WSPrzdfBs2RSSXPAdTJUTX6n
	BK2/pTa0DqGQsi6v36/pt1TQ9KVgvBrOVnE5X11HD3rABrDH8ghesxKzbRChyUig
	sfQblukCYLvbdLujM3Yf41zECGbGgW1aT+zAiJiA211XM7tpaEJXUwcvKxu9Y3KQ
	CBQVJEbhCUzAc7a3MRXnh/BwMaURBRdkywz9MaSFyr9oanCf1bF6iMzjSWaW/3tW
	QnfPcIZPPeMsp0DBYWmvtGDkFxRdM18eBz+j8gx1Xc0sjBalulQfZm/DFcwDKs55
	w8Q2TBf7fDnE5lLZ//9XqLNAaFMBm3SQSJKVnVDxV7vGgNufUp2ng==
X-ME-Proxy: <xmx:izcEW32ZYABU0XMAl78HU8jysOtsDXy4RKCIiVQXD3zfO7uHYRT7sA>
X-ME-Proxy: <xmx:izcEW1UTCnZxunEEaPKtORZFz5IKnQP5qqyiZdM77F5joyI80ROGBw>
X-ME-Proxy: <xmx:izcEWzwH-tDBZESSBSeMNWMwiMb_VG9ynO1jM6TV4ck_Veaw9iSbww>
X-ME-Proxy: <xmx:izcEW8Tc5DWZEvSURSY6U7OtnjSqydS-0Xx-CjMnf4SlazN-njHAvw>
X-ME-Proxy: <xmx:izcEWwyk9yUhQ3h-tqioQ4MAClUt3TA-UntVTGNVZ82MfN_mBAkfFg>
X-ME-Proxy: <xmx:izcEW-2s0V-6qdPlfX1RBLHcGTpcvSd0JSqfeRTjYu37L-yg-YwybA>
X-ME-Sender: <xms:izcEW8yCs4BM3ZJRkm6Gk0R1DaIzTSd8qGaCPRWk1iTz8VNYT_UB4A>
Received: from localhost.localdomain (unknown [192.40.95.27])
	by mail.messagingengine.com (Postfix) with ESMTPA id 762C610264
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 11:30:18 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2018 18:30:08 +0300
Message-Id: <20180522153011.18761-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH 0/3] libvorbis and alsa recipe upgrades
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
X-List-Received-Date: Tue, 22 May 2018 15:30:19 -0000

Tanu Kaskinen (3):
  libvorbis: 1.3.5 -> 1.3.6
  alsa-plugins: 1.1.5 -> 1.1.6
  alsa-utils: 1.1.5 -> 1.1.6

 ...plugins_1.1.5.bb => alsa-plugins_1.1.6.bb} |   8 +-
 ...s_1.1.5.bb => alsa-utils-scripts_1.1.6.bb} |   0
 ...t-systemd-unit-restore-the-volume-wh.patch |  56 ----------
 ...lsa-utils_1.1.5.bb => alsa-utils_1.1.6.bb} |   7 +-
 .../0001-configure-Check-for-clang.patch      |  20 ++--
 .../libvorbis/libvorbis/CVE-2017-14632.patch  |  62 -----------
 .../libvorbis/libvorbis/CVE-2017-14633.patch  |  42 --------
 .../libvorbis/libvorbis/CVE-2018-5146.patch   | 100 ------------------
 ...{libvorbis_1.3.5.bb => libvorbis_1.3.6.bb} |   9 +-
 9 files changed, 20 insertions(+), 284 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-plugins_1.1.5.bb => alsa-plugins_1.1.6.bb} (94%)
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.1.5.bb => alsa-utils-scripts_1.1.6.bb} (100%)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.1.5.bb => alsa-utils_1.1.6.bb} (94%)
 delete mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14632.patch
 delete mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/CVE-2017-14633.patch
 delete mode 100644 meta/recipes-multimedia/libvorbis/libvorbis/CVE-2018-5146.patch
 rename meta/recipes-multimedia/libvorbis/{libvorbis_1.3.5.bb => libvorbis_1.3.6.bb} (64%)

-- 
2.17.0


