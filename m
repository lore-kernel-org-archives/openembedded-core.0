Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 724057ED46
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 15:32:30 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id t16so12854451wra.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 08:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ShguEeeCZl9tbDCeapFLxV7d9uQA8jSXm781hleKs7A=;
	b=hZ8ZZ6oTcaQ2GHViPGMqml08b5jtkyrNCxNlxH0eNB1m5MKvcCSiWsDF5EjPrsljsL
	sX1UM+7ECEW2+hYhw5PX0199irhzZ3xNv7kRNYS47QoWzewUaBAv7AfO/8OBJrwY8WU4
	EXFlbczcAGP57tvW2gvgIz1811CQKT3hy6oY6EctSH49Fz9dbujqxrwMn3ASmOrGzH9e
	v6oE8xUO89jHeTL3jWzjH1B8N6qYaUj+SDU43rIBEV1lfipGhMuyCiOhobaJ1Tpk3FIv
	x/myCkG0d6H4r7N3cMt6MW2XdPHy15gNW4qfQaT/VbLvHj65PC7dOa8+WZksppTaRNey
	CmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ShguEeeCZl9tbDCeapFLxV7d9uQA8jSXm781hleKs7A=;
	b=LT2OPhbL+DBkXCxaQ/WjXnl/IXP4+S9pq61MkXIXQOUGYeGrZ7yWKdMZFKS9/xc3LO
	Y8Ha13g/NRtkl/Srg/Bmu7mVLGjEuMX4a5t4wIemPKwW9n3f0Qt1XKU7x3Lpk/Xmagxi
	aRjY5S3ccJosi9yhQosoVClaLt5II4u3tdM4BtUJXfzfA7A5E5EXhXtBm57sfIsCmwcF
	sEj5+KYbpZxu77YN3faELZjgD2CuzeL+/jMLfQHwi1mQTcsKIfE8O3Lif5HlALHz6fOH
	mw2yynW2D28XF7GwFD7sjPprbGlxAE7oEYOwXfR7WuzzpoMW6dz8nE1M9keBh49qWXi6
	cUNw==
X-Gm-Message-State: APjAAAWhA9OaWFeVW90mm/6gc2ZooLPc1d4vxtLxBISibk0t53LHFEGI
	c19o32hQOYwZmPpJ9lWB3dkKEqLB4I4=
X-Google-Smtp-Source: APXvYqzcUZsnbvryMZGa4o7OhPNrela/Jr5JNz/4JlSBaQWRLDRUGgEuZgFRqtfKNjFZRrLgnFeXzg==
X-Received: by 2002:a5d:40cd:: with SMTP id b13mr36642521wrq.236.1566315151020;
	Tue, 20 Aug 2019 08:32:31 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id 6sm466700wmf.23.2019.08.20.08.32.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 20 Aug 2019 08:32:30 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2019 17:32:13 +0200
Message-Id: <20190820153219.62435-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820153219.62435-1-alex.kanavin@gmail.com>
References: <20190820153219.62435-1-alex.kanavin@gmail.com>
Subject: [PATCH 06/12] libmodulemd: depend on target python at build time
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
X-List-Received-Date: Tue, 20 Aug 2019 15:32:30 -0000

meson build system is importing sysconfig, which requires
having a target confiuguration available.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/libmodulemd/libmodulemd_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
index 9ac7e140ab6..63d3fad6ab4 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -17,7 +17,7 @@ inherit meson gobject-introspection
 
 EXTRA_OEMESON = "-Ddeveloper_build=false -Dbuild_api_v1=true -Dbuild_api_v2=true"
 
-DEPENDS += "glib-2.0 libyaml glib-2.0-native"
+DEPENDS += "glib-2.0 libyaml glib-2.0-native python3"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.17.1


