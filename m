Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id DCA747F87C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 18:44:41 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id 6so17011355pgk.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 10:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ItYFXZfjP2BYJPYuGXr+be47eaUl/yKHSFOR39dUiCQ=;
	b=gcSnmOQ2t+oT8+KppUaH2nKzBe8Jh9KkwJ86qmFFfW4sDDH6dQASZSZlHJW6V5yrQX
	T6AAKMJZZgfUTU/jNvk/txvqH8TuONTBSi6E009lHUGcxZmSdM5eR9aUlXMKd9GcXFV9
	ZdXYXaFltvOk6ekYil7IXdOoTcm1kH7gbC92ySOhNlVrIzNbpe2MYy501a///T/bi80o
	+lz0c6Z4yrJHXC6IpHmpKK94JgalEtXExf2wFvZG4edG/Qtv4DFkSbDRpThl67Fl/eB8
	IjYOg1mwpLzWbtxD3bOK3a09GTZECqP1UdHeFT8fbt1sSv+SIgyr+qgrvnN0QOiWVnNh
	wyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ItYFXZfjP2BYJPYuGXr+be47eaUl/yKHSFOR39dUiCQ=;
	b=V8atEA2moygU4EkP7sW4yi313UWwRBkP8mCixEJXXq9O8mHLKL4y7sNyRdNb++RurD
	iTA+2026tXn3hMFli2no9eBqOqjceVlLV+IuSC0GsdUZcaXtKUzMhcM+28UKxiUMwpwO
	d8bJ6GPSIIp7urOwRygyYGYbu+TRFSFfE4eY2DKdd1VdHUYB3seqzKM23Rw90HsoHLVD
	CeYXttK7htw0C/JMitMb5CpjAL3EEDy0E8f3TeYkJE6MPPro+mS0HCCNtsvxXvHblEla
	57PBYGTzSMOR1cd2R9gl1Gl+iEUcgHiD19Ote89CzhCN6T4opEYLE8h9GVizY7EvdXT5
	k8SQ==
X-Gm-Message-State: APjAAAWoyF0forBjfv4a1z6Gas5QfH7gahS062hoWBDpkDuZ9lj9x8Hh
	8OQObYV/zuePhYKm6DrMwZEwD4p5RAY=
X-Google-Smtp-Source: APXvYqxq45cQdEAvLJJML7MfpHRiFXdHMGrFZPUOSXT0E2ypP7zDKnn2jwa8I4Pmf4wIsegiy83kYA==
X-Received: by 2002:a05:6a00:2ae:: with SMTP id
	q14mr67180992pfs.155.1577645082737; 
	Sun, 29 Dec 2019 10:44:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	bo19sm21257085pjb.25.2019.12.29.10.44.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 10:44:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Dec 2019 10:44:14 -0800
Message-Id: <20191229184415.19514-18-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191229184415.19514-1-raj.khem@gmail.com>
References: <20191229184415.19514-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 18/19] xkbcomp: Gcc 10 spits out extra warnings as errors
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
X-List-Received-Date: Sun, 29 Dec 2019 18:44:42 -0000
Content-Transfer-Encoding: 8bit

Its better for us to disable these extra warnings, upstream should fix
them correctly in code and we can re-enable it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/xorg-app/xkbcomp_1.4.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.2.bb b/meta/recipes-graphics/xorg-app/xkbcomp_1.4.2.bb
index eaf8eaaf74..ed1eed8662 100644
--- a/meta/recipes-graphics/xorg-app/xkbcomp_1.4.2.bb
+++ b/meta/recipes-graphics/xorg-app/xkbcomp_1.4.2.bb
@@ -13,5 +13,7 @@ DEPENDS += "libxkbfile"
 
 BBCLASSEXTEND = "native"
 
+EXTRA_OECONF += "--disable-selective-werror"
+
 SRC_URI[md5sum] = "12610df19df2af3797f2c130ee2bce97"
 SRC_URI[sha256sum] = "6dd8bcb9be7e85bd7294abe261b8c7b0539d2fc93e41b80fb8bd013767ce8424"
-- 
2.24.1


