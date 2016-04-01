Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f193.google.com (mail-ig0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7F44F6FF30
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 05:01:05 +0000 (UTC)
Received: by mail-ig0-f193.google.com with SMTP id mh10so1000209igb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 22:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=T9LGlNQw+cFGTX1aJcZWIv692Xk7Cua1RCQ5OSiI1Bs=;
	b=ZzLLIC+epEKfVGVo0z8PIm/aFz8yzGfxMqjZfrfPVTqCJ7rRekL170oIt2mYJzPcNZ
	aZnLDcJAJ42bhQHEvXrTRLNh4NRRW24DBvoLX483n/TZBotcKbVf5pyybqbe16jhVxgU
	UnEo6VvexYkMwxol6gM0r8n/6bkYju+sWbW96T4TRlml5syRSGrHhgHmxyhJ790jYpzS
	tDNSbqDXw6KWmMCUpYJcOexNcCnJsXM1zQDdt3TN0eCoNqGPhqYBmWs0/Xlm7JKTZ8RI
	2aJNoTVKjRtAB1pqu7PL8y5PdAAwyU76vUnSXrtiyeRtl3XUFBpsxwStNXHTC2rUU5os
	2oKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=T9LGlNQw+cFGTX1aJcZWIv692Xk7Cua1RCQ5OSiI1Bs=;
	b=PR7El7jKG1MnfMsfd7ZCZRWPdacleCdHaMBNIPmGK/Jx6U4ob/YJ3U6/7c+IWAli6H
	jZWIkn97/0dORFHDLHtgwO9xhhsqxjq99qjvgZCpOei5ZqTwSQg06oc0MYRa1qDVD7ww
	ADf/XBMNW6NkXXp3Fg6HS1mWgzjNjAeU6byfbLRrDxf8jvz2k1TLz+2wfWegXNG7hzQ6
	Tl1QT9amHPFAIfAXvsq8nKPSQynZIPie1sFBOYnnTY207M6Yl8F59O6irnRysVbgOcoS
	5ub0DMCLVP4FcvXk7z+cHcSM4IWfPsZfIwDcrSZFL0t+rcKRfUizDafHua/P8UhN11hM
	MtFg==
X-Gm-Message-State: AD7BkJK3AcZP4/fAUG3z1n6AO5Fs+O4dY3OjDgTSg2r+5KPBZkgjhyD3kpXaJs4VnY2R9w==
X-Received: by 10.50.137.66 with SMTP id qg2mr1192922igb.25.1459486865992;
	Thu, 31 Mar 2016 22:01:05 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id z8sm5150069igp.3.2016.03.31.22.01.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Mar 2016 22:01:04 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Mar 2016 22:00:57 -0700
Message-Id: <1459486859-14736-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] libassuan licensing updates
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
X-List-Received-Date: Fri, 01 Apr 2016 05:01:05 -0000

Andre McCurdy (2):
  libassuan: use package specific licensing
  default-distrovars.inc: remove libassuan from LGPLv2_WHITELIST_GPL-3.0

 meta/conf/distro/include/default-distrovars.inc   | 2 +-
 meta/recipes-support/libassuan/libassuan_2.4.2.bb | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

-- 
1.9.1


