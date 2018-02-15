Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0CA71601A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 12:49:19 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x21so645368wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Feb 2018 04:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Fy1QexHW7FNE5yxs9ybSiwY2uPGxLyZQOlmUPjpFmT8=;
	b=IgRCBnPL7EBzVp7nz7JNAGlbwTGzlGpjemNfvy782S1AaKX/suoVH7o9DUUiZKYP2o
	H5YK1sfylrh6T8sihKdpW1ucIs+2ckQrDMxaxtl+V8sXcu/sn5lHUPCOFZ3RnHcPvC3+
	61ytGOdskPvaglvUxfMye4PpX08qo+MZugK1a2DXpS4vk7G14bHBepz6qCxU309OL2Mx
	N7pzJ8c+MsvlgXXIBCyrSHBMb0KeZrMqjhQ8jxqxE663ih8A6jghGaZ1dshoZQeEi2s2
	/tixU4ul3CQziIk6t4sYwNE+5On3cYtzkiZqtCVIeGrKVZZLC7oymwD3jhgiGh7jf8hG
	8h4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Fy1QexHW7FNE5yxs9ybSiwY2uPGxLyZQOlmUPjpFmT8=;
	b=eY/ZoIGa2k6LNXOf+iAFg8jlM6+mDgebplpn1mRaxjaE5Y7xTctNhU4H+NjW4apYs+
	bywpi+c7C1Jin4/qH9MJMEsYEnjNfNzmWr12gDrRIQAUcuVRpBnsFjMa8BfQ2fmCwEPg
	qTeqyxg1/CgdORgNPN3WKH+IE9eb2vqqpYxENvl1xTZkl5JxLDSy4pIsXMImv+j1HzYC
	h3z4Zt61eFIWignZbbLT88UjHO+q7CFXgmwofmzo/SJMEn0Sr0g6BpgDheaNr52zfePp
	xSbVq8ZMiNzNVP8tz++epS9MRKCPC7RkH3v1l4Z92v3AN/0agVb8MNhUTfHoeiUiflVz
	RpMw==
X-Gm-Message-State: APf1xPDPWkpFw4Ak0H5a5iITg1QnhqIl7U07twae4HpKdW9oE55UovZ0
	CdNqJwMFUIescksgoHr72hgklw==
X-Google-Smtp-Source: AH8x225VFN/0flk0AgsN3AZvmqr0ie+cK8XNBhPYT/oCmv8uIK0OQxn/5QBMqj1Jzl/cL3uTcYljKw==
X-Received: by 10.80.180.210 with SMTP id x18mr3224991edd.126.1518698960814;
	Thu, 15 Feb 2018 04:49:20 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.206.246]) by smtp.gmail.com with ESMTPSA id
	e29sm10782722edj.14.2018.02.15.04.49.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 15 Feb 2018 04:49:20 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Feb 2018 13:49:13 +0100
Message-Id: <1518698953-23437-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] license.bbclass: set do_bootimg recrdeptask on do_populate_lic
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
X-List-Received-Date: Thu, 15 Feb 2018 12:49:20 -0000

From: Ming Liu <liu.ming50@gmail.com>

This is needed since the license_deployed_manifest task is referring
the deployed licenses of the depends of do_bootimg task.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/license.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index d353110..10d2279 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -679,6 +679,7 @@ do_rootfs[recrdeptask] += "do_populate_lic"
 
 IMAGE_POSTPROCESS_COMMAND_prepend = "write_deploy_manifest; "
 do_image[recrdeptask] += "do_populate_lic"
+do_bootimg[recrdeptask] += "do_populate_lic"
 
 python do_populate_lic_setscene () {
     sstate_setscene(d)
-- 
2.7.4


