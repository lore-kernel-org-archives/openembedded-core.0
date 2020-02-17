Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9B6C461520
	for <openembedded-core@openembedded.org>;
	Mon, 17 Feb 2020 16:01:08 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id x185so9110885pfc.5
	for <openembedded-core@openembedded.org>;
	Mon, 17 Feb 2020 08:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ajMAIS13O6knCfywDodZhICRdk0T72GtljSmVMwlGLY=;
	b=FlkXSeKPLbEhkRmfjJNQpVmZzbF+ZpYAqnbYKW84GqRNIuxa8Tamm8hdOZYqDzrqLW
	i6HBrGKJwGLDWUnVqHzk1BCEe+wlEkkCpEfOkF5atbZzGDOv76/nk0XIaK87cZZjYt0G
	huGq0f8HF8i6xP3rUzBcqt8LlNu+m46oYIr4e4gvDHH470dqzdvy9mdDFhB55ZSNuIjt
	Fcmuv7knyBBYbwstQwmQxFtUhUCMcAan+RwjXCt3BsuOW8qH5Jp0Bqruubvv1jA8r44B
	FDv3zC4k22I+Ybx7Et5X3BUQ4Qy6Rn/TRNvDYqa2UipTvaIIUam7r6X5j+KHBjBtDKXa
	zpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ajMAIS13O6knCfywDodZhICRdk0T72GtljSmVMwlGLY=;
	b=V2ucVN2gFvGPvERu6aLruwZoSAuQ4M8F30tJ9L2FcIy2Ny3/z/7N5T9R6DsKinGknn
	FFx7EIxF/aaKzDagiyJMj/3y7Lha9rDuFpmmt3vwVuBnhHchcwKnK4g3Hck+DSBZphuC
	ErLa4gL24xIfdCSgsLaFHSdOEKbHsxvQAXbzlnZm5TtP/MirDlM1Gwz2a7oVXgh1XquV
	BQt8u/RJurDPkfCmEPi2cLagtyBwfTJYONOvXSGz9DCO5+0YUq2cfyBsWG9dyZlKbKal
	qxjBLx0X4shxdFfaEiXJCJZhJtGU3h4hsDwgqubejoDV/X7NlGFToWe3s3B2D8YmT90E
	Qx0w==
X-Gm-Message-State: APjAAAXYblP1c+ychyqwIlpuLhLuW15g98rGMAH3lvU92sE0MWvckE5K
	mrfAK6W4/gcHlKLR+Gnu7I3KKMuB
X-Google-Smtp-Source: APXvYqxlazBRWccpVBFrnZ9dMWkvkpJKHNk+5JP2jSpgZaEgaRMuzus2NOe86DM8z59GxreaGOBZNQ==
X-Received: by 2002:a63:5f8e:: with SMTP id
	t136mr18021677pgb.411.1581955269369; 
	Mon, 17 Feb 2020 08:01:09 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:9144:9b3e:b52:fa29])
	by smtp.gmail.com with ESMTPSA id
	a22sm928041pfk.108.2020.02.17.08.01.08
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 08:01:08 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 17 Feb 2020 08:00:50 -0800
Message-Id: <b1433f396f32c78d6be5633653541ff6375d5220.1581955142.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581955142.git.akuster808@gmail.com>
References: <cover.1581955142.git.akuster808@gmail.com>
Subject: [warrior 12/14] linux-firmware: add PE back
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
X-List-Received-Date: Mon, 17 Feb 2020 16:01:08 -0000

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

Add PE (package epoch) from the previous version of the recipe to avoid
problems with package upgrade due to changed versioning scheme.

See:
http://lists.openembedded.org/pipermail/openembedded-core/2019-August/285633.html

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8b6ec55da696087c8ea7bacc042307ee652afd9e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb
index acaca955be..9afaad73f3 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb
@@ -190,6 +190,8 @@ NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
 NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
 NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
+PE = "1"
+
 SRCREV = "0731d06eadc7d9c52e58f354727101813b8da6ea"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git"
-- 
2.17.1


