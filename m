Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9514074C4F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 20:41:54 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id c203-v6so2689333oib.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 13:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5mu2waKivfOZwH9xWnI6WM+5WMslmHgrxMguNMFh4gA=;
	b=MQE6C4/m0X/rJOfarnwtzF/E9D5tmxQ1gRdg3tuJ3RQ/T++DalfEvpdrwt8uTmMBuF
	4go4FE2Gn68bGl//xHfOCs9lchzYRW1cGQcW8j0HGqnnv5fGISxH8KJu1zj+IGvxtQWn
	C+LURztp6ODmY8lB4S0bciD9MQtddv4XLIurA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5mu2waKivfOZwH9xWnI6WM+5WMslmHgrxMguNMFh4gA=;
	b=gofwMrCuUGXME6DD9xIHhE+aaQVods+JZEU5HJewdsxPRUiIP/U3+FcMyY4OPNI711
	QKTg/g+6J8Gi2jFDItbAeMPEKGRYy7Z2pAuN9MBIrIj8I+2zXHnWskik/tqQo5MsAlQ5
	57QQ/Zd9CVtVkwr8hjryhEDh2lZDpiCliqdiPi18DRUrlakE6tERk8q4xZ2sUuHPb7l+
	YTwAWB+HxPhe498DQ23aUPGQVQddvXUXsogqJxYy0edJR1xmknzXT3aFeoRV+k2EJ/2i
	RbKHiERBPjRE8hGTTswduK9jwuGh6YdqjeXMB8EPAJL/9bqZWSXFvpLNhYzEqInn7hfg
	b9BQ==
X-Gm-Message-State: ALKqPwei4KJsqlYKuywbT0hirdosSKt69lNmeL8UKqtQpB20XfNdp1Ov
	UuBkn1fTtRJksrIfiw1SieiVYkGUe2A=
X-Google-Smtp-Source: AB8JxZoEIC5j//n9uGSR5EYwXKX2btgQORXM8Nx0h46Sv3t5pzpKJnM213ltFCWcWykhnLAfY2H9RQ==
X-Received: by 2002:aca:5f0b:: with SMTP id
	t11-v6mr5005819oib.103.1527194515523; 
	Thu, 24 May 2018 13:41:55 -0700 (PDT)
Received: from aura.cortijodelrio.net
	(CableLink-187-161-191-185.PCs.InterCable.net. [187.161.191.185])
	by smtp.googlemail.com with ESMTPSA id
	p72-v6sm16600195oie.33.2018.05.24.13.41.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 13:41:54 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2018 15:39:34 -0500
Message-Id: <1527194374-2490-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ltp: bump to release 20180515
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
X-List-Received-Date: Thu, 24 May 2018 20:41:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patches are still fresh as the meadows.

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 meta/recipes-extended/ltp/{ltp_20180118.bb => ltp_20180515.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-extended/ltp/{ltp_20180118.bb => ltp_20180515.bb} (100%)

diff --git a/meta/recipes-extended/ltp/ltp_20180118.bb b/meta/recipes-extended/ltp/ltp_20180515.bb
similarity index 100%
rename from meta/recipes-extended/ltp/ltp_20180118.bb
rename to meta/recipes-extended/ltp/ltp_20180515.bb
-- 
2.7.4


