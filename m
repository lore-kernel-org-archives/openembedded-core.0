Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 811F374DA6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 May 2018 00:14:40 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id a22so4507187pfn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 17:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=21Ps+SPJ0/+LJh4UIt/AY9S2kYB49U5eugpfpW4byLM=;
	b=pFJQjEQCU99sVdh6Nqbzmg35ozip0RiH44S1qzRTVgzdnh/tGyhK8DkSvgNmSzC52E
	7QEyUIZup7YenViXnKZFM2DJ7i8XGbct6kP+8psv9VErfg8bu7SuvygJwYorfy0OB9jG
	MXTXNCqsTqJ882ahnD5fhZyX6kfy0TyXkhzOU+ZtnOG0XGBjR+4IBN5b5RSlXWvIY+Bg
	KMFfdz913eAv48o0TbQtFruRLwRzXU4DLqUeMihuwQXAvl7qgIjYtQWnjovNe7A1Jm6N
	C7nB+u19ZHI8dr72zKk1qgMk/ryGaw1dkxcFjUPbqbtFMkUGB/dOyG6v2XvIlTBlTvsH
	o7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=21Ps+SPJ0/+LJh4UIt/AY9S2kYB49U5eugpfpW4byLM=;
	b=Xo6Y520FSSBwDN50ur+qzdOh8m1R6mCIrNVwf6mnzZ/x0gjLQhWTm5WFy0bWjQSu2z
	TtG+1NvKKUWimEXkwy3tIpAuZEQc+12ODSIZE2ZD/7XzjL0kNAdAF2zSCElPqTPo5KFo
	RApuB5gvEihU8oSHgJQvSTP6Kk/K/l3UIVj0ZP7UvLevywwuUg4PIAhoCnabQxkl7L8x
	fnEI3AjALhaa8Qsc6rGJ2lh4VfBHzRP8bZl/aEIp+dnAXZPVzS/MwOf/4bWbkKhu9QR/
	HQfz9BG9bB04OE/akaPCMvnmL6tvR0KkQOoQegvH3Jz8KHDaYnc0KMqer/1NptxaNRYH
	a5hA==
X-Gm-Message-State: ALQs6tBMPt00ck9F5r0jNNGhkQNeelpsyxcRggbmwo9k/qcFlKrEeW1c
	OqMcFmAzuwU7opanvrKz4df/QQ==
X-Google-Smtp-Source: AB8JxZpqwOnHoY9R7DqVyy7+kzNBPK2AP7c5AtcfBZH/0RjY4WwH6EM/Ij705baMhduISmUrtpBImg==
X-Received: by 10.98.192.220 with SMTP id g89mr28682277pfk.223.1525479281314; 
	Fri, 04 May 2018 17:14:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	o88sm36468559pfa.29.2018.05.04.17.14.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 May 2018 17:14:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 17:14:10 -0700
Message-Id: <e72b073214fd21ef6d80c06d775d20c4ae89a392.1525478935.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525478935.git.raj.khem@gmail.com>
References: <cover.1525478935.git.raj.khem@gmail.com>
Subject: [PATCH 16/27] tcp-wrapper: Use external libnsl
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
X-List-Received-Date: Sat, 05 May 2018 00:14:40 -0000

We dropped in-tree obsoleted libnsl from glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index 3ece8c3012..0f50674653 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -8,6 +8,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://DISCLAIMER;md5=071bd69cb78b18888ea5e3da5c3127fa"
 PR ="r10"
 
+DEPENDS += "libnsl2"
 
 PACKAGES = "${PN}-dbg libwrap libwrap-doc libwrap-dev libwrap-staticdev ${PN} ${PN}-doc"
 FILES_libwrap = "${base_libdir}/lib*${SOLIBS}"
@@ -67,7 +68,6 @@ EXTRA_OEMAKE = "'CC=${CC}' \
                 'KILL_OPT=-DKILL_IP_OPTIONS' \
                 'UMASK=-DDAEMON_UMASK=022' \
                 'NETGROUP=${EXTRA_OEMAKE_NETGROUP}' \
-                'LIBS=-lnsl' \
                 'ARFLAGS=rv' \
                 'AUX_OBJ=weak_symbols.o' \
                 'TLI=' \
-- 
2.17.0


