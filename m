Return-Path: <jpuhlman@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id E42B861879
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 22:15:39 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 66so721816otd.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 14:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TJ1BMW6GHWgmr31IzETPx+3vx34u0R/fCcU/spTUDAc=;
	b=Zx6q40y9DqpIverrEL2ML5JepZ/JN7uxs3xzR+4op+xNCRAvbU905HsDkQAhZPNFPV
	7EsDb7/9clbekbj/DXM16RALJ7xIGLzSNIVxpsgUkfQ+Geg821nVuhpKgzCcUJ1VERwi
	XAL8nHhgfwh4D3F6WXcR6bPNyMYuCAiFK7p0yTh3/77nPuIufbIekR/Nc1tgj3/Cbv5H
	34vpt69pVAvOt2PJAUUPMhLzFCS2x7kcuCEcFwtVaPR5pse6ErkvtJjKHq2bx1vXTHAc
	BrM1F07o17Ujsw+QnVJ2aRjLLC2xyKsdOHoxz5vxwj0dUfOlxpktSlQ9JsEQwKtHVOPP
	GZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=TJ1BMW6GHWgmr31IzETPx+3vx34u0R/fCcU/spTUDAc=;
	b=KfBi41Mg6tMed6BWy3JpY37aDr40HIoW4WpiuV7A7aJCWIRfPMZvg7MwAufJNaWq3a
	oisJcyUjP+sOA6KrfKhjnEEv5Q/sAz4UMDqOCrUZyBwPbODwj+Zkd+rxZVVGYYbEBnMv
	SnnKdXjCcSy4fr3/d+47lBwizK9JnWi7OI4Rl5sLMekyu8KNFUpnZHfH6WlXBH7aZNlT
	giwy34jHBu36q3KCVh+Jdk2dMRLEDM1+a5HCPBmREPl9mt/AiqIPl4n1FA4qM2caYMc9
	aFjqRNfJy+E1pCUks+U8QFcOK8HDyR0KuPBXMOpyHfUwTVp/bfUon9iv3edngCQnUqub
	3jLw==
X-Gm-Message-State: APjAAAXGQW8GWFYaDYp3Xn6GcV/r2ni/A0JDwrXFlnRAgltmEu60eMX4
	7VzpQBrq0mTo4XcfukmfX2VF/tLs
X-Google-Smtp-Source: APXvYqyQcpJyqNQGRRsHx1cKVryTGO5TmrJ/7ZJ1faq7gPyR9CDFneIBPxEfCLWgn5xt/56OwnS5Pg==
X-Received: by 2002:a9d:7342:: with SMTP id l2mr902112otk.98.1582841740546;
	Thu, 27 Feb 2020 14:15:40 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id 17sm2424726oty.48.2020.02.27.14.15.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 14:15:39 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id AC73C2A05A0; Thu, 27 Feb 2020 14:15:38 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2020 14:15:33 -0800
Message-Id: <20200227221535.8622-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] sysvinit: remove logsave.8
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
X-List-Received-Date: Thu, 27 Feb 2020 22:15:40 -0000
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

logsave is a duplicate from e2fsprogs, which was already removed,
but the man page remained which is also a duplicate. However it
does not get modifed on install so it conflicts with the e2fsprogs
version.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-core/sysvinit/sysvinit_2.96.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.96.bb b/meta/recipes-core/sysvinit/sysvinit_2.96.bb
index 63c10848b4..d2b85ed9c0 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.96.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.96.bb
@@ -110,4 +110,5 @@ do_install () {
 
         # Already provided by e2fsprogs; sysvinit's version is a copy from there
         rm ${D}${base_sbindir}/logsave
+        rm ${D}${mandir}/man8/logsave.8
 }
-- 
2.20.1


