Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 440D67CD98
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 18:56:12 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a188so6899578wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2019 10:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8iR9skYR7dHQCWNXkls8iUc/ezht+bruJwmDiv/HcnQ=;
	b=Ex7UFdh3X+8UT7oTxJjn6AjEdAUV9+456hzdk4GulnfBH+6b0EpPK3vhzkZevdEth8
	UnivRfho7oNa6mRWniTQ1pdBChPl+URa8XInEApxNrxh3j/Wvj1xohA/MvqjkjwMV8nC
	6fnVA8EytTGD97kqs93QiyCnXiku7FxfrsS4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8iR9skYR7dHQCWNXkls8iUc/ezht+bruJwmDiv/HcnQ=;
	b=qsEhdu1GkA0pWshid3HiGyOjWPe+f7F1KPhGFSguiuGZgZyPA4I0DIXLBKPEDZEP5D
	JcN0cPSbyYZ46nKDcpFlCV7GfTc5h1xkOFPex4gK0Z+WT4XvATPSAYJTB3j0eXswo1br
	xRTKzjJ9hjV31DPNhV9ZSxuo3S6nWYkeP3BGoziLDMDWi4DTnj5WvtmfTYzdmmdRtw0z
	DGLoRBq+OXbfIHtIkgybcQ9X7I29jJgFQK512R2PxMb6b20gxe2x9+HEzT1fkG+ysIm8
	UEzjo9VzcXybU6AWQzjA4xpjBahE7iTvWVBe5zuQ2pk3r5PWBR+wVD6Y5bVa1s26w+74
	Ytkw==
X-Gm-Message-State: APjAAAXx3jVdsLCU8mC+oCA5qIlYXVA88BlPOSjbdsUT1Rqp9li78SNz
	t1BnNXcK7LJgZccWPpgLL/urrSyw4Zw=
X-Google-Smtp-Source: APXvYqzVRTWkaiwUn6C/yB/DWdrZmxJPqj9zhbrFtc59qDCh3s+dD+DAQ2UJtX/LknxN1U11ZRpmWQ==
X-Received: by 2002:a7b:c38d:: with SMTP id s13mr3143395wmj.151.1551898572658; 
	Wed, 06 Mar 2019 10:56:12 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d206sm4573059wmc.11.2019.03.06.10.56.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Mar 2019 10:56:12 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Mar 2019 18:56:09 +0000
Message-Id: <20190306185609.12327-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] README: Rename to README.OE-Core so its clear where its from/belongs/is about
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
X-List-Received-Date: Wed, 06 Mar 2019 18:56:12 -0000
Content-Transfer-Encoding: 8bit

This means we can add it to poky and reduce delta/confusion between the
contents.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 README => README.OE-Core | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename README => README.OE-Core (100%)

diff --git a/README b/README.OE-Core
similarity index 100%
rename from README
rename to README.OE-Core
-- 
2.20.1


