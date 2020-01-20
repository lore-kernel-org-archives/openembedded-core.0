Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9475B7FCAE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:25:39 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id d16so262729wre.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sffb2AeTDIJyWbnhpYx8e/ESv+00WYQpKadGcMzJoSg=;
	b=Lwr1MFLzoidY/UBDv/vmSPmRyi64EU+SvdU71WY5TY7A9RmbeOfFEmbEliHhFpI37k
	9svhOHR36H75BQluiz3cpnTa66/uwxuM0Hd+AbezITW1m2tNAgOklTMv8uE/vb29VGW7
	7xxcffTF+YD/l0Y8Iy7y5cj3M5YEqDkyz4t5SN5FhUEtNfEfnjsPpuGKOV7OhzPI7e51
	fNM2Iycv6XmJVmuN8T6DNFZsIMaxwqG8tej/X49JOJWQ+R9/T0+ZwhzMXzeZj/R6jL2b
	NEA+bWoyIjteT/HSkI6o2gupaw7Tab7G1xGHEc28yENm94SGPVvk9KgmJJS07ZS2p02l
	TcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sffb2AeTDIJyWbnhpYx8e/ESv+00WYQpKadGcMzJoSg=;
	b=TTl198zXLxzfoOHGDFYJVvfByYVJk34w5BcoxHENTzxRkecvN0dJimiTpVE3DoW29V
	6aWIKRG7cUiqjiu8MvbgVx0AVaDYd5f7p0izi/F0K+klUqbGwFKsCr7ebdDTt8Zd5xbm
	LLY+srC5K+vXfMaQTIO+KOy5lxIvwPVSBF/efNP+OHc1qab0AhuxcbU0oqudL/xi2Em/
	4/LIHk9eTD0gRS6ZUWxA6xYS/lzF0mQmerWDPUGVnzr2JcSivONW12e5kmBMHWfI9ZvC
	fHuxYTxairrxn08MDSiG+H8L9s8EbrrkOue9heP/bb64UoIH0SmIn76LzN0Dunplp0RK
	wyYA==
X-Gm-Message-State: APjAAAX/Ph9fkkfCDp5y1igSMqeED0BAb2LVtNXU+Z54bQrYNE2+p1Br
	DgiwiNJZhCP/HZGxbJV043/888ph
X-Google-Smtp-Source: APXvYqxGn123Rb0zS8tR/C9Tf6YTGo1NxMIj8DSWBCYVEBXZa9/whOGsa7kn4YNd3kTBt1UZUyI7Ag==
X-Received: by 2002:adf:ce87:: with SMTP id r7mr527756wrn.245.1579541139850;
	Mon, 20 Jan 2020 09:25:39 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id x11sm31526wmg.46.2020.01.20.09.25.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 09:25:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 18:25:04 +0100
Message-Id: <20200120172510.22648-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200120172510.22648-1-alex.kanavin@gmail.com>
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
Subject: [PATCH 18/24] msmtp: upgrade 1.8.6 -> 1.8.7
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
X-List-Received-Date: Mon, 20 Jan 2020 17:25:40 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-extended/msmtp/{msmtp_1.8.6.bb => msmtp_1.8.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.6.bb => msmtp_1.8.7.bb} (86%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.6.bb b/meta/recipes-extended/msmtp/msmtp_1.8.7.bb
similarity index 86%
rename from meta/recipes-extended/msmtp/msmtp_1.8.6.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.7.bb
index 809144b7837..729d0ed146b 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.6.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.7.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[md5sum] = "adff4a9992e1b47aa5468b974550304e"
-SRC_URI[sha256sum] = "6625f147430c65ba8527f52c4fe5d4d33552d3c0fb6d793ba7df819a3b3042e1"
+SRC_URI[md5sum] = "4cf3d000b24fc8769e9fd8ec8b3cf1fb"
+SRC_URI[sha256sum] = "9a53bcdc244ec5b1a806934ecc7746d9d09db581f587bedf597e9da2f48c51f1"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.17.1


