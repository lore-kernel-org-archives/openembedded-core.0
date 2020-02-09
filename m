Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id B6BC060CD4
	for <openembedded-core@openembedded.org>;
	Sun,  9 Feb 2020 16:10:14 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d9so1785366plo.11
	for <openembedded-core@openembedded.org>;
	Sun, 09 Feb 2020 08:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=qjsNGROEQJXJDqnoU5VdkbCdzPmL+7AuhnpbiJIrcaE=;
	b=Z6mvZ0/Cbtyr2Q7coKVL9RK4kIghVFs6znK36RdeD9w42aCpbChFPTtHG7YdEtfTEO
	85p8rgTGEPgANRan+FnJ6LQr/LPfOtduLdcPKde92oR+9OUDdlC6QCr1xa88QdilSFmW
	a1wVMVbqS0hj4LHpWB9LlMIFb8rgkLM5zuri5pnZQ9E2sw7YQBE4n9u6gkMwjLR5hjkY
	jsEu5+dQ+V3JG6RQ3EBjIkDKkAe5zt7fDS+FueEFZNsodxOwD/U38URA7IMyElQXhyz0
	tBlfEaUuPfspSO79mCW3fNWeCN14ywSHd5Df8jfMbta2Wf0HyPWW9p7FVkl69kCuwFG4
	Onqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qjsNGROEQJXJDqnoU5VdkbCdzPmL+7AuhnpbiJIrcaE=;
	b=GcsP/5klvv1WxfoKCZLOZXrmC5HK3VZMNys3xh3y2TDWRZHGef6jt8Ye42ojRIbUki
	lhTLecS4jMEBRBdlLl7Q2DDRFnLUGyd4/BwzNyQWQaV8LSpalzrLQmvFUbqR+we0gOhs
	6YAqEGmiQD1mpRHbhqdOEHrys5L8AZp+S9c7rnjjxE88wjEHgm5csRD9eNfjfrv/Ts/b
	mS6VXrUt38S1a8Ormp1koydvCsrqLY9UhaDxU2P/ngasCYgk7lTxk6zY9JO5PO+87nDQ
	eujUTeYvTB8z4EDf640lOKMpiiijxt7GXzHKU1iutl4YWW3xh1L/yl2X0y40ZyWDc3Fn
	dHcQ==
X-Gm-Message-State: APjAAAXANWhlk7n/E06BdNdwxsuTxcY0IZv6TfaybXKvgVqlzEXFmCEX
	sMb1c0XIZLECg6kwHfN27SUJDf7I
X-Google-Smtp-Source: APXvYqxtWI4TJG5kxchAqo8sRAj1Qe8HifKgVPzpO9oXBB+CPyoSSCaQ4372Ze5bxh5AxXiZrLQVng==
X-Received: by 2002:a17:90a:c78b:: with SMTP id
	gn11mr15953800pjb.97.1581264615633; 
	Sun, 09 Feb 2020 08:10:15 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	u126sm9408153pfu.182.2020.02.09.08.10.15
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:10:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun,  9 Feb 2020 08:09:43 -0800
Message-Id: <fcd61893a181051c7fb8953b978c21991d33a7bf.1581264380.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264380.git.akuster808@gmail.com>
References: <cover.1581264380.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [zeus 15/29] mc: Fix manpage date indeterminism
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
X-List-Received-Date: Sun, 09 Feb 2020 16:10:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The man page date can vary depending upon the host perl, e.g. in Russian
some versions print 'июня', others 'Июнь' or Polish 'czerwca' or 'czerwiec'.
Rather than depend upon perl-native to fix this, just remove the date from
the manpages.

(From OE-Core rev: 5553c20f9fa4f35bf711b6b9d5717dcf4bfefafa)

(From OE-Core rev: 3653fd41fbc28f70259a00bb0098ec8731526449)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-extended/mc/files/nomandate.patch | 21 +++++++++++++++++++
 meta/recipes-extended/mc/mc_4.8.23.bb         |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-extended/mc/files/nomandate.patch

diff --git a/meta/recipes-extended/mc/files/nomandate.patch b/meta/recipes-extended/mc/files/nomandate.patch
new file mode 100644
index 0000000000..48bd73b110
--- /dev/null
+++ b/meta/recipes-extended/mc/files/nomandate.patch
@@ -0,0 +1,21 @@
+The man page date can vary depending upon the host perl, e.g. in Russian
+some versions print 'июня', others 'Июнь' or Polish 'czerwca' or 'czerwiec'.
+Rather than depend upon perl-native to fix this, just remove the date from 
+the manpages.
+
+RP 2020/2/4
+
+Upstream-Status: Inappropriate [OE specficic reproducibility workaround]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: mc-4.8.23/doc/man/date-of-man-include.am
+===================================================================
+--- mc-4.8.23.orig/doc/man/date-of-man-include.am
++++ mc-4.8.23/doc/man/date-of-man-include.am
+@@ -1,5 +1,5 @@
+ SED_PARAMETERS = \
+-	-e "s/%DATE_OF_MAN_PAGE%/$${MAN_DATE}/g" \
++	-e "s/%DATE_OF_MAN_PAGE%//g" \
+ 	-e "s/%DISTR_VERSION%/@DISTR_VERSION@/g" \
+ 	-e "s{%prefix%{@prefix@{g" \
+ 	-e "s{%sysconfdir%{@sysconfdir@{g" \
diff --git a/meta/recipes-extended/mc/mc_4.8.23.bb b/meta/recipes-extended/mc/mc_4.8.23.bb
index 5667038a18..de76591d9b 100644
--- a/meta/recipes-extended/mc/mc_4.8.23.bb
+++ b/meta/recipes-extended/mc/mc_4.8.23.bb
@@ -9,6 +9,7 @@ RDEPENDS_${PN} = "ncurses-terminfo"
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://0001-mc-replace-perl-w-with-use-warnings.patch \
            file://0001-Add-option-to-control-configure-args.patch \
+           file://nomandate.patch \
            "
 SRC_URI[md5sum] = "152927ac29cf0e61d7d019f261bb7d89"
 SRC_URI[sha256sum] = "238c4552545dcf3065359bd50753abbb150c1b22ec5a36eaa02c82808293267d"
-- 
2.17.1


