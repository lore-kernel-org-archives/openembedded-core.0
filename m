Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5563B7CB10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 12:41:35 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id r5so16505843wrg.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 04:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/CenpIkOLWf/19OrckVlVzw05YisCp50QdSITNn2s24=;
	b=g66Gg/7M/xjVYJHDabVaWfCSsOk5SZMuVu1kUxbHxmSiuedapqAnUGqC43oe52ll6u
	FRs7hih5GKOP49PH1Ww0cjrFyiL506ytG5DI4z5uFi1oOd7xdQmtgeTKHHFudxMbrCj7
	RV9Cb6DaarCDSdJb7ptsa7kyE1Xxnfeavzvfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/CenpIkOLWf/19OrckVlVzw05YisCp50QdSITNn2s24=;
	b=mpkbXRS2tAIJbXBlsTORr2zTPltu91mLsirFgork0UuU1vbqjDVf5m0GnxSWyOGCIr
	RaekrII6LCYUhX0VD36Zx4K80JntCG7NSeEMctdw0oQS8cjz7sSjTN0kxoXueQyCaUdf
	tfNZZR9lHchp/oY/fsBczb3TIkV8BEn11QxOMmp4J42WWCE4ETmeBQxDVJopCuuy7Hq0
	SknuK3EzoKM3oLyLjWB1MsJzaYTOdGc0E4nXUYDcEiv0QGDskzdPYrp4SO4PzKWoEYJD
	fwJ2TU3uIRei/co6an/Emk/TyX8tnk9T6e2CghCXg+ad3yvC18uUxh5Yxi1rH5U4ZCYP
	imWA==
X-Gm-Message-State: AHQUAuaKTNXb2fl2RS5IIfD/+ehQxLzBq+RMdtse0Lx3LFHgD0uFXD16
	IWL4DQNwytKuDUTw6iP9SMkONJbXwEE=
X-Google-Smtp-Source: AHgI3IZft2ttp1QTWVx8eXIt8kpDylszr0hp2J4CiCmsmnkvNdQqqR5F7bq1yyHrCWFHKCm4TMbJSg==
X-Received: by 2002:adf:ecc7:: with SMTP id s7mr27808103wro.255.1550752895772; 
	Thu, 21 Feb 2019 04:41:35 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d16sm20787379wru.52.2019.02.21.04.41.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Feb 2019 04:41:34 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Feb 2019 12:41:20 +0000
Message-Id: <20190221124130.25733-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
References: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 04/14] gst-examples: upgrade to latest revision
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
X-List-Received-Date: Thu, 21 Feb 2019 12:41:35 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-multimedia/gstreamer/gst-examples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_git.bb b/meta/recipes-multimedia/gstreamer/gst-examples_git.bb
index 1d87f24fe59..f8cef857b32 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_git.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://anongit.freedesktop.org/gstreamer/gst-examples \
            file://0001-Make-player-examples-installable.patch \
            file://gst-player.desktop"
 
-SRCREV = "48247c6ab6807d6ae179cf653cbdc64714d3313c"
+SRCREV = "2b3fc175c252cd5a537e4b2864b572a8372473d6"
 PV = "0.0.1+git${SRCPV}"
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.20.1


