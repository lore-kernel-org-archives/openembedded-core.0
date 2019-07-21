Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4871D7EE6C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:25:45 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id a93so17848732pla.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=gbyao6hJL2A1gPZB3KqPAgr0T+XOf+6fnLiyCN1EcfU=;
	b=K4Twkp+DEIy0OkueHzX3VcbhW2/adqFde9KAo0kvJ0MLfrs+EJs8jmmf0jEUP7odQL
	/7vvEq2JAjooOpsd/CLkdeNv1Bqf+jNBsKxU9SZdZzv7aN6X8B1yhVAewdNwU/p1JBak
	S6LDfEQXh8XQowQLMnXqkeCtO1B17l//vL/h1HT+Q6WL126xh3ElqqDU6sFy52M9iIzJ
	cSy8j9SvV+IL85OKcZkKOHPJ1HlCz9PxanX45N8ggk6/xfx30IfCrSa0SyGt9187XMwE
	x+FTJ6YDvpchIM/c2BUG98JZuTif09k7SmjcHECnLQsDwSkTF5b8MhTl3PHlthqaRTot
	MKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gbyao6hJL2A1gPZB3KqPAgr0T+XOf+6fnLiyCN1EcfU=;
	b=Zfr+/CKD0ud2AuXR8Rxk2ae05rgOh6pavvAx6wNwMJJDiJIoA+oyi76u8EzbYlEAE6
	Ef7tEwhBokBDwKzjRhIlSRimmQhxZAUWd+pw80dywzSaWVEFvtzS5Y+qvqX05N8C4M2b
	g9r4GdkcX+wOpRLEW3m7X0d4OwTl6027TH9wvlBfDxoQ91FRth+uurWsXpKzXQpneUrE
	rh6k09s/w2A9PR/+x0iF/XzrWtBr74Wm05jnUpPaDy74fo8ZVgksx9TKeVELw1YTK+Qq
	Ak5APufYmh4uaLl3yljX/mhTV/ve0Xm5Qf13ntN3kaTpciEiiPN21JpPTKZePv/lhFOW
	3b/A==
X-Gm-Message-State: APjAAAX9GIsls+3o5K9ixCd89BFMNcol05tK/+W0UCUJP9CDv9XuGc0Q
	zZJPyEHDaibMos8VKzxu1JmLfUoi
X-Google-Smtp-Source: APXvYqz6goCqw0t0aJtgS0dswuYqtqx3gEjTyRPMGFdj8OvgXC8TTlQhFsdGJqvGSDkgF/gLHWlQ3w==
X-Received: by 2002:a17:902:24b:: with SMTP id
	69mr67234389plc.250.1563719146297; 
	Sun, 21 Jul 2019 07:25:46 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	a3sm28807750pfc.70.2019.07.21.07.25.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:25:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:25:12 -0700
Message-Id: <0497623882da714cbe098a4281982b7f9ce6030f.1563719003.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563719003.git.akuster808@gmail.com>
References: <cover.1563719003.git.akuster808@gmail.com>
Subject: [thud] 23/30] yocto-uninative: Update to 2.5 release
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
X-List-Received-Date: Sun, 21 Jul 2019 14:25:45 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This includes libstdc++ changes from gcc 9.X.

It also switches uninative from bz2 to xz compression.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 59ccd69..0bb8f7a 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -8,7 +8,7 @@
 
 UNINATIVE_MAXGLIBCVERSION = "2.29"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.4/"
-UNINATIVE_CHECKSUM[aarch64] ?= "af2e2faf6cf00ff45cc1bcd5e3fb00cee7f79b3ec7c3be15917ad4ff8c154cfe"
-UNINATIVE_CHECKSUM[i686] ?= "fafacfc537a6ce2bd122bd16c146881ab5ac69bd575abf6cb68a0dd33fa70ea2"
-UNINATIVE_CHECKSUM[x86_64] ?= "06f91685b782f2ccfedf3070b3ba0fe4a5ba2f0766dad5c9d1642dccf95accd0"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.5/"
+UNINATIVE_CHECKSUM[aarch64] ?= "ca977ff95c77f983570141908d451ff7d78add2864471605af404302bb36a1fa"
+UNINATIVE_CHECKSUM[i686] ?= "7b5822891c293795faf8a4a80586b36f8cde405387524916a24f9055ea82f7ca"
+UNINATIVE_CHECKSUM[x86_64] ?= "ed0ac07c710b711925cb976685dd855fb1d442dd840d00194751c18bf480c4ed"
-- 
2.7.4


