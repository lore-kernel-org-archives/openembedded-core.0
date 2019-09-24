Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9BD9F7EFB8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:49:58 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id h195so277889pfe.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=AvEF5wq6Jhvl9r41JhLtgdokWcWRo0dfnujkQwAKRw0=;
	b=GKANHvdNdY6ASLJnv6sNEhtUOrjYHwvVQubl8mSQ6Qo3tLy3jQxFyBPYxYDBmx6zAl
	3j97c9jZL/ZaFd5vHH2EvBOc4nMb/5WvL+94fAE4ir6DbVWX9sh9q62yWOprv6DcAYV1
	b3dZYea/RY3m0Cq5w7yR4br6EQERH6fN4yBrftz0Rn8jb4K0oVTG+d+fROV0GHBNHawm
	tpK61B3Ce9PiqwlPoZSjW3GySw8xdQ/1sAd5A9GOWPYTOtQlQYaynpBMgDnogfZYK1a/
	XME1vWBEkPATkt7SFrRai9CWnKEp4c0W71FvyxEtws6gY47gG4cJlR6aexbsi+3T2Ebl
	y69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=AvEF5wq6Jhvl9r41JhLtgdokWcWRo0dfnujkQwAKRw0=;
	b=geQ1u/A1JvzeT4MwcQ1QtkCx0J1reZb4MMvMqyjs03DgPUJiCQJ0mJwYGeroYh35FB
	30ta8LJxE5+wPPSyRqRm8xpAA8LZFz7MghMrvs7l1cp1hl1yIn+REsH08a5DlPzx2MGO
	Nii40D0/aSjsdg5vH2K7L0FrycMIfVa4P5/AOvjOli9J2qRzdGFnC++v98VhHc+ra4UV
	FFfLDkXeFXnUsnFgWMxF3Nhad3z3auUWxCesCv4JzhK41Azq9MOnmtQxH1JmHvdwH/Pa
	zg86siuuYeQoEoxIMK26Ey3FKxIsu36eGHhhp34o7WZ2haF0qGwoWEe+Fn+6QVwoHor2
	s0Hw==
X-Gm-Message-State: APjAAAV7oFJT0Myq1RQL7BURMTL2R7M4WkOVu+0S+GeZ5MKtmRBM29D0
	y98KcKOhHKuIeO7czuT2JZBGrm26l/c=
X-Google-Smtp-Source: APXvYqzSCTE91bmm0SH10Gzf1+0+cblTbSGA19kT4JgrDMYtOD0k9CxMlryaqD6zU4cnHxugtnW7fg==
X-Received: by 2002:a63:4755:: with SMTP id w21mr803169pgk.122.1569293399451; 
	Mon, 23 Sep 2019 19:49:59 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.49.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:49:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:49:05 -0700
Message-Id: <e09f916e2b5ff8c7cef7cfd13b43a7f9d2463346.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 25/50] boost: Fix build and enable context and coroutines on aarch64
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
X-List-Received-Date: Tue, 24 Sep 2019 02:49:58 -0000

From: "Bedel, Alban" <alban.bedel@aerq.com>

Like for ARM bjam need some hints about the ABI to properly build on
aarch64. While at it also enable context and coroutine as these are
supported on aarch64.

Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/boost/boost.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 9be3717..c2e2cbb 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -33,6 +33,7 @@ BOOST_LIBS_append_x86 = " context coroutine"
 BOOST_LIBS_append_x86-64 = " context coroutine"
 BOOST_LIBS_append_powerpc = " context coroutine"
 BOOST_LIBS_append_arm = " context coroutine"
+BOOST_LIBS_append_aarch64 = " context coroutine"
 # need consistent settings for native builds (x86 override not applied for native)
 BOOST_LIBS_remove_class-native = " context coroutine"
 # does not compile
@@ -151,6 +152,7 @@ BJAM_OPTS_append_x86-x32 = " abi=x32 address-model=64"
 
 # cross compiling for arm fails to detect abi, so provide some help
 BJAM_OPTS_append_arm = " abi=aapcs architecture=arm"
+BJAM_OPTS_append_aarch64 = " abi=aapcs address-model=64 architecture=arm"
 
 do_configure() {
 	cp -f ${S}/boost/config/platform/linux.hpp ${S}/boost/config/platform/linux-gnueabi.hpp
-- 
2.7.4


