Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web08.4759.1614900951261401444
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 15:35:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=Z0f/uDIy;
 spf=pass (domain: gherzan.com, ip: 66.111.4.27, mailfrom: andrei@gherzan.com)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id 922245C00E4;
	Thu,  4 Mar 2021 18:35:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 04 Mar 2021 18:35:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=c7TSnspB1O212
	4/j+Gxyj/OLKxQoZThZozOeWULX/9I=; b=Z0f/uDIyY5wOuYX0BiOurUR7VGd75
	QJ9cPUKQGoVLUZfA4czJkSuqi56BlFdmmceX2/k2cjkBFRnNEUXE/TJYsP1wB6wV
	S55nDWSgKzSE7vVlhz9Sn9EisCiN7fjSrXqBHjLPQfV8EXtKqrENER20+KhQSvDX
	61oxkG3ubiyXKbUTCJiYCcnQVYPklwg/p0+my3lN/mPVS0NouK2fxCzSH+gRc+xH
	2Fbg+33s2RS6z70hAs9C5CBsrGv2QL2ULW9KlKzVLg0nGBPeglIPF3uUtcBo4JXh
	1AUkE9HXaFTxm1sr6jO4i/He1Cbqmc+KVCHBtlshIJER8tq+uCctpEr9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=c7TSnspB1O2124/j+Gxyj/OLKxQoZThZozOeWULX/9I=; b=P2K7Xd8c
	KNvvEad4POawvF2jcvryWqjqaOxuEXt6kTDenxUSlmMHPITScu+qTRv2jtMzSRMK
	DZl6C6sWQZNr8bCARejGKIUEy/l3RSL8nCj1NykDVw+c5e9j5VSBA4L89DLwAYb5
	Dbn5dwEHrET2MORxETjv40JC4Vz3G8WEDBuuhYy9bK7Qs5iJrNnW/qjtYFeAfJZp
	Z7zXOSs7ZK+oxamvux1m3MtrOcgtQJAW3B0DK2sDGvpm++V8XxkUjs0uuf1MR8e4
	EOXf73UKOoTcW7A0EfpU2GusqIsefH0z76UBmblLkzK1xBqwTROV1Kvn9AmMfZ2m
	IFK2UiA2U7MxGg==
X-ME-Sender: <xms:1m5BYGM0HdiH1Ur4s0eytHSTAOLAYXbEHLa_yuvtBAfQ_3jlAlTlmA>
    <xme:1m5BYBgnkN4xv3VyIAlji0_b5pt-O4eOyF83x_Afc7WkviWRg1aXgJ7YalyvKRo83
    PpODhnLnDAyXdtasS8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddthedgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehg
    hhgvrhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeettddvffefkeetveekteeive
    eggeevieeiudejfeeitedvkeelvdekheejlefffeenucfkphepuddtledrudegiedrfeej
    rddukedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:1m5BYBtuRpSpfkyPgS4FDi-eNp7Ds6DGmEW-u9-wDMPjsB9JRm5dlQ>
    <xmx:1m5BYNgkQoSMVnoOUmknrflPYfSyjuyfuy2jJizIwHj9LkdePnXWSQ>
    <xmx:1m5BYPaXgWB8el1NRvA6bwkHwJFj8GJ1Nsk0RvgmIpXd1Am8G7Njjg>
    <xmx:1m5BYJzQgRMe-8ofRHC65FfA39cuQRxfEUtwo-QmcVHFZvRnDLGBtA>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id E694D108005C;
	Thu,  4 Mar 2021 18:35:49 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH 2/2] epiphany: Add package configuration for building in developer mode
Date: Thu,  4 Mar 2021 23:35:26 +0000
Message-Id: <20210304233526.3373832-2-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210304233526.3373832-1-andrei@gherzan.com>
References: <20210304233526.3373832-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 meta/recipes-gnome/epiphany/epiphany_3.38.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb b/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb
index 7fedc43a99..8e697b4a44 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb
@@ -21,5 +21,8 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}
            "
 SRC_URI[archive.sha256sum] = "8b05f2bcc1e80ecf4a10f6f01b3285087eb4cbdf5741dffb8c0355715ef5116d"
 
+# Developer mode enables debugging
+PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true"
+
 FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
 RDEPENDS_${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
-- 
2.30.1

