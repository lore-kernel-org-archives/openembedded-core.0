Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id BE98F7CF7D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2019 00:11:06 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id j13so6877370wmh.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 17:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=J/psLlMV5l/YTAqG9Y1Rz+k2c8hT1WHV+9OjdiXTJz0=;
	b=tFtynWmS52MZdbuBb1fF51BkAutad9LSnVvKEAyOm1dza7xbNmH2r/TxN7jpI9PXEH
	0dQ7KJb+yj7vvRLbmbE9R3UqtIMsAlpqptZ7vip82kyzFBJXQmbZT3PfwttiUe8YKiIH
	pFI7cvSbIH+2qpTkdVzAOOpXDrzJ5Is4sGZE94N+6Y5iRQCb8rQ9E7TC0FT3HuSWnvnC
	l8iLME4iWF/ldMQJ5JBMe8M7zPye78ofbzKuW4Xggnh81iozc9ZHdF0MXl0JZ3M5+lGp
	/2/uBn8T+obT4oDATSXRiuf0qmKY0QVb3E/7/XlkMw1zMEjzn9ZBpktGp0MWHzDl/lDj
	kp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=J/psLlMV5l/YTAqG9Y1Rz+k2c8hT1WHV+9OjdiXTJz0=;
	b=Ec9nDisaYCuk12q6fQ64qLo5KBBBFpSk/y6E6mBmdNiolniYv7CMfOwMiO+kxk1PlE
	/1UL69JTru/JvD5TTnD8QnjJ+A5mhc6+J4rCiWfT0Da7QgUgQWKOaf9WDxBJCfSsUg2n
	Xfp6aBO2ywvN3uSKXXtU5YDZu2xUKoeH8IQgqlnB4/rskZMYT+Z704PppN6OQx2g5kE3
	KVYYJOnOdpCr1Mz+jo/TDTssEqHd427TzR2qEWkL3ke5zWVu3I0mmCrBva/nP3VprVod
	jfUjJ0g61eabDxozlxl1L7bYgO4HODZnh0BXwvWpiN060McUEhBdiXyZbyfoeCm58Xmk
	39Jw==
X-Gm-Message-State: APjAAAUbEqeFr+okM+UissGUQfCZ+7nV1n70qpQ6eUg22fLjhg9ZSztA
	PG8tPJZC3tTkP00PLpmP61GMN7JZiGY=
X-Google-Smtp-Source: APXvYqyYLh/PFp3neOa1IoYpF6+kNvnQb/WUAZbNeK9brogNBnSMdUE+IWUXy7OjE7Bkd6Q02RREWw==
X-Received: by 2002:a1c:cb08:: with SMTP id b8mr1099292wmg.59.1556151066972;
	Wed, 24 Apr 2019 17:11:06 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F06D0346D2B854BA6962495.dip0.t-ipconnect.de.
	[2003:f0:7f06:d034:6d2b:854b:a696:2495])
	by smtp.gmail.com with ESMTPSA id
	u6sm37737680wrg.72.2019.04.24.17.11.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 24 Apr 2019 17:11:06 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2019 02:10:53 +0200
Message-Id: <20190425001054.32220-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 0/1] vte: move shell auto scripts into seperate package
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
X-List-Received-Date: Thu, 25 Apr 2019 00:11:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Follow-up for vte upgrade to 0.56.1 sent out recently.

Andreas Müller (1):
  vte: move shell auto scripts into seperate package

 meta/recipes-support/vte/vte_0.56.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.20.1


