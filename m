Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web08.16268.1605417461024479639
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2020 21:17:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@alistair23.me header.s=fm2 header.b=rjs3JjZC;
 spf=none, err=permanent DNS error (domain: alistair23.me, ip: 66.111.4.25, mailfrom: alistair@alistair23.me)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id E8BCF5C00B1;
	Sun, 15 Nov 2020 00:17:39 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 15 Nov 2020 00:17:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm2; bh=Dp4s4Y6lSJ9OQamO7aLKRJQrzv
	mDNybFfbY98UQxRfM=; b=rjs3JjZC2kGsLfWejJmrX1vY7QlFu1YdYG3WFdNfeM
	MG5Jf3FsCW1nBrhpMeO/svntgxhE7pgpAnDo8T6PUOnGB4bln267MGJWeh08Tl1B
	bUA+aNd2heas0QyB+ub8O0KCpi1AWZG30//iGuGknuwHP0JhdBr4sJkOCLe4vxYk
	AihPeWAx99R6c7+XH+WrpEISKQAkTaxN3gN4Itw5tP0LPA+XEm33vEsVuHcxm0cr
	pFXAH3WujZZX5a28jbLky1p6NWU7cZXk1IglrARjjyXcprt1XP1boyR0JQX+a1C1
	3CncAIRrEzTupXS204hcrrfrnlE5fZcSwG6+v16RZHgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Dp4s4Y6lSJ9OQamO7
	aLKRJQrzvmDNybFfbY98UQxRfM=; b=e6U/KkmVC07WKrnTjTbaX0OZxviuUzMm5
	CR6N1riIPdjxm54oY3mUjAZ/zE6VqMwsVKThi9EuTN3RVx8SlbUQ5Psvveog5mjB
	kX6cVSzgimo6PErtkfGdD6UJZNy0MMVQ2YPix7BU+pA3jThqVT3ShCMQUdmM4u37
	hXBkm/dWlPVxUzvDoNGw2G7w5H3/8A+7YAupoxPSPiw2gofs/5hC48+es9J8jndE
	SFGV6h9KDXP9TM8a+t49V30Vh0cms2yZsTJHf+D7p8l+OEFEK0bfHqUQpKYOOSzv
	wFI+jls0DGgwNGYApaEJnB7yz1RYcuDVsLEbO+IcKBXLYSDai/UlQ==
X-ME-Sender: <xms:87mwX97g8P7PAIfkwVZNueuDflsnTiB09aHwoTV0ZgXqWGSBgtN-ow>
    <xme:87mwX65ONQ-bucburZeplX9DifmPenhtOGJz4NGyZ5-qh6fn_Ppnrj87GLYaZsnS9
    qEoLXL1e48JSLBysBY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvkedgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgrihhr
    segrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeejleeihfdvtefgtd
    ethfdtgefftdeiffefjeeiffefveeuleejheejvefhffeukeenucfkphepjeefrdelfedr
    keegrddvtdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:87mwX0csK8K6LsIikTrq2ghzdmdRSK3eC_wshi1hkN6pprCRsuuMeQ>
    <xmx:87mwX2IQgR7nDU0s-Sr3EbXkjlw6LtfSH_OaCrYUVN40dItiQn58mw>
    <xmx:87mwXxLKR0Q0X5-WyBcaeR5RpmCtdPmNjWyXmKWkQrUMTNHY7D78Ig>
    <xmx:87mwX0lpp_KNXVLjLR_5PpPoeRbzzCkItZLIn31qsz2Qb2DrU_6qWg>
Received: from alistair-xps-14z.alistair23.me (c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
	by mail.messagingengine.com (Postfix) with ESMTPA id DFA9D328005E;
	Sun, 15 Nov 2020 00:17:38 -0500 (EST)
From: "Alistair" <alistair@alistair23.me>
To: openembedded-core@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair@alistair23.me>
Subject: [PATCH] weston-init: Fix incorrect idle-time setting
Date: Sat, 14 Nov 2020 21:17:36 -0800
Message-Id: <20201115051736.49184-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 meta/recipes-graphics/wayland/weston-init.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 0cc32985c1..a616c473ec 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -56,7 +56,7 @@ do_install() {
 	fi
 
 	if [ "${@bb.utils.contains('PACKAGECONFIG', 'no-idle-timeout', 'yes', 'no', d)}" = "yes" ]; then
-		echo "idle-time=0" >> ${D}${sysconfdir}/xdg/weston/weston.ini
+		sed -i -e "/^\[core\]/a idle-time=0" ${D}${sysconfdir}/xdg/weston/weston.ini
 	fi
 }
 
-- 
2.28.0

