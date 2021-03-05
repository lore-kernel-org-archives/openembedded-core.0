Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web11.13894.1614959349701362227
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 07:49:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=d/HKp/Dh;
 spf=pass (domain: gherzan.com, ip: 64.147.123.19, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 7F3802A39;
	Fri,  5 Mar 2021 10:49:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 05 Mar 2021 10:49:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm1; bh=SlEb83VoYJyyZ
	roZrPJc/KV1qtjFDojI0Y6bhi6/S1c=; b=d/HKp/DhHiCNTpQdZUSYwsdyEFXBG
	MAg6AJxFk2WsJT7kx9y5IXaFA52Ox0p3WqO1WEff/2C9j954D+NKT+5dpI63iNpp
	D+YJl/NOLpVdaueVAan3xrC8/j3/OCwupJw/wIBmW+LbyK4zkKmNaj7htY93T24q
	0CWqBB1KpXd/gzI8wLzGOBmaIWWapJdqhcHTgCkPVMG1PUS8crWKudesJood343t
	9Tk8vFad2yvfqgBHC9Yhd7AKGTOz8h1RKPSp3A9qB9qf2E9x6mGotvolpg2xM/3Y
	VmTzM6U95lXGzsjGPONfqvp2VTGMUqbk9aLV2Rgfm0UjNbCUtZdl3CZ+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=SlEb83VoYJyyZroZrPJc/KV1qtjFDojI0Y6bhi6/S1c=; b=GkGr0/J+
	vEZggE0I/CZtepFkpajP8RVQdafU05jadBGWL3vfL9LdvMlcwz24P7eJGRVhE5id
	p5vluegqldRAFGOCX1Jeh6Ylvt9dFQp1ql2D3N2r6vQEXHBssomnRUxnIw8aqngm
	NrjxgSQcd6hErHzAI9p7n/z4qTgznYitHFtOD1beyIuVLSSoul/XDi+V+ghAt2Gs
	4LcN+WqBZyEp+woUKowOBAq0yrzVHThTqI5/yZAlhGDKkMfYNFmFUmqWtbzW+PbL
	fcRacubV1+pKT1ECzbiPUHGJHxC6qwwKlpxqG2HgNAe5o4FlgMEugJ63tjRgh6Oa
	q7NoWsygPFtLRQ==
X-ME-Sender: <xms:9FJCYHJjN8AuaackewxklvgXc3ddUhrjeqzumAPiH8vs-0ipcIVp3A>
    <xme:9FJCYH0PsDEfuAIjRFS99VDpM1ACJHqrNMAye8Ea8RDnOzFoNuxcRsAeClcVG64Mu
    YIg2P3HN4aaKz54CeE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtiedgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehnughrvghiucfihhgvrhiirghnuceorghnughrvghisehg
    hhgvrhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpeettddvffefkeetveekteeive
    eggeevieeiudejfeeitedvkeelvdekheejlefffeenucfkphepuddtledrudegiedrfeej
    rddukedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:9FJCYDnJCn1_tQjnS_rX5qlUYvEX3o3QDg3sC3e9iB17410pdWs_rw>
    <xmx:9FJCYKjWsnoVNfSjCIkSitEE0xtN7l_G2NL6yUjKjv_Y3YQqHB6rqQ>
    <xmx:9FJCYCSjV0VYyDuPykVEgEgfEqgo0nFBXKb_1wVOtLea9AMX_cvX7g>
    <xmx:9FJCYJESjdbvfK9ND7nDtUe9gx9gTjHw_08oCz2W-Aq3rs_i7r9ArA>
Received: from qwirkle.internal (host109-146-37-182.range109-146.btcentralplus.com [109.146.37.182])
	by mail.messagingengine.com (Postfix) with ESMTPA id 4ECC3108005C;
	Fri,  5 Mar 2021 10:49:07 -0500 (EST)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: [PATCH v2 2/2] epiphany: Add package configuration for building in developer mode
Date: Fri,  5 Mar 2021 15:49:03 +0000
Message-Id: <20210305154903.3315094-2-andrei@gherzan.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305154903.3315094-1-andrei@gherzan.com>
References: <20210305154903.3315094-1-andrei@gherzan.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrei Gherzan <andrei.gherzan@huawei.com>

Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
---
 meta/recipes-gnome/epiphany/epiphany_3.38.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb b/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb
index 7fedc43a99..04f340f133 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb
@@ -21,5 +21,8 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}
            "
 SRC_URI[archive.sha256sum] = "8b05f2bcc1e80ecf4a10f6f01b3285087eb4cbdf5741dffb8c0355715ef5116d"
 
+# Developer mode enables debugging
+PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
+
 FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
 RDEPENDS_${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
-- 
2.30.1

