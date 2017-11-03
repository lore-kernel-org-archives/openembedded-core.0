Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0176B7835C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 19:55:00 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id x7so2948437pfa.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 12:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Jl7DFYcu93csKfZplngg539KoyAm51TJeaqr3w3Ype8=;
	b=SDsiLKLT+DSRRL9TmK0DJPhg+XpCbHSAojibwfCHiCtJs58iElb8La9/u9UkMrUfAI
	gH6N8nAkw7TRjYCp53OtGgTDVJVidQalxsk5EaPKFx7brKUccj6J1ikMkXt2Yj8SciUP
	gwVBElm/nzTdqBAxTpN4JI58ff4pdFgAi/IwDoeqVD8HLIn4A6tbBTPi0O2jGngZVbYz
	hypn3F13bKurMZsgU7k6zSptp/5eN4WzsIT6WWLZEhheYitrXpG6+ZPobPanB6tYoUZy
	6J/IaEaJGACK6Ws0HHjBagwqtskLpJYJ/oS10WH2vhwKtWxLDC8NLQ9+Ae292uaZvLBJ
	Bjyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Jl7DFYcu93csKfZplngg539KoyAm51TJeaqr3w3Ype8=;
	b=bWdUyq2d7ZjY00wxarv9f8b6wM1tSLIKwZ1AUyhHkizpf60IUkGdxuhRR1XU+LAwcg
	O8uIqbKsedWZhE8ZbnU1g1lKduz/6o3VfHiEIFrAAGFukvO9n1vD1aF0FZM54oj6iHJc
	epjvX9lykjFHFdb5AGGTLczQeZzITMq2v5qjgsz9GWj1Ei6ydetMA7BZAhg6YIvj8Lxb
	IFa77KSBnK1P3RNxsIq5OqO93K49JmfhRjd8Ol2hz39WTo1qGYi7xAaB4KwGrpe14/Ji
	6FAHZ+uIyXupct48dLMeEMJEBxdv/epfTY6oRzDSzS61xaZFdu4TIELFFju8/MkcYqJq
	AVQg==
X-Gm-Message-State: AMCzsaV2x5V9G7o8uVlkbQv3mwGxE1pt44MaJaO1zIEiozg/b9N6JMHf
	HI1tEXlKhWbbfEGtIkgqCseBBw==
X-Google-Smtp-Source: ABhQp+R2vMndX5xawy7UsPabA7padTNtAMcKkBiGaFFAJNmLN0zrMGUR91xC59exqZdVTfRq+zeBaQ==
X-Received: by 10.99.108.2 with SMTP id h2mr8243506pgc.362.1509738902415;
	Fri, 03 Nov 2017 12:55:02 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:78e5:dcc3:4839:af44])
	by smtp.gmail.com with ESMTPSA id
	c26sm12781112pfl.115.2017.11.03.12.55.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Nov 2017 12:55:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  3 Nov 2017 12:54:44 -0700
Message-Id: <d64160c6e67f3df5fbd20493ebce5944b48a2ecb.1509738544.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1509738544.git.akuster808@gmail.com>
References: <cover.1509738544.git.akuster808@gmail.com>
Subject: [PATCH 10/15] xf86-input-libinput: update to 0.26.0
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
X-List-Received-Date: Fri, 03 Nov 2017 19:55:01 -0000

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../{xf86-input-libinput_0.25.1.bb => xf86-input-libinput_0.26.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_0.25.1.bb => xf86-input-libinput_0.26.0.bb} (63%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.25.1.bb b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.26.0.bb
similarity index 63%
rename from meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.25.1.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.26.0.bb
index 7b3ea16..54c33d7 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.25.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.26.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5e6b20ea2ef94a998145f0ea3f788ee0"
 
 DEPENDS += "libinput"
 
-SRC_URI[md5sum] = "14003139614b25cc76c9a4cad059df89"
-SRC_URI[sha256sum] = "489f7d591c9ef08463d4966e61f7c6ea433f5fcbb9f5370fb621da639a84c7e0"
+SRC_URI[md5sum] = "da47ef62eab1d0e922a8fa929ff81758"
+SRC_URI[sha256sum] = "abca558fc2226f295691f1cf3412d4c0edeaa439f677ca25b5c9fab310d2387b"
 
 FILES_${PN} += "${datadir}/X11/xorg.conf.d"
-- 
2.7.4


