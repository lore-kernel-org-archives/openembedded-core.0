Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id B6FB7731C1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:10 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id n128so142172863pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=b0PW1yl2CbfVlh3GMtPo90feGZ2FwMt881+Vx/Ff3VM=;
	b=zKCvrQ7gwORl1gWbf+I+RDG78xkKCHI3OAVfXtbpGN9qxbVxeUYZD6KEXovIJ66A2i
	GizcuI52vDLqg8iHv3X8kXfSUheM/SuKhBrwRsPwGjZzPGm+B0YIYQaRSGnNMxUNicP7
	evj7e+2OmEztZEZCK6X6Td4m39DasoBFFwsS0QOt54b3UbKHXNffF5RUGUk/UhD701tQ
	JMtGWsmTtpgV8CStncqeiGk8ZCUQlprSy72zIaRKWWgX/poGYmn16a5+Ey0wvKXLspEW
	D20wPcHAaJMAa7lDNMx4Yd3YltBKVtOy3JlcbiRIhJqtVDL2x5LPVYR5qjWsq8k6WWAa
	nvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=b0PW1yl2CbfVlh3GMtPo90feGZ2FwMt881+Vx/Ff3VM=;
	b=HV7LsyrLPFn/4+LGt+ExzKB/bnxE4SqIct9YzfCD7z+jIhxszh44MWZ/MrLGDpvMfd
	kwV6HtvKxUiJaZVXoGstYeUMFiLzFmaBlfddMiDGdQdon6GMtHUNFy7rFxcHCn8PMhqz
	u0Usk8uE+6plapJ1iz9PYoZn5TkCbwdUG238oh8lhkpH2C57XP3HvtAH9T9ZsqBlVwAx
	o4ZvVqIwmHtgkzhYpUIdNnu8qzZmUIdV5T2j518pRpaK7QndnzXK3+Ajh9U50KxlDlTy
	8oKWKiE5DMIoaFDCGZC13TehfJUDlKYDBu6KtKcdhgXNcQJoeDxVia1bHlpVih0b4csF
	f3aQ==
X-Gm-Message-State: AG10YOS10Bu0Kh75Sc+FEH63pyjb1qgKoyQeG7cY+/YTmw/8w0ykZbFYOH6UFMLulG//EA==
X-Received: by 10.98.14.69 with SMTP id w66mr8129853pfi.144.1453030631187;
	Sun, 17 Jan 2016 03:37:11 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:35:45 -0800
Message-Id: <9f76a0c307f55269479a00e5c92c8c2a0395f953.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 12/73] gnutls: Link with libargp on musl and depend on argp-standalone
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:11 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/gnutls/gnutls.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index c1ec120..5bcfc9c 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -2,6 +2,7 @@ SUMMARY = "GNU Transport Layer Security Library"
 HOMEPAGE = "http://www.gnu.org/software/gnutls/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
 DEPENDS = "nettle libidn"
+DEPENDS_append_libc-musl = " argp-standalone "
 
 LICENSE = "GPLv3+ & LGPLv2.1+"
 LICENSE_${PN} = "LGPLv2.1+"
@@ -28,6 +29,7 @@ EXTRA_OECONF="--disable-rpath \
               --without-p11-kit \
               --enable-openssl-compatibility \
               "
+LDFLAGS_append_libc-musl = " -largp "
 
 do_configure_prepend() {
 	for dir in . lib; do
-- 
2.7.0


