Return-Path: <danismostlikely@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 29C0B731D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 20:47:07 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id a20so23601505pag.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 12:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dHFs8DRWEpqcR7E7ahxT/tfAnXMmOkLZa0oi7cq41k4=;
	b=jhqUmTJMBC89FCaV5eAzyvCzXbreEZr7I3OZ72C2SA0gmL6Sjki1mwUDWvVytldmo0
	UUruDuDg5bJA3LsiuSa9gGzR5YeWtVAfEjEmJU9C4HbdW5+wed3lEG0MNeMdy1a5RXs9
	VgsQngONKk9bFmVNVJJ2pwF+GxoAnj1stXJTahD5JCX9vOEMFqtQn39/L9waW/b6pRDJ
	WJ+riTXJhP0/vscjagLDRHPTaXDr5afm2/y1kr3GbNbYJuNWuapnS1rGv+0W1XnLJigK
	aOPn+k9mkU/8elHEnDqn5Lh37j5hhoq59LX8VH8R/wZGg4F9nnkdO0exl9EzvwuCjJL7
	nbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dHFs8DRWEpqcR7E7ahxT/tfAnXMmOkLZa0oi7cq41k4=;
	b=ltwQRcVuecLqPLz0cShPCBRVA/A3uWyaLTwas1suDlm/9yGrl3jdHfedOYQkdyR9Fa
	/5rcJ7KtuvGTGXldXv2h4XW/XJgbgdm/Eh2POHnWQrCFlQ3pLs3p6qjzZzVgLIdKXj3z
	DLz7FN5VdariBXTheZl/o9dw372YmCOfjdxcdMkjTbfrmGmxEg7+z9xuRPPwI5mM9TRc
	fj0b1VvkVzpXvuVEijRGMPCYqZ70JF6fuNkMB+HWRJIg1LIR3p8bOJyAEym0P8rlS2H8
	iYaLLssxOiNXVwM1Xv4TbcrVYXUIFhcENPNOkjjiEHFgUVb003cWKAgsEMGAU9s105xo
	lUpw==
X-Gm-Message-State: ALoCoQn//zl09vdttIlrLpiUMH2Cff1BNolx74k1y7E1C8UsmMZncKGFuW6qCvDJBhGraMaw9Z6wt11WyAJx5Ww2H3p0txO0WA==
X-Received: by 10.67.2.10 with SMTP id bk10mr9058478pad.26.1452804428789;
	Thu, 14 Jan 2016 12:47:08 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74]) by smtp.gmail.com with ESMTPSA id
	f21sm11290704pfd.6.2016.01.14.12.47.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Jan 2016 12:47:08 -0800 (PST)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 14:47:03 -0600
Message-Id: <1452804424-17632-2-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1452804424-17632-1-git-send-email-danismostlikely@gmail.com>
References: <1452804424-17632-1-git-send-email-danismostlikely@gmail.com>
Subject: [PATCH 1/2] bitbake.conf: make localedir nonarch
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
X-List-Received-Date: Thu, 14 Jan 2016 20:47:08 -0000

From: Daniel McGregor <daniel.mcgregor@vecima.com>

systemd and others expect locales to be in nonarch_libdir, regardless
of the base library directory.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2fe6b24..47f8a43 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -44,7 +44,7 @@ export libdir = "${exec_prefix}/${baselib}"
 export libexecdir = "${libdir}/${BPN}"
 export includedir = "${exec_prefix}/include"
 export oldincludedir = "${exec_prefix}/include"
-localedir = "${libdir}/locale"
+localedir = "${nonarch_libdir}/locale"
 
 # Linkage between native/cross/nativesdk layouts
 base_bindir_native = "/bin"
-- 
2.7.0


